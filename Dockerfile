# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui-videohelpersuite@1.7.9 --mode remote
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2512112053

# The following custom nodes are present in the workflow under unknown_registry but have no aux_id (GitHub repo) or registry id provided,
# so they could not be resolved automatically. If you know their GitHub repos or registry IDs, add git clone lines or comfy node install commands.
# Could not resolve unknown node: Label (rgthree)
# Could not resolve unknown node: MarkdownNote
# Could not resolve unknown node: Fast Groups Bypasser (rgthree)
# Could not resolve unknown node: Bookmark (rgthree)

# download models into comfyui
# (No models were listed in the workflow)

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
