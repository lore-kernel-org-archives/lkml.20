Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799155;
	b=u8+lLGka/CcPJO++uscr7DCz9Q4frw54NKwUDR3mSPE1Ovs+oHN1yHEXlAqxr/ALvcF9
	 iGZGUm1EIvbCcn5VjRJb5I+7Gb+wwZ9t1R+sAAM+80DSj36W0+wvWFPTrcg+PYnhO7y/Y
	 4CDSnXH+OZZrVoXXR/Sebt+1F18mFotGo2SN4Ct4E/Pse1c+/j7jlB37W3lJ+Zr0Ci2pc
	 LcOkPmowHB79fYW+sGae79VjNctjsUv1R9y2X77a92OSdRhPLbLHsRmsjMaxO2kAmFz1o
	 5Agw+KtXKL+bO1+7QR+TH/MOKQ3OCyP+wfawdo/FYwkufyJufTCczG6ixeWwOFiRR7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hsId2+DpgTtxye1Yv6HPoaQDim7S8FopzLEymWWnRm0=;
	b=mYhfzi4LfzYldb3puN5PWDkLNtzL0LFbGc04y3vb4w0D15y1j6b3ez04h9B6OCV/jy6q
	 pJJ0WykgYsL/Ieu/jJqAh2AiMnEi/546daz18XurLzi1YkP42OjplJbeO4wq4fZrZmS3N
	 KFnog9g52A+IWOiAZLXSo1vebn4uzxUzFhpyfMr6KuP0PjCr9o2OA2Zs7OLqFiUkU7Bo9
	 nWd2/95QwROdAyEvlu2k33ZKBclXlR495jFNZQGMWpi2cBcCinAsEyrLhCfTGrWLtS/+c
	 Y9rpgzm8Kg97liGeRjgzruYZzImfG7qIZ0CrVp2whMbMCk/3p36xAQ/oiJSiQVIOg3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwmzwBFO;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AEF606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38AEF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwmzwBFO
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso571195b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799149; x=1794403949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hsId2+DpgTtxye1Yv6HPoaQDim7S8FopzLEymWWnRm0=;
        b=IwmzwBFOYv3W0BkI3zvF+i4IG6xcqz20VGMeRB5FrYpv+GPB1cLaaXHz7tyTvV0YFG
         uVetQwv2dyTV3G78NoOcLMsKjzAwN+yMcCkiX7Tj8F67nwsuP5yTCM2zlXhsMO02Hg4M
         Il+RF7HAKVt5V69NjauHb2Ur0BIQD7C4sceOUBs+6xOuSArAmjwiR8t8ur2oXsA6TZQt
         RHl0HOOFTnqSVDdffkhqIrfliZ9BbzvZ27w2nag7/vjqv4vUyYY7FrtJpWl4XzJXyEnd
         kG3OQf1GKtjcoBUAV8oSFwenIaROH3FIqIZ9A3nculPtTnqR1mfBBaxgoi3Y85tFf8l2
         FyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799149; x=1794403949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hsId2+DpgTtxye1Yv6HPoaQDim7S8FopzLEymWWnRm0=;
        b=bdpsmRT4ux+MN9yL+0rj2o/lJaqWBkWSTj2QcaeucmbHEx6PWvdSkxFX022le4rijj
         5zRx7yFCgE61ICKM07k1xfEbdU/u1tpBvqb2KwLqzGEp+8nIkwrVRSP4eLYvctHUBdyB
         gHX0EblXX2fahmAXvCbsfe41gKGyewJ4UcUj7+MgVJPgYieguhDjpJz6otILlpaJt1fN
         GcRIXjTH725U8p98rhF84GRewUOTa25Al2tEJpScQNS94UUoiMRfWvNrXcpcfZsWKv7h
         srfcXSFgfByaM9wwnOrgIfGIurN99Y+Tezh5Yjsu/g1EYpSbakZKdXv29d5IqjbcI5Dh
         wKjg==
