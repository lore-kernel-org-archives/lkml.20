Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55D93D1AA2;
	Tue,  8 Sep 2026 20:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900712; cv=none; b=gl4cqH0JUvDia2AXer/S+TJ0kxtjHe9Mk0O/SqK0/0lfZO9HxGDElePeJNVDyRfbn9r49OFiSiLTMxFe62qzQhw6e8MUqBibeK2N9+u1jP06kQEGp1JiY6q4mDP3Dnig8a4tykLmN9csnLOMnodQMTReQUuJB7zqTfIT9Dsp7G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900712; c=relaxed/simple;
	bh=DskiF4qij0YG3vZxaIdrkEqyP6GI/uPXzdoEcb4rUWE=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=D7+d7kHBDTlDiE8OnC/8SEmEZkxwgC6h0X8GWTCwGDE2wMkzOJgy8sYhiNMz7zpErvOAXklgKt7YZEgSFKhXeklfWJRQYdudHrYPpRC8VSMPcXtj/Dmpw+PVkMO2Ep9deEE/9d8+R2TzIAk+fJHbXYfEkr+T92rt1t67ZxzbmuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sbw4t9uV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RKyfG5bT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sbw4t9uV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RKyfG5bT"
Date: Tue, 08 Sep 2026 20:51:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900708;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3vOviaUE5oj1L3IczgKyI19PP1TxTq4Rfxw9OSDcfk=;
	b=sbw4t9uVYKCC3NLy57FtVOtOuHAPeNqFFi69dXwDHnmx0FGImpv8P7B8qmr/j3jyszB8oZ
	wpe2LtdLf3Jgw6pm3LySQaqKbZNxH8zwmdODTTrQ0CQ8qGECG8RXGCycnpVP9BTiMZIJA9
	YaK9jqfC5ZON8aeBLxa7rr4cg+fiQD5u8dgszb6vImwxxYc3ZzyL/wY7UiYBInRmaVniu6
	lX/DkA3PYUj42wm20yirR2qoj9KvDaAokzuXEp5vUOZVKDM+9bokFiFy4D7Fcs+vgxOGGk
	oiPzjP+qiCaQ+3c9sw6jlmp2zP6JmA+48uFQShxiSAE+tiUxCxn9t27CMQcC4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900708;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3vOviaUE5oj1L3IczgKyI19PP1TxTq4Rfxw9OSDcfk=;
	b=RKyfG5bT/73uzM6jIrncGEbJlcQ40FyOsduOtxBkgszFYpGVOOTdqzhV7I+/zCYTcrLw0n
	uvKX5riBQnUJKVDA==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf/x86: Enable XMM register sampling for non-PEBS events
Cc: Kan Liang <kan.liang@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-11-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-11-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890070664.623050.10725826628846250971.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     b84c962836848f4687a55e6ad219d8ee861a94ed
Gitweb:        https://git.kernel.org/tip/b84c962836848f4687a55e6ad219d8ee861=
a94ed
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:18 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:42 +02:00

perf/x86: Enable XMM register sampling for non-PEBS events

Previously, XMM register sampling was only available for PEBS events
starting from Icelake. Extend the support to non-PEBS events using
the xsaves instruction, thereby completing the feature set.

To implement this, a 64-byte aligned buffer is required. A per-CPU
ext_regs_buf is introduced to store SIMD and other registers, with an
approximate size of 2K. The buffer is allocated using kzalloc_node(),
ensuring natural and 64-byte alignment for all kmalloc() allocations
with powers of 2.

XMM sampling for non-PEBS events is supported in the REGS_INTR case.
Support for REGS_USER will be added in a subsequent patch. For PEBS
events, XMM register sampling data is directly retrieved from PEBS
records.

Future support for additional vector registers (YMM/ZMM/OPMASK) is
planned. An ext_regs_mask is added to track the supported vector
register groups.

Co-developed-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-11-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/core.c            | 185 +++++++++++++++++++++++++++--
 arch/x86/events/intel/core.c      |  24 +++-
 arch/x86/events/intel/ds.c        |   8 +-
 arch/x86/events/perf_event.h      |  13 ++-
 arch/x86/include/asm/fpu/xstate.h |   2 +-
 arch/x86/include/asm/perf_event.h |   5 +-
 arch/x86/kernel/fpu/xstate.c      |   2 +-
 7 files changed, 219 insertions(+), 20 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 3368270..1c3e2bf 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -408,6 +408,53 @@ set_ext_hw_attr(struct hw_perf_event *hwc, struct perf_e=
vent *event)
 	return x86_pmu_extra_regs(val, event);
 }
