Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81363B47CC;
	Tue,  8 Sep 2026 20:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900700; cv=none; b=WwiwZ8yH12gV3YPMLfAtvSkm0kyyOPmBYGfsDHLS4U+FlijgFfhykxgz72nrORvDWELKcLstSdEfLOOYSdK/L0UTfyjzd9F1b6XCEGBuCf/B26uIklnjoD0af+1MLnG5rOLLlgG39e0hByomO89DRNa+WEguk8ZrCDqCUCTkpG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900700; c=relaxed/simple;
	bh=ZzSUXOqeE6NM6UZJU3RFTgs6gCeV36HQD2Kiyaq+u9k=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=CIlH9QtiqthXqHRLEo9ptfCsV/N/rSd8zJE4Q9KGoIihYLy8SqB+zc7eYMcuKAr70dOk3gUk8q0aenxeZnaL90FGF3ezxT6Lq1p50vmsLk6NdgTVNqBM4CvRFrBox9ERhD6HHX3+d7uA1vX9fCjJ5ZMmyEddcA+KNkQa8pe/+z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jyIOmilA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=04d2R6fv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jyIOmilA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="04d2R6fv"
Date: Tue, 08 Sep 2026 20:51:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900696;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i41IFfxyfZJnwfd5q+fsvZ9aAojMPexAmGkvbEAJqe0=;
	b=jyIOmilA3DXiYC6zNlS0lfpcFumrjhhlxOjGwz2cCZCicWfEcV2SWWrW47AxKMbEWCIJed
	RVlomieIC0JcoBGnQ/ppm08KIqDjxfo0Pr8YxKsUsCiETXceYaY5ntJ63iCF+vPKzwD0lN
	Is0XF1Lx3hJCrb7DaXG0DoQMZ3+66rdiHpr+obyGZ16KvL2Fh65bLDxX4DvR+nrLcr8sj8
	78SWUiZhSNn7aCHzVB+fR8YxW25CE2rn/vy2ez0H/QNbyByQUnFSWFmmKum9jd56WDKNOU
	Ikp6E+ycecP7TWYw7K5pVf4y6VxHb6PBcXM4WeTYiaroJbeXKaGKDnILVSQAOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900696;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i41IFfxyfZJnwfd5q+fsvZ9aAojMPexAmGkvbEAJqe0=;
	b=04d2R6fvTcwMjGRkWpWi3/PjfDu/l0rhhNlfpvitUu4D6puQeSWQMb4f4DVZD/QEwx9II6
	9wK/ZivsY+ifxMBg==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf/x86: Support eGPRs sampling using sample_regs_* fields
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Kan Liang <kan.liang@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-19-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-19-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890069443.623050.13460668588433019482.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     578460d9af8d5816eff59642a8bb11945026b8d1
Gitweb:        https://git.kernel.org/tip/578460d9af8d5816eff59642a8bb1194502=
6b8d1
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:26 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:45 +02:00

perf/x86: Support eGPRs sampling using sample_regs_* fields

Support sampling of APX eGPRs (R16 ~ R31) via the sample_regs_* fields.

To sample eGPRs, the sample_simd_regs_enabled field must be set. This
allows the spare space (reclaimed from the original XMM space) in the
sample_regs_* fields to be used for representing eGPRs.

The perf_reg_value() function needs to check if the
PERF_SAMPLE_REGS_ABI_SIMD flag is set first, and then determine whether
to output eGPRs or legacy XMM registers to userspace.

The perf_reg_validate() function first checks the simd_enabled argument
to determine if the eGPRs bitmap is represented in sample_regs_* fields.
It then validates the eGPRs bitmap accordingly.

Currently, eGPRs sampling is only supported on the x86_64 architecture, as
APX is only available on x86_64 platforms.

APX eGPRs sampling will be enabled in a subsequent patch that sets
PERF_PMU_CAP_SIMD_REGS.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Co-developed-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-19-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/core.c                | 25 ++++++++++---
 arch/x86/events/intel/core.c          | 10 +++--
 arch/x86/events/perf_event.h          | 25 +++++++++++++-
 arch/x86/include/asm/perf_event.h     |  4 ++-
 arch/x86/include/uapi/asm/perf_regs.h | 26 ++++++++++++++-
 arch/x86/kernel/perf_regs.c           | 50 ++++++++++++++++----------
 6 files changed, 115 insertions(+), 25 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 9bfb181..9cd79ac 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -642,11 +642,12 @@ static int pebs_simd_regs_validate(struct perf_event *e=
vent)
 	if (event_needs_xmm(event) &&
 	    x86_pmu.arch_pebs && !(caps & ARCH_PEBS_VECR_XMM))
 		return -EINVAL;
