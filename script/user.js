
    const passwordInput = document.getElementById('password');
    const showPasswordButton = document.getElementById('showPassword');
    const passwordStrength = document.getElementById('password-strength');

    // Toggle password visibility
    showPasswordButton.addEventListener('click', () => {
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
        } else {
            passwordInput.type = 'password';
        }
    });

    // Password strength validation
    passwordInput.addEventListener('input', () => {
        const password = passwordInput.value;
        const strongPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        
        if (strongPasswordRegex.test(password)) {
            passwordStrength.innerHTML = '<div class="alert alert-success" role="alert">Strong password</div>';
        } else {
            passwordStrength.innerHTML = '<div class="alert alert-danger" role="alert">Weak password.</div>';
        }
    });