$(document).ready(function () {

    var deleteLink = $("a:contains('Delete')");
    $(deleteLink).click(function (event) {
        $("#dialog-confirm").dialog({
            resizable: false,
            height: 140,
            modal: true,
            buttons: {
                "OK": function () {
                    $.ajax({
                        url: $(event.target).attr("href"),
                        type: "DELETE",
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader("Accept", "application/json");
                            xhr.setRequestHeader("Content-Type", "application/json");
                        },

                        success: function (user) {
                            var respContent = "";
                            var rowToDelete = $(event.target).closest("tr");
                            rowToDelete.remove();
                        }
                    });
                    $(this).dialog("close");
                },
                Cancel: function () {
                    $(this).dialog("close");
                }
            }
        });
        event.preventDefault();
    });
});