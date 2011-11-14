ko.bindingHandlers.mapMarker =
  init: (elt, valueAccessor, allBindings, model) ->
    value = valueAccessor()
    value.position = new google.maps.LatLng(value.lat, value.lng)
    model.marker = new google.maps.Marker(value)

    handler = window.viewModel.setActive

    google.maps.event.addListener model.marker, 'click', handler.bind(model)

  update: (elt, valueAccessor, allBindings, model) ->
    value = valueAccessor()
    value.position = new google.maps.LatLng(value.lat, value.lng)
    model.marker.setPosition(value.position)
    model.marker.setTitle(value.title)


