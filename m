Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276988;
	b=dlYD676lXqRvSVx3yWTe59qVCQLXp8333jGhy9fhTPAigq2qCExEC6V2M5pXVr1aHqO7
	 4+4/hR0g61f6/Vf7HaNMBnuCAY6riU8wbwE1NZlRYlS/rdoB9qiGM24vvMRGEnt2qCWk+
	 YEvjXXbe6ZojgqDDgtNbN7W3SZHXFKwmUlw1zV4AoZqD/sCVgkGhMOC5vr9RBOrOAE27F
	 WhHOyPPjD4nb/ZOIHimS4FRl9g3J/P/m4CY1v30NkvMbv6A2vDQMk78zKyKq7cNNqPYYN
	 DcFSLpK1KbRSkafP9dkVfh7NPvaqw1sRs096JEm0Xk5L9HzPTtF+AMs4SsJefnAqNyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t5iHwKqCBQH6cGu8i0WtqCh8MXIsDvoUDWbirdC0v3I=;
	b=B/3CGiTbdlYMcCZK4KCVKoYYsH1YbpMlgiDo6/R4YW6misJipMiL3Bj9ErQ042cIhTmN
	 8M5ScxOOQYfrbYtrhstTUSHhCJ2UOvl+Z3+tUeXNGb8sShG5eNjcHNMJGI41ewKdHiHIJ
	 nljcTCRq3CH/Zn60jryvsXGzKIWS3aEhfi7HgQD7OIcMoUaPWfasY7LuvSA71KaO3lhp2
	 fLAU9Hb2AQ4BFIRrOIVrG6OmtjSvPBlixRYkgAbYTW3Q8lip/9CioYtbzeHqMJl/pXIET
	 YP7Y43+dEU19ak9IQpiD+WN9bIwYSoMkHLjRKwvnoxFniApXxOGzTe1fWI7CDP9KabA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGvmsVH2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCC2606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CCC2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGvmsVH2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so13237155e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276987; x=1794881787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t5iHwKqCBQH6cGu8i0WtqCh8MXIsDvoUDWbirdC0v3I=;
        b=LGvmsVH2kb5LvFBz93PKj99CSkDIVjp5oSn6zmzfU0Lz4RHK9c5OtBlHkMrkD3HEKT
         zo0Hp/rb3EHAW7cJ6a4LmjHBGkdU6sOn47npTN7cz2TebjA7A7sMCYfhF9QdI6B0X1AW
         HuL8R95+F4oA47yVZc9L8Rs6S2umQfFKIzYdk3l6KOBkMzMwhzeEVFttVGpYFpQKRfKU
         T4B093S9p1fQ+1hC3P6yko6dDMhrVNUElDhGiEEQCNSwypwQLpo4y9W1VxC2hmjbJVCN
         dOLeGSIUDsVVSk8bQqU4occzpYU87YM34r2ILcgCdyRWRI7VeAZ8zzSiBv+KOdBr0rXe
         MPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276987; x=1794881787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5iHwKqCBQH6cGu8i0WtqCh8MXIsDvoUDWbirdC0v3I=;
        b=Z1ByA9Qw9JWiEsCd4vSkPqKL7QnvlNxkMsmpnBa6aIzsPH9RhUmWr9M2lDiPw8HHSs
         i983m3cNZ0QbbTaDilK9GbhcZXiuLKMfRcxtLoHjP9JmZL4Zs3aWY45aQ2JUn6ubWZzH
         fuSDNt5XRbHVxB1nvIi6DshB3pnFFnQ1ISOQlgEGgTXgiBKmfCgXjgGgSaHLbe3CGnc8
         mPzV5JIHL1lruDkqUg94BqSsx+KB3MxkcAbdtOH6EgwhrcTBDqT4S1uFLKdrUGcsOATr
         NxQ8DGEK6Vvh6MKZ4SmUR5DgeTxO4WKTE0pY1O3U7kIXOuQAHViRnXoGc9g7KUfijQf0
         Fg7w==
X-Forwarded-Encrypted: i=1; AL+hErEO83o1nomN4GqcwNmQZfkEL96AWohAyv+YuXcUX251YRRD/HmnfQZAkdMSCWihPIyBYCECRVxbOsGXWPQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kkpUeGmvrRNXXsOrueWAXL9lrYseyA8qB/e1WETX/ps5yP3HA
	X/n89Q1OiPddyWCKZq90kGKKtlnde3rb5Yf0GbfGoysR1y1qXgMVkIez
