<?php 

session_start();
include "db_conn.php";

if (isset($_SESSION['id']) && isset($_SESSION['name'])) {

 ?>

<!DOCTYPE html>

<html>

<head>

    <title>Blogs</title>

</head>

<body>

     <h1>Hello, <?php echo $_SESSION['name']; ?></h1>
	 
	 <form action="submit-blog.php" method="post">

        <h2>Blogs</h2>

        <?php		
		$sql = "SELECT Title, Content, PublishedAt, ImageUrl FROM post WHERE DeletedAt IS NULL AND IsPublished";
		$result = mysqli_query($conn, $sql);
		echo '<div>';
        while($post = mysqli_fetch_array($result))
		{			
			echo '<div> <label>ImageUrl: </label><img src="'.$post['ImageUrl'].'" /><br>';
			echo '<div> <label>Title: </label>'.$post['Title'].'<br>';
			echo '<div> <label>Content: </label>'.$post['Content'].'<br>';
			echo '<div> <label>PublishedAt: </label>'.$post['PublishedAt'].'<br><br>';					
		}
		echo '</div>';
		?>
		
	  <br />

     <a href="logout.php">Logout</a>

</body>

</html>

<?php 

}else{

     header("Location: index.php");

     exit();

}

 ?>