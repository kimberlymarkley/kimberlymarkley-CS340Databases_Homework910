<?php include 'header.php'; ?>

<?php
   $db = new SQLite3('filename.db');
   if(!$db) {
      echo $db->lastErrorMsg();
   } else {
      echo "Opened database successfully\n";
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