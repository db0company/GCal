GCal
====

Ocsigen (OCaml Web Server + Framework) module to display a Google Calendar iframe.

<img src="http://public.db0.fr/dev/ocsigen/ocsigen_calendar.png" alt="Calendar Screenshot" />

## Requirements

* Ocsigen version 2.1 minimum
* An account on Google Calendar
* At lead one calendar to display :)

## Just test it

* Install it by launching the script `./install.sh`
_It will install the required external modules and generate a configuration file for you._
* Move to the example directory: `cd example/`
* Compile the example using `make`
* Launch the website using `ocsigenserver -c example.conf`
* Open the website in your browser

***

## How to display a calendar on my website?

* Install the module by launching the script `./install.sh` _It will install external modules._

You will need these files to add GCal to your website:
* `tools.eliom`
* `gCal.eliom`

Copy them (and their interfaces `.eliomi`) in your website source code directory.
Edit your Makefile to compile them on server side.

#### Configuration file

* Edit your configuration file to add the two news `.cmo` you will have to insert:

```xml
      <eliom module="/real/path/to/your/sources/folder/_server/tools.cmo" />
      <eliom module="/real/path/to/your/sources/folder/_server/gCal.eliom" />
```

* Don't forget to edit these lines with your own paths!

#### Find my calendar ID

You will need your calendar ID to display it.
* Go to the Google Calendar home page and log in: http://google.com/calendar
* In the calendar list on the left side of the page, click the down-arrow button
next to the appropriate calendar, then select _Calendar settings_.
* Have a look at the _Calendar Address_ section. Your ID is the e-mail address
displayed after _Calendar ID:_.

#### Make my calendar public

If you want your calendar to be seen by anybody who visit your website, you must
make it public. 
* In the calendar list on the left, click on the down-arrow button next to the
appropriate calendar, then select _Share this calendar_.
* Select _Make this calendar public_.
* If you don't want others to view the details of your events, select _See only free/busy (hide details)_.
* Click _Save_.

### Add it to my website code

The function `calendar` take in parameter the calendars you want to display and
some extra optional parameters that allow you to customize the display. It returns
an HTML5 `iframe` element that can be added on your website, anywhere that its
possible to add an `iframe` element :)

```ocaml
GCal.calendar [("my_calendar_id@group.calendar.google.com", GCal.Blue)];
```

The parameter is a list of pair containing:
* calendar ID
* color

List of available colors is in the `gCal.eliomi` file.
You can't use custom colors that are not in this list.

#### Customize!

###### Display/Hide some informations

You can chose to display or hide some informations:
* `show_title`
* `show_nav`
* `show_date`
* `show_print`
* `show_tabs`
* `show_calendars`
* `show_timezone`

By default, these informations are displayed (`true`).

<img src="http://public.db0.fr/dev/ocsigen/ocsigen_calendar_infos.png" alt="Calendar informations" />

```ocaml
GCal.calendar
  ~show_title:false
  calendars
```

###### Display mode

The calendar can be displayed in 3 formats:
* `Week`
* `Agenda`
* `Month`

The default value is `Month`.

Example of agenda:
```ocaml
GCal.calendar
  ~display_mode:GCal.Agenda
  calendars
```
<img src="http://public.db0.fr/dev/ocsigen/ocsigen_calendar_small.png" alt="Calendar Screenshot" />

###### Size of the calendar

The default size of the calendar is 600px x 800 px.
You can change these values using optional parameters `width` and `height`.
* `height` must be a size in pixels
* `width` can be a size in pixels (`Pixels`) or in percentage (`Percent`).

```ocaml
GCal.calendar
  ~width:(GCal.Pixels 300)
  ~height:200
  calendars
```
###### Week start on Sunday?

You can chose on which day the week start:
* `Sunday`
* `Monday`
* `Saturday`

```ocaml
GCal.calendar
  ~week_start_on:GCal.Monday
  calendars
```

###### Timezone

The default timezone is the one that is configured by the calendar itself.
You can chose to display the calendar with an other timezone.
The parameter is an optional value, `None` will ask Google Calendar for the default value.

```ocaml
GCal.calendar
  ~timezone:(Some "Africa/Djibouti")
  calendars
```

The list of available timezone is the value `GCal.timezones`.
To display them all:
```ocaml
List.iter print_endline GCal.timezones
```

###### Language

The language of the calendar can be change using
[standad languages acronyms](http://www.loc.gov/standards/iso639-2/php/code_list.php).

```ocaml
GCal.calendar
  ~lang:(Some "fr")
  calendars
```

###### Background color

The background color of the calendar can be change to fit your website.
The parameter is the hexadecimal string representation of the color, starting with a `#`.

```ocaml
GCal.calendar
  ~background_color:"#668CD9"
  calendars
```

***

### F.A.Q.

##### I can see my calendar events, but nobody else can see them!

Don't forget to [make your calendar public](#make-my-calendar-public).

##### Unbound module GCal

In OCaml and Ocsigen, file order is important. So, in your Makefile
and in your configuration file, don't forget to put tools before gCal,
and gCal before the file which is calling gCal functions!

##### Unbound module Gcal

The name of the module is `GCal`, not `Gcal`.

##### What is Ocsigen and why should I use it for my website?

Ocsigen is a powerful web server and framework written in OCaml.

Ocsigen makes it possible to write Web applications, client and server side, using OCaml,
 very expressive and safe programming language.

* Same language and libraries for client and server parts
* No need to encode data before sending it
* Use server-side values in your client code!
* Call server-side functions from the browser!
* Handle server-to-client communications transparently!
* Keep your client side program running when you change page!

More information: [Official Website](http://ocsigen.org/)

***


## Copyright/License

     Copyright 2012 Barbara Lepage
  
     Licensed under the Apache License, Version 2.0 (the "License");
     you may not use this file except in compliance with the License.
     You may obtain a copy of the License at
  
         http://www.apache.org/licenses/LICENSE-2.0
  
     Unless required by applicable law or agreed to in writing, software
     distributed under the License is distributed on an "AS IS" BASIS,
     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
     See the License for the specific language governing permissions and
     limitations under the License.


### Author

* Made by __db0__
* Website: http://db0.fr/
* Contact: db0company@gmail.com


### Up to date

Latest version of this project is on GitHub:
* https://github.com/db0company/GCal