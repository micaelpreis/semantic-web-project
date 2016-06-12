window.onload = function() {
    var arts = document.getElementById("topicArts");
    var business = document.getElementById("topicBusiness");
    var fashion = document.getElementById("topicFashion");
    var food = document.getElementById("topicFood");
    var health = document.getElementById("topicHealth");
    var magazine = document.getElementById("topicMagazine");
    var movies = document.getElementById("topicMovies");
    var ny = document.getElementById("topicNY");
    var opinion = document.getElementById("topicOpinion");
    var real = document.getElementById("topicReal");
    var sports = document.getElementById("topicSports");
    var technology = document.getElementById("topicTechnology");
    var travel = document.getElementById("topicTravel");
    var us = document.getElementById("topicUS");
    var world = document.getElementById("topicWorld");

    arts.onclick = function() {
        document.forms["topicArts"].submit();
        return false;
    }
    business.onclick = function() {
        document.forms["topicBusiness"].submit();
        return false;
    }
    fashion.onclick = function() {
        document.forms["topicFashion"].submit();
        return false;
    }
    food.onclick = function() {
        document.forms["topicFood"].submit();
        return false;
    }
    health.onclick = function() {
        document.forms["topicHealth"].submit();
        return false;
    }
    magazine.onclick = function() {
        document.forms["topicMagazine"].submit();
        return false;
    }
    movies.onclick = function() {
        document.forms["topicMovies"].submit();
        return false;
    }
    ny.onclick = function() {
        document.forms["topicNY"].submit();
        return false;
    }
    opinion.onclick = function() {
        document.forms["topicOpinion"].submit();
        return false;
    }
    real.onclick = function() {
        document.forms["topicReal"].submit();
        return false;
    }
    sports.onclick = function() {
        document.forms["topicSports"].submit();
        return false;
    }
    technology.onclick = function() {
        document.forms["topicTechnology"].submit();
        return false;
    }
    travel.onclick = function() {
        document.forms["topicTravel"].submit();
        return false;
    }
    us.onclick = function() {
        document.forms["topicUS"].submit();
        return false;
    }
    world.onclick = function() {
        document.forms["topicWorld"].submit();
        return false;
    }
}

function submitSection(section) {
    document.forms["section" + section].submit();
}

function submitSubsection(n) {
    document.forms["subsection" + n].submit();
}

function submitAuthor(n) {
    document.forms["author" + n].submit();
}

function submitTagSub(n) {
    document.forms["tagSub" + n].submit();
}

function submitTagOrg(n) {
    document.forms["tagOrg" + n].submit();
}

function submitTagPer(n) {
    document.forms["tagPer" + n].submit();
}

function submitTagLoc(n) {
    document.forms["tagLoc" + n].submit();
}

function toggle1() {
    document.getElementById('slider1').classList.toggle('closed');
    document.getElementById('slider2').classList.toggle('closed');
    document.getElementById('slider3').classList.toggle('closed');
    document.getElementById('news-small').classList.toggle('closed');
}

function toggle2() {
    document.getElementById('slider4').classList.toggle('closed');
    document.getElementById('slider5').classList.toggle('closed');
    document.getElementById('slider6').classList.toggle('closed');
    document.getElementById('news-small2').classList.toggle('closed');
}

function toggle3() {
    document.getElementById('slider7').classList.toggle('closed');
    document.getElementById('slider8').classList.toggle('closed');
    document.getElementById('slider9').classList.toggle('closed');
    document.getElementById('news-small3').classList.toggle('closed');
}

function toggle4() {
    document.getElementById('slider10').classList.toggle('closed');
    document.getElementById('slider11').classList.toggle('closed');
    document.getElementById('slider12').classList.toggle('closed');
    document.getElementById('news-small4').classList.toggle('closed');
}

function toggleRec() {
    document.getElementById('sliderR1').classList.toggle('closed');
    document.getElementById('sliderR2').classList.toggle('closed');
    document.getElementById('sliderR3').classList.toggle('closed');
    document.getElementById('sliderR4').classList.toggle('closed');
    document.getElementById('sliderR5').classList.toggle('closed');
    document.getElementById('sliderR6').classList.toggle('closed');
    document.getElementById('recommendation').classList.toggle('closed');
}
