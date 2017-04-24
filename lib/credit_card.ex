defmodule CreditCard do
  defstruct type: "", expire_year: 0
  def process(%CreditCard{type: type , expire_year: year}) 
    when year >= 2017 and type in ["visa", "mastercard", "amex"] do
      "OK!"
  end
end