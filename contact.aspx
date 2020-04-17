<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!--
 19FA-SWDV-131-001-Web Styling
 
 Author: Kait Low
 Date: 9/6/2019
 
 20SP-SWDV-210-001: Intro Server Side Programming 
 LAST MODIFIED: 2/7/2020

20SP-SWDV-235-001: Advanced Web App Development
LAST MODIFIED: 4/17/2020
 
 Version: 6
 
 Filename: contact.aspx
 
 Contact Page of Rising Sun Translations 
-->
<!DOCTYPE html>
<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "RSTrans"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC InsertVisitor @nameTextBox,@emailTextBox, @msgTextBox, @dropdown1, @checkbox ",conn);
            comm.Parameters.Add("@nameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@nameTextBox"].Value = name.Text;
            comm.Parameters.Add("@emailTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@emailTextBox"].Value = email.Text;
            comm.Parameters.Add("@msgTextBox", System.Data.SqlDbType.NChar, 200);
            comm.Parameters["@msgTextBox"].Value = message.Text;

            comm.Parameters.Add("@dropdown1", System.Data.SqlDbType.Int);
            comm.Parameters["@dropdown1"].Value = range.SelectedValue;
            comm.Parameters.Add("@checkbox", System.Data.SqlDbType.Bit);
            comm.Parameters["@checkbox"].Value = mailBack.Checked;


            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("thanks.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Rising Sun Translations Contact Us</title>
   
   <meta charset="utf-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   <meta name="keywords" content="rising sun translations, japanese to english, manga, novels, english subs" />
   <meta name="description" content="Contact us at Rising Sun Translations!" />
   <link href="css/style1.css" rel="stylesheet" media="all" />
   <link rel="shortcut icon" href="images/favicon-16x16.png" sizes="16x16" type="image/png" />
   <link rel="icon" href="images/favicon-32x32.png" sizes="16x16 32x32" type="image/png" /> 
   
</head>
<body>
    <main>
<header>		
	<div class="container">
	<div class="jumbotron">
		<figure>
			<img src="images/wave.jpg" alt="the great wave picture" />
		</figure>
	</div>
    </div>
	
	<nav class="horizontal"> <a id="navicon" href="#"><img src="images/navicon.png" alt=""/></a>
		<ul>
		<li><a href="index.html">Home</a></li>
		<li><a href="seriesList.html">Novel List</a></li>
		<li><a href="mangaList.html">Manga List</a></li>
		<%--<li><a href="contact.html">Contact</a></li>--%>
            <li><a href="contact.aspx">Contact</a></li> <%--EDITED FOR SWDV-235 DATE: 4/17/2020--%>
              <%--  <li><a href="login.php">Admin</a></li>--%>
		</ul>		
	</nav>
</header> 	
<article>
<h1>Rising Sun Translations</h1>
	<p>Want to help us create great content? You can! Your feedback not only helps us maintain the same quality, but we are
	also open to recommendations!</p>

  <form  runat="server">
	<fieldset>
	<legend>Contact Us!</legend>
<br />
        <div>
            <label for="name">Name<span style="color: #BC002D">*</span></label>
          <%--  <input name="name" id="name" type="text" required/>--%>
            <asp:TextBox ID="name" runat="server" />
        </div>
		
<br />
        <div>
            <label for="email">Email<span style="color: #BC002D">*</span></label>
           <%-- <input name="email" id="mail" type="email" required/>--%>
            <asp:TextBox ID="email" runat="server" />
        </div>
		
<br />
        <div>
            <label for="rate"><span style="color: #BC002D"><strong>How would you rate our content?</strong></span><br /> </label>
           <%-- (0=poor; 10=great)<br /> 
            0--%>
            <%--<input name="rate" id="rangeBox" type="range" value="5" step="1" min="0" max="10" />--%>
            <asp:DropDownList ID="range" runat="server">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
          <%--  10--%>
        </div>
<br />		
        <div>
            <label for="message"><span style="color: #BC002D"><strong>Give us your feedback!</strong></span></label> <br />
           <%-- <textarea name="message" id="commBox"></textarea>--%>
            <asp:TextBox ID="message" runat="server" Height="100px" Width="200px" />

        </div>
<br />
        <div>	
           <%-- <input name="mailBack" id="mailRec" value="yes" type="checkbox" />--%>
            <asp:CheckBox ID="mailBack" runat="server"></asp:CheckBox>
            <label>Would you like to receive updates on new content ? </label>
        </div>
	
    </fieldset>
		<div id="buttons">
                 <%--   <input id="submitButton" name="Submit" type="submit" value="Submit" />--%>
           <asp:Button ID="submitButton" runat="server"
                    Text="Submit" onclick="submitButton_Click" />
                 <%--   <input type="reset" value="Reset" />--%>
            <asp:Button ID="resetButton" runat="server" Text="Reset" />
            <br />
                 <asp:Label ID="dbErrorMessage" runat="server" Text=""></asp:Label>
        </div>
</form>
</article>
<footer>
	<p>Follow us on Facebook and Instagram!</p>
<a href="https://www.facebook.com/" target="_blank" ><img id="mediaLink" src="images/facebook.png" alt="Facebook" /></a> 
<a href="https://www.instagram.com/" target="_blank" ><img  src="images/instagram.png" alt="Instagram" /></a>
</footer>
</main>
</body>
</html>