Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9A3CBE89;
	Tue,  8 Sep 2026 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900704; cv=none; b=BM61cu6UHQi6idK7zn80OktKxA4RRm3KXIz4zgPcnPmqpWTXttbx36MX+wXgWkrKMGs0pP6ZQnZX69MtDNrT+fcFgVz5g1enTNwc5l3SpwYzqKvfOJjM8mQVr3mTrdieKBWNYKQQF4ErghKZdX2tIJiB1mRcGtfLLkdmnmBSW60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900704; c=relaxed/simple;
	bh=ifsiUdI9W+ZNi9k5zioK9lYiEWNXPaoskBlePn5QTPQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=dwcSFc8DBCyFZFJzOVvP43/tef5c5ji1vjfbmAsuPeRvOkxWnIApCR8DjjuY2C4V1WfQ2AtLsYm0avVqjmvA/8lOTSnvBgpXV3lRD5kEcIE+rGjH1fgy2MKlS/Nhla+F6alC6qGUhZ+P7MnbO7IbZCGcys/H3L5F/GkKv7DUb7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QPlLu+h2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wMUKME42; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QPlLu+h2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wMUKME42"
Date: Tue, 08 Sep 2026 20:51:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900700;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAIK5pD3uhBjW0xPmdrx6YVfxelCqq6lD/zN7QNUpdI=;
	b=QPlLu+h25tqwaUrMBBD4eFv7jSwKSsoj+3KmVm3S0MOIon1xW0gMhQvHDJgztlpUtWPJyv
	y1bcClHYjoKklPdQ0Ypsq2ZW2MPQGXiLUGF52ZqD7scHYdId2V2UyuqvqYgjnMJUKeZBOI
	XSQ3MnsjAag3qHSiRO4PV9zJCxKAdLH99mI/hxb2Ztofvi2+VKthxEHie3qTcUHHGgsp7f
	bt5YFwaQSN04yO7fk+7WVdtpVkob6PY4ExobNUa3dWmqwPt225EsRzzwGQAzwXM0bmhZeg
	pa5u7/p+gpDiC3qIRmq6mPhG87yWqyMoxXZyO4tvzHXcZ34zKrqcWMp6aNcUQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900700;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAIK5pD3uhBjW0xPmdrx6YVfxelCqq6lD/zN7QNUpdI=;
	b=wMUKME42l9c+jP+FWp0IM0OQC37xjjKORbEiCgGmJH65wT5lUQjmNwktaECmz+YpAmrB02
	V5ZBZrfNGBwud2Cg==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86: Support ZMM sampling using
 sample_simd_vec_reg_* fields
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-16-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-16-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890069901.623050.3960897287269509384.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     3807f6996a0bd9515ff69f3040d6e47f7b20e7a5
Gitweb:        https://git.kernel.org/tip/3807f6996a0bd9515ff69f3040d6e47f7b2=
0e7a5
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:23 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:44 +02:00

perf/x86: Support ZMM sampling using sample_simd_vec_reg_* fields

Support sampling of ZMM registers via the sample_simd_vec_reg_* fields.

Each ZMM register consists of 8 u64 words. Current x86 hardware supports
up to 32 ZMM registers. For ZMM registers from ZMM0 to ZMM15, they are
assembled from three parts: XMM (the lower 2 u64 words),
YMMH (the middle 2 u64 words), and ZMMH (the upper 4 u64 words). The
perf_simd_reg_value() function is responsible for assembling these three
parts into a complete ZMM register for output to userspace.

For ZMM registers ZMM16 to ZMM31, each register can be read as a whole
and directly outputted to userspace.

Additionally, sample_simd_vec_reg_qwords should be set to 8 to indicate
ZMM sampling.

ZMM sampling will be enabled in a subsequent patch that sets
PERF_PMU_CAP_SIMD_REGS.

Co-developed-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-16-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/core.c                | 22 ++++++++++-
 arch/x86/events/perf_event.h          | 54 ++++++++++++++++++++++++++-
 arch/x86/include/asm/perf_event.h     |  8 ++++-
 arch/x86/include/uapi/asm/perf_regs.h |  8 +++-
 arch/x86/kernel/perf_regs.c           | 19 ++++++++-
 5 files changed, 106 insertions(+), 5 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 3039a31..b0e3f1b 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -642,8 +642,10 @@ static int pebs_simd_regs_validate(struct perf_event *ev=
ent)
 	if (event_needs_xmm(event) &&
 	    x86_pmu.arch_pebs && !(caps & ARCH_PEBS_VECR_XMM))
 		return -EINVAL;
-	/* PEBS does not support YMM registers sampling yet. */
-	if (event_needs_ymm(event))
+	/* PEBS does not support YMM/ZMM registers sampling yet. */
+	if (event_needs_ymm(event) ||
+	    event_needs_low16_zmm(event) ||
+	    event_needs_high16_zmm(event))
 		return -EINVAL;
