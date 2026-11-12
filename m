Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794521041;
	b=cs76yR90aFXDqxio8KCEkWy1A7jevaoUYXVzJqC4fYQL3km05c3epUOaElCz7Cd0uqqE
	 sLw6fPcJoahVDGvnxsRJiCN2NxMHz7JKeUZWIea6uD5DEbj1dHLSORfG/PtIe3DcxKJOI
	 Tktz3R6ApJtXJAceIDLrWrZXNycvC0A/iPIxV42CTCQjcQn5WwMVhe23ntCDAtjwSCM5t
	 Gr1mbiBtqTSh+l8XB3YP+ZgJpsmQUkjO96/uhEdcHOMzL+y1/nV/xluRervtW1Z4//1m0
	 PY9P0iFi9UxcINQ95NtEEOGqSmpUsFh4h+kXKntLEjQb16D768QwMQRoV+r3Lis/4bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794521041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=OApFv+JTRWklrvgE3dh5H3kzXm8cpf7tKiKBdjrK9qk=;
	b=I2zNCFIw7uB8vsoooqND1/TxOBWvOxDmFThBUeuEmBLZQ/4netYHnsByodzWRwg/6urU
	 FMzOkOd831i39hvo4EZ/XLSXj5M8uw0ZLWVjYlz6cgOA7yTkfpiVJQUOJD7n1xko6K1cJ
	 kjyagT20prah0Vjln9DAdcR2PY1nnrvPrKW75AZAYFXxHX+6FFXHyYzqmLH9y2jp2uULK
	 GTues4oBEa83hpEHHws9OYo0bfi3Hk228f/oTpHNiDTPtzzGhUEz8THx9MVO7wjOVr5fH
	 APPjLKmC+ANNPW3fIlDh3H/wv72IbO/GRwV/l2YXedkPsJ2pcDMIsE75D0yzv998Zag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="i5z/FryY";
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE72606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FE72606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i5z/FryY
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf3f829b3so2451545ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794521040; x=1795125840; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OApFv+JTRWklrvgE3dh5H3kzXm8cpf7tKiKBdjrK9qk=;
        b=i5z/FryYinfyYzqyqeviHVNYmTVAzDoNJWWkomkHDyjfAGMv0DsG8PVtoasKXoqTAf
         T2F6o+QLAX69FFvTyZedumQumkbj1G8r+RsOgSkjpIh3jGkr1c2u/VmIlLpCz8320gtN
         ICPL04Pe2Wj7oyal7kHKdQ9rGXy+n9MIyOyvT7+LozBk+Fz1TuNl9NOS8CQeOds/fiaB
         SMQpWik2s4zngd/kayY264Vqr1vKC8APfPF1/WX7YayRuUELMNGZk3uNnhQ8hcVwgBgQ
         lIQNIjeo9m3cMz3MxeUX9LpHwLBMqiFBrj4lVxG0SVhOUWdvNsJ6kKvXich61HPbCP0H
         FNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794521040; x=1795125840;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OApFv+JTRWklrvgE3dh5H3kzXm8cpf7tKiKBdjrK9qk=;
        b=rAPhcgk8nUH9X4hYwKybOOSyxFXw2SphFEQa4WHZc8bsNO8nAOTS39KFhCSNUs2BON
         BvS37C9UY2sJzzLnGgKoo6CIjg1W8MZ79nqdBELht0j2lMCEjqG0UU0Yi92ALOlzUkRu
         aJJm2USpLOCQktSHcZePazwmcl6dlaEvRf+dM+YFABN6fINyK2jafVaW9EeWaXO1V25s
         JEqvDtfhHmsr1fhhHUQHlhXvOHBMbeCxODBqObPjUVb/7AsDIGb/tiGUiskuoenY7GzM
         VXqSyv64vLU0eas9C0xg7/Q5ryolt/cuZtu64SRkH+vJnafPC2KociYhkOT1BB4MiRPf
         vSJQ==
X-Forwarded-Encrypted: i=1; AL+hErHoumyrFSnsESmjlX4xJ0z2+uS9QyxZsUVEuiPdlplS2AyxmJGoHxI3eec+oL9/+ZrCyfpU49nU780rO2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kGFA5xYZ6lc5XVghSMqAXX4MvUnMUPXoJ8/K47WtQvoW6s43o
	0x4gXKt9Ft0TgwQ4Qwn9noX9KDuxe9a+/S9+ksTc4d6bSifISvfQdL8Bf72lZrbUqsKRPtgePs2
	Ue+KkIA6w+GY/+26PEkih9j6YfA==
X-Received: from plfh6.prod.google.com ([2002:a17:902:f546:b0:2ed:ab54:eb4f])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e84a:b0:2e9:7dda:bfc7 with SMTP id d9443c01a7336-2ee0dcd0647mr5450575ad.66.1794521039977;
 Thu, 12 Nov 2026 14:03:59 -0800 (PST)
Date: Thu, 12 Nov 2026 22:03:55 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261112220355.1952137-1-dylanbhatch@google.com>
Subject: [PATCH v2] klp-build: Allow passing options to make via '--'
From: Dylan Hatch <dylanbhatch@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

Livepatch builds rely on reproducing the original kernel build
environment, including any make flags or command-line variables used
during the original build (such as 'CC=...', 'KBUILD_BUILD_TIMESTAMP=...',
or custom wrapper Makefiles via '-f').

While these options can already be passed through the MAKEFLAGS
environment variable, passing them directly on the command line is more
ergonomic.

Refactor the make invocations to use a common MAKE array and allow
passing arbitrary make options after '--' on the klp-build command line:

  klp-build [OPTIONS] PATCH_FILE(s) [-- MAKE_OPTIONS]

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
v1: https://lore.kernel.org/r/20261103233909.1364531-1-dylanbhatch@google.com

Changes in v2:
- Clarify in the commit message that this is an ergonomic alternative to
  MAKEFLAGS rather than new functionality (Josh Poimboeuf)

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
2.56.0.611.g1030f0b940-goog

