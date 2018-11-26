 /*------------------------------------------------------------------------
    File        : EditLineForm
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : linas
    Created     : Thu Nov 22 13:45:58 EET 2018
    Notes       : 
  ----------------------------------------------------------------------*/
using Progress.Windows.Form.
  
block-level on error undo, throw.
class EditLineForm inherits Form : 

    define private variable button_Recalculate as System.Windows.Forms.Button no-undo.
    define private variable components as System.ComponentModel.IContainer no-undo.
    define private variable buttonOk as System.Windows.Forms.Button no-undo.
    define private variable buttonCancel as System.Windows.Forms.Button no-undo.
    define private variable label4 as System.Windows.Forms.Label no-undo.
    define private variable textBox_ExtendedPrice as System.Windows.Forms.TextBox no-undo.
    define private variable textBox_Quantity as System.Windows.Forms.TextBox no-undo.
    define private variable textBox_Price as System.Windows.Forms.TextBox no-undo.
    define private variable textBox_Discount as System.Windows.Forms.TextBox no-undo.
    define private variable label3 as System.Windows.Forms.Label no-undo.
    define private variable label2 as System.Windows.Forms.Label no-undo.
    define private variable label1 as System.Windows.Forms.Label no-undo.
    define private variable OrderNo as character no-undo.
    define private variable LineNo as character no-undo.
    define buffer bOrderLines for OrderLine.
    
    constructor public EditLineForm(ipcOrderNo as character, ipcLineNo as character ):
    
        super().
        InitializeComponent ( ).
        assign
         OrderNo=ipcOrderNo
         LineNo=ipcLineNo
        .
        InitialyzeData().
        RecalculateDiscount().
        catch e as Progress.Lang.Error:
            undo, throw e.
        end catch.        
    end constructor.

    destructor public EditLineForm( ):

        if valid-object(components) then do:
            cast(components, System.IDisposable):Dispose().
        end.

    end destructor.    

	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	method private void button_Recalculate_Click( input sender as System.Object, input e as System.EventArgs ):
	    RecalculateDiscount().
		return.

	end method.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    method public void InitialyzeData(  ):
        
        find first bOrderLines where bOrderLines.Ordernum=integer(OrderNo) and bOrderLines.Linenum=integer(LineNo)
        no-lock no-error.
         
        textBox_Price:Text=string(bOrderLines.Price).
        textBox_Discount:Text=string(bOrderLines.Discount).
        textBox_Quantity:Text=string(bOrderLines.Qty).
        
        return.

    end method.

    method private void okButton_Click (sender as System.Object, e as System.EventArgs):
        find first bOrderLines where bOrderLines.Ordernum=integer(OrderNo) and bOrderLines.Linenum=integer(LineNo)
        exclusive-lock no-error.
        bOrderLines.Discount=integer(textBox_Discount:Text).
        bOrderLines.Price=decimal(textBox_Price:Text).
        bOrderLines.Qty=integer(textBox_Quantity:Text).
        validate bOrderLines.
        
        this-object:DialogResult = System.Windows.Forms.DialogResult:Ok.
        this-object:Close ( ). 
    end method.

    method private void cancelButton_Click (sender as System.Object, e as System.EventArgs):
        this-object:DialogResult = System.Windows.Forms.DialogResult:Cancel.
        this-object:Close ( ).
    end method.
    
    method private void InitializeComponent ( ):

        /* NOTE: The following method is automatically generated.
           
           We strongly suggest that the contents of this method only be modified using the 
           Visual Designer to avoid any incompatible modifications.
           
           Modifying the contents of this method using a code editor will invalidate any support for this file. */
        
        this-object:buttonOk = new System.Windows.Forms.Button().
        this-object:buttonCancel = new System.Windows.Forms.Button().
        this-object:label1 = new System.Windows.Forms.Label().
        this-object:label2 = new System.Windows.Forms.Label().
        this-object:label3 = new System.Windows.Forms.Label().
        this-object:textBox_Price = new System.Windows.Forms.TextBox().
        this-object:textBox_Quantity = new System.Windows.Forms.TextBox().
        this-object:textBox_Discount = new System.Windows.Forms.TextBox().
        this-object:textBox_ExtendedPrice = new System.Windows.Forms.TextBox().
        this-object:label4 = new System.Windows.Forms.Label().
        this-object:button_Recalculate = new System.Windows.Forms.Button().
        this-object:SuspendLayout().
        /*  */
        /* buttonOk */
        /*  */
        define variable nestedvar0 as System.Windows.Forms.AnchorStyles no-undo.
        nestedvar0 = System.Windows.Forms.AnchorStyles:Bottom.
        this-object:buttonOk:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar0, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        this-object:buttonOk:Location = new System.Drawing.Point(129, 224).
        this-object:buttonOk:Name = "buttonOk".
        this-object:buttonOk:Size = new System.Drawing.Size(75, 23).
        this-object:buttonOk:TabIndex = 0.
        this-object:buttonOk:Text = "OK".
        this-object:buttonOk:UseCompatibleTextRendering = true.
        this-object:buttonOk:Click:Subscribe(this-object:okButton_Click).
        /*  */
        /* buttonCancel */
        /*  */
        define variable nestedvar1 as System.Windows.Forms.AnchorStyles no-undo.
        nestedvar1 = System.Windows.Forms.AnchorStyles:Bottom.
        this-object:buttonCancel:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar1, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        this-object:buttonCancel:DialogResult = System.Windows.Forms.DialogResult:Cancel.
        this-object:buttonCancel:Location = new System.Drawing.Point(213, 224).
        this-object:buttonCancel:Name = "buttonCancel".
        this-object:buttonCancel:Size = new System.Drawing.Size(75, 23).
        this-object:buttonCancel:TabIndex = 1.
        this-object:buttonCancel:Text = "Cancel".
        this-object:buttonCancel:UseCompatibleTextRendering = true.
        this-object:buttonCancel:Click:Subscribe(this-object:cancelButton_Click).
        /*  */
        /* label1 */
        /*  */
        this-object:label1:Location = new System.Drawing.Point(20, 15).
        this-object:label1:Name = "label1".
        this-object:label1:Size = new System.Drawing.Size(100, 23).
        this-object:label1:TabIndex = 2.
        this-object:label1:Text = "Price".
        this-object:label1:UseCompatibleTextRendering = true.
        /*  */
        /* label2 */
        /*  */
        this-object:label2:Location = new System.Drawing.Point(20, 43).
        this-object:label2:Name = "label2".
        this-object:label2:Size = new System.Drawing.Size(100, 23).
        this-object:label2:TabIndex = 3.
        this-object:label2:Text = "Quantity".
        this-object:label2:UseCompatibleTextRendering = true.
        /*  */
        /* label3 */
        /*  */
        this-object:label3:Location = new System.Drawing.Point(20, 68).
        this-object:label3:Name = "label3".
        this-object:label3:Size = new System.Drawing.Size(100, 23).
        this-object:label3:TabIndex = 4.
        this-object:label3:Text = "Discount".
        this-object:label3:UseCompatibleTextRendering = true.
        /*  */
        /* textBox_Price */
        /*  */
        this-object:textBox_Price:Location = new System.Drawing.Point(126, 12).
        this-object:textBox_Price:Name = "textBox_Price".
        this-object:textBox_Price:Size = new System.Drawing.Size(127, 22).
        this-object:textBox_Price:TabIndex = 5.
        /*  */
        /* textBox_Quantity */
        /*  */
        this-object:textBox_Quantity:Location = new System.Drawing.Point(126, 40).
        this-object:textBox_Quantity:Name = "textBox_Quantity".
        this-object:textBox_Quantity:Size = new System.Drawing.Size(127, 22).
        this-object:textBox_Quantity:TabIndex = 6.
        /*  */
        /* textBox_Discount */
        /*  */
        this-object:textBox_Discount:Location = new System.Drawing.Point(126, 68).
        this-object:textBox_Discount:Name = "textBox_Discount".
        this-object:textBox_Discount:Size = new System.Drawing.Size(127, 22).
        this-object:textBox_Discount:TabIndex = 7.
        /*  */
        /* textBox_ExtendedPrice */
        /*  */
        this-object:textBox_ExtendedPrice:Location = new System.Drawing.Point(126, 97).
        this-object:textBox_ExtendedPrice:Name = "textBox_ExtendedPrice".
        this-object:textBox_ExtendedPrice:Size = new System.Drawing.Size(127, 22).
        this-object:textBox_ExtendedPrice:TabIndex = 8.
        /*  */
        /* label4 */
        /*  */
        this-object:label4:Location = new System.Drawing.Point(20, 96).
        this-object:label4:Name = "label4".
        this-object:label4:Size = new System.Drawing.Size(100, 23).
        this-object:label4:TabIndex = 9.
        this-object:label4:Text = "Extanded price".
        this-object:label4:UseCompatibleTextRendering = true.
        /*  */
        /* button_Recalculate */
        /*  */
        this-object:button_Recalculate:Location = new System.Drawing.Point(151, 125).
        this-object:button_Recalculate:Name = "button_Recalculate".
        this-object:button_Recalculate:Size = new System.Drawing.Size(75, 23).
        this-object:button_Recalculate:TabIndex = 10.
        this-object:button_Recalculate:Text = "Recalculate".
        this-object:button_Recalculate:UseCompatibleTextRendering = true.
        this-object:button_Recalculate:UseVisualStyleBackColor = true.
        this-object:button_Recalculate:Click:Subscribe(this-object:button_Recalculate_Click).
        /*  */
        /* EditLineForm */
        /*  */
        this-object:AcceptButton = this-object:buttonOk.
        this-object:CancelButton = this-object:buttonCancel.
        this-object:ClientSize = new System.Drawing.Size(302, 261).
        this-object:Controls:Add(this-object:button_Recalculate).
        this-object:Controls:Add(this-object:label4).
        this-object:Controls:Add(this-object:textBox_ExtendedPrice).
        this-object:Controls:Add(this-object:textBox_Discount).
        this-object:Controls:Add(this-object:textBox_Quantity).
        this-object:Controls:Add(this-object:textBox_Price).
        this-object:Controls:Add(this-object:label3).
        this-object:Controls:Add(this-object:label2).
        this-object:Controls:Add(this-object:label1).
        this-object:Controls:Add(this-object:buttonCancel).
        this-object:Controls:Add(this-object:buttonOk).
        this-object:FormBorderStyle = System.Windows.Forms.FormBorderStyle:FixedDialog.
        this-object:MaximizeBox = false.
        this-object:MinimizeBox = false.
        this-object:Name = "EditLineForm".
        this-object:ShowInTaskbar = false.
        this-object:StartPosition = System.Windows.Forms.FormStartPosition:CenterParent.
        this-object:Text = "EditLineForm".
        this-object:ResumeLayout(false).
        this-object:PerformLayout().
        catch e as Progress.Lang.Error:
            undo, throw e.
        end catch.
    end method. 
 
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    method public void RecalculateDiscount(  ):
                define variable iQty as integer no-undo.
        define variable dPrice as decimal no-undo.
        define variable iDiscount as integer no-undo.
        assign
          iQty=integer(textBox_Quantity:Text)
          dPrice=decimal(textBox_Price:Text)
          iDiscount=integer(textBox_Discount:Text)
        .
        textBox_ExtendedPrice:Text=string(iQty * dPrice * (1 - (iDiscount / 100))).
        return.

    end method.

    method public void ShowModalDialog(  ):
        
        wait-for this-object:ShowDialog().

    end method.


 
end class.