=20
 	return 0;
@@ -662,6 +664,12 @@ static int event_simd_regs_validate(struct perf_event *e=
vent)
 	if (event_needs_ymm(event) &&
 	   !(x86_pmu.ext_regs_mask & XFEATURE_MASK_YMM))
 		return -EINVAL;
+	if (event_needs_low16_zmm(event) &&
+	    !(x86_pmu.ext_regs_mask & XFEATURE_MASK_ZMM_Hi256))
+		return -EINVAL;
+	if (event_needs_high16_zmm(event) &&
+	    !(x86_pmu.ext_regs_mask & XFEATURE_MASK_Hi16_ZMM))
+		return -EINVAL;
=20
 	return 0;
 }
@@ -1826,6 +1834,8 @@ void x86_pmu_clear_perf_regs(struct pt_regs *regs)
 	perf_regs->abi =3D PERF_SAMPLE_REGS_ABI_NONE;
 	perf_regs->xmm_regs =3D NULL;
 	perf_regs->ymmh_regs =3D NULL;
+	perf_regs->zmmh_regs =3D NULL;
+	perf_regs->h16zmm_regs =3D NULL;
 }
=20
 static void update_perf_regs(struct x86_perf_regs *perf_regs,
@@ -1843,6 +1853,10 @@ static void update_perf_regs(struct x86_perf_regs *per=
f_regs,
 		perf_regs->xmm_space =3D xsave->i387.xmm_space;
 	if (mask & XFEATURE_MASK_YMM)
 		perf_regs->ymmh =3D get_xsave_addr(xsave, XFEATURE_YMM);
+	if (mask & XFEATURE_MASK_ZMM_Hi256)
+		perf_regs->zmmh =3D get_xsave_addr(xsave, XFEATURE_ZMM_Hi256);
+	if (mask & XFEATURE_MASK_Hi16_ZMM)
+		perf_regs->h16zmm =3D get_xsave_addr(xsave, XFEATURE_Hi16_ZMM);
 }
=20
 /*
@@ -2013,6 +2027,10 @@ static u64 get_simd_sample_mask(struct perf_event *eve=
nt, u64 sample_type)
 		mask |=3D XFEATURE_MASK_SSE;
 	if (__event_needs_ymm(event, sample_type))
 		mask |=3D XFEATURE_MASK_YMM;
+	if (__event_needs_low16_zmm(event, sample_type))
+		mask |=3D XFEATURE_MASK_ZMM_Hi256;
+	if (__event_needs_high16_zmm(event, sample_type))
+		mask |=3D XFEATURE_MASK_Hi16_ZMM;
=20
 	return mask;
 }
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 423835e..8ee69ec 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -209,6 +209,60 @@ static inline bool event_needs_ymm(struct perf_event *ev=
ent)
 			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
 }
=20
+static inline bool __event_needs_low16_zmm(struct perf_event *event,
+					   u64 sample_type)
+{
+	if (!event->attr.sample_simd_regs_enabled)
+		return false;
+	if (event->attr.sample_simd_vec_reg_qwords < PERF_X86_ZMM_QWORDS)
+		return false;
+
+	if ((sample_type & PERF_SAMPLE_REGS_USER) &&
+	    (event->attr.sample_type & PERF_SAMPLE_REGS_USER) &&
+	    (event->attr.sample_simd_vec_reg_user > 0))
+		return true;
+
+	if ((sample_type & PERF_SAMPLE_REGS_INTR) &&
+	    (event->attr.sample_type & PERF_SAMPLE_REGS_INTR) &&
+	    (event->attr.sample_simd_vec_reg_intr > 0))
+		return true;
+
+	return false;
+}
+
+static inline bool event_needs_low16_zmm(struct perf_event *event)
+{
+	return __event_needs_low16_zmm(event,
+			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
+}
+
+static inline bool __event_needs_high16_zmm(struct perf_event *event,
+					    u64 sample_type)
+{
+	if (!event->attr.sample_simd_regs_enabled)
+		return false;
+	if (event->attr.sample_simd_vec_reg_qwords < PERF_X86_ZMM_QWORDS)
+		return false;
+
+	if ((sample_type & PERF_SAMPLE_REGS_USER) &&
+	    (event->attr.sample_type & PERF_SAMPLE_REGS_USER) &&
+	    (fls64(event->attr.sample_simd_vec_reg_user) > PERF_X86_H16ZMM_BASE))
+		return true;
+
+	if ((sample_type & PERF_SAMPLE_REGS_INTR) &&
+	    (event->attr.sample_type & PERF_SAMPLE_REGS_INTR) &&
+	    (fls64(event->attr.sample_simd_vec_reg_intr) > PERF_X86_H16ZMM_BASE))
+		return true;
+
+	return false;
+}
+
+static inline bool event_needs_high16_zmm(struct perf_event *event)
+{
+	return __event_needs_high16_zmm(event,
+			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
+}
+
 struct amd_nb {
 	int nb_id;  /* NorthBridge id */
 	int refcnt; /* reference count */
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_ev=
ent.h
index da77845..75394c4 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -737,6 +737,14 @@ struct x86_perf_regs {
 		u64	*ymmh_regs;
 		struct ymmh_struct *ymmh;
 	};
+	union {
+		u64	*zmmh_regs;
+		struct avx_512_zmm_uppers_state *zmmh;
+	};
+	union {
+		u64	*h16zmm_regs;
+		struct avx_512_hi16_state *h16zmm;
+	};
 };
