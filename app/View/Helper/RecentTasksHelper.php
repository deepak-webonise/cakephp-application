<?php
/**
 * Created by JetBrains PhpStorm.
 * User: root
 * Date: 24/11/14
 * Time: 1:05 PM
 * To change this template use File | Settings | File Templates.
 */
App::uses('AppHelper', 'View/Helper');
class RecentTasksHelper extends AppHelper{

    public $helpers = array('Html','Time','Form');

    public function recent($recentTasks){
        $data= null;
        $curdate = date('Y-m-d');

        foreach($recentTasks as $task){
            if($curdate != date("Y-m-d",strtotime($task['Task']['created']))){
                $data.= '<tr><td><h4>'.date("d-M-Y",strtotime($task['Task']['created'])).'</h4><td></tr>';
                $curdate = date("Y-m-d",strtotime($task['Task']['created']));
            }
            $data.= '<tr>';
            $data.=  '<td>'.$this->Html->link($task['Task']['title'],array('action' => 'view',$task['Task']['id'])).'</td>';
            $data.=  '<td>'.$this->Time->format('d M Y \a\t g:i A',$task['Task']['created']).'</td>';
            $data.=  '<td>'.$this->Html->link('Edit',array('controller'=>'tasks','action'=> 'edit',$task['Task']['id'])).'</td>';
            $data.=  '<td>'.$this->Form->postLink('Delete',array('controller'=>'tasks','action' => 'delete',$task['Task']['id']),array('confirm'=>'Are you sure')).'</td></tr>';

        }
        $data.= '<tr><td>'.$this->Html->link('Show All', array('controller'=>'tasks','action'=>'listTasks'),array('class'=>'resetButton btn-primary ')).'<td></tr>';

        return $data;
    }

    /**
     * @param $todayTasks
     */
    public  function todayTasks($todayTasks){

        foreach($todayTasks as $task){

            echo '<tr>';
            //  echo '<td>'.$this->Html->link($task['Task']['id'],array('action' => 'view',$task['Task']['id'])).'</td>';
            echo '<td>'.$this->Html->link($task['Task']['title'],array('action' => 'view',$task['Task']['id'])).'</td>';
            echo '<td>'.$this->Time->format('d M Y \a\t g:i A',$task['Task']['created']).'</td>';
            echo '<td>'.$this->Html->link('Edit',array('controller'=>'tasks','action'=> 'edit',$task['Task']['id'])).'</td>';
            echo '<td>'.$this->Form->postLink('Delete',array('controller'=>'tasks','action' => 'delete',$task['Task']['id']),array('confirm'=>'Are you sure')).'</td>';
        }


    }

}