// Common Colors //

@land: #f4efe1;
@water: #cdd;
@water_dark: #185869;  // for the inline/shadow
@crop: #eeeed4;
@cropland: #e9e5c2;
@grass: #e7ebd1;
@scrub: #e0e8cd;
@wood: #d4e2c6;
@snow: #f4f8ff;
@rock: #ddd;
@sand: mix(#ffd,@land,33%);
// These colors need to take `comp-op:multiply` into account:
@cemetery: #edf4ed;
@pitch: fadeout(#fff,50%);
@park: #edf9e4;
@piste: mix(blue,@land,5);
@school: #fbf6ff;
@hospital: #fff0f0;
@builtup: #f6faff;

// This is for increasing the size of the text across the board by some multiple.
// Useful when creating print maps and need to increase the text size
@text_multiplier: 1.0; //1.5

// Background //

Map {
  background-color: @land;
}

// Mapbox Terrain global landcover //

#landcover {
  [class='wood'] { polygon-fill: @wood; }
  [class='scrub'] { polygon-fill: @scrub; }
  [class='grass'] { polygon-fill: @grass; }
  [class='crop'] { polygon-fill: @crop; }
  [class='snow'] { polygon-fill: @snow; }
  // fade out after zoome level 9
  // we want the OSM data to be used here - rather than the inaccurate landcover layer
  [zoom>=4] {
      [zoom>=4]{polygon-opacity: 0.7;}
      [zoom>=5]{polygon-opacity: 0.4;}
      [zoom>=6]{polygon-opacity: 0.2;}
      [zoom>=7]{polygon-opacity: 0;}
    [class='crop'] { polygon-opacity: 0.7; }
  }
}

// OSM landuse & landcover //

#landuse {
  // The ::cover attachments fade in and become solid, overriding
  // any underlying shaped in the #landcover layer.
  ::cover33 { opacity: 0.33; }
  ::cover66 { opacity: 0.66; }
  ::cover33[zoom=6],
  ::cover66[zoom=7],
  ::cover[zoom>=8] {
    // Bring in OSM landcover only at higher zoom levels where
    // the higher level of detail makes sense.
    [class='wood'] { polygon-fill: @wood; }
    [class='scrub'] { polygon-fill: @scrub; }
    [class='grass'] { polygon-fill: @grass; }
    [class='crop'] { polygon-fill: @crop; }
    [class='sand'] { polygon-fill: @sand; }
    [class='glacier'] { polygon-fill: @snow; }
    [type='golf_course'],[type='rough'] { polygon-fill: darken(@park,10); }
  }
  ::cover33[zoom=10],
  ::cover66[zoom=11],
  ::cover[zoom>=12] {
    [class='rock'] { polygon-fill: @rock; }
  }
}

// Additional landcover I have added from Soviet maps (Tamo)

#landcover_tct[type="dense_forest"][zoom<=18] {
  polygon-fill: @wood;
}
#landcover_tct[type="mechseri"][zoom<=18] {
  polygon-fill: #e5edca;//lighten(@wood,5);
}
#landcover_tct[type="herbaceous"][zoom<=18] {
  polygon-fill: #f3f6dc;//lighten(@grass,5);
}



#landuse::use {
  // The ::use attachement is multuplied over #landcover and
  // #landuse::cover*, letting trees, grass, etc show through
  // where they occur in parks, schools, etc.
  comp-op: multiply;
  [class='cemetery'] {
    polygon-fill: @cemetery;
    line-color: @cemetery*0.95;
    line-offset: -0.5;
  }
  [class='hospital'] {
    polygon-fill: @hospital;
    line-color: @hospital*0.95;
    line-offset: -0.5;
  }
  [class='industrial'] {
    polygon-fill: @builtup;
    line-color: @builtup*0.95;
    line-offset: -0.5;
  }
  [class='park'] {
    polygon-fill: @park;
    line-color: @park*0.95;
    line-offset: -0.5;
  }
  [class='pitch'][zoom>=15] {
    polygon-fill: @pitch;
    line-color: #fff;
    line-width: 0.5;
    [zoom>=16] { line-width: 1; }
    [zoom>=17] { line-width: 1.5; }
    [type='green'] {
      polygon-fill: darken(@pitch,20);
      line-color: darken(@pitch,5);
      line-width: 1;
      [zoom>=17] { line-width: 1.5; }
      [zoom>=18] { line-width: 2; }
    }
    [type='fairway'],
    [type='tee']{
      polygon-fill: darken(@pitch,5);
      line-color: darken(@pitch,20);
    }
  }
  [class='sand'] {
    polygon-fill: @sand;
    [type='bunker'] {
      polygon-fill: darken(@sand,5);
      line-color: darken(@sand,14);
    }
  }
  [class='school'] {
    polygon-fill: @school;
    line-color: @school*0.95;
    line-offset: -0.5;
  }
}

