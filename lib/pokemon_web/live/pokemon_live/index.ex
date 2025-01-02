defmodule PokemonWeb.PokemonLive.Index do
  use PokemonWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    pokemon = fetch_random_pokemon()

    {:ok, assign(socket, pokemon: pokemon)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <%!-- <div class="w-full max-w-sm overflow-hidden bg-white rounded-lg shadow-lg dark:bg-gray-800">
      <img
        class="object-contain object-center w-full h-56 hover:scale-105 transition duration-300"
        src={@pokemon.image}
        alt={@pokemon.name}
      />

      <div class="flex items-center px-6 py-3 bg-gray-900">
        <h1 class="mx-3 text-lg font-semibold text-white text-center ">Name: <%= @pokemon.name %></h1>
      </div>

      <div class="px-6 py-4">
        <h1 class="text-xl font-semibold text-gray-800 dark:text-white">ID: <%= @pokemon.id %></h1>

        <div class="flex items-center mt-4 text-gray-700 dark:text-gray-200">
          <h1 class="px-2 text-sm">Weight: <%= @pokemon.weight %></h1>
        </div>

        <div class="flex items-center mt-4 text-gray-700 dark:text-gray-200">
          <h1 class="px-2 text-sm">Height: <%= @pokemon.height %></h1>
        </div>

        <div class="flex items-center mt-4 text-gray-700 dark:text-gray-200">
          <h1 class="px-2 text-sm">Base xp: <%= @pokemon.base_xp %></h1>
        </div>
      </div>
    </div> --%>

    <div class="flex gap-2">
      <input
        type="text"
        name="search"
        value={}
        placeholder="Enter Pokémon name..."
        class="flex-1 mb-10 px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
        autocomplete="off"
      />
      <button
        type="submit"
        disabled={}
        class="bg-blue-500 mb-10 text-white px-4 py-2 rounded-lg hover:bg-blue-600 disabled:opacity-50 disabled:cursor-not-allowed"
      >
        Search
      </button>
    </div>

    <div class="slide-container">
      <div class="wrapper">
        <div class="clash-card barbarian">
          <div class="clash-card__image clash-card__image--barbarian">
            <img src={@pokemon.image} alt={@pokemon.name} />
          </div>

          <div class="clash-card__unit-name">Name: <%= @pokemon.name %></div>
          <div class="clash-card__unit-name">ID: <%= @pokemon.id %></div>

          <div class="clash-card__unit-stats clash-card__unit-stats--barbarian clearfix">
            <div class="one-third">
              <div class="stat"><%= @pokemon.height %></div>
              <div class="stat-value">Height</div>
            </div>

            <div class="one-third">
              <div class="stat"><%= @pokemon.weight %></div>
              <div class="stat-value">Weight</div>
            </div>

            <div class="one-third no-border">
              <div class="stat"><%= @pokemon.base_xp %></div>
              <div class="stat-value">Base XP</div>
            </div>
          </div>
        </div>
        <!-- end clash-card barbarian-->
      </div>
      <!-- end wrapper -->
      <div class="inline-flex">
        <button
          phx-click="prev"
          class="bg-gray-300 pl-2 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded-l"
        >
          Prev
        </button>
        <button class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-bold py-2 px-4 rounded-r">
          Next
        </button>
      </div>
    </div>
    <!-- end container -->
    """
  end

  defp fetch_random_pokemon do
    body = Req.get!("https://pokeapi.co/api/v2/pokemon/#{Enum.random(1..1010)}").body

    %{
      name: String.capitalize(body["name"]),
      id: body["id"],
      image: body["sprites"]["other"]["showdown"]["front_default"],
      sprites: body["sprites"],
      weight: body["weight"],
      height: body["height"],
      base_xp: body["base_experience"] || "?"
    }
  end
end