-	/* PEBS does not support YMM/ZMM/OPMASK registers sampling yet. */
+	/* PEBS does not support YMM/ZMM/OPMASK/eGPR registers sampling yet. */
 	if (event_needs_ymm(event) ||
 	    event_needs_low16_zmm(event) ||
 	    event_needs_high16_zmm(event) ||
-	    event_needs_opmask(event))
+	    event_needs_opmask(event) ||
+	    event_needs_egprs(event))
 		return -EINVAL;
=20
 	return 0;
@@ -654,10 +655,21 @@ static int pebs_simd_regs_validate(struct perf_event *e=
vent)
=20
 static int event_simd_regs_validate(struct perf_event *event)
 {
+	u64 reserved =3D ~GENMASK_ULL(PERF_REG_MISC_MAX - 1, 0);
+
 	if (!get_ext_regs_buf(raw_smp_processor_id()))
 		return -ENOMEM;
-	/* sample_simd_regs_enabled repurposes legacy XMM reg-mask slots. */
-	if (event_has_extended_regs(event))
+	/*
+	 * The XMM space in the perf_event_x86_regs is reclaimed
+	 * for eGPRs and other general registers.
+	 */
+	if (((event->attr.sample_type & PERF_SAMPLE_REGS_INTR) &&
+	     (event->attr.sample_regs_intr & reserved)) ||
+	    ((event->attr.sample_type & PERF_SAMPLE_REGS_USER) &&
+	     (event->attr.sample_regs_user & reserved)))
+		return -EINVAL;
+	if (event_needs_egprs(event) &&
+	    !(x86_pmu.ext_regs_mask & XFEATURE_MASK_APX))
 		return -EINVAL;
 	if (event_needs_xmm(event) &&
 	    !(x86_pmu.ext_regs_mask & XFEATURE_MASK_SSE))
@@ -1841,6 +1853,7 @@ void x86_pmu_clear_perf_regs(struct pt_regs *regs)
 	perf_regs->zmmh_regs =3D NULL;
 	perf_regs->h16zmm_regs =3D NULL;
 	perf_regs->opmask_regs =3D NULL;
+	perf_regs->egpr_regs =3D NULL;
 }
