<?php
    ob_start();
?>

<!DOCTYPE html>
<html>
<?php
require_once("mySqli.php");
session_start();
$errorMsg="";
$page="home";
if(isset($_GET["page"]))
{
    if($_GET['page']=="logout")
    {
        session_destroy();
        header('location:index.php');
    }
    else
    {
        $page = $_GET["page"];
    }
}
if(isset($_GET['item']))
    $id = mysql_fix_string($mySqli,$_GET['item']);

$sql= $mySqli->prepare("SELECT * FROM orders WHERE paid=0");
$sql->execute();
$result=$sql->get_result();

for ($i=0; $i <$result->num_rows; $i++) { 
    $row = $result->fetch_assoc();
    if($row['paid']==0)
    {
        $orderDate = new DateTime($row['date']);
        $currentTime = new DateTime(date("Y-m-d H:i:s"));
        $diff = $orderDate->diff($currentTime);
        $minutes = $diff->days * 24 * 60;
        $minutes += $diff->h * 60;
        $minutes += $diff->i;
        if($minutes>30)
        {
            $itemId = $row['itemId'];
            $cuantity = $row['cuantity'];
            $sqlAux= $mySqli->prepare("UPDATE items SET stock=stock+? WHERE itemId=?");
            $sqlAux->bind_param("ii",$cuantity,$itemId);
            $sqlAux->execute();

            $sqlAux= $mySqli->prepare("DELETE FROM orders WHERE orderId=?");
            $orderId = $row['orderId'];
            $sqlAux->bind_param("i",$orderId);
            $sqlAux->execute();
        }
    }
}

if(isset($_POST['addCart']))
{
  $sql= $mySqli->prepare("SELECT * FROM items WHERE itemId=?");
  $sql->bind_param("i",$id);
  $sql->execute();
  $result=$sql->get_result();
  $rowAux = $result->fetch_assoc();

  if($rowAux['stock']>0)
  {
    $date = date("Y-m-d H:i:s");

    $sql= $mySqli->prepare("SELECT * FROM orders WHERE itemId=? AND user=? AND paid=0");
    $sql->bind_param("is",$id,$_SESSION['user']);
    $sql->execute();
    $result=$sql->get_result();

      $totalPrize = $rowAux["prize"];
    if($result->num_rows>0)
    {
      $row=$result->fetch_assoc();
      $sql= $mySqli->prepare("UPDATE orders SET cuantity = cuantity + 1, totalPrize=totalPrize + ?, date=? WHERE orderId=?");
      $sql->bind_param("dsi",$totalPrize,$date,$row['orderId']);
    }
    else
    {
      $totalPrize+=$rowAux["extra"];
      $sql= $mySqli->prepare("INSERT INTO orders(itemId, user, cuantity, totalPrize, date) VALUES (?,?,1,?,?)");
      $sql->bind_param("isds",$id,$_SESSION['user'],$totalPrize,$date);
    }
      $sql->execute();
      $result=$sql->get_result();

      $sql= $mySqli->prepare("UPDATE items SET stock = stock - 1 WHERE itemId=?");
      $sql->bind_param("i",$id);
      $sql->execute();


    $sql= $mySqli->prepare("SELECT * FROM orders WHERE user=? AND paid=0");
    $sql->bind_param("s",$_SESSION['user']);
    $sql->execute();
    $result=$sql->get_result();
    for ($i=0; $i <$result->num_rows; $i++) { 
      $row=$result->fetch_assoc();
      
      $sql= $mySqli->prepare("UPDATE orders SET date=? WHERE orderId=?");

      $sql->bind_param("si",$date,$row['orderId']);
      $sql->execute();

    }
}
else
{
  $errorMsg='<p class="alert alert-danger">Error</p>';
}

}
?>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Steampunk Age of Steam</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/style4.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

    <!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
        function toggleFunc(div) {
          var x = document.getElementById(div);
          if (x.style.display === "none") {
            x.style.display = "block";
          } else {
            x.style.display = "none";
          }
        }
        function updateTextInput(val) {
          document.getElementById('textInput').innerHTML=val+"$"; 
        }
    </script>
</head>

<body>
    <?php
    //if($page!="login" && $page!="register")
        require_once("sideBar.php");
        if(file_exists($page.".php"))
        {
            include($page.".php");
        }
    ?>
</body>

</html>
<?php
ob_end_flush();
?>
