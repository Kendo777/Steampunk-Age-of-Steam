<?php

require_once("mySqli.php");
header('Access-Control-Allow-Origin: *');
header('content-type: application/json; charset=utf-8');
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
function getProductsAsJson($mySqli){
	
	$sql = $mySqli->prepare("SELECT * FROM items ORDER BY itemName");

	$sql->execute();
	$result = $sql->get_result();

	if(!$result){
		echo $mysqli->error;
	}else{
		$json = [];
		while($row = $result->fetch_array(MYSQLI_ASSOC)) {
			$aux = [];
            $aux["id"] = $row["itemId"];
            $aux["shop"] = "Steampunk";
            $aux["name"] = $row["itemName"];
            $aux["prize"] = $row["prize"];
            $aux["description"] = $row["description"];
            $aux["shippment"] = $row["extra"];
            $aux["stock"] = $row["stock"];
            if(file_exists("css".DIRECTORY_SEPARATOR."ItemImg".DIRECTORY_SEPARATOR.$row['itemId'].$row['itemName'].".png"))
    			$aux["img"] = "https://apimlozanoo20.000webhostapp.com/OnlineShop/css/ItemImg/".$row["itemId"].$row["itemName"].".png";
  			else //If the image doesnt exists we give a default one
			{
				$sqlAux= $mySqli->prepare("SELECT * FROM categories INNER JOIN classification ON categories.categoryId=classification.categoryId INNER JOIN items ON classification.itemId=items.itemId WHERE items.itemId=?");
				$sqlAux->bind_param("i",$row["itemId"]);
				$sqlAux->execute();
				$resultAux=$sqlAux->get_result();
				$rowAux=$resultAux->fetch_assoc();

				if(file_exists("css".DIRECTORY_SEPARATOR."Default".DIRECTORY_SEPARATOR.$rowAux['name']."Default.jpg"))
				{
				  $aux["img"] = "https://apimlozanoo20.000webhostapp.com/OnlineShop/css/Default/".$rowAux['name']."Default.jpg";
				}
				else
				{
					$aux["img"] = "https://apimlozanoo20.000webhostapp.com/OnlineShop/css/Default/itemDefault.jpg";
				}
			}
			$sqlAux= $mySqli->prepare("SELECT * FROM categories INNER JOIN classification ON categories.categoryId=classification.categoryId INNER JOIN items ON classification.itemId=items.itemId WHERE items.itemId=?");
		$sqlAux->bind_param("i",$row["itemId"]);
		$sqlAux->execute();
		$resultAux=$sqlAux->get_result();
		$rowAux=$resultAux->fetch_assoc();
		$aux["category"] = $rowAux['name'];

		$subCategory = "";

		$sqlAux= $mySqli->prepare("SELECT subcategories.name FROM subcategories INNER JOIN subclasification ON subcategories.subCategoryId=subclasification.subCategoryId INNER JOIN items ON subclasification.itemId=items.itemId WHERE items.itemId=?");
	    $sqlAux->bind_param("i",$row["itemId"]);
	    $sqlAux->execute();
	    $resultAux=$sqlAux->get_result();
	    
	    for($i=0; $i<$resultAux->num_rows; $i++)
	    {
	      $rowAux=$resultAux->fetch_assoc();
	      $subCategory .= $rowAux["name"].':';
	    }
	    $aux["subCategory"] = $subCategory;

            array_push($json, $aux);
    	}
	return json_encode($json);
	}
}

function getSpecificProductsAsJson($mySqli, $get){
	
	$sql = $mySqli->prepare("SELECT * FROM items WHERE itemId = ?");
	$sql->bind_param("d",$get);
	$sql->execute();
	$result = $sql->get_result();

	if(!$result){
		echo $mysqli->error;
	}else{

		$row = $result->fetch_array();
		$aux = [];
        $aux["id"] = $row["itemId"];
        $aux["shop"] = "Steampunk";
        $aux["name"] = $row["itemName"];
        $aux["prize"] = $row["prize"];
        $aux["description"] = $row["description"];
        $aux["shippment"] = $row["extra"];
        $aux["stock"] = $row["stock"];
        if(file_exists("css".DIRECTORY_SEPARATOR."ItemImg".DIRECTORY_SEPARATOR.$row['itemId'].$row['itemName'].".png"))
			$aux["img"] = "https://apimlozanoo20.000webhostapp.com/OnlineShop/css/ItemImg/".$row["itemId"].$row["itemName"].".png";
			else //If the image doesnt exists we give a default one
		{
			$sqlAux= $mySqli->prepare("SELECT * FROM categories INNER JOIN classification ON categories.categoryId=classification.categoryId INNER JOIN items ON classification.itemId=items.itemId WHERE items.itemId=?");
			$sqlAux->bind_param("i",$row["itemId"]);
			$sqlAux->execute();
			$resultAux=$sqlAux->get_result();
			$rowAux=$resultAux->fetch_assoc();

			if(file_exists("css".DIRECTORY_SEPARATOR."Default".DIRECTORY_SEPARATOR.$rowAux['name']."Default.jpg"))
			{
			  $aux["img"] = "https://apimlozanoo20.000webhostapp.com/OnlineShop/css/Default/".$rowAux['name']."Default.jpg";
			}
			else
			{
				$aux["img"] = "https://apimlozanoo20.000webhostapp.com/OnlineShop/css/Default/itemDefault.jpg";
			}
		}

		$sqlAux= $mySqli->prepare("SELECT * FROM categories INNER JOIN classification ON categories.categoryId=classification.categoryId INNER JOIN items ON classification.itemId=items.itemId WHERE items.itemId=?");
		$sqlAux->bind_param("i",$row["itemId"]);
		$sqlAux->execute();
		$resultAux=$sqlAux->get_result();
		$rowAux=$resultAux->fetch_assoc();
		$aux["category"] = $rowAux['name'];

		$subCategory = "";

		$sqlAux= $mySqli->prepare("SELECT subcategories.name FROM subcategories INNER JOIN subclasification ON subcategories.subCategoryId=subclasification.subCategoryId INNER JOIN items ON subclasification.itemId=items.itemId WHERE items.itemId=?");
	    $sqlAux->bind_param("i",$row["itemId"]);
	    $sqlAux->execute();
	    $resultAux=$sqlAux->get_result();
	    
	    for($i=0; $i<$resultAux->num_rows; $i++)
	    {
	      $rowAux=$resultAux->fetch_assoc();
	      $subCategory .= $rowAux["name"].':';
	    }
	    $aux["subCategory"] = $subCategory;

        $json = $aux;
    }
	return json_encode($json);
}