=20
 static void update_perf_regs(struct x86_perf_regs *perf_regs,
@@ -1864,6 +1877,8 @@ static void update_perf_regs(struct x86_perf_regs *perf=
_regs,
 		perf_regs->h16zmm =3D get_xsave_addr(xsave, XFEATURE_Hi16_ZMM);
 	if (mask & XFEATURE_MASK_OPMASK)
 		perf_regs->opmask =3D get_xsave_addr(xsave, XFEATURE_OPMASK);
+	if (mask & XFEATURE_MASK_APX)
+		perf_regs->egpr =3D get_xsave_addr(xsave, XFEATURE_APX);
 }
=20
 /*
@@ -2040,6 +2055,8 @@ static u64 get_simd_sample_mask(struct perf_event *even=
t, u64 sample_type)
 		mask |=3D XFEATURE_MASK_Hi16_ZMM;
 	if (__event_needs_opmask(event, sample_type))
 		mask |=3D XFEATURE_MASK_OPMASK;
+	if (__event_needs_egprs(event, sample_type))
+		mask |=3D XFEATURE_MASK_APX;
=20
 	return mask;
 }
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 5cb8083..b2aa0bc 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -4695,15 +4695,19 @@ static void intel_pebs_aliases_skl(struct perf_event =
*event)
 static unsigned long intel_pmu_large_pebs_flags(struct perf_event *event)
 {
 	unsigned long flags =3D x86_pmu.large_pebs_flags;
-	u64 gprs_mask =3D PEBS_GP_REGS | PERF_REG_EXTENDED_MASK;
+	u64 gprs_mask =3D event->attr.sample_simd_regs_enabled ?
+			PEBS_GP_REGS | PERF_X86_EGPRS_MASK :
+			PEBS_GP_REGS | PERF_REG_EXTENDED_MASK;
=20
 	if (event->attr.use_clockid)
 		flags &=3D ~PERF_SAMPLE_TIME;
 	if (!event->attr.exclude_kernel)
 		flags &=3D ~PERF_SAMPLE_REGS_USER;
-	if (event->attr.sample_regs_user & ~gprs_mask)
+	if ((event->attr.sample_type & PERF_SAMPLE_REGS_USER) &&
+	    (event->attr.sample_regs_user & ~gprs_mask))
 		flags &=3D ~PERF_SAMPLE_REGS_USER;
-	if (event->attr.sample_regs_intr & ~gprs_mask)
+	if ((event->attr.sample_type & PERF_SAMPLE_REGS_INTR) &&
+	    (event->attr.sample_regs_intr & ~gprs_mask))
 		flags &=3D ~PERF_SAMPLE_REGS_INTR;
 	return flags;
 }
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 8a74b7d..c052a38 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -290,6 +290,31 @@ static inline bool event_needs_opmask(struct perf_event =
*event)
 			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
 }
=20
+static inline bool __event_needs_egprs(struct perf_event *event,
+				       u64 sample_type)
+{
+	if (!event->attr.sample_simd_regs_enabled)
+		return false;
+
+	if ((sample_type & PERF_SAMPLE_REGS_USER) &&
+	    (event->attr.sample_type & PERF_SAMPLE_REGS_USER) &&
+	    (event->attr.sample_regs_user & PERF_X86_EGPRS_MASK))
+		return true;
+
+	if ((sample_type & PERF_SAMPLE_REGS_INTR) &&
+	    (event->attr.sample_type & PERF_SAMPLE_REGS_INTR) &&
+	    (event->attr.sample_regs_intr & PERF_X86_EGPRS_MASK))
+		return true;
+
+	return false;
+}
+
+static inline bool event_needs_egprs(struct perf_event *event)
+{
+	return __event_needs_egprs(event,
+			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
+}
+
 struct amd_nb {
 	int nb_id;  /* NorthBridge id */
 	int refcnt; /* reference count */
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_ev=
ent.h
index 49112e0..bc05f8c 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -749,6 +749,10 @@ struct x86_perf_regs {
 		u64	*opmask_regs;
 		struct avx_512_opmask_state *opmask;
 	};
+	union {
+		u64	*egpr_regs;
+		struct apx_state *egpr;
+	};
 };
