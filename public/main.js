$(document).ready(function(){
  $('body').on('click', '.blog_delete', function(e) {
    e.preventDefault;
    id = $(this).attr('id')
    $.ajax({
      type: 'delete',
      url: '/blogs/'+id,
      success: function() {
        window.location = '/';
      },
      error: function(){
        alert('删除失败');
        window.location = '/';
      }
    })
  })

  $('body').on('click', '.get_index',function(e){
    e.preventDefault;
    $.getJSON('/', function(data){
      $('body').append("<p>"+JSON.stringify(data)+"</p>")
    })
  })
})