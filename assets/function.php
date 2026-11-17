<?php
require_once 'db.php';

function getAllPanels() {
    $sql = "SELECT * FROM `produkt`";

    global $solpanel;
    $stmt = $solpanel->prepare($sql);
    $stmt->execute();
    return $stmt;
}