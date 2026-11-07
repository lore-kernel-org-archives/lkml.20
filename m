Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065848;
	b=jg7i+yqw4BrMtoJ/XWZVxGOV8P2PFjALn5L0RDG58hAqf3fNlUPqo3snf0F9EPMOhs2M
	 H8jmPKAey6ox1LlJ7+t6H8FT0tv/1j0W59Cmtk5VLst04ChmdEWzsikVmJq3NIg7hhqZq
	 Ktglgp0hZIECM+xM3EjZIRnQoPjA6ajcFmEAcK2vLxIuX9bFhQzi5Eqy4oa964889YijW
	 QsZedlfcCTMeoKcr4FiYmHmoOufobQeJtZ2xj65d80tOZzXfcgAzE7MdttiL44S3A+NiQ
	 c27cd1/GjwElRNAHmb4gM2vIYQB4vcfyBXJrqIr/gJtjMQHbnyIODYY7eyxLlAJNuRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=FhNHSPGgRz9Ke5ZXnFFLBTYfVhk9gRkjrfMATYBeC9E=;
	b=VAW5jqIZvm3yjk8ijI41Tv6e+5Oac17o0INBs0Iheem4DtGAyxPChaiL9AVtlxTG96d3
	 oeJDLqyByQE/Ma4UJ8VMYulTCZUlif2hLdr4aBC8IankqoQo6B7wAp9BVIHzOvq4tgbwp
	 fPuPM7fw6Drj00wG+rS7ck4b5sYoeopaosJ2oxr3Q2xoDapv1RP429zh3d5neoyNbD5R5
	 D2k4iOL2+Z+ozpP6KXfEwzAdea1RfB3JNeefPxGz/tmhc9zq7TbxMQW8YGzbXR6+zKiXZ
	 yde7AEp4Qt0rVKVhAhluE1dfDjKpYG5flAWxg1qUFxjwM1+RCrb/PQl3b3ziGuMWKeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="mmcg/mCg";
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BD2606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05BD2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mmcg/mCg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c293e604f0eso146880666b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794065846; x=1794670646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FhNHSPGgRz9Ke5ZXnFFLBTYfVhk9gRkjrfMATYBeC9E=;
        b=mmcg/mCgJJZuzlIdNYAjrcHZtctDmB4JYUFmdlLPXCTV7wcbtzxt64mx/W3keWbApw
         r7tkvu1po779BArscNoRU2gAYlbfUszh74FBcTXexpoFDsXWpnwxqb0rgrt80Tg2dts4
         BC5T3kUYICMi2hNTq1U4Mo73tmJ/jIOWokLV4vaGisHIAgVej3JHPwtmshL/hVE65JJA
         bvew/1Y65kWyob3ch8aKTjAtiMF2Wdl0HcX1vs4RVKFi4Hk5f8YU1WKQkyVnWLSIu/6z
         bhSqB4fpRazN84skT6e/lgW6uZo1PtBw+0VFn8biCV54Fec+hIOO+DXmP+6Q4XwumbeX
         cRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794065846; x=1794670646;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhNHSPGgRz9Ke5ZXnFFLBTYfVhk9gRkjrfMATYBeC9E=;
        b=iBmOYAu/T5NizvqpaL3MQMoRmd8Si2xdZiwM+wvnXwdTJoWJaVJQipMTF+js+ZlJh0
         5624A/0VJS4T7qIXMrU211y/0p7qL8NPa2CrZZJ+nk93uglZJArSz66WDdF0ieuCVGgV
         X/MXRhFMWrIH35rgOwaQlbPazTNUnM7Zdlf7EKd1brRE1coQ7jKGBhoYUJl/eIESCTl4
         CadYeQwlLmT1mN8AhN2C5H54ePJSsXMdxlKia5f9vot/AzlHk4Ld5ckmOegdq6TRTGjq
         0fYozCy+X5gOLc9rxKREjSicSZGAEpfgNXqo9J1BfSEYWtHFYuVbPa//3Wq+elcRYXXB
         qIWA==
