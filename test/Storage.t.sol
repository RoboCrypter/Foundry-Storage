// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;


import {Storage} from "../src/Storage.sol";
import {StorageScript} from "../script/Storage.s.sol";
import {Test, console} from "forge-std/Test.sol";


contract StorageTest is Test {

    Storage private storageContract;


    function setUp() external {

        StorageScript storageScript = new StorageScript();

        storageContract = storageScript.run();
    }


    function testInitiallyFavouriteNumberMustBeZero() external {

        assertEq(storageContract.getFavouriteNumber(), 0);
    }

    
    function testStoreFavouriteNumberMustStoreAFavouriteNumber() external {

        uint256 favouriteNumber = 5;

        storageContract.storeFavouriteNumber(favouriteNumber);

        assertEq(storageContract.getFavouriteNumber(), favouriteNumber);
    }


    function testAddPersonMustAddPersonAndItsFavouriteNumber() external {

        uint256 favouriteNumber = 100;

        string memory name = "robo";

        storageContract.addPerson(favouriteNumber, name);

        assertEq(storageContract.getMyFavouriteNumber(name), favouriteNumber);

        assertEq(storageContract.getNumberOfPeople(), 1);
    }
}