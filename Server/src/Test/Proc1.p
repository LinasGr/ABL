
/*------------------------------------------------------------------------
    File        : Proc1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Mar 06 09:35:11 EST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

block-level on error undo, throw.
define variable CustomerName as character no-undo.
define variable CustomerNumber as integer no-undo initial 999.
/*define variable hProc as handle no-undo.*/
/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
assign
    CustomerNumber = 50
    CustomerName   = "UpwardSports"
    .
message 
    "Value of CustomerName is: " CustomerName 
    skip
    "Value of CustomerNumber is: " CustomerNumber view-as alert-box.
return.
