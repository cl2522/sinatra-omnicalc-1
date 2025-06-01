require "sinatra"
require "sinatra/reloader"

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @pv = params.fetch("user_pv").to_f

  @r = @apr / 100 / 12
  @n = @years * 12

  @numerator = @r * @pv
  @denominator = 1 - ((1 + @r) ** (-@n))

  @monthly_payment = @numerator / @denominator

  erb(:payment_results)
end


get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f

  @result = rand(@min..@max)

  erb(:random_results)
end

get("/square_root/new") do
  erb(:root)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5

  erb(:root_results)
end

get("/square/new") do
    erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/") do
  erb(:hello)
end
