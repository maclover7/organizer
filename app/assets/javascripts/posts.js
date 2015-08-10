setupChosen();
function setupChosen(){
  $('#post_tag_list').chosen({
    allow_single_deselect: true,
    disable_search_threshold: 10,
    no_results_text: 'Oops, nothing found!',
    width: "95%"
  });
};
