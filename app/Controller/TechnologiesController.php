<?php
/**
 * Created by JetBrains PhpStorm.
 * User: root
 * Date: 4/11/14
 * Time: 2:20 PM
 * To change this template use File | Settings | File Templates.
 */
class TechnologiesController extends AppController {



    public function index(){
       $this->set('technologies', $this->Technology->showAll());
    }

    /**
     * add new technology.
     */

    public function add(){

        $this->layout = 'ajax';
        $this->autoRender = false;
        if($this->request->is('ajax')){
            if($this->Technology->addTechynology($this->request->data)){
                echo 'success';
            }else{
                echo'fail';
            }

        }

    }


    /**
     * @param null $id
     * @throws NotFoundException
     * Description : Edit existing technology
     */
    public function edit($id = null){

        $tech = $this->Technology->findTechById($id);
        if(empty($tech) || $tech == null){
            throw new NotFoundException(__('Invalid Technology'));
        }
        if($this->request->is(array('post','put'))){

            if($this->Technology->editTechnology($this->request->data)){
                $this->Session->setFlash('<p class="text-success">Updated Successfully</p>');
                $this->redirect(array('action'=>'index'));

            }
            $this->Session->setFlash('<p class="text-danger">Unsuccessful. Please Try once again.</p>');
        }

        if(empty($this->request->data)){
            $this->request->data = $tech;
        }


    }


    /**
     * @param null $id
     */
    public function delete($id = null){


        if($this->request->is('get')){
            $this->Session->setFlash('Invalid Operation');
            $this->redirect(array('action'=>'index'));
        }
        if($id){
            if($this->Technology->deleteTechnology($id)){
                $this->Session->setFlash('<p class="text-success">Technology Deleted Successfully</p>');
                $this->redirect(array('action'=>'index'));
            }
        }
        $this->Session->setFlash('<p class="text-danger">Technology Deleted Unsuccessfully</p>');
        $this->redirect(array('action'=>'index'));

    }

    public function autoCompleteList(){
        $this->layout='ajax';
        $this->autoRender =false;
        if($this->request->is('ajax')){
            $result = $this->Technology->find('list');
            echo json_encode($result);
        }
    }

}