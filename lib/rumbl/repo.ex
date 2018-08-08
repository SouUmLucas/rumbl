defmodule Rumbl.Repo do
  import Rumbl.User

  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "Lucas", username: "thelucassantos", password: "123"},
      %Rumbl.User{id: "2", name: "Paulo", username: "thepaulo", password: "1qaz"},
      %Rumbl.User{id: "3", name: "Luiz", username: "theluiz", password: "edfx3"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find(all(module), fn map -> map.id == id end)
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
