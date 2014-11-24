<?php
/**
 * Created by JetBrains PhpStorm.
 * User: root
 * Date: 24/11/14
 * Time: 11:56 AM
 * To change this template use File | Settings | File Templates.
 */

class ListTasksComponent extends Component {


    public function PaginateTasks(){

        $conditions = array();
        $user_id = $this->Auth->user('User.id');

        if($user_id != '1'){
            array_push($conditions,'user_id ='.$user_id);
        }

        $this->load('Tasks');
        $this->Paginator->settings = array(
            'limit' => 5,
            'fields' => array('Task.id','Task.title','Task.created','Technology.name','Type.name','User.username'),
            'order' => 'Task.created desc',

        );
        $data = $this->Paginator->paginate('Task');
        try{
            $this->set('tasksList',$data);
        }catch (NotFoundException $e){
            $this->redirect(array('action'=>'listTasks'));
        }


    }


}