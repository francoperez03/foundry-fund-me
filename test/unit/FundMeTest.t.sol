//SPDX-License-Identifier MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";

contract FundMeTest is Test {
    uint256 number = 1;
    FundMe public fundMe;

    uint256 public constant SEND_VALUE = 0.1 ether;
    uint256 public constant STARTING_USER_BALANCE = 10 ether;
    uint256 public constant GAS_PRICE = 1;

    address public constant USER = address(1);


    function setUp() external {}

    function testDemo() public view {
        console.log("hola");
        assertEq(number, 1);
    }
}
