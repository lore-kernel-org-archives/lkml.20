Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B814A5C58;
	Thu, 10 Sep 2026 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054743; cv=none; b=cGTGXk3Y9wf8B22rNUnQl039q57O3B8lySj5s5S6ppV9aI9zPbJXwWkmyXWYCB16BSoAQ0RyJEe//Vn58M8p4ojaqRKnixFE1Xp0MAxCAJomN9mr2gpxgh4J6Kk245oxDdiK5XWF0KZGU8Es7SW/y5wU+/YSnbW7ok10H7vH/TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054743; c=relaxed/simple;
	bh=1ku+esdtGr3KPb674MVJ1geAkELpRvtzOO3y8XRjt9U=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ZLFlJo9HEyz3w8FlD9DegncnoZW9SCSGqlYZYduT2ko+SsDIhOMl21PgHfaZ2nGcASnMEmc+q7UJNUVOj4/QqNEPaFWq9ughsam1rYz7E9AGZCxrIv55PCjB1YBT8u9XSv5mhuhSo5MDlQgnqWgGbzjDSdo0oTumvhLZDHoalYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nesWgMMV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fCfjmWFj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nesWgMMV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fCfjmWFj"
Date: Thu, 10 Sep 2026 15:38:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789054738;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4wniOFLgmBHxu2G6rav56EzDI/WfOH2wWK5Xuyi+Ea8=;
	b=nesWgMMVCWcWqOYK6ZtRvtA9wtRQIC8xrtRCMcTaHyHD0EYdzVvZvOZZ0b+62jXvOUMa97
	SP56HXMqvruPCYxWi3v+Y2XmNLQKCXMpwJ2F//oQ3F5oQBY1W3R0MQccE0rrMP5JL27U9P
	aI0nDR6aTn0St1Kop37ApcYqM4z56oGTaQV4on77nouCnrQTcFsZKcMmPJ3uiyHbtKRvH0
	3U3MskgIV7wUbvSS/Kk1FpvUeF+ZlqgXYOaRNW21NV6XMAgNrJZAQvZLQTu1NoZ0JY5cAF
	c1bSldQPKCbZHf1xnb/OFX1FCGJ7CXh82U7K3ilHpMoUUu1VcODOjbfm1+lBrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789054738;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4wniOFLgmBHxu2G6rav56EzDI/WfOH2wWK5Xuyi+Ea8=;
	b=fCfjmWFjJKLK8I9GiDZsjUrAQm09tFWTvAu5E1VR0VnXQOzXUurBw7DSaxB9W1S6Q0FSTH
	fEnbHK/FfJvvdJDQ==
From: "tip-bot2 for Eric Biggers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] xor: Add AVX-512 optimized xor_gen()
Cc: Eric Biggers <ebiggers@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 David Laight <david.laight.linux@gmail.com>, Christoph Hellwig <hch@lst.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901145740.42337-9-ebiggers@kernel.org>
References: <20260901145740.42337-9-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178905473609.623050.10511905410497946925.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     c0a44d1745d3f209e4840b78ab75274fb74f01a0
Gitweb:        https://git.kernel.org/tip/c0a44d1745d3f209e4840b78ab75274fb74=
f01a0
Author:        Eric Biggers <ebiggers@kernel.org>
AuthorDate:    Tue, 01 Sep 2026 07:57:40 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 10 Sep 2026 07:26:19 -07:00

xor: Add AVX-512 optimized xor_gen()

Add an implementation of xor_gen() using AVX-512.

It uses 512-bit vectors, i.e. ZMM registers.  It also uses the
vpternlogq instruction to do three-input XORs when applicable.

It's enabled on x86_64 CPUs that have AVX512F && !PREFER_YMM.  In
practice that means:

    - AMD Zen 4 and later (client and server)
    - Intel Sapphire Rapids and later (server)
    - Intel Rocket Lake (client)
    - Intel Nova Lake and later (client)

