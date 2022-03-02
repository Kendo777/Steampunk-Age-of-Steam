<?php
$maxAdds=6;
    $sql= $mySqli->prepare("SELECT * FROM items WHERE itemId=?");
    $sql->bind_param("i",$id);
    $sql->execute();
    $result=$sql->get_result();

    if(!$result)
    {
      die($mySqli->error);
    }
    if(isset($errorMsg)) echo $errorMsg;
  $row=$result->fetch_assoc();
  echo '<div class="row">
  <div class="col-md-auto">';
  if(file_exists("css".DIRECTORY_SEPARATOR."ItemImg".DIRECTORY_SEPARATOR.$row['itemId'].$row['itemName'].".png"))
    echo '<img src="css'.DIRECTORY_SEPARATOR.'ItemImg'.DIRECTORY_SEPARATOR.$row['itemId'].$row['itemName'].'.png">';
  else //If the image doesnt exists we give a default one
  {
    $sqlAux= $mySqli->prepare("SELECT * FROM categories INNER JOIN classification ON categories.categoryId=classification.categoryId INNER JOIN items ON classification.itemId=items.itemId WHERE items.itemId=?");
    $sqlAux->bind_param("i",$id);
    $sqlAux->execute();
    $resultAux=$sqlAux->get_result();
    $rowAux=$resultAux->fetch_assoc();

    if(file_exists("css".DIRECTORY_SEPARATOR."Default".DIRECTORY_SEPARATOR.$rowAux['name']."Default.jpg"))
      echo '<img src="css'.DIRECTORY_SEPARATOR.'Default'.DIRECTORY_SEPARATOR.$rowAux['name'].'Default.jpg">';
    else
      echo '<img src=".css'.DIRECTORY_SEPARATOR.'Default'.DIRECTORY_SEPARATOR.'itemDefault.jpg">';
  }
    echo '</div>';

    echo '<div class="col-md-auto">';
    echo '<h2>'.$row["itemName"].'</h2>';

    $sqlAux= $mySqli->prepare("SELECT subcategories.subCategoryId, subcategories.name FROM subcategories INNER JOIN subclasification ON subcategories.subCategoryId=subclasification.subCategoryId INNER JOIN items ON subclasification.itemId=items.itemId WHERE items.itemId=?");
    $sqlAux->bind_param("i",$id);
    $sqlAux->execute();
    $resultAux=$sqlAux->get_result();
    $sqlCat= $mySqli->prepare("SELECT * FROM categories INNER JOIN classification ON categories.categoryId=classification.categoryId INNER JOIN items ON classification.itemId=items.itemId WHERE items.itemId=?");
    $sqlCat->bind_param("i",$id);
    $sqlCat->execute();
    $resultCat=$sqlCat->get_result();
    $rowCat=$resultCat->fetch_assoc();
    for($i=0; $i<$resultAux->num_rows; $i++)
    {
      $rowAux=$resultAux->fetch_assoc();
      echo '<a href="index.php?page=shop&product='.$rowCat['categoryId'].'&subCategory='.$rowAux['subCategoryId'].'" class="subProduct">'.$rowAux['name'].'</a>';
    }

    echo '<p>Prize: <span class="prize">'.$row['prize'].'$</span></p>';
    $sqlAux= $mySqli->prepare("SELECT attributes.name, itemattribute.value FROM attributes INNER JOIN itemattribute ON attributes.attributeId=itemattribute.attributeId INNER JOIN items ON itemattribute.itemId=items.itemId WHERE items.itemId=?");
    $sqlAux->bind_param("i",$id);
    $sqlAux->execute();
    $resultAux=$sqlAux->get_result();
    for($i=0; $i<$resultAux->num_rows; $i++)
    {
      $rowAux=$resultAux->fetch_assoc();
      echo '<h5>'.$rowAux['name'].':</h5><p>'.$rowAux['value'].'</p>';
    }
    echo '<h5>Product description</h5>';
    echo '<p style="max-width: 500px;">'.$row['description'].'</p>';
    echo '<p>Stock: '.$row['stock'].'</p>';
    if($row['stock']>0)
    {
      if(isset($_SESSION['user']))
      {
        echo '<form action="index.php?page=itemInfo&item='.$id.'" method="post">
            <div class="form-group">
            <input type="text" hidden class="form-control" name="addCart" value="'.$row['itemId'].'">
            <button type="submit" class="btn btn-warning">Add to the cart</button>
            </div>
            </form>';
      }
      else
      {
        echo '<a href="index.php?page=login"><button type="submit" class="btn btn-warning">Add to the cart</button></a>';
      }
    }
    else
    {
      echo '<button type="button" class="btn btn-secondary" disabled>Sold Out</button>';
    }
    echo '</div>';
    echo '</div>';

