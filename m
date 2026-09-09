Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F3156B86D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960958; cv=none; b=H9UdOYRUomvIRaWkIXjllwGg+2Z6kO7/I4z8ExduYMfA2iFJ8PgWrsAwhsWxjvgIaKRKUzvNFCA5jQHBBAjMTLuMk5tvgw8jk/uRXQFDlXEg2UX4dnODAQDoIj5yWD5sMQDyfV75KRCO5gIiLScHYgXjQ/FEfHe9szHEtW82UBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960958; c=relaxed/simple;
	bh=S12/r65QfioQ9d5p52gF8FIWDFw21osWvG0ohyLUnuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAn9F7yCRmL2ujMDVErYrXFWBBZo4103Fl4mgXS5oTUHk/xkWUpV55AZnXdfZ+WbXlcjRP4G8YKVfdcqPOayKe2UD3yx+5FdcyVUuTwzJCV8lv6YlgmnTyndnYw+nowPpiYik5qLsWtDbT1rQZF13sMj/ZGVM53qgQc61RTey5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gf5m6dG8; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gf5m6dG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2Z
	VUjImDEntEikN406jEi124vb67kt2C9gOZ0qEIiNg=; b=gf5m6dG8BXTWfT8LaK
	0NOpaq/1aGwkx6N3HwT4gbjVQdq4UbfHYfhAeK8f/mEj3Ajq/cr6LS3IlhlnfTCT
	9NX/zLqJiq8PoWMgSg0hEeeKrkkUbbJq+tlOotAlXlloMFvfw9s8scPU1zZy4DZF
	J8ZczahIwmZtl+qv6H219KQOM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3H01dYKFqaq2dBg--.62908S2;
	Wed, 09 Sep 2026 21:34:22 +0800 (CST)
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
	linux-kernel@vger.kernel.org,
	albinwyang@tencent.com
Subject: [PATCH] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Wed,  9 Sep 2026 21:33:45 +0800
Message-ID: <20260909133345.1572954-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H01dYKFqaq2dBg--.62908S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw45KF1xur1rKw1DWFW5Awb_yoW8CF13pr
	Z8W3yUJa1DKw4rKr9Fvr4kWry3Gwn7G3y3tFn7t348Gry5GF1Yqryjq3W3Xr4FvrWvvFZI
	vF4jg39IvF4DKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0hFxUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbC7x4y1GqhYF7LIQAA3I

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

Fix by not re-arming last_queued for a sched_delayed task in
sched_info_enqueue(). The wakeup path clears sched_delayed before reaching
sched_info_enqueue(), so it still re-arms at the real wakeup time. Plain
runnable tasks and load-balance migrations are unaffected (sched_delayed
tasks are excluded from active load balancing).

Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Signed-off-by: Wei Yang <albinwyang@tencent.com>
---
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

