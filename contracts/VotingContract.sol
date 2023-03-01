pragma solidity 0.8.9;
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
contract Voting{

    struct Stake{
        uint tokenId;
        uint amount;
        uint timestamp;
    }

    mapping(address => Stake) public stakes;

    mapping(address => bool)public vote;
    uint public VoteCount;
    function DoVote(address _user)public VotedOrnot(_user){
        vote[_user]=true;
        VoteCount++;  
    }

    modifier VotedOrnot(address _user){
        require(vote[_user]==false,"You'r already voted Only vote one time");
        _;
    }
}

//References https://www.youtube.com/watch?v=Uy2cELEZoQc&t=159s
// For holding nft in contract.