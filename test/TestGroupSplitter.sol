pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/GroupSplitter.sol";


contract TestGroupSplitter {

    function testFirstParticipantIsDeployer() {
        GroupSplitter splitter = GroupSplitter(DeployedAddresses.GroupSplitter());

        Assert.equal(tx.origin, splitter.participants(0),  "First participant should be the deployer");
    }

    function testAddParticipant() {
        GroupSplitter splitter = new GroupSplitter();

        address expected = 0x003cf652081b2a13a668ec35e53b30e1692fd426e8;

        splitter.addParticipant(expected);
        address actual = splitter.participants(1);

        Assert.equal(expected, actual, "Added participant is last");
    }
}
