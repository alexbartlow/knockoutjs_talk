class Cat
  save: ->
    $.post '/cats',
      dataType: 'application/json'
      data: ko.utils.toJSON this