#landuse_overlay {
  // Landuse/landcover areas that need to be drawn above the water layer.
  polygon-fill: rgba(0,0,0,0);
  polygon-clip: false;
  [class='wetland'] {
    polygon-fill: fadeout(@water,80);
    [zoom>=12] {
      polygon-pattern-file: url(img/pattern/wetland_16.png);
      polygon-pattern-opacity: 0.5;
      polygon-pattern-alignment: global;
    }
    [zoom>=13] { polygon-pattern-file: url(img/pattern/wetland_32.png); }
    [zoom>=14] { polygon-pattern-file: url(img/pattern/wetland_64.png); }
  }
  [class='wetland_noveg'] {
    polygon-fill: fadeout(@water,80);
    [zoom>=12] {
      polygon-pattern-file: url(img/pattern/wetland_noveg_16.png);
      polygon-pattern-opacity: 0.5;
      polygon-pattern-alignment: global;
    }
    [zoom>=13] { polygon-pattern-file: url(img/pattern/wetland_noveg_32.png); }
    [zoom>=14] { polygon-pattern-file: url(img/pattern/wetland_noveg_64.png); }
  }
  [class='breakwater'],
  [class='pier'] {
    polygon-fill: @land;
  }
}

// Hillshading //
#hillshade {
  ::0[zoom<=10],
  ::1[zoom>=11][zoom<=12],
  ::2[zoom=13],
  ::3[zoom=14],
  ::4[zoom>=15][zoom<=18],
  ::5[zoom>=19] {
//    comp-op: hard-light;
    polygon-clip: false;
    image-filters-inflate: true;
    [class='shadow'] {
      [level=89] { polygon-fill: #888; }
      [level=78] { polygon-fill: #666; }
      [level=67] { polygon-fill: #444; }
      [level=56] { polygon-fill: #333; }
//      polygon-fill: #216;
      polygon-comp-op: multiply;
      [zoom>=0][zoom<=3] { polygon-opacity: 0.10; }
      [zoom>=4][zoom<=5] { polygon-opacity: 0.08; }
      [zoom>=6][zoom<=12] { polygon-opacity: 0.08; }
      [zoom>=13][zoom<=15] { polygon-opacity: 0.07; }
      [zoom>=16][zoom<=18] { polygon-opacity: 0.03; }
      [zoom>=18] { polygon-opacity: 0.01; }
    }
    [class='highlight'] {
      [level=94] { polygon-fill: #ffe; }
      [level=90] { polygon-fill: #eed; }
//      polygon-fill: #eed;
      polygon-opacity: 0.1;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.08; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.06; }
      [zoom>=18] { polygon-opacity: 0.05; }
    }
  }
  ::1 { image-filters: agg-stack-blur(4,4); }
  ::2 { image-filters: agg-stack-blur(8,8); }
  ::3 { image-filters: agg-stack-blur(14,14); }
  ::4 { image-filters: agg-stack-blur(32,32); }
  ::5 { image-filters: agg-stack-blur(32,32); }
}

// Elevation contours & labels //

// Multiple copies of the same layer have been made, each with
// unique classes and positions in the stack. This is done by
// editing the layers list in <project.yml>.

#contour.line::line[index!=-1] {
  line-color: #000;
  line-opacity: 0.1;
  line-width: 1.2;//0.9;//1.2;
  [index>=5] {
    line-opacity: 0.2;
    line-width: 1.2;//0.8;//1.2;
  }
  [zoom<=10] {
    line-opacity: 0;
  }
  [zoom=11] {
    line-width: 0.4;
  }
  [zoom=12] {
    line-width: 0.6;
  }
  [zoom=13] {
    line-width: 0.8;
  }
}

/*#sov-lines {
  line-color: #f00;
  line-opacity: 0.1;
  line-width: 1.2;//0.9;//1.2;
  text-name: "[Contour]+' m'";
  text-face-name: 'Open Sans Regular';
  text-placement: line;
  text-size: 10;
  text-fill: #666;
  text-avoid-edges: true;
  text-halo-fill: fadeout(@crop,80%);
  text-halo-radius: 2;
  text-halo-rasterizer: fast;
  text-margin: 150;
}*/

#contour.label::label[zoom>=14] {
  [zoom<=13][index>=5],
  [zoom>=14][zoom<=15][index=10],
  [zoom>=16][index>=5] {
    text-name: "[ele]+' m'";
    text-face-name: 'Open Sans Regular';
    text-placement: line;
    text-size: 10 * @text_multiplier;
    text-fill: #666;
    text-avoid-edges: true;
    text-halo-fill: fadeout(@crop,80%);
    text-halo-radius: 2;
    text-halo-rasterizer: fast;
    text-margin: 100; // added this
  }
}

// Water Features //

#water {
  polygon-clip: false;
  polygon-fill: @water_dark;
  ::blur {
    // A second attachment that is blurred creates the effect of
    // an inline stroke on the water layer.
    image-filters: agg-stack-blur(1,1);
    image-filters-inflate: true;
    polygon-clip: false;
    polygon-fill: @water;
    polygon-gamma: 0.6;
    [zoom<6] { polygon-gamma: 0.4; }
  }
}

#waterway {
  [type='river'],
  [type='canal'] {
    line-color: mix(@water,@water_dark,60);
    line-width: 0.5;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; line-cap: round; line-smooth: 0.5; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-color: mix(@water,@water_dark,60);
    line-width: 0.25;
    [zoom>=14] { line-width: 1; line-smooth: 0.5; }
    [zoom>=16] { line-width: 1.5; line-cap: round; }
    [zoom>=18] { line-width: 2; }
  }
}


