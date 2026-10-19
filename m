Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437841;
	b=R8SouM1cgsE71URJWBkh4l9P+LgdFtmcdQCCLApf0wvz6Y4rf1HJDDgzJZ+VTKk0EtvU
	 2O9XMqZfUetYus65GN9yj9SHWRsBzf1TvYeNz79pl3h1CabaXF6ModTn+Z7lHGGMmEu8e
	 pQChBpSGL3AOH2q47xHVq64/CH82HG93hxxVlymamZNQZzgH5rfrYLYEydrN7gDdkUz48
	 fcNv1Uxudq0+Qv1C8n0W8aHHegrQ1v2TUKm3mDXRg7y9gt3h9PusQ0zGNbo45pbEgyXpf
	 rv0/kkBB7RXVw9gYfaCQ169zhbmnIs4O3fQ2N4AyQse63F7fi5Voinuz8erhvKTAenQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437841;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=Rwz668qzdvDu9iC7CEm59Q4wFm4SHz1nNpnAgvxWBzQ=;
	b=L/lxZe8tcO+HiOSX45PquwB2A4zAC79a1vkvlBfgkj9nFhFYKUBPtJBFACa567bhj+Dy
	 wFwp7BrvqnX19aX5CrV0+hGZCjxghiaq+Y0pgC6mZD/EhTc/65B/NeifKWDoMFpB2C2Nd
	 PtbMF0+I8mDkfYYS/nVQ3WfCtqQOqCJHsKvujkXpvEqiW5N9f4g3JPgUDuVtJ93d05vFE
	 /ZpfulkynOGAAc9EVhlJL/1R7jAjP3M7R6CV/5GzZEZSWg+5hnnjryXeCAHZEcB4Ef2pb
	 A6/PX6rzzmiL2IgC2xEpDlr1AUjm/l6R/Od1RsipyZykvnP0E9EjyLPhzktz0d/FScw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+6pmnva;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C384D606A324
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+6pmnva
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BA61F000CA;
	Mon, 19 Oct 2026 19:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792437840;
	bh=Rwz668qzdvDu9iC7CEm59Q4wFm4SHz1nNpnAgvxWBzQ=;
	h=Date:From:To:Cc:Subject:References;
	b=l+6pmnvaVrj/HSm08pKypIB/HzfTIaV71mh3de9ZPieuPShThdRjLK3uEVlE6IdRH
	 gYTidemgHrAG7rHAG0kSzHm4jbFQiqwKGPfaO0qlz529MSzsShzHDI4F8wd7oG+dGa
	 wFnL5lgkqvsqudv+Buqjw+LdZfyA/NaBSFTkKRkHsQjf/110BuRK2iK8ePMpcKlbvs
	 gz8T2zsihp1um8As4wcqVy/kjNQJbVPS1corUYM89BD0FA2YCnBzV80mtQlmjQTGoq
	 4gcs4N1HXmidF9mWXYjb4VhXnP53xLMSlHg2QGEOHewqBaSZrznGrqYQ3rK6X8kQP+
	 HTo493eRq+VoA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIsxj-00000001eGy-3toH;
	Mon, 19 Oct 2026 15:23:59 -0400
Message-ID: <20261019192359.739366317@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:23:48 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Xiaoqin Zhang <zhangxiaoqin@xiaomi.com>,
 pengdonglin <pengdonglin@xiaomi.com>
Subject: [for-next][PATCH 4/9] fgraph: Enhance funcgraph-retval with BTF-based type-aware output
References: <20261019192344.004592683@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: pengdonglin <pengdonglin@xiaomi.com>

The current funcgraph-retval implementation suffers from two accuracy
issues:

1. Void-returning functions still print a return value, creating
   misleading noise in the trace output.

2. For functions returning narrower types (e.g., char, short), the
   displayed value can be incorrect because high bits of the register
   may contain undefined data.

This patch addresses both problems by leveraging BTF to obtain the exact
return type of each traced kernel function. The key changes are:

1. Void function filtering: Functions with void return type no longer
   display any return value in the trace output, eliminating unnecessary
   clutter.

2. Type-aware value formatting: The return value is now properly truncated
   to match the actual width of the return type before being displayed.
   Additionally, the value is formatted according to its type for better
   human readability.

Here is an output comparison:

Before:
 # perf ftrace -G vfs_read --graph-opts retval
 ...
 1)               |   touch_atime() {
 1)               |     atime_needs_update() {
 1)   0.069 us    |       make_vfsuid(); /* ret=0x0 */
 1)   0.067 us    |       make_vfsgid(); /* ret=0x0 */
 1)               |       current_time() {
 1)   0.197 us    |         ktime_get_coarse_real_ts64_mg(); /* ret=0x187f886aec3ed6f5 */
 1)   0.352 us    |       } /* current_time ret=0x69380753 */
 1)   0.792 us    |     } /* atime_needs_update ret=0x0 */
 1)   0.937 us    |   } /* touch_atime ret=0x0 */

