-module(server).
%-export([start/0, analyse/1]).
-compile(export_all).


start() ->
	Server = spawn(server, server, [])
	SensorF = spawn(sensors, sensorF, []),
	SensorC = spawn(sensors, sensorC, [])
	Temp = spawn(temp, converter, []),

run() ->
	start(),

	loop() ->
		SensorF ! {self(), {convert, c}}, % c, T1},
		SensorC ! {self(), {convert, f}}, % f, T2},
		timer:sleep(950),
		loop().
