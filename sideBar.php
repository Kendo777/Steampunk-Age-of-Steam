<?php 
    require_once("mySqli.php");
?>
    <div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar" class="active">
            <div class="sidebar-header">
                <a href="index.php"><h3>Steampunk Age of Steam</h3>
                <strong>SP</strong></a>
            </div>

            <ul class="list-unstyled components">
                <li>
                    <a href="index.php">
                        <i class="fas fa-home"></i>
                        Home
                    </a>
                </li>
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-cogs"></i>
                        Products
                    </a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <?php
                            $sqlBar= $mySqli->prepare("SELECT * FROM categories");
                            $sqlBar->execute();
                            $resultBar=$sqlBar->get_result();
                            if(!$resultBar)
                            {
                            die($mySqli->error);
                            }
                            for($i=0; $i<$resultBar->num_rows; $i++)
                            {
                            $rowBar=$resultBar->fetch_assoc();
                            echo'<li><a href="index.php?page=shop&product='.$rowBar['categoryId'].'">'.$rowBar['name'].'</a></li>';
                            }
                        ?>
                    </ul>
                </li>
                <li>
                    <a href="index.php?page=user">
                        <i class="fas fa-user"></i>
                        User
                    </a>
                </li>
                <li>
                    <a href="index.php?page=shoppingCart">
                        <i class="fas fa-shopping-cart"></i>
                        Cart 
                        <?php
                            $sql= $mySqli->prepare("SELECT * FROM orders WHERE user=? AND paid=0");
                            $sql->bind_param("s",$_SESSION['user']);
                            $sql->execute();
                            $result=$sql->get_result();
                            echo "(".$result->num_rows.")";
                        ?>
                    </a>
                </li>
            </ul>
            <img src="css/Img/side.jpg" class="sideBar">
        </nav>

        <!-- Page Content  -->
        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="row justify-content-md-center">
                    <div class="col-md-auto">
                        <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span></span>
                        </button>
                    </div>
                    <div class="col-md-auto">
                        <div class="row">
                            <form class="form-inline my-2 my-lg-0" method="post" action="index.php?page=shop">
                                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                            </form>
                        </div>
                    </div>
                    
                </div>
                <?php
                    if(!isset($_SESSION['user']))
                    {
                        echo'<div class="login">
                            <a href="index.php?page=login"><button class="btn btn-warning" type="button">Login</button></a>
                        </div>';
                    }
                    else
                    {
                        echo'<div class="login">
                        <a href="index.php?page=user"><button class="btn btn-warning" type="button"><i class="fas fa-user-circle"></i> '.$_SESSION['user'].'</button></a>
                        <ul class="list-group">
                          <li class="list-group-item"><a href="index.php?page=user">Profile</a></li>
                          <li class="list-group-item"><a href="index.php?page=user&edit"><i class="fas fa-wrench"></i> Edit Profile</a></li>
                          <li class="list-group-item"><a href="index.php?page=user&orders"><i class="fas fa-dolly"></i> Your Orders</a></li>
                          <li class="list-group-item"><a href="index.php?page=logout">Logout</a></li>
                        </ul>
                        </div>';
                    }
                ?>
            </nav>