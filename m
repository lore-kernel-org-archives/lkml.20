Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749154;
	b=RZl1EtbpQzr+EIRJP9PnDxlmYeGqDY8O9SZ5AkUAZ7vGeH2IoVu6aSoNdANBZLZpjSiJ
	 VZdac/twQsYqjSJ4Debs8sgrZCW8rJpLfR233RI9mriJodbeoSOB5pc1rfOYys/K8OfYI
	 JPwRvouEnEbi+ZeifxztXM09GsCpV3u71s42n7UfAd0782NSuwECkZmmVch8z1QFzDRqt
	 NvIHBp51zCzG83ZjV37ExdQ/ILhNfuLLCFM96Y+wdnbrKkNE+SOw24Di8ngyFIxrDS8k8
	 ld3bAJ57/Lvz+kQ2LJygKa5q0GovslfU9vysL+YiDCZW8pFYYbDN7vnz9wTzs2buruw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=YbWFhMkYlOVKSadJOHDDc5Xn/bx8C+ho8xxQr4Ng2Kw=;
	b=oP/wxioQ/p0LIFWFxrvXR8Wi0b9sN7/+b8YuCvU21lX7JDsi7OgbF6S7tVvSJST+9kPF
	 bNMdXGHyAl0Krgkvz5kFvIhaoZyqIuJdbVsE1YhOF1PzO6W2o83aEmcqKgydUOoURFlhJ
	 LgT3pB14z3wbx8pkSTSL8PQU93wbz0mU7Hfzda6reTGVLf+rkGn2pyir9qHz6FizcKwAF
	 +HaBtrWLN4DT8jdGHCq08Cgq30Gp7SiKNBRPeSsj6+4mvnfKUFjwX+G7nttdb63PPCABm
	 Ab30Yz4ehePOLUQUQNo0dJ3W4x1l0HLFi1S2kB1vxa0a+QmrRtw2Iwscn3wAZsv/afg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fsb5teVe;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A718606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A718606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fsb5teVe
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so221029b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793749153; x=1794353953; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbWFhMkYlOVKSadJOHDDc5Xn/bx8C+ho8xxQr4Ng2Kw=;
        b=fsb5teVe9x0BDx4iCcMxA+63LChtRHF7TcSB1Sf+4unuqJkqjDOOSsaD4AEieOWEZL
         m9VU6FPBFXvL8j3DocHlBhLVFQDQAZVp//EWLnZQcs4LRaAl8TbMtZkLuFIC0MrjB7hC
         Y/sUqqPd76DTbCxWuqulBLxwvv5C+BJL+kahaFwalwNl+0jrBKEcvo+tHnBI49fvsD+z
         igW3Zk+ucbId3qDAFjCQP4GJAB0p08UW2ibKisSRtA1FPXw6H21QKUyHDAQQzJT8FNFx
         K44emYuaqf7AyLigm5qtZjQhoISF99lERSXEFjzTw1oeG4CKtqUYkxpfXyCTvBUcFNoR
         zuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749153; x=1794353953;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbWFhMkYlOVKSadJOHDDc5Xn/bx8C+ho8xxQr4Ng2Kw=;
        b=N3z/rmy2/94T+oS650pyhRE5tX/YKMDQlcv3KQPIpqbi5qdBn0Axo/4nRBR7YQu6D2
         XlQJcJ6R6/UcShB9xpRhrjZhlmHGHj9bEhU3xWezjhQEqyf3NY0iwxDgiiWjQYQjchFm
         tEmEDwLabZ1ujETvXzmG9r7lhh8PuAcC5kQO6VtUfCJpfyjNdQGiK5Y17uHmS37WT+js
         RNPvytsnKeIDXca8nC9tC2g2w5EpSJv/61YN2WOT7MTmTfR+8ihsdcGPqjeXpOUW+Srt
         1C4IWLPRZiKzDAnWWuMmle8B0CX+4ZQcSHE0pDphu/weWerKogSq6yhlPXLPhJfVS1Je
         42Vg==
X-Forwarded-Encrypted: i=1; AKwUvBw//+BY+kj1DZ81lClozLcH7M2jNWa6dFBwIO4pGymDWeuG8Te963/HipuPv2BwsZWN1Hf88qfpifO0IXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z957qua2MW1faET1IGhsHyydzzg/Pg5RBpfTtWXmoYcJ6GzO9a/
	pLUhbMj5puWJLJWJw71xklGr3WL9TH6AjN4yfwTmDHncWMrSNUqCEY9FuGBzBrsZjrAbVWMk22a
	frOfZM3GQSfAo4gT4/biHV9NOmw==
