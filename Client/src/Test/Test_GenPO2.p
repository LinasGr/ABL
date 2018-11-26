
/*------------------------------------------------------------------------
    File        : Test_GenPO2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Mar 06 10:18:00 EST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

block-level on error undo, throw.
define variable CustomerNumber as integer   no-undo initial 999.
define variable POValue        as character no-undo initial "PO-AA-".
define variable POStatus       as character no-undo.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
run Utility/GenPO2(input CustomerNumber,
    input-output POValue,
    output POStatus).


message "New PO is: " POValue skip
    "Status returned is: " POStatus
    view-as alert-box.

return.
    