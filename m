Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C84B33438F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383373; cv=none; b=YsmaNbYJyMiCZS4Q5EuVsr8+MLr6LwNEUH1oU27VdePO89pMMQLsVFe1SHiBZaR524WBrQXnVe175A/SWpx/7uxv87FWyw5MC3/cqSJHkx3aR49bUwhwhMS/r/3KjQ9i50Mf+LCaNnquRmA/FZj3M48xQHPtdgKgwswoX3oj4m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383373; c=relaxed/simple;
	bh=1FKXmAlgSNvgtLI4+mb2Jh6xcUiHhFD0AtN1Yscgp20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iMeAb/K8QWmHr4FO61MlmFdx4Rkas4EjKwcakFP4ELPQWFgELV3O3Z4HpMeuREDPOIbfTtxitKmxzfsl50y2bMd3wy9hGjwwZtPkXjSALNcC5iHTZ1ZmcE98NVaxjItY8wx2W4YTLqHxL2hAeY2zuiDCBYEcr0sr4w9yMMkUpF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FM4Ap+iS; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FM4Ap+iS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=FG
	fm0gceA9mncXAg4Vi1tcx6CukqvrVi/EbqUSg1DtE=; b=FM4Ap+iSQqis9NfkA+
	3i6LV6tOfXKrVhNu3GcGpfRsF5GC0EQ8uwz1ZnWnSjkwHnRLuO7vpQI4DRe8fr4i
	5M76FsTGQ+Fx/aEeMqhb4SYFz9h7wEuCC2XJved1zzdwB+vgCUo227gNvu5EWHFj
	0dBjJYTLGidyztF02Lg6jqWeQ=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnX0NBmdVqsZhpAw--.25828S2;
	Mon, 19 Oct 2026 12:14:58 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: hannes@cmpxchg.org,
	surenb@google.com,
	peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched/psi: Keep average work scheduled for pending notifications
Date: Mon, 19 Oct 2026 13:14:56 +0900
Message-ID: <20261019041456.2589789-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnX0NBmdVqsZhpAw--.25828S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw4kCryUtw1UWry7JFW5KFg_yoWrXw1xpa
	9YkFy5Kr4UGFn7uws5Zw10vw1furyfJay2yr4qkryYya13tr1FyF1ayF4jyw4UuryfGr13
	tw4Yyr42kw42kF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QKG5WrVmUK-IAAA3z

Unprivileged PSI triggers use the average aggregation worker.
When a threshold is breached during the rate-limit window,
the notification is deferred by setting pending_event.

If pressure stops before the rate limit expires,
psi_avgs_work() can stop rearming because
PSI_STATE_RESCHEDULE is no longer set. The pending event
then remains undelivered until new activity restarts
the worker.

Reuse the trigger walk result when an average update is due.
When the worker runs early, check for pending events because
psi_show() can advance avg_next_update without processing
triggers. Once the notification is delivered and pressure
has stopped, allow the worker to go idle again.

Fixes: d82caa273565 ("sched/psi: Allow unprivileged polling of N*2s period")
Signed-off-by: Hui Su <sh_def@163.com>
---
Tested on x86_64:
- KASAN KUnit: candidate PSI_AVGS 6/6 passed, including trigger destruction;
  refcount tests 4/4 passed, with no KASAN report. Baseline had 3/6 expected
  PSI_AVGS regression failures.
- QEMU cgroup v2 with unprivileged `some 5000 4000000`: baseline missed the
  second event with `pending=1/rearm=0`; candidate delivered it at 3999.9 ms
  with `pending=1/rearm=1`, then cleared the pending event. The second pressure
  deltas were 505240/490317 us; both quiet-period deltas were 0.

 kernel/sched/psi.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 7c53814233345..e17826ac1dbc7 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -460,13 +460,14 @@ static u64 window_update(struct psi_window *win, u64 now, u64 value)
 	return growth;
 }
 
-static void update_triggers(struct psi_group *group, u64 now,
-						   enum psi_aggregators aggregator)
+static bool update_triggers(struct psi_group *group, u64 now,
+			    enum psi_aggregators aggregator)
 {
 	struct psi_trigger *t;
 	u64 *total = group->total[aggregator];
 	struct list_head *triggers;
 	u64 *aggregator_total;
+	bool pending = false;
 
 	if (aggregator == PSI_AVGS) {
 		triggers = &group->avg_triggers;
@@ -506,8 +507,10 @@ static void update_triggers(struct psi_group *group, u64 now,
 			}
 		}
 		/* Limit event signaling to once per window */
-		if (now < t->last_event_time + t->win.size)
+		if (now < t->last_event_time + t->win.size) {
+			pending = true;
 			continue;
+		}
 
 		/* Generate an event */
 		if (cmpxchg(&t->event, 0, 1) == 0) {
@@ -520,6 +523,8 @@ static void update_triggers(struct psi_group *group, u64 now,
 		/* Reset threshold breach flag once event got generated */
 		t->pending_event = false;
 	}
+
+	return pending;
 }
 
 static u64 update_averages(struct psi_group *group, u64 now)
@@ -575,11 +580,24 @@ static u64 update_averages(struct psi_group *group, u64 now)
 	return avg_next_update;
 }
 
+static bool psi_has_pending_avg_events(struct psi_group *group)
+{
+	struct psi_trigger *t;
+
+	list_for_each_entry(t, &group->avg_triggers, node) {
+		if (t->pending_event)
+			return true;
+	}
+
+	return false;
+}
+
 static void psi_avgs_work(struct work_struct *work)
 {
 	struct delayed_work *dwork;
 	struct psi_group *group;
 	u32 changed_states;
+	bool pending = false;
 	u64 now;
 
 	dwork = to_delayed_work(work);
@@ -598,11 +616,13 @@ static void psi_avgs_work(struct work_struct *work)
 	 * go - see calc_avgs() and missed_periods.
 	 */
 	if (now >= group->avg_next_update) {
-		update_triggers(group, now, PSI_AVGS);
+		pending = update_triggers(group, now, PSI_AVGS);
 		group->avg_next_update = update_averages(group, now);
+	} else if (!(changed_states & PSI_STATE_RESCHEDULE)) {
+		pending = psi_has_pending_avg_events(group);
 	}
 
-	if (changed_states & PSI_STATE_RESCHEDULE) {
+	if ((changed_states & PSI_STATE_RESCHEDULE) || pending) {
 		schedule_delayed_work(dwork, nsecs_to_jiffies(
 				group->avg_next_update - now) + 1);
 	}

base-commit: b99b7f60c5b473d374c68b53753153b4aa9e0702

