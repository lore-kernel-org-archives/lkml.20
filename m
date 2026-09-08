Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26FC3BF666;
	Tue,  8 Sep 2026 20:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900702; cv=none; b=p9sfUlXaNwQzmVbmK8t0ZTkN7PMWD1Hqf7Npldfp2KXUlQ6Od5+LXUHiUd/gDdhs1fQnw+Ox2Ei1IzN4+K4lKPdChQDwBZcA8blz9Zxhx/qKupiFtEO3IDwWyAmz4d3lho9RyF+2SU8MMd05QY29lWqwN/IuDNK92NrOS+Q53cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900702; c=relaxed/simple;
	bh=gV5bRx26HgsVNbNOt4249qky1mj+Xxrbb1x/udpsVAc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=EoohvQKFxjachOcvOwH0wtkx2Iz8nn8athGwrRcZm/WhcxZbXv8Z8QU+Lsvu2IUNx9ZvzuCuT5yWh564Q88IiceaV5bQlvylLHBeuSrUfTZ70TiwRNiUK5XwHafZyS91jLLlIzkqhGcbMWKp/dTsXzDD4ROFbcbdse56KOxtPiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fxkKC+Ex; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GkduX3hy; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fxkKC+Ex";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GkduX3hy"
Date: Tue, 08 Sep 2026 20:51:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900699;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LllxcTA5P8iywHlSuJf+WtSt4oqT1dy3mNqtVReYtIE=;
	b=fxkKC+ExgmWQET4ea7+MlpZdCppct/me3hdJ0U5b2x2WYxeoCaJEDJXS6FBOGaAYf0ZoYa
	j2dT2hKfK94tmQ68q3Ibw4BcpZDk0lMqFozh0Fn0PwXvO/fyExW7TgYQpvvQnK+NXbcHQU
	sikhRNQwlc6tmKRR2JxgTmXYcylyaKwOVGT4bMJcNH3TYN6CsUIQ4o61+SN+L1ex4YrVX1
	PI6ILbN+pNPKI+axfcIiS4c682Jnhfz1C/ZQ4a9r6jUCmJV1OYoCxlcxDhFY/Yq/S53s30
	+B0UPL5ehfiWnDMtqo19FOsESl1K1hMNkRTxZfLIPkEjtXBMhMFW3Ba+B1qlhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900699;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LllxcTA5P8iywHlSuJf+WtSt4oqT1dy3mNqtVReYtIE=;
	b=GkduX3hyz9T0bFQ4rH2SNFlvYnkk1r+eveS6K3sDfFUhaIkuGFTyAPGHME8ezBXmDL7hXY
	rjtSRKE//DJv54CQ==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86: Support OPMASK sampling using
 sample_simd_pred_reg_* fields
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-17-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-17-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890069747.623050.5466342238461826915.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     74d55a827e31bc8a75fbc530951c6266d043ecc0
Gitweb:        https://git.kernel.org/tip/74d55a827e31bc8a75fbc530951c6266d04=
3ecc0
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:24 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:45 +02:00

perf/x86: Support OPMASK sampling using sample_simd_pred_reg_* fields

Support sampling of OPMASK registers via the sample_simd_pred_reg_*
fields.

Each OPMASK register consists of 1 u64 word. Current x86 hardware
supports 8 OPMASK registers. The perf_simd_reg_value() function is
responsible for outputting OPMASK value to userspace.

Additionally, sample_simd_pred_reg_qwords should be set to 1 to indicate
OPMASK sampling.

OPMASK sampling will be enabled in a subsequent patch that sets
PERF_PMU_CAP_SIMD_REGS.

Co-developed-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-17-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/core.c                | 13 +++++++++++--
 arch/x86/events/perf_event.h          | 27 ++++++++++++++++++++++++++-
 arch/x86/include/asm/perf_event.h     |  4 ++++-
 arch/x86/include/uapi/asm/perf_regs.h |  5 +++++-
 arch/x86/kernel/perf_regs.c           | 24 ++++++++++++++++++-----
 5 files changed, 66 insertions(+), 7 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index b0e3f1b..9bfb181 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -642,10 +642,11 @@ static int pebs_simd_regs_validate(struct perf_event *e=
vent)
 	if (event_needs_xmm(event) &&
 	    x86_pmu.arch_pebs && !(caps & ARCH_PEBS_VECR_XMM))
 		return -EINVAL;
-	/* PEBS does not support YMM/ZMM registers sampling yet. */
+	/* PEBS does not support YMM/ZMM/OPMASK registers sampling yet. */
 	if (event_needs_ymm(event) ||
 	    event_needs_low16_zmm(event) ||
-	    event_needs_high16_zmm(event))
+	    event_needs_high16_zmm(event) ||
+	    event_needs_opmask(event))
 		return -EINVAL;
=20
 	return 0;
@@ -670,6 +671,9 @@ static int event_simd_regs_validate(struct perf_event *ev=
ent)
 	if (event_needs_high16_zmm(event) &&
 	    !(x86_pmu.ext_regs_mask & XFEATURE_MASK_Hi16_ZMM))
 		return -EINVAL;
+	if (event_needs_opmask(event) &&
+	    !(x86_pmu.ext_regs_mask & XFEATURE_MASK_OPMASK))
+		return -EINVAL;
=20
 	return 0;
 }
@@ -1836,6 +1840,7 @@ void x86_pmu_clear_perf_regs(struct pt_regs *regs)
 	perf_regs->ymmh_regs =3D NULL;
 	perf_regs->zmmh_regs =3D NULL;
 	perf_regs->h16zmm_regs =3D NULL;
+	perf_regs->opmask_regs =3D NULL;
 }
