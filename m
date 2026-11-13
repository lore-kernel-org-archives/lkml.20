Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596241;
	b=OHSyLkXFmsV+WEcRnAK6PG8+PIntQNgCKtH3ThTPFsDWyD1JcqP68T3VhWsDBO7tDuSi
	 8EKKtdqbLzfS8ISMNgI3dvWrbo3FcQz19KFAvm1ddMoSOkSZW4oV7D8bnSMx0xqcMDdj/
	 scAM9/D/8AZ/Zdv34OkfK4E0iNlWnsnUWlfeb3dQMT0cj8ZBHLbxOafoG6J9y55ZYJe/g
	 CGOObumYgPUDBlbuCOptPqtEwcl88gCUgoWRg7eDk0FX/t8RoWG2UxnYpd8KMVsvmlOxd
	 2KZciiOTawXHf8kZjmYfKhPyWlPsDyVwR7UWdUDcPC6cnieoPEpSHs1nx+nuSSc88kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gMf8yUDJzGPEGi0squc2iKfzOrQ0w86CHit/17hkkFQ=;
	b=o6Ec/G90F+4MYAyBtCG7NPVwQ4DJuNUR/7BEOOkXrIbIm6xWLHvutQ0xdmQ4GzBlKzv5
	 PN3VxCaYKBqNYMmYNV0SeVzc/+ND51ydkynKwUA7Kvjnb96127+ODT5YyQq6lr4GGyebD
	 BpH5sevbdMNts06nN7s2Z75qzd9nLTeKTlFv5ZvzG5URzjhprnpC7tqDDyvoRXPN/RDNq
	 4DmHa/6g3OmEMintLtSg1wL/UYR+pQtR6tpC9RI7hm8YIILvvqjGk5dtTO0QR/4dpBdje
	 tCb4iFpyUXTe9B6TLrNM7T7uv0C2KdLywTAVSStSkQ7MxYBP5zAiIhyKjqKm8UoBxUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=readmodwrite.com;
	spf=none smtp.mailfrom=readmodwrite.com;
	dkim=pass header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aBgAz4Vx;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9408D606E36C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9408D606E36C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20260707.gappssmtp.com header.i=@readmodwrite-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aBgAz4Vx
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49a92144733so530449f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20260707.gappssmtp.com; s=20260707; t=1794596239; x=1795201039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMf8yUDJzGPEGi0squc2iKfzOrQ0w86CHit/17hkkFQ=;
        b=aBgAz4VxqHknzF6DdxLIbWPmEgI+iMTUxWbrQLtWO4bfMSttmtXgPbqy60D2WJ1iux
         7CxgzKSLnFXSnPmyvEMwImvgfqxLcxF37/mvH2oS4USbV3eMBoPt6hFjaVZ6Uo7WuK+p
         yjEzu7hDFiNmd/TR0dcDTtnVt9ki2xY10P/a+xaP4kXa39JOG6eKNpRcuYowCyMUQn7m
         aJI5mFYP3z/nl3lNV5nJtAEYYagPIPfBMMLfxxzz9do796UtizrEIEYg54yjg0WG9Jbk
         G2KLyuo7j7aFxvM6cxvFGQ1TukCMxo6bGWSSpAF7Du0cyEW1ZlSb0z9rdePFLuQ9EKDh
         X83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596239; x=1795201039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMf8yUDJzGPEGi0squc2iKfzOrQ0w86CHit/17hkkFQ=;
        b=J8IseZX3W8rEv8LS4nYsfJpSz8+gv/j2sSWt+3NIAosp0sQ0pT0jpXqA2rYWAAKxlZ
         IauXi0TCg+4hw46CzM+h/fG0r3PKX/PHsSJWQNRMqKSHPYz589FN6FoRZQy1+zEgoajQ
         3bmkGfS9HhJCGlWJCkL6EnxMhklfYwbpk7mrhoGl5D80F1wI+KWBEGW3kfnqt9UColPT
         i2L6olCos/DwC/Trme9tvZ/p4qq6HRUM+tqYsxgOTX/fHHiMnGmCwNHL3bp6zU8FKA31
         EXB7Dq9cPkbecx01UY2Rt2YA8nWRuRzsLNF3oXqSkLpc5RebwTLNAVo//8ezxu4FxpAZ
         jWEw==
