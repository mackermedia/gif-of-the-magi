
try {

  this.script;
  _.listens.to.the.marquee.element.for.keydown.or.mouseout
  _.tests.the.entered.text(is.it.an.image)
  _.replaces.the['<blink>'].image.with.the.new.one.and.saves.to.localstorage

} catch(e) {
  "use lenient";

  /////////////////

  var marquee = document.getElementsByTagName('marquee')[0];
  var gif = 'http://i.imgur.com/Npizs.gif';

  marquee.addEventListener('keydown', postNewGif);

  window.setInterval(checkForNewGif, 5000);

  checkForNewGif();

  /////////////////

  function setTheGif() {
    marquee.innerText = gif;
    document.getElementsByTagName('blink')[0].style.backgroundImage = 'url(' + gif + ')';
  };

  function checkForNewGif() {
    var request = new XMLHttpRequest();
    request.open("GET", window.location.pathname + "/gifs", true);
    request.setRequestHeader("Content-type","application/json");
    request.send();

    request.onreadystatechange = function() {
      if (request.readyState == 4 && request.status == 200) {
        console.log(request);
        var newGif = request.responseText;
        if (newGif !== gif && newGif !== '') {
          gif = newGif;
          setTheGif();
        }
      }
    }
  }

  function postNewGif(e) {
    if (e.keyCode === 13) {
      e.preventDefault();
      var request = new XMLHttpRequest();
      request.open("POST", window.location.pathname + "/gifs", true);
      request.setRequestHeader("Content-type","application/json");
      request.send('{"gif":{"url":"' + marquee.innerText + '"}}');
    }
  }
}
