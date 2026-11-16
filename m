Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845296;
	b=MVLX7LTHongsz4NloVakFnmGrBsV0d6Ky/LyvLRuttJE4J8PyNR041rjpIVsRENdXBFE
	 /fQj1jDhtbRDZ39t6PkWMYCAs+VHQaJWXkrMYjKqOm1icl0iT60dwSs58TxbyUtAaxCIB
	 8NoVOwpx3OfcS3CHfgrchsqiJQPhoDzPu7VN6tZX7t/Vvm1/kzKae+dLf7xtY1EvRO5UP
	 08wuhi54GSIx9MFNPpB69zCwCiHaH42UrUPo+itpcZE3Y6/f8sEmlxszwwJE0N2HnXZS/
	 e6GJobxyTWxKG1eWS7i+71HZ34IeZn3G63CFKuHFPCqCykS6mSUBEXk3buInnFrBMuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845296;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o1sd+cZdnsTZOQ8vNvT6fpJqvu79GF0QzWamKPj3abY=;
	b=HFRWSYcCKa5Zny6Lx6DKIQKdXLqEGYr3OxNbSjBUPd03ZmrKqdL5hGGlnq/cVUYCBpvk
	 PLEsWSOvX5uDilJy0cJYUSZTxwm4p3LmMz+Pjlmk2T9A+L5Qwh+0kcVv4jR+4sGw+0/hJ
	 J1nxV1AzYmQ7UCcNisxgkEqNgwwLjD/+bKlVBQcDGlgQoha2WxHRbB6YiHiyHLwTS9tfz
	 oEs7iCnQNXEK57Bo5RuMykEWsrYACF71YGH0mnmT4YB+xUUkIDY1b3TLHtYFp3IUp7ZTo
	 lNcyR1IDAc61Ngn/0aLzz+AlR6bMisQL8ExV4fN/l6GDWKKc7LR03TF0AS2dCh5j/zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XYJxpsmw;
	arc=none smtp.remote-ip=95.215.58.188
Received: from mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52B5606A889
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52B5606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XYJxpsmw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2j9nXMv6RQz/stbxPd0yepIWl7CrHNKNcGN/UCZ2bVk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794845293; v=1; x=1795450093;
 b=XYJxpsmw0tuk5pbIYXAzb/7g0ElRScWB6hKe4gfNgQK8W2m9EAF7bH6dWbDvQzQwAeozMcpj
 JyN6wXqRBYD7x9X3GSwTTZLUZ4h20hFAY20Z3s2ZOU010l+rObtTU0Sqo4au6kVYd1RY5BC1rt1
 zot22aMn63uQiUkEPNXLodQA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 8685ae6bf6cf3986;
	Mon, 16 Nov 2026 16:08:13 +0000
X-Mizu-Trace-ID: 8685ae6bf6cf3986
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Kees Cook <kees@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 5/5] scripts/coccinelle: add script to detect and convert sysctl bounds
Date: Tue, 17 Nov 2026 00:07:37 +0800
Message-Id: <20272a9cb4efeb99fb710a4da398e67b230c6910.1794844686.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1794844686.git.wen.yang@linux.dev>
References: <cover.1794844686.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

Add a Coccinelle script supporting:
- 'patch' mode: automatically convert struct ctl_table definitions using
   legacy extra1/extra2 pointers or constants to numeric .min and .max
   fields, omitting redundant .min = 0.
- 'context' modes: detect any residual usages or
   direct member dereferences of extra1/extra2 across the tree.

Suggested-by: Joel Granados <joel.granados@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 .../api/sysctl/sysctl_numeric_bounds.cocci    | 276 ++++++++++++++++++
 1 file changed, 276 insertions(+)
 create mode 100644 scripts/coccinelle/api/sysctl/sysctl_numeric_bounds.cocci