X-Forwarded-Encrypted: i=1; AL+hErFdxpx908++90e9WPDiJk9YUprM249Yx1bQN75LpvyEAo2oPXsckdleAJjaiYmAhX83DvjtwCPSGVoJD8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cg0VKpfSlIvh1x1TW7dAg2oRFXn3bDtFdKS0v9XzzieVaEhTp
	o2geEG9wioqkZzq02lthjendYI9yCLTDtc5MGpy4PbQQRKXb+TsAoQH/H/buX/hx5+kHiZszh3t
	GVQ==
X-Received: from ejcjx20.prod.google.com ([2002:a17:907:7614:b0:c46:c6af:b8da])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7fa5:b0:c4c:f846:1f1d
 with SMTP id a640c23a62f3a-c4d351f29d0mr423966266b.3.1794065846355; Sat, 07
 Nov 2026 07:37:26 -0800 (PST)
Date: Sat, 07 Nov 2026 16:36:19 +0100
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
Message-ID: <20261107-mte-kasan-split-v1-13-d84ea5f30f94@google.com>
Subject: [PATCH 13/24] arm64: Introduce set_pstate_tco() helper macro
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Like other PSTATE bits, TCO deserves its own accessor.

Note that only HW KASAN common code now calls mte_{enable,disable}_tco()
so that their KASAN_HW_TAGS and ALTERNATIVE(ARM64_MTE) are superfluous.

Move the comment, as it now applies to them.

Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 arch/arm64/include/asm/mte-kasan.h      | 24 +++++++++++-------------
 arch/arm64/include/asm/mte.h            |  2 +-
 arch/arm64/include/asm/sysreg.h         |  1 +
 arch/arm64/include/asm/uaccess.h        | 16 ++++++++--------
 arch/arm64/include/asm/word-at-a-time.h |  4 ++--
 5 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/mte-kasan.h b/arch/arm64/include/asm/mt=
e-kasan.h
index 17e4155781fc..9d00e9460b0f 100644
--- a/arch/arm64/include/asm/mte-kasan.h
+++ b/arch/arm64/include/asm/mte-kasan.h
@@ -13,6 +13,8 @@
=20
 #include <linux/types.h>
=20
+#include <asm/sysreg.h>
+
 #ifdef CONFIG_KASAN_HW_TAGS
=20
 /* Whether the MTE asynchronous mode is enabled. */
@@ -34,27 +36,23 @@ static inline bool system_uses_mte_async_or_asymm_mode(=
void)
=20
 #ifdef CONFIG_ARM64_MTE
=20
+/*
+ * These functions are meant to be only used from KASAN runtime through
+ * the arch_*() interface defined in asm/memory.h.
+ * These functions don't include system_supports_mte() checks,
+ * as KASAN only calls them when MTE is supported and enabled.
+ */
+
 static inline void mte_disable_tco(void)
 {
-	if (!IS_ENABLED(CONFIG_KASAN_HW_TAGS))
-		return;
-	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(0), ARM64_MTE));
+	set_pstate_tco(0);
 }
=20
 static inline void mte_enable_tco(void)
 {
-	if (!IS_ENABLED(CONFIG_KASAN_HW_TAGS))
-		return;
-	asm volatile(ALTERNATIVE("nop", SET_PSTATE_TCO(1), ARM64_MTE));
+	set_pstate_tco(1);
 }
