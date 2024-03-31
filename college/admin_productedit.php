<?php
session_start();
require("admin_header.php");
include('functions.php');
?>
<?php
if(!empty($_SESSION['admin_login'])){

}
else{
    header('location:login.php');
}
include('db.php');

if(!empty($_SESSION['edit_productid'])){
    $fetch_product_id = $_SESSION['edit_productid'];

}
else
{
    header('location:admin_allproduct.php');
}
$empmsg_price = $empmsg_details = $empmsg_title = $empmsg_more_details  = "";
if(isset($_POST['submit'])){
    $id = $_POST['ID'];
    $title = $_POST['title'];
    $price = $_POST['price'];
    $type = $_POST['type'];
    $details = $_POST['details'];
    $more_details = $_POST['more_details'];
    if(!validatePrice($price)){
        $empmsg_price = "Please enter a valid price.";
    }
    if(!(product_title_validation($title) == "accepted")){
        $empmsg_title = product_title_validation($title);
    }
    if(!(product_detail_validation($details)=="accepted")){
        $empmsg_details = product_detail_validation($details);
    }
    if(!(product_more_detail_validation($more_details)=="accepted")){
        $empmsg_more_details = product_more_detail_validation($more_details);
    }
    if(validatePrice($price)&&(product_title_validation($title)=="accepted") && (product_detail_validation($details)=="accepted") && (product_more_detail_validation($more_details)=="accepted")){

    $sql = "UPDATE `product` SET product_title = '$title' ,product_type = '$type' , product_price = '$price', product_details = '$details' , product_more_details = '$more_details'  WHERE product_id = '$id'";

    $update_query = mysqli_query($conn,$sql);
    if($update_query){
        $message1[] = "Product edited Successfully";
            header("refresh:2");
            // header('location:admin_allproduct.php');
    }
    else{
        $message1[] = "Product edited Failed";
    }
    }
}


?>
<div id="main">
        <div class="addprod_form">
    <?php

if(isset($message1)){
    // header("refresh:0");
    foreach($message1 as $message1){
        echo '<div class="message2"><span>'.$message1.'</span> <i class= "fas fa-times" onclick="this.parentElement.style.display = `none`;"></i> </div>';
    }
    
 }
?>
            <form action="" method="POST" enctype="multipart/form-data">
                <h3>Edit Product details</h3>
    
    <?php
    $data = mysqli_query($conn,"SELECT * FROM `product` where product_id = '$fetch_product_id'");
    while($row = mysqli_fetch_array($data)){


    ?>  
                <label for="id">Product ID:</label>
                <input type="text" placeholder="ID" id="title" name="ID" value="<?php echo $row['product_id']; ?>" readonly><br><br>
                
                <label for="title">Title:</label>
                <input type="text" placeholder="Title" id="title" name="title" value="<?php echo $row['product_title']; ?>" required><br><br>
                <div id= "error"><?php if(isset($_POST['submit'])) { echo $empmsg_title ;}?></div>

                <label for="price">Price:</label>
                <input type="text" placeholder="Price" id="price" name="price" value="<?php echo $row['product_price']; ?>" required><br><br>
                <div id="error"> <?php if(isset($_POST['submit'])) { echo $empmsg_price;}    ?> </div>

                <label for="type">Product Category:</label>
                <select name="type" >
                    <option value="<?php echo $row['product_type']; ?>"><?php echo $row['product_type']; ?></option>
                    <option value="Phone">Phone</option>
                    <option value="Tablet">Tablet</option>
                    <option value="Accessories">Accessories</option>
                    
                </select><br><br>

                <label for="details">Details:</label>
                <input type="text" placeholder="Details" id="details" name="details" value="<?php echo $row['product_details']; ?>"  required><br><br>
                <div id="error"> <?php if(isset($_POST['submit'])) { echo $empmsg_details ;}    ?></div>

                <label for="moredetails">More details:</label>
                <textarea id="more_details" name="more_details" required><?php echo $row['product_more_details']; ?></textarea> <br><br>
                <div id="error"> <?php if(isset($_POST['submit'])) { echo $empmsg_more_details ;}    ?></div>

                <button type="submit" name="submit">Submit</button>
        <?php
    }

        ?>


            </form>





        </div>

    </div>

    <!-- <script>
    $(document).ready(function() {
      $('#more_details').on('input', function() {
        $(this).width(this.value.length * 10);
        $(this).height(this.value.length * 10);// Adjust the width based on content length
      });
    });
  </script> -->
</body>

</html>