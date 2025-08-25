// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {EIP7702StatelessDeleGator} from "../src/EIP7702/EIP7702StatelessDeleGator.sol";
import { IEntryPoint } from "@account-abstraction/interfaces/IEntryPoint.sol";
import { IDelegationManager } from "../src/interfaces/IDelegationManager.sol";

contract DeployPaymaster is Script {

    EIP7702StatelessDeleGator public paymaster;

    function setUp() public {}

    function run() public {

        uint256 deployer = vm.envUint("KEY");
        address delegation_manager = vm.envAddress("DelegationManager");
        address entrypoint = vm.envAddress("EntryPoint");

        vm.startBroadcast(deployer);
        paymaster = new EIP7702StatelessDeleGator(IDelegationManager(delegation_manager), IEntryPoint(entrypoint));

        vm.stopBroadcast();
    }
}