function getSearchedProductsAsJson($mySqli,$search){
	
	$sql = $mySqli->prepare("SELECT * FROM items WHERE itemName LIKE ? ORDER BY itemName");
	$compare = "%".$search."%";
	$sql->bind_param("s",$compare);
	$sql->execute();
	$result = $sql->get_result();

	if(!$result){
		echo $mysqli->error;
	}else{
		$json = [];
		while($row = $result->fetch_array(MYSQLI_ASSOC)) {
			$aux = [];
            $aux["id"] = $row["itemId"];
            $aux["shop"] = "Steampunk";
            $aux["name"] = $row["itemName"];
            $aux["prize"] = $row["prize"];
            $aux["description"] = $row["description"];
            $aux["shippment"] = $row["extra"];
            $aux["stock"] = $row["stock"];
            if(file_exists("css".DIRECTORY_SEPARATOR."ItemImg".DIRECTORY_SEPARATOR.$row['itemId'].$row['itemName'].".png"))
    			$aux["img"] = "https://apimlozanoo20.000webhostapp.com/OnlineShop/css/ItemImg/".$row["itemId"].$row["itemName"].".png";
  			else //If the image doesnt exists we give a default one
			{
				$sqlAux= $mySqli->prepare("SELECT * FROM categories INNER JOIN classification ON categories.categoryId=classification.categoryId INNER JOIN items ON classification.itemId=items.itemId WHERE items.itemId=?");
				$sqlAux->bind_param("i",$row["itemId"]);
				$sqlAux->execute();
				$resultAux=$sqlAux->get_result();
				$rowAux=$resultAux->fetch_assoc();

				if(file_exists("css".DIRECTORY_SEPARATOR."Default".DIRECTORY_SEPARATOR.$rowAux['name']."Default.jpg"))
				{
				  $aux["img"] = "https://apimlozanoo20.000webhostapp.com/OnlineShop/css/Default/".$rowAux['name']."Default.jpg";
				}
				else
				{
					$aux["img"] = "https://apimlozanoo20.000webhostapp.com/OnlineShop/css/Default/itemDefault.jpg";
				}
				$aux["category"] = $rowAux['name'];
			}
			$sqlAux= $mySqli->prepare("SELECT * FROM categories INNER JOIN classification ON categories.categoryId=classification.categoryId INNER JOIN items ON classification.itemId=items.itemId WHERE items.itemId=?");
		$sqlAux->bind_param("i",$row["itemId"]);
		$sqlAux->execute();
		$resultAux=$sqlAux->get_result();
		$rowAux=$resultAux->fetch_assoc();
		$aux["category"] = $rowAux['name'];

		$subCategory = "";

		$sqlAux= $mySqli->prepare("SELECT subcategories.name FROM subcategories INNER JOIN subclasification ON subcategories.subCategoryId=subclasification.subCategoryId INNER JOIN items ON subclasification.itemId=items.itemId WHERE items.itemId=?");
	    $sqlAux->bind_param("i",$row["itemId"]);
	    $sqlAux->execute();
	    $resultAux=$sqlAux->get_result();
	    
	    for($i=0; $i<$resultAux->num_rows; $i++)
	    {
	      $rowAux=$resultAux->fetch_assoc();
	      $subCategory .= $rowAux["name"].':';
	    }
	    $aux["subCategory"] = $subCategory;
            array_push($json, $aux);
    	}
	return json_encode($json);
	}
}


