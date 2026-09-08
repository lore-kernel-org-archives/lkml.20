Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5F13BADA9;
	Tue,  8 Sep 2026 20:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900698; cv=none; b=mUyJB+mQU1yNFdeSaMrhMK9RMtW0jHQmdegficxLUPMQNT4Zki938ZjiBKYDM0Chb899FYIO2G/nUmy1z/iX8hjuq7TU7WUQ5UBJvfdl1HTEGY8PQfES9ajPZ3LaHCEsUkT/E3Qb/AjzUF1KG4U2aHrL7yayOTQ//y6P4XzbGHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900698; c=relaxed/simple;
	bh=pCoSZ3jtPsc4JlyNeD6HcYrqwCqNc0Qmxms7Pr/zs8c=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=qpUx7CwaE9E5bDQGSgkezb7BWeaqvgsNZIH2/UvCAPIj/DcF7i/BF3Knl6iJG7U46HPGkuxXimnvF4kzlAshBjy08eFD4ZI+DqjPf22zZzelas0Xbqt7JhrIcvFRep0NjEy8FZRPuuBWQvbX9kDuXGFow3yMRT9FQTjnv/cZb4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Vmou1kI6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ckSCoVeI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Vmou1kI6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ckSCoVeI"
Date: Tue, 08 Sep 2026 20:51:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900694;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P1er8UX4xlU8SkoiHQkUat0nVm5/pa4Ha7BJselGvuY=;
	b=Vmou1kI6DNKzsKRUOie3WsHzaRqgMabmt2/g0qWEnMi+iyxXy52M5k9bgVg4jtcSDpNLDG
	NwJVmsYi5NTbLXU6yoviBI9nfYsV089nW/ysAqjN5cHCzPuknHMkvs26EgQBPtcmN1Z4m3
	FngRCykdTBhTpU/jKmVY+u1eaygmFuBc/j7zSWZ3eadjj6OOb6PBSJoddo0nrq4keDOPQH
	UlRpFAg7qeu9cyC/BTdkw+OY6JUEfBLD9/iI5+opC+QjVYR4jz4ERQTIiNUTpTZgQyBJw0
	IzKwo1Mv50QuolUVQci6MAUbtR6vNAAIOat9NDXJPM0+j0vq+haLy7Hiq7LAdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900694;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P1er8UX4xlU8SkoiHQkUat0nVm5/pa4Ha7BJselGvuY=;
	b=ckSCoVeInkaSfy1HCzkZpHzoo/uxvoMF3BibpqJiowo4e/tBmYRw7EkdR7yliX2xbAOjOn
	RSsktBtH48ssVDCw==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf/x86: Support SSP sampling using sample_regs_* fields
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-20-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-20-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890069293.623050.10492227654931272226.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     098cdd582a9baa7e4bcb26e80a22ebfddc74293a
Gitweb:        https://git.kernel.org/tip/098cdd582a9baa7e4bcb26e80a22ebfddc7=
4293a
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:27 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:46 +02:00

perf/x86: Support SSP sampling using sample_regs_* fields

Support sampling of CET SSP register via the sample_regs_* fields.

To sample SSP, the sample_simd_regs_enabled field must be set. This
allows the spare space (reclaimed from the original XMM space) in the
sample_regs_* fields to be used for representing SSP.

Similar to eGPRs sampling, the perf_reg_value() function needs to
check if the PERF_SAMPLE_REGS_ABI_SIMD flag is set first, and then
determine whether to output SSP or legacy XMM registers to userspace.

Additionally, arch-PEBS supports sampling SSP, which is placed into the
GPRs group. Also enables arch-PEBS-based SSP sampling.

Currently, SSP sampling is only supported on the x86_64 architecture, as
CET is only available on x86_64 platforms.

SSP sampling will be enabled in a subsequent patch that sets
PERF_PMU_CAP_SIMD_REGS.

Co-developed-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-20-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/core.c                | 15 +++++++++++++++
 arch/x86/events/intel/core.c          |  3 ++-
 arch/x86/events/intel/ds.c            | 13 +++++++++++--
 arch/x86/events/perf_event.h          | 25 +++++++++++++++++++++++++
 arch/x86/include/asm/perf_event.h     |  1 +
 arch/x86/include/uapi/asm/perf_regs.h |  7 ++++---
 arch/x86/kernel/perf_regs.c           |  5 +++++
 7 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 9cd79ac..caa5a0f 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -642,6 +642,10 @@ static int pebs_simd_regs_validate(struct perf_event *ev=
ent)
 	if (event_needs_xmm(event) &&
 	    x86_pmu.arch_pebs && !(caps & ARCH_PEBS_VECR_XMM))
 		return -EINVAL;
