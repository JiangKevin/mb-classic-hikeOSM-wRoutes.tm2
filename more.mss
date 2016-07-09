@grid_color: #6c6cc4;


#utm_lines[zoom>=14] {
  line-color: @grid_color;
  line-width: 0.5;
}

#tct_routes[type="tct"] {
  line-color: #f2c612;
  line-width: 2;
  line-opacity: 0.9;
}

#tct_routes[type="scout"] {
  line-color: #64eb0b;
  line-width: 2;
  line-opacity: 0.9;
}

#tct_routes[type="scouted"] {
  line-color: #4299e4;
  line-width: 2;
  line-opacity: 0.9;
}

#tct_routes[type="known"] {
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

#tct_points[type="marker"][zoom>=15] {
  marker-file: url("img/icon-ct/blaze.svg");
  [zoom>=15] {
    marker-width: 10;
  }
  [zoom>=17] {
    marker-width: 14;
  }
}

#tct_points[type="mud"][zoom>=15] {
  marker-file: url("img/icon-ct/mud.png");
  [zoom>=15] {
    marker-width: 12;
  }
  [zoom>=17] {
    marker-width: 16;
  }
  [zoom>=18] {
    marker-width: 19;
  }
}

#tct_points[type="notes"][zoom>=15] {
  marker-file: url("img/icon-ct/notes.png");
  [zoom>=15] {
    marker-width: 9;
  }
  [zoom>=16] {
    marker-width: 10;
  }
  [zoom>=17] {
    marker-width: 12;
  }
}

#tct_points[type="scout"][zoom>=14] {
  marker-file: url("img/icon-ct/scout.png");
  [zoom>=14] {
    marker-width: 12;
  }
  [zoom>=16] {
    marker-width: 16;
  }
  [zoom>=17] {
    marker-width: 18;
  }
}

#tct_points[type="signs"][zoom>=15] {
  marker-file: url("img/icon-ct/signs.png");
  [zoom>=15] {
    marker-width: 14;
  }
  [zoom>=16] {
    marker-width: 16;
  }
  [zoom>=17] {
    marker-width: 18;
  }
  [zoom>=18] {
    marker-width: 20;
  }
}

#tct_points[type="mud"], #tct_points[type="notes"], #tct_points[type="scout"], #tct_points[type="signs"] {
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

#tct_points[type="app-ele"] {
  [zoom>=16] {
    text-face-name: @sans;
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

#photos[zoom>=14][zoom<=17] {
  marker-width: 2;
  marker-fill: white;
  marker-line-color: blue;
}

/*#osmtm_tasks_4 {
  line-color: black;
  line-width: 0.7;
}*/