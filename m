Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596243;
	b=rciq2dlNvUR4QkIhxtpf0buUPyD+fV0EFhZPVWURLe4RHuC7Sn8gueCQ2cHR/NoGexmg
	 PpcPxR6JS9SSeLmTvmoGhum3JvuwoHuqEUzG8Cp8kO0/DAO8+RJOPhGq26oWReHXujSIJ
	 Y4I9ZdtvJOeZ7hs52hObdjXci3S8s1sNPOxc6kSIot8siT/ytznEifKQvVZ5NI3dDXhwv
	 msdFrYc1JS9aUb21gk+k+TMUklH3v+Tn/BNRQhISjQMv1S1W+M3gBodHMHvpsh+i18wOu
	 2yFEPjQFtIxPMrk6cLtih02VRhqeTo+N4r+0/J/qObRnzMKH38M4ubrCCOAs8cXbScA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KPaI81Zahfc4wi9ZED7JB3rtSNfxGWOcBtHGauRoFvk=;
	b=XTrvA9+NbE6ZaDSSV6YeDE5Q6G7+ZS/56Ma+Lk6x/X+qutF95QsLrfPzyqbcgQlSRQq2
	 LrM+WCHbjhTID/oE27gRZhCEU9TOzdn/Q1EDQzsegeRs+m32nW0nR4RAaw1Eaf/a4SYJs
	 oFpCghwklJGc5XLGNiD6DJ4oIGqI0G2L9q6LfgRyKxd0IfhjjShTK3b4MiJ5QVAQllluR
	 8zp4dhd1kwAmPdwPorpoV3kPuJRI0C4AcW605uJKy62L1ek20B6h7R97ssBOEBka8PNHZ
	 SJtvN0C92iqY+wiMTTGLOh3JzzZVKFNreDg/eu7027CBYD+wgry65oz6r8yDOo/XfUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fYFl8iiL;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC56071070
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBC56071070
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fYFl8iiL
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e10a70540so647754f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1794596241; x=1795201041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPaI81Zahfc4wi9ZED7JB3rtSNfxGWOcBtHGauRoFvk=;
        b=fYFl8iiLEqey+snyYcHqOGd3orf51G7F0/vGqzux+JvOPEfA6BfmLq4WUlfKAz18so
         Bg5ZUZv+t+Amd5gr3KvYwXa44IUdt5AfTHP5wDOJQQ/S9+YuXnww3aLjb/bSKKzF7Yg4
         /KVPjTrgfYiuuSP9K4eZ9Vpo7dL4QjkFew5gmyHydFiufKBOSk4K2gV1MEdM6KNhG/g6
         9LKmTGC5PXE19YF7EuO4JsgKSHBXd0Ulcl2j24mDuF60uKZ2EULxn+W5+EBaxvUeFFpz
         0ZSyVGF5yIIuXn40uD7Y8WcZHnEpY8J1pmi77gbnBCYhaq9UxqSk4g9wV91LtUaLRWDY
         aQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596241; x=1795201041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPaI81Zahfc4wi9ZED7JB3rtSNfxGWOcBtHGauRoFvk=;
        b=mpqm5pgj8DDtjielI1QPNirUjENPolb+zU2bYUmiIUPooRZCw8UZ98Q9lBdceiCccv
         CC3IeYp44HH3g9UZlBLOP8EtKEwxDv2TNWCca99GCjC86cL99RH1SK4EVsICOvKo1Xgs
         ad8+0XkawDhGSBDmAe5v0+VCyO3IZUulDXkyisZn8c0ymWFcfYAqeRomBNPsof3n+XmA
         YA7w3dlBWn2UbLc/ea9t/MrMCGQfo5T4tCukrs5g/8EWPm33mW7AR7QS9uSzjE43uN2I
         6ptC+bfeuj0RNDIpvHvyQpQTYru84NjFSk+wU1+m8N6/soV7mBY4f/UipUookeQOnq25
         OqYQ==
