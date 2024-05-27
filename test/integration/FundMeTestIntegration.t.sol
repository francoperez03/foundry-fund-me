import {Test} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe} from "../../script/Integrations.s.sol";

contract FundMeTestIntegration is Test {
    FundMe public fundMe;
    uint256 public constant STARTING_USER_BALANCE = 10 ether;
    address public USER = makeAddr("user");

    function setUp() external {
      DeployFundMe deployFundMe = new DeployFundMe();
      fundMe = deployFundMe.run();
      vm.deal(USER, STARTING_USER_BALANCE);
    }

    function testUserCanFundInteraction() external {
      FundFundMe fundFundMe = new FundFundMe();
      fundFundMe.fundFundMe(address(fundMe));
    }
}