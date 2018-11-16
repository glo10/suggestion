(function(){
  const category = document.querySelector('input[name="category"]');
  const list = document.querySelector('#suggestions');
  const proverbs = document.querySelector('#proverbs');

  let config = {
    minLength : 2
  };

  category.addEventListener('keyup', e => {
    list.innerHTML = '';
    list.classList.remove("alert-success");
    proverbs.innerHTML = '';
    if(category.value.length >= config.minLength){
      getSuggestions();
    }
  });

  function getSuggestions(){
    let url = 'suggest.php?search=' + category.value;

    fetch(url)
    .then(res => res.text())
    .then(data => {
      let suggestions = data.split(';');
      suggestions.forEach(li => {
          list.innerHTML += '<li class="alert alert-success col-12">' + li + '</li>';
          addLiClick();
      });
    });
  }

  function addLiClick(){
    let li = suggestions.querySelectorAll('li');
    li.forEach(item => {
      item.addEventListener('click',e => {
          category.value = e.target.innerText;
          getProverbs();
      });
    })
  }

  function getProverbs(){
    let url = 'proverbs.php?category='+category.value;
    fetch(url)
    .then(res => res.json())
    .then(data => {
      if(data.length == 0){
        proverbs.innerHTML = '<p class="text-info">Aucun proverbe trouvé</p>';
      }
      else{
        proverbs.innerHTML = '<h2>Liste de proverbes avec la catégorie ' + category.value + '</h2>';
        data.forEach(proverb => {
          proverbs.innerHTML += '<article class="text-justify"><p>' + proverb.body + '</p></article>';
        });
      }
    });
  }

})();
