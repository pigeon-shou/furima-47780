document.addEventListener("DOMContentLoaded", () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
    const price = Number(priceInput.value);
    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    document.getElementById("add-tax-price").innerHTML = tax;
    document.getElementById("profit").innerHTML = profit;
  });
});