The !PREFER_YMM condition excludes the older AVX-512 implementations in
Intel Skylake Server and Intel Ice Lake.  They could run this code, but
they're known to have overly-eager downclocking when ZMM registers are
used.  This is the same policy that the crypto and CRC code uses.

Results from xor_benchmark on AMD Ryzen 9 9950X (Zen 5):

Before:

    # xor_benchmark:           	 4096 bytes	16384 bytes
    # xor_benchmark:   4 disks:	  256  GB/s	  185  GB/s
    # xor_benchmark:   5 disks:	  233  GB/s	  165  GB/s
    # xor_benchmark:   6 disks:	  243  GB/s	  174  GB/s
    # xor_benchmark:   7 disks:	  244  GB/s	  176  GB/s
    # xor_benchmark:   8 disks:	  265  GB/s	  179  GB/s
    # xor_benchmark:  10 disks:	  249  GB/s	  175  GB/s
    # xor_benchmark:  12 disks:	  219  GB/s	  173  GB/s
    # xor_benchmark:  15 disks:	  206  GB/s	  177  GB/s
    # xor_benchmark:  16 disks:	  212  GB/s	  180  GB/s
    # xor_benchmark:  32 disks:	  193  GB/s	  177  GB/s

After:

    # xor_benchmark:           	 4096 bytes	16384 bytes
    # xor_benchmark:   4 disks:	  492  GB/s	  202  GB/s
    # xor_benchmark:   5 disks:	  436  GB/s	  191  GB/s
    # xor_benchmark:   6 disks:	  466  GB/s	  193  GB/s
    # xor_benchmark:   7 disks:	  491  GB/s	  194  GB/s
    # xor_benchmark:   8 disks:	  513  GB/s	  205  GB/s
    # xor_benchmark:  10 disks:	  454  GB/s	  199  GB/s
    # xor_benchmark:  12 disks:	  330  GB/s	  204  GB/s
    # xor_benchmark:  15 disks:	  266  GB/s	  198  GB/s
    # xor_benchmark:  16 disks:	  243  GB/s	  177  GB/s
    # xor_benchmark:  32 disks:	  187  GB/s	  165  GB/s

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: David Laight <david.laight.linux@gmail.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Christoph Hellwig <hch@lst.de>
Link: https://patch.msgid.link/20260901145740.42337-9-ebiggers@kernel.org
---
 lib/raid/xor/Makefile         |   2 +-
 lib/raid/xor/x86/xor-avx512.c | 122 +++++++++++++++++++++++++++++++++-
 lib/raid/xor/x86/xor_arch.h   |  30 +++++---
 3 files changed, 143 insertions(+), 11 deletions(-)
 create mode 100644 lib/raid/xor/x86/xor-avx512.c

diff --git a/lib/raid/xor/Makefile b/lib/raid/xor/Makefile
index 9b0fad4..e1e3455 100644
--- a/lib/raid/xor/Makefile
+++ b/lib/raid/xor/Makefile
@@ -31,7 +31,7 @@ xor-$(CONFIG_SPARC32)		+=3D sparc/xor-sparc32.o
 xor-$(CONFIG_SPARC64)		+=3D sparc/xor-sparc64.o sparc/xor-sparc64-glue.o
 xor-$(CONFIG_S390)		+=3D s390/xor.o
 xor-$(CONFIG_X86_32)		+=3D x86/xor-avx.o x86/xor-sse.o x86/xor-mmx.o
-xor-$(CONFIG_X86_64)		+=3D x86/xor-avx.o x86/xor-sse.o
+xor-$(CONFIG_X86_64)		+=3D x86/xor-avx.o x86/xor-sse.o x86/xor-avx512.o
 obj-y				+=3D tests/
=20
 CFLAGS_xor-neon.o		+=3D $(CC_FLAGS_FPU) -I$(src)/$(SRCARCH)
