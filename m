Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCFE41CB4D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489991; cv=none; b=W5JLMWiA1VQO66NA+4ygtdRRIVEGKvZ5dZafNMRd1ko3mAm4jwAy7/J18IVXbHBHvCasa5W7nzB9SAFaO0yn0nKxrQmvcqcRqRDdicgZmQxfvoRxZQhyWr521IkCGGVWG3KrOUrXVPyx9egGCg+Ba/AjeHVb+iKI9WCxMSV+ISk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489991; c=relaxed/simple;
	bh=JIhc4E+BK6Mnyvy+z+2XlIMF9YN8CD6pk246LNxI4Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=numBletL0b85dVpJvBp/bvhikq8jB3Zjd6h+bV2eaYijswOwMrai4GhUB/jGTRXBbGxostStlx1bi9WiZ3vKZ+IO8easj6zsjahtBgaMp7cb/TNv0Jth+tUyWo45PcbEU25RH/HoyNKpw5pOHhZHvcIkz8dJX4iEps5+Pt3dJpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RCQU+e2I; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RCQU+e2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ma
	dzqak28alg5GHoSvVFd2+TBIkVYYme5MOU9NZ3gyo=; b=RCQU+e2IVGoQYRwM1d
	Jx1LjoyDPq+zO0uz4BdJQZfjb6o3vAwMf0FfVYGtXCLJdEmdzEJTVwFJNX4cSku+
	dmI4rXyxpzlrsL9wUbMEwSmHoSDm+P29Yc8MypekJxYZzcoIXcyT9E8RoNUo+KqB
	E002LUyjpnZDBAPOPe+ak/3+0=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAHWt7qcqlqqrxdAw--.59678S2;
	Wed, 16 Sep 2026 00:31:39 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/core: Remove redundant core_sched_seq
Date: Wed, 16 Sep 2026 01:31:38 +0900
Message-ID: <20260915163138.2973969-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAHWt7qcqlqqrxdAw--.59678S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF17ZryfKw4fGw1DtryDGFg_yoW5Kr1xpr
	9rJ3yDJ3WDKF1Utr1rZw4xGrWUGwn5A343WrnxXayIkF1rGrWFqr1vgw12vrWqkr4q9a42
	yFsIg39FqrZruaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UDMa5UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwgvbO2qpcutkbAAA37

core_sched_seq records whether an rq has consumed the pick made by the
last core-wide selection.

However, rq->core_pick already carries the same per-rq state. A core-wide
selection leaves core_pick populated only for siblings which still need to
consume their picks. It is cleared when the current CPU consumes its pick,
when a sibling is already running the selected task, or when a pending pick
is consumed through the fastpath. The CPU offline path clears it as well.

core_task_seq and core_pick_seq serve a separate purpose. core_task_seq
changes when the task set changes and for each new core-wide pick, while
core_pick_seq records the task sequence on which the selection was made.
Their equality therefore establishes that a pending core_pick is still
valid.

Consequently, once core_pick_seq == core_task_seq, a non-NULL core_pick is
sufficient to tell that this rq still has a pick to consume.
core_sched_seq duplicates that pending/consumed state.

Remove core_sched_seq and use core_pick directly as the pending marker.

Testing included an instrumented comparison of the old and new pending
predicates under core-scheduling stress. Additional guest tests exercised
repeated core-cookie lifecycles, forced idle, and CPU hotplug under load.
No predicate divergence or kernel warning was observed.

Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/core.c  | 10 ++++------
 kernel/sched/sched.h |  1 -
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 7885ff76e69f..6025d37532c6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6276,10 +6276,7 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	 * selection. In this case, do a core-wide selection.
 	 */
 	if (rq->core->core_pick_seq == rq->core->core_task_seq &&
-	    rq->core->core_pick_seq != rq->core_sched_seq &&
 	    rq->core_pick) {
-		WRITE_ONCE(rq->core_sched_seq, rq->core->core_pick_seq);
-
 		next = rq->core_pick;
 		rq->dl_server = rq->core_dl_server;
 		rq->core_pick = NULL;
@@ -6311,11 +6308,13 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	}
 
 	/*
-	 * core->core_task_seq, core->core_pick_seq, rq->core_sched_seq
+	 * core->core_task_seq, core->core_pick_seq
 	 *
 	 * @task_seq guards the task state ({en,de}queues)
 	 * @pick_seq is the @task_seq we did a selection on
-	 * @sched_seq is the @pick_seq we scheduled
+	 *
+	 * Once a core-wide selection is committed, a non-NULL core_pick denotes
+	 * a pick which still needs to be consumed on this CPU.
 	 *
 	 * However, preemptions can cause multiple picks on the same task set.
 	 * 'Fix' this by also increasing @task_seq for every pick.
@@ -6422,7 +6421,6 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 
 	rq->core->core_pick_seq = rq->core->core_task_seq;
 	next = rq->core_pick;
-	rq->core_sched_seq = rq->core->core_pick_seq;
 
 	/* Something should have been selected for current CPU */
 	WARN_ON_ONCE(!next);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf8..d1441bf6b4ef 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1371,7 +1371,6 @@ struct rq {
 	struct task_struct	*core_pick;
 	struct sched_dl_entity	*core_dl_server;
 	unsigned int		core_enabled;
-	unsigned int		core_sched_seq;
 	struct rb_root		core_tree;
 
 	/* shared state -- careful with sched_core_cpu_deactivate() */

base-commit: 587858367581b9c55c3690f4e63382ad622719d4
-- 
2.55.0

