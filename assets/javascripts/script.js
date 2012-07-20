function show_pn(elem) {
  if (elem.checked) {
    Element.hide('add_private_notes');
    elem.value = 1;
  }
  else {
    Element.show('add_private_notes');
    elem.value = '';
  }
}