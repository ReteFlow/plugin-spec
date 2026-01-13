SOLANA_PB_FILE := proto/reteflow/common/solana/v1/solana.pb
SOLANA_PROTO_FILE := proto/reteflow/common/solana/v1/solana.proto
BUF_CMD := $(shell which buf)

.PHONY: proto
proto:
	@echo "Updating dependencies..."
	@$(BUF_CMD) dep update
	@echo "Generating specific Protobuf descriptor for Solana"
	@$(BUF_CMD) build -o $(SOLANA_PB_FILE) --as-file-descriptor-set --path $(SOLANA_PROTO_FILE)
	@echo "Generating code stubs"
	@$(BUF_CMD) generate

.PHONY: lint-proto
lint-proto:
	@echo "Linting Protobuf files"
	@$(BUF_CMD) lint

.PHONY: clean-proto
clean-proto:
	@echo "Cleaning generated Protobuf files"
	@rm -f $(SOLANA_PB_FILE)