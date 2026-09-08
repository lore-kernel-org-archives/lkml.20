Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704783BE646;
	Tue,  8 Sep 2026 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900707; cv=none; b=B15YhkzAnp1aopdtDhzCNLVEEh2VJ+IC/qdxP2tx1BWG2vTtWhSZpO1JuONa7aHZtM8BHRNfGahOQJQy31qUoGZKM9YBGRLyPBx7VLGfyYUsyYJYUyVkX6rI/OYKPSjL+EQM8GzbgT+i7d/8jXSRlRyM8kEvclZeCErA2ZOlZrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900707; c=relaxed/simple;
	bh=24YIGV30VbQrHnW9VhT1PcbOGcKx21OWORxMkGO+eF0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=qXDHknjNXqQvz5CBU5wicXeBnvRaUlBvG3SyTmKIvkIhaJ2PwV7SAJnNfayC6bay8fdN/5jxhy89xC+a3uA/uyE7s8hgHH4/RS0no3ERk3EYSyOuRfrqoQOeAHu6d3Vc8p2QBHD+RIjBQs1jNnOJEzr/DfaDLoiQ/HZ6/IZfA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LtbRNaa1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MZ0pbyIw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LtbRNaa1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MZ0pbyIw"
Date: Tue, 08 Sep 2026 20:51:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900703;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m2mcwJmE9yqld+FfaGTW+SX0WMir8wB7toM9FGfjGnM=;
	b=LtbRNaa1heH3x0NQccopObQOlNR/0xddBQ3Sa/JgEYVtmUB+o4lFnspyIMmrgP6zHe6nqm
	puCsMxxS3NRSIx8EhPdvJLx6pph6GMiwopXCfEsWJRjyQVuTJ9gYBVLU63C0Tx7W74F+ym
	0TcRxjUlWCto/v/P96OknBewYhBkld9jGTPYG07tfY2vuT3E/QnjuM+cPa6/sQL4iAK6Ab
	EyXkyOpgI4IlVen5vCHiafdz0d0Rg8nSdWB2KjyV8osso+sljsSF3fkTFJ4aF8eyo37YS2
	nv1YhessMe3WM5EcfmbBjbHjT2rQvd0iAt5FbKgIPtmDT9C2tWqPYNV48d83Ug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900703;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m2mcwJmE9yqld+FfaGTW+SX0WMir8wB7toM9FGfjGnM=;
	b=MZ0pbyIwaflUTCq7Jij0bpwcXxdzvhs16avLh3MJjescy5CA4pUWvqqHsoE6GTcNiEm8th
	eAELekVmw5J+HXDg==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86: Support XMM sampling using
 sample_simd_vec_reg_* fields
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-14-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-14-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890070212.623050.16411163593778672941.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     e9d76ada769c45e5363306d22cb10b323f6dc4b5
Gitweb:        https://git.kernel.org/tip/e9d76ada769c45e5363306d22cb10b323f6=
dc4b5
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:21 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:44 +02:00

perf/x86: Support XMM sampling using sample_simd_vec_reg_* fields

Support sampling of XMM registers using the sample_simd_vec_reg_* fields.

When sample_simd_regs_enabled is set, the original XMM space in the
sample_regs_* field is treated as reserved. An INVAL error will be
reported to user space if any bit is set in the original XMM space while
sample_simd_regs_enabled is set.

The perf_reg_value function requires ABI information to understand the
layout of sample_regs. To accommodate this, a new abi field is introduced
in the struct x86_perf_regs to represent ABI information.

Additionally, the x86 specific perf_simd_reg_value() function is
implemented to retrieve the XMM register values.

XMM sampling will be enabled in a subsequent patch that sets
PERF_PMU_CAP_SIMD_REGS.

Co-developed-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-14-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/core.c                | 84 ++++++++++++++++++++++----
 arch/x86/events/intel/ds.c            |  6 +-
 arch/x86/events/perf_event.h          | 36 +++++++++++-
 arch/x86/include/asm/perf_event.h     |  1 +-
 arch/x86/include/uapi/asm/perf_regs.h | 15 +++++-
 arch/x86/kernel/perf_regs.c           | 75 ++++++++++++++++++++++-
 include/linux/perf_event.h            |  1 +-
 kernel/events/core.c                  |  2 +-
 8 files changed, 204 insertions(+), 16 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 2014064..f85163b 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -632,6 +632,34 @@ int x86_pmu_max_precise(struct pmu *pmu)
 	return precise;
 }
