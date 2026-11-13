Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596229;
	b=nOLs08GKST23qXdUUG9K46qNgFy/O1SgryWHTQ88PTDuTCkyapTLmrTecAC9Flxjt5VE
	 JEDRm3M9fM3yL6OmDhwKejyyZt7ryObHX+6Yc/FlSjTXH3EwXMUvb35BxJLOL0sIMWl/Y
	 NQMXhuvjgDlr5jwl4e5j0ySwzc4ynpGnIZMFCAn6CPH1AeX3upz6/Ksslrvd/BJgc8L3B
	 q8a+5NKQno5aWgOdIVsQMpvihayejqFBa4zCPt5Ym9TQ7zxFVImx6czESpUUCIpLEfHb2
	 vu8X/2L4YN84nZS8bRSI+UoBmFQSm7gEeed8/WXDbMQvhU0P19HZLWqj/AFjHdyA9cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qsLrdL7sT/af1ui02yqpWUBVQva/Rfa3My1unqAhcwE=;
	b=l+bwBrvFTkZcPoiobc6kMymYAYLP1By/xCtit4/0joLqgDNTYufc3YL4fySo3Vym9GBy
	 KCbOzxwH9/WWsF53xmwSmkOT7P5YVvEMEVUxOmtHCskp0gSGrCocYrt/jSOcTnaeUChlQ
	 EGpidzV6YVH5nwAydSpcKriIqJxykqhcmc72t1Qq3Zs4iLR99BRps6u3HsmhbKjvpje0B
	 9jwwkRT+FUnFF1Ivn8LkjX2Rm5LroAmm/wZqXLAmwQ1VrjwWnF9vjAdc4k0wPA9La1VWw
	 Sgacz5Igt2GQVS9IET7VVQTiAviNy5mrNy70CGQxf0o/BLNgJD2BYZLV16hm5fGZUDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qDOIetiY;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E48606B373
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E48606B373
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qDOIetiY
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so10757795e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1794596227; x=1795201027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsLrdL7sT/af1ui02yqpWUBVQva/Rfa3My1unqAhcwE=;
        b=qDOIetiYVOK8MtcTtIXgaNKtpvrTTKRehtvf5kqB0rWAoXVCXWlA3QTvU8xH2hVqHN
         e+FXuuoGs7iHWRbyLW9kT2YkDSiivm42UmT6f+AXaE6wnSIMU4GwgRcI5AyVnOJK+z3F
         4eb/J8qiWnit+wQKL9S1KfFmVZp/+SwLV1nrxKal594YLJ6Oev3Gjmk1hY7IIPq4tCXG
         Vlr0acGqX6mRdQj4IKmCQ3L79bxW9J60L/ea6dwSvn1Gg8pCcC3jf/5CzJRD/K9JXhvQ
         iaEVXzVWqGLkjqfMIe2nlmtZlud8QxamylDz0eGf0M7Vm2RLOrV0OnrO3ciZzIjMaw3R
         Jxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596227; x=1795201027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsLrdL7sT/af1ui02yqpWUBVQva/Rfa3My1unqAhcwE=;
        b=SpfNYqiygYjKgyibDNPfSSsS4EmfGY1CxST1pCBEJPW1c5m5FtBjehYNW7WDRGXKoH
         wUT+JxT948Du/v/6Fa5Y3r0VNSwdjTXd7OTEQ2NpKFoMi5usY1jEVSN4DUkPThb6Le2S
         p6nLWITe9VEQYtFyo6pTkABxhyrTyFYvMkY5GTkJ1/7Abv9XoEBNNkYv8oXcGht3wVzm
         mbRofaX7HD3w41vlhxB5VEkCeMraDYxQbuFapy/c0y4yrVGzoaBNIIA9V6StylF3uqNu
         FUlnstaduyf8EKoqmxlbOzqsQTbbhvBIAWCbCISZ+HYLEv8pU7gMbvCUTrWShhaZCKsM
         zKsQ==
X-Forwarded-Encrypted: i=1; AL+hErE+GZT5AsndnpHv6bzFw9npB82dIY2xdOmgKcuPICP0WlSi0/L7LTVgruJ6kt5aWP/cH2930KZhI0aRFB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sLu2w3CnFBh7sRLinm82xS4oyWFQ6OWa7i3Dglih6wTyWWcUw
	c6dEwnE9b25COpdmdiuhoSxQyqwAXLIk5kYBJIxn/QYBnn5Iv83fj9CuiQtH3gX/t6U=
