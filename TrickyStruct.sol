import "forge-std/Test.sol";
struct tester {
    uint num;
    int sum;
    address[] _array;
}

contract callme {
    function structAbsorber(tester calldata _p) public returns (uint) {
        return _p.num;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

contract CallMeTest is Test {
    callme private callmeInstance;

    function setUp() public {
        // Deploy the callme contract
        callmeInstance = new callme();
    }

    function testStructAbsorberWithStruct() public {
        // Define a tester struct
        // tester memory myTester = tester({num: 10, sum: 20});
        // tester memory myTester = tester(10, 20); //@note both work fine
        address[] memory empty; // = new address[](3);
        // empty[0] = address(0);
        // empty[1] = address(0);
        // empty[2] = address(0);
        tester memory myTester = tester(10, 20, empty); //@note testing emptyarray

        // Call the structAbsorber function with the tester struct
        uint result = callmeInstance.structAbsorber(myTester);

        console.log(result);

        //@note when calling calldata structs in the same contract causes issues, since in portfolio you won't be doing it ,.... works fine

        // uint result = structAbsorber(myTester);

        // Assert the expected outcome
        // assertEq(
        //     result,
        //     myTester.num,
        //     "The returned value should match the num field of the tester struct"
        // );
    }

    //@note fails to call it with memory when defined in own contract
    function structAbsorber(tester calldata _p) public returns (uint) {
        return _p.num;
    }
}
