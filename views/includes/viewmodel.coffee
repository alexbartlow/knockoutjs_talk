window.viewModel =
  <span id="vm-nouns"># nouns
  cats: <span id="vm-mapping">ko.mapping.fromJS(<%=@cats.to_json %>)</span>
  currentCat: ko.observable({})
  </span>
  <span id="vm-verbs">
  # verbs
  showCat: (id) ->
    window.viewModel.currentCat(_.pluck(window.viewModel.cats(), id)
  </span>

