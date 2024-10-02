// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import {Storage} from "../src/Storage.sol";
import {Script} from "forge-std/Script.sol";

contract StorageScript is Script {
    function run() external returns (Storage) {
        vm.startBroadcast();

        Storage storageContract = new Storage();

        vm.stopBroadcast();

        return storageContract;
    }
}
