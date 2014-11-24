<?php
    if($this->Session->check('Auth.User')){

        $user = $this->Session->read('Auth.User');

        if($user['User']['group_id']== 1){
            echo '<li>'.$this->Html->link('Home','/').'</li>';
            echo '<li>'.$this->Html->link('Tasks',array('controller'=>'Tasks','action'=>'adminListTasks')).'</li>';
            echo '<li>'.$this->Html->link('Categories',array('controller'=>'technologies','action'=>'index')).'</li>';
            echo '<li class="dropdown">';
            echo '<a href="#" class="dropdown-toggle" data-toggle="dropdown">'.$user['User']['username'].'<span class="caret"></span></a>';
            echo '<ul class="dropdown-menu" role="menu">';

            echo '<li>';
            echo $this->Html->link('Dashboard',array('controller'=>'Admins','action'=>'dashboard'));
            echo '</li>';


            echo '<li>';
            echo $this->Html->link('Logout',array('controller'=>'Users','action'=>'logout'));
            echo '</li>';

            echo '</ul></li>';


        }else{
            echo '<li>'.$this->Html->link('Home','/').'</li>';
            echo '<li>'.$this->Html->link('Tasks',array('controller'=>'tasks','action'=>'listTasks')).'</li>';
            echo '<li>'.$this->Html->link('Categories',array('controller'=>'technologies','action'=>'index')).'</li>';
            echo '<li class="dropdown">';
            echo '<a href="#" class="dropdown-toggle" data-toggle="dropdown">'.$user['User']['username'].'<span class="caret"></span></a>';
            echo '<ul class="dropdown-menu" role="menu">';

            echo '<li>';
            echo $this->Html->link('Dashboard',array('controller'=>'Users','action'=>'dashboard'));
            echo '</li>';


            echo '<li>';
            echo $this->Html->link('Logout',array('controller'=>'Users','action'=>'logout'));
            echo '</li>';

            echo '</ul></li>';
        }

    }else {

        echo '<li>';
        echo $this->Html->link('Login',array('controller'=>'Users','action'=>'login'));
        echo '</li>';

    }

?>
