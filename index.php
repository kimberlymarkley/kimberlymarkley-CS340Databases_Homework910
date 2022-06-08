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

<p>
    Sample Interesting Queries: 
    <br> 
    <br>
    1) Asteroids, Comets that have a Mass less than Earth's Mass but greater than Mercury's Mass
    <br>
    <br>
    SELECT A.Aid, C.Cid, A.Mass, C.Mass 
    <br>
    FROM ASTEROID AS A, COMET AS C
    <br>
    WHERE 
    <br>    A.Mass > (SELECT Mass FROM PLANET WHERE Pid = 'Mercury') AND
    <br>    A.Mass < (SELECT Mass FROM PLANET WHERE Pid = 'Earth') AND
    <br>    C.Mass > (SELECT Mass FROM PLANET WHERE Pid = 'Mercury') AND
    <br>    C.Mass < (SELECT Mass FROM PLANET WHERE Pid = 'Earth');
    <br>
    ^^^^^^^^ This is not correct. ^^^^^^^^
    <br>
    Select A.Name, C.Name, A.Mass, C.Mass FROM Asteroid as A, Comet as C;
    <br>
    <br> 
    2) Diameter and Radius of all Stars, Planets, Moons, Asteroids, and Comets
    <br>
    3) ?
    <br>
    4) ?
    <br>
    5) ?
</p>

<?php mysqli_close($db); ?>
<?php include 'footer.php'; ?>