=20
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/as=
m/perf_regs.h
index d544f6d..b88d0b6 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -60,16 +60,20 @@ enum perf_event_x86_regs {
 enum {
 	PERF_X86_SIMD_XMM_REGS      =3D 16,
 	PERF_X86_SIMD_YMM_REGS      =3D 16,
-	PERF_X86_SIMD_VEC_REGS_MAX  =3D PERF_X86_SIMD_YMM_REGS,
+	PERF_X86_SIMD_ZMM_REGS      =3D 32,
+	PERF_X86_SIMD_VEC_REGS_MAX  =3D PERF_X86_SIMD_ZMM_REGS,
 };
=20
 #define PERF_X86_SIMD_VEC_MASK	__GENMASK_ULL(PERF_X86_SIMD_VEC_REGS_MAX - 1,=
 0)
=20
+#define PERF_X86_H16ZMM_BASE		16
+
 enum {
 	/* 1 qword =3D 8 bytes */
 	PERF_X86_XMM_QWORDS      =3D 2,
 	PERF_X86_YMM_QWORDS      =3D 4,
-	PERF_X86_SIMD_QWORDS_MAX =3D PERF_X86_YMM_QWORDS,
+	PERF_X86_ZMM_QWORDS      =3D 8,
+	PERF_X86_SIMD_QWORDS_MAX =3D PERF_X86_ZMM_QWORDS,
 };
=20
 #endif /* _ASM_X86_PERF_REGS_H */
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 0076974..93370d4 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -78,6 +78,7 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 }
=20
 #define PERF_X86_YMMH_QWORDS	(PERF_X86_YMM_QWORDS / 2)
+#define PERF_X86_ZMMH_QWORDS	(PERF_X86_ZMM_QWORDS / 2)
=20
 u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
 			u16 qwords_idx, bool pred)
@@ -95,6 +96,13 @@ u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
 			 qwords_idx >=3D PERF_X86_SIMD_QWORDS_MAX))
 		return 0;
=20
+	if (idx >=3D PERF_X86_H16ZMM_BASE) {
+		if (!perf_regs->h16zmm_regs)
+			return 0;
+		return perf_regs->h16zmm_regs[(idx - PERF_X86_H16ZMM_BASE) *
+					PERF_X86_ZMM_QWORDS + qwords_idx];
+	}
+
 	if (qwords_idx < PERF_X86_XMM_QWORDS) {
 		if (!perf_regs->xmm_regs)
 			return 0;
@@ -105,6 +113,11 @@ u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
 			return 0;
 		return perf_regs->ymmh_regs[idx * PERF_X86_YMMH_QWORDS +
 					    qwords_idx - PERF_X86_XMM_QWORDS];
+	} else if (qwords_idx < PERF_X86_ZMM_QWORDS) {
+		if (!perf_regs->zmmh_regs)
+			return 0;
+		return perf_regs->zmmh_regs[idx * PERF_X86_ZMMH_QWORDS +
+					    qwords_idx - PERF_X86_YMM_QWORDS];
 	}
=20
 	return 0;
@@ -123,7 +136,8 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
=20
 	if (vec_qwords) {
 		if (vec_qwords !=3D PERF_X86_XMM_QWORDS &&
-		    vec_qwords !=3D PERF_X86_YMM_QWORDS)
+		    vec_qwords !=3D PERF_X86_YMM_QWORDS &&
+		    vec_qwords !=3D PERF_X86_ZMM_QWORDS)
 			return -EINVAL;
 		if (vec_mask & ~PERF_X86_SIMD_VEC_MASK)
 			return -EINVAL;
@@ -135,6 +149,9 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
 		if (vec_qwords =3D=3D PERF_X86_YMM_QWORDS && mask &&
 		    !bitmap_full(&mask, PERF_X86_SIMD_YMM_REGS))
 			return -EINVAL;
+		if (vec_qwords =3D=3D PERF_X86_ZMM_QWORDS && mask &&
+		    !bitmap_full(&mask, PERF_X86_SIMD_ZMM_REGS))
+			return -EINVAL;
 	}
=20
 	/* PRED registers are not supported yet. */
