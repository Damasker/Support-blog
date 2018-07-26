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
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales/ru-RU
jQuery(document).ready(function() {
   window.setTimeout("fadeMyDiv();", 3000); //call fade in 3 seconds
   /*$('.wysihtml5').each(function(i, elem) {
      $(elem).wysihtml5();
    });*/
   
 $('.wysihtml5').each(function() {
    $(this).wysihtml5({'toolbar': {'blockquote': false, 'html': true}});
  });
 }
)

function fadeMyDiv() {
   $("#notice").fadeOut('slow');
}
// override options
var myCustomTemplates = {
  customTemplates: {
    image: function(locale) {
      return "<li>" +
        "<div class='bootstrap-wysihtml5-insert-image-modal modal hide fade'>" +
        "<div class='modal-header'>" +
        "<a class='close' data-dismiss='modal'>&times;</a>" +
        "<h3>" + locale.image.insert + "</h3>" +
        "</div>" +
        "<div class='modal-body'>" +
        "<div class='chooser_wrapper'>" +
        "<table class='image_chooser images'></table>" +
        "</div>" +
        "</div>" +
        "<div class='modal-footer'>" +
        "<a href='#' class='btn' data-dismiss='modal'>" + locale.image.cancel + "</a>" +
        "</div>" +
        "</div>" +
        "<a class='btn' data-wysihtml5-command='insertImage' title='" + locale.image.insert + "'><i class='icon-picture'></i></a>" +
        "</li>";
    }
  }
};