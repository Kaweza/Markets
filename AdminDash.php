<?php
include 'Connection.php' ;

$successMessage = ""; // Initialize a variable to store success messages

// Registration for traders
if (isset($_POST['submit'])) {
    // Traders form submitted
    $nin = $_POST['NIN'];
    $first_name = $_POST['Jina_la_Kwanza'];
    $middle_name = $_POST['Jina_Kati'];
    $last_name = $_POST['Jina_Mwisho'];
    $phone_number = $_POST['Namba_ya_Simu'];
    $sex = $_POST['Jinsi'];
    $age = $_POST['Umri'];
    $street = $_POST['Street'];
    $ward = $_POST['Ward'];
    $market = $_POST['MarketType'];
    $business = $_POST['business'];
    $infrastructure = $_POST['infrastructure'];
    $rent = $_POST['date_of_rent'];
    $return = $_POST['date_of_return'];

    // Prepare the SQL statement for wafanyabiashara table
    $stmt = $conn->prepare("INSERT INTO wafanyabiashara (NIN, Jina_la_Kwanza, Jina_Kati, Jina_Mwisho, Namba_ya_Simu, Jinsi, Umri, Street, Ward, MarketType, business, infrastructure, date_of_rent, date_of_return) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    if ($stmt === false) {
        die("Error preparing statement: " . $conn->error);
    }
    $stmt->bind_param("isssssisssssss", $nin, $first_name, $middle_name, $last_name, $phone_number, $sex, $age, $street, $ward, $market, $business, $infrastructure, $rent, $return);

    // Check if registration was successful
    if ($stmt->execute()) {
        $successMessage = "Trader registration successful!";
    } else {
        $successMessage = "Error registering trader: " . $conn->error;
    }

    $stmt->close();
}

// Registration for users
if (isset($_POST['register'])) {
    // Registration form submitted
    $fullname = $_POST['name'];
    $username = $_POST['email'];
    $role = $_POST['Role'];
    $password = $_POST['Password'];
    $confirmPassword = $_POST['ConfirmPassword'];

    // Check if passwords match
    if ($password !== $confirmPassword) {
      $passwordMismatch = "Error: Passwords do not match";
  } else {
      $passwordMismatch = ""; // Reset the error message if passwords match
  }
  
    // Prepare the SQL statement for users table
    $stmt = $conn->prepare("INSERT INTO users (name, email, Role, Password) VALUES (?, ?, ?, ?)");
    if ($stmt === false) {
        die("Error preparing statement: " . $conn->error);
    }
    $stmt->bind_param("ssss", $fullname, $username, $role , $password);

    // Check if registration was successful
    if ($stmt->execute()) {
        $successMessage = "User registration successful!";
    } else {
        $successMessage = "Error registering user: " . $conn->error;
    }

    $stmt->close();
}
//change password
if (isset($_POST['Submit'])) {
  $email = $_POST['email'];
  $currentPassword = $_POST['currentPassword'];
  $newPassword = $_POST['newPassword'];
  $confirmNewPassword = $_POST['confirmNewPassword'];

  // Check if the current password matches the one in the database
  $query = mysqli_query($conn, "SELECT email, Password FROM users WHERE email = '$email' AND Password = '$currentPassword'");

  if ($query) {
      $num = mysqli_fetch_array($query);

      if ($num > 0) {
          // Update the password in the database
          $updateQuery = mysqli_query($conn, "UPDATE users SET Password = '$newPassword' WHERE email = '$email'");
          
          if ($updateQuery) {
              $_SESSION['msg1'] = "Password changed successfully";
          } else {
              $_SESSION['msg1'] = "Failed to update password: " . mysqli_error($conn);
          }
      } else {
          $_SESSION['msg1'] = "Password does not match";
      }
  } else {
      $_SESSION['msg1'] = "Query execution failed: " . mysqli_error($conn);
  }
}
// Total number of traders
$sqlTotalTraders = "SELECT COUNT(*) AS total_traders FROM wafanyabiashara";
$resultTotalTraders = $conn->query($sqlTotalTraders);
$rowTotalTraders = $resultTotalTraders->fetch_assoc();
$totalTraders = $rowTotalTraders['total_traders'];

