Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766939;
	b=NzLo1104kH1ElvTDEkjHrFrkP8HADUpxpHi7ahjI351Gf477xnp3/O1N2rsQl2IvKSya
	 o77fZZ717rOV+372SHjaPJJx/vQDgx5IUR6yl7w5GUutIpJpElWcqqHNxqUC3aY2JSZVh
	 1iySWmVQX0M3BZQYKdcLlBbCzv39+hiOObjkwixSv9tXZ/C3y9rfxf8KE7e17gmXZ509B
	 rE8u0HQxMTX/OtIslgUyeJU1Vle6wqnomRri5afrJcHQQGTY2vgnKAz8/V4fM8YOoivk8
	 5mMO+RAde44z+ln29xNocuVWMMoPrFcDOef2k0FhVpOvsB7QMUZGQ9alzlV7q4az8sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766939;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=pMJWVNogEym8HJGxzLCBJdh24NbisfvrpyEcOzPSvJY=;
	b=yYzUk7sKPoYHKSmsbnOu4uw+6bMJqNqAsaO030BLlQSyCAt+9qZECtggjegEgptsLjVm
	 jYsnPt0Xf7mdvQbiyfvWp4I3BH6Y1aacG07lQ5Pgu8q46pb65uoL4GRIPummQCT0EvHKf
	 9groOYQnCrC3LOdTzO2Ug0ufD/rR+xvEiA+c8bGlBQ71O7hw5QN70WpbVvg2dGDN+F6ml
	 L08ubYcEQVayDusW0s6ajI8K0GCUvW87DIJSlNLUghUje67bACzSwsiWzFL32CGk/DC5P
	 Z6HKoYgsHBnnRsNateddbpdqQMlq2vzOq76ZEjEIOgntkyjtkW/5Y29THGWlc4LI4gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rzej8poz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFEC606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rzej8poz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DF81F00A02;
	Wed,  4 Nov 2026 04:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793766939;
	bh=pMJWVNogEym8HJGxzLCBJdh24NbisfvrpyEcOzPSvJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rzej8pozHCzKQ7NmIb7wP0lUNOEfSuvkXiItdFgxK+tAPPTka3S2vefF0kHO4zApu
	 m6LxuXm25jnUnbnkgwheY4hOl9vQQYaxEHABYK1PZCrRkUtNoxIi+ukG3NROCaOGK9
	 OvcD/R0WfCIMe78RS/s74PFva1nHQX5W+ObO4EEAvc09xazoFnRGiTyw2MvX5JwHCv
	 TQxHd2EuCvqVkNqWiZ4+KTNTmDxvyzbd2qfGsFg7SAmIKNNoXDg0ICiuZzPZrderud
	 zOdx0WGEqBbZdDbUY5St5Ddcdq05uvaOhuTbWS9IiYgiVkuWcL+Cx5QetGT/dCNkBw
	 48EAHstLl2skA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 2/2] ARC: io: use asm-generic MMIO accessors
Date: Tue,  3 Nov 2026 20:35:35 -0800
Message-ID: <20261104043535.2039948-3-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104043535.2039948-1-vgupta@kernel.org>
References: <20261104043535.2039948-1-vgupta@kernel.org>
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

ARC MMIO accessors use inline asm, which isn't really needed. It was
introduced with the original port back in 2013.

As the previous patch showed, inline asm can be error-prone. Letting the
compiler emit the accesses also allows 16-bit encodings, scaled-index
loads and folding constant offsets (s9) into the access.

Without the asm, ARC's __raw_{read,write}{b,w,l}(), *_relaxed(),
{read,write}{b,w,l}() and io{read,write}{16,32}be() are the same as the
asm-generic/io.h versions, so drop them and use the generic ones.

Two things stay ARC-specific:

- The barriers, now hooked into the generic accessors through
  __io_ar()/__io_bw(). On ARCv2 they remain dmb (rmb()/wmb()).
  On ARCompact they were empty, relying on the asm "memory" clobber
  as a compiler barrier, so make them barrier() explicitly.
  The generic defaults would be mb(), i.e. the heavyweight SYNC.
  The *_relaxed() accessors only need ordering against other MMIO
  accesses, which volatile guarantees.

- The {read,write}s{b,w,l}() string helpers, which, unlike the generic
  ones, cope with an unaligned memory buffer. They are defined before
  asm-generic/io.h is included, as it calls them (e.g. ioread8_rep()),
  so they do the volatile access directly rather than via __raw_*().