X-Gm-Gg: AYBFou2BnVu0inBCi5yg0VrwxOtwSZ6IyI3W2/nKvbJOLbIR97KHk4fmn1iSo2sDKyJ
	4KdO1ediID1XSlk0wf2kKMhksgjd50KWYNxBsDolas2UMcDi/Dma6/35qdJhUADVmGlXNBhEjHG
	NVacpwrPlZetCb6dhNq73z3K/klWqeNjd/ah0ptOrVkCSOZwrdfmIRtIS2UxttV6kPEMkGuZ/A5
	WneYpTzVfB0HJjpJZuN2v+vlf01Gd+snSXglpdriOairawzFy/lwJGo3Zp2YcdZUalK8uRni8VS
	VCY9NWwHZBGRa6DGsCVxnSwX2etdHsN8JKyU0F8T2nnQGD7C3AtjXXYUUVKXu9OCrMtZHm3MNVm
	8CE+z0NjN+6E31HARtpfGu0QgK8++D7QxtfOisnNm0fK9HWYpRPDG27jSbQ1XpZufLrQE/3yUzR
	2Ob2qsCFlhhc5PW0NfFzH34l/R0N12//SYn1nWRy2/JW30M4xpNWXpBmUfYGn92V8E6mm2DyuAP
	GgjVE7U4ejSkfsroU2Ys3GlMSWLces0Y+4D7I+DTLaRw83VvcO59eiNVacL4CG3+RVMyoZa2Y7S
	5JWWs88X+uYWDabntuKqlaYEdBs0JA==
X-Received: by 2002:a05:600c:8708:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb55a7ece6mr79207495e9.12.1794596227289;
        Fri, 13 Nov 2026 10:57:07 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ec8::179:1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6417589f8f.21.2026.11.13.10.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:57:06 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@kernel.org>,
	Caleb Kan <ckan@cloudflare.com>,
	Caleb Kan <calebkan1106@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH v3 01/10] stackdepot: add caller-owned stack trace fetching
Date: Fri, 13 Nov 2026 18:56:53 +0000
Message-ID: <20261113185702.1332171-2-matt@readmodwrite.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113185702.1332171-1-matt@readmodwrite.com>
References: <20261113185702.1332171-1-matt@readmodwrite.com>
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

From: Caleb Kan <ckan@cloudflare.com>

stack_depot_fetch() returns a pointer to contiguous storage owned by stack
depot. That cannot work once a later patch stores compressed frames, so
callers need an interface that copies the trace.

Add stack_depot_fetch_into() to copy a complete trace into caller-owned
storage. Leave the destination unchanged when it is too small, keep a zero
handle as a no-op, and document that callers must keep the handle valid
while copying it. Warn and return 0 if a caller passes a NULL buffer or
zero capacity for a valid handle.

Unpoison the copied entries before returning them because
lib/stackdepot.c is not instrumented by KMSAN. Add built-in KUnit tests for
exact and oversized destinations, zero handles, and undersized buffers.
Later patches add tests for stack depot internals.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
[mfleming: reworded for compressed frames]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 include/linux/stackdepot.h   | 36 +++++++++++++++
 lib/Kconfig.debug            | 16 +++++++
 lib/stackdepot.c             | 29 ++++++++++++
 lib/tests/Makefile           |  1 +
 lib/tests/stackdepot_kunit.c | 89 ++++++++++++++++++++++++++++++++++++
 5 files changed, 171 insertions(+)
 create mode 100644 lib/tests/stackdepot_kunit.c

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
index 2d22638ec13a..861d0caf9391 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2818,6 +2818,22 @@ config RESOURCE_KUNIT_TEST
 
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
index 90c52f2e0d3f..556f3ecdcc8f 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -785,6 +785,35 @@ unsigned int stack_depot_fetch(depot_stack_handle_t handle,
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
+	if (WARN_ON_ONCE(!entries || !max_entries))
+		return 0;
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
index df0537e1b91f..bc6532d88150 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_RANDSTRUCT_KUNIT_TEST) += randstruct_kunit.o
 obj-$(CONFIG_SCANF_KUNIT_TEST) += scanf_kunit.o
 obj-$(CONFIG_SEQ_BUF_KUNIT_TEST) += seq_buf_kunit.o
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
2.43.0

