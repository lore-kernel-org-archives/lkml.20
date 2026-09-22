Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2741F41A563
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065563; cv=none; b=NUDDE7Auqbpf9rM+3wPCY1rUFgwoZ4amItZgs9UPM3yZvM7gBZoSkmSnzlZLD+ZQDl03NNiTKENzTy6vnGDms2JexQgV4ZALTDn7cP9wzKHUO0hY5g1p91cmEGzE3bBCjizH9kNIvyl/e6BV0Ez4ZJ4Y5XezUdbAb0UHxQzzmzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065563; c=relaxed/simple;
	bh=PrLP3tuQCMJ/kT4PIk9b1njiI+XHANuzdvVsdZOBlPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vCPuqGKEXBGbTB3jgTjc+hfr15Sf7kMy4CtWhTaJc1LR4zU4fM5q4h8GnPCUY4sHlVBSBNxskvFOyNTj5D4JuFmpegjowta5r6ma2plKpaDTQzpd7DSC8VH45BUodRNsYBo35JWIeUqECKNVjOywvdyA7TGeaMkA+sqiQMgvqL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bkeIIKTQ; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bkeIIKTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=WF
	GPfj5F6LU6aPgGdfYzMcrrNlDa1VfYz2Wv44E936I=; b=bkeIIKTQMzRQC7Qi9z
	wBhJUN1kpBpC9wcdGVIYkH/8g0SMfs99vE8i3k2hxruqzu2gsmGl2kMhSgcp9sUp
	rMmC9KF1NIe6iRkQa0R67kUBNfzfMlrxrj+Mtj9qlvKqpEovf8jZC4tlE7Xijrk4
	793vGRi6llslLr/4lCYRCxnZ4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnf19EO7JqGPEWAw--.36542S2;
	Tue, 22 Sep 2026 16:24:37 +0800 (CST)
From: albin_yang@163.com
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
	chen.yu@linux.dev,
	kayracizmeci@gmail.com,
	mintaohuang@tencent.com,
	linux-kernel@vger.kernel.org,
	albin_yang@163.com,
	albinwyang@tencent.com,
	Chen Yu <yu.c.chen@intel.com>
Subject: [PATCH v3] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Tue, 22 Sep 2026 16:24:32 +0800
Message-ID: <20260922082432.2987855-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDnf19EO7JqGPEWAw--.36542S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFWkZF1DtrW5GF4xXFy8AFb_yoW5ZF4Up3
	ykWw1UAa18Kr1rGr1qvr4UWry3uwsrG3y3tFnFy34rKrW5KF1Yvw12va13XrsYyrWvyFW3
	ZF1jgwsIya1qyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEv388UUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbCzgUnyWqyO0UzwgAA3y

From: Wei Yang <albinwyang@tencent.com>

With DELAY_DEQUEUE, a blocked task stays on the runqueue with
se.sched_delayed set and its sched_info.last_queued is cleared, so the sleep
is not counted into run_delay.

When such a delayed (sleeping) task is migrated across CPUs via the plain
migration paths (move_queued_task / move_queued_task_locked, the latter used
by __migrate_swap_task), activate_task(dst, 0) calls enqueue_task() without
ENQUEUE_RESTORE, re-arming last_queued to the migration timestamp while the
task is still sleeping. The later real wakeup (ENQUEUE_DELAYED) tries to
re-arm last_queued at wakeup time but is suppressed because last_queued is
already non-zero, so sched_info_arrive() folds the whole sleep duration
between migration and wakeup into run_delay.

Load balance is affected too: the sched_delayed check in can_migrate_task()
bails out only when env->migration_type != migrate_load, so it does not
block migration when the type is migrate_load - which active load balance
always uses (its lb_env leaves migration_type at 0 == migrate_load), and
which regular load balance can also use via calculate_imbalance(). Either
way the re-attach goes through attach_task() -> activate_task(rq, p,
ENQUEUE_NOCLOCK), without ENQUEUE_RESTORE.

Fix by not re-arming last_queued for a sched_delayed task in
sched_info_enqueue(). The wakeup path clears sched_delayed before reaching
sched_info_enqueue(), so it still re-arms at the real wakeup time. Plain
runnable tasks are unaffected.

Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Reported-by: MingTao Huang <mintaohuang@tencent.com>
Signed-off-by: Wei Yang <albinwyang@tencent.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
---

Changes in v3:
- Collect Reviewed-by from Kayra Cizmeci and K Prateek Nayak.
- Collect Tested-by from K Prateek Nayak.

Changes in v2:
- Correct the load-balance description: sched_delayed tasks are not excluded
  from active load balancing. can_migrate_task()'s sched_delayed check only
  bails out when env->migration_type != migrate_load, so active load balance
  (which always uses migrate_load) still migrates them.
- Collect Reviewed-by from Chen Yu.

v2: https://lore.kernel.org/all/20260920043116.1298017-1-albin_yang@163.com/
v1: https://lore.kernel.org/all/20260909133345.1572954-1-albin_yang@163.com/

 kernel/sched/stats.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index ebe0a7765f98..dc626f99ffd9 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -290,7 +290,7 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
  */
 static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
 {
-	if (!t->sched_info.last_queued)
+	if (!t->sched_info.last_queued && !t->se.sched_delayed)
 		t->sched_info.last_queued = rq_clock(rq);
 }
 
-- 
2.43.7

