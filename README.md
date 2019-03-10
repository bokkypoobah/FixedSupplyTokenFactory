<kbd><img src="images/PrincessLeiaPeachExpelsARainbowBigBang-FixedSupplyTokenFactory.png" /></kbd>

<br />

<hr />

# BokkyPooBah's Fixed Supply Token 👊 + Factory
Fixed Supply ERC20 Token Contract And Factory

<br />

## Factory Deployment Address

BokkyPooBahsFixedSupplyTokenFactory has been deployed to the same address `0xfAEcE565D445e98Ea024f02FF06607B4654eEb56` on the following networks:

* Mainnet [0xfAEcE565D445e98Ea024f02FF06607B4654eEb56](https://etherscan.io/address/0xfAEcE565D445e98Ea024f02FF06607B4654eEb56)
* Ropsten [0xfAEcE565D445e98Ea024f02FF06607B4654eEb56](https://ropsten.etherscan.io/address/0xfAEcE565D445e98Ea024f02FF06607B4654eEb56)
* Kovan [0xfAEcE565D445e98Ea024f02FF06607B4654eEb56](https://kovan.etherscan.io/address/0xfAEcE565D445e98Ea024f02FF06607B4654eEb56)
* Rinkeby [0xfAEcE565D445e98Ea024f02FF06607B4654eEb56](https://rinkeby.etherscan.io/address/0xfAEcE565D445e98Ea024f02FF06607B4654eEb56) (Could not verify source for FixedSupplyToken)
* Görli [0xfAEcE565D445e98Ea024f02FF06607B4654eEb56](https://goerli.etherscan.io/address/0xfAEcE565D445e98Ea024f02FF06607B4654eEb56)

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

[Fixed Supply Token 👊 v1.00](https://etherscan.io/token/0xbd2ea74a74820c9b5750e40c2851bed7136292ed#balances) is an example token:

<kbd><img src="images/EtherScan-FixedSupplyToken.png" /></kbd>

<br />

<br />

Enjoy!

(c) BokkyPooBah / Bok Consulting Pty Ltd - Mar 11 2019. The MIT Licence.
