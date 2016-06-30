//@grid_color: #f6f5ed;
//@grid_color: #f4c95c;
@grid_color: #6c6cc4;

/*#grid1330 {
  line-color: orange;
  line-width: 0.7;
}*/

#utm-lines[zoom>=14] {
  //line-color: @grid_color;
  //line-width: 0.5;
/*  [zoom>=15] {
    text-name: [Coordinate];
    text-face-name: @sans;
    text-placement: line;
  }*/
}

/*#osmtm_tasks_4 {
  line-color: black;
  line-width: 0.7;
}*/

/*#tracksmaster {
  line-width: 1.3;
  line-dasharray: 3,3;
//  line-color: black;
  [source="josef"] {
    line-color: orange;
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
}*/

#just-tct {
  //line-color: #f2a218;
  //line-width: 2.5;
  //line-opacity: 0.9;
}

/*#just-tct::and {
  line-color: black;//#d64646;
  line-width: 1.3;
  line-dasharray: 3,3;
  line-opacity: 0.8;
}*/