X-Forwarded-Encrypted: i=1; AL+hErEzX7+Z2msF0PE32/22Zox/DU7MGTDt9NckRO8GeNa3dDjYeL2sQdsJ3TcSb1HMHbJ3+eo66crZHRDf2ms=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G0GJH3r3UlG2QODLXL01WDnLPPlM0t5a1XxMSjPWtrhkm3Cqk
	l75QCKhFnY3OKdDSINYq3JSke3+14PMChLYvSFeM2WsUkVTFVUlwL3Tse4/OQZpAgyg=
X-Gm-Gg: AYBFou1xepQfWLGADW5as/v/Y24XmQiHKcdSYs0JhtrUU/UOAsX0Sxw6vf2A0YZFXKn
	of4z91r6rUdWBdnHuKXibR9e+TYn/PBM22+0/+aAAkY5wnAq0TcUY9Pk3hqoB87Ra8kipuFe3Zo
	QWCGRusZUjgpSuKfPqDCyauYBe9pNHq4qubXtwOlEOIVE21k8uCIo5WpDzvB6QIYN4eu2dubfsV
	EC4hezG7ltNuAWALHSNJAnILGs8ilMxiYQmXERorMS4PwqVQfHmIqDICieQ36Hui/hDW+fs/eIf
	ClpFBcCaBL1YM5F4hjNhJhiy5j385+Pth1ZEL6NWMz9EIav5hIGSrnVGU4sJ/dWMXd3f+GLpBgD
	lOmkiQNVjO2NE7hP7sALIZLmAZAEFKQCaG/DmEAhADx3vysQvUB8yaMPT40NkReDp/zLWBDshd2
	corbP+GntsjTQ9nbhfnZ2I/YxJ97+BjirhHuZVrb7GIXPoSOThsG1tdGTcBi1WMGWcKgzQMw6In
	1CmHu4JMaplcnZdPtD1mhbHTuMbfan9GUp6LwYymTUZSMKXxzqViLDkKO4MMfZOm56t8UyLDYhA
	HjDgI3Z21dwlgktnlLmWRWV6QN5Mhw==
X-Received: by 2002:a5d:59ca:0:b0:487:13f:f612 with SMTP id ffacd0b85a97d-49c723fb77dmr7422413f8f.37.1794596239000;
        Fri, 13 Nov 2026 10:57:19 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac6:37a8:ec8::179:1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm6417589f8f.21.2026.11.13.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:57:18 -0800 (PST)
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
Subject: [PATCH v3 08/10] stackdepot: add architecture hooks for compact frame storage
Date: Fri, 13 Nov 2026 18:57:00 +0000
Message-ID: <20261113185702.1332171-9-matt@readmodwrite.com>
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

Stack depot records can reduce their frame storage when an
architecture can represent kernel text and module addresses in 32 bits.
Add architecture hooks that compress a frame only when decompression
reproduces the original address exactly.

Store arm64 frames as signed 32-bit offsets from _text. This covers the
2 GB module relocation window without depending on a 4 GB high-bit
boundary. On x86-64, store the low 32 bits when the upper 32 bits are all
set. Keep other frames full-width, and provide a generic implementation
that always rejects compression.

Make the generic header available to architectures without a specialized
implementation and wire it explicitly for UML. Add KUnit coverage for raw
fallback, arm64 boundary round trips, and native x86-64 prefix compression.

These hooks do not change stack depot behavior until a later patch uses
them to store compressed frames.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
[mfleming: simplify arm64 decode, reworded]
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---
 arch/arm64/include/asm/stackdepot.h | 37 +++++++++++++
 arch/um/include/asm/Kbuild          |  1 +
 arch/x86/include/asm/stackdepot.h   | 37 +++++++++++++
 include/asm-generic/Kbuild          |  1 +
 include/asm-generic/stackdepot.h    | 19 +++++++
 lib/tests/stackdepot_kunit.c        | 86 +++++++++++++++++++++++++++++
 6 files changed, 181 insertions(+)
 create mode 100644 arch/arm64/include/asm/stackdepot.h
 create mode 100644 arch/x86/include/asm/stackdepot.h
 create mode 100644 include/asm-generic/stackdepot.h

