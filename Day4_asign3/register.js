function validateRegister(event) {

    let password = document.getElementById("password").value;

    if (password.length < 6) {
        alert("Password must be at least 6 characters");
        return;
    }

    let number = document.getElementById("phone").value;

    if (number.length != 10 || isNaN(number)) {
        alert("Please enter a valid 10-digit phone number");
        return;
    }

    alert("Registration successful!");
}
