<?php 
$maxAdds = 10;
?>
<div class="products">
    <img src="css/Img/cover.png" class="cover">
    <h2>Welcome to Steampunk: Age of Steam</h2>
    <h3>Products</h3>
    <div class="row justify-content-md-center">
    <?php
        $sql= $mySqli->prepare("SELECT * FROM categories");
        $sql->execute();
        $result=$sql->get_result();
        for ($i=0; $i <$result->num_rows ; $i++) {
            $row = $result->fetch_assoc();

            $sqlAux= $mySqli->prepare("SELECT items.*, categories.categoryId FROM items INNER JOIN classification ON items.itemId=classification.itemId INNER JOIN categories ON classification.categoryId=categories.categoryId WHERE categories.categoryId =?");
            $sqlAux->bind_param("i",$row["categoryId"]);
            $sqlAux->execute();
            $resultAux=$sqlAux->get_result();

            $resultAux->data_seek(rand(0,$resultAux->num_rows-1));
            $rowAux=$resultAux->fetch_assoc();
            echo '<div class="col-md-auto">
            <div class="card text-center" style="width: 18rem;">
            <div class="card-body">';
            if(!empty($rowAux) && file_exists("css".DIRECTORY_SEPARATOR."ItemImg".DIRECTORY_SEPARATOR.$rowAux['itemId'].$rowAux['itemName'].".png"))
                echo '<a href = "index.php?page=shop&product='.$row['categoryId'].'"><img src="css'.DIRECTORY_SEPARATOR.'ItemImg'.DIRECTORY_SEPARATOR.$rowAux['itemId'].$rowAux['itemName'].'.png" width="200" height="260"></a>';
            else
            {

                if(file_exists("css/Default/".$row['name']."Default.jpg"))
                  echo '<a href = "index.php?page=shop&product='.$row['categoryId'].'"><img src="css'.DIRECTORY_SEPARATOR.'Default'.DIRECTORY_SEPARATOR.$row['name'].'Default.jpg" width="200" height="260"></a>';
                else
                  echo '<a href = "index.php?page=shop&product='.$row['categoryId'].'"><img src="css'.DIRECTORY_SEPARATOR.'Default'.DIRECTORY_SEPARATOR.'itemDefault.jpg" width="200" height="260"></a>';
            }
            echo '<a href = "index.php?page=shop&product='.$row['categoryId'].'"><h5 class="card-title">'.$row['name'].'</h5></a>';
            echo "</div></div></div>";
            }

        echo '</div>
        <h3>Products you may be interest</h3>
        <div class="row suggestions justify-content-md-center">';

    $sql= $mySqli->prepare("SELECT * FROM items");
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
        if(!empty($row) && file_exists("css".DIRECTORY_SEPARATOR."ItemImg".DIRECTORY_SEPARATOR.$row['itemId'].$row['itemName'].".png"))
            echo '<a href = "index.php?page=itemInfo&item='.$row['itemId'].'"><img class="miniature" src="css'.DIRECTORY_SEPARATOR.'ItemImg'.DIRECTORY_SEPARATOR.$row['itemId'].$row['itemName'].'.png" width="200" height="260"></a>';
        else
        {
            $sqlAux= $mySqli->prepare("SELECT * FROM categories INNER JOIN classification ON categories.categoryId=classification.categoryId INNER JOIN items ON classification.itemId=items.itemId WHERE items.itemId=?");
            $sqlAux->bind_param("i",$row['itemId']);
            $sqlAux->execute();
            $resultAux=$sqlAux->get_result();
            $rowAux=$resultAux->fetch_assoc();

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
</div>
