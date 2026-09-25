Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE07341F349;
	Fri, 25 Sep 2026 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333317; cv=none; b=CMC7ldgGvttREUHzYNfEfsFZiwqjeKSWiRyh8LkDAvyQci2e2t3xGvUdi1NdKEsFU+WwX/E6G4Y2rhnrEq9Jxo+FYK4NjpNLXa+wVN5GIi2NUgKnZfm62cu6W7jFGdhtKCuiAPEP/BP+STqU6j6h2xI7uRp+27h3qNxePzBUA68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333317; c=relaxed/simple;
	bh=fOidr1i2ZkzZS5ey4yGiTzGVOiuZ6k0pQVH24zC6eEA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Wqc4dYmPbqHHkevmeqOUf3+LkwZYfhveMVDiq/2rmQrBu3asHvzHMVmO1aJ6MQbDwBuag+0OpwUeNmXlp2qDhKIezVucKpM9QKvdwKeUFiqq07a5dVzrw6Xyx4Hbhqz0TMo6M4+N7gvhr1Nui2gPfBN4Ifhw6Jb2pZ5PbmBjEhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4hw11PjF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vYavkGfX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4hw11PjF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vYavkGfX"
Date: Fri, 25 Sep 2026 10:48:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790333307;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQ5mGpuBJqqDJvqu6hGf94HdWd0rOQdVpjDRcjsNKbA=;
	b=4hw11PjFSYvCuMhm455yh+0kYu6BhjeO7r8DNbDSvxrmVLBDcrvGLdG8zwnawHU2If6SnR
	06Lb70PleZNH/h+SP18yKehQdbV3X7+SXWzJwLJ1MV9r0hnk7A5vC8hkccro7mfmmfNNO0
	IET4S4JctBL5DHSa1T6TMdENFCATcW5Lvkf33g6Yvr/3poILLzK5aXo85JY3iKWL5X94C3
	Sih8Rx7IqhfdpVqFw8mULNG5clyn1iU4PphAI/To3A9yyAJb/FfrXun8jdCCLrtQ55DFYT
	k1EVtab3hPESp0vr9kSP/TGLocD7VIS3exPt8+cKPt2Ssm3keI/F/TNvlgPoLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790333307;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQ5mGpuBJqqDJvqu6hGf94HdWd0rOQdVpjDRcjsNKbA=;
	b=vYavkGfXNSMReqUl28UAyv2QnJcORGyFXJ0eCbgOfzMy1Vd4wunADQlhkZovzL20vooLC/
	D9XHiJUM0mp5QeDg==
From: "tip-bot2 for Sean Christopherson" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: perf/core] perf/x86/intel: Invert names of intel_ctrl_{guest,host}_mask
Cc: Jim Mattson <jmattson@google.com>, Sean Christopherson <seanjc@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260921191418.950933-6-seanjc@google.com>
References: <20260921191418.950933-6-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179033330555.2819794.8624758272978683561.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     b7b84fff2bd630b593ee47a733381e3886aac1a7
Gitweb:        https://git.kernel.org/tip/b7b84fff2bd630b593ee47a733381e3886a=
ac1a7
Author:        Sean Christopherson <seanjc@google.com>
AuthorDate:    Mon, 21 Sep 2026 12:14:13 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 25 Sep 2026 12:45:52 +02:00

perf/x86/intel: Invert names of intel_ctrl_{guest,host}_mask

Rename intel_ctrl_{guest,host}_mask to intel_ctrl_exclude_{host,guest}_mask
to more accurately capture what they actually track.  Specifically, an
event that is excluded from the guest is NOT guaranteed to count in the
host, and vice versa, as it legal (albeit bizarre) to configure an event to
exclude both the host and the guest, i.e. to not count at all.

Subjectively (though anyone who disagrees is wrong), aligning with
perf_event_attr.exclude_{guest,host} also makes all related code much
easier to follow.

No functional change intended.

Suggested-by: Jim Mattson <jmattson@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20260921191418.950933-6-seanjc@google.com
---
 arch/x86/events/intel/core.c | 22 +++++++++++-----------
 arch/x86/events/intel/lbr.c  |  2 +-
 arch/x86/events/perf_event.h |  4 ++--
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index a73a355..0765187 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -2797,7 +2797,7 @@ static void __intel_pmu_enable_all(int added, bool pmi)
 	}
