// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap';
import 'jquery';

import { profileModal } from '../components/profile_modal';
import { backToResults } from '../packs/back_to_results';
import { writeDelete } from '../packs/home'; 

// import { showProfile } from '../packs/show_profile';
// import { roadMapBuild} from '../packs/roadmap';
// import { addCourseBtn } from '../packs/roadmap';

import { startChatRoom } from '../channels/message_channel'
import { scrollDown } from '../packs/scroll';

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  // showProfile();
  profileModal();
  backToResults();
  // addCourseBtn();
  // roadMapBuild();
  // front-end-search-chat();
  // addCourseBtn();
  scrollDown();
  startChatRoom();
  writeDelete();
});

import "stylesheets/application"