After:
 # perf ftrace -G vfs_read --graph-opts retval
 ...
 2)               |   touch_atime() {
 2)               |     atime_needs_update() {
 2)   0.070 us    |       make_vfsuid(); /* ret=0x0 */
 2)   0.070 us    |       make_vfsgid(); /* ret=0x0 */
 2)               |       current_time() {
 2)   0.162 us    |         ktime_get_coarse_real_ts64_mg();
 2)   0.312 us    |       } /* current_time ret=0x69380649(trunc) */
 2)   0.753 us    |     } /* atime_needs_update ret=false */
 2)   0.899 us    |   } /* touch_atime */

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Xiaoqin Zhang <zhangxiaoqin@xiaomi.com>
Link: https://patch.msgid.link/20260916133218.1282590-4-dolinux.peng@gmail.com
Signed-off-by: pengdonglin <pengdonglin@xiaomi.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_btf.c             | 83 ++++++++++++++++++++++++++++
 kernel/trace/trace_btf.h             | 18 ++++++
 kernel/trace/trace_functions_graph.c | 56 ++++++++++++++-----
 3 files changed, 144 insertions(+), 13 deletions(-)

diff --git a/kernel/trace/trace_btf.c b/kernel/trace/trace_btf.c
index b8370ae9bd54..adefd3969b1b 100644
--- a/kernel/trace/trace_btf.c
+++ b/kernel/trace/trace_btf.c
@@ -2,6 +2,7 @@
 #include <linux/btf.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/kallsyms.h>
 
 #include "trace_btf.h"
 
@@ -126,3 +127,85 @@ const struct btf_member *btf_find_struct_member(struct btf *btf,
 	return member;
 }
 
+void btf_trim_retval(unsigned long func, unsigned long *retval, bool *print_retval,
+			int *fmt, bool hex)
+{
+	const struct btf_type *t;
+	char name[KSYM_NAME_LEN];
+	struct btf *btf;
+	u32 v, msb;
+	bool signed_type;
+	int kind;
+
+	if (lookup_symbol_name(func, name))
+		return;
+
+	t = btf_find_func_proto(name, &btf);
+	if (IS_ERR_OR_NULL(t))
+		return;
+
+	t = btf_type_skip_modifiers(btf, t->type, NULL);
+	kind = t ? BTF_INFO_KIND(t->info) : BTF_KIND_UNKN;
+	switch (kind) {
+	case BTF_KIND_UNKN:
+		*print_retval = false;
+		break;
+	case BTF_KIND_STRUCT:
+	case BTF_KIND_UNION:
+	case BTF_KIND_ENUM:
+	case BTF_KIND_ENUM64:
+		if (kind == BTF_KIND_STRUCT || kind == BTF_KIND_UNION) {
+			*fmt = RETVAL_FMT_HEX;
+			signed_type = false;
+		} else {
+			*fmt = RETVAL_FMT_DEC;
+			signed_type = btf_type_kflag(t);
+			if (!signed_type)
+				*fmt |= RETVAL_FMT_UNSIGNED;
+		}
+
+		if (t->size > sizeof(unsigned long)) {
+			*fmt |= RETVAL_FMT_TRUNC;
+			msb = BITS_PER_LONG - 1;
+		} else {
+			msb = min_t(u32, BITS_PER_BYTE * t->size - 1,
+				    BITS_PER_LONG - 1);
+			*retval &= GENMASK(msb, 0);
+		}
+		if (signed_type && t->size && !hex)
+			*retval = sign_extend64(*retval, msb);
+		break;
+	case BTF_KIND_INT:
+		v = *(u32 *)(t + 1);
+		signed_type = false;
+		if (BTF_INT_ENCODING(v) == BTF_INT_BOOL) {
+			*fmt = RETVAL_FMT_BOOL;
+			msb = 0;
+		} else {
+			signed_type = BTF_INT_ENCODING(v) & BTF_INT_SIGNED;
+			if (signed_type)
+				*fmt = RETVAL_FMT_DEC;
+			else
+				*fmt = RETVAL_FMT_HEX;
+
+			if (t->size > sizeof(unsigned long)) {
+				*fmt |= RETVAL_FMT_TRUNC;
+				msb = BITS_PER_LONG - 1;
+			} else {
+				msb = min_t(u32, BTF_INT_BITS(v) - 1,
+					    BITS_PER_LONG - 1);
+			}
+		}
+		*retval &= GENMASK(msb, 0);
+		if (signed_type && !hex)
+			*retval = sign_extend64(*retval, msb);
+		break;
+	default:
+		*fmt = RETVAL_FMT_HEX;
+		break;
+	}
+
+	if (*print_retval)
+		*fmt |= RETVAL_FMT_BTF;
+	btf_put(btf);
+}
diff --git a/kernel/trace/trace_btf.h b/kernel/trace/trace_btf.h
index 4bd26bceae23..20cbc3d4ae0e 100644
--- a/kernel/trace/trace_btf.h
+++ b/kernel/trace/trace_btf.h
@@ -1,6 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/btf.h>
 