X-Gm-Gg: AYBFou3Na227NfMHAacxhet/HXA855yAsxGu0b9i8Av0wN15Y/p6nZtvr841fHTIwZ8
	8avXepCxtx00VLvuac9d5BL8Kz8tGZ1ME+FsHMN5hK/XIpcxPyHfGWIFwCOkyrePX28zpwKljMb
	dZZLkJUN+EtKgKwerZvNFSOaFZmVFGxsMIGsph01oTqmTyJBCt6JdvpXlBhIXGqhC/vKU/kjpvO
	kShF0rI+qJ2/0veRZD9i788Gg1RcSs4v1Uqz3D+89RdGYv3P9uDxBWgWKWQgfm7AzzeT01feZJ7
	DoyrwDbHPagxWTDfkpJOfbzXbb+mTgfhgxC1fBs3Fsb2QD3xjpH4RJd+xerpJNqXKD/8ExbdO/n
	vxj1o+UHFwJEB8HwmxQ9Codsls2DDFf/I/SxtJbcuVT7act0cQmkPWGYsUQKua/QNO38HDYwwDx
	ScxF8BBIK1FpzP3GYGAGUupf0lURrbseTtuYv/1p+DIZDEAOSfwLdCAVuXTxWQeJH/J1RU7KolK
	M7NmzvG3AFT7vcaBntY2pjCavTeKy7Bcv1W8IDUOQpbpRAGrJRqXmyHfabaXv+VBjRON73xCLC8
	wgbRutgzLVWCtBpwWEECa+gIhL0kZVCL3jjBEuOmLj7mAsYxQyay6kiUL3M/RIYskg==
X-Received: by 2002:a05:600c:8b58:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ba02349ddcmr13740545e9.24.1794276986688;
        Mon, 09 Nov 2026 18:16:26 -0800 (PST)
Received: from asahi.teknoraver.net ([195.182.211.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba023690f5sm20124365e9.3.2026.11.09.18.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:16:26 -0800 (PST)
From: Matteo Croce <technoboy85@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7] kunit: memcpy: Add benchmark
Date: Tue, 10 Nov 2026 03:16:22 +0100
Message-ID: <20261110021622.122490-1-technoboy85@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Add optional benchmarks for memcpy() and memmove(), enabled with
CONFIG_MEMCPY_KUNIT_BENCHMARK.

Each function is run over several buffer sizes, up to 4 MiB, with both
aligned and unaligned buffers, to spot platforms where unaligned
accesses have a noticeable performance impact.

The copy length is hidden from the compiler, so the architecture's
out-of-line implementation is always measured rather than an inlined
constant-size copy.

Sample output on a RISC-V machine:
	# modprobe memcpy_kunit
	KTAP version 1
	1..1
	    KTAP version 1
	    # Subtest: memcpy
	    # module: memcpy_kunit
	    1..8
	    [...]
	    # memcpy_bench_test: memcpy: aligned copy of len 2: 3 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 2: 4 MB/s
	    # memcpy_bench_test: memcpy: aligned copy of len 64: 127 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 64: 117 MB/s
	    # memcpy_bench_test: memcpy: aligned copy of len 256: 508 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 256: 542 MB/s
	    # memcpy_bench_test: memcpy: aligned copy of len 4194304: 848 MB/s
	    # memcpy_bench_test: memcpy: unaligned copy of len 4194304: 699 MB/s
	    # memcpy_bench_test.speed: slow
	    ok 7 memcpy_bench_test
	    # memmove_bench_test: memmove: aligned move of len 64: 121 MB/s
	    # memmove_bench_test: memmove: unaligned move of len 64: 104 MB/s
	    # memmove_bench_test: memmove: aligned move of len 256: 445 MB/s
	    # memmove_bench_test: memmove: unaligned move of len 256: 410 MB/s
	    # memmove_bench_test: memmove: aligned move of len 4194304: 1419 MB/s
	    # memmove_bench_test: memmove: unaligned move of len 4194304: 1360 MB/s
	    # memmove_bench_test.speed: slow
	    ok 8 memmove_bench_test
	# memcpy: pass:8 fail:0 skip:0 total:8
	# Totals: pass:8 fail:0 skip:0 total:8
	ok 1 memcpy

Signed-off-by: Matteo Croce <technoboy85@gmail.com>
---
v6 -> v7:
- subject: "KUnit: memcpy: add benchmark" -> "kunit: memcpy: Add benchmark"
- memmove: make the aligned case actually aligned
- fix int overflow in throughput calculation, cap max size to 4 MiB
- hide copy length from the compiler (OPTIMIZER_HIDE_VAR)
- always register the bench cases, kunit_skip() when disabled
- Kconfig: move under MEMCPY_KUNIT_TEST, reword prompt and help
- update sample output

v6: https://lore.kernel.org/all/20260302023052.73943-1-teknoraver@meta.com/

 lib/Kconfig.debug        |  12 ++++
 lib/tests/memcpy_kunit.c | 120 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 6b24a2c89b84..7884a9a0f78f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3006,6 +3006,18 @@ config MEMCPY_KUNIT_TEST
 
 	  If unsure, say N.
 
+config MEMCPY_KUNIT_BENCHMARK
+	bool "Benchmark memcpy() and memmove() functions at runtime"
+	depends on MEMCPY_KUNIT_TEST
+	help
+	  Adds benchmark cases to the memcpy KUnit test suite, measuring
+	  the throughput of memcpy() and memmove() over several buffer
+	  sizes, with both aligned and unaligned buffers. This helps to
+	  spot architectures where unaligned accesses have a noticeable
+	  performance impact. Results are printed in the KUnit log.
+
+	  If unsure, say N.
+
 config MIN_HEAP_KUNIT_TEST
 	tristate "Min heap test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/memcpy_kunit.c b/lib/tests/memcpy_kunit.c
index d36933554e46..7b7103a72ada 100644
--- a/lib/tests/memcpy_kunit.c
+++ b/lib/tests/memcpy_kunit.c
@@ -11,6 +11,7 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
@@ -493,6 +494,123 @@ static void memmove_overlap_test(struct kunit *test)
 	}
 }
 
