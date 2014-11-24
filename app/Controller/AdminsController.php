<?php
/**
 * Created by JetBrains PhpStorm.
 * User: root
 * Date: 21/11/14
 * Time: 5:15 PM
 * To change this template use File | Settings | File Templates.
 */

class AdminsController extends AppController {

    public $components = array('Paginator','RequestHandler');

    public function index(){

    }

    public function dashboard(){

        $this->loadModel('Task');
        $this->set('todayTasks',$this->Task->taskByDate());
        $this->set('recentTasks',$this->Task->recentTasks());

    }


}