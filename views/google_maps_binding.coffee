ko.bindingHandlers.mapMarker =
  init: (elt, valueAccessor, allBindings, model) ->
    value = valueAccessor()
    value.position = new google.maps.LatLng(value.lat, value.lng)
    value.draggable = true
    model.marker = new google.maps.Marker(value)

    handler = window.viewModel.setActive.bind(model)
    google.maps.event.addListener model.marker, 'click', handler
    google.maps.event.addListener model.marker, 'dragstart', handler
    google.maps.event.addListener model.marker, 'dragend', handler

  update: (elt, valueAccessor, allBindings, model) ->
    value = valueAccessor()
    value.position = new google.maps.LatLng(value.lat, value.lng)
    if value.isActive
      model.marker.setIcon(ko.bindingHandlers.mapMarker.active)
    else
      model.marker.setIcon(ko.bindingHandlers.mapMarker.inactive)
    model.marker.setPosition(value.position)
    model.marker.setTitle(value.title)

  inactive: 'http://www.google.com/intl/en_us/mapfiles/ms/micons/red-dot.png'
  active  : 'http://www.google.com/intl/en_us/mapfiles/ms/micons/green-dot.png'
