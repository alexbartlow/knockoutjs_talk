class Cat
  constructor: (observable) ->
    @obs = observable
  save: ->
    $.post '/cats',
      dataType: 'application/json'
      data: ko.mapping.toJS(@obs)
