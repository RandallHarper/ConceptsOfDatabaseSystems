<?php
//Author: Randall Harper
//CS4354 Concepts of Database Systems 
//Fall 2015

class TableRows extends RecursiveIteratorIterator { 
    function __construct($it) { 
        parent::__construct($it, self::LEAVES_ONLY); 
    }

    function current() {
        return "<td style='width:150px;border:1px solid black;'>" . parent::current(). "</td>";
    }

    function beginChildren() { 
        echo "<tr>"; 
    } 

    function endChildren() { 
        echo "</tr>" . "\n";
    } 
} 


$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "university accommodation office";

//This is query #4 DONE
echo "<table style='border: solid 1px black;'>";
echo "<br><tr><th>Invoice Number</th><th>Lease Number</th><th>Semester</th><th>Pay Due</th><th>First Name</th><th>Last Name</th><th>Banner Number</th><th>Place Number</th><th>Room Number</th><th>Street</th><th>City</th><th>Post Code</th><th>Total Paid</th><th>Date</th><th>Pay Method</th><th>Date of First Reminder</th><th>Date of Second Reminder</th></tr>";
echo "<strong>Query #4. Display the details of the total rent paid by a given student.";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT * FROM invoice WHERE lastName = 'Harper'");
    $stmt->execute();

    // set the resulting array to associative
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) { 
        echo $v;
    }

}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}

//This is query #8 DONE
echo "<table style='border: solid 1px black;'>";
echo "<br><tr><th>Banner Number</th><th>Advisor ID</th><th>First Name</th><th>Last Name</th><th>Street</th><th>City</th><th>Post Code</th><th>Place Number</th><th>Phone Number</th><th>Email</th><th>Date Of Birth</th><th>Gender</th><th>Category</th><th>Nationality</th><th>Special Needs</th><th>Comments</th><th>Status</th><th>Major</th><th>Minor</th></tr>";
echo "Query #8. Present a report listing the details of all students currently on the waiting list for accommodation; that is, who were not placed.";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT * FROM student WHERE status = 'waiting'");
    $stmt->execute();

    // set the resulting array to associative
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) { 
        echo $v;
    }

}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}    

//This is query #9 DONE
echo "<table style='border: solid 1px black;'>";
echo "<br><tr><th>Total Seniors</th><th>Total Juniors</th><th>Total Sophomores</th><th>Total Freshman</th></tr>";
echo "Query #9. Display the total number of students in each category."; 

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT (SELECT count(*) FROM student WHERE category = 'senior'), (SELECT count(*) FROM student WHERE category = 'junior'), (SELECT count(*) FROM student WHERE category = 'sophomore'), (SELECT count(*) FROM student WHERE category = 'freshman')");
    $stmt->execute();

    // set the resulting array to associative
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) { 
        echo $v;
    }

}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}

//This is query #11 DONE
echo "<table style='border: solid 1px black;'>";
echo "<br><tr><th>First Name</th><th>Last Name</th><th>Phone Number</th></tr>";
echo "Query #11. Display the name and internal phone number of the Advisor for a particular student.";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT aFirstName, aLastName, aPhoneNumber FROM advisor LEFT JOIN student ON advisor.advisorID = student.advisorID WHERE lastName = 'Harper'");
    $stmt->execute();

    // set the resulting array to associative
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) { 
        echo $v;
    }

}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}

//This is query #13 DONE
echo "<table style='border: solid 1px black;'>";
echo "<br><tr><th>Hall Number</th><th>Number of Places</th></tr>";
echo "Query # 13. Display the total number of places in each residence hall.";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $stmt = $conn->prepare("SELECT hallName, placeNO FROM hall ORDER BY placeNO ASC");
    $stmt->execute();

    // set the resulting array to associative
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC); 
    foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) { 
        echo $v;
    }

}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}


$conn = null;
echo "</table>";
?>