// Total number of male traders
$sqlTotalMale = "SELECT COUNT(*) AS total_male FROM wafanyabiashara WHERE Jinsi = 'Male'";
$resultTotalMale = $conn->query($sqlTotalMale);
$rowTotalMale = $resultTotalMale->fetch_assoc();
$totalMale = $rowTotalMale['total_male'];

// Total number of female traders
$sqlTotalFemale = "SELECT COUNT(*) AS total_female FROM wafanyabiashara WHERE Jinsi = 'Female'";
$resultTotalFemale = $conn->query($sqlTotalFemale);
$rowTotalFemale = $resultTotalFemale->fetch_assoc();
$totalFemale = $rowTotalFemale['total_female'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>lindi market system</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <!-- Include Bootstrap JS and jQuery -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="style/content.css">
  <style>
        #sidebar {
      position: absolute;
      top: 0;
      left: -250px;
      width: 250px;
      background-color: #999;
      transition: all 0.3s ease-in-out;
      z-index: 10000;
      text-align: right;
      padding-right: 20px;
      height: 300%;
    }
    @media screen and (max-width: 600px) {
      #sidebar {
        height: 500px;
      }
    }
    
     .total-traders {
    display: flex;
    justify-content: center; /* Align content in the center horizontally */
    align-items: center;
    font-weight: bold;
    margin-top: 20px; /* Add margin to separate it from the header */
  }

  .total-traders p {
    margin: 0 10px; /* Add space between the statistics */
    font-size: 24px; /* Adjust the font size as needed */
    color: #007BFF; /* Set the text color to blue (#007BFF) */
  }
  #marketSubLinks {
  display: none;
  position: absolute;
  top:520px; /* Position it below the main link */
  right: 0;
  background-color: #fff; /*  desired background color */
  padding: 10px;
  border: 1px solid #ccc;
}

#marketSubLinks a {
  display: block;
  color: #333; /*  desired text color */
  padding: 5px 0;
  text-decoration: none;
  font-weight:bold;
}

#marketSubLinks a:hover {
  background-color: #f2f2f2; /*  desired hover background color */
}
/* CSS styles to your stylesheet */
.custom-alert {
    position: relative;
    background-color: #ffffff;
    border: 2px solid #4CAF50; /* Green border */
    border-radius: 10px;
    padding: 15px;
    margin-bottom: 20px;
    font-size: 20px;
}

.custom-alert.success {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}

.custom-alert.danger {
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}

.custom-alert:before {
    content: '';
    position: absolute;
    bottom: -20px;
    left: 50%;
    margin-left: -10px;
    border-width: 10px;
    border-style: solid;
    border-color: transparent transparent #4CAF50 transparent; /* Green arrow */
}
.{
    background-color: rgba(0, 0, 255, 0.7); /* Add transparency to the header */
    padding: 0px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
    border-radius: 0 0 15px 15px;
    position: relative; /* Add relative positioning */
}

  </style>
