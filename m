Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9989418A39;
	Thu, 10 Sep 2026 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030925; cv=none; b=KJSXqpBKG7F0QnH4rHS6Aj2f/iYwftD+0X21BvvjCxHWjsozktaJ5EYDbU0P+c+sU+PTepk6ThSzwTEE56Zx9Q1oU5vUFx1KhnULvlZVejREZqyCHEWipfFsLoV6FssdEV8UYPfvjT8eJ0o2gLgFdZ6pPXCCsv836tk39fkrbRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030925; c=relaxed/simple;
	bh=4/Z/+CdZRnXCUuYCx1OmssYICg1WkFY3bgg0wVVtoyk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=PQeOOU2XYgEFhbm3bRD/Wi9ITf/sfFBkq806yx2M6HZDLvVUJ2JgAF7ag7D69bW0O9bO+how2q4bVgL0oW9fF1Zrm2XpKTksEFPNBMp8a/UL/LSAxAyW8oUsa6C78fqae8Lkn13VgzW6tipIjTs590vQQ2VbpkTHPteoPEbfsCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mGvUS3hT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aqu/9/+9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mGvUS3hT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aqu/9/+9"
Date: Thu, 10 Sep 2026 09:01:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789030916;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLjTMft0CGhBcqZo6FIVbFJNaEeGzUm+j4PFrbCPZg4=;
	b=mGvUS3hTN4NcsWvzKQ85S37sn/wfihKxiVmAKq/PTzw6SZXYk0+5rvKdpXWruLDsZCk4Cy
	0M9VQT5DWjGfsuugIADiG63pK6a8go7au29vHIAxDH8YLwX6q0lshbA1MnAKC1PWlqO8+k
	gRI1P4LYVWNlAH8mtSeOwJgzhp3WXtB/GMjXUMf0v9ivnIbktBW5mKRRVEAWUG2pWa6kjj
	BacvVQGyADQITwG2mZRasJqXGuzfAcS23j3Q0x9lblxgYTqFmppXi/vznN37qmJQxkz/En
	uiazijg1TTN6mcL9jO4EXPCb9gach9dGw13L+3JW6KC9pS0fnL3NrzyMsjhCbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789030916;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLjTMft0CGhBcqZo6FIVbFJNaEeGzUm+j4PFrbCPZg4=;
	b=aqu/9/+9fz8gDM9fLy8LPVg1DF+MOsrU51VQO+PPM9zqsV8TAhI/5h7yvvN0U3obwBy5b/
	seEqsLOIsP1SydCw==
From: "tip-bot2 for Dapeng Mi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/urgent] perf/x86/intel: Prevent drain_pebs() reentry
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260813064346.335458-1-dapeng1.mi@linux.intel.com>
References: <20260813064346.335458-1-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178903091429.623050.7055375788187665681.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/urgent branch of tip:

Commit-ID:     a56c03a397e2cd0c4cf8da96dcd6214f7d0e7d8c
Gitweb:        https://git.kernel.org/tip/a56c03a397e2cd0c4cf8da96dcd6214f7d0=
e7d8c
Author:        Dapeng Mi <dapeng1.mi@linux.intel.com>
AuthorDate:    Thu, 13 Aug 2026 14:43:46 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 10 Sep 2026 10:22:50 +02:00

perf/x86/intel: Prevent drain_pebs() reentry

The PEBS buffer is shared by all events on a CPU, so drain_pebs() must
not be reentered. If so, one instance may observe stale buffer state and
potentially access out-of-bound memory.

Most invocations happen in NMI context, which naturally prevents reentry.
However, drain_pebs() is also reachable from process context via
intel_pmu_drain_pebs_buffer().

In those paths, the PMU is often already disabled, but not guaranteed.
For example, __intel_pmu_pebs_disable() only disables the target counter,
so other active counters can still raise a PMI and interrupt an in-flight
drain_pebs(). Here is an example,

__perf_addr_filters_adjust()
  perf_event_stop()
    __perf_event_stop()
      x86_pmu_stop() (event->pmu->stop)
        intel_pmu_disable_event()
          intel_pmu_pebs_disable()
            __intel_pmu_pebs_disable()
              intel_pmu_drain_large_pebs()
                intel_pmu_drain_pebs_buffer()

Introduce __intel_pmu_quiesce() and __intel_pmu_resume() helpers and
use them in intel_pmu_drain_large_pebs() to disable the full PMU
around the intel_pmu_drain_pebs_buffer() call, preventing reentry.

