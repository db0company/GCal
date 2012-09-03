(* ************************************************************************** *)
(* Project: Google Calendar Module for Ocsigen                                *)
(* Description: Simple module to insert a Google Calendar iframe to your page *)
(* Author: db0 (db0company@gmail.com, http://db0.fr/)                         *)
(* Latest Version is on GitHub: https://github.com/db0company/GCal            *)
(* ************************************************************************** *)

open Eliom_content
open Html5.D
open Eliom_parameter

(* ************************************************************************** *)
(* Available timezones                                                        *)
(* ************************************************************************** *)

(* List of available timezones you can use for your calendar                  *)
val timezones : string list

(* ************************************************************************** *)
(* Available display modes                                                    *)
(* ************************************************************************** *)

type display_mode =
  | Week
  | Agenda
  | Month

(* ************************************************************************** *)
(* Available Weekday to start                                                 *)
(* ************************************************************************** *)

type week_start_on =
  | Sunday
  | Monday
  | Saturday

(* ************************************************************************** *)
(* Available Calendar Colors                                                  *)
(* ************************************************************************** *)

type colors =
  | Green
  | SoberGreen
  | LightGreen

  | Blue
  | SoberBlue
  | LightBlue
  | LighterBlue
  | DarkBlue
  | Turquoise

  | Purple
  | SoberPurple
  | LightPurple

  | Brown
  | SoberBrown

  | Pink
  | DarkPink

  | Yellow
  | DarkYellow

  | Red
  | Orange
  | LightOrange

(* ************************************************************************** *)
(* Available width type                                                       *)
(* ************************************************************************** *)

type width_type =
  | Percent of int
  | Pixels  of int

(* ************************************************************************** *)
(* Calendar function                                                          *)
(* ************************************************************************** *)

(* Return an iframe containing the calendar using the given addresses and     *)
(* some extra optionnal parameters to customize it                            *)
val calendar :
  ?show_title:bool -> ?show_nav:bool -> ?show_date:bool -> ?show_print:bool ->
  ?show_tabs:bool -> ?show_calendars:bool -> ?show_timezone:bool ->
  ?display_mode:display_mode -> ?width:width_type -> ?height:int ->
  ?week_start_on:week_start_on -> ?timezone:string -> ?lang:string ->
  ?background_color:string -> (string * color) list ->
  [> `Iframe ] Eliom_content.Html5.D.elt
