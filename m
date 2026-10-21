Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.72.0.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792625804;
	b=JOFC1g0/A01IlllTxvk2QBXFnZrtWya0P6tsi3Z8W/5/9Q0iR892LQcLxNXDVeZ91nHY
	 ZJKLfhYKTCEHUGbGu3bjMtNshJReTv+7wemFgxRDJvTcJL+3Nqu4GjYo+SsXk9OVOPMEt
	 pO9gy0U7CSdXOPvg3h3Xc0WKeRdPU/hHCC8GGu/AtttKPvnmksxdcT84a6rsej97NiOUX
	 YN3jmCG8qPkxOWV4JoY2axyfeK6kQfqm0LH+9fjzws07OQTAv/BreKQTGoXJspM+qSPr3
	 T6ESekYeB4L9/vEEB1ObKOMTJUZQhAEroR1c6TM2m9koURSzG0G+ONAUKNlj8MjogQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792625804;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RUXofh2aiHBxc0t6FZ0ii9SOkWt0pQWeow0Fu2BRDCc=;
	b=qBIl9qtdGuwpLqHilc+fh5yZoapAQBaFDPXNYeMB4HE8N5rkxxr+B0mC83NImXvT2kDw
	 MQu5vbvnYmj3rWBojjH8OwaSQHmZgcDOCiLHhT94XIdkDaXn4PiRxFKcRvlaNhXr3/pBp
	 hT51DtcgluhFsk5DZZmg7biDqM+31X5sCcnZNxarLmKTiBzcuZJublPGKU8G1h93Vk8Jg
	 BqxhVqmIarBPyfZjoBntQbOf+qx2GUx8484nw0kqKO/x4bMIO4080F3Xte5/GmJhFRX6L
	 jOvfjwC35h6JZFwr36TePMYE2EL6F9LEG+BuZANGIFgkyxPXqcXs0ueHMBIS9Ea3dlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gentwo.org;
	spf=pass smtp.mailfrom=gentwo.org;
	dkim=pass header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=sUJhJ15q;
	arc=none smtp.remote-ip=62.72.0.81
Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C410606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C410606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gentwo.org header.i=@gentwo.org header.a=rsa-sha256 header.s=default header.b=sUJhJ15q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1792625333;
	bh=53oA5zSc/hkMXzViH3OHqWQciU4m0/k2S2u2U8he8aE=;
	h=From:Date:Subject:To:Cc:From;
	b=sUJhJ15qoZL8M586Jh6DZKsdz2fIKJ3d+MTbEXM9RuvQJC3s4CLAVM3e+bQ8C7xpE
	 ib384RqzKcGKMvFobBkM/cCyljl0Yw+ZJukr4Hyyt8oRbESOlpyZe5WP/mwWINCyGG
	 Sqluj3NgJhdSyLkLJqLrjpngFMzByhz1yM9u/WNc=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id ED87B4014B;
	Wed, 21 Oct 2026 16:28:52 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Wed, 21 Oct 2026 16:28:46 -0700
Subject: [PATCH v3] sched/core: Use the scheduling context for remote ticks
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
Message-Id: <20261021-remote-tick-proxy-v3-1-8c37c5b4d6f6@gentwo.org>
X-B4-Tracking: v=1; b=H4sIAK1K2WoC/33NQQqDMBCF4atI1k3JjJjYrrxH6SLEUUOpkSSki
 nj3RlctlC7/B/PNygJ5S4Fdi5V5SjZYN+YoTwUzgx574rbNzVCgBAGSe3q6SDxa8+CTd/PCsVS
 dgVbL0tQs302eOjsf5u2ee7AhOr8cLxLs6z8tAQeOClWldCW0UE1PY3y5s/M927mEHwTCLwIzI
 VR9EVKAVkBfxLZtbxF1Pmr2AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792625332; l=3882;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=53oA5zSc/hkMXzViH3OHqWQciU4m0/k2S2u2U8he8aE=;
 b=td/8FlnNNcabp/Jy0P7+U2tcxFIkS+1DJ5JoaRkNttCFixXx2B9CUU8uLLbSP1ymGUf3gU3YV
 NG0/moa9m6eBE+LRkOF+MQtuWw1A+KBQbuqOIu8BaUZvypdxaNNr+U2
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

sched_tick_remote() assumes that a CPU in full dynticks mode has only
one running task. It therefore assumes that proxy execution cannot be
active and that rq->curr == rq->donor.

However, sched_can_stop_tick() can stop the tick with multiple tasks on
the runqueue. With exactly one SCHED_RR task, the tick is not needed for
round-robin timeslice rotation. When there are no SCHED_RR tasks,
SCHED_FIFO tasks do not require the tick because they have no forced
tick preemption. Lower scheduling-class tasks can still be queued in
both cases.

Consequently, a SCHED_FIFO task blocked on a SCHED_NORMAL mutex owner
can remain rq->donor while find_proxy_task() selects the owner to
execute as rq->curr. sched_tick_remote() can therefore run with
rq->curr != rq->donor.

The full-nohz state check in sched_tick_remote() is intentionally racy
and can allow an extra or missed remote tick. This issue does not rely
on that race: the tick can be legitimately stopped in the cases above.

Use rq->donor for the remote class tick and its full-nohz tick-interval
sanity check, matching sched_tick() and hrtick().

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
Acked-by: John Stultz <jstultz@google.com>
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

The v3 patched kernel completed the same 10 minute workload
without scheduler warnings or locktorture failures.

Changes in v3:
  - Rewrite the changelog to explain why full-nohz can stop the tick
    with multiple tasks on the runqueue and therefore permit proxy
    execution.
  - Clarify that the racy full-nohz-state check is not required to
    trigger the issue.
  - Add Acked-by from John Stultz.

Link to v2: https://lore.kernel.org/r/20261021-remote-tick-proxy-v2-1-07890601a71e@gentwo.org
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

