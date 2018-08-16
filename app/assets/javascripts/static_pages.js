var ready = function() {
  var scroller = document.querySelector('#infinite-scrolling');


  if (scroller) {
    window.addEventListener('scroll', function() {
      var more_posts_url;
      var more_posts_url = document.querySelector('#infinite-scrolling a.next_page').getAttribute('href');
      var scrollTop = window.scrollY;
      var docHeight = document.body.scrollHeight;
      var winHeight = window.innerHeight;
      if (more_posts_url && scrollTop > docHeight - winHeight - 60) {
        document.querySelector('.pagination').innerHTML = ('');
        Rails.ajax({
          type: 'GET',
          dataType: 'script',
          url: more_posts_url,
        });
      }
    });
  }
};

document.addEventListener("turbolinks:load", ready);