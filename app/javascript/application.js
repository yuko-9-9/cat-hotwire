// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
// import * as bootstrap from "bootstrap"
import 'bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

Turbo.session.drive = false