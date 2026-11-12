Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446676;
	b=27HYf369ylANJIM0wcsoooeCaPrD17fiW7eHCDWxwkX0AVF44fyx5vQb7zsozBFqePGs
	 NXvcL5zjMMAFFjy7OTPhTPqW8iNlAK/eDSx3NtySpiRFYuqTdlCPVMfYToq6LzymUwjCM
	 fdf+R59Ubov7HVELRVrmfsHUqx908ujArsU0Fbxp+8f8JfDRASlt1UY/WILH9HdtD2wgf
	 txGJYpPND18JTrJm5EGCeeV/YBvaOEVDUX5sasElxelmaccUT9/0DLCtUr6y5QUcoh9m+
	 f4IbLSqOHrI9bPHgFBUY4FXf5n93HXC1BrLTMoHVOW7qT3TjTPs0vspq1mHzV2JziAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446676;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=x9l1TOPh8Bgtg7JZAApK0P950JKBlCoX9Pc4k4OsMdE=;
	b=tcExsmsSHvTFkXAq+u4MNNqtZ+SBGL3xTyem1d7/pshikVDPqifE/SjPmiyuIiDA7eiI
	 TjKT7x4gDy0g+h6BPx67+W7v4qOQIv2OTWJe34XOp0unXCWiYA7V1vEb2Cu8EsJmY1COC
	 GynxoUDPiKyN9yNIhcHd8NdGRYhFFpa54Y7b+sujy5Zzjle10UMOjJ2m/X9jOXe3WLGOg
	 B7jp3OnpASrLO9WjbO7SrqppMxDluPj44w0X/raRayteFsH8b1rr9m/g+9mMDXWmymh6k
	 GLN919v7HjmiFP6lyF2612oF3SAZg1K+/v9cBBiVOIRYOOA/t7CbUFttqMhNbtvYGwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=s4hh3xbd;
	arc=none smtp.remote-ip=95.215.58.246
Received: from mta1.migadu.com (out-246.mta1.migadu.com [95.215.58.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA9606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=s4hh3xbd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LBj0u6xlJ1BRuGqWEdZwJRMwNuzbug77GIZmbu2Og8E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794446674; v=1; x=1795051474;
 b=s4hh3xbdKm9mVTxEqLNjsV2Z0DHaI9cWhehqRTVcVec9HS//+Vz3NC+GgsKKGLpzZ2DAYsnn
 D3Kum4+4fvnfgbmrKVabvFoGJ0DqJJmwWXSRv2NviB60I/La86ZYbkhsIgDdWqCTlciAED/zwQ0
 Dizova3bShZ5a97NUcs1bA+Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8cea3b79238c672b;
	Thu, 12 Nov 2026 01:24:34 +0000
X-Mizu-Trace-ID: 8cea3b79238c672b
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 11 Nov 2026 20:24:20 -0500
Subject: [PATCH 1/2] sched/fair: Skip rq_offline_fair() work for CPUs that
 stay active
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-bug-sched-fair-offline-active-v1-1-4f54523c5a70@linux.dev>
References: <20261111-bug-sched-fair-offline-active-v1-0-4f54523c5a70@linux.dev>
In-Reply-To: <20261111-bug-sched-fair-offline-active-v1-0-4f54523c5a70@linux.dev>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

A sched domain rebuild, triggered by CPU hotplug or a cpuset partition
change, calls rq_attach_root() for every active CPU in the affected
domains. That runs set_rq_offline() and set_rq_online() with the rq lock
held and interrupts disabled, so rq_offline_fair() is called for CPUs
that are not going down.

Commit af98d8a36a96 ("sched/fair: Fix CPU bandwidth limit bypass during
CPU hotplug") made unthrottle_offline_cfs_rqs() return early for active
CPUs, but clear_tg_offline_cfs_rqs(), added by commit f60a631ab9ed
("sched/fair: Fix tg->load when offlining a CPU"), still walks every
task group and drops the CPU's tg->load_avg contribution, which
update_tg_load_avg() then adds back. With thousands of cpu cgroups each
rebuild costs O(nr_cpus * nr_task_groups).

Move the active check into rq_offline_fair() so that both walks only run
for a CPU going down.

With 4000 cpu cgroups on a 32-CPU VM booted with rt_group_sched=0,
switching a 4-CPU cpuset to a partition root and offlining or onlining
one CPU take (median of 20 partition switches and 16 hotplug operations):

  operation         before (ms)  after (ms)  change
  partition root          13.28        7.68    -42%
  cpu offline             44.95       30.96    -31%
  cpu online              36.84       28.48    -23%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 kernel/sched/fair.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 79f6b3a4fd7f3..e245a31b0544e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7816,10 +7816,6 @@ static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
 
 	lockdep_assert_rq_held(rq);
 
-	// Do not unthrottle for an active CPU
-	if (cpumask_test_cpu(cpu_of(rq), cpu_active_mask))
-		return;
-
 	/*
 	 * The rq clock has already been updated in the
 	 * set_rq_offline(), so we should skip updating
@@ -15064,6 +15060,13 @@ static void rq_offline_fair(struct rq *rq)
 {
 	update_sysctl();
 
+	/*
+	 * A sched domain rebuild moves every active CPU to a new root domain
+	 * and lands here as well. Only a CPU going down needs the work below.
+	 */
+	if (cpu_active(cpu_of(rq)))
+		return;
+
 	/* Ensure any throttled groups are reachable by pick_next_task */
 	unthrottle_offline_cfs_rqs(rq);
 

-- 
2.43.0