=20
 	wrmsrq(MSR_CORE_PERF_GLOBAL_CTRL,
-	       intel_ctrl & ~cpuc->intel_ctrl_guest_mask);
+	       intel_ctrl & ~cpuc->intel_ctrl_exclude_host_mask);
=20
 	if (test_bit(INTEL_PMC_IDX_FIXED_BTS, cpuc->active_mask)) {
 		struct perf_event *event =3D
@@ -2995,9 +2995,9 @@ static inline void intel_set_masks(struct perf_event *e=
vent, int idx)
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
=20
 	if (event->attr.exclude_host)
-		__set_bit(idx, (unsigned long *)&cpuc->intel_ctrl_guest_mask);
+		__set_bit(idx, (unsigned long *)&cpuc->intel_ctrl_exclude_host_mask);
 	if (event->attr.exclude_guest)
-		__set_bit(idx, (unsigned long *)&cpuc->intel_ctrl_host_mask);
+		__set_bit(idx, (unsigned long *)&cpuc->intel_ctrl_exclude_guest_mask);
 	if (event_is_checkpointed(event))
 		__set_bit(idx, (unsigned long *)&cpuc->intel_cp_status);
 }
@@ -3006,8 +3006,8 @@ static inline void intel_clear_masks(struct perf_event =
*event, int idx)
 {
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
=20
-	__clear_bit(idx, (unsigned long *)&cpuc->intel_ctrl_guest_mask);
-	__clear_bit(idx, (unsigned long *)&cpuc->intel_ctrl_host_mask);
+	__clear_bit(idx, (unsigned long *)&cpuc->intel_ctrl_exclude_host_mask);
+	__clear_bit(idx, (unsigned long *)&cpuc->intel_ctrl_exclude_guest_mask);
 	__clear_bit(idx, (unsigned long *)&cpuc->intel_cp_status);
 }
=20
@@ -3789,7 +3789,7 @@ static int x86_pmu_handle_guest_pebs(struct pt_regs *re=
gs,
 				     struct perf_sample_data *data)
 {
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
-	u64 guest_pebs_idxs =3D cpuc->pebs_enabled & ~cpuc->intel_ctrl_host_mask;
+	u64 guest_pebs_idxs =3D cpuc->pebs_enabled & ~cpuc->intel_ctrl_exclude_gues=
t_mask;
 	struct perf_event *event =3D NULL;
 	int bit;
=20
@@ -5349,8 +5349,8 @@ static struct perf_guest_switch_msr *intel_guest_get_ms=
rs(int *nr, void *data)
 	global_ctrl =3D (*nr)++;
 	arr[global_ctrl] =3D (struct perf_guest_switch_msr){
 		.msr =3D MSR_CORE_PERF_GLOBAL_CTRL,
-		.host =3D intel_ctrl & ~cpuc->intel_ctrl_guest_mask,
-		.guest =3D intel_ctrl & ~cpuc->intel_ctrl_host_mask & ~pebs_mask,
+		.host =3D intel_ctrl & ~cpuc->intel_ctrl_exclude_host_mask,
+		.guest =3D intel_ctrl & ~cpuc->intel_ctrl_exclude_guest_mask & ~pebs_mask,
 	};
=20
 	if (!x86_pmu.ds_pebs)
@@ -5387,8 +5387,8 @@ static struct perf_guest_switch_msr *intel_guest_get_ms=
rs(int *nr, void *data)
 	 * in the guest, and (d) _are_ excluded from counting in the host.
 	 */
 	guest_pebs_mask =3D pebs_mask & intel_ctrl & kvm_pmu->pebs_enable &
-			  ~cpuc->intel_ctrl_host_mask &
-			  cpuc->intel_ctrl_guest_mask;
+			  ~cpuc->intel_ctrl_exclude_guest_mask &
+			  cpuc->intel_ctrl_exclude_host_mask;
=20
 	/*
 	 * Disable counters where the guest PMC is different than the host PMC
@@ -5404,7 +5404,7 @@ static struct perf_guest_switch_msr *intel_guest_get_ms=
rs(int *nr, void *data)
 	 *        What exactly goes wrong if guest and host are using PEBS is
 	 *        unknown.
 	 */
-	if (pebs_mask & ~cpuc->intel_ctrl_guest_mask)
+	if (pebs_mask & ~cpuc->intel_ctrl_exclude_host_mask)
 		guest_pebs_mask =3D 0;
=20
 	/*
diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index 22e2a06..0b446d8 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -714,7 +714,7 @@ static inline bool vlbr_exclude_host(void)
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
=20
 	return test_bit(INTEL_PMC_IDX_FIXED_VLBR,
-		(unsigned long *)&cpuc->intel_ctrl_guest_mask);
+		(unsigned long *)&cpuc->intel_ctrl_exclude_host_mask);
 }
=20
 void intel_pmu_lbr_enable_all(bool pmi)
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 5deca1a..7c3a84e 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -540,8 +540,8 @@ struct cpu_hw_events {
 	/*
 	 * Intel host/guest exclude bits
 	 */
-	u64				intel_ctrl_guest_mask;
-	u64				intel_ctrl_host_mask;
+	u64				intel_ctrl_exclude_host_mask;
+	u64				intel_ctrl_exclude_guest_mask;
 	struct perf_guest_switch_msr	guest_switch_msrs[X86_PMC_IDX_MAX];
=20
 	/*
