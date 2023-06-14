// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


contract paitentRecord{

  struct doctorDetails {
        uint256 doctorID;
        string doctorName;
        string qualification;
        string workPlaceAddress;
      
         }

         struct PaitentRegister {
        
        uint256 paitentID;
        string paitentName;
        string Age;
        string diseaseName;
        uint256 medicine;
       
      }

    uint  doctorCount;
    uint  paitentCount;
    uint  medicineCount;
     address doctorAddress;
     address paitentAddress;
   
     mapping(address => doctorDetails)  doctors;
     mapping(address => PaitentRegister )  paitents;



       modifier onlyDoctor() {
          require(msg.sender == doctorAddress, "Only allowed for doctors");
        _;
    }


       modifier onlyPaitent() {
          require(msg.sender == paitentAddress, "Only allowed for paitent");
        _;
    }

  

   












 //writeFunction
  
    function registerDoctor(

    string memory _doctorName,
    string memory _qualification, 
    string memory _workPlaceAddress) 
    public {
    
  

        doctorCount++;
   
        doctors[msg.sender].doctorID = doctorCount;
        doctors[msg.sender].doctorName = _doctorName;
        doctors[msg.sender].qualification = _qualification;
        doctors[msg.sender].workPlaceAddress = _workPlaceAddress;

    }

    

     
    //readFunction
    
    function  viewDoctorByID(uint256 _doctorID) public view 
    returns(
     
        string memory _doctorName,
        string memory _qualification, 
        string memory _workPlaceAddress)


        {
        
        require(_doctorID <= doctorCount, "Invalid doctor ID");
         
         return(

        
        doctors[msg.sender].doctorName,
        doctors[msg.sender].qualification,
        doctors[msg.sender].workPlaceAddress
        
         );
         
         }







   
   




 //register new paitent

    //write Function

     function registerPaitent(
        
         string memory _paitentName, 
         string memory _Age ) public {
       
        
             paitentCount++;
  


        paitents[msg.sender].paitentID = paitentCount;
        paitents[msg.sender].paitentName = _paitentName;
        paitents[msg.sender].Age = _Age;
        paitents[msg.sender].diseaseName = "";
        paitents[msg.sender].medicine = 0;

       


     }


       
    //readFunction
    
    function  viewPaitentByDoctor(uint256 _paitentID) public view
    returns(
         
        string memory _paitentName,
        string memory _Age 
        )
        {

            require(_paitentID <= paitentCount, "Invalid paitent ID");
         
         return(

        
        paitents[msg.sender].paitentName,
        paitents[msg.sender].Age
       
 );

  }


      

      






  //Register disease

       function addNewDisease(
        
         string memory _diseaseName
          ) public {
       
        
             
        PaitentRegister  storage paitent = paitents[msg.sender]; 

        // paitents[paitentCount].paitentID = paitentCount;
        
        paitent.diseaseName = _diseaseName;
      
       
       


     }

     function  viewRecord() public view
    returns(
        uint256  _paitentID,
        string memory _paitentName,
        string memory _Age,
        string memory _diseaseName
        )
        
         onlyPaitent()

        {

             require(_paitentID <= paitentCount, "Invalid paitent ID");
         
         return(

        paitents[msg.sender].paitentID,
        paitents[msg.sender].paitentName,
        paitents[msg.sender].Age,
        paitents[msg.sender].diseaseName
       
   );

  }

    

        











      struct registerMedicine {
        
        uint256 medicineID;
        string medicineName;
        string expiryDate;
        string Dose;
        uint256 Price;
       
      }
      

       mapping(uint256 => registerMedicine) public medicines;

       function addMedicine (
       
        
        string memory _medicineName,
        string memory _expiryDate,
        string memory _Dose,
        uint256 _Price




       )public {


        medicineCount++;
        medicines[medicineCount].medicineID = medicineCount;
        medicines[medicineCount].medicineName = _medicineName;
        medicines[medicineCount].expiryDate = _expiryDate;
        medicines[medicineCount].Dose = _Dose;
        medicines[medicineCount].Price = _Price;
        }




        function viewMedicine (
       
        
        uint256 _medicineID




       )public view returns (
        string memory _medicineName,
        string memory _expiryDate,
        string memory _Dose,
        uint256 _Price

       ) {
        require(_medicineID <= medicineCount, "Invalid medicine ID");

        return(
        medicines[_medicineID].medicineName, 
        medicines[_medicineID].expiryDate ,
        medicines[_medicineID].Dose ,
        medicines[_medicineID].Price );  }

      
     function prescribeMedicine (
       
        uint _medicineID,
        address _Paitent
   
       )
       
       
       public onlyDoctor() {


        paitents[msg.sender].medicine = _medicineID;
        
 }


     

     function viewPrescribedMedicine (
       
      address _Paitent
   
       )
       
       
       public view returns (uint) {

       return ( paitents[msg.sender].medicine  );
       
        

 }

   function updateAge (
       
      string memory _newAge 
   
       )
       
       
       public {

       
        paitents[msg.sender].Age = _newAge;
        

 }

       





       }
