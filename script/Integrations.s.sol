// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script{
  uint256 public constant SEND_VALUE = 0.1 ether;

  function fundFundMe(address mostRecentylyDeployed) public {
    vm.startBroadcast();
    FundMe(payable(mostRecentylyDeployed)).fund{value:SEND_VALUE}();
    vm.stopBroadcast();
  }

  function run() external {
    address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
    fundFundMe(mostRecentlyDeployed);
  }
}

contract WithdrawFundMe is Script{

  function withdrawFundMe(address mostRecentylyDeployed) public {
    vm.startBroadcast();
    FundMe(payable(mostRecentylyDeployed)).withdraw();
    vm.stopBroadcast();
  }


  function run() external {
    address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
    withdrawFundMe(mostRecentlyDeployed);
  }
}