X-Forwarded-Encrypted: i=1; AKwUvBzNWTDdFXOFFH6GflMtguKyFJ9uIxEneD5Z1xse3dkrD2hKVlmgbeNXnAkFWrMg0n/l6d+H1LuptS1+ZRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HkigcfcSWkSK1l74IkDdy0ZvvMlbeep8FjY9aiGFjnCf+NBFm
	1r/TxMqkzcAnMbbpEs5rEFaSN0awRZeVJY6li0/iicRjo689qvQ7yKKP
X-Gm-Gg: AYBFou3h5/J0v3I15LTbIgZ97R102j4ZL/GOSVQrochVoOdW/cLx0oQwYJo35Ougwwq
	ExAf3rkMNDGV9sNUuUPRMXaODIqfN775kv5lEugEshFbK+dCsv/CZvkuOYnS/S50jo15VrB9MQW
	QTtWUMByLg1R9mPaynvyoedWfmuYJPF/1DXrYNumKbBEC9RUUQY/ZiX0eyj3F3/RKqoJd+2H2HR
	4a17HN90BwEdaxAD8gnvgEz85/bhRG67kqlHG004WV6TLX4E6uCkugmfg2EY2/j4I66xXo4S7+E
	xxJxw6WqXc1dki8kFCz8RyYrQS5DZs2JnYn7e8dZSFMEMDZcDTwWyfTv/CpdyPDV3VRVqHdvuFR
	5TB/o8RF3DKUsgn+mJS+kmv0vmRnhWb9ymZ6yxG3zWnPZi6UAy7cP8977CochQZ0MJ9oPMG7koU
	+hQKCpbYcLbpHbhQ3F6mtrUCWEfh8LRzxp+2HC5DyfyYw4sjFz1NeLHv/Ahvw5+srm6UEVXGYtC
	zXWAF18db47KxVeIhM5mwnkokWgFEWskaRdEs+Gjbq6/F4tudb0A1At6n57gi0y98ZXwI45Ssas
	AO6ajRkG/cdbbMl/OFkkd3LBuoZq39RPD+MSr64KV+pY2SWzfA==
X-Received: by 2002:a05:6a00:4694:b0:897:ffff:c18a with SMTP id d2e1a72fcca58-8b17e72e134mr369429b3a.7.1793799149518;
        Wed, 04 Nov 2026 05:32:29 -0800 (PST)
