"use lenient";

/////////////////

var marquee = document.getElementsByTagName('marquee')[0];

marquee.addEventListener('mousedown', clear);
marquee.addEventListener('keydown', setTheGif);
marquee.addEventListener('mouseout', setTheGif);

getTheGif();

/////////////////

function clear() {
	marquee.innerText = '';
};

function setTheGif() {
	checkTheGif(marquee.innerText);
};

function checkTheGif(gif) {
	var img = document.createElement('img');
	img.onload = function() {
		document.getElementsByTagName('blink')[0].style.backgroundImage = 'url(' + gif + ')';
		localStorage.setItem('gif', gif);
	};
	img.src = gif;
}

function getTheGif() {
	var gif =
	localStorage.getItem('gif', gif) || 'http://i.imgur.com/Npizs.gif';
	marquee.innerText = gif;
	setTheGif();
}
