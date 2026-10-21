Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603602;
	b=vsdAzFcOjAAKkxzYjAJJTzjybdLtTiJEXtgHq+ewoG42MxymXnBsb0zbfjDMR2v5EZpo
	 CYP1HYs1zPnQYWVGbloKFYi1jqeXopPqKLZIwVemVXs/4ju5eSWdqN6lrAS68Nb7gxI2X
	 vFnUUA5OwoMFZ4gaJQwwNSZuJpt0IbB7ekaQ33zlpiizRFui91jhtLsW0Ts0fQVha1j8j
	 QVxmC9SuAJj6zHp38898lsgh8ccUS9nKasUCKYzXq2F2AgBHtZkG2qFKDa+8f1z3xKiiu
	 pFGsyRD1USwA0Q2HghJuTnwrA2upgQeplks/ylrupQ5J5vBXAb6ZuiMhuGJGS9/ajqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603602;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gYDlcYuCJeH/epGUtLFyM8ObuK2jGQuubWoMX0zjRHo=;
	b=UBwQDevNAQyGyNKvBGu4mhJJqb9EETDUP24c8VtvoOQYF8v2eB/3Hg1GxbMolQCKgKcI
	 MO+nqywz/5pWxaOGeQbhtVzR9eaC3gdZIQOk108UUEJbPfZVxC2EgP898KyfMFbf9LvP/
	 kOQmm0jZpGDGx4E3gD3bD8tu4D6L89Ye3JCoBIMF+qWCIRJUZuNcUO+xi5SQomS/qhOPm
	 lZ4DxlRMnyf9oR/NXhDNAtjdg5Sw0tJFHrZsZOXTOtooPodsuPcQrkoSLobp9h+p5c0wJ
	 CifWDQHYZIaSA/v3CTc79tiMcqJt/NPOAKRIpv+JLC54J8wv3xiJwoqnVlLimKcTSNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=TimxZGFf;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55646606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55646606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=TimxZGFf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792602932;
	bh=G6Pb405GBMUUrC+ZHj5HheWfXNbX9KMPWf+9X8fsyAQ=;
	h=From:Date:Subject:To:Cc:From;
	b=TimxZGFfyzGebKiz6fZZzl38im6VpWy3K+rpyuqFYwfCEGpOWtLY/QOOZgd7v/thu
	 WsyctXrKrriEsC6oC5+TTvcRKu4DZPFaOHIRgP08adWHjHL9xQr1foMDu5VPkdPCy6
	 COTDCAEMs6xc1EM41XJjDhogH9xo2zmcHbtbtBfg=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 9D2794014B;
	Wed, 21 Oct 2026 10:15:31 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Wed, 21 Oct 2026 10:15:29 -0700
Subject: [PATCH v2] sched/core: Use the scheduling context for remote ticks
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
Message-Id: <20261021-remote-tick-proxy-v2-1-07890601a71e@gentwo.org>
X-B4-Tracking: v=1; b=H4sIADDz2GoC/32NQQqDMBBFryKz7pQkoild9R7FRYijDqVGJiFVx
 Ls39QBdvgf//R0iCVOEe7WDUObIYS5gLhX4yc0jIfeFwSjTaqVbFHqHRJjYv3CRsG5oajt43bu
 29jcou0Vo4PVsPrvCE8cUZDsvsv7Zf7WsUaOxxjbWNcop+xhpTp9wDTJCdxzHF3aNLNWzAAAA
X-Change-ID: 20261016-remote-tick-proxy-237fc1da63c8
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Connor O'Brien <connoro@google.com>, John Stultz <jstultz@google.com>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: linux-kernel@vger.kernel.org, 
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792602931; l=3413;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=G6Pb405GBMUUrC+ZHj5HheWfXNbX9KMPWf+9X8fsyAQ=;
 b=nCDdfAAMTT82Vjy7xrtaZzH4GPoMZasNZrhFZPadIlgd0pOqAy/MHNMYdEd5Zek520GLcbKu1
 O6U5q9ZumaDDW8j1keMNYLAbnOj7Q+ZBnItEoQXb51McU7c1jqNiURe
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

sched_tick_remote() invokes task_tick() for rq->curr. With proxy
execution, rq->curr is the mutex-owner execution context while
rq->donor is the blocked task that supplies the scheduling context.

A mutex-blocked task remains queued for proxy execution. If that task
is SCHED_FIFO, or the only SCHED_RR task, sched_can_stop_tick() permits
the full-nohz tick to stop. find_proxy_task() can then select its mutex
owner as rq->curr while retaining the blocked task as rq->donor.

sched_tick() and hrtick() already invoke task_tick() for rq->donor.
Like task_tick(), the remote tick's full-nohz interval sanity check
currently uses rq->curr. The proxy owner in rq->curr can have a stale
se.exec_start before the accounting path updates it.

Make sched_tick_remote() use rq->donor for both the class tick and the
full-nohz tick-interval sanity check.

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
Testing was performed on an Ampere Altra system with
CONFIG_SCHED_PROXY_EXEC=y and CONFIG_NO_HZ_FULL=y, booted with:

  sched_proxy_exec=1 nohz_full=78

On the unpatched baseline, 70dd4ee72eb2 (7.3.0-rc7), mutex locktorture
with four writers pinned to CPU 78 and RT boosting triggered:

  WARNING: kernel/sched/core.c:5895 at sched_tick_remote...
  Workqueue: events_unbound sched_tick_remote

This warning is WARN_ON_ONCE(rq->curr != rq->donor), demonstrating that
a full-nohz remote tick can run while the executing task and scheduling
context differ.

The v2 patched kernel completed the same 10 minute workload
without scheduler warnings or locktorture failures.

Changes in v2:
  - Use rq->donor for the full-nohz tick-interval sanity check.
  - Drop the redundant proxy-execution code comment.

Link to v1: https://lore.kernel.org/r/20261016-remote-tick-proxy-v1-1-272757a50a07@gentwo.org
---
 kernel/sched/core.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0ab15f03cb947eb958ff9f97d890716346377889..729ebaca35e1a9a12cda59e96c650ee6b1576951 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5934,26 +5934,20 @@ static void sched_tick_remote(struct work_struct *work)
 	 */
 	if (tick_nohz_tick_stopped_cpu(cpu)) {
 		guard(rq_lock_irq)(rq);
-		struct task_struct *curr = rq->curr;
+		struct task_struct *donor = rq->donor;
 
 		if (cpu_online(cpu)) {
-			/*
-			 * Since this is a remote tick for full dynticks mode,
-			 * we are always sure that there is no proxy (only a
-			 * single task is running).
-			 */
-			WARN_ON_ONCE(rq->curr != rq->donor);
 			update_rq_clock(rq);
 
-			if (!is_idle_task(curr)) {
+			if (!is_idle_task(donor)) {
 				/*
 				 * Make sure the next tick runs within a
 				 * reasonable amount of time.
 				 */
-				u64 delta = rq_clock_task(rq) - curr->se.exec_start;
+				u64 delta = rq_clock_task(rq) - donor->se.exec_start;
 				WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 30);
 			}
-			curr->sched_class->task_tick(rq, curr, 0);
+			donor->sched_class->task_tick(rq, donor, 0);
 
 			calc_load_nohz_remote(rq);
 		}

---
base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
change-id: 20261016-remote-tick-proxy-237fc1da63c8

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>

