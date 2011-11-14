$ ->
  window.S4 = ->
    (((1+Math.random())*0x10000)|0).toString(16).substring(1)
  window.guid = ->
    (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4())

  window.viewModel = ko.mapping.fromJS
    tasks: []
    currentTaskId: null

  mapOptions =
    zoom: 4
    mapTypeId: google.maps.MapTypeId.ROADMAP
    center: new google.maps.LatLng(40.69847032728747, -73.9514422416687)

  window.viewModel.map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions)

  window.viewModel.createTask = ->
    task = ko.mapping.fromJS
      id: window.guid()
      name: ""
      completed: false
      lat: 0.0
      lng: 0.0

    window.viewModel.tasks.push task

  window.viewModel.isActive  = ->
    window.viewModel.currentTaskId() is this.id

  window.viewModel.handleClickEvent = (event) ->
    inner_handler = (item) ->
      item.lat(event.latLng.lat())
      item.lng(event.latLng.lng())

    inner_handler item for item in window.viewModel.tasks() when item.id is window.viewModel.currentTaskId()

  window.viewModel.setActive = (event) ->
    window.viewModel.currentTaskId(this.id)

  $(document).on 'submit', 'form', ->
    false

  ko.applyBindings window.viewModel
  google.maps.event.addListener window.viewModel.map, 'click', window.viewModel.handleClickEvent

