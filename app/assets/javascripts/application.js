//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap


$(document).on('turbolinks:load', function(){
    $('input[name="contact_file[csv_file]"]').change(function(){
        var file = $(this);
        var filePath = file.val();
        var allowedExtensions = /(\.csv)$/i;

        if(!allowedExtensions.exec(filePath)){
            alert('Please upload file having extension .csv');
            file.val('');
            return false;
        }

        CSVImportGetHeaders(file.prop('files')[0]);
    })
});

function CSVImportGetHeaders(file){
    var reader = new FileReader();

    reader.readAsArrayBuffer(file);

    reader.onloadend = function (evt) {
        var data = evt.target.result;
        var byteLength = data.byteLength;
        var ui8a = new Uint8Array(data, 0);
        var headerString = '';

        for (var i = 0; i < byteLength; i++) {
            var char = String.fromCharCode(ui8a[i]);

            if (char.match(/[^\r\n]+/g) !== null) {
                headerString += char;
            } else {
                break;
            }
        }

        FillDropDownsOptions(headerString.split(','));
    };
}

function FillDropDownsOptions(headers){
    var options = '';

    headers.forEach(function(item){
        options += `<option value="${item}">${item}</option>`;
    });
    
    $('select').each(function(){
        $(this).append(options);
    });
}
