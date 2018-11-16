<?php

  try {
    $pdo = new PDO('mysql:host=localhost;dbname=suggestions', 'root', '');
    $search = htmlspecialchars($_GET['search']);

    $query = 'SELECT libelle FROM category WHERE libelle LIKE :search';

    $select = $pdo->prepare($query);
    $select->execute(['search' => '%'.$search.'%']);

    $rows = $select->fetchAll();

    $result = [];

    foreach ($rows as $key => $row) {
      $result[]= $row['libelle'];
    }

    if(count($result) > 0)
      echo implode(';',$result);

  } catch (PDOException $e) {
    var_dump($e);
  }
