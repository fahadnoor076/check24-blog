<?php 

session_start();

if (isset($_SESSION['id']) && isset($_SESSION['name'])) {

 ?>

<!DOCTYPE html>

<html>

<head>

    <title>Add Blog</title>

</head>

<body>

     <h1>Hello, <?php echo $_SESSION['name']; ?></h1>
	 
	 <form action="submit-blog.php" method="post">

        <h2>Add Blog</h2>

        <?php if (isset($_GET['error'])) { ?>

            <p class="error"><?php echo $_GET['error']; ?></p>

        <?php } ?>

        <label>Title</label>

        <input type="title" name="title" placeholder="Title"><br>

        <label>Link</label>

        <input type="text" name="link" placeholder="Link"><br> 
		
		<label>Text</label>
		
		<textarea id="content" name="content" rows="4" cols="50">
		</textarea>
		
		<br>
		
		<input type="submit" name="btnADD" id="btnADD" value="ADD" onclick="this.disabled=true;this.value='Sending, please wait...';this.form.submit();" />

     </form>
	 

	  <br />

     <a href="list-blog.php">Blogs List</a> <br>
     <a href="logout.php">Logout</a>

</body>

</html>

<?php 

}else{

     header("Location: index.php");

     exit();

}

 ?>