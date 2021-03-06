<script type="text/ng-template" id="story.split.html">
<is:modal form="submit(stories)"
          submitButton="${message(code: 'is.ui.backlog.menu.split')}"
          closeButton="${message(code: 'is.button.cancel')}"
          title="${message(code: 'is.dialog.split.title')}">
    <p class="help-block">${message(code: 'is.dialog.split.description')}</p>
    <div class="form-group col-sm-12">
        <slider ng-model="splitCount"
                min="2"
                step="1"
                max="10"
                value="splitCount"
                on-stop-slide="onChangeSplitNumber()"></slider>
    </div>
    <table class="table table-striped">
        <tr ng-repeat="story in stories track by $index">
            <td>
                <div class="clearfix">
                    <div class="form-group col-sm-8">
                        <label>${message(code: 'is.story.name')}</label>
                        <input required
                               ng-maxlength="100"
                               type="text"
                               ng-model="stories[$index].name"
                               class="form-control">
                    </div>
                    <div class="form-group col-sm-2" ng-show="authorizedStory('updateEstimate', stories[$index])">
                        <label>${message(code: 'is.story.effort')}</label>
                        <ui-select ng-if="!isEffortCustom()"
                                   class="form-control"
                                   name="effort"
                                   search-enabled="true"
                                   ng-model="stories[$index].effort">
                            <ui-select-match>{{ $select.selected }}</ui-select-match>
                            <ui-select-choices repeat="i in effortSuite(isEffortNullable(stories[$index])) | filter: $select.search">
                                <span ng-bind-html="'' + i | highlight: $select.search"></span>
                            </ui-select-choices>
                        </ui-select>
                        <input type="number"
                               ng-if="isEffortCustom()"
                               class="form-control"
                               name="effort"
                               min="0"
                               ng-model="stories[$index].effort"/>
                    </div>
                    <div class="form-group col-sm-2">
                        <label>${message(code: 'is.story.value')}</label>
                        <ui-select class="form-control"
                                   name="value"
                                   search-enabled="true"
                                   ng-model="stories[$index].value">
                            <ui-select-match>{{ $select.selected }}</ui-select-match>
                            <ui-select-choices repeat="i in integerSuite | filter: $select.search">
                                <span ng-bind-html="'' + i | highlight: $select.search"></span>
                            </ui-select-choices>
                        </ui-select>
                    </div>
                    <div class="form-group col-sm-12">
                        <label>${message(code: 'is.backlogelement.description')}</label>
                        <textarea required
                                  at="atOptions"
                                  ng-maxlength="3000"
                                  type="text"
                                  ng-model="stories[$index].description"
                                  class="form-control"></textarea>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</is:modal>
</script>