// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract YourContractTest {
    bytes32 public portfolio;

    function testSetPortfolioWithAddress() public {
        // Address to pass
        address addressToPass = 0x022df5782baf4ec29BB89529de3c89CdA7AF5B7d;

        // Convert the address to bytes32 by simply using the address type, as Solidity automatically pads it
        bytes memory tdata = abi.encodePacked(addressToPass);
        bytes32 _data = bytes32(tdata);
        portfolio = _data;
    }

      function getPortfolio() public view returns (address) {
        // Safely cast the bytes32 portfolio back to an address
        return address(bytes20(portfolio));
    }
}
