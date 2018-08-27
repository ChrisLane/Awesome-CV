.PHONY: all

CC = latexmk -pdflatex=xelatex
BUILD_DIR = _build
CV_DIR = cv
CV_TEX_DIR = $(CV_DIR)/tex
CV_SRCS = $(shell find $(CV_TEX_DIR) -name '*.tex')
COVER_DIR = cover

all: $(foreach x, coverletter cv, $x.pdf)

cv.pdf: $(CV_DIR)/cv.tex $(CV_SRCS)
	@cp -r $(CV_TEX_DIR) $(BUILD_DIR)
	$(CC) -output-directory=$(BUILD_DIR) $<

coverletter.pdf: $(COVER_DIR)/coverletter.tex
	$(CC) -output-directory=$(BUILD_DIR) $<

clean:
	@rm -rf $(BUILD_DIR)