function getCategoriesAsJson($mySqli){
	
		$sql = $mySqli->prepare("SELECT categories.* FROM categories ORDER BY name");
	$sql->execute();
	$result = $sql->get_result();

	if(!$result){
		echo $mysqli->error;
	}else{
		$json = [];
		while($row = $result->fetch_array(MYSQLI_ASSOC)) {
			$aux = [];
            $aux["name"] = $row["name"];
            array_push($json, $aux);
    	}
	return json_encode($json);
	}
}
function getSubCategoriesAsJson($mySqli){
	
		$sql = $mySqli->prepare("SELECT subcategories.* FROM subcategories ORDER BY name");
	$sql->execute();
	$result = $sql->get_result();

	if(!$result){
		echo $mysqli->error;
	}else{
		$json = [];
		while($row = $result->fetch_array(MYSQLI_ASSOC)) {
			$aux = [];
            $aux["name"] = $row["name"];
            array_push($json, $aux);
    	}
	return json_encode($json);
	}
}

function changeStock($mySqli, $id, $cuantity)
{
  $sql= $mySqli->prepare("SELECT * FROM items WHERE itemId=?");
  $sql->bind_param("i",$id);
  $sql->execute();
  $result=$sql->get_result();
  $rowAux = $result->fetch_assoc();

  if($rowAux['stock']>=$cuantity || $cuantity<0)
  {
      $sql= $mySqli->prepare("UPDATE items SET stock = stock - ? WHERE itemId=?");
      $sql->bind_param("ii",$cuantity,$id);
      $sql->execute();
	}

	return getSpecificProductsAsJson($mySqli,$id);

}
function buyItem($mySqli, $id, $cuantity, $user)
{
  $sql= $mySqli->prepare("SELECT * FROM items WHERE itemId=?");
  $sql->bind_param("i",$id);
  $sql->execute();
  $result=$sql->get_result();
  $rowAux = $result->fetch_assoc();

    $date = date("Y-m-d H:i:s");

    $totalPrize = $rowAux["prize"] * $cuantity + $rowAux["extra"];

	$sql= $mySqli->prepare("SELECT * FROM creditcard WHERE user=?");
	$sql->bind_param("s",$user);
	$sql->execute();
	$result=$sql->get_result();
	$rowAux = $result->fetch_assoc();
	$creditCardId = $rowAux["creditCardId"];

	$sql= $mySqli->prepare("SELECT * FROM addresses WHERE user=?");
	$sql->bind_param("s",$user);
	$sql->execute();
	$result=$sql->get_result();
	$rowAux = $result->fetch_assoc();
	$addressId = $rowAux["addressId"];

      $sql= $mySqli->prepare("INSERT INTO orders(itemId, creditCardId, user, addressId, cuantity, totalPrize, date, paid) VALUES (?,?,?,?,?,?,?,1)");
      $sql->bind_param("iisiids",$id,$creditCardId, $user,$addressId, $cuantity, $totalPrize,$date);
      $sql->execute();
      $result=$sql->get_result();

}

if(isset($_GET['user']) && isset($_GET['password']))
{
	$user = mysql_fix_string($mySqli,$_GET['user']);
	$password = mysql_fix_string($mySqli,$_GET['password']);


	$sql= $mySqli->prepare("SELECT * FROM users WHERE user=? OR email=?");
	$sql->bind_param("ss",$user,$user);
	$sql->execute();

	$result=$sql->get_result();

	if($result->num_rows>0)
	{
	    $row=$result->fetch_assoc(); //put the results into a row

	    if(password_verify($password,$row['password']))
	    {
			if(isset($_GET['search'])) {

				$get = mysql_fix_string($mySqli,$_GET['search']);

				$data = getSearchedProductsAsJson($mySqli,$get);
				//var_dump($data);
				header('Content-type: application/json');
				echo $data;
			}
			else if(isset($_GET['category']))
			{

				$data = getCategoriesAsJson($mySqli);
				//var_dump($data);
				header('Content-type: application/json');
				echo $data;
			}
			else if(isset($_GET['subCategory']))
			{

				$data = getSubCategoriesAsJson($mySqli);
				//var_dump($data);
				header('Content-type: application/json');
				echo $data;
			}
			else if(isset($_GET["buy"]) && isset($_GET['item']) && isset($_GET['cuantity']))
			{
				$get = mysql_fix_string($mySqli,$_GET['item']);
				$get2 = mysql_fix_string($mySqli,$_GET['cuantity']);

				buyItem($mySqli,$get,$get2,$user);
			}
			else if(isset($_GET['item']) && isset($_GET['cuantity']))
			{
				$get = mysql_fix_string($mySqli,$_GET['item']);
				$get2 = mysql_fix_string($mySqli,$_GET['cuantity']);

				$data = changeStock($mySqli,$get,$get2,$user);

				header('Content-type: application/json');
				echo $data;
			}
			else if(isset($_GET['item']))
			{
				$get = mysql_fix_string($mySqli,$_GET['item']);

				$data = getSpecificProductsAsJson($mySqli,$get);
				//var_dump($data);
				header('Content-type: application/json');
				echo $data;
			}
			else
			{
				$data = getProductsAsJson($mySqli);
				//var_dump($data);
				header('Content-type: application/json');
				echo $data;
			}
		}
	}
}

?>