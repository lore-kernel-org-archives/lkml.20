Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C3D4D9F8B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406892; cv=none; b=QViGSydeGmuPjUgPPPEeDoI7yLoQqzu9ykNfQNt9RQq17GUL/uBcym3xF1SUro9EjqynQ/0sZ7YgfHS/vq876zmrwjwAyp51uh2YU6T3JETXATEg96GYKHl7po7SD4XONeLzKXCpR40nFpgZSKjhEGA36d7XDpJ5wzajnTEhlyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406892; c=relaxed/simple;
	bh=aCY1FhZSvVVciNLc8BodGyOpbrTLWLIxRj6ECshYCes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHLRcURDG3mrIEuqa7wWdGGsYog9MHdGeu0+drESE+pgzV/GQs3urfCtsw5RRuVVjtO7XItu+uTexg95mWMTzM8T3+OI+acQSK5IsbgNT4+w80QZobB0TuyqFbOKNOIK3mhpdIlPp27BYCLVAeH/djmYFuTD+vr2FrXMJNOptro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Jgs5qLwG; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Jgs5qLwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=HM
	VAq/fy8o6uxWTdmELC+COcwjfd25s0evDO/knXZeE=; b=Jgs5qLwGP0dXLnLsiH
	q+TycL3zZUg+iHTLf5ZJa9NwLHZdC72dugWFseJCaSz+7pXnPY+6hT/k5OewYlFM
	pQMXG8I9KO3XPkjxxZRZyEHnfAZ6lqFlbiXelX05UWFQyQ4OIpUXx1yoXV3GWlOT
	kgyxuCeYjE0JyKN5DrRzSXlyk=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3Hw0l9dVqMJEjBQ--.8959S2;
	Mon, 19 Oct 2026 18:47:02 +0800 (CST)
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
	sh_def@163.com
Subject: [PATCH 1/2] sched/psi: Preserve pressure accounting across RT trigger registration
Date: Mon, 19 Oct 2026 19:46:58 +0900
Message-ID: <20261019104700.3296133-2-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019104700.3296133-1-sh_def@163.com>
References: <20261019104700.3296133-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Hw0l9dVqMJEjBQ--.8959S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKFW5Ww17tF15XFWfAw4Dtwb_yoW7Cw4xp3
	95Cr1UWr48J34Utrs3G3Wv9r92gwn2qay7JrWfAa4jka43Xryrtr1qyFW5J3y7JFy3AF40
	yanIyryDKw42qF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piNtxDUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QaW9WrV9SbfXAAA3j

Creating a privileged trigger samples per-cpu pressure before an existing
rtpoll worker can consume it. Preserve state changes for existing triggers,
and initialize the new trigger window after the registration sample so it
does not account pressure that predates registration.

Evaluate triggers whenever their update is due, even if the current sample
has no changed states. Advance rtpoll_total after each evaluation so a
consumed sample is not counted again.

Signed-off-by: Hui Su <sh_def@163.com>
---
 include/linux/psi_types.h |  1 +
 kernel/sched/psi.c        | 34 ++++++++++++++++++++++------------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/include/linux/psi_types.h b/include/linux/psi_types.h