+#define COPIES_NUM	100
+#define BENCH_MAX_SIZE	min_t(size_t, SZ_4M, KMALLOC_MAX_SIZE)
+
+static void memcpy_bench_size_align(struct kunit *test, int size, bool unalign)
+{
+	u64 start, end, total_ns = 0;
+	char *dst, *src;
+	int ret = 0;
+
+	/* Prevent constant-size inlining: always call the arch memcpy() */
+	OPTIMIZER_HIDE_VAR(size);
+
+	dst = kzalloc(size, GFP_KERNEL);
+	if (!dst) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	src = kzalloc(size, GFP_KERNEL);
+	if (!src) {
+		ret = -ENOMEM;
+		goto out_free;
+	}
+
+	for (int i = 0; i < COPIES_NUM; i++) {
+		local_irq_disable();
+		start = ktime_get_ns();
+		memcpy(dst + unalign, src, size - unalign);
+		end = ktime_get_ns();
+		local_irq_enable();
+		total_ns += end - start;
+	}
+
+	/* Avoid division by zero */
+	if (!total_ns)
+		total_ns = 1;
+
+	kunit_info(test, "memcpy: %saligned copy of len %d: %llu MB/s",
+		   unalign ? "un" : "", size,
+		   div64_u64((u64)COPIES_NUM * size * NSEC_PER_SEC,
+			     total_ns * 1024 * 1024));
+
+	kfree(src);
+
+out_free:
+	kfree(dst);
+
+out:
+	KUNIT_ASSERT_EQ(test, ret, 0);
+}
+
+static void memcpy_bench_size(struct kunit *test, int size)
+{
+	memcpy_bench_size_align(test, size, false);
+	memcpy_bench_size_align(test, size, true);
+}
+
+static void memcpy_bench_test(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_MEMCPY_KUNIT_BENCHMARK))
+		kunit_skip(test, "not enabled");
+
+	memcpy_bench_size(test, 2);
+	memcpy_bench_size(test, 64);
+	memcpy_bench_size(test, 256);
+	memcpy_bench_size(test, BENCH_MAX_SIZE);
+}
+
+static void memmove_bench_size_align(struct kunit *test, int size, bool unalign)
+{
+	u64 start, end, total_ns = 0;
+	char *buf;
+	/* Keep the destination word aligned in the aligned case */
+	const int shift = ALIGN(size / 10, sizeof(long));
+
+	/* Prevent constant-size inlining: always call the arch memmove() */
+	OPTIMIZER_HIDE_VAR(size);
+
+	buf = kzalloc(size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+
+	for (int i = 0; i < COPIES_NUM; i++) {
+		local_irq_disable();
+		start = ktime_get_ns();
+		memmove(buf + shift + unalign, buf, size - shift - unalign);
+		end = ktime_get_ns();
+		local_irq_enable();
+		total_ns += end - start;
+	}
+
+	if (!total_ns)
+		total_ns = 1;
+
+	kunit_info(test, "memmove: %saligned move of len %d: %llu MB/s",
+		   unalign ? "un" : "", size,
+		   div64_u64((u64)COPIES_NUM * (size - shift) * NSEC_PER_SEC,
+			     total_ns * 1024 * 1024));
+
+	kfree(buf);
+}
+
+static void memmove_bench_size(struct kunit *test, int size)
+{
+	memmove_bench_size_align(test, size, false);
+	memmove_bench_size_align(test, size, true);
+}
+
+static void memmove_bench_test(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_MEMCPY_KUNIT_BENCHMARK))
+		kunit_skip(test, "not enabled");
+
+	memmove_bench_size(test, 64);
+	memmove_bench_size(test, 256);
+	memmove_bench_size(test, BENCH_MAX_SIZE);
+}
+
 static struct kunit_case memcpy_test_cases[] = {
 	KUNIT_CASE(memset_test),
 	KUNIT_CASE(memcpy_test),
@@ -500,6 +618,8 @@ static struct kunit_case memcpy_test_cases[] = {
 	KUNIT_CASE_SLOW(memmove_test),
 	KUNIT_CASE_SLOW(memmove_large_test),
 	KUNIT_CASE_SLOW(memmove_overlap_test),
+	KUNIT_CASE_SLOW(memcpy_bench_test),
+	KUNIT_CASE_SLOW(memmove_bench_test),
 	{}
 };
 
-- 
2.56.0