X-Forwarded-Encrypted: i=1; AL+hErE052mKmnuGFLvdThTXZikM7X6gIEVaFfasuIdzUbLPNpztODc3b8iqn0mJu4BgCj8m4Z1ZDYGMysFzrpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2+28K1V0XtEyNu5k9MGx5JVSEdXA4FPTPpFYTs4zao8lTl/XC
	F58Ntjkidf3fnIlBGmhT22rQOsND/C+qkc9/njDhycB1AlL1DDhYU4UpGHOHvnyM/zA=
X-Gm-Gg: AYBFou0z+D7I4nGe0IfCHywvi0wJ+EKXsBVVccn3Q74bJTQcuuKiMMQMriZwzt7z8Z5
	QnaH6w/limhe7HUmdaYG+5WqHi7H9uEzyVPqz94JvPrbp48vPi0ottSzCNxb3+GS4Y5wK3/aS7t
	wVYvBitqIM96XN+kejfJxPFwkHHRmXlptY2AMQg4MOowITy0JkxAxhIl6nI/KRDYIl5WhaYv5pW
	ImbrYo5b/99CxU/Xq9eKWUPGyzmQjqZvKvxqzcEi75TKaw1MFa+ZyIbpBBStWwGc8E4BYvE4h6I
	XDi6XDGUCN/oa44sppeEtkcslXYG4qL7CHHqwRzlOgD7VgvjMxfWHUCPejVi5iTb/xtOAARDtL/
	o199lqpS8yEdXPsbymjaALgMM5qe+UbBhsHJORUNWHYuGs8Mtu0s6Dw1A5l3rsPsg65qs4/tAbX
	o1n7vxUzXRFHzvy88RVPSk1LdKHj1csmmkElzOj6H1nHrejXqoN19yFnUASonWCNZKID8WRx9Wa
	EFw0xg5QWR2T7jDW6SpA3/S93ht1HGSEDnYS0RefrdVb1nXXWsNYUwYcq7q3pku9oUcpDs5EkTW
	VZBx5kDfzQtOy1SLds7ysddjFn61pg==
X-Received: by 2002:a05:6000:26c8:b0:491:ed89:a38f with SMTP id ffacd0b85a97d-49c73631471mr8011086f8f.23.1794596240913;
        Fri, 13 Nov 2026 10:57:20 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ec8::179:1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6417589f8f.21.2026.11.13.10.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:57:20 -0800 (PST)
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
Subject: [PATCH v3 09/10] stackdepot: Store compressed frames in stack records
Date: Fri, 13 Nov 2026 18:57:01 +0000
Message-ID: <20261113185702.1332171-10-matt@readmodwrite.com>
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

On KASAN machines stack depot can exhaust stack_depot_max_pools. Frame
addresses for some architectures (currently x86-64 and arm64) can be
losslessly compressed when stored in stackdepot, thereby reducing the
number of pools and saving memory.

When every frame of a persistent record can be compressed with the arch
hooks, store the 32-bit compressed frames in a new 'compressed_entries'
union member and mark the record STACK_RECORD_COMPRESSED. Narrow 'size'
to u16 and add a u16 'flags' field so the 32-byte header size is
unchanged (CONFIG_STACKDEPOT_MAX_FRAMES is at most 256). A record with
any frame that cannot be compressed keeps all its frames uncompressed.

Evictable records (saved with STACK_DEPOT_FLAG_GET) are not compressed
because those records always allocate the maximum size anyway and
compressing frames doesn't shrink the allocation.

The hash is still computed over the uncompressed frames, so identical
traces deduplicate regardless of representation.

Record sizes for common frame counts:

  frames   uncompressed   compressed   reduction
  ------   ------------   ----------   ---------
       8           96 B         64 B       33.3%
      16          160 B         96 B       40.0%
      28          256 B        144 B       43.8%
      32          288 B        160 B       44.4%
      64          544 B        288 B       47.1%

On production KASAN hosts this reduced the number of stack depot pools
per 1000 stacks:

  arch     uncompressed   compressed   saving
  ------   ------------   ----------   ------
  x86-64          15.80         9.25    41.5%
  arm64           15.97        11.64    27.1%

