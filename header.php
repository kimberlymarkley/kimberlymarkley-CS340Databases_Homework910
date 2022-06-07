<!DOCTYPE html>
<html lang="en-us">
<head>
  <title>Homework 9</title>
  <link rel="stylesheet" type="text/css" media="all" href="/assets/stylesheets/main.css">
  <style>
  </style>
  <!-- <script src="/assets/javascript/main.js"></script> -->
</head>
<body>
  <header>
    <h1><a href="/">Homework 9</a></h1>
    <nav>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/assets/eer-diagram.pdf">EER Diagram</a></li>
        <li><a href="/assets/relational-schema.pdf">Relational Schema</a></li>
      </ul>
      <a class="lnk_right" href="/cart.php">Cart (<?= $numberOfItemsInCart ?>)</a>
      <a class="lnk_right" href="/wishlist.php">Wish List (<?= $wishListLength ?>)</a>
      <a class="lnk_right" href="/motorcycles/new.php">+ Add a Bike</a>
    </nav>
  </header>
  <main>