=20
-/*
- * These functions are meant to be only used from KASAN runtime through
- * the arch_*() interface defined in asm/memory.h.
- * These functions don't include system_supports_mte() checks,
- * as KASAN only calls them when MTE is supported and enabled.
- */
-
 static inline u8 mte_get_ptr_tag(void *ptr)
 {
 	/* Note: The format of KASAN tags is 0xF<x> */
diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 614fff7dc35f..815843079eb9 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -271,7 +271,7 @@ static inline void mte_disable_tco_entry(struct task_st=
ruct *task)
 	 */
 	if (kasan_hw_tags_enabled() ||
 	    (task->thread.sctlr_user & (1UL << SCTLR_EL1_TCF0_SHIFT)))
-		asm volatile(SET_PSTATE_TCO(0));
+		set_pstate_tco(0);
 }
=20
 #ifdef CONFIG_KASAN_HW_TAGS
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysre=
g.h
index e3b60ee03023..51c6a54d7146 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -105,6 +105,7 @@
 #define set_pstate_uao(x)		asm volatile(SET_PSTATE_UAO(x))
 #define set_pstate_ssbs(x)		asm volatile(SET_PSTATE_SSBS(x))
 #define set_pstate_dit(x)		asm volatile(SET_PSTATE_DIT(x))
+#define set_pstate_tco(x)		asm volatile(SET_PSTATE_TCO(x))
=20
 /* Register-based PAN access, for save/restore purposes */
 #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uacc=
ess.h
index 9e3957ee3642..aac7676da531 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -140,13 +140,13 @@ static inline void __uaccess_disable_mte(void)
 	 * such that a bad user address tag could trigger a kernel MTE fault.
 	 */
 	if (kasan_hw_tags_enabled())
-		asm volatile(SET_PSTATE_TCO(1));
+		set_pstate_tco(1);
 }
=20
 static inline void __uaccess_enable_mte(void)
 {
 	if (kasan_hw_tags_enabled())
-		asm volatile(SET_PSTATE_TCO(0));
+		set_pstate_tco(0);
 }
=20
 static inline void uaccess_disable_privileged(void)
@@ -249,12 +249,12 @@ do {										\
 do {									\
 	__label__ __rgm_err;						\
 									\
-	asm volatile(SET_PSTATE_TCO(1));				\
+	set_pstate_tco(1);						\
 	__raw_get_mem(ldr, x, ptr, __rgm_err, type);			\
-	asm volatile(SET_PSTATE_TCO(0));				\
+	set_pstate_tco(0);						\
 	break;								\
 __rgm_err:								\
-	asm volatile(SET_PSTATE_TCO(0));				\
+	set_pstate_tco(0);						\
 	goto label;							\
 } while (0)
=20
@@ -355,12 +355,12 @@ do {										\
 do {									\
 	__label__ __rpm_err;						\
 									\
-	asm volatile(SET_PSTATE_TCO(1));				\
+	set_pstate_tco(1);						\
 	__raw_put_mem(str, x, ptr, __rpm_err, type);			\
-	asm volatile(SET_PSTATE_TCO(0));				\
+	set_pstate_tco(0);						\
 	break;								\
 __rpm_err:								\
-	asm volatile(SET_PSTATE_TCO(0));				\
+	set_pstate_tco(0);						\
 	goto label;							\
 } while (0)
=20
diff --git a/arch/arm64/include/asm/word-at-a-time.h b/arch/arm64/include/a=
sm/word-at-a-time.h
index ec72126210d1..430d5ab8f042 100644
--- a/arch/arm64/include/asm/word-at-a-time.h
+++ b/arch/arm64/include/asm/word-at-a-time.h
@@ -67,9 +67,9 @@ static inline unsigned long load_unaligned_zeropad(const =
void *addr)
 	if (!system_uses_mte_async_or_asymm_mode())
 		return __load_unaligned_zeropad(addr);
=20
-	asm volatile(SET_PSTATE_TCO(1));
+	set_pstate_tco(1);
 	ret =3D __load_unaligned_zeropad(addr);
-	asm volatile(SET_PSTATE_TCO(0));
+	set_pstate_tco(0);
=20
 	return ret;
 }

--=20
2.56.0.455.g6c5a503b38-goog

