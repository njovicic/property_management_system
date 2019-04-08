<?php
$subTitle = "login";
require_once('head.php');
?>

<?php if($u_name) {?>
<form class="form-ajax-post"
data-action="./main/control.php?act=create_appointment"
    data-url="index.php">
    <h3 class="title">Create New Appointment</h3><br>
	<div id="newAppointment" class="form-group">
		<label for="clientName">Client name:</label>
		<input name="clientName" type="text" class="form-control"/>
	</div>
	<div id="newAppointment" class="form-group">
		<label for="apptDate">Date and Time:</label>
		<input name="apptDate" type="text" placeholder="YYYY-MM-DD HH:MM:SS" data-clear-btn="true" class="form-control"/>
	</div>
	<div id="newAppointmentButton" class="form-group ">
		<button class="form-ajax-btn " type="submit">Submit</button>
	</div>
    <br>
</form>
    <h3 class="title">My Upcoming Appointments</h3><br>
    <?php $arr = list_appointments(); ?>
    <table class="table">
        <thead>
        <tr>
            <td>Appointment time</td>
            <td>Client name</td>
            <td>Client phone</td>
            <td>Client email</td>
            <td></td>
            <td></td>
        </tr>
        </thead>
        <tbody>
        <?php foreach($arr as $k => $v){ ?>
            <tr>
                <td><?php echo $v["apptDate"] ;?></td>
                <td><?php echo $v["clientName"] ;?></td>
                <td><?php echo $v["clientPhone1"] ;?></td>
                <td><?php echo $v["clientEmail"] ;?></td>
                <td><a href="./edit_appointment_page.php?apptDate=<?php echo $v['apptDate']?>">Edit</a></td>
                <td><a href="./main/control.php?act=del_appointment&apptDate=<?php echo $v['apptDate']?>?>">Delete</a></td>
            </tr>
        <?php  } ?>
        </tbody>
    </table>
<?php }else{?>
    <h3 class="title">Please login/register first</h3>
<?php } require_once('foot.php'); ?>