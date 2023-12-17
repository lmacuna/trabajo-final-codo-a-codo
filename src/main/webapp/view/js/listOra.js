const deleteModal = document.getElementById('deleteModal')
if (deleteModal) {
  deleteModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget
    // Extract info from data-bs-* attributes
    const recipient = button.getAttribute('data-bs-whatever')
    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    const modalTitle = deleteModal.querySelector('.modal-title')
    const modalBodyInput = deleteModal.querySelector('.modal-body input')

    modalBodyInput.value = recipient
  })
}


const updateModal = document.getElementById('updateModal')
if (updateModal) {
  updateModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget
    // Extract info from data-bs-* attributes
    let idUpd = button.getAttribute('idUpd')
	let nom = button.getAttribute('nom')    
	let ape = button.getAttribute('ape')    
	let email = button.getAttribute('email')    
    
    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    document.getElementById("idUpd").value=idUpd
    document.getElementById("nom").value=nom
    document.getElementById("ape").value=ape
    document.getElementById("email").value=email

  })
}