X-Received: from pfbhx5.prod.google.com ([2002:a05:6a00:8985:b0:89f:4790:689a])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:e11:b0:882:359f:ef17 with SMTP id d2e1a72fcca58-8a9bb7a0b64mr12641184b3a.12.1793749152517;
 Tue, 03 Nov 2026 15:39:12 -0800 (PST)
Date: Tue,  3 Nov 2026 23:39:09 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103233909.1364531-1-dylanbhatch@google.com>
Subject: [PATCH] klp-build: Allow passing options to make via '--'
From: Dylan Hatch <dylanbhatch@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

Livepatch builds rely on reproducing the original kernel build
environment. Currently, klp-build invokes bare 'make', which drops any
command-line variables or flags used during the original build (such as
'LLVM=1', 'CC=...', 'KBUILD_BUILD_TIMESTAMP=...', or custom wrapper
Makefiles via '-f').

Refactor the make invocations to use a common MAKE array and allow
passing arbitrary make options after '--' on the klp-build command line:

  klp-build [OPTIONS] PATCH_FILE(s) [-- MAKE_OPTIONS]

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 scripts/livepatch/klp-build | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index b52a8489d9f67..1fd405d43ef43 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -125,7 +125,7 @@ trap trap_err ERR
 
 __usage() {
 	cat <<EOF
-Usage: $SCRIPT [OPTIONS] PATCH_FILE(s)
+Usage: $SCRIPT [OPTIONS] PATCH_FILE(s) [-- MAKE_OPTIONS]
 Generate a livepatch module.
 
 Options:
@@ -158,11 +158,23 @@ process_args() {
 	local long
 	local args
 	local patch
+	local klp_args=()
+	local make_args=()
+
+	while [[ $# -gt 0 ]]; do
+		if [[ "$1" == "--" ]]; then
+			shift
+			make_args=("$@")
+			break
+		fi
+		klp_args+=("$1")
+		shift
+	done
 
 	short="hfj:o:vdS:T"
 	long="help,show-first-changed,jobs:,output:,no-replace,verbose,debug,short-circuit:,keep-tmp"
 
-	args=$(getopt --options "$short" --longoptions "$long" -- "$@") || {
+	args=$(getopt --options "$short" --longoptions "$long" -- "${klp_args[@]}") || {
 		echo; usage; exit
 	}
 	eval set -- "$args"
@@ -237,6 +249,7 @@ process_args() {
 
 	KEEP_TMP="$keep_tmp"
 	PATCHES=("$@")
+	MAKE=("make" "${make_args[@]}")
 
 	for patch in "${PATCHES[@]}"; do
 		[[ -f "$patch" ]] || die "$patch doesn't exist"
@@ -317,12 +330,12 @@ set_kernelversion() {
 
 	stash_file "$file"
 
-	if [[ -n "$(make -s listnewconfig 2>/dev/null)" ]]; then
+	if [[ -n "$("${MAKE[@]}" -s listnewconfig 2>/dev/null)" ]]; then
 		die ".config mismatch, check your .config or run 'make olddefconfig'"
 	fi
-	make syncconfig &>/dev/null || die "make syncconfig failed"
+	"${MAKE[@]}" syncconfig &>/dev/null || die "make syncconfig failed"
 
-	kernelrelease="$(make -s kernelrelease)"
+	kernelrelease="$("${MAKE[@]}" -s kernelrelease)"
 	[[ -z "$kernelrelease" ]] && die "failed to get kernel version"
 
 	sed -i "2i echo $kernelrelease; exit 0" scripts/setlocalversion
@@ -526,7 +539,7 @@ fix_patches() {
 clean_kernel() {
 	local cmd=()
 
-	cmd=("make")
+	cmd=("${MAKE[@]}")
 	cmd+=("--silent")
 	cmd+=("-j$JOBS")
 	cmd+=("clean")
@@ -539,7 +552,7 @@ build_kernel() {
 	local log="$TMP_DIR/build.log"
 	local cmd=()
 
-	cmd=("make")
+	cmd=("${MAKE[@]}")
 
 	# When a patch to a kernel module references a newly created unexported
 	# symbol which lives in vmlinux or another kernel module, the patched
@@ -859,7 +872,7 @@ build_patch_module() {
 	cflags+=("-fdata-sections")
 	[[ $REPLACE -eq 0 ]] && cflags+=("-DKLP_NO_REPLACE")
 
-	cmd=("make")
+	cmd=("${MAKE[@]}")
 	if [[ -v VERBOSE ]]; then
 		cmd+=("V=1")
 	else
-- 
2.56.0.385.gac671c819a-goog