arm64 saves less because we run a lot of BPF programs whose code
addresses can't be compressed.

Suggested-by: Marco Elver <elver@google.com>
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 include/linux/stackdepot.h   |   8 ++-
 lib/stackdepot.c             | 101 ++++++++++++++++++++++++++++++----
 lib/tests/stackdepot_kunit.c | 103 ++++++++++++++++++++++++++++++++++-
 3 files changed, 199 insertions(+), 13 deletions(-)

diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
index dcc2e1d21f92..de42f6540266 100644
--- a/include/linux/stackdepot.h
+++ b/include/linux/stackdepot.h
@@ -20,6 +20,7 @@
 #ifndef _LINUX_STACKDEPOT_H
 #define _LINUX_STACKDEPOT_H
 
+#include <linux/bits.h>
 #include <linux/gfp.h>
 
 typedef u32 depot_stack_handle_t;
@@ -50,14 +51,19 @@ union handle_parts {
 	};
 };
 
+/* Frames are compressed into @compressed_entries; see asm/stackdepot.h. */
+#define STACK_RECORD_COMPRESSED	BIT(0)
+
 struct stack_record {
 	struct list_head hash_list;	/* Links in the hash table */
 	u32 hash;			/* Hash in hash table */
-	u32 size;			/* Number of stored frames */
+	u16 size;			/* Number of stored frames */
+	u16 flags;			/* STACK_RECORD_* */
 	union handle_parts handle;	/* Constant after initialization */
 	refcount_t count;
 	union {
 		unsigned long entries[CONFIG_STACKDEPOT_MAX_FRAMES];	/* Frames */
+		u32 compressed_entries[CONFIG_STACKDEPOT_MAX_FRAMES];
 		struct {
 			/*
 			 * An important invariant of the implementation is to
diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 8f1aaa0c6d88..f323f1e97e12 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -36,6 +36,8 @@
 #include <linux/memblock.h>
 #include <linux/kasan-enabled.h>
 
+#include <asm/stackdepot.h>
+
 /*
  * The pool_index is offset by 1 so the first record does not have a 0 handle.
  */
@@ -94,6 +96,7 @@ static const char *const counter_names[] = {
 	[DEPOT_COUNTER_PERSIST_BYTES]	= "persistent_bytes",
 };
 static_assert(ARRAY_SIZE(counter_names) == DEPOT_COUNTER_COUNT);
+static_assert(CONFIG_STACKDEPOT_MAX_FRAMES <= U16_MAX);
 
 static int __init disable_stack_depot(char *str)
 {
@@ -419,9 +422,37 @@ static struct stack_record *depot_pop_free(void)
 	return stack;
 }
 
-static inline size_t depot_stack_record_size(struct stack_record *s, unsigned int nr_entries)
+/* Check whether every frame of a stack can be stored in 32 bits. */
+static bool depot_entries_compressible(const unsigned long *entries,
+				       unsigned int nr_entries)
+{
+	u32 payload;
+
+	for (unsigned int i = 0; i < nr_entries; i++) {
+		if (!arch_stack_depot_frame_try_compress(entries[i], &payload))
+			return false;
+	}
+	return true;
+}
+
+static inline unsigned long depot_stack_entry(const struct stack_record *stack,
+					      unsigned int i)
 {
-	const size_t used = flex_array_size(s, entries, nr_entries);
+	unsigned long frame;
+
+	if (!(stack->flags & STACK_RECORD_COMPRESSED))
+		return stack->entries[i];
+	arch_stack_depot_frame_decompress(stack->compressed_entries[i], &frame);
+	return frame;
+}
+
+static inline size_t depot_stack_record_size(struct stack_record *s,
+					     unsigned int nr_entries,
+					     bool compressed)
+{
+	const size_t used = compressed ?
+		flex_array_size(s, compressed_entries, nr_entries) :
+		flex_array_size(s, entries, nr_entries);
 	const size_t unused = sizeof(s->entries) - used;
 
 	WARN_ON_ONCE(sizeof(s->entries) < used);
@@ -436,6 +467,7 @@ depot_alloc_stack(unsigned long *entries, unsigned int nr_entries, u32 hash, dep
 {
 	struct stack_record *stack = NULL;
 	size_t record_size;
+	bool compressed = false;
 
 	lockdep_assert_held(&pool_lock);
 
@@ -452,10 +484,13 @@ depot_alloc_stack(unsigned long *entries, unsigned int nr_entries, u32 hash, dep
 		 * Evictable entries have to allocate the max. size so they may
 		 * safely be re-used by differently sized allocations.
 		 */
-		record_size = depot_stack_record_size(stack, CONFIG_STACKDEPOT_MAX_FRAMES);
+		record_size = depot_stack_record_size(stack,
+						      CONFIG_STACKDEPOT_MAX_FRAMES,
+						      false);
 		stack = depot_pop_free();
 	} else {
-		record_size = depot_stack_record_size(stack, nr_entries);
+		compressed = depot_entries_compressible(entries, nr_entries);
+		record_size = depot_stack_record_size(stack, nr_entries, compressed);
 	}
 
 	if (!stack) {
@@ -468,7 +503,16 @@ depot_alloc_stack(unsigned long *entries, unsigned int nr_entries, u32 hash, dep
 	stack->hash = hash;
 	stack->size = nr_entries;
 	/* stack->handle is already filled in by depot_pop_free_pool(). */
-	memcpy(stack->entries, entries, flex_array_size(stack, entries, nr_entries));
+	if (compressed) {
+		stack->flags = STACK_RECORD_COMPRESSED;
+		for (unsigned int i = 0; i < nr_entries; i++)
+			arch_stack_depot_frame_try_compress(entries[i],
+							    &stack->compressed_entries[i]);
+	} else {
+		stack->flags = 0;
+		memcpy(stack->entries, entries,
+		       flex_array_size(stack, entries, nr_entries));
+	}
 
 	if (flags & STACK_DEPOT_FLAG_GET) {
 		refcount_set(&stack->count, 1);
@@ -588,6 +632,20 @@ int stackdepot_memcmp(const unsigned long *u1, const unsigned long *u2,
 	return 0;
 }
 
+static inline bool depot_stack_equal(const struct stack_record *stack,
+				     const unsigned long *entries,
+				     unsigned int size)
+{
+	if (!(stack->flags & STACK_RECORD_COMPRESSED))
+		return !stackdepot_memcmp(entries, stack->entries, size);
+
+	for (unsigned int i = 0; i < size; i++) {
+		if (depot_stack_entry(stack, i) != entries[i])
+			return false;
+	}
+	return true;
+}
+
 /* Finds a stack in a bucket of the hash table. */
 static inline struct stack_record *find_stack(struct list_head *bucket,
 					      unsigned long *entries, int size,
@@ -615,7 +673,7 @@ static inline struct stack_record *find_stack(struct list_head *bucket,
 		 * management state unioned with @entries. The refcount is zero
 		 * in that case and the below refcount_inc_not_zero() will fail.
 		 */
-		if (data_race(stackdepot_memcmp(entries, stack->entries, size)))
+		if (!data_race(depot_stack_equal(stack, entries, size)))
 			continue;
 
 		/*
@@ -761,7 +819,8 @@ struct stack_record *__stack_depot_get_stack_record(depot_stack_handle_t handle)
 static void depot_copy_entries(const struct stack_record *stack,
 			       unsigned long *entries, unsigned int nr_entries)
 {
-	memcpy(entries, stack->entries, nr_entries * sizeof(*entries));
+	for (unsigned int i = 0; i < nr_entries; i++)
+		entries[i] = depot_stack_entry(stack, i);
 	/* stackdepot.c is not instrumented; tell KMSAN the copy is initialized. */
 	kmsan_unpoison_memory(entries, nr_entries * sizeof(*entries));
 }
@@ -833,9 +892,15 @@ EXPORT_SYMBOL_GPL(stack_depot_put);
 void stack_depot_print(depot_stack_handle_t handle)
 {
 	struct stack_record *stack = depot_print_fetch(handle);
+	unsigned long frame;
 
-	if (stack)
-		stack_trace_print(stack->entries, stack->size, 0);
+	if (!stack)
+		return;
+	for (unsigned int i = 0; i < stack->size; i++) {
+		frame = depot_stack_entry(stack, i);
+		kmsan_unpoison_memory(&frame, sizeof(frame));
+		stack_trace_print(&frame, 1, 0);
+	}
 }
 EXPORT_SYMBOL_GPL(stack_depot_print);
 
@@ -843,9 +908,23 @@ int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
 		       int spaces)
 {
 	struct stack_record *stack = depot_print_fetch(handle);
+	unsigned int generated, total = 0;
+	unsigned long frame;
 
-	return stack ? stack_trace_snprint(buf, size, stack->entries,
-					   stack->size, spaces) : 0;
+	if (!stack)
+		return 0;
+	for (unsigned int i = 0; i < stack->size && size; i++) {
+		frame = depot_stack_entry(stack, i);
+		kmsan_unpoison_memory(&frame, sizeof(frame));
+		generated = stack_trace_snprint(buf, size, &frame, 1, spaces);
+		total += generated;
+		/* Stop once @buf is full, as stack_trace_snprint() does. */
+		if (generated >= size)
+			break;
+		buf += generated;
+		size -= generated;
+	}
+	return total;
 }
 EXPORT_SYMBOL_GPL(stack_depot_snprint);
 
diff --git a/lib/tests/stackdepot_kunit.c b/lib/tests/stackdepot_kunit.c
index dc3f8e207bdd..abcc34844125 100644
--- a/lib/tests/stackdepot_kunit.c
+++ b/lib/tests/stackdepot_kunit.c
@@ -152,6 +152,98 @@ static void stackdepot_frame_arm64(struct kunit *test)
 }
 #endif /* CONFIG_ARM64 */
 
+#if (defined(CONFIG_X86_64) && !defined(CONFIG_UML)) || defined(CONFIG_ARM64)
+#define STACKDEPOT_TEST_COMPRESSED
+
+/* Return a distinct compressible frame for each @i. */
+static unsigned long stackdepot_compressible_frame(unsigned int i)
+{
+#ifdef CONFIG_ARM64
+	return stackdepot_arm64_frame(0x1000L * (i + 1));
+#else
+	return 0xffffffff81000000UL + 0x1000UL * (i + 1);
+#endif
+}
+
+/* Return a frame that cannot be compressed but has the same 32-bit payload. */
+static unsigned long stackdepot_raw_frame(unsigned int i)
+{
+#ifdef CONFIG_ARM64
+	return stackdepot_compressible_frame(i) + BIT_ULL(32);
+#else
+	return stackdepot_compressible_frame(i) & U32_MAX;
+#endif
+}
+
+static void stackdepot_compressed_frames(struct kunit *test)
+{
+	unsigned long compressible[3], mixed[3], fetched[3];
+	depot_stack_handle_t compressed_handle, mixed_handle;
+	struct stack_record *record;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(compressible); i++)
+		compressible[i] = stackdepot_compressible_frame(0x100 + i);
+	memcpy(mixed, compressible, sizeof(mixed));
+	mixed[1] = stackdepot_raw_frame(0x101);
+
+	KUNIT_ASSERT_EQ(test, stack_depot_init(), 0);
+
+	compressed_handle = stack_depot_save(compressible,
+					     ARRAY_SIZE(compressible), GFP_KERNEL);
+	KUNIT_ASSERT_NE(test, compressed_handle, (depot_stack_handle_t)0);
+	mixed_handle = stack_depot_save(mixed, ARRAY_SIZE(mixed), GFP_KERNEL);
+	KUNIT_ASSERT_NE(test, mixed_handle, (depot_stack_handle_t)0);
+	/* Equal payloads must not make different stacks compare equal. */
+	KUNIT_EXPECT_NE(test, compressed_handle, mixed_handle);
+	KUNIT_EXPECT_EQ(test, stack_depot_save(compressible, ARRAY_SIZE(compressible),
+					       GFP_KERNEL), compressed_handle);
+
+	record = __stack_depot_get_stack_record(compressed_handle);
+	KUNIT_ASSERT_NOT_NULL(test, record);
+	KUNIT_EXPECT_TRUE(test, record->flags & STACK_RECORD_COMPRESSED);
+	record = __stack_depot_get_stack_record(mixed_handle);
+	KUNIT_ASSERT_NOT_NULL(test, record);
+	KUNIT_EXPECT_FALSE(test, record->flags & STACK_RECORD_COMPRESSED);
+
+	KUNIT_EXPECT_EQ(test, stack_depot_fetch_into(compressed_handle, fetched,
+						     ARRAY_SIZE(fetched)),
+			(unsigned int)ARRAY_SIZE(compressible));
+	KUNIT_EXPECT_MEMEQ(test, fetched, compressible, sizeof(compressible));
+	KUNIT_EXPECT_EQ(test, stack_depot_fetch_into(mixed_handle, fetched,
+						     ARRAY_SIZE(fetched)),
+			(unsigned int)ARRAY_SIZE(mixed));
+	KUNIT_EXPECT_MEMEQ(test, fetched, mixed, sizeof(mixed));
+}
+
+/* Evictable records are max-size, so their frames are not compressed. */
+static void stackdepot_get_record_not_compressed(struct kunit *test)
+{
+	unsigned long entries[3], fetched[3];
+	depot_stack_handle_t handle;
+	struct stack_record *record;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(entries); i++)
+		entries[i] = stackdepot_compressible_frame(0x200 + i);
+
+	KUNIT_ASSERT_EQ(test, stack_depot_init(), 0);
+
+	handle = stack_depot_save_flags(entries, ARRAY_SIZE(entries), GFP_KERNEL,
+					STACK_DEPOT_FLAG_CAN_ALLOC |
+					STACK_DEPOT_FLAG_GET);
+	KUNIT_ASSERT_NE(test, handle, (depot_stack_handle_t)0);
+	record = __stack_depot_get_stack_record(handle);
+	KUNIT_ASSERT_NOT_NULL(test, record);
+	KUNIT_EXPECT_FALSE(test, record->flags & STACK_RECORD_COMPRESSED);
+	KUNIT_EXPECT_EQ(test, stack_depot_fetch_into(handle, fetched,
+						     ARRAY_SIZE(fetched)),
+			(unsigned int)ARRAY_SIZE(entries));
+	KUNIT_EXPECT_MEMEQ(test, fetched, entries, sizeof(entries));
+	stack_depot_put(handle);
+}
+#endif
+
 /* stack_depot_snprint() must match stack_trace_snprint(), with truncation. */
 static void stackdepot_snprint_matches_stack_trace(struct kunit *test)
 {
@@ -162,8 +254,13 @@ static void stackdepot_snprint_matches_stack_trace(struct kunit *test)
 	char *got, *want;
 	unsigned int i;
 
-	for (i = 0; i < nr; i++)
+	for (i = 0; i < nr; i++) {
+#ifdef STACKDEPOT_TEST_COMPRESSED
+		entries[i] = stackdepot_compressible_frame(0x300 + i);
+#else
 		entries[i] = 0x301000UL + 0x1000UL * i;
+#endif
+	}
 	got = kunit_kzalloc(test, size, GFP_KERNEL);
 	want = kunit_kzalloc(test, size, GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, got);
@@ -195,6 +292,10 @@ static struct kunit_case stackdepot_test_cases[] = {
 #endif
 #ifdef CONFIG_ARM64
 	KUNIT_CASE(stackdepot_frame_arm64),
+#endif
+#ifdef STACKDEPOT_TEST_COMPRESSED
+	KUNIT_CASE(stackdepot_compressed_frames),
+	KUNIT_CASE(stackdepot_get_record_not_compressed),
 #endif
 	{}
 };
-- 
2.43.0