</head>
<body>

  <div id="main-content">
    <div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="changePasswordModalLabel">
              <i class="fas fa-key"></i>
              Change Password
            </h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <!-- Change password form goes here -->
            <form action=" " method="post" onSubmit="return valid();">
              <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
              </div>
              <div class="form-group">
                <label for="currentPassword">Old Password</label>
                <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
              </div>
              <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
              </div>
              <div class="form-group">
                <label for="confirmNewPassword">Confirm New Password</label>
                <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" required>
              </div>
              <div class="modal-footer">
                <button type="submit" name="Submit" class="btn btn-primary">Save changes</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- Display success and error messages for password change -->
    <div class="container mt-3">
        <?php if (isset($_SESSION['msg1'])): ?>
            <div class="custom-alert <?php echo strpos($_SESSION['msg1'], "Failed") !== false ? 'danger' : 'success'; ?> text-center">
                <?php echo $_SESSION['msg1']; ?>
            </div>
            <script>
                // Automatically hide the message after 5 seconds
                setTimeout(function () {
                    document.querySelector('.custom-alert').style.display = 'none';
                }, 5000);
            </script>
            <?php unset($_SESSION['msg1']); // Clear the message from the session ?>
        <?php endif; ?>
    </div>

    <!-- Create User Modal -->
    <div class="modal fade" id="createUserModal" tabindex="-1" role="dialog" aria-labelledby="createUserModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createUserModalLabel">Create User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="post">
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" name="name" class="form-control" id="fullName" placeholder="Enter full name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" class="form-control" id="email" placeholder="Enter email" required>
                    </div>
                    <div class="form-group">
                        <label for="role">Role</label>
                        <select class="form-control" name="Role" id="role" required>
                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="input-group">
                            <input type="password" name="Password" class="form-control" id="password" placeholder="Enter password" required>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-outline-secondary" id="showPassword">Show</button>
                            </div>
                        </div>
                        <div id="password-strength"></div>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" name="ConfirmPassword" class="form-control" id="confirmPassword" placeholder="Confirm password" required>
                    </div>
                    <button type="submit" name="register" class="btn btn-primary">Create</button>
                </form>
            </div>
        </div>
    </div>
</div>

    
<!-- Modal form for trader registration -->
<div class="modal fade" id="userRegistrationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
          <i class="fas fa-user"></i> Registration Form for Traders
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="userInfoForm" action=" " method="post">
          <!-- Form fields here -->
          <div class="form-group">
            <input type="text" id="nationalId" name="NIN" placeholder="National ID: 00000000000000000000" required pattern="\d{20}">
            <small>National ID must be 20 digits</small>
          </div>
          <div class="form-group">
            <input type="text" id="firstName" name="Jina_la_Kwanza" placeholder="First Name" required>
          </div>
          <div class="form-group">
            <input type="text" id="middleName" name="Jina_Kati" placeholder="Middle Name" required>
          </div>
          <div class="form-group">
            <input type="text" id="lastName" name="Jina_Mwisho" placeholder="Last Name" required>
          </div>
          <div class="form-group">
            <input type="tel" id="phoneNumber" name="Namba_ya_Simu" placeholder="Phone Number" required pattern="\d{10}">
            <small>Phone number must contain exactly 10 digits</small>
          </div>
          <div class="form-group">
            <select id="sex" name="Jinsi" required>
              <option value="">Select Gender</option>
              <option value="Male">Male</option>
              <option value="Female">Female</option>
            </select>
          </div>
          <div class="form-group">
            <input type="number" id="age" name="Umri" placeholder="Age" required min="1">
            <small>Age must be a positive number</small>
          </div>
          <div class="form-group">
            <input type="text" id="Street" name="Street" placeholder="Street" required>
          </div>
          <div class="form-group">
            <input type="text" id="Ward" name="Ward" placeholder="Ward" required>
          </div>
          <div class="form-group">
            <input type="text" id="marketType" name="MarketType" placeholder="Name of Market" required>
          </div>
          <div class="form-group">
            <input type="text" id="business" name="business" placeholder="Business Type" required>
          </div>
          <div class="form-group">
            <select name="infrastructure" id="infrastructure" required>
              <option value="">Select Infrastructure</option>
              <option value="cage">Cage</option>
              <option value="table">Table</option>
              <option value="frame">Frame</option>
              <option value="other">Other</option>
            </select>
          </div>
          <label>Date Of Rent</label>
          <div class="form-group">
            <input type="date" id="date-rent" name="date_of_rent" placeholder="Date of rent" required>
          </div>
          <label>Date Of Return</label>
          <div class="form-group">
            <input type="date" id="date-return" name="date_of_return" placeholder="Date of return" required>
          </div>
          <div class="form-group text-center">
            <button type="submit" name="submit" class="btn btn-primary">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<div class="container mt-3">
    <?php if (!empty($successMessage) && empty($passwordMismatch)): ?>
        <div class="custom-alert success text-center">
            <?php echo $successMessage; ?>
        </div>
        <script>
            // Automatically hide the success message after 5 seconds
            setTimeout(function () {
                document.querySelector('.custom-alert.success').style.display = 'none';
            }, 5000);
        </script>
    <?php endif; ?>

    <?php if (!empty($passwordMismatch)): ?>
        <div class="custom-alert danger text-center">
            <?php echo $passwordMismatch; ?>
        </div>
        <script>
            // Automatically hide the error message after 5 seconds
            setTimeout(function () {
                document.querySelector('.custom-alert.danger').style.display = 'none';
            }, 5000);
        </script>
    <?php endif; ?>
