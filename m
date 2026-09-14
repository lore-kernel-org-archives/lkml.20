Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666553C3C00
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404971; cv=none; b=iQpMXppoNRCoSNzIkKugS7RmEt5lgWubQlDcjDCTyXnedQ/I5J44vKtGTv2xeQgdtXH7ZbmSpesoroVPruuy6qPWvNvJt5V6Lm64LvfasJPZSD6xmEk/9E+/Qzyja5VmcZC58oLmzBfg0oFgys1WO5hWEANFNdZcdthfYJkjKoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404971; c=relaxed/simple;
	bh=C6x1A2vtKz+Akp15g0pgj/EO5Fz4tdOYmMzqUlrGqLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kH+rxeKiQGYFRnCHcHf9x3acUHt011/GIQxkOEQxPuB0+qn8o9VxmsVsTCAN90pp1M5Bo203U/RgcM+mduSOdia/aUB32YcuLNsXqrozk7If0wKWkYbuCiDCtZLiJX2vJA8l9nAXTy1eMj/DcoCx1UclRQccGnEc5yKP0DVGzhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YSOM7vYR; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YSOM7vYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=at
	dGdOLd1/jv1BmIzU27UdLp4lIbrjkmL4gvYdRGpow=; b=YSOM7vYRyLiOik3P+c
	qgkboUVJPDvl37bHLBcpNtavmZpTG1t6WIh1BmPg5zDmBt+NFMFyavTxxnLkD38N
	BRSjZT/uYgrOilgxyyXoct/pNH+jXnHmeiYopq75OkgLIZjlFPcUe+j7qdhzg7Wu
	ZYn6v12OQW6Q9o3GgIpZKMHk4=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXPfbhJqhqDtbiAg--.22277S2;
	Tue, 15 Sep 2026 00:54:58 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Zhidao Su <soolaugust@gmail.com>,
	John Stultz <jstultz@google.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [RFC PATCH 1/1] sched/proxy_exec: detect cycles in proxy walks
Date: Tue, 15 Sep 2026 01:54:55 +0900
Message-ID: <20260914165455.2126134-2-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914165455.2126134-1-sh_def@163.com>
References: <20260914165455.2126134-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXPfbhJqhqDtbiAg--.22277S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw1rWry5tFW5ZF47tFyxKrg_yoW5Xry5pa
	98GasxGw4DGF42gF17Xr4kAryfCwn5ZFWUJF1fJaySkr1rtr1Sqr1vgr1YvFWFyrs8uF4a
	qrnrtry7WF4q9F7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJUUUUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwgKG5WqoJuJ2-gAA3t

Proxy execution follows blocked_on relationships to find a runnable lock
owner. A cycle in that chain can make find_proxy_task() loop indefinitely
while holding rq->lock.

Use Brent checkpoint state directly in the real owner walk. Cycle detection
reuses the owner resolution already performed by that walk and requires no
separate preflight traversal. The checkpoint, power, and span state are all
invocation-local.

Keep the existing owner == p wakeup-race handling ahead of cycle detection.
Unlike a sequence-marker approach, this adds no task_struct or runqueue
state and requires no activation-time reset.

The online walk can temporarily install a blocked_donor cycle before the
delayed Brent detection point. In the tested recovery path, the selected
task's blocked_donor was cleared before it resumed. A forced-stale control
also confirmed that mutex handoff revalidates the donor's blocked_on
relationship before consuming a backlink. Validation of this trade-off and
comparative measurements against the sequence-marker approach are included
in the cover letter.

Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b998ef6b87af..debf313ed9fd 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6914,6 +6914,9 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 	__must_hold(__rq_lockp(rq))
 {
 	struct task_struct *owner = NULL;
+	struct task_struct *cycle_checkpoint = donor;
+	unsigned int cycle_power = 1;
+	unsigned int cycle_span = 0;
 	bool curr_in_chain = false;
 	int this_cpu = cpu_of(rq);
 	struct task_struct *p;
@@ -6921,6 +6924,13 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 
 	/* Follow blocked_on chain. */
 	for (p = donor; p->is_blocked; p = owner) {
+		/* Keep Brent's checkpoint state local to this owner walk. */
+		if (cycle_span == cycle_power) {
+			cycle_checkpoint = p;
+			cycle_power <<= 1;
+			cycle_span = 0;
+		}
+
 		/* if its PROXY_WAKING, do return migration or run if current */
 		struct mutex *mutex = p->blocked_on;
 		if (!mutex) {
@@ -7035,6 +7045,15 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
 			 */
 			return proxy_resched_idle(rq);
 		}
+
+		cycle_span++;
+		if (owner == cycle_checkpoint) {
+			pr_warn_once("sched/pe: deadlock cycle detected, pid %d\n",
+				     p->pid);
+			__clear_task_blocked_on(p, NULL);
+			goto deactivate;
+		}
+
 		/*
 		 * OK, now we're absolutely sure @owner is on this
 		 * rq, therefore holding @rq->lock is sufficient to
-- 
2.55.0