+
+	if (event_needs_ssp(event) &&
+	    !(x86_pmu.arch_pebs && (caps & ARCH_PEBS_GPR)))
+		return -EINVAL;
 	/* PEBS does not support YMM/ZMM/OPMASK/eGPR registers sampling yet. */
 	if (event_needs_ymm(event) ||
 	    event_needs_low16_zmm(event) ||
@@ -671,6 +675,9 @@ static int event_simd_regs_validate(struct perf_event *ev=
ent)
 	if (event_needs_egprs(event) &&
 	    !(x86_pmu.ext_regs_mask & XFEATURE_MASK_APX))
 		return -EINVAL;
+	if (event_needs_ssp(event) &&
+	    !(x86_pmu.ext_regs_mask & XFEATURE_MASK_CET_USER))
+		return -EINVAL;
 	if (event_needs_xmm(event) &&
 	    !(x86_pmu.ext_regs_mask & XFEATURE_MASK_SSE))
 		return -EINVAL;
@@ -1854,11 +1861,13 @@ void x86_pmu_clear_perf_regs(struct pt_regs *regs)
 	perf_regs->h16zmm_regs =3D NULL;
 	perf_regs->opmask_regs =3D NULL;
 	perf_regs->egpr_regs =3D NULL;
+	perf_regs->ssp =3D NULL;
 }
=20
 static void update_perf_regs(struct x86_perf_regs *perf_regs,
 			     struct xregs_state *xsave, u64 bitmap)
 {
+	struct cet_user_state *cet;
 	u64 mask;
=20
 	if (!xsave)
@@ -1879,6 +1888,10 @@ static void update_perf_regs(struct x86_perf_regs *per=
f_regs,
 		perf_regs->opmask =3D get_xsave_addr(xsave, XFEATURE_OPMASK);
 	if (mask & XFEATURE_MASK_APX)
 		perf_regs->egpr =3D get_xsave_addr(xsave, XFEATURE_APX);
+	if (mask & XFEATURE_MASK_CET_USER) {
+		cet =3D get_xsave_addr(xsave, XFEATURE_CET_USER);
+		perf_regs->ssp =3D cet ? &cet->user_ssp : NULL;
+	}
 }
=20
 /*
@@ -2057,6 +2070,8 @@ static u64 get_simd_sample_mask(struct perf_event *even=
t, u64 sample_type)
 		mask |=3D XFEATURE_MASK_OPMASK;
 	if (__event_needs_egprs(event, sample_type))
 		mask |=3D XFEATURE_MASK_APX;
+	if (__event_needs_ssp(event, sample_type))
+		mask |=3D XFEATURE_MASK_CET_USER;
=20
 	return mask;
 }
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index b2aa0bc..6538ffe 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -4696,7 +4696,8 @@ static unsigned long intel_pmu_large_pebs_flags(struct =
perf_event *event)
 {
 	unsigned long flags =3D x86_pmu.large_pebs_flags;
 	u64 gprs_mask =3D event->attr.sample_simd_regs_enabled ?
-			PEBS_GP_REGS | PERF_X86_EGPRS_MASK :
+			PEBS_GP_REGS | PERF_X86_EGPRS_MASK |
+			BIT_ULL(PERF_REG_X86_SSP) :
 			PEBS_GP_REGS | PERF_REG_EXTENDED_MASK;
=20
 	if (event->attr.use_clockid)
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 84caae3..59f61e5 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -1707,6 +1707,7 @@ static u64 pebs_update_adaptive_cfg(struct perf_event *=
event)
 	u64 sample_type =3D attr->sample_type;
 	u64 pebs_data_cfg =3D 0;
 	bool gprs, tsx_weight;
+	u64 xgprs_mask;
=20
 	if (!(sample_type & ~(PERF_SAMPLE_IP|PERF_SAMPLE_TIME)) &&
 	    attr->precise_ip > 1)
@@ -1721,10 +1722,13 @@ static u64 pebs_update_adaptive_cfg(struct perf_event=
 *event)
 	 * + precise_ip < 2 for the non event IP
 	 * + For RTM TSX weight we need GPRs for the abort code.
 	 */
+	xgprs_mask =3D event->attr.sample_simd_regs_enabled ?
+		     PEBS_GP_REGS | BIT_ULL(PERF_REG_X86_SSP) :
+		     PEBS_GP_REGS;
 	gprs =3D ((sample_type & PERF_SAMPLE_REGS_INTR) &&
-		(attr->sample_regs_intr & PEBS_GP_REGS)) ||
+		(attr->sample_regs_intr & xgprs_mask)) ||
 	       ((sample_type & PERF_SAMPLE_REGS_USER) &&
-		(attr->sample_regs_user & PEBS_GP_REGS));
+		(attr->sample_regs_user & xgprs_mask));
=20
 	tsx_weight =3D (sample_type & PERF_SAMPLE_WEIGHT_TYPE) &&
 		     ((attr->config & INTEL_ARCH_EVENT_MASK) =3D=3D
@@ -2673,6 +2677,11 @@ again:
 		__setup_pebs_gpr_group(event, regs,
 				       (struct pebs_gprs *)gprs,
 				       sample_type);
+
+		/* Currently only user space mode enables SSP. */
+		if (user_mode(regs) && (sample_type &
+		    (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)))
+			perf_regs->ssp =3D &gprs->ssp;
 	}
