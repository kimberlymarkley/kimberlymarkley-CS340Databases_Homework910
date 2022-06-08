<?php include 'header.php'; ?>

<main>
    <div id="explanation">
        <h2>Welcome to the Celestial Body Database</h2>
        <p>
            This database contains information about The Solar System.
            Each planet has a name, a radius, a mass, and a distance from the sun.
        </p>
    </div>


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
    <table id="data">
        <thead>
            <tr>
            </tr>
        </thead>
        <tbody>
            <?php 
                if (isset($_POST['query'])) {
                    $query = $_POST['query'];
                    $res = $db->query($query);
                    while($row = $res->fetchArray(SQLITE3_ASSOC)) {
                        echo "<tr>";
                        foreach($row as $field) {
                            echo "<td>$field</td>";
                        }
                        echo "</tr>";
                    }
                }
            ?>
        </tbody>
    </table>
</pre>

<?php mysqli_close($db); ?>
<?php include 'footer.php'; ?>