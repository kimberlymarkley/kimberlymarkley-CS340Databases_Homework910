<?php include '../header.php'; ?>

<main>

<div id="featured">
    <h2>Data Tables</h2>
    <p>
        Each of these data tables contains up to 5 random tuples of data.
        <br>
        <br>
        All size data is relative to Earth and all time measurements are relative to Earth's day length.
        For example, Earth's mass is recorded as 1. Neptune's mass is 17 times larger than Earth's mass, therefore Neptune's mass is recorded as 17.
    </p>
</div>

<?php
   $db = new SQLite3('hw9.db');
   if($db->connect_error) {
      die("Error: Could not connect to database. " . $db->connect_error);
   }
?>

<div>
    <h3>Planets</h3>
</div>
<table id="motorcycles">
    <thead>
        <tr>
            <th>Planet ID</th>
            <th>Name</th>
            <th>Mass</th>
            <th>Diameter</th>
            <th>Gravity</th>
            <th>Orbital Period</th>
            <th>Day Length</th>
            <th>Dwarf Planet</th>
        </tr>
    </thead>
    <tbody>
        <?php
            $sql_planets = "SELECT * FROM PLANET ORDER BY RANDOM() LIMIT 5";
            $planets = $db->query($sql_planets);
            while($row = $planets->fetchArray(SQLITE3_ASSOC)) {
                echo "<tr>";
                foreach($row as $field) {
                    echo "<td>$field</td>";
                }
                echo "</tr>";
            }
        ?>
    </tbody>
</table>

<div>
    <h3>Artificial Satellites</h3>
</div>
<table id="motorcycles">
    <thead>
        <tr>
            <th>Artificial Satellite ID</th>
            <th>Name</th>
            <th>Country of Origin</th>
        </tr>
    </thead>
    <tbody>
        <?php
            $sql_artificial_satellites = "SELECT * FROM ARTIFICIAL_SATELLITE ORDER BY RANDOM() LIMIT 5";
            $artificial_satellites = $db->query($sql_artificial_satellites);
            while($row = $artificial_satellites->fetchArray(SQLITE3_ASSOC)) {
                echo "<tr>";
                foreach($row as $field) {
                    echo "<td>$field</td>";
                }
                echo "</tr>";
            }
        ?>
    </tbody>
</table>

<div>
    <h3>Satellites</h3>
</div>
<table id="motorcycles">
    <thead>
        <tr>
            <th>Satellite ID</th>
            <th>Task Assigned to Satellite</th>
        </tr>
    </thead>
    <tbody>
        <?php
            $sql_satellite_tasks = "SELECT * FROM SATELLITE_TASK ORDER BY RANDOM() LIMIT 5";
            $satellite_tasks = $db->query($sql_satellite_tasks);
            while($row = $satellite_tasks->fetchArray(SQLITE3_ASSOC)) {
                echo "<tr>";
                foreach($row as $field) {
                    echo "<td>$field</td>";
                }
                echo "</tr>";
            }
        ?>
    </tbody>
</table>

<div>
    <h3>Aliens</h3>
</div>
<table id="motorcycles">
    <thead>
        <tr>
            <th>Alien ID</th>
            <th>Name</th>
            <th>Scentient?</th>
        </tr>
    </thead>
    <tbody>
        <?php
            $sql_aliens = "SELECT * FROM ALIEN_LIFE ORDER BY RANDOM() LIMIT 5";
            $aliens = $db->query($sql_aliens);
            while($row = $aliens->fetchArray(SQLITE3_ASSOC)) {
                echo "<tr>";
                foreach($row as $field) {
                    echo "<td>$field</td>";
                }
                echo "</tr>";
            }
        ?>
    </tbody>
</table>

<div>
    <h3>Stars</h3>
</div>
<table id="motorcycles">
    <thead>
        <tr>
            <th>Star ID</th>
            <th>Name</th>
            <th>Mass</th>
            <th>Luminosity</th>
            <th>Radius</th>
        </tr>
    </thead>
    <tbody>
        <?php
            $sql_stars = "SELECT * FROM STAR ORDER BY RANDOM() LIMIT 5";
            $stars = $db->query($sql_stars);
            while($row = $stars->fetchArray(SQLITE3_ASSOC)) {
                echo "<tr>";
                foreach($row as $field) {
                    echo "<td>$field</td>";
                }
                echo "</tr>";
            }
        ?>
    </tbody>
</table>

<div>
    <h3>Moons</h3>
</div>
<table id="motorcycles">
    <thead>
        <tr>
            <th>Moon ID</th>
            <th>Name</th>
            <th>Planet ID</th>
            <th>Radius</th>
            <th>Gravity</th>
            <th>Albedo</th>
        </tr>
    </thead>
    <tbody>
        <?php
            $sql_moons = "SELECT * FROM MOON ORDER BY RANDOM() LIMIT 5";
            $moons = $db->query($sql_moons);
            while($row = $moons->fetchArray(SQLITE3_ASSOC)) {
                echo "<tr>";
                foreach($row as $field) {
                    echo "<td>$field</td>";
                }
                echo "</tr>";
            }
        ?>
    </tbody>
</table>

<div>
    <h3>Moon Orbits</h3>
</div>
<table id="motorcycles">
    <thead>
        <tr>
            <th>Planet ID</th>
            <th>Moon ID</th>
        </tr>
    </thead>
    <tbody>
        <?php
            $sql_planet_moons = "SELECT * FROM MOON_ORBIT ORDER BY RANDOM() LIMIT 5";
            $planet_moons = $db->query($sql_planet_moons);
            while($row = $planet_moons->fetchArray(SQLITE3_ASSOC)) {
                echo "<tr>";
                foreach($row as $field) {
                    echo "<td>$field</td>";
                }
                echo "</tr>";
            }
        ?>
    </tbody>
</table>

<div>
    <h3>Asteroids</h3>
</div>
<table id="motorcycles">
    <thead>
        <tr>
            <th>Asteroid ID</th>
            <th>Name</th>
            <th>Mass</th>
            <th>Diameter</th>
            <th>Rotation Period</th>
        </tr>
    </thead>
    <tbody>
        <?php
            $sql_asteroids = "SELECT * FROM ASTEROID ORDER BY RANDOM() LIMIT 5";
            $asteroids = $db->query($sql_asteroids);
            while($row = $asteroids->fetchArray(SQLITE3_ASSOC)) {
                echo "<tr>";
                foreach($row as $field) {
                    echo "<td>$field</td>";
                }
                echo "</tr>";
            }
        ?>
    </tbody>
</table>

<div>
    <h3>Comets</h3>
</div>
<table id="motorcycles">
    <thead>
        <tr>
            <th>Comet ID</th>
            <th>Name</th>
            <th>Mass</th>
        </tr>
    </thead>
    <tbody>
        <?php
            $sql_comets = "SELECT * FROM COMET ORDER BY RANDOM() LIMIT 5";
            $comets = $db->query($sql_comets);
            while($row = $comets->fetchArray(SQLITE3_ASSOC)) {
                echo "<tr>";
                foreach($row as $field) {
                    echo "<td>$field</td>";
                }
                echo "</tr>";
            }
        ?>
    </tbody>
</table>

</main>

<?php mysqli_close($db); ?>

<?php include '../footer.php'; ?>