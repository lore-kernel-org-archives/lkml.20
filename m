Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC83CE0BB;
	Tue,  8 Sep 2026 20:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900706; cv=none; b=ZsyJhP4EOdR6umGhb+y8IJSFULIj5tLn+0LxNATeEtNQ1aHOwB6VnO3uGlQmDtkIF5EaqFRUOnkkdaRvZskPWP7KvY6JRA9FG1FHKQLACv+9U7WE8lIyfLLeZPjxv57cHMTp+CI51jGYO6EcUoZcBF+b+niOcyITnd3JNSATiVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900706; c=relaxed/simple;
	bh=XL+BgCnGFI9usdvjOhviYt8DBQZMNs9DUZwRgAuJKpE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=e1fgwMwBbkAnvtklyze8NiiIkc3XVa+p4erfM3JVpAxYqxovUPwZ1GZKm22mdLhTlVku066Pc0dMP9NIbUoilTgVRyYDF5PHJ1oScHPQb8/wuOI2RFVmL85TwdHjWOPig3z3LxaM+RhU9Cc87GeDkI631B5yxIxH1J0RQzO/0BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k+WRdEQV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r7GSWzyC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k+WRdEQV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r7GSWzyC"
Date: Tue, 08 Sep 2026 20:51:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900702;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ZlH7tV2y9N6wZ8kbn7e4QjnY6+7HdHnS81OcAwbFLc=;
	b=k+WRdEQVGjxbwxgbLU0kFFVA3DP6ocK+GJ+76m5NRdDqBSpjiqpViB6wzOtwWPfRertq1X
	yABBRE9vNf0oFNX6OAljDkcYb9nNNzbB0VEdHyHl3a4AHBrDIddigmAan9nTFbeHwWDccI
	RBgvx0F+yYnZ9L0VwC9FHBQpSqMJd4mauYs2ZHqgz1GM7c2HI46wVm9sLqXecKRUcLtt2K
	DG+iQrFXvjJfvrRDBX9Ti5bgWqHMR60tKJ5cyq21JYeDpEGoQPElAuq/xTNth2JfSVu2X3
	0aebYLLIVktRQg45rnZsJlu+MrIaN1JXNhYbSZEYmX9wPnELnKx0pWXpv//4dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900702;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ZlH7tV2y9N6wZ8kbn7e4QjnY6+7HdHnS81OcAwbFLc=;
	b=r7GSWzyCohu2BXP4O6QvBvBsbeetn7FeoCQQtad43I7CsPipHO/t/8vUoHA7rV/1ZOg+wO
	jG8pXSNHqM2x4NAA==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86: Support YMM sampling using
 sample_simd_vec_reg_* fields
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-15-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-15-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890070053.623050.11019956097845762281.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     b76210d3214730fd5d79387684ae0c56dd580229
Gitweb:        https://git.kernel.org/tip/b76210d3214730fd5d79387684ae0c56dd5=
80229
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:22 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:44 +02:00

perf/x86: Support YMM sampling using sample_simd_vec_reg_* fields

Support sampling of YMM registers via the sample_simd_vec_reg_* fields.

Each YMM register consists of 4 u64 words, assembled from two halves:
XMM (the lower 2 u64 words) and YMMH (the upper 2 u64 words). Although
both XMM and YMMH data can be retrieved with a single xsaves instruction,
they are stored in separate locations. The perf_simd_reg_value() function
is responsible for assembling these halves into a complete YMM register
for output to userspace.

Additionally, sample_simd_vec_reg_qwords should be set to 4 to indicate
YMM sampling.

YMM sampling will be enabled in a subsequent patch that sets
PERF_PMU_CAP_SIMD_REGS.