=20
+static int pebs_simd_regs_validate(struct perf_event *event)
+{
+	u64 caps =3D hybrid(event->pmu, arch_pebs_cap).caps;
+
+	if (event_needs_xmm(event) &&
+	    !x86_pmu.arch_pebs && !x86_pmu.intel_cap.pebs_baseline)
+		return -EINVAL;
+	if (event_needs_xmm(event) &&
+	    x86_pmu.arch_pebs && !(caps & ARCH_PEBS_VECR_XMM))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int event_simd_regs_validate(struct perf_event *event)
+{
+	if (!get_ext_regs_buf(raw_smp_processor_id()))
+		return -ENOMEM;
+	/* sample_simd_regs_enabled repurposes legacy XMM reg-mask slots. */
+	if (event_has_extended_regs(event))
+		return -EINVAL;
+	if (event_needs_xmm(event) &&
+	    !(x86_pmu.ext_regs_mask & XFEATURE_MASK_SSE))
+		return -EINVAL;
+
+	return 0;
+}
+
 int x86_pmu_hw_config(struct perf_event *event)
 {
 	if (event->attr.precise_ip) {
@@ -703,11 +731,21 @@ int x86_pmu_hw_config(struct perf_event *event)
 	}
=20
 	if (event->attr.sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USE=
R)) {
-		/*
-		 * Besides the general purpose registers, XMM registers may
-		 * be collected as well.
-		 */
-		if (event_has_extended_regs(event)) {
+		int ret;
+
+		if (event->attr.sample_simd_regs_enabled) {
+			if (!(event->pmu->capabilities & PERF_PMU_CAP_SIMD_REGS))
+				return -EINVAL;
+
+			if (event->attr.precise_ip) {
+				ret =3D pebs_simd_regs_validate(event);
+				if (ret)
+					return ret;
+			}
+			ret =3D event_simd_regs_validate(event);
+			if (ret)
+				return ret;
+		} else if (event_has_extended_regs(event)) {
 			if (!(event->pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS))
 				return -EINVAL;
=20
@@ -721,6 +759,8 @@ int x86_pmu_hw_config(struct perf_event *event)
 			}
 			if (!get_ext_regs_buf(raw_smp_processor_id()))
 				return -ENOMEM;
+			if (!(x86_pmu.ext_regs_mask & XFEATURE_MASK_SSE))
+				return -EINVAL;
 		}
 	}
=20
@@ -1777,6 +1817,7 @@ void x86_pmu_clear_perf_regs(struct pt_regs *regs)
 {
 	struct x86_perf_regs *perf_regs =3D container_of(regs, struct x86_perf_regs=
, regs);
=20
+	perf_regs->abi =3D PERF_SAMPLE_REGS_ABI_NONE;
 	perf_regs->xmm_regs =3D NULL;
 }
=20
@@ -1797,14 +1838,15 @@ static void update_perf_regs(struct x86_perf_regs *pe=
rf_regs,
=20
 /*
  * The x86 specific variant of perf_sample_regs_intr().
- * It would be extended to add more SIMD registers sampling support
- * in later patches.
+ * Update data->regs_intr fields for extended registers (e.g., SIMD).
  */
 static void x86_pmu_update_regs_intr(struct perf_event *event,
 				     struct perf_sample_data *data,
 				     struct pt_regs *regs,
 				     bool exclude_kernel)
 {
+	struct x86_perf_regs *perf_regs;
+
 	if (exclude_kernel && !user_mode(regs)) {
 		data->regs_intr.regs =3D NULL;
 		data->regs_intr.abi =3D PERF_SAMPLE_REGS_ABI_NONE;
@@ -1817,6 +1859,14 @@ static void x86_pmu_update_regs_intr(struct perf_event=
 *event,
 	if (data->regs_intr.regs) {
 		data->dyn_size +=3D hweight64(event->attr.sample_regs_intr) *
 				  sizeof(u64);
+		if (event_has_simd_regs(event)) {
+			data->dyn_size +=3D perf_update_xregs_size(event, true);
+			data->regs_intr.abi |=3D PERF_SAMPLE_REGS_ABI_SIMD;
+		}
+
+		perf_regs =3D container_of(data->regs_intr.regs,
+					 struct x86_perf_regs, regs);
+		perf_regs->abi =3D data->regs_intr.abi;
 	}
=20
 	/*
@@ -1878,8 +1928,15 @@ static void x86_pmu_update_regs_user(struct perf_event=
 *event,
 	}
=20
 	data->dyn_size +=3D sizeof(u64);
-	if (data->regs_user.regs)
+	if (data->regs_user.regs) {
 		data->dyn_size +=3D hweight64(attr->sample_regs_user) * sizeof(u64);
+		if (event_has_simd_regs(event)) {
+			data->dyn_size +=3D perf_update_xregs_size(event, false);
+			data->regs_user.abi |=3D PERF_SAMPLE_REGS_ABI_SIMD;
+		}
+
+		x86_regs_user->abi =3D data->regs_user.abi;
+	}
=20
 	/*
 	 * Set PERF_SAMPLE_REGS_USER to bypass perf_sample_regs_user() call
@@ -1954,7 +2011,7 @@ static void x86_pmu_sample_xregs(struct perf_event *eve=
nt,
 		return;
=20
 	if ((sample_type & PERF_SAMPLE_REGS_INTR) && data->regs_intr.regs) {
-		if (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK)
+		if (__event_needs_xmm(event, PERF_SAMPLE_REGS_INTR))
 			intr_mask |=3D XFEATURE_MASK_SSE;
=20
 		intr_mask &=3D x86_pmu.ext_regs_mask;
@@ -1962,7 +2019,7 @@ static void x86_pmu_sample_xregs(struct perf_event *eve=
nt,
 	}
=20
 	if ((sample_type & PERF_SAMPLE_REGS_USER) && data->regs_user.regs) {
-		if (event->attr.sample_regs_user & PERF_REG_EXTENDED_MASK)
+		if (__event_needs_xmm(event, PERF_SAMPLE_REGS_USER))
 			user_mask |=3D XFEATURE_MASK_SSE;
=20
 		user_mask &=3D x86_pmu.ext_regs_mask;
@@ -1995,7 +2052,12 @@ void x86_pmu_update_perf_regs(struct perf_event *event,
 {
 	u64 sample_type =3D event->attr.sample_type;
=20
-	if (!event_has_extended_regs(event))
+	if (!(sample_type &
+	      (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)))
+		return;
+
+	if (!event_needs_xmm(event) &&
+	    !event_has_simd_regs(event))
 		return;
=20
 	if (sample_type & PERF_SAMPLE_REGS_INTR) {
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index d216234..84caae3 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -1733,8 +1733,10 @@ static u64 pebs_update_adaptive_cfg(struct perf_event =
*event)
 	if (gprs || (attr->precise_ip < 2) || tsx_weight)
 		pebs_data_cfg |=3D PEBS_DATACFG_GP;
=20
-	if (event_has_extended_regs(event))
-		pebs_data_cfg |=3D PEBS_DATACFG_XMMS;
+	if (sample_type & (PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER)) {
+		if (event_needs_xmm(event))
+			pebs_data_cfg |=3D PEBS_DATACFG_XMMS;
+	}
=20
 	if (sample_type & PERF_SAMPLE_BRANCH_STACK) {
 		/*
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index f1ab720..57a8263 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -147,6 +147,42 @@ static inline bool is_acr_self_reload_event(struct perf_=
event *event)
 	return test_bit(hwc->idx, (unsigned long *)&hwc->config1);
 }
=20
+static inline bool __event_needs_xmm(struct perf_event *event, u64 sample_ty=
pe)
+{
+	if (event->attr.sample_simd_regs_enabled) {
+		if (event->attr.sample_simd_vec_reg_qwords < PERF_X86_XMM_QWORDS)
+			return false;
+
+		if ((sample_type & PERF_SAMPLE_REGS_USER) &&
+		    (event->attr.sample_type & PERF_SAMPLE_REGS_USER) &&
+		    (event->attr.sample_simd_vec_reg_user > 0))
+			return true;
+
+		if ((sample_type & PERF_SAMPLE_REGS_INTR) &&
+		    (event->attr.sample_type & PERF_SAMPLE_REGS_INTR) &&
+		    (event->attr.sample_simd_vec_reg_intr > 0))
+			return true;
+	} else {
+		if ((sample_type & PERF_SAMPLE_REGS_USER) &&
+		    (event->attr.sample_type & PERF_SAMPLE_REGS_USER) &&
+		    (event->attr.sample_regs_user & PERF_REG_EXTENDED_MASK))
+			return true;
+
+		if ((sample_type & PERF_SAMPLE_REGS_INTR) &&
+		    (event->attr.sample_type & PERF_SAMPLE_REGS_INTR) &&
+		    (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK))
+			return true;
+	}
+
+	return false;
+}
+
+static inline bool event_needs_xmm(struct perf_event *event)
+{
+	return __event_needs_xmm(event,
+			PERF_SAMPLE_REGS_INTR | PERF_SAMPLE_REGS_USER);
+}
+
 struct amd_nb {
 	int nb_id;  /* NorthBridge id */
 	int refcnt; /* reference count */
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_ev=
ent.h
index 619e0ae..a2b2123 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -728,6 +728,7 @@ extern void perf_events_lapic_init(void);
 struct pt_regs;
 struct x86_perf_regs {
 	struct pt_regs	regs;
+	u64		abi;
 	union {
 		u64	*xmm_regs;
 		u32	*xmm_space;	/* for xsaves */
diff --git a/arch/x86/include/uapi/asm/perf_regs.h b/arch/x86/include/uapi/as=
m/perf_regs.h
index 7c9d2bb..edb3540 100644
--- a/arch/x86/include/uapi/asm/perf_regs.h
+++ b/arch/x86/include/uapi/asm/perf_regs.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_X86_PERF_REGS_H
 #define _ASM_X86_PERF_REGS_H
=20
+#include <linux/bits.h>
+
 enum perf_event_x86_regs {
 	PERF_REG_X86_AX,
 	PERF_REG_X86_BX,
@@ -55,4 +57,17 @@ enum perf_event_x86_regs {
=20
 #define PERF_REG_EXTENDED_MASK	(~((1ULL << PERF_REG_X86_XMM0) - 1))
=20
+enum {
+	PERF_X86_SIMD_XMM_REGS      =3D 16,
+	PERF_X86_SIMD_VEC_REGS_MAX  =3D PERF_X86_SIMD_XMM_REGS,
+};
+
+#define PERF_X86_SIMD_VEC_MASK	__GENMASK_ULL(PERF_X86_SIMD_VEC_REGS_MAX - 1,=
 0)
+
+enum {
+	/* 1 qword =3D 8 bytes */
+	PERF_X86_XMM_QWORDS      =3D 2,
+	PERF_X86_SIMD_QWORDS_MAX =3D PERF_X86_XMM_QWORDS,
+};
+
 #endif /* _ASM_X86_PERF_REGS_H */
diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index 81204cb..bccf0fc 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -63,6 +63,9 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
=20
 	if (idx >=3D PERF_REG_X86_XMM0 && idx < PERF_REG_X86_XMM_MAX) {
 		perf_regs =3D container_of(regs, struct x86_perf_regs, regs);
+		/* SIMD registers are moved to dedicated sample_simd_vec_reg */
+		if (perf_regs->abi & PERF_SAMPLE_REGS_ABI_SIMD)
+			return 0;
 		if (!perf_regs->xmm_regs)
 			return 0;
 		return perf_regs->xmm_regs[idx - PERF_REG_X86_XMM0];
@@ -74,6 +77,72 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
 	return regs_get_register(regs, pt_regs_offset[idx]);
 }
=20
+u64 perf_simd_reg_value(struct pt_regs *regs, int idx,
+			u16 qwords_idx, bool pred)
+{
+	struct x86_perf_regs *perf_regs =3D
+			container_of(regs, struct x86_perf_regs, regs);
+
+	if (!(perf_regs->abi & PERF_SAMPLE_REGS_ABI_SIMD))
+		return 0;
+
+	if (pred)
+		return 0;
+
+	if (WARN_ON_ONCE(idx >=3D PERF_X86_SIMD_VEC_REGS_MAX ||
+			 qwords_idx >=3D PERF_X86_SIMD_QWORDS_MAX))
+		return 0;
+
+	if (qwords_idx < PERF_X86_XMM_QWORDS) {
+		if (!perf_regs->xmm_regs)
+			return 0;
+		return perf_regs->xmm_regs[idx * PERF_X86_XMM_QWORDS +
+					   qwords_idx];
+	}
+
+	return 0;
+}
+
+int perf_simd_reg_validate(u16 vec_qwords, u64 vec_mask,
+			   u16 pred_qwords, u32 pred_mask)
+{
+	unsigned long mask;
+	u64 size;
+
+	if (!vec_qwords && !pred_qwords) {
+		if (vec_mask || pred_mask)
+			return -EINVAL;
+	}
+
+	if (vec_qwords) {
+		if (vec_qwords !=3D PERF_X86_XMM_QWORDS)
+			return -EINVAL;
+		if (vec_mask & ~PERF_X86_SIMD_VEC_MASK)
+			return -EINVAL;
+		/* Only full-register sampling is allowed. */
+		mask =3D vec_mask;
+		if (vec_qwords =3D=3D PERF_X86_XMM_QWORDS && mask &&
+		    !bitmap_full(&mask, PERF_X86_SIMD_XMM_REGS))
+			return -EINVAL;
+	}
+
+	/* PRED registers are not supported yet. */
+	if (pred_qwords)
+		return -EINVAL;
+
+	size =3D sizeof(u64) * 4;
+	size +=3D (hweight64(vec_mask) * vec_qwords +
+		 hweight32(pred_mask) * pred_qwords) * sizeof(u64);
+	/*
+	 * INTR_REGS and USR_REGS could be sampled simultaneously,
+	 * so roughly restrict the size to half of U16_MAX.
+	 */
+	if (size >=3D U16_MAX / 2)
+		return -EINVAL;
+
+	return 0;
+}
+
 #define PERF_REG_X86_RESERVED	(((1ULL << PERF_REG_X86_XMM0) - 1) & \
 				 ~((1ULL << PERF_REG_X86_MAX) - 1))
=20
@@ -89,7 +158,8 @@ u64 perf_reg_value(struct pt_regs *regs, int idx)
=20
 int perf_reg_validate(u64 mask)
 {
-	if (!mask || (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED)))
+	/* The mask could be 0 if only the SIMD registers are interested */
+	if (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED))
 		return -EINVAL;
=20
 	return 0;
@@ -108,7 +178,8 @@ u64 perf_reg_abi(struct task_struct *task)
=20
 int perf_reg_validate(u64 mask)
 {
-	if (!mask || (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED)))
+	/* The mask could be 0 if only the SIMD registers are interested */
+	if (mask & (REG_NOSUPPORT | PERF_REG_X86_RESERVED))
 		return -EINVAL;
=20
 	return 0;
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index a2e7eae..7cc2345 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1485,6 +1485,7 @@ static inline void perf_clear_branch_entry_bitfields(st=
ruct perf_branch_entry *b
 	br->reserved	=3D 0;
 }
=20
+extern u64 perf_update_xregs_size(struct perf_event *event, bool intr);
 extern void perf_output_sample(struct perf_output_handle *handle,
 			       struct perf_event_header *header,
 			       struct perf_sample_data *data,
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 3a87c6a..2f84f50 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8720,7 +8720,7 @@ static __always_inline u64 __cond_set(u64 flags, u64 s,=
 u64 d)
 	return d * !!(flags & s);
 }
=20
-static u64 perf_update_xregs_size(struct perf_event *event, bool intr)
+u64 perf_update_xregs_size(struct perf_event *event, bool intr)
 {
 	u16 pred_qwords =3D event->attr.sample_simd_pred_reg_qwords;
 	u16 vec_qwords =3D event->attr.sample_simd_vec_reg_qwords;
