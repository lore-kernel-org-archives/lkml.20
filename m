Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70C53B71A8;
	Tue,  8 Sep 2026 20:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900693; cv=none; b=DFRiaCXCkpV2DonYzqSEuyjorpjCGkKrzozMPkyaleaR68szCVVcFOzjwlQVlxLWzSslqjx4hbJeLF8EDX2GnNjyvk9AhG0+Mxh0Yn6gbtRDqmIAAgznu6H4bzSK0XU26EdSnF1FmKtMzLVkAUISag2BH+KdAJwY8ALNp5EgTlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900693; c=relaxed/simple;
	bh=L9pjQ/fJNiw6VRAbbMeLZo3FU/MAYH2gHRxn3EeRK2E=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=miwHETK6Imhg7+6MLYU8FoMFjBC63NQH5SELA6q/jErVk0Y8R1HnfVd5eHFpd1uIVUPIsZZaXBCDktmNPppSz+qxqcVLB1foDb2b9nC0Njl4lK2KNzb/CYjSLn6O20a4BPOsO0sMJhPXHD3M5/sU2wxSSijPR/LQAQbFusOuYD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4GVD0cdJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OBNgA3Sd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4GVD0cdJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OBNgA3Sd"
Date: Tue, 08 Sep 2026 20:51:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900690;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ai0bnVm4M/dtV5YvVN+Un/RmBTVr6WMhDSPWGhGuoGk=;
	b=4GVD0cdJkd+rMqonV3rez6QH33AKKRMbpP0Oxtp45lHNm+0CJ/7uhhUT/jWOhc/q35G6BP
	gKvMr47Qcb2Bli/XsbIXk+2SN1TN+SdcNkFC5f7HgSvbcPWldTEFmKzWB+/Cx+Ng7c5KMn
	uS1eIyN2HxMRqZSKk/MpwQQSlO3ZGOhg+0wCM3GAq+vSCogCOiwcS9SeB6+9GdZDQwRuta
	viUJhK1ZdeDfH97WKKDEFE5MLGQfcCQ9nyWwsRhStXUCT/KyK7UG8HTFFz4y0eu6Fj9Y6D
	VF++riU2nDz3bUpqto1DSKrdDMRzoCAU+mEP0u6JtHl3290H60Q57z1F3cm0qg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900690;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ai0bnVm4M/dtV5YvVN+Un/RmBTVr6WMhDSPWGhGuoGk=;
	b=OBNgA3Sd0duR5tcDsCiAASNxnmCjpgKtV4Mdamjs3Km61LDZiw8QTH0fWgtaZGBy79KB4d
	v2e319UBvvAoYiDA==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86: Activate back-to-back NMI detection for
 arch-PEBS induced NMIs
Cc: Andi Kleen <ak@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-23-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-23-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890068867.623050.728397332545602855.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     c34db2f950940fe8732899a8cc9ba12942be3ba9
Gitweb:        https://git.kernel.org/tip/c34db2f950940fe8732899a8cc9ba12942b=
e3ba9
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:30 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:47 +02:00

perf/x86: Activate back-to-back NMI detection for arch-PEBS induced NMIs

When two or more identical PEBS events with the same sampling period are
programmed on a mix of PDIST and non-PDIST counters, multiple
back-to-back NMIs can be triggered.

The Linux PMI handler processes the first NMI and clears the
GLOBAL_STATUS MSR. If a second NMI is triggered immediately after
the first, it is recognized as a "suspicious NMI" because no bits are set
in the GLOBAL_STATUS MSR (cleared by the first NMI).

This issue does not lead to PEBS data corruption or data loss, but it
does result in an annoying warning message.

The current NMI handler supports back-to-back NMI detection, but it
requires the PMI handler to return the count of actually processed events,
which the PEBS handler does not currently do.

Thus, modify the PEBS handlers to return the count of actually processed
events, thereby activating back-to-back NMI detection and avoiding the
"suspicious NMI" warning.

Suggested-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-23-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/core.c       |  2 +-
 arch/x86/events/intel/core.c | 31 ++++++++++++++++---------
 arch/x86/events/intel/ds.c   | 43 +++++++++++++++++++++++------------
 arch/x86/events/perf_event.h |  2 +-
 4 files changed, 51 insertions(+), 27 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 11799ac..ef9b8df 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -93,7 +93,7 @@ DEFINE_STATIC_CALL_NULL(x86_pmu_stop_scheduling,   *x86_pmu=
.stop_scheduling);
=20
 DEFINE_STATIC_CALL_NULL(x86_pmu_sched_task,    *x86_pmu.sched_task);
