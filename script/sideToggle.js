
document.addEventListener('DOMContentLoaded', function () {
  const sidebar = document.getElementById('sidebar');
  const toggleBtn = document.getElementById('toggle-btn');
  const closeBtn = document.getElementById('close-btn');
  const mainContent = document.getElementById('main-content');
  const sidebarLinks = sidebar.querySelectorAll('a'); // Get all sidebar links
  const overlay = document.createElement('div'); // Create overlay element

  // Function to open the sidebar
  function openSidebar() {
    sidebar.classList.add('active');
    overlay.style.display = 'block'; // Show overlay
    mainContent.style.marginLeft = '250px';
  }

  // Function to close the sidebar
  function closeSidebar() {
    sidebar.classList.remove('active');
    overlay.style.display = 'none'; // Hide overlay
    mainContent.style.marginLeft = '0';
  }

  // Toggle sidebar when the toggle button is clicked
  toggleBtn.addEventListener('click', openSidebar);

  // Close the sidebar when the close button is clicked
  closeBtn.addEventListener('click', closeSidebar);

  // Close the sidebar when a sidebar link is clicked
  sidebarLinks.forEach(function (link) {
    link.addEventListener('click', function () {
      closeSidebar();
    });
  });

  // Close the sidebar when the user clicks on other parts of the screen
  overlay.addEventListener('click', closeSidebar);

  // Append the overlay to the body
  document.body.appendChild(overlay);
});
