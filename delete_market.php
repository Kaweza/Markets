<?php
include 'Connection.php' ;

// Get POST data
$data = json_decode(file_get_contents("php://input"));

if (isset($data->name)) {
    $name = $conn->real_escape_string($data->name); // Sanitize input

    // Delete the market from the database
    $sql = "DELETE FROM markets WHERE name = '$name'";
    
    if ($conn->query($sql) === TRUE) {
        $response = ["success" => true];
    } else {
        $response = ["success" => false, "error" => $conn->error];
    }

    // Return JSON response
    header("Content-Type: application/json");
    echo json_encode($response);
} else {
    $response = ["success" => false, "error" => "Invalid data"];
    header("Content-Type: application/json");
    echo json_encode($response);
}

$conn->close();
?>