diff --git a/arch/arm64/include/asm/stackdepot.h b/arch/arm64/include/asm/stackdepot.h
new file mode 100644
index 000000000000..72053527ab21
--- /dev/null
+++ b/arch/arm64/include/asm/stackdepot.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_STACKDEPOT_H
+#define __ASM_STACKDEPOT_H
+
+#include <linux/types.h>
+#include <asm/sections.h>
+
+/*
+ * Modules are allocated inside a 2 GB relocation window containing the
+ * kernel image. Store a signed 32-bit offset from _text so compression is
+ * independent of 4 GB high-bit boundaries crossed by that window.
+ */
+static inline unsigned long arch_stack_depot_frame_from_payload(u32 payload)
+{
+	return (unsigned long)_text + (s64)(s32)payload;
+}
+
+static inline bool
+arch_stack_depot_frame_try_compress(unsigned long frame, u32 *payload)
+{
+	u32 candidate;
+
+	candidate = (u32)(frame - (unsigned long)_text);
+	if (arch_stack_depot_frame_from_payload(candidate) != frame)
+		return false;
+
+	*payload = candidate;
+	return true;
+}
+
+static inline void
+arch_stack_depot_frame_decompress(u32 payload, unsigned long *frame)
+{
+	*frame = arch_stack_depot_frame_from_payload(payload);
+}
+
+#endif /* __ASM_STACKDEPOT_H */
diff --git a/arch/um/include/asm/Kbuild b/arch/um/include/asm/Kbuild
index 8fdc0bd9ab6f..14778d2457d7 100644
--- a/arch/um/include/asm/Kbuild
+++ b/arch/um/include/asm/Kbuild
@@ -21,6 +21,7 @@ generic-y += preempt.h
 generic-y += ring_buffer.h
 generic-y += runtime-const.h
 generic-y += softirq_stack.h
+generic-y += stackdepot.h
 generic-y += switch_to.h
 generic-y += topology.h
 generic-y += trace_clock.h
diff --git a/arch/x86/include/asm/stackdepot.h b/arch/x86/include/asm/stackdepot.h
new file mode 100644
index 000000000000..9a8d04fa8c1c
--- /dev/null
+++ b/arch/x86/include/asm/stackdepot.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_X86_STACKDEPOT_H
+#define _ASM_X86_STACKDEPOT_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_X86_64
+/*
+ * Compress canonical kernel text/module addresses whose upper 32 bits are all
+ * ones. Other kernel virtual addresses stay raw, so decompression reconstructs
+ * the original frame by restoring this prefix.
+ */
+#define STACK_DEPOT_X86_64_FRAME_PREFIX	0xffffffff00000000UL
+#define STACK_DEPOT_X86_64_FRAME_LOW_MASK	0x00000000ffffffffUL
+
+static inline bool
+arch_stack_depot_frame_try_compress(unsigned long frame, u32 *low)
+{
+	if ((frame & ~STACK_DEPOT_X86_64_FRAME_LOW_MASK) !=
+	    STACK_DEPOT_X86_64_FRAME_PREFIX)
+		return false;
+
+	*low = (u32)frame;
+	return true;
+}
+
+static inline void
+arch_stack_depot_frame_decompress(u32 low, unsigned long *frame)
+{
+	*frame = STACK_DEPOT_X86_64_FRAME_PREFIX | low;
+}
+
+#else
+#include <asm-generic/stackdepot.h>
+#endif /* CONFIG_X86_64 */
+
+#endif /* _ASM_X86_STACKDEPOT_H */
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index b7a388bef6ea..76d4792a325a 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -55,6 +55,7 @@ mandatory-y += serial.h
 mandatory-y += shmparam.h
 mandatory-y += simd.h
 mandatory-y += softirq_stack.h
+mandatory-y += stackdepot.h
 mandatory-y += switch_to.h
 mandatory-y += timex.h
 mandatory-y += tlbflush.h
diff --git a/include/asm-generic/stackdepot.h b/include/asm-generic/stackdepot.h
new file mode 100644
index 000000000000..846975767bdd
--- /dev/null
+++ b/include/asm-generic/stackdepot.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_GENERIC_STACKDEPOT_H
+#define __ASM_GENERIC_STACKDEPOT_H
+
+#include <linux/types.h>
+
+static inline bool
+arch_stack_depot_frame_try_compress(unsigned long frame, u32 *low)
+{
+	return false;
+}
+
+static inline void
+arch_stack_depot_frame_decompress(u32 low, unsigned long *frame)
+{
+	/* Generic code never compresses frames, so this hook is unreachable. */
+}
+
+#endif /* __ASM_GENERIC_STACKDEPOT_H */
diff --git a/lib/tests/stackdepot_kunit.c b/lib/tests/stackdepot_kunit.c
index ae4f7661a48f..dc3f8e207bdd 100644
--- a/lib/tests/stackdepot_kunit.c
+++ b/lib/tests/stackdepot_kunit.c
@@ -3,11 +3,23 @@
 #include <kunit/test.h>
 #include <linux/array_size.h>
 #include <linux/gfp.h>
+#include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/stacktrace.h>
 #include <linux/stackdepot.h>
 #include <linux/string.h>
 
