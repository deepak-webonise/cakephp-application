
<div class="col-lg-2"></div>
<div class="col-lg-8">
    <h2>Dashboard</h2>
    <h3>Today Tasks</h3>
    <?php
    if(!empty($todayTasks)){
        ?>
        <table class="table">

            <th>Title</th>
            <th>Created On</th>
            <th></th>
            <th></th>

            <?php

                echo $this->RecentTasks->todayTasks($todayTasks);
            ?>
        </table>
        <?php
    }
    else{
        echo '<p class="text-danger">No records for today</p>';
    }
    ?>

    <h3>Recent 7 days tasks</h3>
    <?php
        if(!empty($recentTasks)){
    ?>
        <table class="table">

            <th>Title</th>

            <th>Created On</th>

            <th></th>


    <?php
            echo $this->RecentTasks->recent($recentTasks);
            echo '</table>';
        }else{
            echo '<p class="text-danger">No records for today</p>';
        }

    ?>
</div>