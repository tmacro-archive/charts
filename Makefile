
CHARTS := $(wildcard src/*)

$(CHARTS):
	helm package --destination charts/ $@

index: $(CHARTS)
	helm repo index .

.PHONY: index $(CHARTS)
default: index ;