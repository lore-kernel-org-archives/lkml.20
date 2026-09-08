Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82D43B8D40;
	Tue,  8 Sep 2026 20:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900696; cv=none; b=qXGAigf7br6irpNAk6xg4Y1ce84pIS0hx0iJfdteclLGxqw8C0ud4tp7KHvU7eFbsI0km1+8/0JS8NHUHxF3kZ+BxsRZp1xgC9qBtzHflRQwF/bgZcBSTqW3pXoQDLiunLcQKCy47GQ/rrx2+dKiYYGWj6SkJp7gMJ9jqnp9FX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900696; c=relaxed/simple;
	bh=DOTFfheUf5HF1DKYkiEOUeW62JJMsoIi+MDBmr46IE8=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Gws9Ho4W/IdUH67l8Fr4Q66gC/OMamJipiNrqXLCHYK1Q1ZuhPcKWHfyqCVbPkfRGkphdQsLppR1GsRNi/vDnCQGNROgu7HEZAiQ8fpDuImtKmv3XHT5VEgieYwjkF6JsOUisHBz+7Dxf1eY5TGKKYjacWeEt6hVD1e8JknR+OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sGRxUYfU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C5letJP3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sGRxUYfU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C5letJP3"
Date: Tue, 08 Sep 2026 20:51:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900693;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oe8aKwzowiIrZw1eljJ3MdOYBvK8IVd/VkcbMtwWPWA=;
	b=sGRxUYfUAaOOXx1U3w+VTJdZSv2jgO0/cPkwtcJnwlw918IHorsr1Q0F98ruAeGWrVUjQn
	q0i5lwoGtFk1IbTGJT/5nFfBhlWMdXG2j0BS+gRxvX/dQv7MbeJ4C8zciGxzg+4eIBides
	X59Nb9S5Ge0d9yDc1IzdaHNr6BFPorh6FOXAd+861h/EtWuSPgKMCopk3jhtDktSy8Vzsj
	3Yq6/47WhQHm9vVFtV/Z4xKtOcxeHfInVXRKZIAJDOzsAiOU3L/f3zesAUtdZAqctaRS1A
	pZek4SzKg3DpYJouMLqx1RpvuqvkZwvLtr9m01Zla8M2wwXv8iYmU4jRHCg7BQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900693;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oe8aKwzowiIrZw1eljJ3MdOYBvK8IVd/VkcbMtwWPWA=;
	b=C5letJP3xkBy/9BzF7CMTSAATbFq5WMkDSZoQovAgFMyljkOeALHuVo1BmQlU4KaxnRCQU
	ivlssscWneTsQTBQ==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf/x86/intel: Support arch-PEBS based SIMD/eGPRs sampling
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-21-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-21-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890069146.623050.13773329671750876897.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     c4fabb67a47f8103b80fadfcab3ba17e75784ab5
Gitweb:        https://git.kernel.org/tip/c4fabb67a47f8103b80fadfcab3ba17e757=
84ab5
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:28 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:46 +02:00

perf/x86/intel: Support arch-PEBS based SIMD/eGPRs sampling

Support arch-PEBS based SIMD/eGPRs/SSP registers sampling.

Arch-PEBS supports sampling all of these registers. SIMD and eGPR
registers are placed into the XSAVE-Enabled Registers (XER) group with
the layout described below.

Field Name 	Registers Used 			Size

XSTATE_BV	XINUSE for groups		8 B
Reserved 	Reserved 			8 B
SSER 		XMM0-XMM15 			16 regs * 16 B =3D 256 B
YMMHIR 		Upper 128 bits of YMM0-YMM15 	16 regs * 16 B =3D 256 B
EGPR 		R16-R31 			16 regs *  8 B =3D 128 B
OPMASKR 	K0-K7 				 8 regs *  8 B =3D 64 B
ZMMHIR 		Upper 256 bits of ZMM0-ZMM15 	16 regs * 32 B =3D 512 B
Hi16ZMMR 	ZMM16-ZMM31 			16 regs * 64 B =3D 1024 B

Memory space in the output buffer is allocated for these sub-groups as
long as the corresponding Format.XER[55:49] bits in the PEBS record
header are set. However, the arch-PEBS hardware engine does not write
the sub-group if it is not used (in INIT state). In such cases, the
corresponding bit in the XSTATE_BV bitmap is set to 0. Therefore, the
XSTATE_BV field is checked to determine if the register data is actually
written for each PEBS record. If not, the register data is not outputted
to userspace.

Additionally, the MSRs IA32_PMC_{GPn|FXm}_CFG_C.[55:49] bits are used to
manage which types of these registers need to be sampled.

