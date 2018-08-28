$(document).on('turbolinks:load', function() {
	$('#unfollow-btn').hover(function() {
		console.log('hello');
		$(this).removeClass('btn-light');
		$(this).addClass('btn-danger');
		$(this).html('Unfollow');
	}, function() {
		$(this).removeClass('btn-danger');
		$(this).addClass('btn-light');
		$(this).html('Following');
	});
});