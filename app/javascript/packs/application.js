// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
//import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


import "jquery";
import "popper.js";
//import "skipper-slider/dist/skippr.js"
//import "script.js"


import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

window.$ = window.jQuery = require('jquery');

Rails.start()
//Turbolinks.start()
ActiveStorage.start()

//= require underscore
//= require gmaps/google

$(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 500);
    event.preventDefault();
  });

  $('.hum-icon').click(function () {
    $('.hum-menu').toggleClass('d-none');
  })

  $('.hum-menu').click(function () {
    $('.hum-menu').toggleClass('d-none');
  })
});