Also add a warning in intel_pmu_drain_pebs_buffer() when the full PMU is
not disabled.

Fixes: b752ea0c28e3 ("perf/x86/intel/ds: Flush PEBS DS when changing PEBS_DAT=
A_CFG")
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260813064346.335458-1-dapeng1.mi@linux.intel=
.com
---
 arch/x86/events/intel/core.c | 33 ++++++++++++++++++++++++---------
 arch/x86/events/intel/ds.c   |  8 +++++++-
 arch/x86/events/perf_event.h |  3 +++
 3 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index cc13164..1ac2ca3 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3125,6 +3125,27 @@ static void intel_pmu_del_event(struct perf_event *eve=
nt)
 		this_cpu_ptr(&cpu_hw_events)->n_late_setup--;
 }
=20
+int __intel_pmu_quiesce(void)
+{
+	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
+	int pmu_enabled =3D cpuc->enabled;
+
+	cpuc->enabled =3D 0;
+	if (pmu_enabled)
+		intel_pmu_disable_all();
+
+	return pmu_enabled;
+}
+
+void __intel_pmu_resume(int pmu_enabled)
+{
+	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
+
+	cpuc->enabled =3D pmu_enabled;
+	if (pmu_enabled)
+		intel_pmu_enable_all(0);
+}
+
 static int icl_set_topdown_event_period(struct perf_event *event)
 {
 	struct hw_perf_event *hwc =3D &event->hw;
@@ -3316,16 +3337,13 @@ static void intel_pmu_read_event(struct perf_event *e=
vent)
 	if (event->hw.flags & (PERF_X86_EVENT_AUTO_RELOAD | PERF_X86_EVENT_TOPDOWN)=
 ||
 	    is_pebs_counter_event_group(event)) {
 		struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
-		bool pmu_enabled =3D cpuc->enabled;
+		int pmu_enabled;
=20
 		/* Only need to call update_topdown_event() once for group read. */
 		if (is_metric_event(event) && (cpuc->txn_flags & PERF_PMU_TXN_READ))
 			return;
=20
-		cpuc->enabled =3D 0;
-		if (pmu_enabled)
-			intel_pmu_disable_all();
-
+		pmu_enabled =3D __intel_pmu_quiesce();
 		/*
 		 * If the PEBS counters snapshotting is enabled,
 		 * the topdown event is available in PEBS records.
@@ -3334,10 +3352,7 @@ static void intel_pmu_read_event(struct perf_event *ev=
ent)
 			static_call(intel_pmu_update_topdown_event)(event, NULL);
 		else
 			intel_pmu_drain_pebs_buffer();
-
-		cpuc->enabled =3D pmu_enabled;
-		if (pmu_enabled)
-			intel_pmu_enable_all(0);
+		__intel_pmu_resume(pmu_enabled);
=20
 		return;
 	}
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index d0bb767..b98029b 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -1242,8 +1242,11 @@ unlock:
=20
 void intel_pmu_drain_pebs_buffer(void)
 {
+	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	struct perf_sample_data data;
=20
+	WARN_ON_ONCE(cpuc->enabled);
+
 	static_call(x86_pmu_drain_pebs)(NULL, &data);
 }
=20
@@ -1864,8 +1867,11 @@ static void intel_pmu_pebs_via_pt_enable(struct perf_e=
vent *event)
 static inline void intel_pmu_drain_large_pebs(struct cpu_hw_events *cpuc)
 {
 	if (cpuc->n_pebs =3D=3D cpuc->n_large_pebs &&
-	    cpuc->n_pebs !=3D cpuc->n_pebs_via_pt)
+	    cpuc->n_pebs !=3D cpuc->n_pebs_via_pt) {
+		int enabled =3D __intel_pmu_quiesce();
 		intel_pmu_drain_pebs_buffer();
+		__intel_pmu_resume(enabled);
+	}
 }
=20
 static void __intel_pmu_pebs_enable(struct perf_event *event)
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index 71ed5b2..4680cba 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -1638,6 +1638,9 @@ static __always_inline void __intel_pmu_lbr_disable(voi=
d)
 	wrmsrq(MSR_IA32_DEBUGCTLMSR, debugctl);
 }
=20
+extern int __intel_pmu_quiesce(void);
+extern void __intel_pmu_resume(int pmu_enabled);
+
 int intel_pmu_save_and_restart(struct perf_event *event);
=20
 struct event_constraint *
