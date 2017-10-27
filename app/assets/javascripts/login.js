var clicky = true;

$(".view").on('click', function() {
  if(clicky){
    $(".view").css("opacity", 1);
    document.getElementById("seecret").type ='text';
    clicky = false;
  }
  else{
    $(".view").css("opacity", .5);
    document.getElementById("seecret").type ='password';
    clicky = true;
  }
});

$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > .card >div').not(target).hide();
  
  $(target).fadeIn(600);
  
});
