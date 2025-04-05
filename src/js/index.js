import Alpine from 'alpinejs';
import collapse from '@alpinejs/collapse';

import '@splidejs/splide/css';
import Splide from '@splidejs/splide';

import 'lazysizes';

var sliders = document.getElementsByClassName( 'splide' );

for ( var i = 0; i < sliders.length; i++ ) {
  new Splide( sliders[ i ], {
    arrowPath: 'M28.5357 19.2929C28.9262 19.6834 28.9262 20.3166 28.5357 20.7071L22.1717 27.0711C21.7812 27.4616 21.148 27.4616 20.7575 27.0711C20.367 26.6805 20.367 26.0474 20.7575 25.6569L26.4144 20L20.7575 14.3431C20.367 13.9526 20.367 13.3195 20.7575 12.9289C21.148 12.5384 21.7812 12.5384 22.1717 12.9289L28.5357 19.2929ZM10 19L27.8286 19V21L10 21V19Z',
    gap:'1.5rem',
    pagination: false,
    breakpoints: {
      640: {
        perPage: 1,
      },
      768: {
        perPage: 2,
      }
    }
  } ).mount();
}

// Components
Alpine.plugin(collapse);

// Global
window.Alpine = Alpine;

// Inits
Alpine.start();