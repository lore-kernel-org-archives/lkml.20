Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596240;
	b=wfY7kMkOWHJ5OWozEU8X1uFes/XdvemG/nhPhWH4doJ1lJu7609Q4ynyZHvyJ0uNDWKb
	 xAc2EG5QBHHQvYIEHI4In61FwuDPX5lu7GgGA86C3tsIDRheNvdFcXQ3SqOICwpNdMuhr
	 K06kNp4Pm1932d3QhC9ulWPLjq3OMJLFiE6RZryBZJ931jHfACAoP/2BBBuRqkqalPMqO
	 /WvkXGC6YUotyik85FUOrJJc7Bwcs49QLN62yWXl4ij4TZYFDPCKTIGgp9E5j9lRtV9Om
	 cQwCprUo8D4aSS9l5Mp/0KDm7EqGfy3FRjOREHALkZl4gRk0NK8FBKP5gZUndLCkD0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OKLsDxKgeNyTR2N6X6bMkhCfSN7v5jMUZuKftv1qAXY=;
	b=XcDpkhpD6aLG+M4zB16LLzZWgbDrMR/SSKp67wPYAs2QTBFIspT8MiDAyvWvLJaY5ZVL
	 tBUZLwDPJbtMHnThEnCOgdGAd9CJD9UwkGu5s3PZgx6FbkE3Uq/Mde6fHXtY4a2K3+p2z
	 Y7YsxHBUv4QU5FZ7ZZCnPcFKOpvC79uuByptwuphmM6Myk+68s+7lg6taSv72rPhfx8TE
	 j2BgRZkcJl2ExzYldCRCf5NRqnvNdJTyPzAG2TfTAYA1PKd+Rd8Q47FOT2tbKr9vBo/gw
	 7Dna3j8MxLAd8xdHSg+TKzhwnbopUw0G3s+phRGSrfWbWl+bS/0Y+3wf3XUzGAH8+6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N04J0XeF;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A547606E361
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A547606E361
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=N04J0XeF
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa5103so577208f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1794596238; x=1795201038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKLsDxKgeNyTR2N6X6bMkhCfSN7v5jMUZuKftv1qAXY=;
        b=N04J0XeFYgMqJJ+cfHcHbxusSoInKWkHEy1skit/PHAzcXBBChO6KBJ5HvaCez+YBU
         Xs7oM1eRtMZn3DQx79UI0sXde1Khty1o2p5D6uyZKiEcULYK1vSRsXys2AzY3SxTbAf2
         LXOWDuPcEp6IJuo/pWB0Rg/bR/mjv9sM2AcyRuafxqXmN5uE39fmbgfVNpaqCJeEeOH4
         hxgVtKKIgAFUjFTy7pco7DPCqChbc5CMdRrrSK546g53aSKb74xIa6YEdpudEu3hjK6g
         tv8Zsqd88jtaDO66kQb/FNv4tA2D2D318wQcRIC/ip1h99X/Phoity+wT6ZTVDlH5bpX
         W+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596238; x=1795201038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OKLsDxKgeNyTR2N6X6bMkhCfSN7v5jMUZuKftv1qAXY=;
        b=qmWUYTi82ITQ6JsRCN7nXG8K1E4k7zrJPb+CtfftTsqNkG7YwENaKmJ8EbwJmvSoSD
         LobC7u9MNRfH66/LuiF5blkJ8E0SIFSr9pzxwVEl+MwTx46arjCT/KWRYl1/2zjiXLbo
         B9Ouoo33zAs1EJXF+UqHX+ASdRx2b2aRXfCfQR0HagLjeYUw6HreGpMTu8yAfdafR9gq
         a0st0/BZHcQ9brJOtapssyVaESYu0rC4eRyZ4JHuxsEFdK6E2Y3ukIX2e4D/4n3IlemE
         pQZ8rGeDuuiczBB17/78vyi0zJ5ZHUyUNHHGVTysI9s4/kCr8gXMDRFRCq7jorsAq3zu
         //rQ==
X-Forwarded-Encrypted: i=1; AL+hErF4MjaZJNucag5eESfTuAcQuAW7RDJD+SIznHawHq3z37zNN+srVsICWuZvUD78yPvExKOfwweyVMbN2sQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gHKcLIfEL6qlGq9OaEFqSA7kl1FZMzoVtbPH7nBELPC6oKZnq
	iR9PjA9sWnmHNRNBju5WiKc7vtwMYTTUa2/VLsdtalTq8AkICg1OtgmFVrwi5SZnF/k=