diff --git a/lib/raid/xor/x86/xor-avx512.c b/lib/raid/xor/x86/xor-avx512.c
new file mode 100644
index 0000000..c11d834
--- /dev/null
+++ b/lib/raid/xor/x86/xor-avx512.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AVX-512 optimized implementation of xor_gen()
+ *
+ * Copyright 2026 Google LLC
+ */
+
+#include <linux/types.h>
+#include <asm/fpu/api.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
+
+/*
+ * Implementation notes:
+ *
+ * Unrolling by the number of buffers (2-5) is very important.
+ *
+ * Unrolling by length is less important, especially when using register-ind=
exed
+ * addressing with negative indices from the end of the buffers.  That appro=
ach
+ * results in just two loop control instructions being needed per iteration,
+ * regardless of the number of buffers.
+ *
+ * In fact, benchmarks showed that the 2 and 3 buffer cases require only 2x
+ * unrolling by length, while the 4 and 5 buffer cases don't require any
+ * unrolling by length.  Benchmarks also showed that the register-indexed
+ * addressing isn't a bottleneck either; i.e., we can't do any better by
+ * incrementing the pointers as we go along, even with more unrolling.
+ */
+
+static void xor_avx512_2(long bytes, u8 *p1, const u8 *p2)
+{
+	long i =3D -bytes;
+
+	asm volatile("1: vmovdqa64 (%1,%0), %%zmm0\n"
+		     "vmovdqa64 64(%1,%0), %%zmm1\n"
+		     "vpxorq (%2,%0), %%zmm0, %%zmm0\n"
+		     "vpxorq 64(%2,%0), %%zmm1, %%zmm1\n"
+		     "vmovdqa64 %%zmm0, (%1,%0)\n"
+		     "vmovdqa64 %%zmm1, 64(%1,%0)\n"
+		     "add $128, %0\n"
+		     "jnz 1b\n"
+		     : "+&r"(i)
+		     : "r"(p1 + bytes), "r"(p2 + bytes)
+		     : "memory", "cc");
+}
+
+static void xor_avx512_3(long bytes, u8 *p1, const u8 *p2, const u8 *p3)
+{
+	long i =3D -bytes;
+
+	asm volatile("1: vmovdqa64 (%1,%0), %%zmm0\n"
+		     "vmovdqa64 64(%1,%0), %%zmm1\n"
+		     "vmovdqa64 (%2,%0), %%zmm2\n"
+		     "vmovdqa64 64(%2,%0), %%zmm3\n"
+		     "vpternlogq $0x96, (%3,%0), %%zmm2, %%zmm0\n"
+		     "vpternlogq $0x96, 64(%3,%0), %%zmm3, %%zmm1\n"
+		     "vmovdqa64 %%zmm0, (%1,%0)\n"
+		     "vmovdqa64 %%zmm1, 64(%1,%0)\n"
+		     "add $128, %0\n"
+		     "jnz 1b\n"
+		     : "+&r"(i)
+		     : "r"(p1 + bytes), "r"(p2 + bytes), "r"(p3 + bytes)
+		     : "memory", "cc");
+}
+
+static void xor_avx512_4(long bytes, u8 *p1, const u8 *p2, const u8 *p3,
+			 const u8 *p4)
+{
+	long i =3D -bytes;
+
+	asm volatile("1: vmovdqa64 (%1,%0), %%zmm0\n"
+		     "vmovdqa64 (%2,%0), %%zmm1\n"
+		     "vpxorq (%3,%0), %%zmm0, %%zmm0\n"
+		     "vpternlogq $0x96, (%4,%0), %%zmm1, %%zmm0\n"
+		     "vmovdqa64 %%zmm0, (%1,%0)\n"
+		     "add $64, %0\n"
+		     "jnz 1b\n"
+		     : "+&r"(i)
+		     : "r"(p1 + bytes), "r"(p2 + bytes), "r"(p3 + bytes),
+		       "r"(p4 + bytes)
+		     : "memory", "cc");
+}
+
+static void xor_avx512_5(long bytes, u8 *p1, const u8 *p2, const u8 *p3,
+			 const u8 *p4, const u8 *p5)
+{
+	long i =3D -bytes;
+
+	asm volatile("1: vmovdqa64 (%1,%0), %%zmm0\n"
+		     "vmovdqa64 (%2,%0), %%zmm1\n"
+		     "vpternlogq $0x96, (%3,%0), %%zmm1, %%zmm0\n"
+		     "vmovdqa64 (%4,%0), %%zmm1\n"
+		     "vpternlogq $0x96, (%5,%0), %%zmm1, %%zmm0\n"
+		     "vmovdqa64 %%zmm0, (%1,%0)\n"
+		     "add $64, %0\n"
+		     "jnz 1b\n"
+		     : "+&r"(i)
+		     : "r"(p1 + bytes), "r"(p2 + bytes), "r"(p3 + bytes),
+		       "r"(p4 + bytes), "r"(p5 + bytes)
+		     : "memory", "cc");
+}
+
+DO_XOR_BLOCKS(avx512_inner, xor_avx512_2, xor_avx512_3, xor_avx512_4,
+	      xor_avx512_5);
+
+/*
+ * Preconditions: bytes is a nonzero multiple of 512, and all buffers are
+ * 64-byte aligned.
+ */
+static void xor_gen_avx512(void *dest, void **srcs, unsigned int src_cnt,
+			   unsigned int bytes)
+{
+	kernel_fpu_begin();
+	xor_gen_avx512_inner(dest, srcs, src_cnt, bytes);
+	asm volatile("vzeroupper");
+	kernel_fpu_end();
+}
+
+struct xor_block_template xor_block_avx512 =3D {
+	.name =3D "avx512",
+	.xor_gen =3D xor_gen_avx512,
+};
diff --git a/lib/raid/xor/x86/xor_arch.h b/lib/raid/xor/x86/xor_arch.h
index 991abe3..ed5921d 100644
--- a/lib/raid/xor/x86/xor_arch.h
+++ b/lib/raid/xor/x86/xor_arch.h
@@ -6,21 +6,31 @@ extern struct xor_block_template xor_block_p5_mmx;
 extern struct xor_block_template xor_block_sse;
 extern struct xor_block_template xor_block_sse_pf64;
 extern struct xor_block_template xor_block_avx;