+#include <asm/stackdepot.h>
+
+#ifdef CONFIG_ARM64
+#include <asm/sections.h>
+
+static inline unsigned long stackdepot_arm64_frame(long offset)
+{
+	return (unsigned long)((long)_text + offset);
+}
+#endif
+
 static void stackdepot_fetch_into_roundtrip(struct kunit *test)
 {
 	unsigned long entries[] = {
@@ -73,6 +85,73 @@ static void stackdepot_fetch_into_rejects_missing_or_short_stack(struct kunit *t
 	KUNIT_EXPECT_MEMEQ(test, fetched, expected, sizeof(expected));
 }
 
+static void stackdepot_frame_raw_fallback(struct kunit *test)
+{
+	unsigned long frame = 0x1000UL;
+	bool compressed;
+	u32 payload;
+
+#ifdef CONFIG_ARM64
+	frame = (unsigned long)_text + (unsigned long)S32_MAX + 1UL;
+#endif
+
+	compressed = arch_stack_depot_frame_try_compress(frame, &payload);
+	KUNIT_EXPECT_FALSE(test, compressed);
+}
+
+#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
+static void stackdepot_frame_x86_64(struct kunit *test)
+{
+	unsigned long direct_map = 0xffff888000001000UL;
+	unsigned long frame = 0xffffffff81234567UL;
+	unsigned long out;
+	bool compressed;
+	u32 low;
+
+	compressed = arch_stack_depot_frame_try_compress(frame, &low);
+	KUNIT_EXPECT_TRUE(test, compressed);
+	KUNIT_EXPECT_EQ(test, low, (u32)0x81234567);
+	arch_stack_depot_frame_decompress(low, &out);
+	KUNIT_EXPECT_EQ(test, out, frame);
+
+	compressed = arch_stack_depot_frame_try_compress(direct_map, &low);
+	KUNIT_EXPECT_FALSE(test, compressed);
+}
+#endif /* CONFIG_X86_64 && !CONFIG_UML */
+
+#ifdef CONFIG_ARM64
+static void stackdepot_frame_arm64(struct kunit *test)
+{
+	long negative_offset = S32_MIN;
+	long positive_offset = S32_MAX;
+	long offset = 0x123456;
+	unsigned long frame = stackdepot_arm64_frame(offset);
+	unsigned long out;
+	bool compressed;
+	u32 payload;
+
+	compressed = arch_stack_depot_frame_try_compress(frame, &payload);
+	KUNIT_EXPECT_TRUE(test, compressed);
+	KUNIT_EXPECT_EQ(test, payload, (u32)(s32)offset);
+	arch_stack_depot_frame_decompress(payload, &out);
+	KUNIT_EXPECT_EQ(test, out, frame);
+
+	frame = stackdepot_arm64_frame(negative_offset);
+	compressed = arch_stack_depot_frame_try_compress(frame, &payload);
+	KUNIT_EXPECT_TRUE(test, compressed);
+	KUNIT_EXPECT_EQ(test, payload, (u32)(s32)negative_offset);
+	arch_stack_depot_frame_decompress(payload, &out);
+	KUNIT_EXPECT_EQ(test, out, frame);
+
+	frame = stackdepot_arm64_frame(positive_offset);
+	compressed = arch_stack_depot_frame_try_compress(frame, &payload);
+	KUNIT_EXPECT_TRUE(test, compressed);
+	KUNIT_EXPECT_EQ(test, payload, (u32)(s32)positive_offset);
+	arch_stack_depot_frame_decompress(payload, &out);
+	KUNIT_EXPECT_EQ(test, out, frame);
+}
+#endif /* CONFIG_ARM64 */
+
 /* stack_depot_snprint() must match stack_trace_snprint(), with truncation. */
 static void stackdepot_snprint_matches_stack_trace(struct kunit *test)
 {
@@ -110,6 +189,13 @@ static struct kunit_case stackdepot_test_cases[] = {
 	KUNIT_CASE(stackdepot_fetch_into_roundtrip),
 	KUNIT_CASE(stackdepot_fetch_into_rejects_missing_or_short_stack),
 	KUNIT_CASE(stackdepot_snprint_matches_stack_trace),
+	KUNIT_CASE(stackdepot_frame_raw_fallback),
+#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
+	KUNIT_CASE(stackdepot_frame_x86_64),
+#endif
+#ifdef CONFIG_ARM64
+	KUNIT_CASE(stackdepot_frame_arm64),
+#endif
 	{}
 };
 
-- 
2.43.0

