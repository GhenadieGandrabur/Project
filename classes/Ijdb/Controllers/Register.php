<?php

namespace Ijdb\Controllers;

use \Ninja\DatabaseTable;
class Register{
    private $authorsTable;
    public function __construct(DatabaseTable $authorsTable)
    {
        $this->authorsTable = $authorsTable;
    }

    public function registrationForm(){
        return ['template' => 'register.html.php', 'title' => 'Regitre an account'];
    }

    public function success(){
        return ['template' => 'registersuccess.html.php', 'title' => 'Registration successful'];
    }

    public function registerUser()
    {
        $author = $_POST['author'];
        $valid = true;
        $errors = [];
        if (empty($author['name']))
        {
            $valid = false;
            $errors[] = 'Name cannot be blank.';
        }
        if(empty($author['email']))
        {
            $valid = false;
            $errors[] = "Email cannot be blank";
        }
        if(empty($author['password']))
        {
            $valid = false;
            $errors[] = 'Password cannot be blank';
        }
        if($valid == true)
        {
            $this->authorsTable->save($author);
            header('Location: /author/success');
        }else{
            return ['template' => 'register.html.php', 'title' => 'Regitre an account'];
        }

        $this->authorsTable->save($author);

        header('Location: /author/success');
    }

}