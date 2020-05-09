%%%-------------------------------------------------------------------
%%% @author shiyu
%%% @copyright (C) 2020
%%% @doc
%%% 登录处理器
%%% @end
%%% Created : 05. 4月 2020 下午 23:16
%%%-------------------------------------------------------------------
-module(login_handler).
-author("shiyu").

-include("player.hrl").
-include("err_code.hrl").
-include("01_login.hrl").

%% API
-export([
    handle/3
]).

handle(_ProtoId, Tuple, State) ->
    do_handle(Tuple, State).

do_handle(#pt_1001_c{username = Username, password = Password}, Role) ->
    case lib_player_login:handle_login(Username, Password, Role) of
        {true, NewPlayer} ->
            {reply, #pt_1001_s{}, NewPlayer};
        {false, RetCode} ->
            {reply, #pt_1001_s{ret = RetCode}}
    end.