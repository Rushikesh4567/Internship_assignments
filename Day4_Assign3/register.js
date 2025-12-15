function validateRegister(event) {
    event.preventDefault();

    let password = document.getElementById("password").value;
    let phone = document.getElementById("phone").value;

    if (password.length < 6) {
        alert("Password must be at least 6 characters");
        return;
    }

    if (phone.length !== 10 || isNaN(phone)) {
        alert("Please enter a valid 10-digit phone number");
        return;
    }

    alert("Registration successful!");
}