=20
+static DEFINE_PER_CPU(struct xregs_state *, ext_regs_buf);
+
+static void release_ext_regs_buffers(void)
+{
+	int cpu;
+
+	if (!x86_pmu.ext_regs_mask)
+		return;
+
+	for_each_possible_cpu(cpu) {
+		kfree(per_cpu(ext_regs_buf, cpu));
+		per_cpu(ext_regs_buf, cpu) =3D NULL;
+	}
+}
+
+static void reserve_ext_regs_buffers(void)
+{
+	bool compacted =3D cpu_feature_enabled(X86_FEATURE_XCOMPACTED);
+	unsigned int size;
+	int cpu;
+
+	if (!x86_pmu.ext_regs_mask)
+		return;
+
+	/* Add 64 bytes to satisfy the XSAVE area's 64-byte alignment. */
+	size =3D xstate_calculate_size(x86_pmu.ext_regs_mask, compacted) + 64;
+
+	for_each_possible_cpu(cpu) {
+		per_cpu(ext_regs_buf, cpu) =3D kzalloc_node(size, GFP_KERNEL,
+							  cpu_to_node(cpu));
+		if (WARN_ON_ONCE(!per_cpu(ext_regs_buf, cpu)))
+			goto err;
+	}
+
+	return;
+
+err:
+	release_ext_regs_buffers();
+}
+
+static inline struct xregs_state *get_ext_regs_buf(int cpu)
+{
+	void *buf =3D per_cpu(ext_regs_buf, cpu);
+
+	return buf ? PTR_ALIGN(buf, 64) : NULL;
+}
+
 int x86_reserve_hardware(void)
 {
 	int err =3D 0;
@@ -420,6 +467,7 @@ int x86_reserve_hardware(void)
 			} else {
 				reserve_ds_buffers();
 				reserve_lbr_buffers();
+				reserve_ext_regs_buffers();
 			}
 		}
 		if (!err)
@@ -436,6 +484,7 @@ void x86_release_hardware(void)
 		release_pmc_hardware();
 		release_ds_buffers();
 		release_lbr_buffers();
+		release_ext_regs_buffers();
 		mutex_unlock(&pmc_reserve_mutex);
 	}
 }
@@ -653,18 +702,31 @@ int x86_pmu_hw_config(struct perf_event *event)
 			return -EINVAL;
 	}
=20
-	/* sample_regs_user never support XMM registers */
-	if (unlikely(event->attr.sample_regs_user & PERF_REG_EXTENDED_MASK))
-		return -EINVAL;
-	/*
-	 * Besides the general purpose registers, XMM registers may
-	 * be collected in PEBS on some platforms, e.g. Icelake
-	 */
-	if (unlikely(event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK)) {
-		if (!(event->pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS))
-			return -EINVAL;
+	if (event->attr.sample_type & PERF_SAMPLE_REGS_INTR) {
+		/*
+		 * Besides the general purpose registers, XMM registers may
+		 * be collected as well.
+		 */
+		if (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK) {
+			if (!(event->pmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS))
+				return -EINVAL;
+
+			if (event->attr.precise_ip) {
+				u64 caps =3D hybrid(event->pmu, arch_pebs_cap).caps;
=20
-		if (!event->attr.precise_ip)
+				if (x86_pmu.arch_pebs && !(caps & ARCH_PEBS_VECR_XMM))
+					return -EINVAL;
+				if (!x86_pmu.arch_pebs && !x86_pmu.intel_cap.pebs_baseline)
+					return -EINVAL;
+			}
+			if (!get_ext_regs_buf(raw_smp_processor_id()))
+				return -ENOMEM;
+		}
+	}
+
+	if (event->attr.sample_type & PERF_SAMPLE_REGS_USER) {
+		/* XMM registers sampling for REGS_USER is not supported yet. */
+		if (event->attr.sample_regs_user & PERF_REG_EXTENDED_MASK)
 			return -EINVAL;
 	}
=20
@@ -1717,6 +1779,107 @@ do_del:
 	static_call_cond(x86_pmu_del)(event);
 }
