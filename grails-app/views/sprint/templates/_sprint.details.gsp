%{--
- Copyright (c) 2015 Kagilum.
-
- This file is part of iceScrum.
-
- iceScrum is free software: you can redistribute it and/or modify
- it under the terms of the GNU Affero General Public License as published by
- the Free Software Foundation, either version 3 of the License.
-
- iceScrum is distributed in the hope that it will be useful,
- but WITHOUT ANY WARRANTY; without even the implied warranty of
- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- GNU General Public License for more details.
-
- You should have received a copy of the GNU Affero General Public License
- along with iceScrum.  If not, see <http://www.gnu.org/licenses/>.
-
- Authors:
-
- Vincent Barrier (vbarrier@kagilum.com)
- Nicolas Noullet (nnoullet@kagilum.com)
- Colin Bontemps (cbontemps@kagilum.com)
--}%
<script type="text/ng-template" id="sprint.details.html">
<div class="panel panel-light"
     flow-init
     flow-drop
     flow-files-submitted="attachmentQuery($flow, sprint)"
     flow-drop-enabled="authorizedSprint('upload', sprint)"
     flow-drag-enter="dropClass='panel panel-light drop-enabled'"
     flow-drag-leave="dropClass='panel panel-light'"
     ng-class="authorizedSprint('upload', sprint) && dropClass">
    <div class="panel-heading">
        <h3 class="panel-title row">
            <div class="left-title">
                <i class="fa fa-tasks"></i>
                {{ release.name + ' - ' + (sprint | sprintName) }}
                <entry:point id="sprint-details-left-title"/>
            </div>
            <div class="right-title">
                <div style="margin-bottom:10px">
                    <entry:point id="sprint-details-right-title"/>
                    <div class="btn-group">
                        <a ng-if="previousSprint"
                           class="btn btn-default"
                           role="button"
                           tabindex="0"
                           href="#{{:: viewName + '/' + (viewName == 'planning' ? sprint.parentRelease.id +  '/sprint/' : '') + previousSprint.id }}/details">
                            <i class="fa fa-caret-left" title="${message(code: 'is.ui.backlogelement.toolbar.previous')}"></i>
                        </a>
                        <a ng-if="nextSprint"
                           class="btn btn-default"
                           role="button"
                           tabindex="0"
                           href="#{{:: viewName + '/' + (viewName == 'planning' ? sprint.parentRelease.id +  '/sprint/' : '') + nextSprint.id }}/details"><i class="fa fa-caret-right" title="${message(code: 'is.ui.backlogelement.toolbar.next')}"></i>
                        </a>
                    </div>
                    <a class="btn btn-default"
                       href="{{:: $state.href('^') }}"
                       uib-tooltip="${message(code: 'is.ui.window.closeable')}">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
                <g:set var="formats" value="${is.exportFormats(entryPoint: 'sprintDetails')}"/>
                <g:if test="${formats}">
                    <div class="btn-group hidden-xs" uib-dropdown>
                        <button class="btn btn-default"
                                uib-tooltip="${message(code: 'todo.is.ui.export')}"
                                uib-dropdown-toggle type="button">
                            <i class="fa fa-download"></i>&nbsp;<i class="fa fa-caret-down"></i>
                        </button>
                        <ul uib-dropdown-menu
                            class="pull-right"
                            role="menu">
                            <g:each in="${formats}" var="format">
                                <li role="menuitem">
                                    <a href="${format.resource ?: 'story'}/sprint/{{ ::sprint.id }}/${format.action ?: 'print'}/${format.params.format}"
                                       ng-click="${format.jsClick ? format.jsClick : 'print'}($event)">${format.name}</a>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </g:if>
                <div class="btn-group" role="group">
                    <shortcut-menu ng-model="sprint" model-menus="menus" view-type="'details'"></shortcut-menu>
                    <div class="btn-group" uib-dropdown>
                        <button type="button" class="btn btn-default" uib-dropdown-toggle>
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <ul uib-dropdown-menu class="pull-right" ng-init="itemType = 'sprint'" template-url="item.menu.html"></ul>
                    </div>
                </div>
            </div>
        </h3>
        <visual-states ng-model="sprint" model-states="sprintStatesByName"/>
    </div>
    <ul class="nav nav-tabs nav-tabs-is nav-justified" ng-if="$state.current.data.displayTabs">
        <li role="presentation" ng-class="{'active':!$state.params.sprintTabId}">
            <a href="{{ tabUrl() }}">
                <i class="fa fa-lg fa-edit"></i> ${message(code: 'todo.is.ui.details')}
            </a>
        </li>
        <li role="presentation" ng-class="{'active':$state.params.sprintTabId == 'notes'}">
            <a href="{{ tabUrl('notes') }}">
                <i class="fa fa-lg fa-newspaper-o"></i> ${message(code: 'todo.is.ui.sprint.notes')}
            </a>
        </li>
        <entry:point id="sprint-details-tab-button"/>
    </ul>
    <div ui-view="details-tab">
        <g:include view="sprint/templates/_sprint.properties.gsp"/>
    </div>
</div>
</script>
