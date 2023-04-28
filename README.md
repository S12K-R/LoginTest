This repository contains the necessary files to run a simple user login interface that i made.

It features a simple login and register functions. This was made using the Backendless API but instead of designing the app in the low code app design
functionality that Backendless features, i just used the API and database functionality to test POST/GET requests as a test (hence the name, LoginTest).

Altough functional, the project itself can be considered as a work in progress. The Backendless API is very complete, and holds several functions that i'm 
studying in order to do more complex requests and simulate a big app login experience. As of right now, it is capable to register an user with a standard
email/password that is REGEX verified so it can't be null or have the wrong sintaxis, and it's also capable of verifying if an user has already registered
with an email so it can be used again.

Errors returned by the requests are also handled, as they are shown in screen using Alerts whose descriptions are dinamically setted with the error
description provided by the requests, such as wrong password error message or no internet connection.



<img width="300" alt="Screenshot 2023-04-28 at 13 00 57" src="https://user-images.githubusercontent.com/70918171/235197121-dcda9ef1-247c-4796-b47f-8ae692fa3be1.png">
<img width="357" alt="Screenshot 2023-04-28 at 13 02 12" src="https://user-images.githubusercontent.com/70918171/235197520-77229d20-b4f3-43f2-96a8-34c841e70baa.png">
<img width="299" alt="Screenshot 2023-04-28 at 13 03 44" src="https://user-images.githubusercontent.com/70918171/235197687-c20efd5b-87b9-4761-9323-a99fe0574033.png">
