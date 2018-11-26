
/*------------------------------------------------------------------------
    File        : GenPOProcs.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Mar 06 10:53:31 EST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

block-level on error undo, throw.

procedure GenPOFromCustNum:
    define input parameter pCustomerNumber as integer no-undo.
    define input-output parameter pPO as character no-undo.
    define output parameter pStatus as character no-undo.
    
    assign
        pPO     = pPO + string(pCustomerNumber) + "-xx"

        pStatus = "PO Assigned using CustomerNumber"
        .
        
     return.
end procedure.

procedure GenPOFromCustName:
    define input parameter pCustomerName as character no-undo.
    define input-output parameter pPO as character no-undo.
    define output parameter pStatus as character no-undo.

    assign
        pPO     = pPO + pCustomerName + "-xx"
        pStatus = "PO Assigned using CustomerName"
        .

    return.
end procedure.
