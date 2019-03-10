# Fixed Supply Token 👊 + Factory - Deployment

Deploy from account 0xa7e4fc44ec54e9b94b274d93f9a24918b958656f .

Remember to change owner account on Mainnet

FixedSupplyToken constructor data (from deploying in Remix):

```
000000000000000000000000a7e4fc44ec54e9b94b274d93f9a24918b958656f00000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000e0000000000000000000000000000000000000000000000000000000000000001200000000000000000000000000000000000000000000d3c21bcecceda100000000000000000000000000000000000000000000000000000000000000000000044649535400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001d466978656420537570706c7920546f6b656e20f09f918a2076312e3030000000
```

* [x] Mainnet
https://etherscan.io/address/0xfAEcE565D445e98Ea024f02FF06607B4654eEb56
https://etherscan.io/token/0xBD2ea74A74820C9B5750E40c2851bEd7136292Ed
  * [x] Changed owner
* [x] Ropsten
* [x] Kovan
* [ ] Rinkeby
* [x] Goerli


```javascript
var bokkypoobahsfixedsupplytokenfactoryContract = web3.eth.contract([{"constant":false,"inputs":[{"name":"token","type":"address"},{"name":"tokens","type":"uint256"}],"name":"recoverTokens","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_minimumFee","type":"uint256"}],"name":"setMinimumFee","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"minimumFee","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"numberOfChildren","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"children","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"acceptOwnership","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"newAddress","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"symbol","type":"string"},{"name":"name","type":"string"},{"name":"decimals","type":"uint8"},{"name":"totalSupply","type":"uint256"}],"name":"deployTokenContract","outputs":[{"name":"token","type":"address"}],"payable":true,"stateMutability":"payable","type":"function"},{"constant":true,"inputs":[],"name":"newOwner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_newAddress","type":"address"}],"name":"deprecateFactory","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"isChild","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"payable":true,"stateMutability":"payable","type":"fallback"},{"anonymous":false,"inputs":[{"indexed":false,"name":"_newAddress","type":"address"}],"name":"FactoryDeprecated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"oldFee","type":"uint256"},{"indexed":false,"name":"newFee","type":"uint256"}],"name":"MinimumFeeUpdated","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"owner","type":"address"},{"indexed":true,"name":"token","type":"address"},{"indexed":false,"name":"symbol","type":"string"},{"indexed":false,"name":"name","type":"string"},{"indexed":false,"name":"decimals","type":"uint8"},{"indexed":false,"name":"totalSupply","type":"uint256"}],"name":"TokenDeployed","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_from","type":"address"},{"indexed":true,"name":"_to","type":"address"}],"name":"OwnershipTransferred","type":"event"}]);
var bokkypoobahsfixedsupplytokenfactory = bokkypoobahsfixedsupplytokenfactoryContract.new(
   {
     from: web3.eth.accounts[0],
     data: '0x608060405267016345785d8a000060035534801561001c57600080fd5b5060008054600160a060020a03191633908117909155604080518082018252600481527f46495354000000000000000000000000000000000000000000000000000000006020808301919091528251808401909352601d83527f466978656420537570706c7920546f6b656e20f09f918a2076312e3030000000908301526100ba9291601269d3c21bcecceda10000006401000000006100c0810204565b50610383565b600085858585856040516100d390610375565b600160a060020a038616815260ff831660608201526080810182905260a060208083018281528751928401929092528651604084019160c08501919089019080838360005b83811015610130578181015183820152602001610118565b50505050905090810190601f16801561015d5780820380516001836020036101000a031916815260200191505b50838103825286518152865160209182019188019080838360005b83811015610190578181015183820152602001610178565b50505050905090810190601f1680156101bd5780820380516001836020036101000a031916815260200191505b50975050505050505050604051809103906000f0801580156101e3573d6000803e3d6000fd5b50600160a060020a038082166000818152600460209081526040808320805460ff1916600190811790915560058054918201815584527f036b6384b5eca791c62761152d0c79bb0604c104a5fb6f4eb0703f3154bb3db0018054600160a060020a03191685179055805160ff8a16918101919091526060810188905260808082528b51908201528a519596509294938b16937f3bc7f29f3ebe37f3907a35128d9fa2a85b96814855b2e869cfbfacdd6cd11c42938b938b938b938b939283928381019260a0850192918a01918190849084905b838110156102ce5781810151838201526020016102b6565b50505050905090810190601f1680156102fb5780820380516001836020036101000a031916815260200191505b50838103825286518152865160209182019188019080838360005b8381101561032e578181015183820152602001610316565b50505050905090810190601f16801561035b5780820380516001836020036101000a031916815260200191505b50965050505050505060405180910390a395945050505050565b610f178062001e9483390190565b611b0180620003936000396000f3fe608060405260043610620000f1576000357c0100000000000000000000000000000000000000000000000000000000900480638da5cb5b11620000a8578063d4ee1d90116200007e578063d4ee1d901462000375578063de0946af146200038d578063f2fde38b14620003c4578063fc91a89714620003fb57620000f1565b80638da5cb5b1462000207578063ccdb3f45146200021f578063cdaca7d5146200023757620000f1565b8063069c9fae14620000f6578063182a750614620001355780631a7626e71462000163578063534349f5146200018d5780637002ce4214620001a557806379ba509714620001ef575b600080fd5b3480156200010357600080fd5b5062000133600480360360408110156200011c57600080fd5b50600160a060020a03813516906020013562000446565b005b3480156200014257600080fd5b5062000133600480360360208110156200015b57600080fd5b503562000611565b3480156200017057600080fd5b506200017b6200066b565b60408051918252519081900360200190f35b3480156200019a57600080fd5b506200017b62000671565b348015620001b257600080fd5b50620001d360048036036020811015620001cb57600080fd5b503562000677565b60408051600160a060020a039092168252519081900360200190f35b348015620001fc57600080fd5b5062000133620006a0565b3480156200021457600080fd5b50620001d362000729565b3480156200022c57600080fd5b50620001d362000738565b620001d3600480360360808110156200024f57600080fd5b8101906020810181356401000000008111156200026b57600080fd5b8201836020820111156200027e57600080fd5b80359060200191846001830284011164010000000083111715620002a157600080fd5b91908080601f0160208091040260200160405190810160405280939291908181526020018383808284376000920191909152509295949360208101935035915050640100000000811115620002f557600080fd5b8201836020820111156200030857600080fd5b803590602001918460018302840111640100000000831117156200032b57600080fd5b91908080601f0160208091040260200160405190810160405280939291908181526020018383808284376000920191909152509295505060ff833516935050506020013562000747565b3480156200038257600080fd5b50620001d3620007da565b3480156200039a57600080fd5b506200013360048036036020811015620003b357600080fd5b5035600160a060020a0316620007e9565b348015620003d157600080fd5b506200013360048036036020811015620003ea57600080fd5b5035600160a060020a031662000883565b3480156200040857600080fd5b5062000432600480360360208110156200042157600080fd5b5035600160a060020a0316620008ca565b604080519115158252519081900360200190f35b600054600160a060020a031633146200045e57600080fd5b600160a060020a0382161515620004bf57600054600160a060020a03166108fc82156200048c57826200048f565b30315b6040518115909202916000818181858888f19350505050158015620004b8573d6000803e3d6000fd5b506200060d565b600054600160a060020a038084169163a9059cbb91168315620004e3578362000572565b604080517f70a082310000000000000000000000000000000000000000000000000000000081523060048201529051600160a060020a038716916370a08231916024808301926020929190829003018186803b1580156200054357600080fd5b505afa15801562000558573d6000803e3d6000fd5b505050506040513d60208110156200056f57600080fd5b50515b6040518363ffffffff167c01000000000000000000000000000000000000000000000000000000000281526004018083600160a060020a0316600160a060020a0316815260200182815260200192505050602060405180830381600087803b158015620005de57600080fd5b505af1158015620005f3573d6000803e3d6000fd5b505050506040513d60208110156200060a57600080fd5b50505b5050565b600054600160a060020a031633146200062957600080fd5b600354604080519182526020820183905280517fcc2f49c6214278ae5862935eff953448e8e69118d10abfafaf63ea6aa35255cb9281900390910190a1600355565b60035481565b60055490565b60058054829081106200068657fe5b600091825260209091200154600160a060020a0316905081565b600154600160a060020a03163314620006b857600080fd5b60015460008054604051600160a060020a0393841693909116917f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e091a3600180546000805473ffffffffffffffffffffffffffffffffffffffff19908116600160a060020a03841617909155169055565b600054600160a060020a031681565b600254600160a060020a031681565b6003546000903410156200075a57600080fd5b601b60ff841611156200076c57600080fd5b600082116200077a57600080fd5b620007893386868686620008df565b90506000341115620007d25760008054604051600160a060020a03909116913480156108fc02929091818181858888f19350505050158015620007d0573d6000803e3d6000fd5b505b949350505050565b600154600160a060020a031681565b600054600160a060020a031633146200080157600080fd5b600254600160a060020a0316156200081857600080fd5b60408051600160a060020a038316815290517f0ac885cfcac9d1450e80f787dbf9546001fb50414106435b10b1d27b448b86689181900360200190a16002805473ffffffffffffffffffffffffffffffffffffffff1916600160a060020a0392909216919091179055565b600054600160a060020a031633146200089b57600080fd5b6001805473ffffffffffffffffffffffffffffffffffffffff1916600160a060020a0392909216919091179055565b60046020526000908152604090205460ff1681565b60008585858585604051620008f49062000bb0565b600160a060020a038616815260ff831660608201526080810182905260a060208083018281528751928401929092528651604084019160c08501919089019080838360005b838110156200095357818101518382015260200162000939565b50505050905090810190601f168015620009815780820380516001836020036101000a031916815260200191505b50838103825286518152865160209182019188019080838360005b83811015620009b65781810151838201526020016200099c565b50505050905090810190601f168015620009e45780820380516001836020036101000a031916815260200191505b50975050505050505050604051809103906000f08015801562000a0b573d6000803e3d6000fd5b50600160a060020a038082166000818152600460209081526040808320805460ff1916600190811790915560058054918201815584527f036b6384b5eca791c62761152d0c79bb0604c104a5fb6f4eb0703f3154bb3db001805473ffffffffffffffffffffffffffffffffffffffff191685179055805160ff8a16918101919091526060810188905260808082528b51908201528a519596509294938b16937f3bc7f29f3ebe37f3907a35128d9fa2a85b96814855b2e869cfbfacdd6cd11c42938b938b938b938b939283928381019260a0850192918a01918190849084905b8381101562000b0557818101518382015260200162000aeb565b50505050905090810190601f16801562000b335780820380516001836020036101000a031916815260200191505b50838103825286518152865160209182019188019080838360005b8381101562000b6857818101518382015260200162000b4e565b50505050905090810190601f16801562000b965780820380516001836020036101000a031916815260200191505b50965050505050505060405180910390a395945050505050565b610f178062000bbf8339019056fe60806040523480156200001157600080fd5b5060405162000f1738038062000f17833981018060405260a08110156200003757600080fd5b8151602083018051919392830192916401000000008111156200005957600080fd5b820160208101848111156200006d57600080fd5b81516401000000008111828201871017156200008857600080fd5b50509291906020018051640100000000811115620000a557600080fd5b82016020810184811115620000b957600080fd5b8151640100000000811182820187101715620000d457600080fd5b505060208281015160409093015160008054600160a060020a031916600160a060020a038a16179055865192955092935062000116916002918701906200019c565b5082516200012c9060039060208601906200019c565b506004805460ff191660ff84161790556005819055600160a060020a0385166000818152600660209081526040808320859055805185815290517fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef929181900390910190a3505050505062000241565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f10620001df57805160ff19168380011785556200020f565b828001600101855582156200020f579182015b828111156200020f578251825591602001919060010190620001f2565b506200021d92915062000221565b5090565b6200023e91905b808211156200021d576000815560010162000228565b90565b610cc680620002516000396000f3fe608060405260043610610105576000357c01000000000000000000000000000000000000000000000000000000009004806379ba5097116100a7578063cae9ca5111610076578063cae9ca5114610378578063d4ee1d9014610440578063dd62ed3e14610455578063f2fde38b1461049057610105565b806379ba5097146102e45780638da5cb5b146102f957806395d89b411461032a578063a9059cbb1461033f57610105565b806318160ddd116100e357806318160ddd1461021c57806323b872dd14610243578063313ce5671461028657806370a08231146102b157610105565b8063069c9fae1461010a57806306fdde0314610145578063095ea7b3146101cf575b600080fd5b34801561011657600080fd5b506101436004803603604081101561012d57600080fd5b50600160a060020a0381351690602001356104c3565b005b34801561015157600080fd5b5061015a610680565b6040805160208082528351818301528351919283929083019185019080838360005b8381101561019457818101518382015260200161017c565b50505050905090810190601f1680156101c15780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b3480156101db57600080fd5b50610208600480360360408110156101f257600080fd5b50600160a060020a038135169060200135610716565b604080519115158252519081900360200190f35b34801561022857600080fd5b5061023161077d565b60408051918252519081900360200190f35b34801561024f57600080fd5b506102086004803603606081101561026657600080fd5b50600160a060020a038135811691602081013590911690604001356107c0565b34801561029257600080fd5b5061029b6108cb565b6040805160ff9092168252519081900360200190f35b3480156102bd57600080fd5b50610231600480360360208110156102d457600080fd5b5035600160a060020a03166108d4565b3480156102f057600080fd5b506101436108ef565b34801561030557600080fd5b5061030e610977565b60408051600160a060020a039092168252519081900360200190f35b34801561033657600080fd5b5061015a610986565b34801561034b57600080fd5b506102086004803603604081101561036257600080fd5b50600160a060020a0381351690602001356109e4565b34801561038457600080fd5b506102086004803603606081101561039b57600080fd5b600160a060020a03823516916020810135918101906060810160408201356401000000008111156103cb57600080fd5b8201836020820111156103dd57600080fd5b803590602001918460018302840111640100000000831117156103ff57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600092019190915250929550610a94945050505050565b34801561044c57600080fd5b5061030e610bf5565b34801561046157600080fd5b506102316004803603604081101561047857600080fd5b50600160a060020a0381358116916020013516610c04565b34801561049c57600080fd5b50610143600480360360208110156104b357600080fd5b5035600160a060020a0316610c2f565b600054600160a060020a031633146104da57600080fd5b600160a060020a038216151561053657600054600160a060020a03166108fc82156105055782610508565b30315b6040518115909202916000818181858888f19350505050158015610530573d6000803e3d6000fd5b5061067c565b600054600160a060020a038084169163a9059cbb9116831561055857836105e4565b604080517f70a082310000000000000000000000000000000000000000000000000000000081523060048201529051600160a060020a038716916370a08231916024808301926020929190829003018186803b1580156105b757600080fd5b505afa1580156105cb573d6000803e3d6000fd5b505050506040513d60208110156105e157600080fd5b50515b6040518363ffffffff167c01000000000000000000000000000000000000000000000000000000000281526004018083600160a060020a0316600160a060020a0316815260200182815260200192505050602060405180830381600087803b15801561064f57600080fd5b505af1158015610663573d6000803e3d6000fd5b505050506040513d602081101561067957600080fd5b50505b5050565b60038054604080516020601f600260001961010060018816150201909516949094049384018190048102820181019092528281526060939092909183018282801561070c5780601f106106e15761010080835404028352916020019161070c565b820191906000526020600020905b8154815290600101906020018083116106ef57829003601f168201915b5050505050905090565b336000818152600760209081526040808320600160a060020a038716808552908352818420869055815186815291519394909390927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925928290030190a35060015b92915050565b600080805260066020527f54cdd369e4e8a8515e52ca72ec816c2101831ad1f18bf44102ed171459c9b4f8546005546107bb9163ffffffff610c7516565b905090565b600160a060020a0383166000908152600660205260408120546107e9908363ffffffff610c7516565b600160a060020a0385166000908152600660209081526040808320939093556007815282822033835290522054610826908363ffffffff610c7516565b600160a060020a03808616600090815260076020908152604080832033845282528083209490945591861681526006909152205461086a908363ffffffff610c8a16565b600160a060020a0380851660008181526006602090815260409182902094909455805186815290519193928816927fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef92918290030190a35060019392505050565b60045460ff1690565b600160a060020a031660009081526006602052604090205490565b600154600160a060020a0316331461090657600080fd5b60015460008054604051600160a060020a0393841693909116917f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e091a3600180546000805473ffffffffffffffffffffffffffffffffffffffff19908116600160a060020a03841617909155169055565b600054600160a060020a031681565b60028054604080516020601f600019610100600187161502019094168590049384018190048102820181019092528281526060939092909183018282801561070c5780601f106106e15761010080835404028352916020019161070c565b33600090815260066020526040812054610a04908363ffffffff610c7516565b3360009081526006602052604080822092909255600160a060020a03851681522054610a36908363ffffffff610c8a16565b600160a060020a0384166000818152600660209081526040918290209390935580518581529051919233927fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9281900390910190a350600192915050565b336000818152600760209081526040808320600160a060020a038816808552908352818420879055815187815291519394909390927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925928290030190a36040517f8f4ffcb10000000000000000000000000000000000000000000000000000000081523360048201818152602483018690523060448401819052608060648501908152865160848601528651600160a060020a038a1695638f4ffcb195948a94938a939192909160a490910190602085019080838360005b83811015610b84578181015183820152602001610b6c565b50505050905090810190601f168015610bb15780820380516001836020036101000a031916815260200191505b5095505050505050600060405180830381600087803b158015610bd357600080fd5b505af1158015610be7573d6000803e3d6000fd5b506001979650505050505050565b600154600160a060020a031681565b600160a060020a03918216600090815260076020908152604080832093909416825291909152205490565b600054600160a060020a03163314610c4657600080fd5b6001805473ffffffffffffffffffffffffffffffffffffffff1916600160a060020a0392909216919091179055565b600082821115610c8457600080fd5b50900390565b8181018281101561077757600080fdfea165627a7a723058202814fdb28291c0acff1f0b1f857d48020f35646ebb10715e9e3c4227f97358fe0029a165627a7a72305820f82120eed7ddc40b908ddb59096bd5407af7f8eed942660ee10c2431ab6c4263002960806040523480156200001157600080fd5b5060405162000f1738038062000f17833981018060405260a08110156200003757600080fd5b8151602083018051919392830192916401000000008111156200005957600080fd5b820160208101848111156200006d57600080fd5b81516401000000008111828201871017156200008857600080fd5b50509291906020018051640100000000811115620000a557600080fd5b82016020810184811115620000b957600080fd5b8151640100000000811182820187101715620000d457600080fd5b505060208281015160409093015160008054600160a060020a031916600160a060020a038a16179055865192955092935062000116916002918701906200019c565b5082516200012c9060039060208601906200019c565b506004805460ff191660ff84161790556005819055600160a060020a0385166000818152600660209081526040808320859055805185815290517fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef929181900390910190a3505050505062000241565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f10620001df57805160ff19168380011785556200020f565b828001600101855582156200020f579182015b828111156200020f578251825591602001919060010190620001f2565b506200021d92915062000221565b5090565b6200023e91905b808211156200021d576000815560010162000228565b90565b610cc680620002516000396000f3fe608060405260043610610105576000357c01000000000000000000000000000000000000000000000000000000009004806379ba5097116100a7578063cae9ca5111610076578063cae9ca5114610378578063d4ee1d9014610440578063dd62ed3e14610455578063f2fde38b1461049057610105565b806379ba5097146102e45780638da5cb5b146102f957806395d89b411461032a578063a9059cbb1461033f57610105565b806318160ddd116100e357806318160ddd1461021c57806323b872dd14610243578063313ce5671461028657806370a08231146102b157610105565b8063069c9fae1461010a57806306fdde0314610145578063095ea7b3146101cf575b600080fd5b34801561011657600080fd5b506101436004803603604081101561012d57600080fd5b50600160a060020a0381351690602001356104c3565b005b34801561015157600080fd5b5061015a610680565b6040805160208082528351818301528351919283929083019185019080838360005b8381101561019457818101518382015260200161017c565b50505050905090810190601f1680156101c15780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b3480156101db57600080fd5b50610208600480360360408110156101f257600080fd5b50600160a060020a038135169060200135610716565b604080519115158252519081900360200190f35b34801561022857600080fd5b5061023161077d565b60408051918252519081900360200190f35b34801561024f57600080fd5b506102086004803603606081101561026657600080fd5b50600160a060020a038135811691602081013590911690604001356107c0565b34801561029257600080fd5b5061029b6108cb565b6040805160ff9092168252519081900360200190f35b3480156102bd57600080fd5b50610231600480360360208110156102d457600080fd5b5035600160a060020a03166108d4565b3480156102f057600080fd5b506101436108ef565b34801561030557600080fd5b5061030e610977565b60408051600160a060020a039092168252519081900360200190f35b34801561033657600080fd5b5061015a610986565b34801561034b57600080fd5b506102086004803603604081101561036257600080fd5b50600160a060020a0381351690602001356109e4565b34801561038457600080fd5b506102086004803603606081101561039b57600080fd5b600160a060020a03823516916020810135918101906060810160408201356401000000008111156103cb57600080fd5b8201836020820111156103dd57600080fd5b803590602001918460018302840111640100000000831117156103ff57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600092019190915250929550610a94945050505050565b34801561044c57600080fd5b5061030e610bf5565b34801561046157600080fd5b506102316004803603604081101561047857600080fd5b50600160a060020a0381358116916020013516610c04565b34801561049c57600080fd5b50610143600480360360208110156104b357600080fd5b5035600160a060020a0316610c2f565b600054600160a060020a031633146104da57600080fd5b600160a060020a038216151561053657600054600160a060020a03166108fc82156105055782610508565b30315b6040518115909202916000818181858888f19350505050158015610530573d6000803e3d6000fd5b5061067c565b600054600160a060020a038084169163a9059cbb9116831561055857836105e4565b604080517f70a082310000000000000000000000000000000000000000000000000000000081523060048201529051600160a060020a038716916370a08231916024808301926020929190829003018186803b1580156105b757600080fd5b505afa1580156105cb573d6000803e3d6000fd5b505050506040513d60208110156105e157600080fd5b50515b6040518363ffffffff167c01000000000000000000000000000000000000000000000000000000000281526004018083600160a060020a0316600160a060020a0316815260200182815260200192505050602060405180830381600087803b15801561064f57600080fd5b505af1158015610663573d6000803e3d6000fd5b505050506040513d602081101561067957600080fd5b50505b5050565b60038054604080516020601f600260001961010060018816150201909516949094049384018190048102820181019092528281526060939092909183018282801561070c5780601f106106e15761010080835404028352916020019161070c565b820191906000526020600020905b8154815290600101906020018083116106ef57829003601f168201915b5050505050905090565b336000818152600760209081526040808320600160a060020a038716808552908352818420869055815186815291519394909390927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925928290030190a35060015b92915050565b600080805260066020527f54cdd369e4e8a8515e52ca72ec816c2101831ad1f18bf44102ed171459c9b4f8546005546107bb9163ffffffff610c7516565b905090565b600160a060020a0383166000908152600660205260408120546107e9908363ffffffff610c7516565b600160a060020a0385166000908152600660209081526040808320939093556007815282822033835290522054610826908363ffffffff610c7516565b600160a060020a03808616600090815260076020908152604080832033845282528083209490945591861681526006909152205461086a908363ffffffff610c8a16565b600160a060020a0380851660008181526006602090815260409182902094909455805186815290519193928816927fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef92918290030190a35060019392505050565b60045460ff1690565b600160a060020a031660009081526006602052604090205490565b600154600160a060020a0316331461090657600080fd5b60015460008054604051600160a060020a0393841693909116917f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e091a3600180546000805473ffffffffffffffffffffffffffffffffffffffff19908116600160a060020a03841617909155169055565b600054600160a060020a031681565b60028054604080516020601f600019610100600187161502019094168590049384018190048102820181019092528281526060939092909183018282801561070c5780601f106106e15761010080835404028352916020019161070c565b33600090815260066020526040812054610a04908363ffffffff610c7516565b3360009081526006602052604080822092909255600160a060020a03851681522054610a36908363ffffffff610c8a16565b600160a060020a0384166000818152600660209081526040918290209390935580518581529051919233927fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9281900390910190a350600192915050565b336000818152600760209081526040808320600160a060020a038816808552908352818420879055815187815291519394909390927f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925928290030190a36040517f8f4ffcb10000000000000000000000000000000000000000000000000000000081523360048201818152602483018690523060448401819052608060648501908152865160848601528651600160a060020a038a1695638f4ffcb195948a94938a939192909160a490910190602085019080838360005b83811015610b84578181015183820152602001610b6c565b50505050905090810190601f168015610bb15780820380516001836020036101000a031916815260200191505b5095505050505050600060405180830381600087803b158015610bd357600080fd5b505af1158015610be7573d6000803e3d6000fd5b506001979650505050505050565b600154600160a060020a031681565b600160a060020a03918216600090815260076020908152604080832093909416825291909152205490565b600054600160a060020a03163314610c4657600080fd5b6001805473ffffffffffffffffffffffffffffffffffffffff1916600160a060020a0392909216919091179055565b600082821115610c8457600080fd5b50900390565b8181018281101561077757600080fdfea165627a7a723058202814fdb28291c0acff1f0b1f857d48020f35646ebb10715e9e3c4227f97358fe0029',
     gas: '3500000'
   }, function (e, contract){
    console.log(e, contract);
    if (typeof contract.address !== 'undefined') {
         console.log('Contract mined! address: ' + contract.address + ' transactionHash: ' + contract.transactionHash);
    }
})
```