pragma solidity ^0.5.0;

// ----------------------------------------------------------------------------
// BokkyPooBah's Fixed Supply Token + Factory 💪 v1.00
//
// Enjoy. (c) BokkyPooBah / Bok Consulting Pty Ltd 2019. The MIT Licence.
// ----------------------------------------------------------------------------


// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
}


// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor(address _owner) public {
        owner = _owner;
    }
    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}


// ----------------------------------------------------------------------------
// ApproveAndCall Fallback
// ----------------------------------------------------------------------------
contract ApproveAndCallFallback {
    function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;
}


// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
}


// ----------------------------------------------------------------------------
// Token Interface = ERC20 + symbol + name + decimals + approveAndCall
// ----------------------------------------------------------------------------
contract TokenInterface is ERC20Interface {
    function symbol() public view returns (string memory);
    function name() public view returns (string memory);
    function decimals() public view returns (uint8);
    function approveAndCall(address spender, uint tokens, bytes memory data) public returns (bool success);
}


// ----------------------------------------------------------------------------
// BokkyPooBahsFixedSupplyToken = ERC20 + symbol + name + decimals +
//   approveAndCall
// ----------------------------------------------------------------------------
contract BokkyPooBahsFixedSupplyToken is TokenInterface, Owned {
    using SafeMath for uint;

    string _symbol;
    string  _name;
    uint8 _decimals;
    uint _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    constructor(address tokenOwner, string memory symbol, string memory name, uint8 decimals, uint fixedSupply) public Owned(tokenOwner) {
        _symbol = symbol;
        _name = name;
        _decimals = decimals;
        _totalSupply = fixedSupply;
        balances[tokenOwner] = _totalSupply;
        emit Transfer(address(0), tokenOwner, _totalSupply);
    }
    function symbol() public view returns (string memory) {
        return _symbol;
    }
    function name() public view returns (string memory) {
        return _name;
    }
    function decimals() public view returns (uint8) {
        return _decimals;
    }
    function totalSupply() public view returns (uint) {
        return _totalSupply.sub(balances[address(0)]);
    }
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
    function approveAndCall(address spender, uint tokens, bytes memory data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallback(spender).receiveApproval(msg.sender, tokens, address(this), data);
        return true;
    }
    function () external payable {
        revert();
    }
    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }
}


// ----------------------------------------------------------------------------
// BokkyPooBah's Fixed Supply Token Factory
//
// Execute `deployBokkyPooBahsFixedSupplyTokenContract(...)` with the following
// parameters to deploy your very own BokkyPooBahsFixedSupplyToken contract:
//   symbol         symbol
//   name           name
//   decimals       number of decimal places for the token contract
//   totalSupply    the fixed token total supply
//
// For example, deploying a BokkyPooBahsFixedSupplyToken contract with a
// `totalSupply` of 1,000.000000000000000000 tokens:
//   symbol         "ME"
//   name           "My Token"
//   decimals       18
//   initialSupply  10000000000000000000000 = 1,000.000000000000000000 tokens
//
// The FixedSupplyTokenListing() event is logged with the following
// parameters:
//   owner          the account that execute this transaction
//   tokenAddress   the newly deployed FixedSupplyToken address
//   symbol         symbol
//   name           name
//   decimals       number of decimal places for the token contract
//   totalSupply    the fixed token total supply
// ----------------------------------------------------------------------------
contract BokkyPooBahsFixedSupplyTokenFactory is Owned {
    using SafeMath for uint;

    address public newContractAddress;
    mapping(address => bool) public isChild;
    address[] public deployedContracts;
    uint public deploymentFee = 0.1 ether;

    event TokenContractDeployed(address indexed ownerAddress, address indexed tokenAddress, string symbol, string name, uint8 decimals, uint totalSupply);
    event DeploymentFeeUpdated(uint oldDeploymentFee, uint newDeploymentFee);
    event ContractDeprecated(address _newContractAddress);

    constructor() public Owned(msg.sender) {
    }
    function numberOfDeployedContracts() public view returns (uint) {
        return deployedContracts.length;
    }
    function setFeePerDeployment(uint _deploymentFee) public onlyOwner {
        emit DeploymentFeeUpdated(deploymentFee, _deploymentFee);
        deploymentFee = _deploymentFee;
    }
    function deprecateContract(address _newContractAddress) public onlyOwner {
        require(newContractAddress == address(0));
        emit ContractDeprecated(newContractAddress);
        newContractAddress = _newContractAddress;
    }
    function deployTokenContract(string memory symbol, string memory name, uint8 decimals, uint totalSupply) public payable returns (address tokenAddress) {
        require(msg.value >= deploymentFee);
        tokenAddress = address(new BokkyPooBahsFixedSupplyToken(msg.sender, symbol, name, decimals, totalSupply));
        isChild[tokenAddress] = true;
        deployedContracts.push(tokenAddress);
        uint refund = msg.value.sub(deploymentFee);
        if (refund > 0) {
            msg.sender.transfer(refund);
        }
        emit TokenContractDeployed(msg.sender, tokenAddress, symbol, name, decimals, totalSupply);
    }
    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }
    function () external payable {
        revert();
    }
    // TODO Testing
    function testIt() public payable returns (address tokenAddress) {
        return deployTokenContract("ME", "MyToken", 18, 10**24);
    }
}
