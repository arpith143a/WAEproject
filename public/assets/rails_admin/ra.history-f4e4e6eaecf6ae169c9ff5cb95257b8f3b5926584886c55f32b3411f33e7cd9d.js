!function(a){a.widget("ra.history",{_create:function(){var t=this;t.element.find("a.changeset").unbind().bind("click",function(d){return t._bindModalOpening(d,a(this).data("url")),!1})},_bindModalOpening:function(t,d){if(t.preventDefault(),widget=this,a("#modal").length)return!1;var i=this._getModal();setTimeout(function(){a.ajax({url:d,beforeSend:function(a){a.setRequestHeader("Accept","text/javascript")},success:function(a){i.find(".modal-body").html(a),widget._bindFormEvents()},error:function(a){i.find(".modal-body").html(a.responseText)},dataType:"text"})},100)},_bindFormEvents:function(){var a=this._getModal(),t=a.find("table");saveButton=a.find(".save-action"),a.find(".modal-header-title").html(t.data("title")),a.find(".cancel-action").unbind().click(function(){return a.modal("hide"),!1}).html(t.data("cancel")),a.find("#version tr").prettyTextDiff(),saveButton.attr("href",t.data("rollbackurl")).data("confirm",t.data("confirm")).html(t.data("rollback"))},_getModal:function(){var t=this;return t.dialog||(t.dialog=a('<div id="modal" class="modal fade">            <div class="modal-dialog modal-lg">            <div class="modal-content">            <div class="modal-header">              <a href="#" class="close" data-dismiss="modal">&times;</a>              <h3 class="modal-header-title">...</h3>            </div>            <div class="modal-body">              ...            </div>            <div class="modal-footer">              <a href="#" class="btn cancel-action">...</a>              <a href="#" class="btn btn-primary save-action" data-method="put" data-confirm="Are you sure?">...</a>            </div>            </div>            </div>          </div>').modal({keyboard:!0,backdrop:!0,show:!0}).on("hidden.bs.modal",function(){t.dialog.remove(),t.dialog=null})),this.dialog}})}(jQuery),$(document).on("rails_admin.dom_ready",function(){$("#history").history()});