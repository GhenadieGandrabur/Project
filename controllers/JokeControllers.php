<?php
class JokeKontroller
{
private $jokesTable;
private $authorsTable;

public function __construct( DatabaseTable $jokesTable,  $authorsTable)
{
    $this->$jokesTable = $jokesTable;
    $this->authorsTable = $authorsTable;
    
}



}