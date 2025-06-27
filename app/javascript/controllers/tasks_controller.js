import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tasks"
export default class extends Controller {
  static values = { id: Number, completed: Boolean }

  toggle(event) {
    fetch(`/tasks/${this.idValue}`, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        "Accept": "text/vnd.turbo-stream.html",
	"X-CSRF-Token": this.getCSRFToken()
      },
      body: JSON.stringify({
	task: { id: this.idValue, completed: !this.completedValue }
      })
    })
  }

  getCSRFToken() {
    return document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }
}
