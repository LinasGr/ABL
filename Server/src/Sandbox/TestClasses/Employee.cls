 
 /*------------------------------------------------------------------------
    File        : Employee
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Admin
    Created     : Mon Mar 06 15:43:50 EST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

block-level on error undo, throw.

class Sandbox.TestClasses.Employee: 

    define public property FirstName as character no-undo 
    get.
    private set. 

    define public property LastName as character no-undo 
    get.
    private set. 

    define public property JobTitle as character no-undo 
    get.
    private set. 

    define public property EmpNum as integer no-undo 
    get.
    private set. 

    define public property VacationHours as integer no-undo 
    get.
    private set. 

    define public property Address as character no-undo 
    get.
    set. 

    define public property PostalCode as character no-undo 
    get.
    set(input arg as character):
                
    end set.

    define public property PhoneNumbers as character extent 3 no-undo 
    get(input idx as integer):
         return PhoneNumbers[idx].
    end get.
    set(input arg as character, input idx as integer):
        PhoneNumbers[idx] = arg.        
    end set.
          

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    constructor public Employee (  ):
        super ().
        
    end constructor.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    method public void Initialize( input pEmpNum as integer,
        input pFirstName as character,
        input pLastName as character,
        input pAddress as character,
        input pPostalCode as character,
        input pPhones as character extent 3,
        input pVacationHours as integer,
        input pJobTitle as character  ):
        
        return.

    end method.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    method public void SetVacationHours( input pHours as integer ):
        
        return.

    end method.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    method public void SetJobTitle( input pJobTitle as character ):
        
        return.

    end method.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    method public character GetInfo(  ):
        
        define variable result as character no-undo.

        return result.

    end method.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    method private character GetName(  ):
        
        define variable result as character no-undo.

        return result.

    end method.    

end class.