Co-developed-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-15-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/core.c                | 29 ++++++++++++++++++++------
 arch/x86/events/perf_event.h          | 26 +++++++++++++++++++++++-
 arch/x86/include/asm/perf_event.h     |  4 ++++-
 arch/x86/include/uapi/asm/perf_regs.h |  6 +++--
 arch/x86/kernel/perf_regs.c           | 13 +++++++++++-
 5 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index f85163b..3039a31 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -642,6 +642,9 @@ static int pebs_simd_regs_validate(struct perf_event *eve=
nt)
 	if (event_needs_xmm(event) &&
 	    x86_pmu.arch_pebs && !(caps & ARCH_PEBS_VECR_XMM))
 		return -EINVAL;
+	/* PEBS does not support YMM registers sampling yet. */
+	if (event_needs_ymm(event))
+		return -EINVAL;
=20
 	return 0;
 }
@@ -656,6 +659,9 @@ static int event_simd_regs_validate(struct perf_event *ev=
ent)
 	if (event_needs_xmm(event) &&
 	    !(x86_pmu.ext_regs_mask & XFEATURE_MASK_SSE))
 		return -EINVAL;
+	if (event_needs_ymm(event) &&
+	   !(x86_pmu.ext_regs_mask & XFEATURE_MASK_YMM))
+		return -EINVAL;
=20
 	return 0;
 }
@@ -1819,6 +1825,7 @@ void x86_pmu_clear_perf_regs(struct pt_regs *regs)
=20
 	perf_regs->abi =3D PERF_SAMPLE_REGS_ABI_NONE;
 	perf_regs->xmm_regs =3D NULL;
+	perf_regs->ymmh_regs =3D NULL;
 }
=20
 static void update_perf_regs(struct x86_perf_regs *perf_regs,
@@ -1834,6 +1841,8 @@ static void update_perf_regs(struct x86_perf_regs *perf=
_regs,
=20
 	if (mask & XFEATURE_MASK_SSE)
 		perf_regs->xmm_space =3D xsave->i387.xmm_space;
+	if (mask & XFEATURE_MASK_YMM)
+		perf_regs->ymmh =3D get_xsave_addr(xsave, XFEATURE_YMM);
 }
=20
 /*
@@ -1996,6 +2005,18 @@ static inline u64 x86_pmu_update_user_xregs(struct per=
f_sample_data *data,
 	return user_mask;
 }
=20
+static u64 get_simd_sample_mask(struct perf_event *event, u64 sample_type)
+{
+	u64 mask =3D 0;
+
+	if (__event_needs_xmm(event, sample_type))
+		mask |=3D XFEATURE_MASK_SSE;
+	if (__event_needs_ymm(event, sample_type))
+		mask |=3D XFEATURE_MASK_YMM;
+
+	return mask;
+}
+
 static void x86_pmu_sample_xregs(struct perf_event *event,
 				 struct perf_sample_data *data,
 				 struct pt_regs *regs,
@@ -2011,17 +2032,13 @@ static void x86_pmu_sample_xregs(struct perf_event *e=
vent,
 		return;
=20
 	if ((sample_type & PERF_SAMPLE_REGS_INTR) && data->regs_intr.regs) {
-		if (__event_needs_xmm(event, PERF_SAMPLE_REGS_INTR))
-			intr_mask |=3D XFEATURE_MASK_SSE;
-
+		intr_mask |=3D get_simd_sample_mask(event, PERF_SAMPLE_REGS_INTR);
 		intr_mask &=3D x86_pmu.ext_regs_mask;
 		intr_mask =3D from_pebs ? 0 : intr_mask;
 	}
=20
 	if ((sample_type & PERF_SAMPLE_REGS_USER) && data->regs_user.regs) {
-		if (__event_needs_xmm(event, PERF_SAMPLE_REGS_USER))
-			user_mask |=3D XFEATURE_MASK_SSE;
-
+		user_mask |=3D get_simd_sample_mask(event, PERF_SAMPLE_REGS_USER);
 		user_mask &=3D x86_pmu.ext_regs_mask;
 		user_mask =3D x86_pmu_update_user_xregs(data, regs,
 						      user_mask, from_pebs);
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 57a8263..423835e 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -183,6 +183,32 @@ static inline bool event_needs_xmm(struct perf_event *ev=
ent)
 			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
 }
=20
+static inline bool __event_needs_ymm(struct perf_event *event, u64 sample_ty=
pe)
+{
+	if (!event->attr.sample_simd_regs_enabled)
+		return false;
+	if (event->attr.sample_simd_vec_reg_qwords < PERF_X86_YMM_QWORDS)
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
+static inline bool event_needs_ymm(struct perf_event *event)
+{
+	return __event_needs_ymm(event,
+			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
+}
+
 struct amd_nb {
 	int nb_id;  /* NorthBridge id */
 	int refcnt; /* reference count */
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_ev=
ent.h
index a2b2123..da77845 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -733,6 +733,10 @@ struct x86_perf_regs {
 		u64	*xmm_regs;
 		u32	*xmm_space;	/* for xsaves */
 	};
+	union {
+		u64	*ymmh_regs;
+		struct ymmh_struct *ymmh;
+	};
 };
