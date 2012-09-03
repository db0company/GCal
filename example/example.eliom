(* ************************************************************************** *)
(* Project: Google Calendar Module for Ocsigen                                *)
(* Description: Example of usage of the GCal Module (see gCal.eliom)          *)
(* Author: db0 (db0company@gmail.com, http://db0.fr/)                         *)
(* Latest Version is on GitHub: https://github.com/db0company/GCal            *)
(* ************************************************************************** *)

open Eliom_content
open Html5.D
open Eliom_parameter

module Example =
  Eliom_registration.App
    (struct
      let application_name = "GCal"
     end)

let main =
  Eliom_service.service
    ~path:[]
    ~get_params:unit
    ()

let _ =

  Example.register
    ~service:main
    (fun () () ->

      let calendar =
	[("cah91shkupr9sqjv0oi8ek3f3k@group.calendar.google.com", GCal.Blue)] in

      Lwt.return
	(html
	   (head (title (pcdata "Ocsigen GCal Module Example")) [])
	   (body 
	      [h3 [pcdata "Default Calendar"];

	       GCal.calendar calendar;

	       h3 [pcdata "Mini Calendar"];

	       GCal.calendar
                 ~show_title:false
                 ~show_nav:false
                 ~show_date:false
                 ~show_print:false
                 ~show_tabs:false
                 ~show_calendars:false
                 ~show_timezone:false
                 ~display_mode:GCal.Agenda
                 ~width:(GCal.Pixels 300)
                 ~height:200
                 ~week_start_on:GCal.Saturday
		 calendar;

	       h3 [pcdata "A french calendar"];

	       GCal.calendar
                 ~show_title:false
                 ~show_nav:true
                 ~show_date:true
                 ~show_print:true
                 ~show_tabs:true
                 ~show_calendars:false
                 ~show_timezone:true
                 ~display_mode:GCal.Week
                 ~width:(GCal.Percent 80)
                 ~height:500
                 ~week_start_on:GCal.Monday
                 ~timezone:(Some "Europe/Paris")
                 ~lang:(Some "fr")
                 ~background_color:("#668CD9")
		 calendar

	      ])))
