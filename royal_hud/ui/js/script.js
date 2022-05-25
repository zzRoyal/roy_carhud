$(() => {
    window.addEventListener('message', function(event){
        let e = event.data

        if (e.action == "InVeh") {
            $('.container').fadeIn(100);
            $('.carhud').fadeIn(100)
            $('.gasolina').text(Math.round(e.fuel) + "L");
            $(".velocidad").text(Math.round(e.kmh) + "");
        } else if (e.action == "outVeh") {
            $('.container').fadeOut()
            $('.carhud').fadeOut(100)
        };
        
        if (e.action === "cintotrue") {
            $('#cinturon').show(100)
        } else if (e.action === "cintofalse"){
            $('#cinturon').hide(100)
        };

    });
});