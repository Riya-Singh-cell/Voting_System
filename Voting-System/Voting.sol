// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    struct Voter {
        bool authorized;
        bool voted;
        uint voteIndex;
    }

    address public owner;
    string public electionName;
    bool public electionEnded;
    
    string public winnerName;
    uint public winnerVoteCount;

    mapping(address => Voter) public voters;
    Candidate[] public candidates;

    event ElectionEnded(string winnerName, uint winnerVoteCount);

    modifier ownerOnly() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    constructor(string memory _name) {
        owner = msg.sender;
        electionName = _name;
        electionEnded = false;
    }

    function addCandidate(string memory _name) public ownerOnly {
        candidates.push(Candidate(_name, 0));
    }

    function authorizeVoter(address _voter) public ownerOnly {
        voters[_voter].authorized = true;
    }

    function vote(uint _voteIndex) public {
        require(!electionEnded, "Election already ended.");
        require(voters[msg.sender].authorized, "You are not authorized to vote.");
        require(!voters[msg.sender].voted, "You have already voted.");
        require(_voteIndex < candidates.length, "Invalid candidate index.");

        voters[msg.sender].voted = true;
        voters[msg.sender].voteIndex = _voteIndex;

        candidates[_voteIndex].voteCount++;
    }

     

    function getCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }

    function getTotalCandidates() public view returns (uint) {
        return candidates.length;
    }

    function getWinner() public view returns (string memory, uint) {
        require(electionEnded, "Election has not ended yet.");
        return (winnerName, winnerVoteCount);
    }
}
