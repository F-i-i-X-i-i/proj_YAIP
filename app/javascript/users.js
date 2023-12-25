// app/assets/javascripts/toggle_active.js
document.addEventListener('turbolinks:load', function() {
    document.querySelectorAll('.toggle-active-button').forEach(function(button) {
      button.addEventListener('ajax:success', function() {
        // обновляем страницу после успешного выполнения запроса
        location.reload();
      });
    });
  });