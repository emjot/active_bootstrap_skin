$(document).ready(function() {
  // Add meta view port
  $('head').append('<meta name="viewport" content="width=device-width, initial-scale=1">');

  var html_responsive = ' \
    <ul class="header-item tabs mobile"> \
      <li> \
        <button class="navbar-toggle button_mobile_burger" type="button" aria-expanded="false" aria-controls="tabs"> \
          <span class="sr-only">Toggle navigation</span> \
          <span class="icon-bar"></span> \
          <span class="icon-bar"></span> \
          <span class="icon-bar"></span> \
        </button> \
      </li> \
    </ul> \
  '

  $(html_responsive).insertAfter('#site_title');

  function applyTabsLayout() {
    var isMobile = $(window).width() <= 768;
    var $tabs = $('#tabs');
    var $toggle = $('.button_mobile_burger');

    if (isMobile) {
      $tabs.addClass('collapse');
      if (!$tabs.hasClass('in')) {
        $toggle.attr('aria-expanded', 'false');
      }
    } else {
      $tabs.removeClass('collapse in');
      $toggle.attr('aria-expanded', 'true');
    }
  }

  $(window).on('resize', applyTabsLayout);

  $(document).on('click', '.button_mobile_burger', function(event) {
    event.preventDefault();

    var $tabs = $('#tabs');
    var isExpanded = $tabs.toggleClass('in').hasClass('in');

    $(this).attr('aria-expanded', isExpanded ? 'true' : 'false');
  });

  applyTabsLayout();
});