Arch-PEBS based SIMD/eGPRs sampling will be enabled in a subsequent
patch that sets PERF_PMU_CAP_SIMD_REGS.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-21-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/core.c            | 20 ++++++---
 arch/x86/events/intel/core.c      | 15 +++++++-
 arch/x86/events/intel/ds.c        | 67 ++++++++++++++++++++++++++++--
 arch/x86/include/asm/msr-index.h  |  7 +++-
 arch/x86/include/asm/perf_event.h |  8 +++-
 5 files changed, 106 insertions(+), 11 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index caa5a0f..11799ac 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -646,12 +646,20 @@ static int pebs_simd_regs_validate(struct perf_event *e=
vent)
 	if (event_needs_ssp(event) &&
 	    !(x86_pmu.arch_pebs && (caps & ARCH_PEBS_GPR)))
 		return -EINVAL;
-	/* PEBS does not support YMM/ZMM/OPMASK/eGPR registers sampling yet. */
-	if (event_needs_ymm(event) ||
-	    event_needs_low16_zmm(event) ||
-	    event_needs_high16_zmm(event) ||
-	    event_needs_opmask(event) ||
-	    event_needs_egprs(event))
+	if (event_needs_ymm(event) &&
+	    !(x86_pmu.arch_pebs && (caps & ARCH_PEBS_VECR_YMMH)))
+		return -EINVAL;
+	if (event_needs_egprs(event) &&
+	    !(x86_pmu.arch_pebs && (caps & ARCH_PEBS_VECR_EGPRS)))
+		return -EINVAL;
+	if (event_needs_opmask(event) &&
+	    !(x86_pmu.arch_pebs && (caps & ARCH_PEBS_VECR_OPMASK)))
+		return -EINVAL;
+	if (event_needs_low16_zmm(event) &&
+	    !(x86_pmu.arch_pebs && (caps & ARCH_PEBS_VECR_ZMMH)))
+		return -EINVAL;
+	if (event_needs_high16_zmm(event) &&
+	    !(x86_pmu.arch_pebs && (caps & ARCH_PEBS_VECR_H16ZMM)))
 		return -EINVAL;
=20
 	return 0;
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 6538ffe..f873462 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3474,6 +3474,21 @@ static void intel_pmu_enable_event_ext(struct perf_eve=
nt *event)
 			if (pebs_data_cfg & PEBS_DATACFG_XMMS)
 				ext |=3D ARCH_PEBS_VECR_XMM & cap.caps;
=20
+			if (pebs_data_cfg & PEBS_DATACFG_YMMHS)
+				ext |=3D ARCH_PEBS_VECR_YMMH & cap.caps;
+
+			if (pebs_data_cfg & PEBS_DATACFG_EGPRS)
+				ext |=3D ARCH_PEBS_VECR_EGPRS & cap.caps;
+
+			if (pebs_data_cfg & PEBS_DATACFG_OPMASKS)
+				ext |=3D ARCH_PEBS_VECR_OPMASK & cap.caps;
+
+			if (pebs_data_cfg & PEBS_DATACFG_ZMMHS)
+				ext |=3D ARCH_PEBS_VECR_ZMMH & cap.caps;
+
+			if (pebs_data_cfg & PEBS_DATACFG_H16ZMMS)
+				ext |=3D ARCH_PEBS_VECR_H16ZMM & cap.caps;
+
 			if (pebs_data_cfg & PEBS_DATACFG_LBRS)
 				ext |=3D ARCH_PEBS_LBR & cap.caps;
=20
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 59f61e5..4335ae6 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -1740,6 +1740,16 @@ static u64 pebs_update_adaptive_cfg(struct perf_event =
*event)
 	if (sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)) {
 		if (event_needs_xmm(event))
 			pebs_data_cfg |=3D PEBS_DATACFG_XMMS;
+		if (x86_pmu.arch_pebs && event_needs_ymm(event))
+			pebs_data_cfg |=3D PEBS_DATACFG_YMMHS;
+		if (x86_pmu.arch_pebs && event_needs_low16_zmm(event))
+			pebs_data_cfg |=3D PEBS_DATACFG_ZMMHS;
+		if (x86_pmu.arch_pebs && event_needs_high16_zmm(event))
+			pebs_data_cfg |=3D PEBS_DATACFG_H16ZMMS;
+		if (x86_pmu.arch_pebs && event_needs_opmask(event))
+			pebs_data_cfg |=3D PEBS_DATACFG_OPMASKS;
+		if (x86_pmu.arch_pebs && event_needs_egprs(event))
+			pebs_data_cfg |=3D PEBS_DATACFG_EGPRS;
 	}
=20
 	if (sample_type & PERF_SAMPLE_BRANCH_STACK) {
@@ -2694,14 +2704,63 @@ again:
 					   meminfo->tsx_tuning, ax);
 	}
