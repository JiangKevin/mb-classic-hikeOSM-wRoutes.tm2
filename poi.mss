// =====================================================================
// POINTS OF INTEREST ICONS & LABELS
// =====================================================================

// Airports and rail stations are styled separately from other POIs
// because we use different fields to set their icon images.

// Mountain Peaks
/*#mountain_peak_label[zoom>=11], {
  text-name:[name_en] + '\n' + [elevation_m] + 'm';
  marker-file: url("img/maki/[maki]-18.svg");
  text-face-name: @sans;
  text-placement: point;
  text-halo-fill: fadeout(#fff,80%);
  text-halo-radius: 1.5;
  text-halo-rasterizer: fast;
  [zoom=14] {text-size: 12;}
  [zoom=15] {text-size: 14;}
}*/

// Peaks
#peak-pass[natural="peak"][zoom>=11][name_en!=''],
#peak-pass[natural="peak"][zoom>=13][name_en=''] {
  text-name:'x\n' + [name_en] + '\n' + [ele];
  text-face-name: @sans;
  text-placement: point;
  text-halo-fill: fadeout(#fff,80%);
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-margin: 30; // Prevent from having a ton of spot heights next to each other
  text-min-padding: 1; // Prevent text from getting cut off at tiles
  [zoom<=13] {text-size: 8 * @text_multiplier;}
  [zoom=14] {text-size: 10 * @text_multiplier;}
  [zoom>=15] {text-size: 12 * @text_multiplier;}
}

// Mountain Passes
#peak-pass[mountain_p="yes"][zoom>=11][name_en!=''] {
  text-face-name: @sans;
  //text-name: [name_en];
  text-name:[name_en] + '\n' + [ele];
  text-fill: #806b2d; 
  text-dy: 10;
  text-placement: point;
  text-halo-fill: @crop;//fadeout(#fff,80%);
  text-halo-radius: 1.2;
  text-halo-rasterizer: fast;
  text-min-padding: 1; // Prevent text from getting cut off at tiles
  //marker-allow-overlap: true;
  marker-fill: black;
  [zoom<=13] {
    marker-width: 12;
    text-size: 8 * @text_multiplier;
  }
  [zoom>=14] {
    marker-width: 14;
    text-size: 10 * @text_multiplier;
  }
  [zoom>=15] {text-size: 12 * @text_multiplier;}
  [zoom>=16] {marker-width: 16;}
  [zoom>=18] {marker-width: 20;}
  marker-file: url("img/icon-ct/mountain-pass.svg");
}

// Get rid of some of the mountain climbing passes
#peak-pass[mountain_p="yes"][zoom>=11][name_en!=''][name_en=~".*[0-9][A-D]"] {
  text-opacity: 0;
  text-halo-opacity: 0;
  marker-opacity: 0;
}

#poi_label[maki='drinking-water'] {
  [zoom>=17] {
    text-face-name: @sans;
    text-name: "Spring";
    text-fill: #3b7ab0; 
    text-dy: 12;
    text-placement: point;
    text-halo-fill: @crop;//fadeout(#fff,80%);
    text-halo-radius: 1.2;
    text-halo-rasterizer: fast;
    text-margin: 20;
  }
  marker-fill: #5e95c4;
  marker-line-color: white;
  marker-line-width: 3;
  [zoom>=14] {marker-width: 18;}
  [zoom>=18] {marker-width: 22;}
  marker-file: url("img/maki/water-18.svg");
  //marker-allow-overlap: true;
}
  

