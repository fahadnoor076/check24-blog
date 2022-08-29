<?php 
session_start(); 

include "db_conn.php";
include "helper.php";

if (isset($_POST['title']) && isset($_POST['link']) && isset($_POST['content'])) {
	
    $title = validate($_POST['title']);

    $link = validate($_POST['link']);
	
    $content = validate($_POST['content']);

    if (empty($title)) {

        header("Location: add-blog.php?error=Title is required");

        exit();

    }else if (empty($link)) {

        header("Location: add-blog.php?error=Image link is required");

        exit();

    }else if (empty($content)) {

        header("Location: add-blog.php?error=Content is required");

        exit();

    }else{
		$loggedInUserId = $_SESSION['id'];
		$slug = str_replace(' ', '_', strtolower($title));
		$now = date("Y-m-d H:i:s");
		
        $sql = "INSERT INTO post (AuthorId, Title, Slug, IsPublished, CreatedAt, UpdatedAt, PublishedAt, ImageUrl, Content)
				VALUES ('$loggedInUserId', '$title', '$slug', '1', '$now', '$now', '$now', '$link', '$content')";
		
		if (mysqli_query($conn, $sql)) {
			
			echo "New record created successfully";
			die();
		
		} else {
			
			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
			die();
		}
		
		mysqli_close($conn);
		
    }

}