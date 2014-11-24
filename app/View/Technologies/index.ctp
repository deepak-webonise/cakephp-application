<script type="text/javascript">

    $(document).ready(function(e){

        $("#TechnologyAddForm").validate({

            rules: {
                "data[Technology][name]": {
                    required: true,
                    minlength: 4,
                    maxlength:30
                }

            },
            submitHandler: function(form) {
                var formData = $("#TechnologyAddForm").serialize();
                alert(formData);
                var formUrl = $("#TechnologyAddForm").attr('action');

                $.ajax({
                    url: formUrl,
                    data: formData,
                    type:'post',
                    success:function(data,txtStatus,xhr){
                        if(data == 'success'){
                            alert('Successfully Added');
                            window.location='technologies/index';
                        }else{
                            alert('Unsuccessful to add new technology');
                        }
                    },
                    error:function(xhr,txtStatus,errorThrown){
                        alert(errorThrown);

                    }

                });
            }
        });
    });
</script>
<h1>Categories</h1>
 <div class="col-lg-12 form-group">
     <form id="TechnologyAddForm" name="TechnologyAddForm" action="/technologies/add">
         <div class="form-group col-lg-3">
             <input class="form-control" type="text" name="data[Technology][name]" id="TechnologyName" placeholder="Enter Technology"/>
         </div>
         <div class="form-group col-lg-3">
             <input type="submit" value="Add" class="btn btn-primary">
         </div>
     </form>

 </div>

<table class="table">
    <th>id</th>
    <th>Name</th>
    <th></th>
    <?php

    foreach($technologies as $row){

        echo '<tr>';
        echo '<td>'.$this->Html->link($row['Technology']['id'],'#').'</td>';
        echo '<td>'.$this->Html->link($row['Technology']['name'],'#').'</td>';

        if($this->Session->read('Auth.User')){
            echo '<td>'.$this->Html->link('Edit',array('action'=> 'edit',$row['Technology']['id'])).'</td>';
            echo '<td>'.$this->Form->postLink('Delete',array('action' => 'delete',$row['Technology']['id']),array('confirm'=>'Are you sure')).'</td>';

        }


    }

    ?>

</table>