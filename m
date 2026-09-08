Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EC23B47CC;
	Tue,  8 Sep 2026 20:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900693; cv=none; b=T0io0havWD+c3MTHWxDXRMN3L3HTEklX1WxhotD4Pv1LesxCC4vUXBMeH9sNoBPZdskGDNuGuVY9Mc+avTw9r1HnMJ8f6ocrfJXwPK5COGc55rSYjkE7yt+99vSF97wlHUPt7neknj6B2IE+skLdnzbIYVlZGLFpqTRwxuYsnak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900693; c=relaxed/simple;
	bh=GtfqQV6dGaIWHRHJbHFiix69Jjz0ZRyMLAwyiouwrOM=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=O6tvBo75y9NvdSBQxgrrZN0U+p+K1/L5aYr/GfdzwV6pUdJ/+TAg+3+6DrGeqWBiHJLFvxYUcQrFAAX1/yJh6Fj0ZpYUXDhT7/Ue8OadglGgxSFJuVFUR3xSQWPT1Vnzh3jW11RuJYuE1vNK2evJdUEW5rRYrh58KuL8Qjk95w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tlwP56fI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LrbOpJQC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tlwP56fI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LrbOpJQC"
Date: Tue, 08 Sep 2026 20:51:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788900689;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QW5XrF0ZvZtdYu9zKkdDI8kBdj35g1N2RZQI+w31wrk=;
	b=tlwP56fImQS+uUgbCwvkXsEuMOy/ZC/e7Qq5+vmVF58e9rAfQAZd68kEAUms+4xKMqbpJY
	iCIwp/GKw/fJJ01Co30/f2tan4x4Oh9oosYzeL7S3Eqfg5xOy/DIMjhCUUqBN04koKNv4y
	YrbsByefkxFTn+7L9B7sErKSjRPECeBQ0/LOEC1mWu3a2kQ56LLmuvIWHXjhE4D7wJizeT
	7xOnoGoUgk8rSKXRR5G8NNRhbKe7AnSfIRu0MbASaNDLbPYTHabYsKxPDm2z0+3ZcXHTiL
	kEgPvi0U/KeSdaDU9Aj3ck9XwLsPhXgOb+n8LQ81g+bOA0HsyMBx2XqUDrLmRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788900689;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QW5XrF0ZvZtdYu9zKkdDI8kBdj35g1N2RZQI+w31wrk=;
	b=LrbOpJQCF0/RerD0RzBY//97vwDPTJvoA/8iIB8NhOANAAtMcQmyjXBZnALBC1r8XENwr9
	t0Rsen88UejuXzAQ==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86/intel: Add sanity check for PEBS
 record/fragment size
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824082731.1013973-24-dapeng1.mi@linux.intel.com>
References: <20260824082731.1013973-24-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178890068714.623050.15378795201368862770.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     68aca309e49c589f1922f4c5af2370e4df093175
Gitweb:        https://git.kernel.org/tip/68aca309e49c589f1922f4c5af2370e4df0=
93175
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Mon, 24 Aug 2026 16:27:31 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 13:10:47 +02:00

perf/x86/intel: Add sanity check for PEBS record/fragment size

Prevent potential infinite loops by adding a sanity check for the
corrupted PEBS record or fragment size which could happen in theory.

If a corrupted PEBS fragment is detected, the entire PEBS record
including the corrupted fragment and all subsequent records will be
dropped and a NULL PEBS record is reported to user space. This ensures
the integrity of PEBS data and prevents infinite loops in
setup_arch_pebs_sample_data() again.

Please note software has no way to figure out which events are impacted
by the corrupted record, so the last record of each event would be
discarded for all events if corrupted record is detected even though
it may be a well-formed record for some events.

Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824082731.1013973-24-dapeng1.mi@linux.int=
el.com
---
 arch/x86/events/intel/ds.c | 77 +++++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 19 deletions(-)

diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 1b220cd..2edff97 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -2657,6 +2657,9 @@ static void setup_arch_pebs_sample_data(struct perf_eve=
nt *event,
=20
 again:
 	header =3D at;
+	if (!header->size)
+		return;
+
 	next_record =3D at + sizeof(struct arch_pebs_header);
 	if (header->basic) {
 		struct arch_pebs_basic *basic =3D next_record;
@@ -2930,13 +2933,21 @@ __intel_pmu_pebs_last_event(struct perf_event *event,
 			    struct pt_regs *iregs,
 			    struct pt_regs *regs,
 			    struct perf_sample_data *data,
-			    void *at,
-			    int count,
+			    void *at, int count, bool corrupted,
 			    setup_fn setup_sample)
 {
 	struct hw_perf_event *hwc =3D &event->hw;
=20
-	setup_sample(event, iregs, at, data, regs);
+	/* Skip parsing corrupted PEBS record. */
+	if (corrupted) {
+		/* Clear stale register states in previous records. */
+		memset(regs, 0, sizeof(*regs));
+		x86_pmu_clear_perf_regs(regs);
+		perf_sample_data_init(data, 0, event->hw.last_period);
+	} else {
+		setup_sample(event, iregs, at, data, regs);
+	}
+
 	if (iregs =3D=3D &dummy_iregs) {
 		/*
 		 * The PEBS records may be drained in the non-overflow context,
@@ -2954,12 +2965,16 @@ __intel_pmu_pebs_last_event(struct perf_event *event,
 	}
=20
 	if (hwc->flags & PERF_X86_EVENT_AUTO_RELOAD) {
-		if ((is_pebs_counter_event_group(event))) {
-			/*
-			 * The value of each sample has been updated when setup
-			 * the corresponding sample data.
-			 */
-			perf_event_update_userpage(event);
+		if (is_pebs_counter_event_group(event)) {
+			if (corrupted) {
+				intel_pmu_save_and_restart_reload(event, 1);
+			} else {
+				/*
+				 * The value of each sample has been updated
+				 * when setup the corresponding sample data.
+				 */
+				perf_event_update_userpage(event);
+			}
 		} else {
 			/*
 			 * Now, auto-reload is only enabled in fixed period mode.
@@ -2983,7 +2998,7 @@ __intel_pmu_pebs_last_event(struct perf_event *event,
 		 * counters-snapshotting record, only needs to set the new
 		 * period for the counter.
 		 */
-		if (is_pebs_counter_event_group(event))
+		if (is_pebs_counter_event_group(event) && !corrupted)
 			static_call(x86_pmu_set_period)(event);
 		else
 			intel_pmu_save_and_restart(event);
@@ -3012,13 +3027,15 @@ __intel_pmu_pebs_events(struct perf_event *event,
 		iregs =3D &dummy_iregs;
=20
 	while (cnt > 1) {
-		__intel_pmu_pebs_event(event, iregs, regs, data, at, setup_sample);
+		__intel_pmu_pebs_event(event, iregs, regs, data,
+				       at, setup_sample);
 		at +=3D cpuc->pebs_record_size;
 		at =3D get_next_pebs_record_by_bit(at, top, bit);
 		cnt--;
 	}
=20
-	__intel_pmu_pebs_last_event(event, iregs, regs, data, at, count, setup_samp=
le);
+	__intel_pmu_pebs_last_event(event, iregs, regs, data, at,
+				    count, false, setup_sample);
 }
=20
 static int intel_pmu_drain_pebs_core(struct pt_regs *iregs, struct perf_samp=
le_data *data)
@@ -3234,23 +3251,28 @@ static __always_inline void
 __intel_pmu_handle_last_pebs_record(struct pt_regs *iregs,
 				    struct pt_regs *regs,
 				    struct perf_sample_data *data,
-				    u64 mask, short *counts, void **last,
+				    u64 mask, short *counts,
+				    void **last, bool corrupted,
 				    setup_fn setup_sample)
 {
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	struct perf_event *event;
+	bool handled =3D false;
 	int bit;
=20
 	for_each_set_bit(bit, (unsigned long *)&mask, X86_PMC_IDX_MAX) {
 		if (!counts[bit])
 			continue;
=20
+		handled =3D true;
 		event =3D cpuc->events[bit];
-
 		__intel_pmu_pebs_last_event(event, iregs, regs, data, last[bit],
-					    counts[bit], setup_sample);
+					    counts[bit], corrupted, setup_sample);
 	}
=20
+	/* All records are corrupted, reset sampling period. */
+	if (!handled)
+		intel_pmu_pebs_event_update_no_drain(cpuc, mask);
 }
=20
 static int intel_pmu_drain_pebs_icl(struct pt_regs *iregs, struct perf_sampl=
e_data *data)
@@ -3264,6 +3286,7 @@ static int intel_pmu_drain_pebs_icl(struct pt_regs *ire=
gs, struct perf_sample_da
 	struct pebs_basic *basic;
 	void *base, *at, *top;
 	u64 events_bitmap =3D 0;
+	bool corrupted =3D false;
 	u64 mask;
=20
 	if (!x86_pmu.pebs_active)
@@ -3291,6 +3314,10 @@ static int intel_pmu_drain_pebs_icl(struct pt_regs *ir=
egs, struct perf_sample_da
 		u64 pebs_status;
=20
 		basic =3D at;
+		if (WARN_ON_ONCE(!basic->format_size)) {
+			corrupted =3D true;
+			break;
+		}
 		if (basic->format_size !=3D cpuc->pebs_record_size)
 			continue;
=20
@@ -3302,7 +3329,7 @@ static int intel_pmu_drain_pebs_icl(struct pt_regs *ire=
gs, struct perf_sample_da
 	}
=20
 	__intel_pmu_handle_last_pebs_record(iregs, regs, data, mask, counts, last,
-					    setup_pebs_adaptive_sample_data);
+					    corrupted, setup_pebs_adaptive_sample_data);
=20
 	return hweight64(events_bitmap);
 }
@@ -3318,6 +3345,7 @@ static int intel_pmu_drain_arch_pebs(struct pt_regs *ir=
egs,
 	struct pt_regs *regs =3D &perf_regs->regs;
 	void *base, *at, *top;
 	u64 events_bitmap =3D 0;
+	bool corrupted =3D false;
 	u64 mask;
=20
 	rdmsrq(MSR_IA32_PEBS_INDEX, index.whole);
@@ -3352,8 +3380,10 @@ static int intel_pmu_drain_arch_pebs(struct pt_regs *i=
regs,
=20
 		header =3D at;
=20
-		if (WARN_ON_ONCE(!header->size))
-			break;
+		if (WARN_ON_ONCE(!header->size)) {
+			corrupted =3D true;
+			goto done;
+		}
=20
 		/* 1st fragment or single record must have basic group */
 		if (!header->basic) {
@@ -3373,15 +3403,24 @@ static int intel_pmu_drain_arch_pebs(struct pt_regs *=
iregs,
 			if (!header->size)
 				break;
 			at +=3D header->size;
+			if (WARN_ON_ONCE(at >=3D top)) {
+				corrupted =3D true;
+				goto done;
+			}
 			header =3D at;
 		}
=20
 		/* Skip last fragment or the single record */
 		at +=3D header->size;
+		if (WARN_ON_ONCE(at > top)) {
+			corrupted =3D true;
+			goto done;
+		}
 	}
=20
+done:
 	__intel_pmu_handle_last_pebs_record(iregs, regs, data, mask,
-					    counts, last,
+					    counts, last, corrupted,
 					    setup_arch_pebs_sample_data);
=20
 	return hweight64(events_bitmap);
