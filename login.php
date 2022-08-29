<?php 
session_start(); 

include "db_conn.php";
include "helper.php";

if (isset($_POST['uname']) && isset($_POST['password'])) {

    $uname = validate($_POST['uname']);

    $pass = validate($_POST['password']);

    if (empty($uname)) {

        header("Location: index.php?error=User Name is required");

        exit();

    }else if(empty($pass)){

        header("Location: index.php?error=Password is required");

        exit();

    }else{
        $sql = "SELECT Id, FirstName, Email, PasswordHash FROM user WHERE Email='$uname'";

        $result = mysqli_query($conn, $sql);
		
        if (mysqli_num_rows($result) === 1) {
			
            $row = mysqli_fetch_assoc($result);
			
			if (password_verify($pass, $row['PasswordHash'])) {

                echo "Logged in!";

                $_SESSION['email'] = $row['Email'];

                $_SESSION['name'] = $row['FirstName'];

                $_SESSION['id'] = $row['Id'];

                header("Location: home.php");

                exit();

            }else{

                header("Location: index.php?error=Incorect User name or password");

                exit();

            }

        }else{

            header("Location: index.php?error=Incorect User name or password");

            exit();

        }
		
		mysqli_close($conn);

    }

}else{

    header("Location: index.php");

    exit();

}