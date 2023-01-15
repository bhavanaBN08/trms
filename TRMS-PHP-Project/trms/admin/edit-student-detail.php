<?php session_start();
//error_reporting(0);
include('includes/dbconnection.php');
if (strlen($_SESSION['trmsaid']==0)) {
  header('location:logout.php');
  } else{
    //Add Teacher Details  
    if(isset($_POST['submit'])) {
        $tid=$_GET['tid'];
        $tname=$_POST['tname'];
        $subject_id=$_POST['subject_id'];
        $gender=$_POST['gender'];
        $dob=$_POST['dob'];
        $sql="update tblstudent set name=:name, subject_id=:subject_id, gender=:gender, dob=:dob where ID=:tid";
        $query = $dbh->prepare($sql);
        $query->bindParam(':name',$tname,PDO::PARAM_STR);
        $query->bindParam(':subject_id',$subject_id,PDO::PARAM_INT);
        $query->bindParam(':gender',$gender,PDO::PARAM_STR);
        $query->bindParam(':dob',$dob,PDO::PARAM_STR);
        $query->bindParam(':tid',$tid,PDO::PARAM_INT);
        $query->execute();
        echo '<script>alert("Student profile succesfully updated.")</script>';
        echo "<script>window.location.href='manage-student.php'</script>";
    }

?>

<!doctype html>
<html class="no-js" lang="en">

<head>

    <title>TRMS|| Student Profile</title>

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
                        <h1>Update Student Detail</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="dashboard.php">Dashboard</a></li>
                            <li><a href="manage-student.php">Update Student</a></li>
                            <li class="active">Update</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">

                    <!--/.col-->

                    <div class="col-lg-6" style="float-left:left !important">
                        <div class="card">
                            <div class="card-header"><strong>Student</strong><small> Personal Details</small></div>
                            <form name="" method="post" action="" enctype="multipart/form-data">

                                <div class="card-body card-block">
                                    <?php
                                    $eid=$_GET['tid'];
                                    // $sql="SELECT s.ID, s.name , sub.Subject, s.gender , s.dob from tblstudent s JOIN tblsubjects sub ON sub.ID = s.subject_id  where s.ID=$eid";
                                    $sql="SELECT s.ID, s.name, s.gender, s.dob , sub.ID as subject_id, sub.Subject from tblstudent s JOIN tblsubjects sub ON sub.ID = s.subject_id where s.ID=$eid";
                                    $query = $dbh -> prepare($sql);
                                    $query->execute();
                                    $results=$query->fetchAll(PDO::FETCH_OBJ);
                                    $cnt=1;
                                    if($query->rowCount() > 0) {
                                        foreach($results as $row) {               
                                    ?>


                                        <input type="text" name="tid" value="<?php  echo $row->ID;?>"
                                                class="form-control" id="tid" required="false" hidden>



                                        <div class="form-group">
                                            <label for="company" class=" form-control-label">Student Name</label>
                                            <input type="text" name="tname" value="<?php  echo $row->name;?>"
                                                class="form-control" id="tname" required="true">
                                        </div>


                                        <div class="row form-group">
                                        <div class="col-12">
                                            <div class="form-group"><label for="city" class=" form-control-label">
                                                    Subjects</label><select type="text" name="subject_id" id="subject_id"
                                                    value="" class="form-control" required="true">
                                                    <!-- <option value="">Choose Subjects</option> -->
                                                    <option value="<?php  echo $row->subject_id;?>"><?php  echo $row->Subject;?></option>
                                                    <?php 
                                                        $sql2 = "SELECT * from   tblsubjects ";
                                                        $query2 = $dbh -> prepare($sql2);
                                                        $query2->execute();
                                                        $result2=$query2->fetchAll(PDO::FETCH_OBJ);
                                                        foreach($result2 as $row2) {          
                                                    ?>
                                                        <option value="<?php echo htmlentities($row2->ID);?>">
                                                            <?php echo htmlentities($row2->Subject);?>
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
                                                            
                                                            <!-- <option value="">Choose Gender</option> -->
                                                            <option value="<?php  echo $row->gender;?>">
                                                        <?php  echo $row->gender;?></option>
                                                            <option value="Male">Male</option>
                                                            <option value="Female">Female</option>
                                                            
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="street" class=" form-control-label">DOB</label>
                                            <input type="text" name="dob" value="<?php  echo htmlentities($row->dob);?>" id="dob"
                                                class="form-control" required="true">
                                        </div>

                                </div>
                                <?php $cnt=$cnt+1;}} ?>

                                <p style="text-align: center;"><button type="submit" class="btn btn-primary btn-sm"
                                        name="submit" id="submit"><i class="fa fa-dot-circle-o"></i> Update</button></p>

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