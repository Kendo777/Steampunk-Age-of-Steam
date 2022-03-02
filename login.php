<?php
require_once("mySqli.php");
if(isset($_POST['user']) && isset($_POST['password']))
{
	$user = mysql_fix_string($mySqli,$_POST['user']);
	$password = mysql_fix_string($mySqli,$_POST['password']);


	$sql= $mySqli->prepare("SELECT * FROM users WHERE user=? OR email=?");
	$sql->bind_param("ss",$user,$user);
	$sql->execute();

	$result=$sql->get_result();

	if($result->num_rows>0)
	{
	    $row=$result->fetch_assoc(); //put the results into a row

	    if(password_verify($password,$row['password'])){
		    if($user == "SteampunkAgeOfSteam")
		    {
		        //passwords match
		        session_start(); //login ok, start session and save session-variables
		        $_SESSION['admin']=$row['user'];
		        //$_SESSION['name']=$row['firstname'].' '.$row['lastname'];
		        //$_SESSION['starttime']=date('H:i:s');
		        header('location:admin/index.php'); //to index.php -> session isset now!
		    }
		    else if($row['valid']==0)
		    {
		    	//session_start();
		        $_SESSION['user']=$row['user'];
		        header('location:index.php');
		    }
		    else
		    {
		    	$errorMsg.='<p class="alert alert-danger">Please verify the acount clicking in the link that we sended to your mail</p>';
		    	require_once("mail/mail.php");
				sendEmail($row['email'], $row['user'], "registration", $row['valid']);
		    }
		}
		else
		{
			$errorMsg.='<p class="alert alert-danger">User name, email or password not valid</p>';
		}
    
	}
	else
	{
		$errorMsg.='<p class="alert alert-danger">User name, email or password not valid</p>';
	}
}
else if(isset($_POST['forgotPassword']) && $_POST['forgotPassword']!="")
{
	$post = mysql_fix_string($mySqli,$_POST['forgotPassword']);
	$sql= $mySqli->prepare("SELECT * FROM users WHERE email=?");
	$sql->bind_param("s",$post);
	$sql->execute();
	$result=$sql->get_result();

	if($result->num_rows>0)
	{
		$row=$result->fetch_assoc(); //put the results into a row
		$validationCode = "";
		for($i=0; $i<4; $i++)
		{
			$validationCode.=random_int(0, 9);
		}

		$sql= $mySqli->prepare("UPDATE users SET valid=? WHERE email=?");
		$sql->bind_param("ss",$validationCode,$post);
		$sql->execute();
		require_once("mail/mail.php");
		sendEmail($row['email'], $row['user'], "forgot", $validationCode);
	}
	else
	{
		$errorMsg.='<p class="alert alert-danger">Email not valid</p>';
	}
}
if(isset($errorMsg)) echo $errorMsg;
?>
<div class="row justify-content-md-center">
  <div class="col-md-auto">
<h3>Steampunk Age of Steam - Login</h3>
<form method='post' action='index.php?page=login'>
	<div class="form-group">
		<label>User or Email</label>
		<input type='text' class="form-control" name='user'><br>
	</div>
	<div class="form-group">
		<label>Password</label>
		<input type='password' class="form-control" name='password'>
	</div>
    <button type="submit" class="btn btn-primary">Login</button>
</form><br><br>
<p class="alert alert-info">If you have not registered as user, you can do it
    <a href="index.php?page=register">here</a></p>

<p class="alert alert-danger">Forgot the password? Change it <a href="index.php?page=verification">here</a></p>
</div>
</div>