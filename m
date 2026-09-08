Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CE05476F8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873249; cv=none; b=PSf5Wi4Kpy8lgS7Ps46S178Z4yLkub+OsLrdfY+IRCGokFVk6JFiqyCxolfMPonSxOJfWT4bFNepYWWGOnpr6bgqD30sd1zRPqorm75/6ZJ78zJtj8nY/JjqlwZsHfV/3rEGr3R4ncttXMAPkNeKYUxqLJYxNU8mWL1ZdnE4CRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873249; c=relaxed/simple;
	bh=qNTAB7oPX8OED8WnXC4Pxiv687JkKcIW5xcsxDNCZJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gP7CAGmKJMGPHnogv2ll8A2D8ppp3IQWUdRm9aUtkMv8QPZU34Qiz0Da9eML3+yBrxEJ/gWrp6tWkBzG6VdZ+jqjQ1N/+jhc2xizrnfXBLc2Ezo2HrhcW+U8DTH0NyqY9mYsDXPYOvXxXedjLH+dPLK6N/GOxJ7eBgaIi5KhBKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhPNSZOY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhPNSZOY"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2637dd37c1so354866866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873233; x=1789478033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5+uH0xlKN2hEFrP0JeeUp1z2fKvzaAC1oyZ553cvDk=;
        b=HhPNSZOYH8KNvW2ywhy2FVQN3DGSRxkO0X9np8iSepnXvleOCdiPbDyAqe/IynYo6h
         O8+kvMrKifJRPo9sCXv/X+/fKAB8Hq5fd2IiBU4rXRXDJrXd7dg81t7v7EQGEKVMJzAH
         jyKVFR8CVpSiT7y/B9ZCYKxoz2tBuHV3SNzx+32XNuX4epoD8Qcj5WCWaAt6bsF53byu
         yNLSz/vT0ngmEouZUKX4+IUTSTmsp7dewRscC30S0nfqo33S5NwtAebSnE0tYeiAy/Fe
         QxmZt4gCPZgxf3uxhfJS+MBdX/CKcg2MjXhmFgmoHAJwNkhkEcBVNvIQasp6AQqlz1rx
         yzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873233; x=1789478033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5+uH0xlKN2hEFrP0JeeUp1z2fKvzaAC1oyZ553cvDk=;
        b=U8CYylk/MLxIbLe5haV1hNZv2LE8pslD0InEIjKaEvtjCx/D5R/jJQSNg1FuHIoEwb
         +jRL8q1O9JnpC8vTOO8jPKp7dcC1eSHbB56OZBKsZOYJxOC0STAPWnbGCbnWOEICB+G/
         K3quT7I+El9CuY0e+JiAWHCsVy/x7jJwBa1L75BkiOqog/0ns91mCduqC2bP9g5cnAi7
         dmG27KJ9PLIlGRkzptVunjlY1jgiKnXeE91tW/3qroFmsBQ75nCzlHiCKWDvkR4/+nPF
         fBLhJQWXH+lSWUHFpHtsWi8EfaM+kfuu59wVnok9WP/ZaQ9zYW1jwzilHyBl7hMYMIZq
         EddA==
X-Forwarded-Encrypted: i=1; AKwUvByE0yF7PbJjKJacki3I++T03tdnlQuMnUH0A9u5xEjHnxIW06Fo5QHYyeJtsIvDgu4dDIg4Q32S4lPwGZo=@vger.kernel.org
X-Gm-Message-State: AFuF++lbgjM0gV1HMh6dfwr8xhysBQX1jUchx533+EypYEbvN/QhaCc6
	GQhlzsFIsTY3Lcq83NdGtATvtUnmYnDZfeqfJSvl45rqvRBPhVTIgY6m
