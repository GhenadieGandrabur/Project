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

    public function list()
    {
        $result = $this->jokeTable->findAll();

        $jokes = [];
        foreach ($result as $joke) {
            $author = $this->authorsTable->findById($joke['authorId']);
            $jokes[] = [
                'id' => $joke['id'],
                'joketext' => $joke['joketext'],
                'jokedate' => $joke['jokedate'],
                'name' => $author['name'],
                'email' => $author['email']
            ];
        }

        $title = 'Joke list';

        $totalJokes = $this->jokeTable->total();

        ob_start();

        include  __DIR__ . '/../templates/jokes.html.php';

        $output = ob_get_clean();   
    }
    public function home()
    {
        $title = 'Internet Joke Database';
        ob_start();
        include  __DIR__ . '/../templates/home.html.php';
       $output = ob_get_clean();
    }
    public function delete()
    {
        $this->jokesTable->delete($_POST['id']);
        header('location: jokes.php');
    }
    public function edit()
    {
        if (isset($_POST['joke'])) {

            $joke = $_POST['joke'];
            $joke['jokedate'] = new DateTime();
            $joke['authorId'] = 1;

            $this->jokesTable->save($joke);

            header('location: jokes.php');
        } else {

            if (isset($_GET['id'])) {
                $joke = $this->jokesTable->findById($_GET['id']);
            }

            $title = 'Edit joke';

            ob_start();

            include  __DIR__ . '/../templates/editjoke.html.php';

            $output = ob_get_clean();
        }
    }

}
