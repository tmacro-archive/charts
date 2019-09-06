ifndef VERBOSE
V=@
endif

ifndef SIGNED
SIGN='-S'
endif

HELM			:= $(V)helm
PACKAGE_CHART	:= $(HELM) package --destination charts/
ECHO			:= $(V)echo
BUMPVERSION		:= @bin/bumpversion

CHARTS 			:= $(wildcard src/*)
CHART_REPO_URL	:= https://tmacro.github.io/charts/
REPO_VERSION	:= $(shell cat VERSION)

EXTERNAL_CHARTS = longhorn

.DEFAULT_GOAL := index

no-working-changes:
	@git diff-index --quiet HEAD -- || exit 1

_release: clean index
	@git add index.yaml charts/*.tgz VERSION
	@git commit $(SIGN) -m 'Update charts repo $(REPO_VERSION) => $(shell cat VERSION)'
.PHONY: _release

_major:
	$(BUMPVERSION) major
major: no-working-changes _major _release
.PHONY: _major major

_minor:
	$(BUMPVERSION) minor
minor: no-working-changes _minor _release
.PHONY: _minor minor

_patch:
	$(BUMPVERSION) patch
patch: no-working-changes _patch _release
release: patch
.PHONY: _patch patch release

build: $(CHARTS) external

index:
	$(HELM) repo index --url $(CHART_REPO_URL) .
.PHONY: index

$(CHARTS):
	helm package -u --destination charts/ $@
.PHONY: $(CHARTS)

external: external-dir $(EXTERNAL_CHARTS)
.PHONY: external

external-dir: 
	$(V)mkdir -p external/repo
	$(V)mkdir -p external/charts
.PHONY: external-dir

longhorn:
	$(V)git clone https://github.com/longhorn/longhorn.git external/repo/longhorn
	$(V)cp -R external/repo/longhorn/chart external/charts/longhorn
	$(PACKAGE_CHART) external/charts/longhorn
.PHONY: longhorn

clean: clean-external
	$(V)rm -f charts/*.tgz
.PHONY: clean

clean-external:
	$(V)rm -rf external
.PHONY: clean-external

test:
	echo $(REPO_VERSION)