X-Gm-Gg: AYBFou3rjfJshpJU1LHsvcwVXBWtwwzOFUBbxgucE/qiMDkgV5IrfvSZxqh6dSx+p6M
	n3DS37kp3I+VMm343ZqBsJkVLIpuP5q8GRwJ9SAiHACiaEOG49xzDdNS9rxQOFo/xdt3Tq/sX8E
	7ITq3rFi0Itt+vzb8ZRqQwdEWX5BSIwqyHgdrUxxLTnEzzZ2dFv777mi+F9wurrTldYvmjRNCkQ
	s+5LnVSR+RLSROaZrYMcgDPmJ4cfTkcC2QQyUd4tQZzKC6jdismAaPMVg5ucik/Ef19Hg97zyP1
	PrrQ0L+sFyyZcP+AvtMyM3GpzOw/zL7xxiB2uku8eH1Lc9CCuxio2doDL3bCllGRw8Bz/j9sKoQ
	tYq6mlBf8KFj00QJjnRXrsduQUPwfcPYwD008zOFa5wMG8jkV6Ru6pZlHyczgNcPmeaOhmiKzTL
	PXr3Jh03aBJVO7aLobewiU1239rbR5qlefqTuA/QvZggcieYwLmDjRbpy1ahzXpKWN3HgJ3godm
	+Phnj4lKR/6YZghYd/HlAnyhykvlMuy+LBSjgTK03iiLOqnrrH4n6/V2ZfTiVaRWTzfK0E1ZkFl
	G9Cy8TIh49k/eemy5ZH50xBh26GF+A==
X-Received: by 2002:a05:6000:430d:b0:48f:bbf3:cf52 with SMTP id ffacd0b85a97d-49c73350e7bmr8591785f8f.52.1794596237596;
        Fri, 13 Nov 2026 10:57:17 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ec8::179:1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6417589f8f.21.2026.11.13.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:57:16 -0800 (PST)
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
Subject: [PATCH v3 07/10] stackdepot: Remove stack_depot_fetch()
Date: Fri, 13 Nov 2026 18:56:59 +0000
Message-ID: <20261113185702.1332171-8-matt@readmodwrite.com>
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

From: Matt Fleming <mfleming@cloudflare.com>

All callers now use stack_depot_fetch_into(), stack_depot_print() or
stack_depot_snprint(). stack_depot_fetch() hands out a pointer into
depot storage, which leaks how frames are stored internally by
stackdepot. This will be undesirable when compressed frame support
lands in a later patch.

Add a KUnit test that stack_depot_snprint() output and return value
match stack_trace_snprint(), including truncation.

Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 include/linux/stackdepot.h   | 11 ------
 lib/stackdepot.c             | 68 ++++++++++++++++--------------------
 lib/tests/stackdepot_kunit.c | 36 +++++++++++++++++++
 3 files changed, 66 insertions(+), 49 deletions(-)

diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
index 734529767c8a..dcc2e1d21f92 100644
--- a/include/linux/stackdepot.h
+++ b/include/linux/stackdepot.h
@@ -188,17 +188,6 @@ depot_stack_handle_t stack_depot_save(unsigned long *entries,
  */
 struct stack_record *__stack_depot_get_stack_record(depot_stack_handle_t handle);
 
-/**
- * stack_depot_fetch - Fetch a stack trace from stack depot
- *
- * @handle:	Stack depot handle returned from stack_depot_save()
- * @entries:	Pointer to store the address of the stack trace
- *
- * Return: Number of frames for the fetched stack
- */
-unsigned int stack_depot_fetch(depot_stack_handle_t handle,
-			       unsigned long **entries);
-
 /**
  * stack_depot_fetch_into - Fetch a stack trace into caller-owned storage
  *
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 556f3ecdcc8f..8f1aaa0c6d88 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -757,33 +757,14 @@ struct stack_record *__stack_depot_get_stack_record(depot_stack_handle_t handle)
 	return depot_fetch_stack(handle);
 }
 
-unsigned int stack_depot_fetch(depot_stack_handle_t handle,
-			       unsigned long **entries)
+/* Copy the first @nr_entries frames of @stack into @entries. */
+static void depot_copy_entries(const struct stack_record *stack,
+			       unsigned long *entries, unsigned int nr_entries)
 {
-	struct stack_record *stack;
-
-	*entries = NULL;
-	/*
-	 * Let KMSAN know *entries is initialized. This shall prevent false
-	 * positive reports if instrumented code accesses it.
-	 */
-	kmsan_unpoison_memory(entries, sizeof(*entries));
-
-	if (!handle || stack_depot_disabled)
-		return 0;
-
-	stack = depot_fetch_stack(handle);
-	/*
-	 * Should never be NULL, otherwise this is a use-after-put (or just a
-	 * corrupt handle).
-	 */
-	if (WARN(!stack, "corrupt handle or use after stack_depot_put()"))
-		return 0;
-
-	*entries = stack->entries;
-	return stack->size;
+	memcpy(entries, stack->entries, nr_entries * sizeof(*entries));
+	/* stackdepot.c is not instrumented; tell KMSAN the copy is initialized. */
+	kmsan_unpoison_memory(entries, nr_entries * sizeof(*entries));
 }
-EXPORT_SYMBOL_GPL(stack_depot_fetch);
 
 unsigned int stack_depot_fetch_into(depot_stack_handle_t handle,
 				    unsigned long *entries,
@@ -808,12 +789,27 @@ unsigned int stack_depot_fetch_into(depot_stack_handle_t handle,
 	if (nr_entries > max_entries)
 		return 0;
 
-	memcpy(entries, stack->entries, nr_entries * sizeof(*entries));
-	kmsan_unpoison_memory(entries, nr_entries * sizeof(*entries));
+	depot_copy_entries(stack, entries, nr_entries);
 	return nr_entries;
 }
 EXPORT_SYMBOL_GPL(stack_depot_fetch_into);
 
+static struct stack_record *depot_print_fetch(depot_stack_handle_t handle)
+{
+	struct stack_record *stack;
+
+	if (!handle || stack_depot_disabled)
+		return NULL;
+
+	stack = depot_fetch_stack(handle);
+	/*
+	 * Should never be NULL, otherwise this is a use-after-put (or just a
+	 * corrupt handle).
+	 */
+	WARN(!stack, "corrupt handle or use after stack_depot_put()");
+	return stack;
+}
+
 void stack_depot_put(depot_stack_handle_t handle)
 {
 	struct stack_record *stack;
@@ -834,26 +830,22 @@ void stack_depot_put(depot_stack_handle_t handle)
 }
 EXPORT_SYMBOL_GPL(stack_depot_put);
 
-void stack_depot_print(depot_stack_handle_t stack)
+void stack_depot_print(depot_stack_handle_t handle)
 {
-	unsigned long *entries;
-	unsigned int nr_entries;
+	struct stack_record *stack = depot_print_fetch(handle);
 
-	nr_entries = stack_depot_fetch(stack, &entries);
-	if (nr_entries > 0)
-		stack_trace_print(entries, nr_entries, 0);
+	if (stack)
+		stack_trace_print(stack->entries, stack->size, 0);
 }
 EXPORT_SYMBOL_GPL(stack_depot_print);
 
 int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
 		       int spaces)
 {
-	unsigned long *entries;
-	unsigned int nr_entries;
+	struct stack_record *stack = depot_print_fetch(handle);
 
-	nr_entries = stack_depot_fetch(handle, &entries);
-	return nr_entries ? stack_trace_snprint(buf, size, entries, nr_entries,
-						spaces) : 0;
+	return stack ? stack_trace_snprint(buf, size, stack->entries,
+					   stack->size, spaces) : 0;
 }
 EXPORT_SYMBOL_GPL(stack_depot_snprint);
 
diff --git a/lib/tests/stackdepot_kunit.c b/lib/tests/stackdepot_kunit.c
index b0c44c096976..ae4f7661a48f 100644
--- a/lib/tests/stackdepot_kunit.c
+++ b/lib/tests/stackdepot_kunit.c
@@ -3,6 +3,8 @@
 #include <kunit/test.h>
 #include <linux/array_size.h>
 #include <linux/gfp.h>
+#include <linux/minmax.h>
+#include <linux/stacktrace.h>
 #include <linux/stackdepot.h>
 #include <linux/string.h>
 
@@ -71,9 +73,43 @@ static void stackdepot_fetch_into_rejects_missing_or_short_stack(struct kunit *t
 	KUNIT_EXPECT_MEMEQ(test, fetched, expected, sizeof(expected));
 }
 
+/* stack_depot_snprint() must match stack_trace_snprint(), with truncation. */
+static void stackdepot_snprint_matches_stack_trace(struct kunit *test)
+{
+	const unsigned int nr = min(40, CONFIG_STACKDEPOT_MAX_FRAMES);
+	const size_t size = 4096;
+	unsigned long entries[40];
+	depot_stack_handle_t handle;
+	char *got, *want;
+	unsigned int i;
+
+	for (i = 0; i < nr; i++)
+		entries[i] = 0x301000UL + 0x1000UL * i;
+	got = kunit_kzalloc(test, size, GFP_KERNEL);
+	want = kunit_kzalloc(test, size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, got);
+	KUNIT_ASSERT_NOT_NULL(test, want);
+
+	KUNIT_ASSERT_EQ(test, stack_depot_init(), 0);
+	handle = stack_depot_save(entries, nr, GFP_KERNEL);
+	KUNIT_ASSERT_NE(test, handle, (depot_stack_handle_t)0);
+
+	KUNIT_EXPECT_EQ(test, stack_depot_snprint(handle, got, size, 2),
+			stack_trace_snprint(want, size, entries, nr, 2));
+	KUNIT_EXPECT_STREQ(test, got, want);
+
+	/* Truncate part-way through the trace. */
+	memset(got, 0, size);
+	memset(want, 0, size);
+	KUNIT_EXPECT_EQ(test, stack_depot_snprint(handle, got, 700, 0),
+			stack_trace_snprint(want, 700, entries, nr, 0));
+	KUNIT_EXPECT_STREQ(test, got, want);
+}
+
 static struct kunit_case stackdepot_test_cases[] = {
 	KUNIT_CASE(stackdepot_fetch_into_roundtrip),
 	KUNIT_CASE(stackdepot_fetch_into_rejects_missing_or_short_stack),
+	KUNIT_CASE(stackdepot_snprint_matches_stack_trace),
 	{}
 };
 
-- 
2.43.0