+extern struct xor_block_template xor_block_avx512;
=20
-/*
- * When SSE is available, use it as it can write around L2.  We may also be =
able
- * to load into the L1 only depending on how the cpu deals with a load to a =
line
- * that is being prefetched.
- *
- * When AVX2 is available, force using it as it is better by all measures.
- *
- * 32-bit without MMX can fall back to the generic routines.
- */
 static __always_inline void __init arch_xor_init(void)
 {
-	if (boot_cpu_has(X86_FEATURE_AVX)) {
+	if (IS_ENABLED(CONFIG_X86_64) && boot_cpu_has(X86_FEATURE_AVX512F) &&
+	    !boot_cpu_has(X86_FEATURE_PREFER_YMM)) {
+		/*
+		 * Use the AVX-512 code on CPUs that support AVX-512 without
+		 * overly-eager downclocking.  On such CPUs the AVX-512 code
+		 * should always work at least as well as the AVX code, so
+		 * runtime selection is unnecessary.
+		 *
+		 * The AVX-512 code can work on X86_32.  However, due to lack of
+		 * use case for that, for now it's built only for X86_64.
+		 */
+		xor_force(&xor_block_avx512);
+	} else if (boot_cpu_has(X86_FEATURE_AVX)) {
+		/* AVX will be the best; no need to try others. */
 		xor_force(&xor_block_avx);
 	} else if (IS_ENABLED(CONFIG_X86_64) || boot_cpu_has(X86_FEATURE_XMM)) {
+		/*
+		 * When SSE is available, use it as it can write around L2.  We
+		 * may also be able to load into the L1 only depending on how
+		 * the cpu deals with a load to a line that is being prefetched.
+		 */
 		xor_register(&xor_block_sse);
 		xor_register(&xor_block_sse_pf64);
 	} else if (boot_cpu_has(X86_FEATURE_MMX)) {
