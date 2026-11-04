Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799164;
	b=vKrLNw4rQm2CiMxWMz7/NEXdgJmpBu/idIP1fsOSR27sNwrSkVmTFkW8TDDzvS4RGhdv
	 1bfE6KnSLo4yEZ92wcw+4Cxkf6Rm87OmToqxCw9v4x+PceXGBF8VPhvCwBYKwdaqgAIfe
	 wqM+3e+i+gVInyLqK+TgpfZo008B7Wya2eWUu0ig9oqMbQG40oaF4jGDTCJWIrQ98CrqN
	 iUYJPTamsC9+B8XxCfa7vGhGSzU6IblH61QvDkx+iGh4OCM9dMhwuueCQg1vCUQqC4iR4
	 uNKOGGIQvvYiv0a/zQyKLJnpG92S+XCilsLUOSurpcO9dxBcotB4u6BEomkhDJLBuPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0MivBmeREXA6Z3fHdh+SbjQxmO7h+43RlnHAUjYhb8M=;
	b=Hy32zyLVggyksymr9i5yn8h9UJZZs6ShEr6RgQDxsNA4NFM9vquVuIk2A6hFYDCuyA7A
	 qMhnSPKqCkefulvjNGG3cYO2DN1MH7helTUp4/z/5PjnolKiPb4DFMb/uCJE0XWhPaSgK
	 556wedsmMJPMzBcKd1AttdhEunk70O1+OLOSc7f6p61q7EXLrQyGaG5NhSTMvXhx1MTZL
	 PRJEpMiLWXPG9O40d3q4s1DQYStEPeUKn8RBJFRabLnZCs7XD2jqS8VgmOpjEJ0jiybd/
	 hQr3c313E1YWQngQ1qmk0AywRty7/o2NW9gD3DBLXE9YeyaXGc2MMo0txAjhjEa26iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CEC759hT;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7B9606A337
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C7B9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CEC759hT
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a05b210703so407759b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799163; x=1794403963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0MivBmeREXA6Z3fHdh+SbjQxmO7h+43RlnHAUjYhb8M=;
        b=CEC759hTxHP0bJYvUrs3JmYInLIte6vrHbHYN4FpK9yMofUmXAeM8RvK3M3T1UTEDj
         rpRHGBr33PXDxKxEnG5hxFfgh5sPFTd87a5JlHZGJKvZaKAQF33+AbrumepSHv8hxRVU
         yjFvyiaU4xG1C4AQZo7bF7SWdU+dOCCYdaOCIPvop8VWCJtWek/u/W8XpHZLl4mg8pF3
         m2MK8YfsfJWTxFjJMGLj6FMLPYf/HnFfSsABUzYki/TTnfir6gYtloIQMw89dz1hJ509
         1oxFZmgz2GoAVWTCy0JB7goz8/vsuB46li6b7Gg6nOWD9aZGLKxYBdat5+wv6ey1tG3d
         Ha1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799163; x=1794403963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0MivBmeREXA6Z3fHdh+SbjQxmO7h+43RlnHAUjYhb8M=;
        b=vyYu6ksDUuaTGisc0O9ImdvoQzfmUAvP4qDESYZK0UZnxQxNDYtJD14pIhbpQ24MiD
         GyDehBRvRrDbLEjjCQOG08BhCNK9weqlywZjm14xG7NGoAUt7md4VTypLJ3aheQ3ZZDp
         6X/7ZQwNkt5hFyAe8XQn4L8h/FVv3Tum8YQE4kwLc8l1vGO/HREnhsofWsoR1CpV7Dn8
         CZXZ4Hh4m7hUknDWJGwuGjaOWVFtMd7hcFUlPBMQsl0BpCoBIBgHiuCiH9JYgfI7u91f
         pdXKvu+r/MrlPC3igVzoPFJdwFnqMwlU5PKR5tCS/Rag8YAnjws7PT/Onu1vXb7OTTN4
         1C5g==
X-Forwarded-Encrypted: i=1; AKwUvBzvoYiB7HTn+qRIstWkIUZExFc+C2V7YuKdUmeyebqd8bDUMjdtoM1Gs2bxDLYpfFw7raEY1O3Hq9d+Wts=@vger.kernel.org
X-Gm-Message-State: APuU4Z+srtvaq+tXomYVJC5RW58CI2YeProKkPVvokbXUO1w0nqKeViJ
	k4BCeSnCpuPLzWHz5AtVMo0/FoZjZAyFcwO+VIORdhgY3qy7BR80hcA4
