@grid_color: #6c6cc4;


#utm_lines[zoom>=14] {
  line-color: @grid_color;
  line-width: 0.5;
}

#tct_routes[status="tct"],#tce_routes[status="tct"] {
  line-color: #f2c612;
  line-width: 2;
  line-opacity: 0.9;
}

#tct_routes[status="proposed_tct"],#tce_routes[status="proposed_tct"] {
  line-color: #d6b06f;
  line-width: 2;
  line-opacity: 0.9;
  line-dasharray: 4,3;
}

#tct_routes[status="non_tct"],#tce_routes[status="non_tct"] {
  line-color: #c291c1;
  line-width: 2;
  line-opacity: 0.9;
}

#tct_routes[status="to_scout"],#tce_routes[status="to_scout"] {
  line-color: #d26363;//#64eb0b;
  line-width: 2;
  line-opacity: 0.9;
  line-dasharray: 4,3;
}

#tct_routes[status="scouted"],#tce_routes[status="scouted"] {
  line-color: #4299e4;
  line-width: 2;
  line-opacity: 0.9;
}

#tct_routes[status="side_route"],#tce_routes[status="side_route"] {
  line-color: #1ba599;
  line-width: 2;
  line-opacity: 0.9;
  line-dasharray: 4,3;
}

#tct_routes[status="access_route"],#tce_routes[status="access_route"] {
  line-color: #12f2e9;
  line-width: 2;
  line-opacity: 0.9;
  line-dasharray: 4,3;
}

#tct_routes[type="known"],#tce_routes[type="known"] {
  line-width: 1.3;
  line-dasharray: 3,3;
//  line-color: black;
  [source="josef"] {
    line-color: #29b951;
  }
  [source="tct-2015"] {
//    line-color: #d64646;
    line-opacity:0;
  }
  [source="NHF"] {
    line-color: #6565f6;
  }
  [source="richard delong"] {
    line-color: #e00ae0;
  }
  
  [zoom>=13] {
    text-avoid-edges: true;
    text-name: "[name]";
    text-face-name: @sans_italic;
    text-fill: #2d2626;
    text-halo-fill: fadeout(#fff,80%);
    text-halo-radius: 1.5;
    text-halo-rasterizer: fast;
    text-placement: line;
    text-min-distance: 400;
    text-size: 8 * @text_multiplier;
    text-character-spacing: 0.25;
    text-dy: -7;
    [zoom>=14] {
      text-size: 9 * @text_multiplier;
    }
    
    [source="tct-2015"] {
      text-opacity:0;
      text-halo-opacity:0;
    }
  }  
}

#tct_points[type="marking"][sub_type="blaze"][zoom>=15],
#tce_points[type="marking"][sub_type="blaze"][zoom>=15]{
  marker-file: url("img/icon-ct/marking_blaze.svg");
  [zoom>=15] { marker-width: 10; }
  [zoom>=17] { marker-width: 14; }
}

#tct_points[type="marking"][sub_type="post"][zoom>=15],
#tce_points[type="marking"][sub_type="post"][zoom>=15] {
  marker-file: url("img/icon-ct/marking_post.png");
  [zoom>=15] { marker-width: 24; }
  [zoom>=16] { marker-width: 26; }
  [zoom>=17] { marker-width: 30; }
}

#tct_points[type="marking"][sub_type="cairn"][zoom>=15],
#tce_points[type="marking"][sub_type="cairn"][zoom>=15]{
  marker-file: url("img/icon-ct/marking_cairn.png");
  [zoom>=15] { marker-width: 10; }
  [zoom>=17] { marker-width: 14; }
}

#tct_points[type="mud"][zoom>=15],
#tce_points[type="mud"][zoom>=15] {
  marker-file: url("img/icon-ct/mud.png");
  [zoom>=15] { marker-width: 12; }
  [zoom>=17] { marker-width: 16; }
  [zoom>=18] { marker-width: 19; }
}

