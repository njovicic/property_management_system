<?php
$subTitle = "list_item_page";
require_once('head.php');
?>
<?php if($u_name) {?>
<form class="form-ajax-post"
      data-action="./main/control.php?act=create_item"
      data-url="list_item_page.php">
    <h3 class="title">Create New Item</h3><br>
    <div id="newItem" class="form-group">
        <label>Item name:</label>
        <input name="itemName" type="text" class="form-control"/>
    </div>
    <div id="newItem" class="form-group">
        <label>Description:</label>
        <input name="itemDescription" type="text" class="form-control"/>
    </div>
    <div id="newItem" class="form-group">
        <label>Standard:</label>
        <select id="newItemStandard" name="itemStandard">
            <option value="1">Standard</option>
            <option value="0">Upgrade</option>
        </select>
    </div>

    <div id="newItem" class="form-group">
        <label>Type:</label>
        <select id="newItemType" name="itemType">
        <?php $types = listTypes();foreach($types as $k=>$v){?>
            <option value = <?php echo $v["typeId"]?>><?php echo $v["typeName"]?></option>
        <?php }?>
        </select>
    </div>

    <div id="newItem" class="form-group">
        <label>Manufacturer:</label>
        <select id="newItemManufacturer" name="itemManufacturer">
        <?php $manus = listManus(); foreach($manus as $p=>$j) {?>
            <option value = <?php echo $j["manuId"]?>><?php echo $j["manuName"]?></option>
        <?php }?>
        </select>
    </div>

    <div id="newItemButton" class="form-group tT010 ">
        <button class="form-ajax-btn" type="submit">Add a New Item</button>
    </div>
    <br>
</form>
<hr>
<h3 class="title">List of Items</h3><br>
<?php $arr = list_items(); ?>
<table class="table">
    <thead>
    <tr>
        <td>Item name</td>
        <td>Description</td>
        <td>Standard</td>
        <td>Type</td>
        <td>Manufacturer</td>
        <td></td>
        <td></td>
    </tr>
    </thead>
    <tbody>

    <?php foreach($arr as $k => $v){ ?>
    <tr>
        <td><?php echo $v["itemName"] ;?></td>
        <td><?php echo $v["itemDescription"] ;?></td>
        <td><?php echo $v["itemStandard"] ;?></td>
        <td><?php echo $v["typeName"] ;?></td>
        <td><?php echo $v["manuName"] ;?></td>
        <td><a href="./edit_item_page.php?id=<?php echo $v["itemId"]?>">Edit</a></td>
        <td><a href="./main/control.php?act=del_item&id=<?php echo $v["itemId"]?>">Delete</a></td>
    </tr>

    <?php  } ?>
    </tbody>
</table>
<?php }else{?>
<h3 class="title">Please login/register first</h3>
<?php }?>

<?php require_once('foot.php'); ?>