Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A9135C19B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789878759; cv=none; b=PqF/EG2/tHkHSPix2byqpFUW8aaTWrfXA5EqEYVPczLD64AWaPT8NTCHWtF9wTJKCVyQNApsNOYMN/iMGbrAIJt2PTF6yj+1Nv7Hv9xELDtvfcW/c10CK5LQdt15xjYsQfe6BcGF8WCznLAOpkm6WFxKhoA4I8DiKIrpULvJbMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789878759; c=relaxed/simple;
	bh=71PdsR80XM5px7rYyhqP6gDRRH6XfmmjEXfGrVMG6LI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uev+inTBzLIHf+knBIJqA0dVGkY9wumcwUlTNW/PDcqXyhz1Jqcs8YqBlQwcj2+vBezIVydwotOgRz1xAS7vFx5AnNmoPI1DCPc4xOzpJ0ynhTYUUF0naADqFd2nvzZz0rDI1/XPl/H7Lur50THDTnu05/sJANMlU4VWKR7pVIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=m6aLn9Xm; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="m6aLn9Xm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=cX
	sM1xUTdon1URsuEdOTCMdfWhcDpQJvoeUbDfETOxE=; b=m6aLn9XmsQZXB9wCqn
	UiZxrmSCZuJm7zk7rUOywzpEIVJPqKfME06zdnMleuXxgrXWWVJbWH+RiCfsYXKl
	DNewCWesBfqUI2JaKMUJBDnIfGGWsFAn7/90PqSrjq4CnTiLm1/qOps+00jeto5T
	7DXFav9kJ7j6UKvYcerLISfCw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3hmCYYa9qzi_fBg--.59981S2;
	Sun, 20 Sep 2026 12:31:21 +0800 (CST)
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
Subject: [PATCH v2] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Sun, 20 Sep 2026 12:31:16 +0800
Message-ID: <20260920043116.1298017-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3hmCYYa9qzi_fBg--.59981S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFWkZF1DtrW5GF4xXFy8AFb_yoW5AF4rp3
	95Ww1DJa18Kr1rJrnFvr4UWr13uwnrG3y3tFn2yryrKrZ5GF1Yvw42va13XFsYyr9YyFZI
	va4jg39IyFWqyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziWE_tUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbC8BkFp2qvYZnhWAAA3P

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
---
v1 -> v2:
  - Correct the claim that load-balance migrations are unaffected:
    can_migrate_task() only skips a delayed task when migration_type !=
    migrate_load, so active load balance (whose lb_env leaves
    migration_type at 0 == migrate_load) can migrate a sched_delayed task,
    as can regular load balance via the migrate_load branches of
    calculate_imbalance(). The fix covers those paths too; only the
    description was wrong. Pointed out by Kayra Cizmeci.
  - Add Chen Yu's Reviewed-by.

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

