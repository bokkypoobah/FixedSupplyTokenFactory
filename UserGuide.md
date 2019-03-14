<kbd><img src="images/PrincessLeiaPeachExpelsARainbowBigBang-FixedSupplyTokenFactory.png" /></kbd>


<br />

<hr />

# BokkyPooBah's Fixed Supply Token 👊 Factory - User's Guide

Or how to deploy your own FixedSupplyToken token contract in less than 3 minutes.

This guide will assume that you already have MetaMask installed in your browser, and you have some ethers (ETH) in your MetaMask account on your desired network. We will use MyCrypto to interact with the factory smart contract, and use MetaMask as the signing wallet.

<br />

# Testnet Ether Faucets

The Ropsten, Kovan, Rinkeby and Görli testnets have faucets where you can request for some testnet ETH.

To deploy your own token contract, you will need sufficient ethers to pay for factory `minimumFee` (currently set to 0.1 ethers) and the Ethereum network transaction fees.

Experiment in the testnets before deploying your own token contracts on the Ethereum mainnet.

<br />

Testnet   | Explorers                     | Testnet ETH Faucets
:-------- |:----------------------------- |:-------------------------
Ropsten   | https://ropsten.etherscan.io/ | https://faucet.metamask.io/<br />https://twitter.com/BokkyPooBah/status/1099498823699714048
Kovan     | https://kovan.etherscan.io/   | https://faucet.kovan.network/<br />https://github.com/kovan-testnet/faucet<br />https://faucet.kovan.radarrelay.com/
Rinkeby   | https://rinkeby.etherscan.io/ | https://faucet.rinkeby.io/<br />https://faucet.metamask.io/
Görli     | https://goerli.etherscan.io/  | https://faucet.goerli.mudit.blog/<br />https://goerli-faucet.slock.it/<br />https://bridge.goerli.com/

<br />

## Factory Contract Details

The factory contracts have been deployed to the same address `0xA550114ee3688601006b8b9f25e64732eF774934` on the following networks:

* Mainnet [0xA550114ee3688601006b8b9f25e64732eF774934](https://etherscan.io/address/0xA550114ee3688601006b8b9f25e64732eF774934)
* Ropsten [0xA550114ee3688601006b8b9f25e64732eF774934](https://ropsten.etherscan.io/address/0xA550114ee3688601006b8b9f25e64732eF774934)
* Kovan [0xA550114ee3688601006b8b9f25e64732eF774934](https://kovan.etherscan.io/address/0xA550114ee3688601006b8b9f25e64732eF774934)
* Rinkeby [0xA550114ee3688601006b8b9f25e64732eF774934](https://rinkeby.etherscan.io/address/0xA550114ee3688601006b8b9f25e64732eF774934)
* Görli [0xA550114ee3688601006b8b9f25e64732eF774934](https://goerli.etherscan.io/address/0xA550114ee3688601006b8b9f25e64732eF774934)

The Application Binary Interface (ABI) for this factory's `deployTokenContract(...)` function follows:

> [{"constant":false,"inputs":[{"name":"symbol","type":"string"},{"name":"name","type":"string"},{"name":"decimals","type":"uint8"},{"name":"totalSupply","type":"uint256"}],"name":"deployTokenContract","outputs":[{"name":"token","type":"address"}],"payable":true,"stateMutability":"payable","type":"function"}]

<br />

<hr />

## Deploying a new token contract

For an example, we will deploy a token contract contract with the symbol `LEMON`, name `Lemonade 🍋 Stand`, 2 decimal places and a fixed totalSupply of 1000.00 tokens. This could represent the proportional share in the lemonade stand enterprise.

For this exercise, I will be using MyCrypto to interact with the factory contract, and MetaMask as the signing wallet. And I will be deploying my token contract on the Ropsten tesnet.

#### 1. Select your desired network in MetaMask

* Click on the MetaMask icon in your web browser tool bar
* Click on the selected network in the top to select a new network:
  <kbd><img src="images/MetaMask-SelectNetwork.png" /></kbd>

#### 2. Navigate to MyCrypto and select the right network

* Navigate to the contracts interaction page https://mycrypto.com/contracts/interact:
    <kbd><img src="images/MyCrypto-FirstScreen.png" /></kbd>
* Click the currently selected network on the top right if you want to select another network:
    <kbd><img src="images/MyCrypto-SelectNetwork.png" /></kbd>

#### 3. Fill in the factory contract address and ABI

* Enter the factory contract address: `0xA550114ee3688601006b8b9f25e64732eF774934`
* Enter the `deployTokenContract(...)` ABI:
    > [{"constant":false,"inputs":[{"name":"symbol","type":"string"},{"name":"name","type":"string"},{"name":"decimals","type":"uint8"},{"name":"totalSupply","type":"uint256"}],"name":"deployTokenContract","outputs":[{"name":"token","type":"address"}],"payable":true,"stateMutability":"payable","type":"function"}]

* Click on Access
    <kbd><img src="images/MyCrypto-FactoryAddressABI.png" /></kbd>

#### 4. Fill in your token contract details

* symbol: `LEMON`
* name: `Lemonade 🍋 Stand`
* decimals: `2`
* totalSupply: 100000 (100000 units = 1,000.00 tokens with 2 decimal places)

<kbd><img src="images/MyCrypto-LEMON.png" /></kbd>

#### 5. Access your wallet

<kbd><img src="images/MyCrypto-AccessWallet.png" /></kbd>



#### Fill in the factory contract address and Application Binary Interface


<kbd><img src="images/PrincessLeiaPeachExpelsARainbowBigBang-FixedSupplyTokenFactory.png" /></kbd>




https://ropsten.etherscan.io/tx/0xa633597b4051fd1c64cc9f0295c5947bf5a4a9a3c18a4e656db17c3da80040c2

https://ropsten.etherscan.io/token/0x9e458482b817e1238d04c374934f1306498b65b9

https://ropsten.etherscan.io/find-similiar-contracts?a=0x9e458482b817e1238d04c374934f1306498b65b9&lvl=5

0x9E458482B817E1238D04c374934F1306498b65b9

Send to 0xa11ce05D4f2FEFF552EF5941A05740EE1fF69B21

https://ropsten.etherscan.io/tx/0xb0c98a005b34e6f8b52393f7b61af4b051f344a8e795f4faf379465b361d47ab

https://ropsten.etherscan.io/token/0x9e458482b817e1238d04c374934f1306498b65b9

https://ropsten.etherscan.io/token/0x9e458482b817e1238d04c374934f1306498b65b9

https://ropsten.etherscan.io/token/0x9e458482b817e1238d04c374934f1306498b65b9#balances



<br />

<br />

Enjoy!

(c) BokkyPooBah / Bok Consulting Pty Ltd - Mar 14 2019. The MIT Licence.
