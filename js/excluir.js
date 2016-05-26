/**
 * Created by Leonardo Vilarinho on 28/03/2016.
 */
$(function()
{

    $(".apagar").click(function()
    {
        var id = $(this).prop("id");
        if(confirm("Deseja realmente excluir esse objeto? Todos dados ligados a ele como Advertências, Viagens, etc, também serão excluídos."))
        {
            window.location.replace("apagar/" + id);
        }
    });


});
