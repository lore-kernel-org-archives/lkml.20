Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065836;
	b=roVr6hfVAbpUL/iKbn8Oew5+wrbB0m8p0Q0sAC78Jpa1SWgCey+f3jdY28YcVdlD2Ei0
	 YlTqWIKZQyaP7go0wZBv7RYRGLP94ZK+pDfnleaBCyZFcmfO5xig203KgRCejP8f82Zjw
	 71f4R3EqFhOCc/cgevEirp4nitEBMP/LGfleb6LTKs3Y6qsyFJL0LBg5vG/tw+9wzGLoN
	 L1eiwKq4o25gCwNDNHyN3p0zpRHZMz3XxfXi3zjQ169uwa1wWmHjyk4DsH28MwG1liHbX
	 RuzxdzAtHozNe54XI2RykQG+j1DPOVjcFN9xRN5cayz59r11RB1WBsxkffH/3Mmwckw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=HCC2TdG6RWHax6m3RaTlIkhTsAHQgHyzqZG341Zkcv8=;
	b=LUtDVC9i8EMTNFix0k4L/H4U0R+urmIWjcAv+30oauyW8qM/jAz8EjjWKoWRUMQ14Y9D
	 fgCx9zxCrY839pJFiIn/ox/sBU/x7CbQ1GANBseD569YZ2rYljm00IRP23idQbkjApbSt
	 xy6Ysfzph0oIe7+V/OLB6SKnohvwFQQcXPwKo85t91QS+rWpG7782WT+Vl0q4TdKkdYmQ
	 s4bwhnjR0HkFUAYGSiFTgFw3YW7wLvP2BfUB6cMU2M3Qsjeknudz4ih4eAZ85i98u1fiK
	 O6RyewHQi3Esz5fpNvhGgie0ruk6r8xsyh04eGAgP2MceZvO0ne7wGpoTZfJy9n4e5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mykjB9Vq;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B499606D82A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B499606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mykjB9Vq
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c4d58203e40so23125566b.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065835; x=1794670635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HCC2TdG6RWHax6m3RaTlIkhTsAHQgHyzqZG341Zkcv8=;
        b=mykjB9VqJg/WpwE1wFh3/0leh6vvxttDDFK6RcTU0T6b5HLdSrAKp3pcQtTQ1N1bju
         zhGAAp5ogtU2FC0A5H1CSYAFSpQ28C8ak2MxDA+6V7ruo1QXaEFLsuahCRdWm7OySlDm
         JqJ1bXntmEBtI4ggXElI0BH6NdZ7ilFk6kosQU1lKistdKUNZhgWMtrgzPSIBD7EEw4V
         UvoEtChItJ6z9UgplpNAwB6ccpskOCKDJg41K+kPKfewY7cN6qRUyQasPKMx4vIPU8Ow
         kvj40OJIjk+Tf5/rZPruZxQvDGbQ6Ctg3xwgMYKXB8/3dwZqnU4mKchHS6WbC1wucigW
         qeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065835; x=1794670635;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCC2TdG6RWHax6m3RaTlIkhTsAHQgHyzqZG341Zkcv8=;
        b=i/xXL/bgYAzxBCT1ZQkWj65Ba9EPz9XdJzdC85zp1Wp29N+LK85imxZZTtrXZgPGmK
         yFBwIbzkbsIixq5Jjm0i1VWAvQ41EGHN5j0AzhkqybAq59Fts7+8LDKxmixu74Cc1Wb/
         V35R5J5emGz+d69ACg3DHSvZgfjj9Hg1DJEmU3d4aCJlYOmhrogm78zCaD8R6Y4Ch9sf
         vMaL6mc21xUAW0qBo+vuiFXcWhnXgIsf9kDoGV3/xRmwqrt7mHdRXAM+gTyJHgt49YEb
         MB/Nz7VFF1xySSkcdzquhvSYoDTRJntTm2hqziUu7SEpSqtZTWahkZYIi+Y//hM5AcBq
         WcTQ==
X-Forwarded-Encrypted: i=1; AKwUvByYt1Up0X5R52BVvX12snZWGuMp45op/ULqddnhe3BkvVtPncvjhCUTIQ3RhzFjWddaNi/CE/bv+wdgbYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6uqzL2MqqZNg8htUP0WPe38a8EBw/UWBomm+mdoWhiFOfb8G0
	tZv+OHk9LKYd6pIMM+NGtmf4s+KtSEQOELIm8es37T2dBmj3tfDoWAWq33H16i4znotfQQOb3p4
	uRQ==
