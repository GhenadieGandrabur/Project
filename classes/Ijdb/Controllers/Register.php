<?php

namespace Ijdb\Controllers;

use \Ninja\DatabaseTable;
class RegisterController{
    private $authorsTable;
    public function __construct(DatabaseTable $authorsTable)
    {
        $this->authorsTable = $authorsTable;
    }
    public function showForm(){

    }

}