X-Gm-Gg: AYBFou1el4+R+qO4zENGYscW2ettYo+EF2IJliMaf226V+l6qwX5dy3jStTX0C3CFyk
	DBAnVrxxPcATljuK6ojeoeSbFLLmb5Uvhd/SL6ol/5uxUGFleytkqUZFR96543MBnmvkuajGjsb
	2UX4AuARmN+rY2xXfak9BpQe/zz74DsYTYrJJV6IW33m2s4QVwJ9sQ33iyH1s/8AttcngE4qXmT
	eQdgbU0+Gq09faFbL1vUTb2QWQJwIKVE3CVc27351zxHsEeExQJ0OO3WQkrz/IMOpLzdSSOlGhA
	0AVIoFvo1X7jJ64+R0TvmpcP9+eTBsI5hC1IxTFNVplMa0HJ9DqM0LuoSs4z8eUwyl9IQ1ApUxf
	geoHKd+blTsTnW7PWvCZWZJQdbdS3hYitJD848Ku3vd3BoUi2OQsHYwqHrNyUPaADS3rE5AHe9I
	w9c0I9P2TyIfRckGU62uWkyw7T2puT+KWRouJ8ojhVJoXPKgl1sc3YwmM1QmhH+K/pRvezXrSpU
	G5YJx3PsiNl3sDxl/xjW8Qu4cN0v4zgObh+V04r/rz82pw0Giy9cUu2OxwG5mGIWQ8kPATBnDMD
	aHU/icg9PRriycC20RucF1BriShIr1/pT0Y6VNelVmmEiA3vhw==
X-Received: by 2002:a05:6a00:99a:b0:89f:7ac5:9d54 with SMTP id d2e1a72fcca58-8a9bdcc5a0cmr14718274b3a.17.1793799162871;
        Wed, 04 Nov 2026 05:32:42 -0800 (PST)
