$(function () {
    var name = $("#name"),
        surname = $("#surname"),
        phone = $("#phone"),
        allFields = $([]).add(name).add(surname).add(phone),
        tips = $(".validateTips");
    $("#phone").mask("(999) 999-9999");


    function updateTips(t) {
        tips
            .text(t)
            .addClass("ui-state-highlight");
        setTimeout(function () {
            tips.removeClass("ui-state-highlight", 1500);
        }, 500);
    }

    function checkLength(o, n, min, max) {
        if (o.val().length > max || o.val().length < min) {
            o.addClass("ui-state-error");
            updateTips("Length of " + n + " must be between " +
                min + " and " + max + ".");
            return false;
        } else {
            return true;
        }
    }

    $("#dialog-form").dialog({
        autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
        buttons: {
            "Add a user": function () {
                var bValid = true;
                var isClosed = false;
                //allFields.removeClass("ui-state-error");

                bValid = bValid && checkLength(name, "name", 3, 16);
                bValid = bValid && checkLength(surname, "surname", 3, 16);

                if (bValid) {
                    var json = { "name": name.val(), "surname": surname.val(), "phone": phone.val()};
                    $.ajax({
                        url: $("#newuserform").attr("action"),
                        data: JSON.stringify(json),
                        type: "POST",
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader("Accept", "application/json");
                            xhr.setRequestHeader("Content-Type", "application/json");
                        },
                        success: function (user) {
                            location.reload();
                        }
                    });
                }
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        },
        close: function () {
            allFields.val("").removeClass("ui-state-error");
        }
    })
    ;

    $("#create-user")
        .button()
        .click(function () {
            $("#dialog-form").dialog("open");
        });
})
;