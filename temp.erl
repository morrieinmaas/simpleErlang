% http://www.erlang.org/course/exercises.html
% Write functions temp:f2c(F) and temp:c2f(C) which convert between centigrade and Fahrenheit scales. (hint 5(F-32) = 9C)
-module(temp).
%-export([c2f/1, f2c/1, convert/1 handle_cast/1]).
-compile(export_all).

c2f(C) -> (C *9/5) + 32.
f2c(F) -> (F - 32) * 5/9.

convert({From, What}) ->
        case {From, What} of
                {c, What} -> c2f(What);
                {f, What} -> f2c(What);
                {_, _}    -> io:format("incorrect format~n")
end.

handle_cast({Unit, What, From}) ->
	receive
		{Unit, What, From} ->
			From ! {self(), {convert(Unit, From), Unit}},
		handle_cast()
	end.
			
