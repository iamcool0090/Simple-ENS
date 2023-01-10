// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


//UNDOCUMENTED VERSION-UNSHARDED VERSION-SINGLE RESOLVER
//v=0.0.1 



contract sns{

address[] add ;
bytes32[] nick;
bool avail = true;
address owner;
address[] resolvers;
uint price = 370000;




    
    

function assign_resolver(address add) public pure returns(uint8){
    uint8 sum = 0;
    bytes memory ad = abi.encodePacked(add);
    for(uint i = 0;i<ad.length;i++){
        sum = sum + (uint8(ad[i])%12);
            
            
    }

        
    if(sum < 12){return sum;}
    else{return sum%12;}
        


}

function SelfregisterDom(string memory name) public payable{

        
        bytes memory whatBytes = bytes(".uwu");
        bytes memory whereBytes = bytes(name);
        bytes memory dot = bytes(".");
        
        uint dot_count = 0;
        uint j = 0;
 

 
        
        for(uint i = 0;i<whereBytes.length;i++){
            if(whereBytes[i] == dot[0]){
                dot_count++;
            }
            if(i >= whereBytes.length - 4)
            {
                if(whatBytes[j] != whereBytes[i]){
                
                    revert("Domain names must end with .uwu ");
                }
                j++;

            }
        }

        if(dot_count != 1){
            revert("Domain name using Multiple period(.)");
        }

        
        
        
        bytes32 ha_name;
        

        ha_name = keccak256(abi.encodePacked(name));

        if(add.length == 0){owner = msg.sender;}

        if(add.length != 0){
            for(uint i=0; i<add.length; i++){
                if(ha_name == nick[i]){
                    avail = false;

                }

            }

        }

        

        if(avail){
        require(msg.value >= 1 gwei * price, "Please complete your payment!");
        add.push(msg.sender);
        nick.push(ha_name);

        }
        else{
            revert("Domain not available!");
        }



    }

    function resolve(string memory gnick) public view returns(address){
        uint i;
        bool found = false;
        bytes32 has_name = keccak256(abi.encodePacked(gnick));

        bytes memory whatBytes = bytes(".uwu");
        bytes memory whereBytes = bytes(gnick);

        


 
        uint j = 0;
        for(i = 0;i<whereBytes.length;i++){
            if(i >= whereBytes.length - 4)
            {
                if(whatBytes[j] != whereBytes[i]){
                
                    revert("Domain names must end with .uwu ");
                }
                j++;
                

            }
        }

        for(i=0; i<add.length; i++){
            if(has_name == nick[i]){
                found = true;
                break;

            }
        }
        if(found){
            return add[i];
        }

        else{
            revert("Name cannot be resolved! Reason : Does not exist");
        }
        


    }
    function withdraw() public {
        if(msg.sender == owner){
            payable(msg.sender).transfer(address(this).balance);

        }
        else{
            revert("Function can only be called by owner!");
        }
        
    }

    function transfer_ownership(address new_owner) public{
        require(msg.sender == owner);
        owner = new_owner;

    }

    function transfer_domain(string memory dom , address to_add) public {
        uint256 i;
        bool found = false;
        bytes32 has_name = keccak256(abi.encodePacked(dom));
        for(i=0; i<nick.length; i++){
            if(has_name == nick[i]){
                found = true;
                break;

            }

        }
        if(found){
            require(msg.sender == add[i], "You do not own the domain!");
            add[i] = to_add;

        }

        else{
            revert("Please try again after some time!");
        }


        

        
               

        
 

     

    }

    function change_price(uint new_price) public{
        require(msg.sender == owner);
        price = new_price;
    }

    


    

}



