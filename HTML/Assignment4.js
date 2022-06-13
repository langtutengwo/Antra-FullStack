// Question 1
function sumSalaries(obj) {
    let sum = 0;
    for (let el in obj) {
        if (typeof obj[el] == 'number'){
            sum += obj[el];
        }
    }
    return sum;
}

// Question 2
function multiplyNumeric(obj) {
    for (let el in obj) {
        if (typeof obj[el] == 'number'){
            obj[el] *= 2;
        }
    }
}

// Question 3
function checkEmailId(str) {
    var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,5})$/;
    if (str.value.match(reg)){
        return true;
    }
    return false;
}

// Question 4
function trancate(str, maxlength) {
    if (str.length > 20) {
        str = str.slice(0, 19) + "..."
    }
    return str;
}

// Question 5
const styles = ["James", "Brennie"];
styles.push("Robert");
styles[styles.length / 2] = "Calvin";
styles.shift();
styles = styles.concat(["Rose", "Regal"])
