---
title: Studio
tags: [notes]
---

### Studio Notes

- combine dirty files and uncommitted files into one tree?
-   warn if changing operation method and would collide with existing operation
-   changing method does wierd jumpy stuff w tags sidebar
-   monaco autocomplete for oas2 and oas3 (need this before telus delivery)
-   when screen is smaller than x width, do not show secondary panel
-   operation path autocomplete (showing other paths in the parent spec)
-   adding examples to a model does not show them in read view
-   add generate from schema button to examples
-   monaco diff editor for dirty files
-   need a "expand to active node" or something for tree list
-   deprecated for operation, params, etc
-   if delete root project folder, and refresh, error in console - should tell the user or otherwise handle more gracefully
-   resize app when monaco is open does not resize correctly
-   updating the api version should be a bigger deal, probably a modal. should result in filename change and property change, and explain what's going on. should start at 0.0.
-   discard button when on source map node might confuse people, since it discards ALL changes in the file, not just the changes to xyz operation or model
-   markdown viewer code block inside tabs styling
-   bug: create petstore 2.0 file and save it. then paste over raw content with petstore 3.0, and save. note error in console - what should we do?
-   spectral: openapi v3 should not warn if contact missing
-   bug: openapi security scheme, oauth2 type, flows should be an object not an array (can skip description for simplicity) <https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#implicit-oauth2-sample>
-   what to do about operation ids?
-   response headers should not include description or required (invalid openapi v2, is it valid v3?)
-   bug: consumes/produces. example - set request body of openapi 2 to form data and check spectral
-   bug: remove description and required buttons from JSE $ref row
-   bug: when change operation path that has params, make sure to add/remove/update the path parameters in spec
-   feat: referencing local images from markdown (wether from api description markdown, model description, markdown file, etc)
-   bug: monaco markdown should not autocomplete? it's annoying
-   http ui: don't show operation response headers if there are none
-   bug: why is `Pets` model not resolving?
-   feat: when changing tags, if target source node is not dirty before change tag, save after change tag to keep not dirty
-   bug: can't remove response schema
-   too much padding on left side of root JSV row (see pets tutorial model, read panel, for example)
-   bug: JSV get rid of and/or

EXPLORER

-   feat: display link to source of node, e.g. a link to the relevant file and line in the bitbucket/gitlab/github repo this came from

JAKUB

-   bug: add file with no name, click off - instead of error message, just "cancel" (same as if escaped)
-   bug: cmd+refresh app yields no linting issues. i'm trying this after loading up the new tutorial template (not sure if this is relevant, but mentioning in case). then, navigate to the petstore api service. then, refresh app. note no issues (at least for me, maybe it won't reproduce). then add and remove server (trigger a change basically), and note now has warnings
-   JSE ref provider suggest component: fix keyboard navigation (doesn't work for common library, I think because of itemListRenderer. blueprint has more props that prob need to be implemented to support controlled keyboard navigation? not sure)
-   should be able to generate a context menu when right click in white space in tree list. immediate use case is right click in white space area of filesystem tree should open context menu to add file/folder (added to level 0)
-   when add/remove tag from operation (operation tag provider)
    -   Adding - IF tag not in parent openapi 2/3 file, add it (check spec to see where it goes for openapi 2/3)
    -   Removing - IF tag in parent service, and only has a name (no description, etc), and no other operations in this service have this tag, we can safely remove the tag from the parent service
-   right now things like linting occur on every keystroke in monaco... kinda crazy. can we debounce this or something? maybe in the event handlers listening to monaco changes, we can acummulate them over 1s, kind of like the chunk patch handling we have in editor for graph patches, and send monaco edits in batches? NOTE if this introduces significant complexity or risk of buggyness, we can punt for now. but we DO need to find some way to not do things like linting, reparsing, etc, on every keystroke

NICK

-   bug: JSV in http-ui not growing (fixed height)
-   JSV has some console logs in it somewhere
-   bug: possible JSV react key warning? when scrolling? or just try using it a bunch to see if can reproduce

MARC

-   polish tutorial template

CHRIS

-   create new model inside of api ended up w wrong directory (perhaps test and verify new endpoint/model with all the possible variations?)
-   change model name to be \`{name}.v1.{json|yaml}
-   only use two digits in default api version semver (1.0 instead of 1.0.0)
-   operation responses, default should be last
-   host double slash? (at least on open api 2, see operation form)
-   when no security schemes, operation security is disabled - should we add a tooltip? or take you to service form? or something

VINCENZO

-   prism panel use name provider?

BEFORE RELEASE

-   hide git buttons
-   don't emit every change from monaco? too much to have linting flicker and go crazy etc

# Ideas

-   an extension of the idea from the add operation form - would be kind of cool if this was a popout checklist, so you could quickly see a) which other operations are defined for this path b) add new ones c) navigate to other operations on the same path. would “connect” them a bit more as well, which might make changing the whole change paths for all ops more palatable
-   a “go to relevant line in spec” button, and visa versa when it makes sense to go from code -> form would be amazing
