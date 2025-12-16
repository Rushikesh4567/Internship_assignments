
const input = document.getElementById("task-input");
const addBtn = document.getElementById("add-task-btn");
const taskList = document.getElementById("task-list");


addBtn.addEventListener("click", function () {

    const taskText = input.value.trim();


    if (taskText === "") {
        alert("Please enter a task");
        return;
    }

    
    const li = document.createElement("li");
    li.innerText = taskText;
    li.classList.add("list-group-item");
    li.className += " d-flex justify-content-between align-items-center";

    const deleteBtn = document.createElement("button");
    deleteBtn.innerText = "Delete";
    deleteBtn.style.marginLeft = "10px";
    deleteBtn.className="btn btn-danger btn-sm";

    
    deleteBtn.addEventListener("click", function () {
        li.remove();
    });


    
    li.appendChild(deleteBtn);

    
    taskList.appendChild(li);

    
    input.value = "";
});