X-Received: from ejeck20-n1.prod.google.com ([2002:a17:907:e1d4:10b0:c4d:2f7a:cb66])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:a785:b0:c40:9e84:942a
 with SMTP id a640c23a62f3a-c4d34ce3a9dmr404232766b.48.1794065834471; Sat, 07
 Nov 2026 07:37:14 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:11 +0100
In-Reply-To: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261107-mte-kasan-split-v1-0-d84ea5f30f94@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261107-mte-kasan-split-v1-5-d84ea5f30f94@google.com>
Subject: [PATCH 05/24] arm64: Check MTE once per fault-handling section
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Call system_uses_mte_async_or_asymm_mode() only once per section. This
improves performance (fewer instructions at runtime and fewer static
branches needing to be tracked and patched), correctness (no theoretical
race between the execution of the section and the static branch being
toggled, which could leave TCO in an unexpected state), and code clarity
(no 3-level indirection with redundant checks to flip one PSTATE bit).

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h      | 25 -----------
 arch/arm64/include/asm/uaccess.h        | 80 ++++++++++++++++++++---------=
----
 arch/arm64/include/asm/word-at-a-time.h | 22 +++++++--
 3 files changed, 67 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 467d1d41a392..b474fca3ea56 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -48,23 +48,6 @@ static inline void mte_enable_tco(void)
 	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1), ARM64_MTE));
 }
=20
-/*
- * These functions disable tag checking only if in MTE async mode
- * since the sync mode generates exceptions synchronously and the
- * nofault or load_unaligned_zeropad can handle them.
- */
-static inline void __mte_disable_tco_async(void)
-{
-	if (system_uses_mte_async_or_asymm_mode())
-		mte_disable_tco();
-}
-
-static inline void __mte_enable_tco_async(void)
-{
-	if (system_uses_mte_async_or_asymm_mode())
-		mte_enable_tco();
-}
-
 /*
  * These functions are meant to be only used from KASAN runtime through
  * the arch_*() interface defined in asm/memory.h.
@@ -197,14 +180,6 @@ static inline void mte_enable_tco(void)
 {
 }
=20
-static inline void __mte_disable_tco_async(void)
-{
-}
-
-static inline void __mte_enable_tco_async(void)
-{
-}
-
 static inline u8 mte_get_ptr_tag(void *ptr)
 {
 	return 0xFF;
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uacc=
ess.h
index f0924dc0bd64..9e3957ee3642 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -240,6 +240,24 @@ do {										\
 	(x) =3D (__force __typeof__(*(ptr)))__gu_val;				\
 } while (0)
=20
+/*
+ * We must not call into the scheduler between setting and clearing TCO. A=
s `x`
+ * and `ptr` may contain blocking functions, we must evaluate these outsid=
e of
+ * the critical section.
+ */
+#define __raw_get_mem_tco(ldr, x, ptr, label, type)			\
+do {									\
+	__label__ __rgm_err;						\
+									\
+	asm volatile(SET_PSTATE_TCO(1));				\
+	__raw_get_mem(ldr, x, ptr, __rgm_err, type);			\
+	asm volatile(SET_PSTATE_TCO(0));				\
+	break;								\
+__rgm_err:								\
+	asm volatile(SET_PSTATE_TCO(0));				\
+	goto label;							\
+} while (0)
+
 /*
  * We must not call into the scheduler between uaccess_ttbr0_enable() and
  * uaccess_ttbr0_disable(). As `x` and `ptr` could contain blocking functi=
ons,
@@ -286,27 +304,18 @@ do {									\
=20
 #define get_user	__get_user
=20
-/*
- * We must not call into the scheduler between __mte_enable_tco_async() an=
d
- * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
- * functions, we must evaluate these outside of the critical section.
- */
+/* We handle synchronous exceptions so only use PSTATE.TCO in non-sync MTE=
. */
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	__typeof__(dst) __gkn_dst =3D (dst);				\
 	__typeof__(src) __gkn_src =3D (src);				\
-	do { 								\
-		__label__ __gkn_label;					\
 									\
-		__mte_enable_tco_async();				\
+	if (system_uses_mte_async_or_asymm_mode())			\
+		__raw_get_mem_tco("ldr", *((type *)(__gkn_dst)),	\
+		      (__force type *)(__gkn_src), err_label, K);	\
+	else								\
 		__raw_get_mem("ldr", *((type *)(__gkn_dst)),		\
-		      (__force type *)(__gkn_src), __gkn_label, K);	\
-		__mte_disable_tco_async();				\
-		break;							\
-	__gkn_label:							\
-		__mte_disable_tco_async();				\
-		goto err_label;						\
-	} while (0);							\
+		      (__force type *)(__gkn_src), err_label, K);	\
 } while (0)
