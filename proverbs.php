<?php

  try {
        $pdo = new PDO('mysql:host=localhost;dbname=suggestions', 'root', '');
        $category = isset($_GET['category'])?htmlspecialchars($_GET['category']):null;

        $query = 'SELECT  P.body
                  FROM    proverb P
                  JOIN    proverb_category C
                  ON      P.id = C.proverb_id
                  WHERE   C.category_id IN
                                    (
                                      SELECT id FROM category
                                      WHERE  libelle = :category
                                    )
                                    ';
        $select = $pdo->prepare($query);
        $select->execute([':category' => $category]);

        $rows = $select->fetchAll(PDO::FETCH_OBJ);
        echo json_encode($rows);

}catch (PDOException $e) {
    var_dump($e);
  }
