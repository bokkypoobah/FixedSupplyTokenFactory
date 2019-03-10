<kbd><img src="images/PrincessLeiaPeachExpelsARainbowBigBang-FixedSupplyTokenFactory.png" /></kbd>

<br />

<hr />

# BokkyPooBah's Fixed Supply Token 👊 Factory
Fixed Supply ERC20 Token Contract And Factory

<br />

<hr />

## Table Of Contents

* [History](#history)
* [Factory Deployment Address](#factory-deployment-address)
* [Factory Functions](#factory-functions)
  * [deployTokenContract](#deployTokenContract)
* [Fixed Supply Token 👊](#fixed-supply-token-)
  * [Source Code](#source-code)

<br />

<hr />

## History

Version | Date         | Notes
:------ |:------------ |:---------------------------------------
v1.00   | Mar 11 2019  | First version deployed to mainnet, Ropsten, Kovan, Rinkeby and Görli


<br />

<hr />

## Factory Deployment Address

[contracts/BokkyPooBahsFixedSupplyTokenFactory.sol](https://github.com/bokkypoobah/FixedSupplyTokenFactory/blob/3467f170b149465438c72a154c2b1b0771aa5a3e/contracts/BokkyPooBahsFixedSupplyTokenFactory.sol) has been deployed to the same address `0xfAEcE565D445e98Ea024f02FF06607B4654eEb56` on the following networks:

* Mainnet [0xfAEcE565D445e98Ea024f02FF06607B4654eEb56](https://etherscan.io/address/0xfAEcE565D445e98Ea024f02FF06607B4654eEb56#code)
* Ropsten [0xfAEcE565D445e98Ea024f02FF06607B4654eEb56](https://ropsten.etherscan.io/address/0xfAEcE565D445e98Ea024f02FF06607B4654eEb56#code)
* Kovan [0xfAEcE565D445e98Ea024f02FF06607B4654eEb56](https://kovan.etherscan.io/address/0xfAEcE565D445e98Ea024f02FF06607B4654eEb56#code)
* Rinkeby [0xfAEcE565D445e98Ea024f02FF06607B4654eEb56](https://rinkeby.etherscan.io/address/0xfAEcE565D445e98Ea024f02FF06607B4654eEb56#code) (Source validation for FixedSupplyToken unsuccessful)
* Görli [0xfAEcE565D445e98Ea024f02FF06607B4654eEb56](https://goerli.etherscan.io/address/0xfAEcE565D445e98Ea024f02FF06607B4654eEb56#code)

<br />

<hr />

## Factory Functions

### deployTokenContract

```javascript
function deployTokenContract(string memory symbol, string memory name, uint8 decimals, uint totalSupply) public payable returns (address token);
```

Deploy a new token contract. The account executing this function will be assigned as the owner of the new token contract. The entire `totalSupply` is minted for the token contract owner.

A fee in ethers may also be payable for the successful execution of this function. See [minimumFee](#minimumFee).

#### Parameters

* `string symbol` - Symbol, e.g., 'MYT'
* `string name` - Token contract name, e.g., 'My Token Contract'
* `uint decimals` - Decimal places, between 0 and 27. Commonly 18
* `uint totalSupply` - The number of tokens that will be minted to the token contract owner's account

#### Returns

* `address` - Address of the new token contract

#### Events

The following event is emitted on successful deployment of the new token contract

```javascript
event TokenDeployed(address indexed owner, address indexed token, string symbol, string name, uint8 decimals, uint totalSupply);
```

#### Example

```javascript
address newTokenContract = factory.deployTokenContract("MYT", "My Token", 18, "1000000000000000000000000");
```

Deploys a new token contract with 1,000,000.000000000000000000 MYT tokens minted to the transaction sending account.

<br />

## Fixed Supply Token 👊

Following is the screenshot of a newly deployed [Fixed Supply Token 👊 v1.00](https://etherscan.io/token/0xbd2ea74a74820c9b5750e40c2851bed7136292ed#balances):

<kbd><img src="images/EtherScan-FixedSupplyToken.png" /></kbd>

<br />

<hr />

### Source Code

**FixedSupplyToken** source code, from [contracts/BokkyPooBahsFixedSupplyTokenFactory.sol](https://github.com/bokkypoobah/FixedSupplyTokenFactory/blob/3467f170b149465438c72a154c2b1b0771aa5a3e/contracts/BokkyPooBahsFixedSupplyTokenFactory.sol):

```javascript
pragma solidity ^0.5.4;

// ----------------------------------------------------------------------------
// BokkyPooBah's Fixed Supply Token 👊 + Factory v1.00
//
// A factory to convieniently deploy your own source verified fixed supply
// token contracts
//
// Factory deployment address: 0xfAEcE565D445e98Ea024f02FF06607B4654eEb56
//
// https://github.com/bokkypoobah/FixedSupplyTokenFactory
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
// FixedSupplyToken 👊 = ERC20 + symbol + name + decimals + approveAndCall
// ----------------------------------------------------------------------------
contract FixedSupplyToken is TokenInterface, Owned {
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
    function recoverTokens(address token, uint tokens) public onlyOwner {
        if (token == address(0)) {
            address(uint160(owner)).transfer((tokens == 0 ? address(this).balance : tokens));
        } else {
            ERC20Interface(token).transfer(owner, tokens == 0 ? ERC20Interface(token).balanceOf(address(this)) : tokens);
        }
    }
    function () external payable {
        revert();
    }
}
```

<br />

### Application Binary Interface

```javascript
[{"constant":false,"inputs":[{"name":"token","type":"address"},{"name":"tokens","type":"uint256"}],"name":"recoverTokens","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"spender","type":"address"},{"name":"tokens","type":"uint256"}],"name":"approve","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"from","type":"address"},{"name":"to","type":"address"},{"name":"tokens","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"tokenOwner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"acceptOwnership","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"to","type":"address"},{"name":"tokens","type":"uint256"}],"name":"transfer","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"spender","type":"address"},{"name":"tokens","type":"uint256"},{"name":"data","type":"bytes"}],"name":"approveAndCall","outputs":[{"name":"success","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"newOwner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"tokenOwner","type":"address"},{"name":"spender","type":"address"}],"name":"allowance","outputs":[{"name":"remaining","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"tokenOwner","type":"address"},{"name":"symbol","type":"string"},{"name":"name","type":"string"},{"name":"decimals","type":"uint8"},{"name":"fixedSupply","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"payable":true,"stateMutability":"payable","type":"fallback"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"address"},{"indexed":true,"name":"_to","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"tokens","type":"uint256"}],"name":"Transfer","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"tokenOwner","type":"address"},{"indexed":true,"name":"spender","type":"address"},{"indexed":false,"name":"tokens","type":"uint256"}],"name":"Approval","type":"event"}]
```

<br />

<br />

Enjoy!

(c) BokkyPooBah / Bok Consulting Pty Ltd - Mar 11 2019. The MIT Licence.
