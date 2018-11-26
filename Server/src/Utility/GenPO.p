
/*------------------------------------------------------------------------
    File        : GenPO.p
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

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
assign
    pPO     = pPO + string(pCustomerNumber) + "-xx"
    pStatus = "PO Assigned"
    .
return.