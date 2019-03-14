# BokkyPooBah's Fixed Supply Token Factory User's Guide

Or how to deploy your own FixedSupplyToken token contract in less than 3 minutes.

<br />

## Factory Contract Details

The factory contracts have been deployed on the following networks:

* Mainnet [0xA550114ee3688601006b8b9f25e64732eF774934](https://etherscan.io/address/0xA550114ee3688601006b8b9f25e64732eF774934)
* Ropsten [0xA550114ee3688601006b8b9f25e64732eF774934](https://ropsten.etherscan.io/address/0xA550114ee3688601006b8b9f25e64732eF774934)
* Kovan [0xA550114ee3688601006b8b9f25e64732eF774934](https://kovan.etherscan.io/address/0xA550114ee3688601006b8b9f25e64732eF774934)
* Rinkeby [0xA550114ee3688601006b8b9f25e64732eF774934](https://rinkeby.etherscan.io/address/0xA550114ee3688601006b8b9f25e64732eF774934)
* Görli [0xA550114ee3688601006b8b9f25e64732eF774934](https://goerli.etherscan.io/address/0xA550114ee3688601006b8b9f25e64732eF774934)

The Application Binary Interface (ABI) for this factory's `deployTokenContract(...)` function follows:

> [{"constant":false,"inputs":[{"name":"symbol","type":"string"},{"name":"name","type":"string"},{"name":"decimals","type":"uint8"},{"name":"totalSupply","type":"uint256"}],"name":"deployTokenContract","outputs":[{"name":"token","type":"address"}],"payable":true,"stateMutability":"payable","type":"function"}]

<br />

<hr />

<br />

<br />

Enjoy!

(c) BokkyPooBah / Bok Consulting Pty Ltd - Mar 14 2019. The MIT Licence.