Received: from anatasluo-Precision-5560 ([139.226.166.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7ce84fsm911369b3a.13.2026.11.04.05.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:32:29 -0800 (PST)
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
Subject: [RFC PATCH v2 03/11] objtool/klp: Preserve identifier digits when stripping suffixes
Date: Wed,  4 Nov 2026 21:31:49 +0800
Message-ID: <20261104133158.3187525-4-luolongjuna@gmail.com>
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

The name tx.crc32 loses its trailing digits, while tx.crc32.llvm.<hash>
keeps them because of an early return. ThinLTO promotion can therefore
break correlation and copy existing static state into the patch.

Strip LLVM hashes and complete .<number> suffixes on the same path.
Keep the counter-stripping rule for __UNIQUE_ID names, including
Clang's function-prefixed names.

Add a ThinLTO test which checks that the existing crc32 state is reused.
The available objtool tests pass with GCC 16.2.1 and Clang 22.1.8.

Fixes: 0d83da43b1e1 ("objtool/klp: Add --checksum option to generate per-function checksums")
Fixes: 020b71dcafee ("objtool/klp: Remove .llvm suffix in demangle_name()")
Assisted-by: LLM
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 tools/objtool/elf.c                           | 33 +++++++++++--------
 .../fixtures/identity/promotion_crc32.c       |  8 +++++
 .../fixtures/identity/promotion_crc32_user.c  | 15 +++++++++
 .../generic/test-identity-thinlto-crc32.sh    | 23 +++++++++++++
 4 files changed, 66 insertions(+), 13 deletions(-)
 create mode 100644 tools/objtool/tests/generic/fixtures/identity/promotion_crc32.c
 create mode 100644 tools/objtool/tests/generic/fixtures/identity/promotion_crc32_user.c
 create mode 100755 tools/objtool/tests/generic/test-identity-thinlto-crc32.sh

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 71f1a272e468..3ddbf5143260 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -448,32 +448,39 @@ static int read_sections(struct elf *elf)
  */
 static ssize_t demangled_name_len(const char *name)
 {
-	ssize_t idx;
+	ssize_t idx, len;
 	const char *p;
 
 	p = strstr(name, ".llvm.");
-	if (p)
-		return p - name;
+	len = p ? p - name : strlen(name);
 
-	if (!strstarts(name, "__UNIQUE_ID_") && !strchr(name, '.'))
-		return strlen(name);
+	if (strstarts(name, "__UNIQUE_ID_") || strstr(name, ".__UNIQUE_ID_")) {
+		for (idx = len - 1; idx >= 0; idx--) {
+			char c = name[idx];
 
-	for (idx = strlen(name) - 1; idx >= 0; idx--) {
-		char c = name[idx];
+			if (!isdigit(c) && c != '.' && c != '_')
+				break;
+		}
+		return idx + 1;
+	}
+
+	while (len && isdigit(name[len - 1])) {
+		p = name + len - 1;
+		while (p > name && isdigit(*p))
+			p--;
 
-		if (!isdigit(c) && c != '.' && c != '_')
+		if (p == name || *p != '.')
 			break;
+		len = p - name;
 	}
-	if (idx <= 0)
-		return strlen(name);
-	return idx + 1;
+	return len;
 }
 
 /*
  * Remove number suffix of a symbol.
  *
- * Specifically, remove trailing numbers for "__UNIQUE_ID_" symbols and
- * symbols with '.'.
+ * Remove complete .<number> suffixes and trailing numbers from
+ * "__UNIQUE_ID_" symbols.
  *
  * With CONFIG_LTO_CLANG_THIN, it is possible to have nested __UNIQUE_ID_,
  * such as
diff --git a/tools/objtool/tests/generic/fixtures/identity/promotion_crc32.c b/tools/objtool/tests/generic/fixtures/identity/promotion_crc32.c
new file mode 100644
index 000000000000..d95914eacdc0
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/identity/promotion_crc32.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2026 Longjun Luo <luolongjuna@gmail.com> */
+unsigned int tx(unsigned int value)
+{
+	static volatile unsigned int crc32;
+
+	return crc32 += value;
+}
diff --git a/tools/objtool/tests/generic/fixtures/identity/promotion_crc32_user.c b/tools/objtool/tests/generic/fixtures/identity/promotion_crc32_user.c
new file mode 100644
index 000000000000..b44fa1d4a75e
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/identity/promotion_crc32_user.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2026 Longjun Luo <luolongjuna@gmail.com> */
+#include "common.h"
+MODINFO;
+
+unsigned int tx(unsigned int value);
+
+unsigned int target(unsigned int value)
+{
+#ifdef PATCHED
+	return tx(value);
+#else
+	return value;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-identity-thinlto-crc32.sh b/tools/objtool/tests/generic/test-identity-thinlto-crc32.sh
new file mode 100755
index 000000000000..66988d0b7692
--- /dev/null
+++ b/tools/objtool/tests/generic/test-identity-thinlto-crc32.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2026 Longjun Luo <luolongjuna@gmail.com>
+# ThinLTO promotion must retain the digits in a static variable's name.
+. "$(dirname "$0")/../identity-lib.sh"
+
+setup
+build_identity_pair thin "" identity/promotion_crc32.c identity/promotion_crc32_user.c
+in_symbols orig.o | awk '$4 == "OBJECT" && $5 == "LOCAL" && $8 == "tx.crc32"' |
+	grep -q . || probe_skip "CRC state was not local before importing"
+in_symbols patched.o | awk '$4 == "OBJECT" && $5 == "GLOBAL" && $8 ~ /^tx\.crc32\.llvm\.[0-9]+$/' |
+	grep -q . || probe_skip "ThinLTO did not promote the CRC state"
+
+assert_checksum_matches tx
+run_diff
+assert_patched target
+assert_not_patched tx
+out_symbols | awk '$4 == "OBJECT" && $7 != "UND" && $8 ~ /^tx\.crc32(\.|$)/' |
+	grep -q . && fail "promoted CRC state was allocated again"
+run_post_link
+assert_original_reference target tx.crc32
+
+pass "digits in static names survive ThinLTO promotion"
-- 
2.55.0

