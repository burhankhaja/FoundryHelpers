// Remember push won't work in memory type arrays when you are pushing inside a function defined inside the same function, in that case only indexing works
// POC := https://github.com/burhankhaja/FoundryHelpers/blob/main/TrickyStruct.sol#L30-L33

interface Ib {
    function boom() external ;
}
contract a {
    Ib bc;
   constructor(address _b) {
      bc = Ib(_b);
   }

   function call() public {
    bc.boom();
   }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressArrayContract {
    // Define an array to store addresses
    address[] public addresses;

    

    // Function to add an address to the array
    function addAddress(address _address) public {
        // Push the new address onto the end of the array
        addresses.push(_address);

    }

    // Function to retrieve the total number of addresses in the array
    function getAddressCount() public view returns (uint256) {
        return addresses.length;
    }
}
