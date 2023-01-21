<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if (strlen($_SESSION['trmsaid']==0)) {
  header('location:logout.php');
} else{
    if(isset($_POST['submit'])) {

        $trmsaid=$_SESSION['trmsaid'];
        $name=$_POST['name'];
        $subject_id=$_POST['subject_id'];
        $gender=$_POST['gender'];
        $dob=$_POST['dob'];


        $sql="insert into tblstudent(name, subject_id, gender, dob)values(:name, :subject_id, :gender, :dob)";
        $query=$dbh->prepare($sql);
        $query->bindParam(':name',$name, PDO::PARAM_STR);
        $query->bindParam(':subject_id',$subject_id, PDO::PARAM_INT);
        $query->bindParam(':gender',$gender, PDO::PARAM_STR);
        $query->bindParam(':dob',$dob, PDO::PARAM_STR);

        $query->execute();
        $LastInsertId=$dbh->lastInsertId();
        
        if ($LastInsertId>0) {
            echo '<script>alert("Student Detail has been added.")</script>';
            echo "<script>window.location.href ='manage-student.php'</script>";
        } else {
            echo '<script>alert("Something Went Wrong. Please try again")</script>';
        }
    }
?>



<!doctype html>
<html class="no-js" lang="en">

<head>

    <title>TRMS Add Student</title>


    <link rel="apple-touch-icon" href="apple-icon.png">


    <link rel="stylesheet" href="../vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="../vendors/selectFX/css/cs-skin-elastic.css">

    <link rel="stylesheet" href="../assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>



</head>

<body>
    <!-- Left Panel -->

    <?php include_once('includes/sidebar.php');?>

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <?php include_once('includes/header.php');?>

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Student Details</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="dashboard.php">Dashboard</a></li>
                            <li><a href="add-student.php">Student Details</a></li>
                            <li class="active">Add</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">

                    <!--/.col-->

                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header"><strong>Student </strong><small> Personal Details </small></div>
                            <form name="" method="post" action="" enctype="multipart/form-data">

                                <div class="card-body card-block">

                                    <div class="form-group"><label for="company" class=" form-control-label">
                                            Name</label><input type="text" name="name" value="" class="form-control"
                                            id="name" required="true"></div>
                                    


                                    <div class="row form-group">
                                        <div class="col-12">
                                            <div class="form-group"><label for="city" class=" form-control-label">
                                                    Subjects</label><select type="text" name="subject_id" id="subject_id"
                                                    value="" class="form-control" required="true">
                                                    <option value="">Choose Subjects</option>
                                                    <?php 
                                                        $sql2 = "SELECT * from   tblsubjects ";
                                                        $query2 = $dbh -> prepare($sql2);
                                                        $query2->execute();
                                                        $result2=$query2->fetchAll(PDO::FETCH_OBJ);
                                                        foreach($result2 as $row) {          
                                                    ?>
                                                        <option value="<?php echo htmlentities($row->ID);?>">
                                                            <?php echo htmlentities($row->Subject);?>
                                                        </option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row form-group">
                            <div class="col-12">
                                <div class="form-group"><label for="city" class=" form-control-label">Gender</label>
                                    <select type="text" name="gender" id="gender"
                                            value="" class="form-control" required="true">
                                            <option value="">Choose Gender</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            
                                    </select>
                                </div>
                            </div>
                        </div>



                        <div class="form-group"><label for="company" class=" form-control-label">DOB</label><input
                                type="date" name="dob" value="" class="form-control" id="dob" required="true"></div>
                        <p style="text-align: center;">
                            <button type="submit" class="btn btn-primary btn-sm" name="submit" id="submit">
                                <i class="fa fa-dot-circle-o"></i> Add
                            </button>
                        </p>

                    </div>
                </form>
                        </div>
                    </div>

















                </div><!-- .animated -->
            </div><!-- .content -->
        </div><!-- /#right-panel -->
        <!-- Right Panel -->


        <script src="../vendors/jquery/dist/jquery.min.js"></script>
        <script src="../vendors/popper.js/dist/umd/popper.min.js"></script>
        <script src="../vendors/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="../vendors/jquery-validation-unobtrusive/dist/jquery.validate.unobtrusive.min.js"></script>
        <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="../assets/js/main.js"></script>
</body>

</html>
<?php }  ?>