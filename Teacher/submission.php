<?php
session_start();
$user=$_SESSION['uname'];
if($user=="")
{
  header('Location: index.php');
}
if($user=="")
{
  header('Location: index.php');
}
include("dbcon.php");
                  $u=mysqli_query($con,"Select * From Teacher where TeacherEmail='$user'");
                  while($row= mysqli_fetch_array($u))
                  {
                    $usr=$row['TeacherFname']." ".$row['TeacherLname'];
                    $TeacherId=$row['TeacherId'];
                  }
?>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Add Assignment</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
   <link rel="stylesheet" href="../AdminLTE/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../AdminLTE/dist/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../AdminLTE/dist/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../AdminLTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="../AdminLTE/dist/css/skins/skin-yellow-light.min.css">

    <style type="text/css">
/**
 * Override feedback icon position
 * See http://formvalidation.io/examples/adjusting-feedback-icon-position/
 */
#eventForm .form-control-feedback {
    top: 0;
    right: -15px;
}
</style>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <!--
  BODY TAG OPTIONS:
  =================
  Apply one or more of the following classes to get the
  desired effect
  |---------------------------------------------------------|
  | SKINS         | skin-blue                               |
  |               | skin-black                              |
  |               | skin-purple                             |
  |               | skin-yellow                             |
  |               | skin-red                                |
  |               | skin-green                              |
  |---------------------------------------------------------|
  |LAYOUT OPTIONS | fixed                                   |
  |               | layout-boxed                            |
  |               | layout-top-nav                          |
  |               | sidebar-collapse                        |
  |               | sidebar-mini                            |
  |---------------------------------------------------------|
  -->
  <body class="hold-transition skin-yellow-light sidebar-mini">
    <div class="wrapper">
      <!-- Main Header -->
      <header class="main-header">

        <!-- Logo -->
        <a href="TeacherDashboard.php" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><img class="img-responsive" src="D_Logo/E.jpg" width=35 height=60 /></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b><img class="img-responsive" src="D_Logo/Logo.png" height=50 width=130/></b></span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              
              <!-- User Account Menu -->
              <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <!-- The user image in the navbar-->
                  <img src="D_Logo/avatar5.png" class="user-image" alt="User Image">
                  <!-- hidden-xs hides the username on small devices so only the image appears. -->
                  <span class="hidden-xs"><?php echo $usr ?></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- The user image in the menu -->
                  <li class="user-header">
                    <img src="D_Logo/avatar5.png" class="img-circle" alt="User Image">
                    <p>
                      <?php echo $usr;
                      echo "<br>";
                  $c=mysqli_query($con,"Select * From TeacherCourse where TeacherId='$TeacherId'");
                  echo "Course: ";
                  while($row=mysqli_fetch_array($c))
                  {
                    
                    $course=$row['CourseId'];
                    $get_name=mysqli_query($con,"SELECT * FROM Course WHERE CourseId='$course'");
                    while($c_row=mysqli_fetch_array($get_name))
                    {
                      $course=$c_row['CourseName']; 
                    }
                    echo "|$course| ";
                  }
                  ?>
                    </p>
                  </li>
                  
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <!-- <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div> -->
                    <div class="pull-right">
                      <a href="logout.php" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

          <!-- Sidebar user panel (optional) -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="D_Logo/avatar5.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p><?php echo $usr?></p>
              <!-- Status -->
            </div>
          </div>

          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <!-- Optionally, you can add icons to the links -->
            <li><a href="TeacherDashboard.php"><i class="fa fa-home"></i><span>Home</span></a></li>
            <li><a href="settings.php"><i class="fa fa-gears"></i> <span>Settings</span></a></li>
          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
              </aside>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Assignment:
          </h1>
          
        </section>
        <!-- Main content -->
        <section class="content">
          <?php
           error_reporting(0);
echo "<div class=table-responsive>";
echo "<table class=table table-striped>";
echo "<thead>";
echo "<tr>";
echo "<th>Sr No.</th>";
echo "<th>Title</th>";
echo "<th>Course</th>";
echo "<th>Date of Upload</th>";
echo "<th>Date of Submission</th>";

echo "<th>View</th>";
echo "<th>Delete</th>";
echo "</tr>";
echo "</thead>";
echo "<tbody>";
$i=0;
include("dbcon.php");

