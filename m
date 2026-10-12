Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8202931EE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812025; cv=none; b=FWEW9Cwmuk0GplYCfCql7zymOrRae+NgeaU0LSjlQHQmYEVS7y6wqfNpQVyQ0c4cG4mTQO/7QSrPlx1O+SdKSEqzICAjBtxNcxFhYNxFZdLcy5UqxxQqVLj9Z6OXzQUkYyqfu7R1m5XW7dlVw+7M6a+2vZf+gL7/LCy1jV5FIxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812025; c=relaxed/simple;
	bh=so65oHDGenOdED39TzQzCLLXvYCyD0hapUyVRRBY+bM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c1NKy99jsrGJQdLWDyBAAHynqkYeDWvhM07Ga+bXGJ2yuypx6Gc9r7BgdumR+4dRr9QnwxJyZ/2eqU7lxqlG1q0GBNillJE0G4HGfAUEtWC2dYExMeGwmaPNB/7IBo2KiHkNObDPIkvhAmjyIfjgAu+g0wm60sZ5x6UjkCOGf3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IJvPpTi1; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IJvPpTi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=z9
	+TtgMW/MoC/HAZXuEWu5j/OJWOXiSnjYsCoFRiOJs=; b=IJvPpTi147pKAUP0HX
	kZuVilrH0jIMMnOK0FB7eGQDLdPqkmt82q2+Dpc1knD7psI/0o/056eMeD2ZLB5u
	qVxiLmRaEeC/x1XB5wgb3k7fE/PfIF9jq2Mk/F68fINf6ez6yKoKz0sPxoT6YeJP
	lceG3w6Wchi33D/0e84HxR0qw=
Received: from localhost (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHP3BL4cxq0pSxEA--.46412S2;
	Mon, 12 Oct 2026 21:31:56 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mike Galbraith <efault@gmx.de>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH v2] sched/autogroup: Make nice rate-limit updates atomic
Date: Mon, 12 Oct 2026 22:31:55 +0900
Message-ID: <20261012133155.86480-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCHP3BL4cxq0pSxEA--.46412S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1UWw1fXFWkXw15tw1UJrb_yoW5AFykpa
	9FyrWjyrs8tF1jkFn7CayUZFWruwn7G3y7Jrn7K398ZF43Gw18KFyIgw43tF4DGryIvrWa
	vrZ0vasxAF1jyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pREApUUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6gxZuGrM4UyyOAAA3G

proc_sched_autogroup_set_nice() uses a function-static timestamp to
rate-limit the expensive sched_group_set_shares() operation.

The timestamp check and update are not atomic. Concurrent unprivileged
writers can therefore observe the same expired timestamp and proceed to
sched_group_set_shares(), weakening the intended throttling of this
expensive path.

Use try_cmpxchg() so that only one unprivileged caller can claim an
expired rate-limit window. A competing unprivileged caller which loses
the race returns -EAGAIN. Use xchg() for privileged callers so that
they retain their existing rate-limit bypass behavior while updating
the timestamp atomically.

Fixes: 5091faa449ee ("sched: Add 'autogroup' scheduling feature: automated per session task groups")
Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Hui Su <sh_def@163.com>
---
Testing:
- x86_64 KVM functional rate-limit oracle admitted one of eight
  synchronized unprivileged writers and returned -EAGAIN to the other
  seven.
- x86_64 KVM privileged and mixed-contention tests completed all
  CAP_SYS_ADMIN writes without -EAGAIN or errors; competing
  unprivileged writers were rate-limited as expected.
- x86_64 KVM KCSAN forced-overlap test admitted one writer and returned
  -EAGAIN to the other, with no proc_sched_autogroup_set_nice report.

Changes in v2:
- Replace the dedicated spinlock with try_cmpxchg() for unprivileged
  callers, as suggested by Prateek.
- Use xchg() for CAP_SYS_ADMIN callers to preserve their existing
  rate-limit bypass behavior.

v1: https://lore.kernel.org/lkml/20261008064440.240528-1-sh_def@163.com/
---
 kernel/sched/autogroup.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/autogroup.c b/kernel/sched/autogroup.c
index e380cf9372bb..76fa3f287208 100644
--- a/kernel/sched/autogroup.c
+++ b/kernel/sched/autogroup.c
@@ -234,7 +234,7 @@ int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
 {
 	static unsigned long next = INITIAL_JIFFIES;
 	struct autogroup *ag;
-	unsigned long shares;
+	unsigned long shares, old;
 	int err, idx;
 
 	if (nice < MIN_NICE || nice > MAX_NICE)
@@ -247,11 +247,15 @@ int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
 	if (nice < 0 && !can_nice(current, nice))
 		return -EPERM;
 
-	/* This is a heavy operation, taking global locks.. */
-	if (!capable(CAP_SYS_ADMIN) && time_before(jiffies, next))
-		return -EAGAIN;
+	/* Rate-limit this heavy operation, which takes global locks. */
+	if (capable(CAP_SYS_ADMIN)) {
+		xchg(&next, HZ / 10 + jiffies);
+	} else {
+		old = READ_ONCE(next);
+		if (time_before(jiffies, old) || !try_cmpxchg(&next, &old, HZ / 10 + jiffies))
+			return -EAGAIN;
+	}
 
-	next = HZ / 10 + jiffies;
 	ag = autogroup_task_get(p);
 
 	idx = array_index_nospec(nice + 20, 40);

base-commit: 6f8319e3e9a44dd537d17f41565a8453c560a581