=20
+void x86_pmu_clear_perf_regs(struct pt_regs *regs)
+{
+	struct x86_perf_regs *perf_regs =3D container_of(regs, struct x86_perf_regs=
, regs);
+
+	perf_regs->xmm_regs =3D NULL;
+}
+
+static void update_perf_regs(struct x86_perf_regs *perf_regs,
+			     struct xregs_state *xsave, u64 bitmap)
+{
+	u64 mask;
+
+	if (!xsave)
+		return;
+
+	/* Restrict to features actually saved by XSAVES */
+	mask =3D bitmap & xsave->header.xfeatures;
+
+	if (mask & XFEATURE_MASK_SSE)
+		perf_regs->xmm_space =3D xsave->i387.xmm_space;
+}
+
+/*
+ * The x86 specific variant of perf_sample_regs_intr().
+ * It would be extended to add more SIMD registers sampling support
+ * in later patches.
+ */
+static void x86_pmu_update_regs_intr(struct perf_event *event,
+				     struct perf_sample_data *data,
+				     struct pt_regs *regs,
+				     bool exclude_kernel)
+{
+	if (exclude_kernel && !user_mode(regs)) {
+		data->regs_intr.regs =3D NULL;
+		data->regs_intr.abi =3D PERF_SAMPLE_REGS_ABI_NONE;
+	} else {
+		data->regs_intr.regs =3D regs;
+		data->regs_intr.abi =3D perf_reg_abi(current);
+	}
+
+	data->dyn_size +=3D sizeof(u64);
+	if (data->regs_intr.regs) {
+		data->dyn_size +=3D hweight64(event->attr.sample_regs_intr) *
+				  sizeof(u64);
+	}
+
+	/*
+	 * Set PERF_SAMPLE_REGS_INTR to bypass perf_sample_regs_intr() call
+	 * in perf_prepare_sample() function.
+	 */
+	data->sample_flags |=3D PERF_SAMPLE_REGS_INTR;
+}
+
+static void x86_pmu_sample_xregs(struct perf_event *event,
+				 struct perf_sample_data *data,
+				 bool from_pebs)
+{
+	struct xregs_state *xsave =3D get_ext_regs_buf(smp_processor_id());
+	u64 sample_type =3D event->attr.sample_type;
+	struct x86_perf_regs *perf_regs;
+	u64 intr_mask =3D 0;
+
+	if (WARN_ON_ONCE(!xsave) || !in_nmi())
+		return;
+
+	if ((sample_type & PERF_SAMPLE_REGS_INTR) && data->regs_intr.regs) {
+		if (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK)
+			intr_mask |=3D XFEATURE_MASK_SSE;
+
+		intr_mask &=3D x86_pmu.ext_regs_mask;
+		intr_mask =3D from_pebs ? 0 : intr_mask;
+	}
+
+	if (intr_mask) {
+		perf_regs =3D container_of(data->regs_intr.regs,
+					 struct x86_perf_regs, regs);
+		xsave->header.xfeatures =3D 0;
+		xsaves_nmi(xsave, intr_mask);
+		update_perf_regs(perf_regs, xsave, intr_mask);
+	}
+}
+
+void x86_pmu_update_perf_regs(struct perf_event *event,
+			      struct perf_sample_data *data,
+			      struct pt_regs *regs,
+			      bool from_pebs)
+{
+	u64 sample_type =3D event->attr.sample_type;
+
+	if (!((sample_type & PERF_SAMPLE_REGS_INTR) &&
+	      (event->attr.sample_regs_intr & PERF_REG_EXTENDED_MASK)))
+		return;
+
+	if (sample_type & PERF_SAMPLE_REGS_INTR) {
+		x86_pmu_update_regs_intr(event, data, regs,
+					 event->attr.exclude_kernel);
+	}
+
+	x86_pmu_sample_xregs(event, data, from_pebs);
+}
+
 int x86_pmu_handle_irq(struct pt_regs *regs)
 {
 	struct perf_sample_data data;
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 44332ec..ddf7261 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3925,6 +3925,9 @@ static int handle_pmi_common(struct pt_regs *regs, u64 =
status)
 		if (has_branch_stack(event))
 			intel_pmu_lbr_save_brstack(&data, cpuc, event);
=20
+		x86_pmu_clear_perf_regs(regs);
+		x86_pmu_update_perf_regs(event, &data, regs, false);
+
 		perf_event_overflow(event, &data, regs);
 	}
=20
@@ -6165,12 +6168,23 @@ static inline bool intel_pmu_broken_perf_cap(void)
 static inline void __intel_update_pmu_xregs_caps(struct pmu *pmu)
 {
 	struct pmu *dest_pmu =3D pmu ? pmu : x86_get_pmu(smp_processor_id());
-	u64 caps =3D hybrid(pmu, arch_pebs_cap).caps;
=20
-	if ((x86_pmu.arch_pebs && (caps & ARCH_PEBS_VECR_XMM)) ||
-	    (!x86_pmu.arch_pebs && x86_pmu.intel_cap.pebs_format >=3D 4 &&
-	     x86_pmu.intel_cap.pebs_baseline))
-		dest_pmu->capabilities |=3D PERF_PMU_CAP_EXTENDED_REGS;
+	/* Only support the extension when XSAVES is available. */
+	if (!boot_cpu_has(X86_FEATURE_XSAVES))
+		return;
+
+	if (!boot_cpu_has(X86_FEATURE_XMM) ||
+	    !cpu_has_xfeatures(XFEATURE_MASK_SSE, NULL))
+		return;
+
+	/*
+	 * On current hybrid platforms, P-cores and E-cores expose the same
+	 * XSAVE feature set. Therefore, using the global x86_pmu.ext_regs_mask
+	 * is sufficient to represent the hardware-supported XSAVE features.
+	 */
+	x86_pmu.ext_regs_mask |=3D XFEATURE_MASK_SSE;
+
+	dest_pmu->capabilities |=3D PERF_PMU_CAP_EXTENDED_REGS;
 }
