 
 /*------------------------------------------------------------------------
    File        : Department
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Admin
    Created     : Mon Mar 06 16:12:32 EST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using Sandbox.TestClasses.Employee.

block-level on error undo, throw.

class Sandbox.TestClasses.Department: 

    define public property DeptName as character no-undo 
    get.
    private set. 

    define public property ExpenseCode as character no-undo 
    get.
    private set. 

    define private variable NextEmployeeIndex as integer no-undo initial 1.
    
    define private variable Employees as Employee extent no-undo.
    
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
        
    constructor public Department ( input pDeptName as character,
        input pMaxNumEmployees as integer,
        input pExpenseCode as character
     ):
        super ().
        
    end constructor.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    method public void AddEmployee( input pEmployee as Employee  ):
        
        return.

    end method.

    method public void AddEmployee( input pEmpNum as integer,
        input pFirstName as character,
        input pLastName as character,
        input pAddress as character,
        input pPostalCode as character,
        input pPhones as character extent 3,
        input pVacationHours as integer,
        input pJobTitle as character
  ):
        
        return.

    end method.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    method public integer GetLastEmployeeNumber(  ):
        
        define variable result as integer no-undo.

        return result.

    end method.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    method public integer NumberEmployees(  ):
        
        define variable result as integer no-undo.

        return result.

    end method.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    method public Sandbox.TestClasses.Employee GetEmployee(input pIndex as integer  ):
        
        define variable result as Sandbox.TestClasses.Employee no-undo.

        return result.

    end method.
    
    destructor public Department ( ):

    end destructor.

end class.