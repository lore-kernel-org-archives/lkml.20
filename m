Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925642;
	b=u2pnRLG/71v/xkDl+7yvz4Zlg/Hg33tjBMm/s6qEnGKyEP+vzMZWjModPEY1lGZ9tmR7
	 4+QSWKVh4Tk36p78q7PJzF/66SIejDpSLLnNGZXxyIClos6aoQnHspRdBpiaVuc8vKeIR
	 LRuJaWIG16oOQ/toIZ5CldVRlyiWASHnTEw9H5MOq0mh3TSigkSvFS5cHoj//HLRVgEFv
	 loklDsdWa4wcUCqtLPQLEeWWSarCogOX9re3vC2U9VbRODpTr44xAKq6fRmJSKCT+MIq6
	 PlI0aYwRnoyLYjmVtNwRPqWwJEgYKqE/eosGfRZyII5WVsM4UxmZoiThZ8CLTZ6FiMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925642;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=/62uKVZqn8qZs0pir50ICzVq4HZhnsPUj5NwDryzruo=;
	b=1tGQ4CEhyf+Ds7MjK6yXiTGfPv3PZAm5yC2ij4mG/Fn1EgedjRbfGj0ZgU/lvYsWSaqS
	 7tygmJ02V+HIWggD9/d1FHbwbzBPELfqtOAMzzOqY5VLGyGywd6GyhTOvv8Cu49ddA898
	 Z9L3Hht/lsjBiL6WYpFRR2ni09he+zxTF0uTXY8s4FOr3DHdXlElDCAKVMDhdVTn/Rtyy
	 ZP1LkdyjehS2JI3KSUYQCW75v0bInVvmqfJJJddL4vUgopYar4vvWIxvR1FegLwxY3J3f
	 0Ccfgine/jZ3O90Fe+BHnIO2TnsQfcTmX4XiPSlugGggogri+C/KCmrjF1zr01Nehgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=flRQHc0i;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE18606A881
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE18606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=flRQHc0i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1794925641; x=1826461641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/62uKVZqn8qZs0pir50ICzVq4HZhnsPUj5NwDryzruo=;
  b=flRQHc0i7IyIrXWVd1FVc9O7R0HheJN/mpWf8JbjFspGvNDQtNFexZB+
   uuBb1D2i+NPs7GG+P6jkKVSFrRgXMfLVWIEXhtah1zEORKlwcpQI4Z0qL
   ChJXxHqofU5v7Zw41Q+6JB0nYmwLc5uLsJrkELwAYMh1CoL5YUM1bpo9w
   i9pJPLarivFX9i5T/JUFYCcWI6wCD1R+nYKolsRQvJ6uEx/jOkFnpxV5t
   HGExGzM2LedeJeTUMFBDvl7yZmGfPcdvG+e9IMOOyo/grQzj2iRjF4rSb
   hXJcR+8Av5Sr5kVemRCg8rjkQX6NFeu+fRttzEDgsr+v/X1O3Xz2VhwXN
   w==;
X-CSE-ConnectionGUID: w6nNxOrsREmlR6xeAl1pYg==
X-CSE-MsgGUID: 5ZtV6j3fTW+CfXKLIVCwNg==
X-IronPort-AV: E=Sophos;i="6.27,218,1787011200"; 
   d="scan'208";a="34310575"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 14:27:19 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:2453]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.227:2525] with esmtp (Farcaster)
 id de66d910-50d9-4d58-8cc1-ac648b161082; Tue, 17 Nov 2026 14:27:18 +0000 (UTC)
X-Farcaster-Flow-ID: de66d910-50d9-4d58-8cc1-ac648b161082
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 17 Nov 2026 14:27:18 +0000
Received: from dev-dsk-lshahed-1a-d9c3b839.eu-west-1.amazon.com
 (172.19.123.145) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Tue, 17 Nov 2026
 14:27:16 +0000
From: Ibrahim Elshahed <lshahed@amazon.de>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Josh Don <joshdon@google.com>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>, Fernand Sieber
	<sieberf@amazon.com>, Roman Kagan <rkagan@amazon.de>