=20
-DEFINE_STATIC_CALL_NULL(x86_pmu_drain_pebs,   *x86_pmu.drain_pebs);
+DEFINE_STATIC_CALL_RET0(x86_pmu_drain_pebs,   *x86_pmu.drain_pebs);
 DEFINE_STATIC_CALL_NULL(x86_pmu_pebs_aliases, *x86_pmu.pebs_aliases);
=20
 DEFINE_STATIC_CALL_NULL(x86_pmu_filter, *x86_pmu.filter);
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index a919168..4bde736 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3760,8 +3760,8 @@ static void intel_pmu_reset(void)
  *
  * The contents and other behavior of the guest event do not matter.
  */
-static void x86_pmu_handle_guest_pebs(struct pt_regs *regs,
-				      struct perf_sample_data *data)
+static int x86_pmu_handle_guest_pebs(struct pt_regs *regs,
+				     struct perf_sample_data *data)
 {
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	u64 guest_pebs_idxs =3D cpuc->pebs_enabled & ~cpuc->intel_ctrl_host_mask;
@@ -3769,11 +3769,11 @@ static void x86_pmu_handle_guest_pebs(struct pt_regs =
*regs,
 	int bit;
=20
 	if (!unlikely(perf_guest_state()))
-		return;
+		return 0;
=20
 	if (!x86_pmu.pebs_ept || !x86_pmu.pebs_active ||
 	    !guest_pebs_idxs)
-		return;
+		return 0;
=20
 	for_each_set_bit(bit, (unsigned long *)&guest_pebs_idxs, X86_PMC_IDX_MAX) {
 		event =3D cpuc->events[bit];
@@ -3783,9 +3783,14 @@ static void x86_pmu_handle_guest_pebs(struct pt_regs *=
regs,
 		perf_sample_data_init(data, 0, event->hw.last_period);
 		perf_event_overflow(event, data, regs);
=20
-		/* Inject one fake event is enough. */
-		break;
+		/*
+		 * Inject one fake event is enough.
+		 * Returning 1 to inform PMI is handled.
+		 */
+		return 1;
 	}
+
+	return 0;
 }
=20
 static int handle_pmi_common(struct pt_regs *regs, u64 status)
@@ -3834,9 +3839,11 @@ static int handle_pmi_common(struct pt_regs *regs, u64=
 status)
 	if (__test_and_clear_bit(GLOBAL_STATUS_BUFFER_OVF_BIT, (unsigned long *)&st=
atus)) {
 		u64 pebs_enabled =3D cpuc->pebs_enabled;
=20
-		handled++;
-		x86_pmu_handle_guest_pebs(regs, &data);
-		static_call(x86_pmu_drain_pebs)(regs, &data);
+		handled +=3D x86_pmu_handle_guest_pebs(regs, &data);
+		handled +=3D static_call(x86_pmu_drain_pebs)(regs, &data);
+		/* Ensure no "suspicious NMI" warning for empty PEBS buffer. */
+		if (!handled)
+			handled++;
=20
 		/*
 		 * PMI throttle may be triggered, which stops the PEBS event.
@@ -3863,8 +3870,10 @@ static int handle_pmi_common(struct pt_regs *regs, u64=
 status)
 	 */
 	if (__test_and_clear_bit(GLOBAL_STATUS_ARCH_PEBS_THRESHOLD_BIT,
 				 (unsigned long *)&status)) {
-		handled++;
-		static_call(x86_pmu_drain_pebs)(regs, &data);
+		handled +=3D static_call(x86_pmu_drain_pebs)(regs, &data);
+		/* Ensure no "suspicious NMI" warning for empty PEBS buffer. */
+		if (!handled)
+			handled++;
=20
 		if (cpuc->events[INTEL_PMC_IDX_FIXED_SLOTS] &&
 		    is_pebs_counter_event_group(cpuc->events[INTEL_PMC_IDX_FIXED_SLOTS]))
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 4335ae6..1b220cd 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -3021,7 +3021,7 @@ __intel_pmu_pebs_events(struct perf_event *event,
 	__intel_pmu_pebs_last_event(event, iregs, regs, data, at, count, setup_samp=
le);
 }
=20
-static void intel_pmu_drain_pebs_core(struct pt_regs *iregs, struct perf_sam=
ple_data *data)
+static int intel_pmu_drain_pebs_core(struct pt_regs *iregs, struct perf_samp=
le_data *data)
 {
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	struct debug_store *ds =3D cpuc->ds;
@@ -3030,7 +3030,7 @@ static void intel_pmu_drain_pebs_core(struct pt_regs *i=
regs, struct perf_sample_
 	int n;
=20
 	if (!x86_pmu.pebs_active)
-		return;
+		return 0;
=20
 	at  =3D (struct pebs_record_core *)(unsigned long)ds->pebs_buffer_base;
 	top =3D (struct pebs_record_core *)(unsigned long)ds->pebs_index;
@@ -3041,22 +3041,25 @@ static void intel_pmu_drain_pebs_core(struct pt_regs =
*iregs, struct perf_sample_
 	ds->pebs_index =3D ds->pebs_buffer_base;
=20
 	if (!test_bit(0, cpuc->active_mask))
-		return;
+		return 0;
=20
 	WARN_ON_ONCE(!event);
=20
 	if (!event->attr.precise_ip)
-		return;
+		return 0;
=20
 	n =3D top - at;
 	if (n <=3D 0) {
 		if (event->hw.flags & PERF_X86_EVENT_AUTO_RELOAD)
 			intel_pmu_save_and_restart_reload(event, 0);
-		return;
+		return 0;
 	}
=20
 	__intel_pmu_pebs_events(event, iregs, data, at, top, 0, n,
 				setup_pebs_fixed_sample_data);
+
+	/* PMC0 only */
+	return 1;
 }
=20
 static void intel_pmu_pebs_event_update_no_drain(struct cpu_hw_events *cpuc,=
 u64 mask)
@@ -3079,7 +3082,7 @@ static void intel_pmu_pebs_event_update_no_drain(struct=
 cpu_hw_events *cpuc, u64
 	}
 }
=20
-static void intel_pmu_drain_pebs_nhm(struct pt_regs *iregs, struct perf_samp=
le_data *data)
+static int intel_pmu_drain_pebs_nhm(struct pt_regs *iregs, struct perf_sampl=
e_data *data)
 {
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	struct debug_store *ds =3D cpuc->ds;
@@ -3088,11 +3091,12 @@ static void intel_pmu_drain_pebs_nhm(struct pt_regs *=
iregs, struct perf_sample_d
 	short counts[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS] =3D {};
 	short error[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS] =3D {};
 	int max_pebs_events =3D intel_pmu_max_num_pebs(NULL);
+	u64 events_bitmap =3D 0;
 	int bit, i, size;
 	u64 mask;
=20
 	if (!x86_pmu.pebs_active)
-		return;
+		return 0;
=20
 	base =3D (struct pebs_record_nhm *)(unsigned long)ds->pebs_buffer_base;
 	top =3D (struct pebs_record_nhm *)(unsigned long)ds->pebs_index;
@@ -3108,7 +3112,7 @@ static void intel_pmu_drain_pebs_nhm(struct pt_regs *ir=
egs, struct perf_sample_d
=20
 	if (unlikely(base >=3D top)) {
 		intel_pmu_pebs_event_update_no_drain(cpuc, mask);
-		return;
+		return 0;
 	}
=20
 	for (at =3D base; at < top; at +=3D x86_pmu.pebs_record_size) {
@@ -3172,6 +3176,7 @@ static void intel_pmu_drain_pebs_nhm(struct pt_regs *ir=
egs, struct perf_sample_d
 		if ((counts[bit] =3D=3D 0) && (error[bit] =3D=3D 0))
 			continue;
=20
+		events_bitmap |=3D BIT_ULL(bit);
 		event =3D cpuc->events[bit];
 		if (WARN_ON_ONCE(!event))
 			continue;
@@ -3193,6 +3198,8 @@ static void intel_pmu_drain_pebs_nhm(struct pt_regs *ir=
egs, struct perf_sample_d
 						setup_pebs_fixed_sample_data);
 		}
 	}
+
+	return hweight64(events_bitmap);
 }
=20
 static __always_inline void
@@ -3246,7 +3253,7 @@ __intel_pmu_handle_last_pebs_record(struct pt_regs *ire=
gs,
=20
 }
=20
-static void intel_pmu_drain_pebs_icl(struct pt_regs *iregs, struct perf_samp=
le_data *data)
+static int intel_pmu_drain_pebs_icl(struct pt_regs *iregs, struct perf_sampl=
e_data *data)
 {
 	short counts[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS] =3D {};
 	void *last[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS];
@@ -3256,10 +3263,11 @@ static void intel_pmu_drain_pebs_icl(struct pt_regs *=
iregs, struct perf_sample_d
 	struct pt_regs *regs =3D &perf_regs->regs;
 	struct pebs_basic *basic;
 	void *base, *at, *top;
+	u64 events_bitmap =3D 0;
 	u64 mask;
=20
 	if (!x86_pmu.pebs_active)
-		return;
+		return 0;
=20
 	base =3D (struct pebs_basic *)(unsigned long)ds->pebs_buffer_base;
 	top =3D (struct pebs_basic *)(unsigned long)ds->pebs_index;
@@ -3272,7 +3280,7 @@ static void intel_pmu_drain_pebs_icl(struct pt_regs *ir=
egs, struct perf_sample_d
=20
 	if (unlikely(base >=3D top)) {
 		intel_pmu_pebs_event_update_no_drain(cpuc, mask);
-		return;
+		return 0;
 	}
=20
 	if (!iregs)
@@ -3287,6 +3295,7 @@ static void intel_pmu_drain_pebs_icl(struct pt_regs *ir=
egs, struct perf_sample_d
 			continue;
=20
 		pebs_status =3D mask & basic->applicable_counters;
+		events_bitmap |=3D pebs_status;
 		__intel_pmu_handle_pebs_record(iregs, regs, data, at,
 					       pebs_status, counts, last,
 					       setup_pebs_adaptive_sample_data);
@@ -3294,10 +3303,12 @@ static void intel_pmu_drain_pebs_icl(struct pt_regs *=
iregs, struct perf_sample_d
=20
 	__intel_pmu_handle_last_pebs_record(iregs, regs, data, mask, counts, last,
 					    setup_pebs_adaptive_sample_data);
+
+	return hweight64(events_bitmap);
 }
=20
-static void intel_pmu_drain_arch_pebs(struct pt_regs *iregs,
-				      struct perf_sample_data *data)
+static int intel_pmu_drain_arch_pebs(struct pt_regs *iregs,
+				     struct perf_sample_data *data)
 {
 	short counts[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS] =3D {};
 	void *last[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS];
@@ -3306,13 +3317,14 @@ static void intel_pmu_drain_arch_pebs(struct pt_regs =
*iregs,
 	struct x86_perf_regs *perf_regs =3D this_cpu_ptr(&x86_pebs_regs);
 	struct pt_regs *regs =3D &perf_regs->regs;
 	void *base, *at, *top;
+	u64 events_bitmap =3D 0;
 	u64 mask;
=20
 	rdmsrq(MSR_IA32_PEBS_INDEX, index.whole);
=20
 	if (unlikely(!index.wr)) {
 		intel_pmu_pebs_event_update_no_drain(cpuc, X86_PMC_IDX_MAX);
-		return;
+		return 0;
 	}
=20
 	base =3D cpuc->pebs_vaddr;
@@ -3351,6 +3363,7 @@ static void intel_pmu_drain_arch_pebs(struct pt_regs *i=
regs,
=20
 		basic =3D at + sizeof(struct arch_pebs_header);
 		pebs_status =3D mask & basic->applicable_counters;
+		events_bitmap |=3D pebs_status;
 		__intel_pmu_handle_pebs_record(iregs, regs, data, at,
 					       pebs_status, counts, last,
 					       setup_arch_pebs_sample_data);
@@ -3370,6 +3383,8 @@ static void intel_pmu_drain_arch_pebs(struct pt_regs *i=
regs,
 	__intel_pmu_handle_last_pebs_record(iregs, regs, data, mask,
 					    counts, last,
 					    setup_arch_pebs_sample_data);
+
+	return hweight64(events_bitmap);
 }
=20
 static void __init intel_arch_pebs_init(void)
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 1503ab6..c9c52f3 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -1145,7 +1145,7 @@ struct x86_pmu {
 	int		pebs_record_size;
 	int		pebs_buffer_size;
 	u64		pebs_events_mask;
-	void		(*drain_pebs)(struct pt_regs *regs, struct perf_sample_data *data);
+	int		(*drain_pebs)(struct pt_regs *regs, struct perf_sample_data *data);
 	struct event_constraint *pebs_constraints;
 	void		(*pebs_aliases)(struct perf_event *event);
 	u64		(*pebs_latency_data)(struct perf_event *event, u64 status);
