<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "demo";

// Create a connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>

<?php
session_start(); // Start the session
require_once('Connection.php'); // Include the database connection file

$error_message = ""; // Initialize error message variable

if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = $_POST['Password'];

    // Prepare the SQL statement to check user credentials
    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ? AND Password = ?");
    if ($stmt === false) {
        die("Error preparing statement: " . $conn->error);
    }
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        // User credentials are valid, perform any desired action
        $_SESSION['loggedin'] = true; // Set a session variable to indicate that the user is logged in
        // Add additional code or redirect to the desired page
        header("Location: AdminDash.php");
        exit();
    } else {
        // Invalid credentials, set the error message
        $error_message = "Invalid username or password";
    }
}
?>

<?php
    // Display the error message using PHP
    if (!empty($error_message)) {
        echo '<script>
                displayMessage("' . $error_message . '", false);
              </script>';
    }
    ?>