window.viewModel =
  <span class="vm-nouns"># nouns
  cats: <span class="vm-mapping">ko.mapping.fromJS(<%=@cats.to_json %>)</span>
  currentCat: ko.observable({})
  </span>
  <span class="vm-verbs">
  # verbs
  showCat: (id) ->
    window.viewModel.currentCat(_.pluck(window.viewModel.cats(), id)
  </span>

