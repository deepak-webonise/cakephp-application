<?php
/**
 * Created by JetBrains PhpStorm.
 * User: root
 * Date: 4/11/14
 * Time: 2:09 PM
 * To change this template use File | Settings | File Templates.
 */
class TasksController extends AppController {

    public $components = array('Paginator','RequestHandler','RecentTasks','Search.Prg');

    public $helpers = array('Html','Js','Form');

    public $presetVars = array(
        array(
            'field' => 'title',
            'type' => 'like'
        )
    );

    /**
     * Description : categories the tasks by date and group
     */
    public function index(){
        $this->set('group',$this->Task->taskByGroup());
    }

    /**
     * Description : return list of tasks
     */
    public function listTasks(){

        $condition = $this->_returnSearchCondition();
        if(empty($this->passedArgs)){
            $this->Session->write('pgCondition',$condition);
        }

        if($this->request->is('post')){

            $condition = $this->_returnSearchCondition();
            $this->Session->write('pgCondition',$condition);
            $this->paginate = array(
                'limit' => 5,
                'fields' => array('Task.id','Task.title','Task.created','Technology.name','Type.name'),
                'conditions' => $condition,
                'order' => 'Task.created desc'
            );
        }

        if($this->request->is('get')){
            $this->paginate = array(
                'limit' => 5,
                'fields' => array('Task.id','Task.title','Task.created','Technology.name','Type.name'),
                'conditions' => $this->Session->read('pgCondition'),
                'order' => 'Task.created desc'
            );
        }

        try{
            $this->set('tasksList',$this->paginate());
        }catch (NotFoundException $e){
            $this->redirect(array('action'=>'listTasks'));
        }
    }

    /**
     * Description : Display all tasks to admin
     */
    public function adminListTasks(){

        $condition = $this->_returnSearchCondition();
        if(empty($this->passedArgs)){
            $this->Session->write('pgCondition',$condition);
        }

        // Setting search options
        if($this->request->is('post')){
            $condition = $this->_returnSearchCondition();
            $this->Session->write('pgCondition',$condition);
            $this->paginate = array(
                'limit' => 5,
                'fields' => array('Task.id','Task.title','Task.created','Technology.name','Type.name','User.username'),
                'conditions' => $condition,
                'order' => 'Task.created desc'
            );
        }
        if($this->request->is('get')){
            $this->paginate = array(
                'limit' => 5,
                'fields' => array('Task.id','Task.title','Task.created','Technology.name','Type.name','User.username'),
                'conditions' => $this->Session->read('pgCondition'),
                'order' => 'Task.created desc'
            );
        }

        try{
            $this->set('tasksList',$this->paginate());
        }catch (NotFoundException $e){
            $this->redirect(array('action'=>'adminListTasks'));
        }
    }

    /**
     * Add new task
     */
    public function add(){

        $user_id = $this->Auth->user('User.id');
        $this->layout = 'ajax';
        $this->autoRender = false;
        if($this->request->is('ajax')){
            $this->request->data['Task']['user_id'] = $user_id;
            if(!empty($this->request->data)){
                if($this->Task->addTask($this->request->data)){
                  echo "success";
                }
                else{
                    echo 'fail';
                }
            }
        }
    }


    /**
     * @param null $id
     * @throws NotFoundException
     * Description : update tasks
     */
    public function edit($id = null){

        /*Load Technologies*/
        $technologies = $this->Task->Technology->find('list');
        $this->set(compact('technologies'));

        /*Load Types*/
        $types = $this->Task->Type->find('list');
        $this->set(compact('types'));

        $task = $this->Task->findById($id);
        if(empty($task)){
            throw new NotFoundException(__('Invalid Task'));
        }
        if($this->request->is(array('ajax'))){
            if($this->Task->editTask($this->request->data)){
                $this->layout='ajax';
                echo 'success';
            }
            else{
                echo 'fail';
            }
        }
        if(empty($this->request->data))
        {
            $this->request->data = $task;
        }
    }

    /**
     * @param null $id
     * @throws NotFoundException
     */
    public function view($id=null)
    {
       if(!empty($id)){
           $task = $this->Task->taskById($id);
           if(!empty($task)){
               $this->set('task',$task);
           }
           else{
               $this->Session->setFlash('<p class="text-danger">Please select valid task from following</p>');
               $this->redirect(array('action'=>'listTasks'));
           }
       }
       else
       {
           $this->Session->setFlash('<p class="text-danger">Please select valid task from following</p>');
           $this->redirect(array('action'=>'listTasks'));
       }
    }

    /**
     * @param null $id
     * @throws MethodNotAllowedException
     */
    public function delete($id= null)
    {
        if($this->request->is('get')){
            throw new MethodNotAllowedException(__('Not Allowed to Delete'));
        }
        if($id){
            if($this->Task->deleteTask($id)){
                $this->Session->setFlash('<p class="text-success text-center">Task Deleted Successfully</p>');
                $this->redirect($this->referer());
            }
            else{
                $this->Session->setFlash('<p class="text-danger text-center">Unsuccessful to Delete</p>');
                $this->redirect($this->referer());
            }
        }
    }

    /**
     * @return mixed
     * Description : Return user selected criteria for filtering data.
     */
    public function _returnSearchCondition(){

        $condition = array();
        $user_id = $this->Auth->user('User.id');
        if($user_id != '1'){
            array_push($condition,'Task.user_id = '.$user_id);
        }
        if(!empty($this->request->data['Task']['Type'])){
            array_push( $condition,"Type.name LIKE '%".$this->request->data['Task']['Type']."%'");
        }
        if(!empty($this->request->data['Task']['Technology'])){
            array_push($condition,"Technology.name LIKE '%".$this->request->data['Task']['Technology']."%'");
        }
        if(!empty($this->request->data['Task']['created'])){
            array_push($condition,"Task.created LIKE '".$this->request->data['Task']['created']." %' ");
        }
        if(!empty($this->request->data['Task']['username'])){
            array_push($condition,"User.username = '".$this->request->data['Task']['username']."' ");
        }
        return $condition;
    }
}