// Aeroways //

// lines
#aeroway['mapnik::geometry_type'=2][zoom>9] {
  [type='runway'] {
    line-color:#ddd;
  	line-cap:square;
  	line-join:miter;
    [zoom=10]{ line-width:1; }
    [zoom=11]{ line-width:2; }
    [zoom=12]{ line-width:3; }
    [zoom=13]{ line-width:5; }
    [zoom=14]{ line-width:7; }
    [zoom=15]{ line-width:11; }
    [zoom=16]{ line-width:15; }
    [zoom=17]{ line-width:19; }
    [zoom>17]{ line-width:23; }
  }
  [type='taxiway'][zoom>=12] {
    line-color:#ddd;
  	line-cap:square;
  	line-join:miter;
    [zoom=10]{ line-width:0.2; }
    [zoom=11]{ line-width:0.2; }
    [zoom=12]{ line-width:0.2; }
    [zoom=13]{ line-width:1; }
    [zoom=14]{ line-width:1.5; }
    [zoom=15]{ line-width:2; }
    [zoom=16]{ line-width:3; }
    [zoom=17]{ line-width:4; }
    [zoom>17]{ line-width:5; }
  }
}

// polygons
#aeroway[type!='apron']['mapnik::geometry_type'=3][zoom>=13] {
  polygon-clip: false;
  polygon-fill: #ddd;
}

// Buildings //

#building {
  ::shadow[zoom>=14] {
    line-clip: false;
    line-join: round;
    line-cap: round;
    line-color: fadeout(#000, 85%);
    [zoom>=16] { line-width: 2; }
  }
  polygon-clip: false;
  polygon-fill: @land * 0.8;
  //polygon-fill: #b4a3a3;
  polygon-opacity: 0.8;
  [zoom>=14] {
    polygon-geometry-transform: translate(-0.5,-1.2);
  }
}

#barrier_line {
  [class='gate'][zoom>=17] {
    line-width:2.5;
    line-color:#aab;
  }
  [class='fence'][zoom>=17] {
    line-color: @land * 0.66;
    [zoom=17] { line-width:0.6; }
    [zoom=18] { line-width:0.8; }
    [zoom>18] { line-width:1; }
  }
  [class='hedge'][zoom>=16] {
    line-width:2.4;
    line-color:darken(@park,20);
    [zoom=16] { line-width: 0.6; }
    [zoom=17] { line-width: 1.2; }
    [zoom=18] { line-width: 1.4; }
    [zoom>18] { line-width: 1.6; }
  }
  [class='land'][zoom>=14] {
    ['mapnik::geometry_type'=2] {
      // These shouldn't be scaled based on pixel scaling
      line-color:@land;
      [zoom=14] { line-width: 0.4; }
      [zoom=15] { line-width: 0.75; }
      [zoom=16] { line-width: 1.5; }
      [zoom=17] { line-width: 3; }
      [zoom=18] { line-width: 6; }
      [zoom=19] { line-width: 12; }
      [zoom=20] { line-width: 24; }
      [zoom>20] { line-width: 48; }
    }
    ['mapnik::geometry_type'=3] {
      polygon-clip: false;
      polygon-fill:@land;
    }
  }
  [class='cliff'][zoom>=12] {
    line-color: #987;
    a/line-color: #987;
    a/line-width: 4;
    a/line-dasharray: 0,7,1,7;
    a/line-offset: -2;
  }
}

// Political boundaries //

#admin {
  line-join: round;
  line-color: #88a;
  [maritime=1] { line-color: darken(@water, 3%); }
  // Countries
  [admin_level=2] {
    //line-opacity:0;
    [zoom=2] { line-width: 0.4; }
    [zoom=3] { line-width: 0.8; }
    [zoom=4] { line-width: 1; }
    [zoom=5] { line-width: 1.5; }
    [zoom>=6] { line-width: 2; }
    [zoom>=8] { line-width: 3; }
    [zoom>=10] { line-width: 4; }
    [disputed=1] { line-dasharray: 4,4; }
  }
  // States / Provices / Subregions
  [admin_level>=3] {
    line-width: 0.4;
    line-dasharray: 10,3,3,3;
    [zoom>=6] { line-width: 1; }
    [zoom>=8] { line-width: 2; }
    [zoom>=12] { line-width: 3; }
    //line-opacity:0;
  }
  [admin_level>=4] {
    line-opacity:0;
  }
}

/*#svaneti-racha-border {
  line-join: round;
  line-color: #88a;
  line-width: 0.4;
  line-dasharray: 4,4;
  [zoom>=6] { line-width: 0.5; }
  [zoom>=8] { line-width: 1; }
  [zoom>=12] { line-width: 2; }
}*/

/**/