=20
 static void update_perf_regs(struct x86_perf_regs *perf_regs,
@@ -1857,6 +1862,8 @@ static void update_perf_regs(struct x86_perf_regs *perf=
_regs,
 		perf_regs->zmmh =3D get_xsave_addr(xsave, XFEATURE_ZMM_Hi256);
 	if (mask & XFEATURE_MASK_Hi16_ZMM)
 		perf_regs->h16zmm =3D get_xsave_addr(xsave, XFEATURE_Hi16_ZMM);
+	if (mask & XFEATURE_MASK_OPMASK)
+		perf_regs->opmask =3D get_xsave_addr(xsave, XFEATURE_OPMASK);
 }
=20
 /*
@@ -2031,6 +2038,8 @@ static u64 get_simd_sample_mask(struct perf_event *even=
t, u64 sample_type)
 		mask |=3D XFEATURE_MASK_ZMM_Hi256;
 	if (__event_needs_high16_zmm(event, sample_type))
 		mask |=3D XFEATURE_MASK_Hi16_ZMM;
+	if (__event_needs_opmask(event, sample_type))
+		mask |=3D XFEATURE_MASK_OPMASK;
=20
 	return mask;
 }
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 8ee69ec..8a74b7d 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -263,6 +263,33 @@ static inline bool event_needs_high16_zmm(struct perf_ev=
ent *event)
 			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
 }
=20
+static inline bool __event_needs_opmask(struct perf_event *event,
+					u64 sample_type)
+{
+	if (!event->attr.sample_simd_regs_enabled)
+		return false;
+	if (event->attr.sample_simd_pred_reg_qwords !=3D PERF_X86_OPMASK_QWORDS)
+		return false;
+
+	if ((sample_type & PERF_SAMPLE_REGS_USER) &&
+	    (event->attr.sample_type & PERF_SAMPLE_REGS_USER) &&
+	    (event->attr.sample_simd_pred_reg_user > 0))
+		return true;
+
+	if ((sample_type & PERF_SAMPLE_REGS_INTR) &&
+	    (event->attr.sample_type & PERF_SAMPLE_REGS_INTR) &&
+	    (event->attr.sample_simd_pred_reg_intr > 0))
+		return true;
+
+	return false;
+}
+
+static inline bool event_needs_opmask(struct perf_event *event)
+{
+	return __event_needs_opmask(event,
+			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
+}
+
 struct amd_nb {
 	int nb_id;  /* NorthBridge id */
 	int refcnt; /* reference count */
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_ev=
ent.h
index 75394c4..49112e0 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -745,6 +745,10 @@ struct x86_perf_regs {
 		u64	*h16zmm_regs;
 		struct avx_512_hi16_state *h16zmm;
 	};
+	union {
+		u64	*opmask_regs;
+		struct avx_512_opmask_state *opmask;
+	};
 };
=20
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/as=
m/perf_regs.h
index b88d0b6..61aec60 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -62,14 +62,19 @@ enum {
 	PERF_X86_SIMD_YMM_REGS      =3D 16,
 	PERF_X86_SIMD_ZMM_REGS      =3D 32,
 	PERF_X86_SIMD_VEC_REGS_MAX  =3D PERF_X86_SIMD_ZMM_REGS,
+
+	PERF_X86_SIMD_OPMASK_REGS   =3D 8,
+	PERF_X86_SIMD_PRED_REGS_MAX =3D PERF_X86_SIMD_OPMASK_REGS,
 };
=20
+#define PERF_X86_SIMD_PRED_MASK	__GENMASK(PERF_X86_SIMD_PRED_REGS_MAX - 1, 0)
 #define PERF_X86_SIMD_VEC_MASK	__GENMASK_ULL(PERF_X86_SIMD_VEC_REGS_MAX - 1,=
 0)
=20
 #define PERF_X86_H16ZMM_BASE		16
=20
 enum {
 	/* 1 qword =3D 8 bytes */
+	PERF_X86_OPMASK_QWORDS   =3D 1,
 	PERF_X86_XMM_QWORDS      =3D 2,
 	PERF_X86_YMM_QWORDS      =3D 4,
 	PERF_X86_ZMM_QWORDS      =3D 8,
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 93370d4..87297da 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -89,8 +89,14 @@ u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
 	if (!(perf_regs->abi & PERF_SAMPLE_REGS_ABI_SIMD))
 		return 0;
=20
-	if (pred)
-		return 0;
+	if (pred) {
+		if (WARN_ON_ONCE(idx >=3D PERF_X86_SIMD_PRED_REGS_MAX ||
+				 qwords_idx >=3D PERF_X86_OPMASK_QWORDS))
+			return 0;
+		if (!perf_regs->opmask_regs)
+			return 0;
+		return perf_regs->opmask_regs[idx];
+	}
=20
 	if (WARN_ON_ONCE(idx >=3D PERF_X86_SIMD_VEC_REGS_MAX ||
 			 qwords_idx >=3D PERF_X86_SIMD_QWORDS_MAX))
@@ -154,9 +160,17 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
 			return -EINVAL;
 	}
=20
-	/* PRED registers are not supported yet. */
-	if (pred_qwords)
-		return -EINVAL;
+	if (pred_qwords) {
+		if (pred_qwords !=3D PERF_X86_OPMASK_QWORDS)
+			return -EINVAL;
+		if (pred_mask & ~PERF_X86_SIMD_PRED_MASK)
+			return -EINVAL;
+		/* Only full-register sampling is allowed. */
+		mask =3D pred_mask;
+		if (pred_qwords =3D=3D PERF_X86_OPMASK_QWORDS && mask &&
+		    !bitmap_full(&mask, PERF_X86_SIMD_OPMASK_REGS))
+			return -EINVAL;
+	}
=20
 	size =3D sizeof(u64) * 4;
 	size +=3D (hweight64(vec_mask) * vec_qwords +
