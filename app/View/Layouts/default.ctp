<?php
$cakeDescription = __d('cake_dev', 'Task Management System');
$cakeVersion = __d('cake_dev', 'CakePHP %s', Configure::version())
?>
<!DOCTYPE html>
<html>
<head>
	<?php echo $this->Html->charset(); ?>
	<title>
		<?php echo $cakeDescription ?>:
		<?php echo $this->fetch('title'); ?>

    </title>
    <?php
        echo $this->Html->script('jquery-1.11.1.min');
        echo $this->Html->script('jquery.validate');
        echo $this->Html->script('bootstrap');


		echo $this->Html->meta('icon');

		echo $this->Html->css('bootstrap');

		echo $this->fetch('meta');
		echo $this->fetch('css');
		echo $this->fetch('script');
	?>
</head>
<body>
	<div class="container">
		<div class="nav navbar navbar-default">
            <div class="navbar-brand">
                <?php echo $this->Html->link($cakeDescription, '#'); ?>
            </div>
            <ul class="nav navbar-nav navbar-right">

                <?php echo $this->element('menu');?>
            </ul>

		</div>
		<div class="row">

			<?php echo $this->Session->flash(); ?>

			<?php echo $this->fetch('content'); ?>
		</div>
		<div id="footer">

		</div>
	</div>
	<?php //echo  $this->element('sql_dump'); ?>
</body>
</html>
