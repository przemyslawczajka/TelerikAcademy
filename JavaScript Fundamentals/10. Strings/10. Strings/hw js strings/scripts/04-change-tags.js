﻿//input text
var text = "We are <mixcase>living</mixcase> in a <upcase> yellow <mixcase>subma<lowcase>rine</lowcase></mixcase> </upcase>. We <mixcase> don't </mixcase> have <upcase> anything </upcase> else.";
jsConsole.writeLine("INPUT:");
jsConsole.writeLine("We are &#60;mixcase>living</mixcase> in a &#60;upcase> yellow &#60;mixcase>subma&#60;lowcase>rine&#60;/lowcase>&#60;/mixcase>&#60;/upcase>. We &#60;mixcase> don't &#60;/mixcase> have &#60;upcase> anything &#60;/upcase> else.");

//regex
var regexLow = new RegExp("<\s*(lowcase)\s*>(.*?)</\s*(lowcase)\s*>", "i");
var regexUp = new RegExp("<\s*(upcase)\s*>(.*?)</\s*(upcase)\s*>", "i");
var regexMix = new RegExp("<\s*(mixcase)\s*>(.*?)</\s*(mixcase)\s*>", "i");

function changeText(txt) {
    //search for regex matches
    var substrUp = txt.match(regexUp);
    var substrLow = txt.match(regexLow);
    var substrMix = txt.match(regexMix);

    //bottom of recursion (no inner submatches are found)
    if (substrLow == null && substrUp == null && substrMix == null) {
        return txt;
    }
    //find the longest match (=> it is the outermost)
    var upLength = substrUp != null ? substrUp[0].length : 0;
    var lowLength = substrLow != null ? substrLow[0].length : 0;
    var mixLength = substrMix != null ? substrMix[0].length : 0;
    var pointer = upLength > lowLength ? 1 : 2;
    if (pointer == 1) {
        pointer = upLength > mixLength ? 1 : 3;
    }
    else {
        pointer = lowLength > mixLength ? 2 : 3;
    }
    //manipulate the outermost match and recursively manipulate its nested tags
    switch (pointer) {
        case 1:
            txt = txt.replace(regexUp, changeText(substrUp[2].toUpperCase()));
            break;
        case 2:
            txt = txt.replace(regexLow, changeText(substrLow[2].toLowerCase()));
            break;
        case 3:
            txt = txt.replace(regexMix, changeText(randomize(substrMix[2])));
            break;
    }

    return changeText(txt);
}

function randomize(text) {
    var res = "";
    for (var i = 0; i < text.length; i++) {
        if (parseInt((Math.random() * 100)) % 2 == 0) {
            res += text[i].toUpperCase();
        }
        else {
            res += text[i].toLowerCase();
        }
    }
    return res;
}

var outputText = changeText(text);
jsConsole.writeLine("");
jsConsole.writeLine("OUTPUT /with random mixing each time/:");
jsConsole.writeLine(outputText);