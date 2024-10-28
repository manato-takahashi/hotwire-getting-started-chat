import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="messages"
export default class extends Controller {
  static targets = ["broadcastMessage"];

  connect() {
    this.element.scrollTop = this.element.scrollHeight;
  }

  broadcastMessageTargetConnected(element) {
    element.scrollIntoView();
  }
}