=20
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/as=
m/perf_regs.h
index edb3540..d544f6d 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -59,7 +59,8 @@ enum perf_event_x86_regs {
=20
 enum {
 	PERF_X86_SIMD_XMM_REGS      =3D 16,
-	PERF_X86_SIMD_VEC_REGS_MAX  =3D PERF_X86_SIMD_XMM_REGS,
+	PERF_X86_SIMD_YMM_REGS      =3D 16,
+	PERF_X86_SIMD_VEC_REGS_MAX  =3D PERF_X86_SIMD_YMM_REGS,
 };
=20
 #define PERF_X86_SIMD_VEC_MASK	__GENMASK_ULL(PERF_X86_SIMD_VEC_REGS_MAX - 1,=
 0)
@@ -67,7 +68,8 @@ enum {
 enum {
 	/* 1 qword =3D 8 bytes */
 	PERF_X86_XMM_QWORDS      =3D 2,
-	PERF_X86_SIMD_QWORDS_MAX =3D PERF_X86_XMM_QWORDS,
+	PERF_X86_YMM_QWORDS      =3D 4,
+	PERF_X86_SIMD_QWORDS_MAX =3D PERF_X86_YMM_QWORDS,
 };
=20
 #endif /* _ASM_X86_PERF_REGS_H */
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index bccf0fc..0076974 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -77,6 +77,8 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 	return regs_get_register(regs, pt_regs_offset[idx]);
 }
=20
+#define PERF_X86_YMMH_QWORDS	(PERF_X86_YMM_QWORDS / 2)
+
 u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
 			u16 qwords_idx, bool pred)
 {
@@ -98,6 +100,11 @@ u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
 			return 0;
 		return perf_regs->xmm_regs[idx * PERF_X86_XMM_QWORDS +
 					   qwords_idx];
+	} else if (qwords_idx < PERF_X86_YMM_QWORDS) {
+		if (!perf_regs->ymmh_regs)
+			return 0;
+		return perf_regs->ymmh_regs[idx * PERF_X86_YMMH_QWORDS +
+					    qwords_idx - PERF_X86_XMM_QWORDS];
 	}
=20
 	return 0;
@@ -115,7 +122,8 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
 	}
=20
 	if (vec_qwords) {
-		if (vec_qwords !=3D PERF_X86_XMM_QWORDS)
+		if (vec_qwords !=3D PERF_X86_XMM_QWORDS &&
+		    vec_qwords !=3D PERF_X86_YMM_QWORDS)
 			return -EINVAL;
 		if (vec_mask & ~PERF_X86_SIMD_VEC_MASK)
 			return -EINVAL;
@@ -124,6 +132,9 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
 		if (vec_qwords =3D=3D PERF_X86_XMM_QWORDS && mask &&
 		    !bitmap_full(&mask, PERF_X86_SIMD_XMM_REGS))
 			return -EINVAL;
+		if (vec_qwords =3D=3D PERF_X86_YMM_QWORDS && mask &&
+		    !bitmap_full(&mask, PERF_X86_SIMD_YMM_REGS))
+			return -EINVAL;
 	}
=20
 	/* PRED registers are not supported yet. */
