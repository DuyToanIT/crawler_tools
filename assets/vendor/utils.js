let m = document.querySelectorAll(".money");
for (let i = 0, len = m.length; i < len; i++) {
    var number = m[i].innerHTML;
    let num = Number(number.substr(0, number.length-5)).toLocaleString("vi-VN", {
        style: "currency",
        currency: "VND"
    });
        m[i].innerHTML = num;
 }

