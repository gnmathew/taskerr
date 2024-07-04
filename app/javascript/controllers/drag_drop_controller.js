import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  static targets = ["item"];

  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    });
  }

  end(event) {
    const id = event.item.dataset.id;
    const newIndex = event.newIndex;
    const url = `/projects/${id}/move`;

    fetch(url, {
      method: 'PATCH', // Use PATCH method for updating existing resources
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({ position: newIndex })
    });
  }
}