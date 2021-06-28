.PHONY: clean cleanall view presentation.pdf

CC = pdflatex
CURRENT_DIR = $(shell pwd)
BUILD_DIR = build
STYLE_DIR = styles
STYLE_SRCS = $(shell find $(STYLE_DIR) -name '*.sty')

presentation.pdf: presentation.tex $(STYLE_SRCS)
	$(CC) -output-directory=$(CURRENT_DIR)/$(BUILD_DIR) $<
	$(CC) -output-directory=$(CURRENT_DIR)/$(BUILD_DIR) $<
	ln -sf $(CURRENT_DIR)/$(BUILD_DIR)/presentation.pdf $(CURRENT_DIR)/presentation.pdf 

view: presentation.pdf
	firefox presentation.pdf

clean:
	-rm $(CURRENT_DIR)/presentation.pdf
	-rm -rf $(CURRENT_DIR)/$(BUILD_DIR)

$(shell mkdir -p $(BUILD_DIR))