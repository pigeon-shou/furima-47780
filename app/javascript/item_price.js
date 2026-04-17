const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    tax.innerHTML = Math.floor(inputValue * 0.1);
    profit.innerHTML = inputValue - Math.floor(inputValue * 0.1);
  });
};
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);


