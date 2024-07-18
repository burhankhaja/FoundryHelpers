// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BiteByte {
    bytes public bite;

    function call() public {
        bite = msg.data;
    }

    function testByte() public {
        // Encode the function signature and arguments
        bytes memory governance = abi.encodeWithSignature("call()");
        bytes memory payload = abi.encodeWithSignature("call()", governance);

        // Call the trap function with the encoded payload
        // Forward all available gas, but in practice, specify a reasonable limit
        (bool success, ) = address(this).call(payload);
        require(success, "Call failed");
    }

    // call this with the function selector in string and gets its bytes selector
    // eg: transfer(address,uint256) --> 0xa9059cbb --> confirmed on 4byte.directory
// however 4byte returned multiple other answers too their signature matches, i pasted their string selector in this and yeah
// their signature matches, that is why decoding from bytes4 --> string is very difficult
    function getSelectorOfFunction(string memory _functionSelector) public pure returns(bytes memory) {
        bytes memory _return = abi.encodeWithSignature(_functionSelector);
        return _return;
    }
}
