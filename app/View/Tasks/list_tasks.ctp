<?php
    echo $this->Html->script('jquery-ui');
?>
<script type="text/javascript">

$(document).ready(function(e){

    $("#TaskAddForm").validate({

        rules: {
            "data[Task][title]": {
                required: true,
                minlength: 4,
                maxlength:30
            }
        },
        messages : {
            "data[Task][duration]" :{
                number : 'Please insert valid number'
            }

        },
        submitHandler: function(form) {

            var formData = $("#TaskAddForm").serialize();
           // alert(formData);

            var formUrl = $("#TaskAddForm").attr('action');
            //alert(formUrl);
            $.ajax({
                type:'post',
                url:formUrl,
                data:formData,
                success: function(data,textStatus,xhr){

                   if(data == 'success'){
                      alert('Successfully added');
                       window.location = '/tasks/listTasks';
                   }
                },
                error: function(xhr,textStatus,errorThrown){
                    alert(errorThrown);

                }

            });
            return false;
        }
    });
     var  availibletype = [];
     var availibleTech =[];
     $("#types").ready(function(){


         $.ajax({
                url:"/types/autoCompleteList",
                type:"post",
                success:function(data,txtStatus,xhr){
                    types = JSON.parse(data);

                    $.each(types,function(i,val){
                        availibletype.push(types[i]);
                    });
                },
                error:function(xhr,textStatus,errorThrown){
                    alert(errorThrown);
                }
         });
    });

    $("#TaskType").autocomplete({
        source: availibletype

    });

    $("#TaskTechnology").ready(function(){

        $.ajax({
            url:"/technologies/autoCompleteList",
            type:"post",
            success:function(data,txtStatus,xhr){
                types = JSON.parse(data);

                $.each(types,function(i,val){
                    availibleTech.push(types[i]);
                });
            },
            error:function(xhr,textStatus,errorThrown){
                alert(errorThrown);
            }

        });

    });

    $("#TaskTechnology").autocomplete({
        source: availibleTech

    });

    $("#SearchForm").submit(function(){

        var type = $.trim($("#TaskType").val());
        var technology = $.trim($('#TaskTechnology').val());
        var created = $.trim($('#TaskCreated').val());


        if(type.length === 0 && technology.length === 0 && created === ''){
            alert('Please enter any one field for search');

            return false;

        }else{

            return true;
        }

    });

});
</script>

<h1>List of Tasks</h1>

<div class="col-lg-12 te">
    <!-- ADD new task form -->
    <form method="post" id="TaskAddForm" name="TaskAddForm"  action="/tasks/add">
        <div class=" col-lg-2 form-group">
            <input name="data[Task][title]" id="TaskTitle" class="form-control" placeholder="Enter Title">

        </div>
        <div class="col-lg-1 form-group">
            <input class="btn btn-primary" type="submit" value="Add">
        </div>

    </form>

    <!-- SEARCH FORM -->
    <form id="SearchForm" name="SearchForm" action="/tasks/listTasks" method="post">
    <div class="col-lg-2 form-group">
        <input class="form-control" type="text"  name="data[Task][Type]" id="TaskType" placeholder="search by type" autocomplete="off"/>
    </div>
    <div class="col-lg-2 form-group">
        <input class="form-control" type="text"  name="data[Task][Technology]" id="TaskTechnology" placeholder="search by Technology" autocomplete="off"/>
    </div>
        <div class="col-lg-2 form-group">
            <input class="form-control" type="date"  name="data[Task][created]" id="TaskCreated" autocomplete="off"/>
        </div>
    <div class="col-lg-2 form-group">
        <input class="btn btn-primary" type="submit" value="Search"/>
        <a class="resetButton btn-primary" href="/tasks/listTasks">Reset</a>
    </div>
    </form>
</div>
<div  class="col-lg-12" >
    <?php  echo $this->Paginator->options(array('url' => array('sort' => 'created','direction'=>'desc'))); ?>
    <table class="table">
        <tr id="data">

            <th><?php echo $this->Paginator->sort('task_title','Title'); ?></th>
            <th><?php echo $this->Paginator->sort('technology_id','Technology'); ?></th>
            <th><?php echo $this->Paginator->sort('type_id','Type'); ?></th>
            <th><?php echo $this->Paginator->sort('task_date','Date'); ?></th>
        </tr>

        <?php
        $i = 1;
        if(!empty($tasksList)){
            foreach($tasksList as $task){

                echo '<tr>';
               // echo '<td>'.$this->Html->link($i++,array('action' => 'view',$task['Task']['id'])).'</td>';
                echo '<td>'.$this->Html->link($task['Task']['title'],array('action' => 'view',$task['Task']['id'])).'</td>';
                echo '<td>'.$task['Technology']['name'].'</td>';
                echo '<td>'.$task['Type']['name'].'</td>';
                echo '<td>'.$this->Time->format('d M Y \a\t g:i A',$task['Task']['created']).'</td>';
                echo '<td>'.$this->Html->link('Edit',array('action'=> 'edit',$task['Task']['id'])).'</td>';
                echo '<td>'.$this->Form->postLink('Delete',array('action' => 'delete',$task['Task']['id']),array('confirm'=>'Are you sure')).'</td>';

            }
        }else{
            echo '<p class="text-danger">No records found.</p>';
        }

        ?>
    </table>

    <nav>
        <ul class="pagination">
            <?php
              echo $this->Paginator->numbers( array( 'tag' => 'li', 'separator' => '', 'currentClass' => 'active', 'currentTag' => 'a' ) );
              echo $this->Js->writeBuffer();
            ?>
        </ul>
    <nav>

</div>



