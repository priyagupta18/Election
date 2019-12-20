pragma solidity ^0.5.0;

contract Election{
    struct Candidate{
        uint id;
        string name;
        uint votecount;

    }
    mapping (address => bool) public voters;
    mapping(uint=> Candidate) public candidates;
    uint public candidateCount;

    constructor() public {
        addCandidate("candidate 1");
        addCandidate("candidate 2");
    }

    function addCandidate(string memory _name) private{
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount,_name,0);
    }

    function vote(uint _candidateid) public {
        require(!voters[msg.sender]);
        require(_candidateid > 0 && _candidateid <= candidateCount);
        voters[msg.sender] = true;
        candidates[_candidateid].votecount++;
    }
}