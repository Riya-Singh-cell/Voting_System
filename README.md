# Voting_System
# Blockchain Voting System

This project is a simple smart contract written in **Solidity** for conducting a decentralized and transparent election on the **Ethereum blockchain**. It allows an election owner to add candidates, authorize voters, and let voters cast votes. Once the election ends, the contract reveals the winner.

## Features

-  **Owner-Controlled Access**
  - Only the owner (deployer) can add candidates or authorize voters.

-  **Voter Authorization**
  - Only authorized users can vote.
  - One person = one vote.

-  **Vote Casting**
  - Votes are securely cast and stored.
  - Voters cannot vote more than once.

-  **Real-Time Candidate List**
  - Fetch the list of candidates and their vote counts anytime.

-  **Winner Declaration**
  - Winner is revealed once the election ends.

---

##  Contract Details

###  Structs
- **Candidate**: Stores name and vote count.
- **Voter**: Stores authorization status, voting status, and vote index.

###  Functions

| Function | Description |
|---------|-------------|
| `addCandidate(string)` | Adds a candidate (owner only) |
| `authorizeVoter(address)` | Authorizes a voter (owner only) |
| `vote(uint)` | Lets an authorized voter cast their vote |
| `getCandidates()` | Returns all candidate details |
| `getTotalCandidates()` | Returns the total number of candidates |
| `getWinner()` | Returns the winner name and vote count (after election ends) |

---

## How to Use

1. **Deploy** the contract with the election name.
2. **Add candidates** using `addCandidate`.
3. **Authorize voters** using `authorizeVoter`.
4. **Voters** cast their vote using `vote(index)`.
5. (Optional) Implement a function to **end election** and **calculate winner**.
6. Call `getWinner()` to view results.

---

##  Example

```solidity
Voting voting = new Voting("SRM Class Election");
voting.addCandidate("Alice");
voting.addCandidate("Bob");
voting.authorizeVoter(0x123...);
voting.vote(0); // Voter selects Alice
