/**
 * Created by Leonardo Vilarinho on 28/03/2016.
 */

$(function()
{
    $.contextMenu
    ({
        selector: '.context-menu',
        callback: function(key)
        {
            if(key == "editar")
            {
                window.location.replace("editar/" + this.prop("id"));
            }
            else if(key == "deletar")
            {
                if(confirm("Deseja realmente excluir esse usuário?"))
                {
                    window.location.replace("apagar/" + this.prop("id"));
                }
            }
        },
        items:
        {
            "editar": {name: "Editar", icon: "edit"},
            "deletar": {name: "Apagar", icon: "delete"},
            "sep1": "---------",
            "sair": {name: "Cancelar", icon: function()
            {
                return 'context-menu-icon context-menu-icon-quit';
            }}
        }
    });

    $('.context-menu').on('click', function(e)
    {
    })
});