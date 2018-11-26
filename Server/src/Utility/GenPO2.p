
/*------------------------------------------------------------------------
    File        : GenPO2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Mar 06 10:11:03 EST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

block-level on error undo, throw.
define input parameter pCustomerNumber as integer no-undo.
define input-output parameter pPO as character no-undo.
define output parameter pStatus as character no-undo.
define variable sCustNum as character no-undo.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
run CreatePOString(input pCustomerNumber, output sCustNum).

assign
pPO = pPO + sCustNum
pStatus = "PO Assigned"
    .

return.

procedure CreatePOString:
    define input parameter pCustNum as integer no-undo.
    define output parameter pOutputString as character no-undo.

    pOutputString = string(pCustNum) + "-xx".

    return.
end procedure.
