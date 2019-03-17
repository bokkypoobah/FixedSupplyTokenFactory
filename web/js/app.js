// var ethRpc;
// var etcRpc;
//
// var prodSite = "https://refunds.thedao.fund/";
// if (window.location.href.substring(0, prodSite.length) == prodSite) {
// 	ethRpc = "https://refunds.thedao.fund/ethrpc";
// 	etcRpc = "https://refunds.thedao.fund/etcrpc";
// } else {
// 	ethRpc = "http://localhost:8545";
// 	etcRpc = "http://localhost:9545";
// }


function getSearchParameter(name) {
    var search = window.location.search.substring(1);
    var pairs = search.split('&');
    for (var i = 0; i < pairs.length; i++) {
        var pair = pairs[i].split('=');
        var key = decodeURIComponent(pair[0]);
        if (name == key) {
						var value = decodeURIComponent(pair[1].replace(/\+/g, " ").replace(/%2B/ig, "\+"));
            return value;
        }
    }
    return "";
}

function parametersContainKey(keyName) {
    var search = window.location.search.substring(1);
    var pairs = search.split('&');
    for (var i = 0; i < pairs.length; i++) {
        var pair = pairs[i].split('=');
        var key = decodeURIComponent(pair[0]);
        if (key == keyName) {
          return true;
        }
    }
    return false;
}

/*
function getPreHardforkBalance(address) {
    for (var i = 0; i < preHFBalances.length; i++) {
    	if (preHFBalances[i].account == address) {
    		return preHFBalances[i].amount / 1e16;
    	}
    }
	return null;
}
*/

// function getETHDetails(address) {
// 	var w3 = new Web3(new Web3.providers.HttpProvider(ethRpc));
// 	var ethBlockNumber = w3.eth.blockNumber;
// 	console.log("ethBlockNumber: " + ethBlockNumber);
// 	var abiFragment = [{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"type":"function"}];
// 	var daoToETHBalanceAddress = "0xbb9bc244d798123fde783fcc1c72d3bb8c189413";
// 	var daoToETHExtraBalanceBalanceAddress = "0x5c40eF6f527f4FbA68368774E6130cE6515123f2";
// 	var daoToETHBalanceContract = w3.eth.contract(abiFragment).at(daoToETHBalanceAddress);
// 	var daoToETHExtraBalanceBalanceContract = w3.eth.contract(abiFragment).at(daoToETHExtraBalanceBalanceAddress);
// 	var ethWithdrawalAmount = daoToETHBalanceContract.balanceOf(address) / 1e18;
// 	var ethExtraBalanceWithdrawalAmount = daoToETHExtraBalanceBalanceContract.balanceOf(address) / 1e18;
// 	var ethAccountBalance = w3.eth.getBalance(address) / 1e18;
// 	return { ethBlockNumber: ethBlockNumber, ethWithdrawalAmount: ethWithdrawalAmount, ethExtraBalanceWithdrawalAmount: ethExtraBalanceWithdrawalAmount, ethAccountBalance: ethAccountBalance };
// }
//
// function getETCDetails(address) {
// 	var w3 = new Web3(new Web3.providers.HttpProvider(etcRpc));
// 	var etcBlockNumber = w3.eth.blockNumber;
// 	console.log("etcBlockNumber: " + etcBlockNumber);
// 	var daoBalanceSnapshotAddress = "0x180826b05452ce96e157f0708c43381fee64a6b8";
// 	var daoBalanceSnapshotABIFragment = [{"constant":true,"inputs":[{"name":"_owner","type":"address"}],"name":"balanceOf","outputs":[{"name":"balance","type":"uint256"}],"type":"function"}];
// 	var daoBalanceSnapshot = w3.eth.contract(daoBalanceSnapshotABIFragment).at(daoBalanceSnapshotAddress);
// 	var whitehatWithdrawAddress = "0x9f5304da62a5408416ea58a17a92611019bd5ce3"; // New re-deployed address
// 	var whitehatWithdrawABIFragment = [{"constant":true,"inputs":[{"name":"_dth","type":"address"}],"name":"calculateWithdraw","outputs":[{"name":"","type":"uint256"}],"type":"function"}, {"constant":true,"inputs":[{"name":"_account","type":"address"}],"name":"getPaidOut","outputs":[{"name":"","type":"uint256"}],"type":"function"}, {"constant":false,"inputs":[{"name":"_beneficiary","type":"address"},{"name":"_percentageWHG","type":"uint256"}],"name":"withdraw","outputs":[],"type":"function"}];
// 	var whitehatWithdraw = w3.eth.contract(whitehatWithdrawABIFragment).at(whitehatWithdrawAddress);
// 	var preHFDaoBalance = daoBalanceSnapshot.balanceOf(address) / 1e16;
// 	var etcPaidOutAmount = whitehatWithdraw.getPaidOut(address) / 1e18;
// 	var etcWithdrawalAmount = whitehatWithdraw.calculateWithdraw(address) / 1e18;
// 	var etcAccountBalance = w3.eth.getBalance(address) / 1e18;
// 	return { preHFDaoBalance: preHFDaoBalance, etcBlockNumber: etcBlockNumber, etcPaidOutAmount: etcPaidOutAmount, etcWithdrawalAmount: etcWithdrawalAmount, etcAccountBalance: etcAccountBalance };
// }