$res=mysqli_query($con,"SELECT * FROM TeacherCourse WHERE TeacherId='$TeacherId'");
while($res_row=mysqli_fetch_array($res))
{
  $c_id=$res_row['CourseId'];
  $get_name=mysqli_query($con,"SELECT * FROM Course WHERE CourseId='$c_id'");
                    while($c_row=mysqli_fetch_array($get_name))
                    {
                      $course=$c_row['CourseName']; 
			$b_uid=$c_row['BatchId'];
			$getBatchName=mysqli_query($con,"SELECT BatchName FROM Batch WHERE BatchId='$b_uid'");
			while($batchrow=mysqli_fetch_array($getBatchName))
			{
				$br_name=$batchrow['BatchName'];
			}
                      //$c_uid=$c_row['Course_uid'];
                    }

$result = mysqli_query($con,"SELECT * FROM `Submission` WHERE `CourseId`='$c_id'");
while($row = mysqli_fetch_array($result))
{
$dou=$row['DateOfUpload'];
$dos=$row['DateOfSubmission'];
$uid=$row['SubmissionId'];
$title=$row['SubmissionTitle'];
$path=$row['SubmissionFile'];

$i++;
echo "<tr>";
echo "<td>";
echo $i;
echo "</td>";
echo "<td>";
echo $title;
echo "</td>";
echo "<td>";
echo $course."- ".$br_name;
echo "</td>";
echo "<td>";
echo $dou;
echo "</td>";
echo "<td>";
echo $dos;
echo "</td>";

echo "<td>";
echo "<a href=$path>View</a>";
echo "</td>";
echo "<td>";
echo "<form action=del_submission.php method=post><button type=submit class=btn btn-default name=del value='$uid' onclick=myFunction() >Delete</button></form>";
echo "</td>";
echo "</tr>";
}
}
echo "</tbody>";
echo "</table>";
?></div>

          <div class="col-md-6">
              <div class="box box-default collapsed-box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">Add Assignment</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form id="eventForm" action=add_submission.php role="form" method="post" enctype="multipart/form-data">

                    <?php
                    $k=2;
                    if($k>=1)
                    {
                      echo "<label for=menu1>Select Course:</label><br>";
                      echo "<select name=menu1>";
                      include("dbcon.php");
                      $c=mysqli_query($con,"SELECT * FROM `TeacherCourse` where `TeacherId`='$TeacherId'");
                      while($row = mysqli_fetch_array($c))
                      {
                      $course_id=$row['CourseId'];
                      $get_name=mysqli_query($con,"SELECT * FROM Course WHERE CourseId='$course_id'");
                    while($c_row=mysqli_fetch_array($get_name))
                    {
                      $course_name=$c_row['CourseName']; 
			$b_uid=$c_row['BatchId'];
			$getBatchName=mysqli_query($con,"SELECT BatchName FROM Batch WHERE BatchId='$b_uid'");
			while($batchrow=mysqli_fetch_array($getBatchName))
			{
				$br_name=$batchrow['BatchName'];
			}
                    }
                      $uid=$row['uid'];
                      $b_name=$row['branch'];
                      echo "<option value=$course_id>$course_name- $br_name</option>";
                      }
                      echo "</select><br>";
                    }
                    else
                    {
                      echo "Your Course is: $course<br>";
                  }?><br>
        <div class="form-group">
          <label for="bookname">Enter the Title: </label><br>
          <input type="text" name="title" placeholder="Enter Title">
        </div>
        <div class="form-group">
          <label for="file">Upload Notes: </label>
          <input type="file" class="tb5" name="file" enctype="multipart/form-data">
        </div>
        <div class="form-group">
        <label class="col-xs-12 control-label">Date of submission:</label>
        <div class="col-xs-5 date">
            <div class="input-group input-append date" id="datePicker">
                <input type="text" class="form-control" name="date" />
                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
        </div>
    </div><br>
        <?php echo "<button type=submit class=btn btn-default name=i value=$k >Add Assignment</button>";?>
      </form><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
           <!--  <form id="eventForm" method="post" class="form-horizontal" action="add_submission.php">
    <div class="form-group">
        <label class="col-xs-3 control-label">Event</label>
        <div class="col-xs-5">
            <input type="text" class="form-control" name="name" />
        </div>
    </div>
 -->

    <!-- <div class="form-group">
        <div class="col-xs-5 col-xs-offset-3">
            <button type="submit" class="btn btn-default">Validate</button>
        </div>
    </div>
</form> -->
        </section>
      </div><!-- /.content-wrapper -->
      <!-- Main Footer -->
      <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
          <i>Using Technology For Learning</i>
        </div>
        <!-- Default to the left -->
        <strong>EGyaan</strong>
      </footer>
      <!-- Control Sidebar -->
        <!-- Tab panes -->
    <!-- REQUIRED JS SCRIPTS -->
    <!-- jQuery 2.1.4 -->
    <script src="../AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="../AdminLTE/bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../AdminLTE/dist/js/app.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>


  <script>
  function myFunction() {
    var x;
    if (confirm("Do you want to continue") == true) {
        
    } else {
        event.preventDefault() ;
        
    }
    //document.getElementById("demo").innerHTML = x;
}
$(document).ready(function() {
    $('#datePicker')
        .datepicker({
            format: 'mm/dd/yyyy'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
            $('#eventForm').formValidation('revalidateField', 'date');
        });

    $('#eventForm').formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {
                        message: 'The name is required'
                    }
                }
            },
            date: {
                validators: {
                    notEmpty: {
                        message: 'The date is required'
                    },
                    date: {
                        format: 'MM/DD/YYYY',
                        message: 'The date is not a valid'
                    }
                }
            }
        }
    });
});
</script>

    <!-- Optionally, you can add Slimscroll and FastClick plugins.
         Both of these plugins are recommended to enhance the
         user experience. Slimscroll is required when using the
         fixed layout. -->
  </body>
</html>
