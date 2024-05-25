//SPDX-License-Identifier MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    uint256 number = 1;
    FundMe public fundMe;

    uint256 public constant SEND_VALUE = 0.1 ether;
    uint256 public constant STARTING_USER_BALANCE = 10 ether;
    uint256 public constant GAS_PRICE = 1;

    address public constant USER = address(1);


    function setUp() external {
       DeployFundMe deployFundMe = new DeployFundMe();
       fundMe = deployFundMe.run();
    }

    function testMinimunDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5 ether);
    }

    function testOwnerIsMsgSender() public view {
      console.log(fundMe.i_owner());
      console.log(msg.sender);
      assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedersionIsAccurated() public view {
      assertEq(fundMe.getVersion(), 4);
    }
}