=20
 	if (header->aux) {
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index c052a38..1503ab6 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -315,6 +315,31 @@ static inline bool event_needs_egprs(struct perf_event *=
event)
 			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
 }
=20
+static inline bool __event_needs_ssp(struct perf_event *event,
+				     u64 sample_type)
+{
+	if (!event->attr.sample_simd_regs_enabled)
+		return false;
+
+	if ((sample_type & PERF_SAMPLE_REGS_USER) &&
+	    (event->attr.sample_type & PERF_SAMPLE_REGS_USER) &&
+	    (event->attr.sample_regs_user & BIT_ULL(PERF_REG_X86_SSP)))
+		return true;
+
+	if ((sample_type & PERF_SAMPLE_REGS_INTR) &&
+	    (event->attr.sample_type & PERF_SAMPLE_REGS_INTR) &&
+	    (event->attr.sample_regs_intr & BIT_ULL(PERF_REG_X86_SSP)))
+		return true;
+
+	return false;
+}
+
+static inline bool event_needs_ssp(struct perf_event *event)
+{
+	return __event_needs_ssp(event,
+			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
+}
+
 struct amd_nb {
 	int nb_id;  /* NorthBridge id */
 	int refcnt; /* reference count */
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_ev=
ent.h
index bc05f8c..4302ef3 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -753,6 +753,7 @@ struct x86_perf_regs {
 		u64	*egpr_regs;
 		struct apx_state *egpr;
 	};
+	u64	*ssp;
 };
=20
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/as=
m/perf_regs.h
index 977831b..faaa82d 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -30,10 +30,10 @@ enum perf_event_x86_regs {
 	PERF_REG_X86_R14,
 	PERF_REG_X86_R15,
 	/*
-	 * The eGPRs and XMM have overlaps. Only one can be used
+	 * The eGPRs/SSP and XMM have overlaps. Only one can be used
 	 * at a time. The ABI PERF_SAMPLE_REGS_ABI_SIMD is used to
 	 * distinguish which one is used. If PERF_SAMPLE_REGS_ABI_SIMD
-	 * is set, then eGPRs is used, otherwise, XMM is used.
+	 * is set, then eGPRs/SSP is used, otherwise, XMM is used.
 	 *
 	 * Extended GPRs (eGPRs)
 	 */
@@ -53,10 +53,11 @@ enum perf_event_x86_regs {
 	PERF_REG_X86_R29,
 	PERF_REG_X86_R30,
 	PERF_REG_X86_R31,
+	PERF_REG_X86_SSP,
 	/* These are the limits for the GPRs. */
 	PERF_REG_X86_32_MAX =3D PERF_REG_X86_GS + 1,
 	PERF_REG_X86_64_MAX =3D PERF_REG_X86_R15 + 1,
-	PERF_REG_MISC_MAX =3D PERF_REG_X86_R31 + 1,
+	PERF_REG_MISC_MAX =3D PERF_REG_X86_SSP + 1,
=20
 	/* These all need two bits set because they are 128bit */
 	PERF_REG_X86_XMM0  =3D 32,
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 7d4233e..f8952f7 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -72,6 +72,11 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 					return 0;
 				return perf_regs->egpr_regs[idx - PERF_REG_X86_R16];
 			}
+			if (idx =3D=3D PERF_REG_X86_SSP) {
+				if (!perf_regs->ssp)
+					return 0;
+				return *perf_regs->ssp;
+			}
 		} else {
 			if (idx >=3D PERF_REG_X86_XMM0 && idx < PERF_REG_X86_XMM_MAX) {
 				if (!perf_regs->xmm_regs)