=20
 static inline void __intel_update_large_pebs_flags(struct pmu *pmu)
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index e18906a..e14f8c2 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -2515,7 +2515,7 @@ static void setup_pebs_adaptive_sample_data(struct perf=
_event *event,
 		return;
=20
 	perf_regs =3D container_of(regs, struct x86_perf_regs, regs);
-	perf_regs->xmm_regs =3D NULL;
+	x86_pmu_clear_perf_regs(regs);
=20
 	format_group =3D basic->format_group;
=20
@@ -2600,6 +2600,8 @@ static void setup_pebs_adaptive_sample_data(struct perf=
_event *event,
 		next_record +=3D nr * sizeof(u64);
 	}
=20
+	x86_pmu_update_perf_regs(event, data, regs, true);
+
 	WARN_ONCE(next_record !=3D __pebs + basic->format_size,
 			"PEBS record size %u, expected %llu, config %llx\n",
 			basic->format_size,
@@ -2632,7 +2634,7 @@ static void setup_arch_pebs_sample_data(struct perf_eve=
nt *event,
 		return;
=20
 	perf_regs =3D container_of(regs, struct x86_perf_regs, regs);
-	perf_regs->xmm_regs =3D NULL;
+	x86_pmu_clear_perf_regs(regs);
=20
 	__setup_perf_sample_data(event, iregs, data);
=20
@@ -2734,6 +2736,8 @@ again:
 		at =3D at + header->size;
 		goto again;
 	}
+
+	x86_pmu_update_perf_regs(event, data, regs, true);
 }
=20
 static inline void *
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 71ed5b2..f1ab720 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -1029,6 +1029,12 @@ struct x86_pmu {
 	unsigned int flags;
=20
 	/*
+	 * Extended regs, e.g., vector registers
+	 * Utilize the same format as the XFEATURE_MASK_*
+	 */
+	u64		ext_regs_mask;
+
+	/*
 	 * Intel host/guest support (KVM)
 	 */
 	struct perf_guest_switch_msr *(*guest_get_msrs)(int *nr, void *data);
@@ -1315,6 +1321,13 @@ void x86_pmu_enable_event(struct perf_event *event);
=20
 int x86_pmu_handle_irq(struct pt_regs *regs);
=20
+void x86_pmu_clear_perf_regs(struct pt_regs *regs);
+
+void x86_pmu_update_perf_regs(struct perf_event *event,
+			      struct perf_sample_data *data,
+			      struct pt_regs *regs,
+			      bool from_pebs);
+
 void x86_pmu_show_pmu_cap(struct pmu *pmu);
=20
 static inline int x86_pmu_num_counters(struct pmu *pmu)
diff --git a/arch/x86/include/asm/fpu/xstate.h b/arch/x86/include/asm/fpu/xst=
ate.h
index 38fa8ff..19dec5f 100644
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@ -112,6 +112,8 @@ void xsaves(struct xregs_state *xsave, u64 mask);
 void xrstors(struct xregs_state *xsave, u64 mask);
 void xsaves_nmi(struct xregs_state *xsave, u64 mask);
=20
+unsigned int xstate_calculate_size(u64 xfeatures, bool compacted);
+
 int xfd_enable_feature(u64 xfd_err);
=20
 #ifdef CONFIG_X86_64
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_ev=
ent.h
index 1eb1367..619e0ae 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -728,7 +728,10 @@ extern void perf_events_lapic_init(void);
 struct pt_regs;
 struct x86_perf_regs {
 	struct pt_regs	regs;
-	u64		*xmm_regs;
+	union {
+		u64	*xmm_regs;
+		u32	*xmm_space;	/* for xsaves */
+	};
 };
=20
 extern unsigned long perf_arch_instruction_pointer(struct pt_regs *regs);
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index d39c015..3e7f5fb 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -587,7 +587,7 @@ static bool __init check_xstate_against_struct(int nr)
 	return true;
 }
=20
-static unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
+unsigned int xstate_calculate_size(u64 xfeatures, bool compacted)
 {
 	unsigned int topmost =3D fls64(xfeatures) -  1;
 	unsigned int offset, i;