</div>



    

            <!-- Header Content -->
            <div class="Admin">
            <header class="bg-primary text-white text-center py-4">
        <div class="d-flex flex-column align-items-center">
            <h3>THE UNITED REPUBLIC OF TANZANIA <br> REGIONAL ADMINISTRATION AND LOCAL GOVERNMENT</h3>
            <div class="mb-3" id="tp">
              <img src="image/lindi-municipal.jpg" alt="image" class="img-fluid">
            </div>
            <h3 class="m-0">Lindi municipal market management system<h3>
          </div>
          <div id="sidebar">
  <div id="close-btn">
    <i class="fas fa-times"></i>
  </div>
  <br><br><br>
  <div class="text-center">
    <h6>LINDI MUNICIPAL COUNCIL</h6>
  </div>
  <br><br>
  <div class="text-center">
    <img src="image/market.png" alt="Image" class="img-zoomable">
  </div>
  <br><br>
  <a href="AdminDash.php">
    <i class="fas fa-tachometer-alt"></i> Dashboard
  </a>
  <a href="#" id="createUserLink" data-toggle="modal" data-target="#userRegistrationModal">
    <i class="fas fa-registered"></i> Register trader
  </a>
  <a href="#">
    <i class="fas fa-cogs"></i> Management
  </a>
  <a href="Traders.php">
    <i class="fas fa-question-circle"></i> View report
  </a>
  <a href="#" id="createUserLink" data-toggle="modal" data-target="#createUserModal">
    <i class="fas fa-user-plus"></i> Create User
  </a>
  <!-- Main Market link -->
  <a href="#" id="marketLink" data-toggle="collapse" data-target="#marketSubLinks" aria-expanded="false">
        <i class="fas fa-store"></i> Market <i class="fas fa-caret-down"></i>
    </a>
    
    <!-- Sub-links for Market -->
    <div id="marketSubLinks" class="collapse">
        <a href="#" id="addMarketLink">
            <i class="fas fa-plus"></i> Register Market
        </a>
  </div>
