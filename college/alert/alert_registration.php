
<?php
require('Script\script.php');
if(isset($_SESSION['status_reg'])&& $_SESSION['status_reg'] != '')
{
    ?>
    <script>
        swal(
            "<?php echo $_SESSION['status_reg']?>", 
            "Please click ok button", 
            "<?php echo $_SESSION['alert_reg']?>");
    </script>
    <?php
    unset($_SESSION['status_reg']);
    unset($_SESSION['alert_reg']);

}


?>