Received: from anatasluo-Precision-5560 ([139.226.166.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7ce84fsm911369b3a.13.2026.11.04.05.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:32:42 -0800 (PST)
From: Longjun Luo <luolongjuna@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org,
	puranjay@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longjun Luo <luolongjuna@gmail.com>
Subject: [RFC PATCH v2 05/11] objtool/klp: Support reduced and split DWARF
Date: Wed,  4 Nov 2026 21:31:51 +0800
Message-ID: <20261104133158.3187525-6-luolongjuna@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104133158.3187525-1-luolongjuna@gmail.com>
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read split CUs through libdw and save matching DWO files in a DWP before
another build overwrites them. Keep the DWP beside each saved object.
Reading saved DWP files requires libdw 0.191 or newer.

Read fixed-width array bounds as unsigned so reduced type information
does not make nonempty arrays appear empty.

Full LTO with --plugin-opt=dwo_dir requires
-mllvm -split-dwarf-cross-cu-references=true to preserve separate CUs
and their source paths. Kbuild does not enable this DWO output mode.

Validated the available objtool tests with GCC 16.2.1 and Clang
22.1.8. No failures.

Assisted-by: LLM
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 scripts/livepatch/klp-build | 18 +++++++++++++++
 tools/objtool/klp-dwarf.c   | 45 ++++++++++++++++++++++++++++---------
 2 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
index e373928123e8..95bea5b2057e 100755
--- a/scripts/livepatch/klp-build
+++ b/scripts/livepatch/klp-build
@@ -34,6 +34,7 @@ SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
 FIX_PATCH_LINES="$SCRIPT_DIR/fix-patch-lines"
 
 OBJTOOL="$PWD/tools/objtool/objtool"
+DWP="${DWP:-llvm-dwp}"
 CONFIG="$PWD/.config"
 TMP_DIR="$PWD/klp-tmp"
 
@@ -265,6 +266,11 @@ validate_config() {
 	[[ -v CONFIG_KLP_BUILD ]] ||			\
 		die "CONFIG_KLP_BUILD not enabled"
 
+	if [[ -v CONFIG_DEBUG_INFO_SPLIT ]]; then
+		command -v "$DWP" &>/dev/null ||
+			die "split DWARF requires llvm-dwp (or set DWP)"
+	fi
+
 	[[ -v CONFIG_GCC_PLUGIN_LATENT_ENTROPY ]] &&	\
 		die "kernel option 'CONFIG_GCC_PLUGIN_LATENT_ENTROPY' not supported"
 
@@ -588,6 +594,15 @@ find_objects() {
 		    -printf '%P\n'
 }
 
+# Save the matching DWOs before the next build overwrites them.
+save_split_dwarf() {
+	local file="$1"
+	local dest="$2"
+
+	[[ -v CONFIG_DEBUG_INFO_SPLIT ]] || return 0
+	"$DWP" -e "$file" -o "$dest.dwp" || die "cannot save split DWARF for $file"
+}
+
 # Copy all .o archives to $ORIG_DIR
 copy_orig_objects() {
 	local files=()
@@ -608,6 +623,7 @@ copy_orig_objects() {
 
 		mkdir -p "$orig_dir"
 		cp -f "$file" "$orig_dir"
+		save_split_dwarf "$file" "$orig_file"
 	done
 	xtrace_restore
 
@@ -647,6 +663,7 @@ copy_patched_objects() {
 
 		mkdir -p "$patched_dir"
 		cp -f "$file" "$patched_dir"
+		save_split_dwarf "$file" "$patched_file"
 		found=1
 	done
 	xtrace_restore
@@ -680,6 +697,7 @@ generate_checksums() {
 
 		mkdir -p "$(dirname "$dest")"
 		cp -f "$file" "$dest"
+		[[ -f "$file.dwp" ]] && cp -f "$file.dwp" "$dest.dwp"
 		"$OBJTOOL" klp checksum "$dest"
 	done
 
diff --git a/tools/objtool/klp-dwarf.c b/tools/objtool/klp-dwarf.c
index 99b098ee7904..98d00ea19b7c 100644
--- a/tools/objtool/klp-dwarf.c
+++ b/tools/objtool/klp-dwarf.c
@@ -138,6 +138,10 @@ static void normalize_source(char *path)
 	*write = '\0';
 }
 
+/*
+ * Full LTO with --plugin-opt=dwo_dir can merge CUs and lose TU source
+ * paths. Kbuild does not enable this output mode.
+ */
 static int read_unit_source(struct identity_cu *cu, Dwarf_Die *die)
 {
 	Dwarf_Attribute attr;
@@ -146,12 +150,12 @@ static int read_unit_source(struct identity_cu *cu, Dwarf_Die *die)
 
 	if (dwarf_tag(die) != DW_TAG_compile_unit)
 		return 0;
-	if (dwarf_attr(die, DW_AT_name, &attr)) {
+	if (dwarf_attr_integrate(die, DW_AT_name, &attr)) {
 		name = dwarf_formstring(&attr);
 		if (!name)
 			return die_error(die, "invalid compilation unit name");
 	}
-	if (dwarf_attr(die, DW_AT_comp_dir, &attr)) {
+	if (dwarf_attr_integrate(die, DW_AT_comp_dir, &attr)) {
 		dir = dwarf_formstring(&attr);
 		if (!dir)
 			return die_error(die, "invalid compilation directory");
@@ -472,6 +476,23 @@ static int add_address(struct identity_reader *reader, struct identity_die *entr
 	return 0;
 }
 
+/*
+ * Reduced DWARF can omit the element size of idt_table. Reading its
+ * DW_FORM_data1 upper bound (255) as -1 would misidentify it as empty.
+ */
+static int read_array_bound(Dwarf_Attribute *attr, Dwarf_Sword *bound)
+{
+	Dwarf_Word value;
+
+	if (dwarf_whatform(attr) == DW_FORM_sdata ||
+	    dwarf_whatform(attr) == DW_FORM_implicit_const)
+		return dwarf_formsdata(attr, bound);
+	if (dwarf_formudata(attr, &value) || value > INT64_MAX)
+		return -1;
+	*bound = value;
+	return 0;
+}
+
 /*
  * The empty features[] in virtio_input.c can share an address with the
  * nonempty features[] in trans_virtio.c. Exclude the empty object's DIE
@@ -498,10 +519,10 @@ static bool is_empty_type(Dwarf_Die *type)
 			return true;
 		lower = 0;
 		if (dwarf_attr(&range, DW_AT_lower_bound, &attr) &&
-		    dwarf_formsdata(&attr, &lower))
+		    read_array_bound(&attr, &lower))
 			continue;
 		if (dwarf_attr(&range, DW_AT_upper_bound, &attr) &&
-		    !dwarf_formsdata(&attr, &upper) && upper < lower)
+		    !read_array_bound(&attr, &upper) && upper < lower)
 			return true;
 	} while (!dwarf_siblingof(&range, &range));
 	return false;
@@ -752,7 +773,7 @@ static int build_identities(struct identity_reader *reader)
 	static const Dwfl_Callbacks callbacks = { .section_address = dwfl_offline_section_address };
 	Dwfl *dwfl = dwfl_begin(&callbacks);
 	Dwarf_CU *cu = NULL, *next;
-	Dwarf_Die die;
+	Dwarf_Die die, split;
 	Dwarf *dwarf;
 	struct identity_die *entry;
 	unsigned int bucket;
@@ -767,11 +788,15 @@ static int build_identities(struct identity_reader *reader)
 	dwarf = dwfl_module_getdwarf(reader->module, &reader->bias);
 	if (!dwarf || check_relocations(dwarf))
 		goto out;
-	while (!(ret = dwarf_get_units(dwarf, cu, &next, NULL, &unit_type, &die, NULL))) {
-		if (unit_type == DW_UT_skeleton ||
-		    unit_type == DW_UT_split_compile || unit_type == DW_UT_split_type) {
-			ret = die_error(&die, "split DWARF is not supported yet");
-			goto out;
+	while (!(ret = dwarf_get_units(dwarf, cu, &next, NULL, &unit_type, &die, &split))) {
+		if (unit_type == DW_UT_skeleton) {
+			/* libdw checks the DWO ID and resolves addresses through the skeleton. */
+			if (!split.addr) {
+				ret = die_error(&die,
+						"missing or mismatched split DWARF file (saved .dwp files require libdw >= 0.191)");
+				goto out;
+			}
+			die = split;
 		}
 		if (!is_unit(dwarf_tag(&die))) {
 			ret = die_error(&die, "invalid unit root");
-- 
2.55.0

