// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {HybridResolver} from "../src/IPCMResolver.sol";
import {ENS} from "../lib/ens-contracts/contracts/registry/ENS.sol";
import {INameWrapper} from "../lib/ens-contracts/contracts/wrapper/INameWrapper.sol";

contract DeployResolver is Script {
    HybridResolver public resolver;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        ENS ens = ENS(vm.envAddress("ENS_REGISTRY"));
        INameWrapper nameWrapper = INameWrapper(vm.envAddress("NAME_WRAPPER"));
        string memory url = vm.envString("GATEWAY_URL");
        address signer = vm.envAddress("SIGNER");
        address owner = vm.envAddress("OWNER");

        resolver = new HybridResolver(ens, nameWrapper, url, signer, owner);

        vm.stopBroadcast();
    }
}