=20
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/as=
m/perf_regs.h
index 61aec60..977831b 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -29,9 +29,34 @@ enum perf_event_x86_regs {
 	PERF_REG_X86_R13,
 	PERF_REG_X86_R14,
 	PERF_REG_X86_R15,
+	/*
+	 * The eGPRs and XMM have overlaps. Only one can be used
+	 * at a time. The ABI PERF_SAMPLE_REGS_ABI_SIMD is used to
+	 * distinguish which one is used. If PERF_SAMPLE_REGS_ABI_SIMD
+	 * is set, then eGPRs is used, otherwise, XMM is used.
+	 *
+	 * Extended GPRs (eGPRs)
+	 */
+	PERF_REG_X86_R16,
+	PERF_REG_X86_R17,
+	PERF_REG_X86_R18,
+	PERF_REG_X86_R19,
+	PERF_REG_X86_R20,
+	PERF_REG_X86_R21,
+	PERF_REG_X86_R22,
+	PERF_REG_X86_R23,
+	PERF_REG_X86_R24,
+	PERF_REG_X86_R25,
+	PERF_REG_X86_R26,
+	PERF_REG_X86_R27,
+	PERF_REG_X86_R28,
+	PERF_REG_X86_R29,
+	PERF_REG_X86_R30,
+	PERF_REG_X86_R31,
 	/* These are the limits for the GPRs. */
 	PERF_REG_X86_32_MAX =3D PERF_REG_X86_GS + 1,
 	PERF_REG_X86_64_MAX =3D PERF_REG_X86_R15 + 1,
+	PERF_REG_MISC_MAX =3D PERF_REG_X86_R31 + 1,
=20
 	/* These all need two bits set because they are 128bit */
 	PERF_REG_X86_XMM0  =3D 32,
@@ -56,6 +81,7 @@ enum perf_event_x86_regs {
 };
=20
 #define PERF_REG_EXTENDED_MASK	(~((1ULL << PERF_REG_X86_XMM0) - 1))
+#define PERF_X86_EGPRS_MASK	__GENMASK_ULL(PERF_REG_X86_R31, PERF_REG_X86_R16)
=20
 enum {
 	PERF_X86_SIMD_XMM_REGS      =3D 16,
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 494e065..7d4233e 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -61,14 +61,24 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 {
 	struct x86_perf_regs *perf_regs;
=20
-	if (idx >=3D PERF_REG_X86_XMM0 && idx < PERF_REG_X86_XMM_MAX) {
+	if (idx > PERF_REG_X86_R15) {
 		perf_regs =3D container_of(regs, struct x86_perf_regs, regs);
-		/* SIMD registers are moved to dedicated sample_simd_vec_reg */
-		if (perf_regs->abi & PERF_SAMPLE_REGS_ABI_SIMD)
+		if (perf_regs->abi =3D=3D PERF_SAMPLE_REGS_ABI_NONE)
 			return 0;
-		if (!perf_regs->xmm_regs)
-			return 0;
-		return perf_regs->xmm_regs[idx - PERF_REG_X86_XMM0];
+
+		if (perf_regs->abi & PERF_SAMPLE_REGS_ABI_SIMD) {
+			if (idx <=3D PERF_REG_X86_R31) {
+				if (!perf_regs->egpr_regs)
+					return 0;
+				return perf_regs->egpr_regs[idx - PERF_REG_X86_R16];
+			}
+		} else {
+			if (idx >=3D PERF_REG_X86_XMM0 && idx < PERF_REG_X86_XMM_MAX) {
+				if (!perf_regs->xmm_regs)
+					return 0;
+				return perf_regs->xmm_regs[idx - PERF_REG_X86_XMM0];
+			}
+		}
 	}
=20
 	if (WARN_ON_ONCE(idx >=3D ARRAY_SIZE(pt_regs_offset)))
@@ -185,23 +195,22 @@ int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
 	return 0;
 }
=20
-#define PERF_REG_X86_RESERVED	(((1ULL << PERF_REG_X86_XMM0) - 1) & \
-				 ~((1ULL << PERF_REG_X86_MAX) - 1))
+#define PERF_REG_X86_RESERVED	(GENMASK_ULL(PERF_REG_X86_XMM0 - 1, PERF_REG_X=
86_AX) & \
+				 ~GENMASK_ULL(PERF_REG_X86_R15, PERF_REG_X86_AX))
+#define PERF_REG_X86_EXT_RESERVED	(~GENMASK_ULL(PERF_REG_MISC_MAX - 1, PERF_=
REG_X86_AX))
=20
 #ifdef CONFIG_X86_32
-#define REG_NOSUPPORT ((1ULL << PERF_REG_X86_R8) | \
-		       (1ULL << PERF_REG_X86_R9) | \
-		       (1ULL << PERF_REG_X86_R10) | \
-		       (1ULL << PERF_REG_X86_R11) | \
-		       (1ULL << PERF_REG_X86_R12) | \
-		       (1ULL << PERF_REG_X86_R13) | \
-		       (1ULL << PERF_REG_X86_R14) | \
-		       (1ULL << PERF_REG_X86_R15))
+#define REG_NOSUPPORT GENMASK_ULL(PERF_REG_X86_R15, PERF_REG_X86_R8)
=20
 int perf_reg_validate(u64 mask, bool simd_enabled)
 {
+	if (!simd_enabled &&
+	    (!mask || (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED))))
+		return -EINVAL;
+
 	/* The mask could be 0 if only the SIMD registers are interested */
-	if (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED))
+	if (simd_enabled &&
+	    (mask & ~GENMASK_ULL(PERF_REG_X86_GS, PERF_REG_X86_AX)))
 		return -EINVAL;
=20
 	return 0;
@@ -220,8 +229,13 @@ u64 perf_reg_abi(struct task_struct *task)
=20
 int perf_reg_validate(u64 mask, bool simd_enabled)
 {
+	if (!simd_enabled &&
+	    (!mask || (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED))))
+		return -EINVAL;
+
 	/* The mask could be 0 if only the SIMD registers are interested */
-	if (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED))
+	if (simd_enabled &&
+	    (mask & (REG_NOSUPPORT | PERF_REG_X86_EXT_RESERVED)))
 		return -EINVAL;
=20
 	return 0;
