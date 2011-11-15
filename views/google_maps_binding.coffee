ko.bindingHandlers.mapMarker =
  init: (elt, valueAccessor, allBindings, model) ->
    value = valueAccessor()
    value.position = new google.maps.LatLng(value.lat, value.lng)
    value.draggable = true
    model.marker = new google.maps.Marker(value)

    handler = window.viewModel.setActive.bind(model)
    google.maps.event.addListener model.marker, 'click', handler
    google.maps.event.addListener model.marker, 'dragstart', handler

    handler = window.viewModel.handleClickEvent.bind(model)
    google.maps.event.addListener model.marker, 'dragend', handler

  update: (elt, valueAccessor, allBindings, model) ->
    value = valueAccessor()
    value.position = new google.maps.LatLng(value.lat, value.lng)
    model.marker.setPosition(value.position)
    model.marker.setTitle(value.title)


