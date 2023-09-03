// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;


/**
*@title Storage contract
*@author M.Siddique
*@notice A basic storage contract
*/


contract Storage {

    // State Variables

    uint256 private s_favouriteNumber;

    mapping(string name => uint256 favouriteNumber) private s_myFavouriteNumber;

    struct Person {

        uint256 favouriteNumber;

        string name;
    }

    Person[] private s_listOfPeople;


    // Public & External Functions

    function storeFavouriteNumber(uint256 _favouriteNumber) external {

        s_favouriteNumber = _favouriteNumber;
    }
    

    function addPerson(uint256 _favouriteNumber, string memory _name) external {

        s_listOfPeople.push(Person(_favouriteNumber, _name));

        s_myFavouriteNumber[_name] = _favouriteNumber;
    }


    // View & Pure Functions

    function getFavouriteNumber() external view returns(uint256) {

        return s_favouriteNumber;
    }


    function getMyFavouriteNumber(string memory _name) external view returns(uint256) {

        return s_myFavouriteNumber[_name];
    }


    function getListOfPeople() external view returns(Person[] memory) {

        return s_listOfPeople;
    }


    function getNumberOfPeople() external view returns(uint256) {

        return s_listOfPeople.length;
    }
}