As a side effect, readX()/writeX() gain MMIO access tracing
(CONFIG_TRACE_MMIO_ACCESS).

vmlinux .text with GCC 16.2 (hsdk_defconfig): -5412 bytes.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
Assisted-by: Claude:claude-opus-5
---
 arch/arc/include/asm/io.h | 139 ++++++--------------------------------
 1 file changed, 19 insertions(+), 120 deletions(-)

diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
index b4a3393d1bdc..de929136c1a3 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -11,15 +11,26 @@
 #include <asm/page.h>
 #include <linux/unaligned.h>
 
-#ifdef CONFIG_ISA_ARCV2
 #include <asm/barrier.h>
+
+#ifdef CONFIG_ISA_ARCV2
 #define __iormb()		rmb()
 #define __iowmb()		wmb()
 #else
-#define __iormb()		do { } while (0)
-#define __iowmb()		do { } while (0)
+/*
+ * The accessors are plain volatile accesses, which the compiler only orders
+ * against other volatile accesses. Make readX()/writeX() compiler barriers so
+ * that e.g. DMA buffer writes are not moved past the MMIO write that starts
+ * the DMA. The asm-generic default, mb(), would be the heavyweight SYNC.
+ */
+#define __iormb()		barrier()
+#define __iowmb()		barrier()
 #endif
 
+/* Barriers for the asm-generic readX()/writeX() */
+#define __io_ar(v)		__iormb()
+#define __io_bw()		__iowmb()
+
 extern void __iomem *ioremap(phys_addr_t paddr, unsigned long size);
 #define ioremap ioremap
 #define ioremap_prot ioremap_prot
@@ -33,57 +44,6 @@ static inline void ioport_unmap(void __iomem *addr)
 {
 }
 
-/*
- * io{read,write}{16,32}be() macros
- */
-#define ioread16be(p)		({ u16 __v = be16_to_cpu((__force __be16)__raw_readw(p)); __iormb(); __v; })
-#define ioread32be(p)		({ u32 __v = be32_to_cpu((__force __be32)__raw_readl(p)); __iormb(); __v; })
-
-#define iowrite16be(v,p)	({ __iowmb(); __raw_writew((__force u16)cpu_to_be16(v), p); })
-#define iowrite32be(v,p)	({ __iowmb(); __raw_writel((__force u32)cpu_to_be32(v), p); })
-
-#define __raw_readb __raw_readb
-static inline u8 __raw_readb(const volatile void __iomem *addr)
-{
-	u8 b;
-
-	__asm__ __volatile__(
-	"	ldb%U1 %0, %1	\n"
-	: "=r" (b)
-	: "m" (*(volatile u8 __force *)addr)
-	: "memory");
-
-	return b;
-}
-
-#define __raw_readw __raw_readw
-static inline u16 __raw_readw(const volatile void __iomem *addr)
-{
-	u16 s;
-
-	__asm__ __volatile__(
-	"	ldw%U1 %0, %1	\n"
-	: "=r" (s)
-	: "m" (*(volatile u16 __force *)addr)
-	: "memory");
-
-	return s;
-}
-
-#define __raw_readl __raw_readl
-static inline u32 __raw_readl(const volatile void __iomem *addr)
-{
-	u32 w;
-
-	__asm__ __volatile__(
-	"	ld%U1 %0, %1	\n"
-	: "=r" (w)
-	: "m" (*(volatile u32 __force *)addr)
-	: "memory");
-
-	return w;
-}
-
 /*
  * {read,write}s{b,w,l}() repeatedly access the same IO address in
  * native endianness in 8-, 16-, 32-bit chunks {into,from} memory,
@@ -102,12 +62,12 @@ static inline void __raw_reads##f(const volatile void __iomem *addr,	\
 	/* Some ARC CPU's don't support unaligned accesses */		\
 	if (is_aligned) {						\
 		do {							\
-			u##t x = __raw_read##f(addr);			\
+			u##t x = *(const volatile u##t __force *)addr;	\
 			*buf++ = x;					\
 		} while (--count);					\
 	} else {							\
 		do {							\
-			u##t x = __raw_read##f(addr);			\
+			u##t x = *(const volatile u##t __force *)addr;	\
 			put_unaligned(x, buf++);			\
 		} while (--count);					\
 	}								\
