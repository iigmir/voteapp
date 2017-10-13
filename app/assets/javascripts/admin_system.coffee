# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
var app = new Vue
({
    el:"#app",
    data:
    {
        admin_name : "<%= current_user.email %>"
    }
});