// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require assets/js/core/popper.min
//= require bootstrap
//= require assets/js/plugins/moment.min
//= require assets/js/plugins/bootstrap-switch
//= require assets/js/plugins/bootstrap-tagsinput
//= require assets/js/plugins/bootstrap-selectpicker
//= require assets/js/plugins/jasny-bootstrap.min
//= require assets/js/plugins/nouislider.min
//= require assets/js/plugins/bootstrap-datetimepicker.min
//= require assets/js/now-ui-kit
//= require activestorage
//= require_tree .



// ------------------------ REPARATION NAVBAR RESPONSIVE ---------------------
$(document).ready(function () {
    $('#navbar-btn').click(function () {
        $('.collapse').show(500);
    });
});