X-Gm-Gg: AYBFou0miPsDa8LpTTKfXuKgUkg0BsmaqY5pwbS71gnyEtnvkL4ssXz1R08g0mq0LAl
	17QbqLF58AhEmVcniBNUFu5IgqMsgLp0x0HWr/VsPgoA03GpptlK1xyMMV2nFpdz1UfvEuQxz/a
	H9BN7m73xfUs2B7Ht9Vbo9Cd7U/xcBk95yokCFnRM27IgHFKWkzDa1H+rrSQFoGZKI6KmUw5KfJ
	WmYUxYbbUHWV/s9VSCB1oaW4PDh3wBRMie5p2Mh4VlQtNaYVE49IhlioTvkHN3zbDBllzFgLWRh
	ShGVPvjMpPa3rxdXlFgSQl6JV3mGJe17cEdrvWtp5gb/k2V+bSnbA5Onaq2gU/3WwShAlAAAzO8
	rzLZWPj7ShWV9Zox+wcdmGGNgJP9vtQ+N7c7baMUi8O52TZIWXfalf/toT8xnd8gGubLxGSfXRB
	QyUxNmSG7FPmfodiL9uAMV0E8sKLt6XfQMMcPYLUb1ljLZH3afaw==
X-Received: by 2002:a17:907:7281:b0:c25:cb7a:12d6 with SMTP id a640c23a62f3a-c260c9972aemr1109763266b.14.1788873233006;
        Tue, 08 Sep 2026 06:13:53 -0700 (PDT)
