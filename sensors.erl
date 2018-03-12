-module(sensors).
-compile(export_all).

sensorF() ->
	T = random:seed(erlang:now()), %% create random numbers
	receive
		{Temp, {A, c}} ->
			io:format("I've converted to Celcius.  The result is  ~c ", [A]);
		{Server, {Unit, What}} ->
			Temp ! {Unit, What, self()}	
		_ ->
			io:format("Oops! Something went wrong")
	end.


sensorC() ->
	T = random:seed(erlang:now()), %% create random numbers
	receive
		{Temp, {A, f}} ->
			io:format("I've converted to Fahrenheit.  The result is  ~f ", [A]);
		{Server, {Unit, What}} ->
			Temp ! {Unit, What, self()}	
		_ ->
			io:format("Oops! Something went wrong")
	end.