@@ -120,43 +80,6 @@ __raw_readsx(16, w)
 #define __raw_readsl __raw_readsl
 __raw_readsx(32, l)
 
-#define __raw_writeb __raw_writeb
-static inline void __raw_writeb(u8 b, volatile void __iomem *addr)
-{
-	__asm__ __volatile__(
-	"	stb%U1 %0, %1	\n"
-	:
-	: "r" (b), "m" (*(volatile u8 __force *)addr)
-	: "memory");
-}
-
-#define __raw_writew __raw_writew
-static inline void __raw_writew(u16 s, volatile void __iomem *addr)
-{
-	/*
-	 * Not an "m" operand: GCC can pick a register-indexed address for it,
-	 * which ST doesn't support (GCC PR target/127718).
-	 */
-	__asm__ __volatile__(
-	"	stw %0, [%1]	\n"
-	:
-	: "r" (s), "r" (addr)
-	: "memory");
-
-}
-
-#define __raw_writel __raw_writel
-static inline void __raw_writel(u32 w, volatile void __iomem *addr)
-{
-	/* See __raw_writew() above for why this doesn't use an "m" operand. */
-	__asm__ __volatile__(
-	"	st %0, [%1]	\n"
-	:
-	: "r" (w), "r" (addr)
-	: "memory");
-
-}
-
 #define __raw_writesx(t,f)						\
 static inline void __raw_writes##f(volatile void __iomem *addr, 	\
 				   const void *ptr, unsigned int count)	\
@@ -170,11 +93,12 @@ static inline void __raw_writes##f(volatile void __iomem *addr, 	\
 	/* Some ARC CPU's don't support unaligned accesses */		\
 	if (is_aligned) {						\
 		do {							\
-			__raw_write##f(*buf++, addr);			\
+			*(volatile u##t __force *)addr = *buf++;	\
 		} while (--count);					\
 	} else {							\
 		do {							\
-			__raw_write##f(get_unaligned(buf++), addr);	\
+			u##t x = get_unaligned(buf++);			\
+			*(volatile u##t __force *)addr = x;		\
 		} while (--count);					\
 	}								\
 }
@@ -198,39 +122,14 @@ __raw_writesx(32, l)
  *
  * http://lkml.kernel.org/r/20150622133656.GG1583@arm.com
  */
-#define readb(c)		({ u8  __v = readb_relaxed(c); __iormb(); __v; })
-#define readw(c)		({ u16 __v = readw_relaxed(c); __iormb(); __v; })
-#define readl(c)		({ u32 __v = readl_relaxed(c); __iormb(); __v; })
 #define readsb(p,d,l)		({ __raw_readsb(p,d,l); __iormb(); })
 #define readsw(p,d,l)		({ __raw_readsw(p,d,l); __iormb(); })
 #define readsl(p,d,l)		({ __raw_readsl(p,d,l); __iormb(); })
 
-#define writeb(v,c)		({ __iowmb(); writeb_relaxed(v,c); })
-#define writew(v,c)		({ __iowmb(); writew_relaxed(v,c); })
-#define writel(v,c)		({ __iowmb(); writel_relaxed(v,c); })
 #define writesb(p,d,l)		({ __iowmb(); __raw_writesb(p,d,l); })
 #define writesw(p,d,l)		({ __iowmb(); __raw_writesw(p,d,l); })
 #define writesl(p,d,l)		({ __iowmb(); __raw_writesl(p,d,l); })
 
-/*
- * Relaxed API for drivers which can handle barrier ordering themselves
- *
- * Also these are defined to perform little endian accesses.
- * To provide the typical device register semantics of fixed endian,
- * swap the byte order for Big Endian
- *
- * http://lkml.kernel.org/r/201603100845.30602.arnd@arndb.de
- */
-#define readb_relaxed(c)	__raw_readb(c)
-#define readw_relaxed(c) ({ u16 __r = le16_to_cpu((__force __le16) \
-					__raw_readw(c)); __r; })
-#define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
-					__raw_readl(c)); __r; })
-
-#define writeb_relaxed(v,c)	__raw_writeb(v,c)
-#define writew_relaxed(v,c)	__raw_writew((__force u16) cpu_to_le16(v),c)
-#define writel_relaxed(v,c)	__raw_writel((__force u32) cpu_to_le32(v),c)
-
 #include <asm-generic/io.h>
 
 #endif /* _ASM_ARC_IO_H */
-- 
2.53.0