#poi_label[type!='Aerodrome'][type!='Rail Station'][type!='hole'], {
  ::icon {
    [zoom<14],
    [zoom>=14][scalerank=1][localrank<=1],
    [zoom>=15][localrank<=16],
    [zoom>=16][localrank<=16],
    [zoom>=17][localrank<=16],
    [zoom>=18][localrank<=16],
    [zoom>=19] {
      [maki!=null] {
        marker-file: url("img/maki/[maki]-12.svg");
      }
      [maki='marker'] {
        marker-fill-opacity: 0;
      }
      [maki=null] {
        // small dot for POIs with no Maki icon defined
        marker-width: 4;
        marker-fill: rgba(0,0,0,0);
        marker-line-width: 1.2;
        //marker-line-color: #666;
        marker-line-color: #666;
      }
    }
  }
  [zoom<14],
  [zoom>=14][scalerank=1][localrank<=1],
  [zoom>=15][scalerank<=2][localrank<=1],
  [zoom>=16][scalerank<=3][localrank<=1],
  /*[zoom>=17][localrank<=4],
  [zoom>=18][localrank<=16],
  [zoom>=19]*/ {
    text-name: @name;
    text-face-name: @sans;
    text-fill: #555;
    text-halo-fill: @land;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-dy: 12;
    text-line-spacing: -4;
    text-wrap-width: 80;
    text-wrap-before: true;
    [scalerank=1] {
      [zoom>=15] { text-size: 11 * @text_multiplier; text-wrap-width: 100; }
      [zoom>=16] { text-size: 12 * @text_multiplier; text-wrap-width: 120; }
      [zoom>=17] { text-size: 14 * @text_multiplier; text-wrap-width: 130; }
    }
    [scalerank=2] {
      [zoom>=16] { text-size: 11 * @text_multiplier; text-wrap-width: 100; }
      [zoom>=17] { text-size: 12 * @text_multiplier; text-wrap-width: 120; }
    }
    [scalerank>=3] {
      [zoom>=17] { text-size: 11 * @text_multiplier; text-wrap-width: 100; }
      [zoom>=19] { text-size: 12 * @text_multiplier; text-wrap-width: 120; }
    }
  }
}

// Rail Stations _______________________________________________________

#poi_label[type='Rail Station'][network!=null][scalerank=1][zoom>=14],
#poi_label[type='Rail Station'][network!=null][scalerank=2][zoom>=15],
#poi_label[type='Rail Station'][network!=null][scalerank=3][zoom>=16] {
  marker-file: url("img/rail/[network]-12.svg");
  marker-height: 12;
  marker-allow-overlap: false;
  [zoom=16] {
    marker-file: url("img/rail/[network]-18.svg");
    marker-height: 18;
  }
  [zoom>16] {
    marker-file: url("img/rail/[network]-12.svg");
    marker-height:24;
  }
  [zoom>15] {
    text-name: @name;
    text-face-name: @sans;
    text-fill: #888;
    text-halo-fill: #fff;
    text-halo-radius: 1.5;
    text-halo-rasterizer: fast;
    text-size: 11 * @text_multiplier;
    text-wrap-width: 80;
    text-placement-type: simple;
    text-dx: 11; text-dy: 11;
    text-placements: "S,N,E,W";
    [zoom>=17] {
      text-size: 12 * @text_multiplier;
      text-halo-radius: 2;
      text-dx: 15; text-dy: 15;
    }
  }
}

// Airports ____________________________________________________________

#poi_label[type='Aerodrome'][zoom>=10] {
  marker-file: url("img/maki/[maki]-12.svg");
  text-name: "''";
  text-size: 10 * @text_multiplier;
  text-fill: #888;
  text-halo-fill: #fff;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-face-name: @sans;
  text-line-spacing: -2;
  text-dy: 8;
  [zoom>=11][zoom<=13][scalerank=1],
  [zoom>=12][zoom<=13][scalerank=2] {
    text-name: [ref];
  }
  [zoom>=14] {
    text-name: @name;
    text-wrap-before: true;
  }
  [zoom>=11][scalerank=1],
  [zoom>=12][scalerank=2],
  [zoom>=14] {
    marker-file: url("img/maki/[maki]-18.svg");
    text-size: 10 * @text_multiplier;
    text-dy: 12;
    text-wrap-width: 80;
  }
  [zoom>=13][scalerank=1],
  [zoom>=14][scalerank=2],
  [zoom>=15] {
    marker-file: url("img/maki/[maki]-24.svg");
    text-size: 12 * @text_multiplier;
    text-dy: 15;
    text-wrap-width: 100;
  }
  [zoom>=14][scalerank=1],
  [zoom>=15][scalerank=2],
  [zoom>=16] {
    marker-file: url("img/maki/[maki]-24.svg");
    text-size: 14 * @text_multiplier;
    text-dy: 19;
    text-wrap-width: 120;
  }
}

/**/