</div>
          
    <!-- Toggle and user buttons -->
    <div class="position-relative bg-dark p-3" id="top">
      <div class="d-flex justify-content-between">
          <button id="toggle-btn" class="btn btn-dark">
              <i class="fas fa-bars"></i>
          </button>
          <div class="user-dropdown">
              <button id="user-btn" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown">
                  <i class="fas fa-user"></i> User <i class="fas fa-arrow"></i>
              </button>
              <div class="dropdown-menu dropdown-menu-end">
                  <a class="dropdown-item" href="#" data-toggle="modal" data-target="#changePasswordModal">
                    <i class="fas fa-key"></i> Change Password
                  </a>
                  <a class="dropdown-item" href="index.php">
                    <i class="fas fa-sign-out-alt"></i> LogOut
                </a>
              </div>
          </div>
      </div>
    </div>
    </header>
          </div>

    <!-- Display total number of traders, total male, and total female -->
   <div class="total-traders">
    <p>Total Traders: <span style="font-size: 32px; color: #FF5733;"><?php echo $totalTraders; ?></span></p>
    <p>Total Male: <span style="font-size: 32px; color: #33FF57;"><?php echo $totalMale; ?></span></p>
    <p>Total Female: <span style="font-size: 32px; color: #5733FF;"><?php echo $totalFemale; ?></span></p>
   </div>

    
   <div class="container-fluid">
        <div class="row" id="container">
          <div class="col-md-4">
            <p class="market-type">SOKO LA FISI</p>
            <a href="view.php?market=fisi" class="square-link" style="background-image: url('image/photo\ 3.jpg'); ime-mode: pic1;"></a>
          </div>
          <div class="col-md-4">
              <p class="market-type">SOKO LA SABASABA</p>
                <a href="view.php?market=sabasaba" class="square-link" style="background-image: url('image/photo\ 1.jpg');"></a>
            </div>
            <div class="col-md-4">
              <p class="market-type">SOKO KUU</p>
                <a href="view.php?market=kuu" class="square-link" style="background-image: url('image/photo\ 4.jpg');"></a>
            </div>
            <div class="col-md-4">
              <p class="market-type">SOKO LA SAMAKI</p>
                <a href="view.php?market=samaki" class="square-link" style="background-image: url('image/lindi\ 1.jpg');"></a>
            </div>
            <div class="col-md-4">
             <p class="market-type">SOKO LA KARIAKOO</p>
                <a href="view.php?market=kariakoo" class="square-link" style="background-image: url('image/photo\ 2.jpg');"></a>
            </div>
            <div class="col-md-4">
              <p class="market-type">SOKO LA FERI</p>
                <a href="view.php?market=feri" class="square-link" style="background-image: url('image/photo\ 5.jpg');"></a>
            </div>
            <div class="container-fluid">
  <div class="row" id="container">
    <!-- Existing market elements will be added here -->
  </div>
</div>
 </div>
    </div>
  
    <div id="deleteForm" style="display: none;">
    <p id="deleteMarketType"></p>
    <button id="deleteButton" onclick="deleteMarket(selectedMarketName)">Delete</button>
</div>


    <!-- Footer -->  
  <footer class="custom-footer text-light py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h5>Quick Links</h5>
          <ul class="list-unstyled">
            <li><a href="#">Home</a></li>
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Account Settings</a></li>
            <!--  more links as needed -->
          </ul>
        </div>
        <div class="col-md-4">
          <h5>Types of Markets</h5>
          <ul class="list-unstyled">
            <li>fisi</li>
            <li>sabasaba</li>
            <li>feri</li>
            <li>kuu</li>
          </ul>
        </div>
        <div class="col-md-4">
          <h5>Connect with Us</h5>
          <ul class="list-unstyled">
            <li><a href="#"><i class="bi bi-facebook"></i> Facebook</a></li>
            <li><a href="#"><i class="bi bi-twitter"></i> Twitter</a></li>
            <li><a href="#"><i class="bi bi-linkedin"></i> LinkedIn</a></li>
            <!-- more social media links as needed -->
          </ul>
        </div>
      </div>
      <p class="text-center">@2023. Market management-lindi municipal council</p>
    </div>
    </footer>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="script/sideToggle.js"></script>
    <script src="script/add.js"></script>
    <script src="script/delete.js"></script>
    <script src="script/update.js"></script>
    <script src="script/user.js"></script>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
  // Add event listener to the Market link
  const marketLink = document.getElementById("marketLink");
  marketLink.addEventListener("mouseover", function () {
    const marketSubLinks = document.getElementById("marketSubLinks");
    marketSubLinks.style.display = "block";
  });

  // Add event listener to hide the sub-links when the cursor is moved away
  const sidebar = document.getElementById("sidebar");
  sidebar.addEventListener("mouseleave", function () {
    const marketSubLinks = document.getElementById("marketSubLinks");
    marketSubLinks.style.display = "none";
  });

  // Add event listener to prevent closing the sidebar when a sub-link is clicked
  const marketSubLinks = document.getElementById("marketSubLinks");
  marketSubLinks.addEventListener("click", function (event) {
    event.stopPropagation();
  });
});

</script>
</body>
</html>