diff --git a/scripts/coccinelle/api/sysctl/sysctl_numeric_bounds.cocci b/scripts/coccinelle/api/sysctl/sysctl_numeric_bounds.cocci
new file mode 100644
index 000000000000..8f8f5e48e136
--- /dev/null
+++ b/scripts/coccinelle/api/sysctl/sysctl_numeric_bounds.cocci
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0-only
+///
+/// Convert sysctl tables that still use the legacy extra1/extra2 bound
+/// pointers to numeric .min/.max fields, and report anything that still
+/// needs a manual look.
+///
+/// Only well-known constant bounds (SYSCTL_ZERO, SYSCTL_ONE, ...) are
+/// rewritten automatically.  Bounds that point at a variable (&foo_min,
+/// &foo_max) cannot be rewritten safely: in several callers (power/main.c,
+/// i915_perf.c, ipc_sysctl.c, pid.c, sched/rt.c, rds/sysctl.c,
+/// xprtsock.c) that variable is updated at boot or at run time, so
+/// inlining its initial value would silently freeze a live bound.  Those
+/// entries are left untouched and reported for manual conversion,
+/// together with any .min/.max field that ends up holding a pointer or a
+/// legacy SYSCTL_ constant.
+///
+/// Use MODE=patch to convert and MODE=context to list what is left.
+///
+// Confidence: Medium
+// Options: --no-includes --include-headers
+//
+
+virtual context
+virtual patch
+
+// ----------------------------------------------------------------------------
+// 1. Patch rules: constant bounds in static table initializers
+// ----------------------------------------------------------------------------
+
+// min 0 is the zero-initialised default; drop the line instead of
+// emitting a redundant .min = 0.
+@p_min_zero depends on patch@
+identifier T;
+@@
+struct ctl_table T[] = {
+	...,
+	{
+		...,
+-		.extra1 = SYSCTL_ZERO,
+		...
+	},
+	...
+};
+
+@m_min depends on patch@
+identifier T;
+identifier M =~ "^SYSCTL_";
+@@
+struct ctl_table T[] = { ..., { ..., .extra1 = M, ... }, ... };
+
+@script:python tx_min depends on patch@
+m << m_min.M;
+v;
+@@
+MAP = {
+    "SYSCTL_ONE":            "1",
+    "SYSCTL_TWO":            "2",
+    "SYSCTL_THREE":          "3",
+    "SYSCTL_FOUR":           "4",
+    "SYSCTL_ONE_HUNDRED":    "100",
+    "SYSCTL_TWO_HUNDRED":    "200",
+    "SYSCTL_ONE_THOUSAND":   "1000",
+    "SYSCTL_THREE_THOUSAND": "3000",
+    "SYSCTL_INT_MAX":        "INT_MAX",
+    "SYSCTL_MAXOLDUID":      "65535",
+    "SYSCTL_NEG_ONE":        "-1",
+    "SYSCTL_LONG_ZERO":      "0",
+    "SYSCTL_LONG_ONE":       "1",
+    "SYSCTL_LONG_MAX":       "LONG_MAX",
+}
+if m in MAP:
+    coccinelle.v = cocci.make_ident(MAP[m])
+else:
+    cocci.include_match(False)
+
+@p_min depends on patch@
+identifier m_min.T, m_min.M;
+identifier tx_min.v;
+@@
+struct ctl_table T[] = {
+	...,
+	{
+		...,
+-		.extra1 = M,
++		.min = v,
+		...
+	},
+	...
+};
+
+@m_max depends on patch@
+identifier T;
+identifier M =~ "^SYSCTL_";
+@@
+struct ctl_table T[] = { ..., { ..., .extra2 = M, ... }, ... };
+
+@script:python tx_max depends on patch@
+m << m_max.M;
+v;
+@@
+MAP = {
+    "SYSCTL_ZERO":           "0",
+    "SYSCTL_ONE":            "1",
+    "SYSCTL_TWO":            "2",
+    "SYSCTL_THREE":          "3",
+    "SYSCTL_FOUR":           "4",
+    "SYSCTL_ONE_HUNDRED":    "100",
+    "SYSCTL_TWO_HUNDRED":    "200",
+    "SYSCTL_ONE_THOUSAND":   "1000",
+    "SYSCTL_THREE_THOUSAND": "3000",
+    "SYSCTL_INT_MAX":        "INT_MAX",
+    "SYSCTL_MAXOLDUID":      "65535",
+    "SYSCTL_NEG_ONE":        "-1",
+    "SYSCTL_LONG_ZERO":      "0",
+    "SYSCTL_LONG_ONE":       "1",
+    "SYSCTL_LONG_MAX":       "LONG_MAX",
+}
+if m in MAP:
+    coccinelle.v = cocci.make_ident(MAP[m])
+else:
+    cocci.include_match(False)
+
+@p_max depends on patch@
+identifier m_max.T, m_max.M;
+identifier tx_max.v;
+@@
+struct ctl_table T[] = {
+	...,
+	{
+		...,
+-		.extra2 = M,
++		.max = v,
+		...
+	},
+	...
+};
+
+@p_min_literal depends on patch@
+identifier T;
+constant C;
+@@
+struct ctl_table T[] = {
+	...,
+	{
+		...,
+-		.extra1 = C,
++		.min = C,
+		...
+	},
+	...
+};
+
+@p_max_literal depends on patch@
+identifier T;
+constant C;
+@@
+struct ctl_table T[] = {
+	...,
+	{
+		...,
+-		.extra2 = C,
++		.max = C,
+		...
+	},
+	...
+};
+
+// ----------------------------------------------------------------------------
+// 2. Detection rules: any remaining extra1 / extra2 use
+// ----------------------------------------------------------------------------
+
+@r_extra1 depends on context@
+identifier T;
+expression E;
+@@
+struct ctl_table T[] = {
+	...,
+	{
+		...,
+*		.extra1 = E,
+		...
+	},
+	...
+};
+
+@r_extra2 depends on context@
+identifier T;
+expression E;
+@@
+struct ctl_table T[] = {
+	...,
+	{
+		...,
+*		.extra2 = E,
+		...
+	},
+	...
+};
+
+@r_member_ptr depends on context@
+struct ctl_table *C;
+@@
+(
+*	C->extra1
+|
+*	C->extra2
+)
+
+@r_member_value depends on context@
+struct ctl_table T;
+@@
+(
+*	T.extra1
+|
+*	T.extra2
+)
+
+// ----------------------------------------------------------------------------
+// 3. Detection rules: bound fields holding a pointer or a legacy macro
+// ----------------------------------------------------------------------------
+
+@r_init_min_ptr depends on context@
+identifier T;
+expression E;
+@@
+struct ctl_table T[] = {
+	...,
+	{
+		...,
+*		.min = &E,
+		...
+	},
+	...
+};
+
+@r_init_max_ptr depends on context@
+identifier T;
+expression E;
+@@
+struct ctl_table T[] = {
+	...,
+	{
+		...,
+*		.max = &E,
+		...
+	},
+	...
+};
+
+@r_init_min_macro depends on context@
+identifier T;
+identifier M =~ "^SYSCTL_";
+@@
+struct ctl_table T[] = {
+	...,
+	{
+		...,
+*		.min = M,
+		...
+	},
+	...
+};
+
+@r_init_max_macro depends on context@
+identifier T;
+identifier M =~ "^SYSCTL_";
+@@
+struct ctl_table T[] = {
+	...,
+	{
+		...,
+*		.max = M,
+		...
+	},
+	...
+};
-- 
2.25.1