#tct_points[type="note"][zoom>=15],
#tce_points[type="note"][zoom>=15] {
  marker-file: url("img/icon-ct/notes.png");
  [zoom>=15] { marker-width: 9; }
  [zoom>=16] { marker-width: 10; }
  [zoom>=17] { marker-width: 12; }
}

#tct_points[type="scout_note"][zoom>=14],
#tce_points[type="scout_note"][zoom>=14] {
  marker-file: url("img/icon-ct/scout.png");
  [zoom>=14] { marker-width: 12; }
  [zoom>=16] { marker-width: 16; }
  [zoom>=17] { marker-width: 18; }
}

#tct_points[type="sign"][zoom>=15],
#tce_points[type="sign"][zoom>=15] {
  marker-file: url("img/icon-ct/sign.png");
  [zoom>=15] { marker-width: 14; }
  [zoom>=16] { marker-width: 16; }
  [zoom>=17] { marker-width: 18; }
  [zoom>=18] { marker-width: 20; }
}

#tct_points[type="water_source"][zoom>=12], 
#tce_points[type="water_source"][zoom>=12] {
  marker-fill: #5e95c4;
  marker-line-color: white;
  marker-line-width: 3;
  [zoom>=12] {marker-width: 14;}
  [zoom>=14] {marker-width: 16;}
  [zoom>=18] {marker-width: 22;}
  marker-file: url("img/maki/water-18.svg");
}

#tct_points[type="poi"][zoom>=15],
#tce_points[type="poi"][zoom>=15] {
  marker-line-width: 3;
  marker-fill: white;
  marker-line-color: #a33737;  
  [zoom>=14] { marker-width: 7; }
  [zoom>=15] { marker-width: 9; }
  [zoom>=16] { marker-width: 12; }
  [zoom>=17] { marker-width: 14; }
  [zoom>=18] { marker-width: 16; }
}

#tct_points[type="poi"][sub_type="tower"][zoom>=15],#tct_points[type="poi"][sub_type="tower_partial"][zoom>=15],
#tce_points[type="poi"][sub_type="tower"][zoom>=15],#tct_points[type="poi"][sub_type="tower_partial"][zoom>=15] {
  marker-file: url("img/icon-ct/poi_tower.png");
  [zoom>=15] { marker-width: 20; }
  [zoom>=17] { marker-width: 20; }
  [zoom>=18] { marker-width: 24; }
  [zoom>=19] { marker-width: 26; }
}

#tct_points[type="poi"][sub_type="tower_partial"][zoom>=15],
#tce_points[type="poi"][sub_type="tower_partial"][zoom>=15] {
  marker-file: url("img/icon-ct/poi_tower_partial.png");
}

#tct_points[type="mud"], #tct_points[type="note"], #tct_points[type="scout_note"], #tct_points[type="sign"], #tct_points[type="poi"],
#tce_points[type="mud"], #tce_points[type="note"], #tce_points[type="scout_note"], #tce_points[type="sign"], #tce_points[type="poi"]{
  [zoom>=17] {
    text-face-name: @sans;
    text-name: [name];
    text-fill: #806b2d; 
    text-dy: 12;
    text-placement: point;
    text-halo-fill: @crop;//fadeout(#fff,80%);
    text-halo-radius: 1.2;
    text-halo-rasterizer: fast;
    text-wrap-width: 75;
  }
}

#tct_points[type="app-ele"], 
#tce_points[type="app-ele"] {
  [zoom>=13] {
    text-face-name: @sans;
    text-size: 9 * @text_multiplier;
    text-name:'x\n' + [ele];
    text-fill: #2727b9; 
    text-dy: 12;
    text-placement: point;
    text-halo-fill: @crop;//fadeout(#fff,80%);
    text-halo-radius: 1.2;
    text-halo-rasterizer: fast;
    text-wrap-width: 75;
  }
}

#photos-34ed7o[zoom>=14][zoom<=17] {
  marker-width: 2;
  marker-fill: white;
  marker-line-color: blue;
}

/*#osmtm_tasks_4 {
  line-color: black;
  line-width: 0.7;
}*/