index dd10c22299ab8..5507a31477a43 100644
--- a/include/linux/psi_types.h
+++ b/include/linux/psi_types.h
@@ -197,6 +197,7 @@ struct psi_group {
 	struct list_head rtpoll_triggers;
 	u32 rtpoll_nr_triggers[NR_PSI_STATES - 1];
 	u32 rtpoll_states;
+	u32 rtpoll_pending_states;
 	u64 rtpoll_min_period;
 
 	/* Total stall times at the start of RT polling monitor activation */
diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 7c53814233345..733ecacc2adb4 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -219,6 +219,7 @@ static void group_init(struct psi_group *group)
 	mutex_init(&group->rtpoll_trigger_lock);
 	INIT_LIST_HEAD(&group->rtpoll_triggers);
 	group->rtpoll_min_period = U32_MAX;
+	group->rtpoll_pending_states = 0;
 	group->rtpoll_next_update = ULLONG_MAX;
 	init_waitqueue_head(&group->rtpoll_wait);
 	timer_setup(&group->rtpoll_timer, poll_timer_fn, 0);
@@ -648,7 +649,7 @@ static void psi_schedule_rtpoll_work(struct psi_group *group, unsigned long dela
 static void psi_rtpoll_work(struct psi_group *group)
 {
 	bool force_reschedule = false;
-	u32 changed_states;
+	u32 changed_states, sampled_states;
 	u64 now;
 
 	mutex_lock(&group->rtpoll_trigger_lock);
@@ -691,8 +692,11 @@ static void psi_rtpoll_work(struct psi_group *group)
 		force_reschedule = true;
 	}
 
-
-	collect_percpu_times(group, PSI_POLL, &changed_states);
+	/* Trigger registration may have consumed an activity delta. */
+	changed_states = group->rtpoll_pending_states;
+	group->rtpoll_pending_states = 0;
+	collect_percpu_times(group, PSI_POLL, &sampled_states);
+	changed_states |= sampled_states;
 
 	if (changed_states & group->rtpoll_states) {
 		/* Initialize trigger windows when entering rtpolling mode */
@@ -714,11 +718,8 @@ static void psi_rtpoll_work(struct psi_group *group)
 	}
 
 	if (now >= group->rtpoll_next_update) {
-		if (changed_states & group->rtpoll_states) {
-			update_triggers(group, now, PSI_POLL);
-			memcpy(group->rtpoll_total, group->total[PSI_POLL],
-				   sizeof(group->rtpoll_total));
-		}
+		update_triggers(group, now, PSI_POLL);
+		memcpy(group->rtpoll_total, group->total[PSI_POLL], sizeof(group->rtpoll_total));
 		group->rtpoll_next_update = now + group->rtpoll_min_period;
 	}
 
@@ -1334,7 +1335,7 @@ struct psi_trigger *psi_trigger_create(struct psi_group *group, char *buf,
 {
 	struct psi_trigger *t;
 	enum psi_states state;
-	u32 threshold_us;
+	u32 threshold_us, changed_states, existing_states;
 	bool privileged;
 	u32 window_us;
 
@@ -1386,8 +1387,8 @@ struct psi_trigger *psi_trigger_create(struct psi_group *group, char *buf,
 	t->state = state;
 	t->threshold = threshold_us * NSEC_PER_USEC;
 	t->win.size = window_us * NSEC_PER_USEC;
-	window_reset(&t->win, sched_clock(),
-			group->total[PSI_POLL][t->state], 0);
+	if (!privileged)
+		window_reset(&t->win, sched_clock(), group->total[PSI_POLL][t->state], 0);
 
 	t->event = 0;
 	t->last_event_time = 0;
@@ -1400,13 +1401,19 @@ struct psi_trigger *psi_trigger_create(struct psi_group *group, char *buf,
 	if (privileged) {
 		mutex_lock(&group->rtpoll_trigger_lock);
 
+		existing_states = group->rtpoll_states;
 		list_add(&t->node, &group->rtpoll_triggers);
 		group->rtpoll_min_period = min(group->rtpoll_min_period,
 			div_u64(t->win.size, UPDATES_PER_WINDOW));
 		group->rtpoll_nr_triggers[t->state]++;
 		group->rtpoll_states |= (1 << t->state);
+		collect_percpu_times(group, PSI_POLL, &changed_states);
+		group->rtpoll_pending_states |= changed_states & existing_states;
+		window_reset(&t->win, sched_clock(), group->total[PSI_POLL][t->state], 0);
 
 		*need_rtpoll_worker = !rcu_access_pointer(group->rtpoll_task);
+		if (!*need_rtpoll_worker)
+			psi_schedule_rtpoll_work(group, 1, true);
 
 		mutex_unlock(&group->rtpoll_trigger_lock);
 	} else {
@@ -1458,8 +1465,10 @@ void psi_trigger_destroy(struct psi_trigger *t)
 
 			list_del(&t->node);
 			group->rtpoll_nr_triggers[t->state]--;
-			if (!group->rtpoll_nr_triggers[t->state])
+			if (!group->rtpoll_nr_triggers[t->state]) {
 				group->rtpoll_states &= ~(1 << t->state);
+				group->rtpoll_pending_states &= ~(1 << t->state);
+			}
 			/*
 			 * Reset min update period for the remaining triggers
 			 * iff the destroying trigger had the min window size.
@@ -1473,6 +1482,7 @@ void psi_trigger_destroy(struct psi_trigger *t)
 			/* Destroy rtpoll_task when the last trigger is destroyed */
 			if (group->rtpoll_states == 0) {
 				group->rtpoll_until = 0;
+				group->rtpoll_pending_states = 0;
 				task_to_destroy = rcu_dereference_protected(
 						group->rtpoll_task,
 						lockdep_is_held(&group->rtpoll_trigger_lock));
-- 
2.55.0

