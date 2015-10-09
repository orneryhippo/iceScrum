<script type="text/ng-template" id="notes.panel.html">
    <div ng-controller="userCtrl" class="panel panel-primary">
        <div class="panel-heading">${message(code: 'is.panel.notes')}</div>

        <div class="panel-body">
            <div class="form-group">
                <textarea id="note-size" is-markitup
                          class="form-control"
                          name="notes"
                          ng-model="editableUser.notes"
                          is-model-html="editableUser.notes_html"
                          ng-show="showNotesTextarea"
                          ng-blur="showNotesTextarea = false; update(editableUser)"
                          placeholder="${message(code: 'is.ui.backlogelement.nonotes')}"></textarea>

                <div class="markitup-preview"
                     ng-disabled="true"
                     ng-show="!showNotesTextarea"
                     ng-click="showNotesTextarea = true"
                     ng-class="{'placeholder': !editableUser.notes_html}"
                     tabindex="0"
                     ng-bind-html="(editableUser.notes_html ? editableUser.notes_html : '<p>${message(code: 'is.ui.backlogelement.nonotes')}</p>') | sanitize"></div>
            </div>
        </div>
    </div>
</script>