Received: from [127.0.0.1] ([2a09:bac6:37a9:1e5a::306:1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm625170866b.63.2026.09.08.06.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:13:52 -0700 (PDT)
From: Caleb Kan <calebkan1106@gmail.com>
Date: Tue, 08 Sep 2026 14:13:35 +0100
Subject: [PATCH RFC v2 02/11] stackdepot: add caller-owned stack trace
 fetching
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-stackdepot-trie-v2-2-1996d5cef732@cloudflare.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
In-Reply-To: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@kernel.org>, 
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>, 
 kernel-team@cloudflare.com
X-Mailer: b4 0.16.0

From: Caleb Kan <ckan@cloudflare.com>

stack_depot_fetch() returns a pointer to contiguous storage owned by stack
depot. That cannot work for a backend whose frames are not contiguous, so
callers need an interface that copies the trace before they can support
both backends.

Add stack_depot_fetch_into() to copy a complete trace into caller-owned
storage. Leave the destination unchanged when it is too small, keep a zero
handle as a no-op, and document that callers must keep the handle valid
while copying it. Warn if a caller passes a NULL buffer or zero capacity
for a valid handle instead of treating the stack as missing.

Unpoison the copied entries before returning them because
lib/stackdepot.c is not instrumented by KMSAN. Add built-in KUnit tests for
exact and oversized destinations, zero handles, and undersized buffers.
Later patches add tests for stack depot internals.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
---
 include/linux/stackdepot.h   | 36 ++++++++++++++++++
 lib/Kconfig.debug            | 16 ++++++++
 lib/stackdepot.c             | 28 ++++++++++++++
 lib/tests/Makefile           |  1 +
 lib/tests/stackdepot_kunit.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 170 insertions(+)

diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
index 2cc21ffcdaf9..734529767c8a 100644
--- a/include/linux/stackdepot.h
+++ b/include/linux/stackdepot.h
@@ -199,6 +199,42 @@ struct stack_record *__stack_depot_get_stack_record(depot_stack_handle_t handle)
 unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 			       unsigned long **entries);
 
+/**
+ * stack_depot_fetch_into - Fetch a stack trace into caller-owned storage
+ *
+ * @handle:	Stack depot handle
+ * @entries:	Caller-owned buffer to copy the stack trace into
+ * @max_entries:	Number of frames that fit in @entries
+ *
+ * Copies the stored frames into caller-owned @entries. If fewer frames are
+ * stored than @max_entries, only the stored frames are written and their count
+ * is returned. If more frames are stored than @max_entries, the copy is skipped
+ * entirely and 0 is returned.
+ *
+ * Passing a NULL @entries buffer or zero @max_entries for a valid @handle is
+ * invalid. Callers must provide storage for @max_entries frames.
+ *
+ * Callers should size @entries to match the save-side stack depth cap (for
+ * example, %CONFIG_STACKDEPOT_MAX_FRAMES or the local stack_trace_save() limit)
+ * when losing diagnostics on an undersized buffer would be surprising.
+ *
+ * A non-zero invalid @handle, including a post-put handle, may WARN. Its return
+ * value and copied contents are undefined because the record may have been
+ * reused for another stack.
+ *
+ * Callers must ensure @handle remains valid for the duration of this call.
+ * Persistent handles saved without %STACK_DEPOT_FLAG_GET require no extra
+ * reference; handles saved with %STACK_DEPOT_FLAG_GET require a held reference.
+ * Callers must not call stack_depot_put() on persistent handles.
+ * Racing this helper with stack_depot_put() on the same handle is invalid.
+ *
+ * Return: Number of frames copied, 0 if @handle is 0, stack depot is disabled,
+ * or @max_entries is less than the number of stored frames.
+ */
+unsigned int stack_depot_fetch_into(depot_stack_handle_t handle,
+				    unsigned long *entries,
+				    unsigned int max_entries);
+
 /**
  * stack_depot_print - Print a stack trace from stack depot
  *
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625..fcd74edfd93a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2785,6 +2785,22 @@ config RESOURCE_KUNIT_TEST
 
 	  If unsure, say N.
 
+config STACKDEPOT_KUNIT_TEST
+	bool "KUnit test for stack depot" if !KUNIT_ALL_TESTS
+	depends on KUNIT=y && STACKDEPOT
+	depends on STACKDEPOT_MAX_FRAMES >= 3
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to test stack depot API behavior at boot.
+	  This test is built in, so KUNIT must also be built in.
+
+	  KUnit tests run during boot and output the results to the debug log
+	  in TAP format (https://testanything.org/). Only useful for kernel
+	  developers running the KUnit test harness, and not intended for
+	  inclusion into a production build.
+
+	  If unsure, say N.
+
 config SYSCTL_KUNIT_TEST
 	tristate "KUnit test for sysctl" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 90c52f2e0d3f..4da7279d9f83 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -785,6 +785,34 @@ unsigned int stack_depot_fetch(depot_stack_handle_t handle,
 }
 EXPORT_SYMBOL_GPL(stack_depot_fetch);
 
+unsigned int stack_depot_fetch_into(depot_stack_handle_t handle,
+				    unsigned long *entries,
+				    unsigned int max_entries)
+{
+	struct stack_record *stack;
+	unsigned int nr_entries;
+
+	if (!handle)
+		return 0;
+	if (stack_depot_disabled)
+		return 0;
+	WARN_ON_ONCE(!entries || !max_entries);
+
+	stack = depot_fetch_stack(handle);
+	if (!stack)
+		return 0;
+	nr_entries = stack->size;
+	if (WARN_ON_ONCE(!nr_entries))
+		return 0;
+	if (nr_entries > max_entries)
+		return 0;
+
+	memcpy(entries, stack->entries, nr_entries * sizeof(*entries));
+	kmsan_unpoison_memory(entries, nr_entries * sizeof(*entries));
+	return nr_entries;
+}
+EXPORT_SYMBOL_GPL(stack_depot_fetch_into);
+
 void stack_depot_put(depot_stack_handle_t handle)
 {
 	struct stack_record *stack;
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 3cac3b63a752..1f72191f98bb 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_SCANF_KUNIT_TEST) += scanf_kunit.o
 obj-$(CONFIG_SEQ_BUF_KUNIT_TEST) += seq_buf_kunit.o
 obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
 obj-$(CONFIG_SLUB_KUNIT_TEST) += slub_kunit.o
+obj-$(CONFIG_STACKDEPOT_KUNIT_TEST) += stackdepot_kunit.o
 obj-$(CONFIG_TEST_SORT) += test_sort.o
 CFLAGS_stackinit_kunit.o += $(call cc-disable-warning, switch-unreachable)
 obj-$(CONFIG_STACKINIT_KUNIT_TEST) += stackinit_kunit.o
diff --git a/lib/tests/stackdepot_kunit.c b/lib/tests/stackdepot_kunit.c
new file mode 100644
index 000000000000..b0c44c096976
--- /dev/null
+++ b/lib/tests/stackdepot_kunit.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <kunit/test.h>
+#include <linux/array_size.h>
+#include <linux/gfp.h>
+#include <linux/stackdepot.h>
+#include <linux/string.h>
+
+static void stackdepot_fetch_into_roundtrip(struct kunit *test)
+{
+	unsigned long entries[] = {
+		0x101000UL,
+		0x102000UL,
+		0x103000UL,
+	};
+	unsigned long exact[ARRAY_SIZE(entries)] = {};
+	unsigned long fetched[ARRAY_SIZE(entries) + 1] = {
+		[ARRAY_SIZE(entries)] = 0xa5a5a5a5UL,
+	};
+	unsigned long expected_tail = fetched[ARRAY_SIZE(entries)];
+	depot_stack_handle_t handle;
+	unsigned int nr_entries;
+
+	KUNIT_ASSERT_EQ(test, stack_depot_init(), 0);
+
+	handle = stack_depot_save(entries, ARRAY_SIZE(entries), GFP_KERNEL);
+	KUNIT_ASSERT_NE(test, handle, (depot_stack_handle_t)0);
+
+	nr_entries = stack_depot_fetch_into(handle, exact, ARRAY_SIZE(exact));
+	KUNIT_EXPECT_EQ(test, nr_entries, (unsigned int)ARRAY_SIZE(entries));
+	KUNIT_EXPECT_MEMEQ(test, exact, entries, sizeof(entries));
+
+	nr_entries = stack_depot_fetch_into(handle, fetched, ARRAY_SIZE(fetched));
+	KUNIT_EXPECT_EQ(test, nr_entries, (unsigned int)ARRAY_SIZE(entries));
+	KUNIT_EXPECT_MEMEQ(test, fetched, entries, sizeof(entries));
+	KUNIT_EXPECT_EQ(test, fetched[ARRAY_SIZE(entries)], expected_tail);
+}
+
+static void stackdepot_fetch_into_rejects_missing_or_short_stack(struct kunit *test)
+{
+	unsigned long entries[] = {
+		0x111000UL,
+		0x112000UL,
+		0x113000UL,
+	};
+	unsigned long fetched[ARRAY_SIZE(entries)] = {
+		0xa1a1a1a1UL,
+		0xb2b2b2b2UL,
+		0xc3c3c3c3UL,
+	};
+	unsigned long expected[ARRAY_SIZE(fetched)];
+	depot_stack_handle_t handle;
+	unsigned int nr_entries;
+
+	KUNIT_ASSERT_EQ(test, stack_depot_init(), 0);
+
+	handle = stack_depot_save(entries, ARRAY_SIZE(entries), GFP_KERNEL);
+	KUNIT_ASSERT_NE(test, handle, (depot_stack_handle_t)0);
+	memcpy(expected, fetched, sizeof(expected));
+
+	nr_entries = stack_depot_fetch_into(0, fetched, ARRAY_SIZE(fetched));
+	KUNIT_EXPECT_EQ(test, nr_entries, 0U);
+	KUNIT_EXPECT_MEMEQ(test, fetched, expected, sizeof(expected));
+
+	nr_entries = stack_depot_fetch_into(0, NULL, 0);
+	KUNIT_EXPECT_EQ(test, nr_entries, 0U);
+
+	nr_entries = stack_depot_fetch_into(handle, fetched,
+					    ARRAY_SIZE(fetched) - 1);
+	KUNIT_EXPECT_EQ(test, nr_entries, 0U);
+	KUNIT_EXPECT_MEMEQ(test, fetched, expected, sizeof(expected));
+}
+
+static struct kunit_case stackdepot_test_cases[] = {
+	KUNIT_CASE(stackdepot_fetch_into_roundtrip),
+	KUNIT_CASE(stackdepot_fetch_into_rejects_missing_or_short_stack),
+	{}
+};
+
+static struct kunit_suite stackdepot_test_suite = {
+	.name = "stackdepot",
+	.test_cases = stackdepot_test_cases,
+};
+
+kunit_test_suite(stackdepot_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for stack depot");
+MODULE_AUTHOR("Caleb Kan <ckan@cloudflare.com>");
+MODULE_LICENSE("GPL");

-- 
Git-155)

