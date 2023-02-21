pragma solidity 0.8.9;
contract FallbackExample{
    uint256 public result1;
    uint256 public result2;

    receive() external payable{
        result1 = 1;
    }

    fallback() external payable{
        result2 = 2;
    }

    function withdraw()public{
        (bool callSuccess, )=payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call transfer failed"); 
    }
}

// 0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678

