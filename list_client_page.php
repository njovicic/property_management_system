<?php
$subTitle = "list_client_page";
require_once('head.php');
// print_r($_SESSION);
?>
<?php if($u_name) {?>
<form class="form-ajax-post"
      data-action="./main/control.php?act=create_client"
      data-url="list_client_page.php">
    <h3 class="title">Create New Client</h3><br>
    <div id="newClient" class="form-group">
        <label>Client Name:</label>
        <input name="clientName" type="text" class="form-control"/>
    </div>
    <div id="newClient" class="form-group">
        <label>Address 1:</label>
        <input name="clientAddress1" type="text" class="form-control"/>
    </div>
    <div id="newClient" class="form-group">
        <label>Address 2:</label>
        <input name="clientAddress2" type="text" class="form-control"/>
    </div>
    <div id="newClient" class="form-group">
        <label>City:</label>
        <input name="clientCity" type="text" class="form-control"/>
    </div>
    <div id="newClient" class="form-group">
        <label>Province:</label>
        <input name="clientProv" type="text" class="form-control"/>
    </div>
    <div id="newClient" class="form-group">
         <label>Postal Code:</label>
         <input name="clientPostal" type="text" class="form-control"/>
    </div>
    <div id="newClient" class="form-group">
        <label>Phone Number 1:</label>
        <input name="clientPhone1" type="text" placeholder="123-123-1234" class="form-control">
    </div>
    <div id="newClient" class="form-group">
        <label>Phone Number 2:</label>
        <input name="clientPhone2" type="text" class="form-control">
    </div>
    <div id="newClient" class="form-group">
        <label>Email: </label>
        <input name="clientEmail" type="text" class="form-control">
    </div>
    <div id="newClient" class="form-group">
        <label>Details: </label>
        <input name="clientDetails" type="text" class="form-control">
    </div>
    <div id="newClientButton" class="form-group tT010 ">
        <button class="form-ajax-btn" type="submit">Add a New Client</button>
    </div>
    <br>
</form>
<h3 class="title">List of Clients</h3><br>
<?php $arr = list_clients(); ?>
<table class="table">
    <thead>
    <tr>
        <td>Client Mame</td>
        <td>Address 1</td>
        <td>Address 2</td>
        <td>City</td>
        <td>Province</td>
        <td>Postal Code</td>
        <td>Phone Number 1</td>
        <td>Phone Number 2</td>
        <td>Email</td>
        <td>Details</td>
        <td></td>
        <td></td>
    </tr>
    </thead>
    <tbody>

    <?php foreach($arr as $k => $v){ ?>
    <tr>
        <td><?php echo $v["clientName"] ;?></td>
        <td><?php echo $v["clientAddress1"] ;?></td>
        <td><?php echo $v["clientAddress2"] ;?></td>
        <td><?php echo $v["clientCity"] ;?></td>
        <td><?php echo $v["clientProv"] ;?></td>
        <td><?php echo $v["clientPostal"] ;?></td>
        <td><?php echo $v["clientPhone1"] ;?></td>
        <td><?php echo $v["clientPhone2"] ;?></td>
        <td><?php echo $v["clientEmail"] ;?></td>
        <td><?php echo $v["clientDetails"] ;?></td>
        <td><a href="./edit_client_page.php?id=<?php echo $v['clientId']?>">Edit</a></td>
        <td><a href="./main/control.php?act=del_client&clientName=<?php echo $v["clientName"]?>">Delete</a></td>
    </tr>

    <?php  } ?>
    </tbody>
</table>
<?php }else{?>
<h3 class="title">Please login/register first</h3>
<?php } require_once('foot.php'); ?>