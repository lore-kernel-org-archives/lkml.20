Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7C536D9FE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862066; cv=none; b=DKzP2Fx5IMZ51j7BT0/Ch538k7ZcpETtcL7W0QBZ3ZDFwFYK2Upz1Fm3VX9re3MVDXdJ1nYBdcOCHynWVYiVqwN0Cw5R51zOE4Uko8lHicT+khvQU3MP7ficECzaNOFh1Vc32/J7N9mmYM0iFvu8217VyLrLzFHUcP8TiLu4XZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862066; c=relaxed/simple;
	bh=M34OpsoHt//cnZbHjGEoqD+vj7dKStR+i2Nn94OFrEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JlKxx4glV6tRJnECVMqSShEvPqKl4N+a7xyfXglzYpaeeRhYMSeNxdVHKSu8foddZX92KlV3AX2OdBM9R6dNqCaAVDao5lQCDhiUwAwZpD2ty/nU9VGyo6wGs98QwShKi1YS/qCJ+H6/GOQNpxnu+WRErCBG/ICBvXOZgPm81ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ic64D90x; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ic64D90x"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 166BF497;
	Thu,  1 Oct 2026 06:40:59 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.0.130.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3FEA03F86F;
	Thu,  1 Oct 2026 06:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790862062; bh=M34OpsoHt//cnZbHjGEoqD+vj7dKStR+i2Nn94OFrEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ic64D90xCJpBK4ZxI1/zPAhsifrGEjF+IJhAOa/VBAh3B2rEKdoHqd8tmWLG0Eyui
	 5d4izXvLsjW4wbFxYrjwVJm0KMoEHdEmT2CxP3o3fXEx3c6LiOlbPIFeewG+Q+XimE
	 3yEUWy/+RERR/4So7g0/6vE8rKrtl5LYq/ADklkA=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	elif.topuz@arm.com,
	sh@gentwo.org,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH v2 1/5] sched/fair: Take slice protection into account when arming HRTICK
Date: Thu,  1 Oct 2026 14:40:12 +0100
Message-Id: <20261001134016.3881268-2-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001134016.3881268-1-christian.loehle@arm.com>
References: <20261001134016.3881268-1-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EEVDF can end a task's slice protection before its virtual deadline when
shorter requests compete on the runqueue. update_curr() requests a new
selection once protection expires, but hrtick_start_fair() still arms the
timer for the virtual deadline. Without an intervening scheduling event,
the next opportunity to reconsider the task can therefore arrive much
later than the protection boundary.

Arm the fair hrtick for the earlier of the virtual deadline and live
slice protection. Keep the deadline fallback once protection expires.
With RUN_TO_PARITY disabled, vprot remains the minimum progress quantum,
so the timer must reconsider current at that boundary too. A same-task
repick restarts the timer without renewing protection, so newly eligible
tasks can compete without waiting for another protected quantum.

A wakeup can shorten protection without preempting current. The enqueue
path calls hrtick_update() before wakeup_preempt_fair() updates protection,
and hrtick_update() leaves an active timer alone. Recompute the fair
hrtick after update_protect_slice() changes vprot, including when a timer
is already active. If the new protection boundary has already passed,
request lazy rescheduling, as update_curr() does on protection expiry,
instead of falling back to the later deadline.

Fixes: 74eec63661d4 ("sched/fair: Fix NO_RUN_TO_PARITY case")
Reported-by: Vincent Guittot <vincent.guittot@linaro.org>
Link: https://lore.kernel.org/r/CAKfTPtD_aJeAh1biW6gKCLK6BnYcNtbz-FJvxUzZ1tD3V=43mw@mail.gmail.com/
Link: https://lore.kernel.org/r/CAKfTPtApFGcYA22Qtg3OyYEt6EJw_FW9_VV=_vgE_HtNY3V9og@mail.gmail.com/
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/fair.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a39c48704d40..85bf02570473 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8018,9 +8018,13 @@ static void hrtick_start_fair(struct rq *rq, struct task_struct *p)
 		return;
 
 	/*
-	 * Compute time until virtual deadline
+	 * Reconsider the pick when live slice protection expires, which can be
+	 * earlier than the virtual deadline when shorter requests compete.
+	 * Without live protection, use the virtual deadline instead.
 	 */
 	vdelta = se->deadline - se->vruntime;
+	if (protect_slice(se))
+		vdelta = min_vruntime(se->deadline, se->vprot) - se->vruntime;
 	if ((s64)vdelta < 0) {
 		if (task_current_donor(rq, p))
 			resched_curr(rq);
@@ -10261,8 +10265,18 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
 	if (preempt_action == PREEMPT_WAKEUP_SHORT && entity_eligible(cfs_rq, pse))
 		goto preempt;
 update:
-	if (sched_feat(RUN_TO_PARITY))
+	if (sched_feat(RUN_TO_PARITY)) {
+		u64 old_vprot = se->vprot;
+
 		update_protect_slice(cfs_rq, se);
+		if (hrtick_enabled_fair(rq) && se->vprot != old_vprot) {
+			/* The enqueue may have armed the timer before this update. */
+			if (protect_slice(se))
+				hrtick_start_fair(rq, donor);
+			else
+				resched_curr_lazy(rq);
+		}
+	}
 
 	return;
 
-- 
2.34.1