=20
-	if (header->xmm) {
+	if (header->xmm || header->ymmh || header->egpr ||
+	    header->opmask || header->zmmh || header->h16zmm) {
+		struct arch_pebs_xer_header *xer_header =3D next_record;
 		struct pebs_xmm *xmm;
+		struct ymmh_struct *ymmh;
+		struct avx_512_zmm_uppers_state *zmmh;
+		struct avx_512_hi16_state *h16zmm;
+		struct avx_512_opmask_state *opmask;
+		struct apx_state *egpr;
=20
 		next_record +=3D sizeof(struct arch_pebs_xer_header);
=20
-		xmm =3D next_record;
-		perf_regs->xmm_regs =3D xmm->xmm;
-		next_record =3D xmm + 1;
+		if (header->xmm) {
+			xmm =3D next_record;
+			/*
+			 * Only output XMM regs to user space when arch-PEBS
+			 * really writes data into xstate area.
+			 */
+			if (xer_header->xstate & XFEATURE_MASK_SSE)
+				perf_regs->xmm_regs =3D xmm->xmm;
+			next_record =3D xmm + 1;
+		}
+
+		if (header->ymmh) {
+			ymmh =3D next_record;
+			if (xer_header->xstate & XFEATURE_MASK_YMM)
+				perf_regs->ymmh =3D ymmh;
+			next_record =3D ymmh + 1;
+		}
+
+		if (header->egpr) {
+			egpr =3D next_record;
+			if (xer_header->xstate & XFEATURE_MASK_APX)
+				perf_regs->egpr =3D egpr;
+			next_record =3D egpr + 1;
+		}
+
+		if (header->opmask) {
+			opmask =3D next_record;
+			if (xer_header->xstate & XFEATURE_MASK_OPMASK)
+				perf_regs->opmask =3D opmask;
+			next_record =3D opmask + 1;
+		}
+
+		if (header->zmmh) {
+			zmmh =3D next_record;
+			if (xer_header->xstate & XFEATURE_MASK_ZMM_Hi256)
+				perf_regs->zmmh =3D zmmh;
+			next_record =3D zmmh + 1;
+		}
+
+		if (header->h16zmm) {
+			h16zmm =3D next_record;
+			if (xer_header->xstate & XFEATURE_MASK_Hi16_ZMM)
+				perf_regs->h16zmm =3D h16zmm;
+			next_record =3D h16zmm + 1;
+		}
 	}
=20
 	if (header->lbr) {
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-inde=
x.h
index 3a8e51a..428eb44 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -350,6 +350,13 @@
 #define ARCH_PEBS_LBR_SHIFT		40
 #define ARCH_PEBS_LBR			(0x3ull << ARCH_PEBS_LBR_SHIFT)
 #define ARCH_PEBS_VECR_XMM		BIT_ULL(49)
+#define ARCH_PEBS_VECR_YMMH		BIT_ULL(50)
+#define ARCH_PEBS_VECR_EGPRS		BIT_ULL(51)
+#define ARCH_PEBS_VECR_OPMASK		BIT_ULL(53)
+#define ARCH_PEBS_VECR_ZMMH		BIT_ULL(54)
+#define ARCH_PEBS_VECR_H16ZMM		BIT_ULL(55)
+#define ARCH_PEBS_VECR_EXT_SHIFT	49
+#define ARCH_PEBS_VECR_EXT		(0x7full << ARCH_PEBS_VECR_EXT_SHIFT)
 #define ARCH_PEBS_GPR			BIT_ULL(61)
 #define ARCH_PEBS_AUX			BIT_ULL(62)
 #define ARCH_PEBS_EN			BIT_ULL(63)
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_ev=
ent.h
index 4302ef3..12f7db8 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -150,6 +150,11 @@
 #define PEBS_DATACFG_LBRS	BIT_ULL(3)
 #define PEBS_DATACFG_CNTR	BIT_ULL(4)
 #define PEBS_DATACFG_METRICS	BIT_ULL(5)
+#define PEBS_DATACFG_YMMHS	BIT_ULL(6)
+#define PEBS_DATACFG_OPMASKS	BIT_ULL(7)
+#define PEBS_DATACFG_ZMMHS	BIT_ULL(8)
+#define PEBS_DATACFG_H16ZMMS	BIT_ULL(9)
+#define PEBS_DATACFG_EGPRS	BIT_ULL(10)
 #define PEBS_DATACFG_LBR_SHIFT	24
 #define PEBS_DATACFG_CNTR_SHIFT	32
 #define PEBS_DATACFG_CNTR_MASK	GENMASK_ULL(15, 0)
@@ -547,7 +552,8 @@ struct arch_pebs_header {
 			    rsvd3:7,
 			    xmm:1,
 			    ymmh:1,
-			    rsvd4:2,
+			    egpr:1,
+			    rsvd4:1,
 			    opmask:1,
 			    zmmh:1,
 			    h16zmm:1,