Subject: [PATCH 2/2] sched/core: Don't skip a pending core-wide pick on idle re-entry
Date: Tue, 17 Nov 2026 14:27:03 +0000
Message-ID: <20261117142704.6878-3-lshahed@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117142704.6878-1-lshahed@amazon.de>
References: <20261117142704.6878-1-lshahed@amazon.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Since v6.12, with commit 3dcac251b066 ("sched/core: Introduce SM_IDLE
and an idle re-entry fast-path in __schedule()"), an idle CPU with an
empty runqueue skips pick_next_task() when it is rescheduled. Under
core scheduling that pick also consumes the pick a sibling's core-wide
selection left in rq->core_pick and ends or re-examines the core's
forced idle.

A core-wide selection chooses a task for an idle sibling and reschedules
it. If the chosen task is migrated away before the sibling schedules
and it was the sibling's only task, the sibling goes back to idle
through the fast path without consuming its pick. When that selection
also forced the other sibling idle, because its runnable tasks did not
match the chosen task's cookie, the core stays forced idle with nothing
running on it, and two things go wrong:

- Without the previous patch, the idle sibling's rq->core_pick keeps
  pointing at the migrated task, and with schedstats enabled the forced
  idle accounting keeps writing through it, even after the task and its
  cgroup are freed:

  BUG: unable to handle page fault for address: ffff8d6b205f7018
  #PF: supervisor write access in kernel mode
  #PF: error_code(0x0002) - not-present page
  RIP: 0010:__cgroup_account_cputime_field+0x3c/0x70
  Call Trace:
   __sched_core_account_forceidle+0xd8/0x140
   __schedule+0x1390/0x18d0
   schedule_idle+0x1a/0x30
   cpu_startup_entry+0x29/0x30
   start_secondary+0x11e/0x140

- The forced-idle sibling keeps waiting with runnable tasks until some
  unrelated event reschedules the core. Likewise, when the forced-idle
  CPU itself loses its last task, the reschedule that
  sched_core_dequeue() sends to end the forced idle also ends in the
  fast path.

Take the SM_IDLE fast path only when core scheduling has neither a
pick pending for this CPU nor forced idle to settle.

Fixes: 3dcac251b066 ("sched/core: Introduce SM_IDLE and an idle re-entry fast-path in __schedule()")
Cc: stable@vger.kernel.org
Co-developed-by: Roman Kagan <rkagan@amazon.de>
Signed-off-by: Roman Kagan <rkagan@amazon.de>
Signed-off-by: Ibrahim Elshahed <lshahed@amazon.de>
---
 kernel/sched/core.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b1718ba5a4..58b429bbe3 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -347,6 +347,17 @@ void sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags)
 		resched_curr(rq);
 }
 
+/*
+ * An idle CPU with an empty runqueue must still call pick_next_task() while
+ * it has a pending core-wide pick or the core is forced idle. Only that pick
+ * consumes rq->core_pick and ends the forced idle.
+ */
+static inline bool sched_core_idle_needs_pick(struct rq *rq)
+{
+	return sched_core_enabled(rq) &&
+	       (rq->core_pick || rq->core->core_forceidle_count);
+}
+
 static int sched_task_is_throttled(struct task_struct *p, int cpu)
 {
 	if (p->sched_class->task_is_throttled)
@@ -550,6 +561,7 @@ void sched_core_put(void)
 static inline void sched_core_enqueue(struct rq *rq, struct task_struct *p) { }
 static inline void
 sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags) { }
+static inline bool sched_core_idle_needs_pick(struct rq *rq) { return false; }
 
 #endif /* !CONFIG_SCHED_CORE */
 
@@ -7285,8 +7297,13 @@ static void __sched notrace __schedule(int sched_mode)
 	 */
 	prev_state = READ_ONCE(prev->__state);
 	if (sched_mode == SM_IDLE) {
-		/* SCX must consult the BPF scheduler to tell if rq is empty */
-		if (!rq->nr_running && !scx_enabled()) {
+		/*
+		 * SCX must consult the BPF scheduler to tell if rq is empty,
+		 * and core scheduling may need pick_next_task() to consume
+		 * rq->core_pick or to end forced idle.
+		 */
+		if (!rq->nr_running && !scx_enabled() &&
+		    !sched_core_idle_needs_pick(rq)) {
 			next = prev;
 			rq->next_class = &idle_sched_class;
 			goto picked;
-- 
2.47.3

