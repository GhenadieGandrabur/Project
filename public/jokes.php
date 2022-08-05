<?php

try {
	include __DIR__ . '/../includes/DatabaseConnection.php';
	include __DIR__ . '/../classes/DatabaseTable.php';
    
	$jokeTable = new DatabaseTable($pdo, 'joke', 'id');
	$authorTable = new DatabaseTable($pdo, 'author', 'id');
	  
	$result = $jokeTable->findAll();

	$jokes = [];
	foreach ($result as $joke) {
		$author = $authorTable->findById($joke['authorId']);

		$jokes[] = [
			'id' => $joke['id'],
			'joketext' => $joke['joketext'],
			'jokedate' => $joke['jokedate'],
			'name' => $author['name'],
			'email' => $author['email']
		];

	}


	$title = 'Joke list';

	$totalJokes = $jokeTable->total();

	ob_start();

	include  __DIR__ . '/../templates/jokes.html.php';

	$output = ob_get_clean();

}
catch (PDOException $e) {
	$title = 'An error has occurred';

	$output = 'Database error: ' . $e->getMessage() . ' in ' . '<br>'.
	$e->getFile() . ':' . $e->getLine();
}

include  __DIR__ . '/../templates/layout.html.php';