=20
 #define __put_mem_asm(store, reg, x, addr, label, type)			\
@@ -337,6 +346,24 @@ do {										\
 	}									\
 } while (0)
=20
+/*
+ * We must not call into the scheduler between setting and clearing TCO. A=
s `x`
+ * and `ptr` may contain blocking functions, we must evaluate these outsid=
e of
+ * the critical section.
+ */
+#define __raw_put_mem_tco(str, x, ptr, label, type)			\
+do {									\
+	__label__ __rpm_err;						\
+									\
+	asm volatile(SET_PSTATE_TCO(1));				\
+	__raw_put_mem(str, x, ptr, __rpm_err, type);			\
+	asm volatile(SET_PSTATE_TCO(0));				\
+	break;								\
+__rpm_err:								\
+	asm volatile(SET_PSTATE_TCO(0));				\
+	goto label;							\
+} while (0)
+
 /*
  * We must not call into the scheduler between uaccess_ttbr0_enable() and
  * uaccess_ttbr0_disable(). As `x` and `ptr` could contain blocking functi=
ons,
@@ -383,28 +410,19 @@ do {									\
=20
 #define put_user	__put_user
=20
-/*
- * We must not call into the scheduler between __mte_enable_tco_async() an=
d
- * __mte_disable_tco_async(). As `dst` and `src` may contain blocking
- * functions, we must evaluate these outside of the critical section.
- */
+/* We handle synchronous exceptions so only use PSTATE.TCO in non-sync MTE=
. */
 #define __put_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	__typeof__(dst) __pkn_dst =3D (dst);				\
 	__typeof__(src) __pkn_src =3D (src);				\
 									\
-	do {								\
-		__label__ __pkn_err;					\
-		__mte_enable_tco_async();				\
+	if (system_uses_mte_async_or_asymm_mode())			\
+		__raw_put_mem_tco("str", *((type *)(__pkn_src)),	\
+			      (__force type *)(__pkn_dst), err_label, K); \
+	else								\
 		__raw_put_mem("str", *((type *)(__pkn_src)),		\
-			      (__force type *)(__pkn_dst), __pkn_err, K);	\
-		__mte_disable_tco_async();				\
-		break;							\
-	__pkn_err:							\
-		__mte_disable_tco_async();				\
-		goto err_label;						\
-	} while (0);							\
-} while(0)
+			      (__force type *)(__pkn_dst), err_label, K); \
+} while (0)
=20
 extern unsigned long __must_check __arch_copy_from_user(void *to, const vo=
id __user *from, unsigned long n);
 #define raw_copy_from_user(to, from, n)					\
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/a=
sm/word-at-a-time.h
index d7a3b69dc8c6..ec72126210d1 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -10,6 +10,9 @@
 #include <linux/bitops.h>
 #include <linux/wordpart.h>
=20
+#include <asm/mte-kasan.h>
+#include <asm/sysreg.h>
+
 struct word_at_a_time {
 	const unsigned long one_bits, high_bits;
 };
@@ -41,12 +44,10 @@ static inline unsigned long zero_bytemask(unsigned long=
 bits)
  * and the next page not being mapped, take the exception and
  * return zeroes in the non-existing part.
  */
-static inline unsigned long load_unaligned_zeropad(const void *addr)
+static __always_inline unsigned long __load_unaligned_zeropad(const void *=
addr)
 {
 	unsigned long ret;
=20
-	__mte_enable_tco_async();
-
 	/* Load word from unaligned pointer addr */
 	asm(
 	"1:	ldr	%0, %2\n"
@@ -55,7 +56,20 @@ static inline unsigned long load_unaligned_zeropad(const=
 void *addr)
 	: "=3D&r" (ret)
 	: "r" (addr), "Q" (*(unsigned long *)addr));
=20
-	__mte_disable_tco_async();
+	return ret;
+}
+
+static inline unsigned long load_unaligned_zeropad(const void *addr)
+{
+	unsigned long ret;
+
+	/* We handle synchronous exceptions so only use TCO in non-sync MTE. */
+	if (!system_uses_mte_async_or_asymm_mode())
+		return __load_unaligned_zeropad(addr);
+
+	asm volatile(SET_PSTATE_TCO(1));
+	ret =3D __load_unaligned_zeropad(addr);
+	asm volatile(SET_PSTATE_TCO(0));
=20
 	return ret;
 }

--=20
2.56.0.455.g6c5a503b38-goog

