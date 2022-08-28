<?php
$route = $_SERVER['REQUEST_URI'];
echo $route;
echo "<br>";
$method = $_SERVER['REQUEST_METHOD'];
echo $method;
echo "<br>";
$cars = ['Volvo'=>['740', '741'], 'MB'=>['Models'=> ['525','750']] , 'BMW'];
echo $cars['MB']['Models'][0];