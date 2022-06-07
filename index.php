<?php include 'header.php'; ?>

<main>

<?php
   $db = new SQLite3('hw9.db');
   if($db->connect_error) {
      die("Error: Could not connect to database. " . $db->connect_error);
   }



   
?>

<form action="?" method="post">
    <input style="width: XX%" type="text" name="query" placeholder="SELECT * FROM TableName">
    <input type="submit" value="Execute Query">
</form>

<pre>
<?php 
    if (isset($_POST['query'])) {
        $query = $_POST['query'];
        $res = $db->query($query);
        while($row = $res->fetchArray(SQLITE3_ASSOC)) {
            print_r($row);
            echo "<br>";
        }
    }
?>
</pre>
</main>

<?php include 'footer.php'; ?>