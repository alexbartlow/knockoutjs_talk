window.S4 = ->
  (((1+Math.random())*0x10000)|0).toString(16).substring(1)
window.guid = ->
  (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4())

$ ->
  # Nouns
  window.viewModel = ko.mapping.fromJS
    tasks: []
    currentTaskId: null

  window.viewModel.map = new google.maps.Map document.getElementById('map_canvas'),
    zoom: 4
    mapTypeId: google.maps.MapTypeId.ROADMAP
    center: new google.maps.LatLng(40.69847032728747, -73.9514422416687)

  # Verbs
  window.viewModel.createTask = ->
    pos = window.viewModel.map.getCenter()
    task = ko.mapping.fromJS
      id: window.guid()
      name: ""
      completed: false
      lat: pos.lat()
      lng: pos.lng()

    task.isActive = ->
      window.viewModel.currentTaskId() is @id
    
    window.viewModel.setActive.apply(task)
    window.viewModel.tasks.push task

  window.viewModel.setActive = (event) ->
    window.viewModel.currentTaskId @id
    if event? && event.latLng?
      inner_handler = (item) ->
        item.lat(event.latLng.lat())
        item.lng(event.latLng.lng())

      inner_handler item for item in window.viewModel.tasks() when item.id is window.viewModel.currentTaskId()

  window.viewModel.save = ->
    console.log("Save stub")

  # setup
  $(document).on 'submit', 'form', ->
    false

  ko.applyBindings window.viewModel

