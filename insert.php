<?php 
        // $host = "128.235.248.149";
        // $port = "5432";
        // $dbname = "bpusurvey";
        // $user = "webinsert";
        // $password = "WebUser";

        // $connection_string = "host={$host} port={$port} dbname={$dbname} user={$user} password={$password} ;
        // $conn = pg_connect($connection_string);

        $con = mysqli_connect('ls-87f7666a53e3973d96f5de5085bf3a1b1d4bfb11.crmbx5ihylbr.us-east-1.rds.amazonaws.com', 'webinsert','WebUser','bpusurvey');
        if($con){
            echo "Connected"; 
        }else{
            echo "Error in connecting to database";
        }

        mysqli_select_db($con, 'bpusurvey');


        $inputAddress = $_POST['inputAddress'];
        $inputAddress2 = $_POST['inputAddress2'];
        $inputHouseType = $_POST['inputhousetype'];
        $inputCity = $_POST['inputCity'];
        $inputCounty = $_POST['inputCounty'];
        $inputZip = $_POST['inputZip'];
        $connection = $_POST['Connection'];
        $inputDownSpeed = $_POST['dsp'];
        $inputUpSpeed = $_POST['usp'];
        $inputServiceP = $_POST['inputservice'];
        $inputConnectType = $_POST['inputconnecttype'];
        $inputAfford = $_POST['afford'];
        $inputAccess = $_POST['access'];
        $inputNecessity = $_POST['necessity'];
        $comments =  $_POST['other'];
        
        $query = "INSERT INTO surveyresponse (streetAddress, aptNumber, housingType, city, county, zip, connection, downloadSpeed, uploadSpeed, internetSP, connectType, affordability, accessibility, necessity, comments) VALUES ('$inputAddress','$inputAddress2','$inputHouseType','$inputCity','$inputCounty','$inputZip','$connection','$inputDownSpeed','$inputUpSpeed','$inputServiceP','$inputConnectType','$inputAfford','$inputAccess','$inputNecessity','$comments') ";
        
        mysqli_query($con,$query);

        echo "Database updated!"; 

?>
