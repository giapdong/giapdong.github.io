// Enable tooltip for all tag have data-toggle="tooltip"
$(function () {
	$('[data-toggle="tooltip"]').tooltip();
});


// Allow code-block have copy button
// https://stackoverflow.com/questions/22581345/click-button-copy-to-clipboard
function copyToClipboard(element) {
	var $temp = $("<textarea>");
	$("body").append($temp);
	var $content = $(element).text().trim();
	$temp.val($content).select();
	document.execCommand("copy");
	$temp.remove();
};


var blocks = $('pre code');
for (var i = 0; i < blocks.length; i++){
	var block = blocks[i];
	var parent = $(block).parent();
	var $copy = $("<span class='-copy'>copy</span>");
	$copy.on('click', function() {
		var $element = $(this).parent().find('code');
		copyToClipboard($element);
		var $alert = $("<span class='-alert'>Copied!</span>");
		$(this).parent().append($alert);

		setTimeout(() => {
			$alert.remove();
		}, 500);
	});

	$(parent).append($copy);
	$(parent).addClass('code-block');
}
