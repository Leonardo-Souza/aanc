/**
 * Created by Leonardo Vilarinho on 29/03/2016.
 */
function progress(percent, $element, velocity, txt) {
    percent = percent >= 100 ? 100 : percent;
    var progressBarWidth = percent * $element.width() / 100;
    $element
        .find('div')
        .stop()
        .animate({width: progressBarWidth}, velocity, "linear")
        .html(txt);
}
$(function ()
{
    progress(25000, $('.barprogress2'), 200, "1/4");
    $('.barprogress2 div').delay(800).css("background", "blue");
    $('.barprogress2').css("border", "1px solid blue");

    $('.confirm').css("color", "green");
    $('#senha').keyup(function () {
        var value = $(this).val();
        var progressValue = $('.barprogress div');
        var color, percent = 0;
        var texto = "";

        if($(this).val() == $('#senha2').val()) {
            $('#senha2').css("color", "green");
        } else {
            $('#senha2').css("color", "red");
        }
        if ((/[a-z]/gm.test(value) && !/[0-9]/gm.test(value) && !/[A-Z]/.test(value) && !/[!@#$%*()_+^&{/}}:;?.]/gm.test(value)) ||
            (!/[a-z]/gm.test(value) && /[0-9]/gm.test(value) && !/[A-Z]/.test(value) && !/[!@#$%*()_+^&{/}}:;?.]/gm.test(value)) ||
            (!/[a-z]/gm.test(value) && !/[0-9]/gm.test(value) && /[A-Z]/.test(value) && !/[!@#$%*()_+^&{/}}:;?.]/gm.test(value)) ||
            (!/[a-z]/gm.test(value) && !/[0-9]/gm.test(value) && !/[A-Z]/.test(value) && /[!@#$%*()_+^&{/}}:;?.]/gm.test(value))) {
            color = "#a52020";
            percent = 25;
            texto = "Fraca";
        } else if (value.length <= 7 || ((/[a-z]/gm.test(value) && /[0-9]/gm.test(value) && !/[A-Z]/.test(value) && !/[!@#$%*(/)_+^&{}}:;?.]/gm.test(value)) ||
            (/[a-z]/gm.test(value) && !/[0-9]/gm.test(value) && /[A-Z]/.test(value) && !/[!@#$%*(/)_+^&{}}:;?.]/gm.test(value)) ||
            (/[a-z]/gm.test(value) && !/[0-9]/gm.test(value) && !/[A-Z]/.test(value) && /[!@#$%*(/)_+^&{}}:;?.]/gm.test(value)) ||
            (!/[a-z]/gm.test(value) && /[0-9]/gm.test(value) && /[A-Z]/.test(value) && !/[!@#$%*(/)_+^&{}}:;?.]/gm.test(value)) ||
            (!/[a-z]/gm.test(value) && /[0-9]/gm.test(value) && !/[A-Z]/.test(value) && /[!@#$%*(/)_+^&{}}:;?.]/gm.test(value)) ||
            (!/[a-z]/gm.test(value) && !/[0-9]/gm.test(value) && /[A-Z]/.test(value) && /[!@#$%*(/)_+^&{}}:;?.]/gm.test(value)))){
            color = "#bfc12a";
            percent = 50;
            texto = "Média";
        } else if (value.length > 7 && ((/[a-z]/gm.test(value) && /[0-9]/gm.test(value) && /[A-Z]/.test(value) && !/[!@#$%*(/)_+^&{}}:;?.]/gm.test(value)) ||
            (/[a-z]/gm.test(value) && !/[0-9]/gm.test(value) && /[A-Z]/.test(value) && !/[!@#$%*()_+^&{/}}:;?.]/gm.test(value)) ||
            (/[a-z]/gm.test(value) && /[0-9]/gm.test(value) && !/[A-Z]/.test(value) && /[!@#$%*()_+^&{/}}:;?.]/gm.test(value)) ||
            (/[a-z]/gm.test(value) && /[0-9]/gm.test(value) && /[A-Z]/.test(value) && !/[!@#$%*()_+^&{/}}:;?.]/gm.test(value)))) {
            color = "#08a292";
            percent = 75;
            texto = "Regular";
        } else if (value.length > 7 && (/[a-z]/gm.test(value) && /[0-9]/gm.test(value) && /[A-Z]/.test(value) && /[!@#$%*()_+^&{/}}:;?.]/gm.test(value))) {
            color = "#3c948b";
            percent = 100;
            texto = "Segura";
        }
        progress(percent, $('.barprogress'), 100, texto);
        progressValue.css("background", color);
        $('.barprogress').css("border", "1px solid " + color);
    });
    $('#senha2').keyup(function(){
        if($(this).val() == $('#senha').val()) {
            $('#senha2').css("color", "green");
        } else {
            $('#senha2').css("color", "red");
        }
    });

});