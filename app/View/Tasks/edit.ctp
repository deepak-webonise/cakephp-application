<h2>Edit Task</h2>
<script type="text/javascript">

    $(document).ready(function(){

        $("#TaskEditForm").validate({

            rules: {
                "data[Task][title]": {
                    required: true,
                    minlength: 4,
                    maxlength:30
                }
            },
            submitHandler: function(form) {
                var formData = $("#TaskEditForm").serialize();
                // alert(formData);
                console.log(formData);

                var formUrl = $("#TaskEditForm").attr('action');
                //alert(formUrl);
                $.ajax({
                    type:'post',
                    url:formUrl,
                    data:formData,
                    success: function(data,textStatus,xhr){
                        alert(data);
                    },
                    error: function(data,textStatus,xhr){
                        alert('error');

                    }

                });
                return false;
            }
        });
    });
</script>
<div class="col-lg-3">
    <?php echo $this->Form->create('Task', array('novalidate'=>'novalidate')); ?>
   <!-- <form action="/tasks/add" method="post" id="TaskAddForm" name='TaskAddForm' novalidate="novalidate">-->
        <div class="form-group">
            <label class="control-label" for="TaskTitle">Title*</label>
            <?php echo $this->Form->input('title',array('class'=>'form-control','label'=>false)); ?>
        </div>
        <div class="form-group">
            <label class="control-label" for="TaskDuration">Duration</label>
           <?php echo $this->Form->input('duration',array('class'=>'form-control','label'=>false)); ?>
        </div>
        <div class="form-group">
            <label class="control-label" for="TaskComments">Comments</label>
           <?php echo $this->Form->input('comments',array('class'=>'form-control','label'=>false));?>
        </div>
        <div class="form-group">
            <label class="control-label">Technology</label>
            <?php
            echo $this->Form->input('technology_id',array('class'=>'form-control','label'=>false,'name'=>'data[Task][technology_id]'));
            ?>
        </div>
        <div class="form-group">
            <label class="control-label">Category</label>
            <?php
                echo $this->Form->input('type_id',array('class'=>'form-control','label'=>false,'name'=>'data[Task][type_id]'));

                echo $this->Form->input('id', array('type'=>'hidden'));
            ?>
        </div>

        <button class="btn btn-primary" type="submit" id="sub">Update</button>
        <?php echo $this->Form->end();?>
    </form>
</div>




<?php
/*

echo $this->Form->input('title');
echo $this->Form->input('duration');
echo $this->Form->input('comments',array('rows'=>2));
echo $this->Form->input('technology_id');
echo $this->Form->input('type_id');
echo $this->Form->input('closed', array('label'=>'Task Completed','minYear' => date('Y') - 0 ,'maxYear'=>date('y') - 1));
echo $this->Form->input('id', array('type'=>'hidden'));
echo $this->Form->end('Update');*/
?>