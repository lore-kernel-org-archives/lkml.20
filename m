Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAD3566C5B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711252; cv=none; b=Mi+DC/txj5Rk03EM+ha8mXQI9agkAh/WUKGTQkpLFSJDoRJPBBmHiyHYra5HJonLBnc6mRJDsWkEqwanA9WPuhe8VGNVu7UHDC5P3ZTnvVjwQsA4UXAkA2MFb9VqCvUumcKz3gHzWRh57Rb4rjTjAp3NG3XdfYclOulsR9OtK1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711252; c=relaxed/simple;
	bh=lg+EkASDb7Om2ZYSnWzaAbNPKi2t9pnhqgCPqSr+/kM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MVPMHYifTf+LGNStd0mY4cQXqiI0khXJYM6iKW6n3jWPvi57M87s/ldWJkTf61O8El8mxEllAoQbTznqWVgvHBdLF2phEZ6bJf7qWPP337f0nEcL6AyAOXQFOi8SZmNpyjxmEU+wG3P1xUhoOIpLGpQP26iNR3iV4KaNilVVBBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=APdKzPYl; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="APdKzPYl"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4940143D;
	Tue, 29 Sep 2026 12:47:26 -0700 (PDT)
Received: from e127648.arm.com (unknown [10.57.52.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C3FE3F763;
	Tue, 29 Sep 2026 12:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790711250; bh=lg+EkASDb7Om2ZYSnWzaAbNPKi2t9pnhqgCPqSr+/kM=;
	h=From:To:Cc:Subject:Date:From;
	b=APdKzPYlWPEMB8JUpSlrgZTbpBUTS2LxfC+dp8enFbdv+o4F1Z0zav0K1COuxsPO4
	 IdxFpFTDySAjapqqixHRYJPQM39U3XLahAPfSA5uc9paKyv+IjAks+nc+yfbEJe8or
	 TdBhnsF9TY04ETXSQPT1ERwhAa5vkIxxgzoQMPak=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH] sched/fair: Take slice protection into account when arming HRTICK
Date: Tue, 29 Sep 2026 20:47:11 +0100
Message-Id: <20260929194711.2689811-1-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
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

For example, with two continuously runnable equal-weight SCHED_OTHER
tasks requesting 100 us and 1 ms on one CPU, the unpatched HZ=250 kernel
shows approximately 1 ms between context switches for both tasks. A
short request can be repicked repeatedly, so its uninterrupted run is
not limited to one request. CPU shares remain approximately equal;
the problem is the scheduling granularity.

Arm the fair hrtick for the earlier of the virtual deadline and live
slice protection. Keep the deadline fallback once protection expires.
A same-task repick restarts the timer without renewing protection, so
newly eligible tasks can compete without waiting for another protected
quantum.

A wakeup can shorten protection without preempting current. The enqueue
path calls hrtick_update() before wakeup_preempt_fair() updates protection,
and hrtick_update() leaves an active timer alone. Recompute the fair
hrtick after update_protect_slice() changes vprot, including when a timer
is already active. If the new protection boundary has already passed,
request lazy rescheduling, as update_curr() does on protection expiry,
instead of falling back to the later deadline.

Reported-by: Vincent Guittot <vincent.guittot@linaro.org>
Link: https://lore.kernel.org/r/CAKfTPtD_aJeAh1biW6gKCLK6BnYcNtbz-FJvxUzZ1tD3V=43mw@mail.gmail.com/
Link: https://lore.kernel.org/r/CAKfTPtApFGcYA22Qtg3OyYEt6EJw_FW9_VV=_vgE_HtNY3V9og@mail.gmail.com/
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/fair.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1c687c3c70f1..5b2965591ad8 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7798,9 +7798,13 @@ static void hrtick_start_fair(struct rq *rq, struct task_struct *p)
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
@@ -10023,8 +10027,18 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
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

