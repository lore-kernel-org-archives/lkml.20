Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33824415B85
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724948; cv=none; b=hd8jsHBzArFM2EYX4qTRiVOmmmRH5L/n9NIMJGUfUmdCbkOKx1t83QLAVPbOcOXXHOdnpWiNNpJFQzCkjptldsOdvqrMPRKFka0gG/FgbKw89KoojKtWfYoXXGnc0WrMc7LyFPgz42f6+K1Mc/WXbrOscK03u3SCAgQbhFiIilQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724948; c=relaxed/simple;
	bh=vtg16Wqo8ugzV6m7sAYzWPx4hAol2MrOZ2+SwlVblzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EuWhFx8bb/GMug5n5dhGlz1hhzSF5lfd9AORSKRn27/oZAPris7vW7RIIhmMuHq/nboOcYErgPCUzJqWqUct4GmaMYkX2Qo6SYm40+rCqp//OHWVPm+BTF0fRfn6v44G8FOLzD1CgiZxPEY2kClEfkZcmeIWUIXzIb7GWDI0k3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 27ffb680b34611f19a56ed5b684f684d-20260918
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:6487598c-388f-4ac5-a5c0-9cacd5ffedc0,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:26
X-CID-META: VersionHash:7db8b62,CLOUDID:9d0bf0fa17c4cf190b8c1a4bebff7f78,BulkI
	D:nil,BulkQuantity:0,SF:102|123|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 27ffb680b34611f19a56ed5b684f684d-20260918
X-User: luoliang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <luoliang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 237850384; Fri, 18 Sep 2026 17:48:52 +0800
From: luoliang@kylinos.cn
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@arm.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Yafang Shao <laoar.shao@gmail.com>,
	linux-kernel@vger.kernel.org,
	Liang Luo <luoliang@kylinos.cn>
Subject: [PATCH] sched: Fix incorrect sched_stat_wait statistics for rt and dl
Date: Fri, 18 Sep 2026 17:48:48 +0800
Message-Id: <20260918094848.2518338-1-luoliang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liang Luo <luoliang@kylinos.cn>

The update_stats_wait_start_*() wrappers only record wait_start while
schedstat_enabled(). With schedstats disabled by default, a task
enqueued before they are enabled at runtime has a zero wait_start, and
its next __update_stats_wait_end() computes the wait time as

	rq_clock(rq) - 0

which is the time since boot. The bogus delta is folded into wait_max
and wait_sum and passed to trace_sched_stat_wait(). Neither wait_max
nor wait_sum ever shrinks, so a single bogus sample corrupts the
task's wait statistics until it exits.

Reproduced on mainline with a SCHED_RR task:

$ grep wait_max /proc/<pid>/sched
wait_max                                     :       1058533.555050

on a machine with ~1058s of uptime.

The fair class has been immune since commit b9c88f752268
("sched/fair: Improve the accuracy of sched_stat_wait statistics"),
which skips the accounting on a zero wait_start, but the check lives
in the fair wrapper. The rt and dl wrappers call
__update_stats_wait_end() directly and never picked it up.

Move the check into __update_stats_wait_end() so that every class and
call site shares it, and drop the now redundant one from the fair
wrapper.

Fixes: 57a5c2dafca8 ("sched/rt: Support schedstats for RT sched class")
Fixes: b5eb4a5f6521 ("sched/dl: Support schedstats for deadline sched class")
Signed-off-by: Liang Luo <luoliang@kylinos.cn>
---
An equivalent fix was proposed by Zhang Qiao in 2024 but never merged:

https://lore.kernel.org/r/20240322081521.2687856-1-zhangqiao22@huawei.com

 kernel/sched/fair.c  |  9 ---------
 kernel/sched/stats.c | 12 +++++++++++-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7455a83a6a99..bf638eb359c4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -2116,15 +2116,6 @@ update_stats_wait_end_fair(struct cfs_rq *cfs_rq, struct sched_entity *se)
 
 	stats = __schedstats_from_se(se);
 
-	/*
-	 * When the sched_schedstat changes from 0 to 1, some sched se
-	 * maybe already in the runqueue, the se->statistics.wait_start
-	 * will be 0.So it will let the delta wrong. We need to avoid this
-	 * scenario.
-	 */
-	if (unlikely(!schedstat_val(stats->wait_start)))
-		return;
-
 	if (entity_is_task(se))
 		p = task_of(se);
 
diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
index d1c9429a4ac5..dce034b88c32 100644
--- a/kernel/sched/stats.c
+++ b/kernel/sched/stats.c
@@ -21,7 +21,17 @@ void __update_stats_wait_start(struct rq *rq, struct task_struct *p,
 void __update_stats_wait_end(struct rq *rq, struct task_struct *p,
 			     struct sched_statistics *stats)
 {
-	u64 delta = rq_clock(rq) - schedstat_val(stats->wait_start);
+	u64 delta;
+
+	/*
+	 * Tasks enqueued while schedstats were disabled have a zero
+	 * wait_start: the wait was never recorded. Skip it, as the delta
+	 * against 0 would be the time since boot.
+	 */
+	if (unlikely(!schedstat_val(stats->wait_start)))
+		return;
+
+	delta = rq_clock(rq) - schedstat_val(stats->wait_start);
 
 	if (p) {
 		if (task_on_rq_migrating(p)) {
-- 
2.43.0

