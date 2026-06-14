// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BallenitaFCToken is ERC20 {

    address public owner;
    uint256 public maxSupplay;

    constructor() ERC20("Ballenita FC Token", "BFT") {
        owner = msg.sender;
        _mint(owner, 1000 * 10**18);
    }

    modifier isPropietario() {
        require(msg.sender == owner, "No eres el propietario");
        _;
    }

    //función mintear (colocar tokens a una cuenta)
    function mintear(address to, uint256 cantidad) public isPropietario{
        _mint(to, cantidad);
    }
    //minteamos 2000 tokens a la cuenta 3, por lo que se
    //realiza un EMISIÓN (crear más tokens y aumentar el totalSupply) 

    
    function esSocio(address cuenta) public view returns (bool) {
        return balanceOf(cuenta) > 0;
    }

}