// Items suggestions
    
    echo '<div class="row suggestions">';
    $sqlAux= $mySqli->prepare("SELECT * FROM categories INNER JOIN classification ON categories.categoryId=classification.categoryId INNER JOIN items ON classification.itemId=items.itemId WHERE items.itemId=?");
    $sqlAux->bind_param("i",$id);
    $sqlAux->execute();
    $resultAux=$sqlAux->get_result();
    $rowAux=$resultAux->fetch_assoc();

    $sql= $mySqli->prepare("SELECT items.*, categories.categoryId FROM items INNER JOIN classification ON items.itemId=classification.itemId INNER JOIN categories ON classification.categoryId=categories.categoryId WHERE items.itemId!=? AND categories.categoryId =?");
    $sql->bind_param("ii",$id,$rowAux["categoryId"]);
    $sql->execute();
    $result=$sql->get_result();
    $pointers= array();
        if($maxAdds>$result->num_rows)
    {
        $maxAdds=$result->num_rows;
    }
    for ($i=0; $i <$maxAdds ; $i++) { 
      
      do
      {

        $num = rand(0,$result->num_rows-1);
      
      }while (in_array($num,$pointers));

      array_push($pointers, $num);

    }
    for ($i=0; $i <$maxAdds; $i++)
    { 
        $result->data_seek($pointers[$i]);
        $row=$result->fetch_assoc();
        echo '<div class="col-md-auto">
        <div class="card text-center" style="width: 18rem;">
        <div class="card-body">';
        if(file_exists("css".DIRECTORY_SEPARATOR."ItemImg".DIRECTORY_SEPARATOR.$row['itemId'].$row['itemName'].".png"))
            echo '<a href = "index.php?page=itemInfo&item='.$row['itemId'].'"><img class="miniature" src="css'.DIRECTORY_SEPARATOR.'ItemImg'.DIRECTORY_SEPARATOR.$row['itemId'].$row['itemName'].'.png" width="200" height="260"></a>';
        else //If the image doesnt exists we give a default one
        {

            if(file_exists("css".DIRECTORY_SEPARATOR."Default".DIRECTORY_SEPARATOR.$rowAux['name']."Default.jpg"))
              echo '<a href = "index.php?page=itemInfo&item='.$row['itemId'].'"><img class="miniature" src="css'.DIRECTORY_SEPARATOR.'Default'.DIRECTORY_SEPARATOR.$rowAux['name'].'Default.jpg" width="200" height="260"></a>';
            else
              echo '<a href = "index.php?page=itemInfo&item='.$row['itemId'].'"><img class="miniature" src="css'.DIRECTORY_SEPARATOR.'Default'.DIRECTORY_SEPARATOR.'itemDefault.jpg" width="200" height="260"></a>';
        }
        echo '<a href = "index.php?page=itemInfo&item='.$row['itemId'].'"><h5 class="card-title">'.$row['itemName'].'</h5></a>';
        echo '<p class="card-text prize">'.$row['prize'].'$</p>';
        echo "</div></div></div>";

    }
    echo "</div>";
?>

