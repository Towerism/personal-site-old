(function($){
  $(function(){

    $('.button-collapse').sideNav({
      edge: 'right'
    });
    $(".dropdown-button").dropdown({ hover: true,
                                     belowOrigin: true });
    $('.resume-section').pushpin({ top: $('.resume-section').offset().top });

  }); // end of document ready
})(jQuery); // end of jQuery name space
