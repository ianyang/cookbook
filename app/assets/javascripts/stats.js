$(document).ready(function(){

  $.ajax(
    '/data.json',
    {
      success: function(graph_data) {
        var container = $('.chart');
        var colors = ['red','skyblue','green','gold'];

        container.append('<div id="cook_chart" class="graph"/>');
        console.log(graph_data);
        Morris.Bar({
          element: 'cook_chart',
          data: graph_data,
          xkey: 'y',
          ykeys: ['a'],
          labels: ['count']
        });
      }
    }
  );
});
