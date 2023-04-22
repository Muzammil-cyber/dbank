import { dbank_backend } from "../../declarations/dbank_backend";


window.addEventListener("DOMContentLoaded", async function () {
  // console.log("Load");
  const currentAmount = await dbank_backend.CheckBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
});

document.querySelector("form").addEventListener("submit", async function (e) {
  e.preventDefault();

  const btn = e.target.querySelector("#submit-btn");

  const deposit = parseFloat(e.target.querySelector("#input-amount").value);
  const withdraw = parseFloat(e.target.querySelector("#withdrawal-amount").value);

  btn.setAttribute("disabled", true);

  deposit ?
    await dbank_backend.Deposit(deposit) :
    withdraw && await dbank_backend.WithDraw(withdraw);

  dbank_backend.Compound();

  const currentAmount = await dbank_backend.CheckBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;

  e.target.querySelector("#input-amount").value = 0;
  e.target.querySelector("#withdrawal-amount").value = 0;
  btn.removeAttribute("disabled");

})