+enum {
+	RETVAL_FMT_HEX   = BIT(0),
+	RETVAL_FMT_DEC   = BIT(1),
+	RETVAL_FMT_BOOL  = BIT(2),
+	RETVAL_FMT_TRUNC = BIT(3),
+	RETVAL_FMT_BTF   = BIT(4),
+	RETVAL_FMT_UNSIGNED = BIT(5),
+};
+
 const struct btf_type *btf_find_func_proto(const char *func_name,
 					   struct btf **btf_p);
 const struct btf_param *btf_get_func_param(const struct btf_type *func_proto,
@@ -10,3 +19,12 @@ const struct btf_member *btf_find_struct_member(struct btf *btf,
 						const char *member_name,
 						u32 *anon_offset,
 						const struct btf_type **member_type);
+#ifdef CONFIG_DEBUG_INFO_BTF
+void btf_trim_retval(unsigned long func, unsigned long *retval, bool *print_retval,
+		     int *fmt, bool hex);
+#else
+static inline void btf_trim_retval(unsigned long func, unsigned long *retval,
+				   bool *print_retval, int *fmt, bool hex)
+{
+}
+#endif
diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index c5befd0c5b9a..78a608315dd3 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -15,6 +15,7 @@
 
 #include "trace.h"
 #include "trace_output.h"
+#include "trace_btf.h"
 
 /* When set, irq functions might be ignored */
 static int ftrace_graph_skip_irqs;
@@ -876,9 +877,10 @@ static void print_graph_retval(struct trace_seq *s, struct ftrace_graph_ent_entr
 {
 	unsigned long err_code = 0;
 	unsigned long retval = 0;
+	bool hex_format;
 	bool print_retaddr = false;
 	bool print_retval = false;
-	bool hex_format = !!(opt_flags & TRACE_GRAPH_PRINT_RETVAL_HEX);
+	int retval_fmt = 0;
 
 #ifdef CONFIG_FUNCTION_GRAPH_RETVAL
 	retval = graph_ret->retval;
@@ -889,17 +891,38 @@ static void print_graph_retval(struct trace_seq *s, struct ftrace_graph_ent_entr
 	print_retaddr = !!(opt_flags & TRACE_GRAPH_PRINT_RETADDR);
 #endif
 
-	if (print_retval && retval && !hex_format) {
-		/* Check if the return value matches the negative format */
-		if (IS_ENABLED(CONFIG_64BIT) && (retval & BIT(31)) &&
-			(((u64)retval) >> 32) == 0) {
-			err_code = sign_extend64(retval, 31);
-		} else {
-			err_code = retval;
+	if (print_retval) {
+		int fmt = RETVAL_FMT_HEX;
+
+		hex_format = !!(opt_flags & TRACE_GRAPH_PRINT_RETVAL_HEX);
+		btf_trim_retval((unsigned long)func, &retval, &print_retval, &fmt,
+				hex_format);
+		if (print_retval) {
+			if (hex_format)
+				retval_fmt = RETVAL_FMT_HEX;
+
+			if (retval && retval_fmt != RETVAL_FMT_HEX &&
+			    !(fmt & RETVAL_FMT_BTF)) {
+				/* Check if the return value matches the negative format */
+				if (IS_ENABLED(CONFIG_64BIT) && (retval & BIT(31)) &&
+					(((u64)retval) >> 32) == 0) {
+					err_code = sign_extend64(retval, 31);
+				} else {
+					err_code = retval;
+				}
+
+				if (!IS_ERR_VALUE(err_code))
+					err_code = 0;
+			}
+
+			if (retval_fmt == RETVAL_FMT_HEX) {
+				retval_fmt |= (fmt & RETVAL_FMT_TRUNC);
+			} else {
+				if (err_code && fmt & RETVAL_FMT_HEX)
+					fmt = (fmt & ~RETVAL_FMT_HEX) | RETVAL_FMT_DEC;
+				retval_fmt = fmt;
+			}
 		}
-
-		if (!IS_ERR_VALUE(err_code))
-			err_code = 0;
 	}
 
 	if (entry) {
@@ -926,10 +949,17 @@ static void print_graph_retval(struct trace_seq *s, struct ftrace_graph_ent_entr
 				    trace_flags, false);
 
 	if (print_retval) {
-		if (hex_format || (err_code == 0))
+		if (retval_fmt & RETVAL_FMT_HEX)
 			trace_seq_printf(s, " ret=0x%lx", retval);
+		else if (retval_fmt & RETVAL_FMT_BOOL)
+			trace_seq_printf(s, " ret=%s", retval ? "true" : "false");
+		else if (retval_fmt & RETVAL_FMT_UNSIGNED)
+			trace_seq_printf(s, " ret=%lu", retval);
 		else
-			trace_seq_printf(s, " ret=%ld", err_code);
+			trace_seq_printf(s, " ret=%ld", err_code ?: retval);
+
+		if (retval_fmt & RETVAL_FMT_TRUNC)
+			trace_seq_printf(s, "(trunc)");
 	}
 
 	if (!entry || print_retval || print_retaddr)
-- 
2.53.0
