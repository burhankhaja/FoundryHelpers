
import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";

contract decode {
    function encoder(address _to, uint256 _amount) public view returns(bytes memory) {
         bytes memory inputData = abi.encodeWithSelector(
         IERC20Upgradeable.transfer.selector,
        _to,
        _amount
      );
    return inputData;
    }

    function decoder(bytes calldata _data) public view returns(address, uint){
       // Decode the data starting from the second byte onwards, skipping the function selector
        // The function selector is 4 bytes long, so we start decoding from the 5th byte
        // (address to, uint256 amount) = abi.decode(_data, (address, uint256));
        (address to, uint256 amount) = abi.decode(_data[4:], (address, uint256));

        return (to, amount);

    }
   
}


 // function encode(address _to, uint256 _amount) public view returns(bytes memory) {
    //      bytes memory inputData = abi.encodeWithSelector(
    //      IERC20Upgradeable.transfer.selector,
    //     _to,
    //     _amount
    // );
    // return inputData;
    // }
