Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792816178;
	b=kUjtfeu4ul+NaCSEXF+zvdA7Ms/uBy5c/XB/UrI93oUXjajMVPMsYW+L8SNBO0pTvwWj
	 Z1Ve/8i7VdTjkH6KGCfD+J/ZawGJfGIuud+tR/xgcODBuo0YWpIdOGIjxeFY98eztllbu
	 /TUmMMNcgkVgmOknFaS6wBGGQ54fqgr3R6QBJ336qa7WLQ5L+twCoGHJ7oV19gt6UkToA
	 ami3CGq/zRHb/hByLB9RimvzznHe00fED5Up/DNmVD6zjEU1rPCW8h7uOAbBZlzbj74+v
	 8T255+mmocvzGavVe4lfzGikx8YkYJqt9p2tYCTsoHCuBznfrNilqyEpyZHFw4/2oOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792816178;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=ZSvwR2YJ1CP/uX9g/vwhWrs7jjPYqf6IJu5EEXhYd60=;
	b=DDHvuIOG7Psaxwp+UBiLi9VI+2AFJgTQc37IfS3jSM/qF8FVickV2rwTGKzqZ9rlwuOn
	 gP1cBoXc1Kbjya5p8GMDeX5m4AFA5zhxSUHkcQkzJrrj2UFEYS6xypbhy4JpLKhqFaGGj
	 qVwW9XE/XGrPDeO8udoHIOvE84FqjUyWUGWBmqtasVPucgyBjzx0Ncfa4WqwIAGgzoDjp
	 6MYRaoyodqzyC1fwdcypFMNNC6hef8XC7eIbmVvD+uNdQ2i/pvxjhQPLmmiuAC+/jvtbG
	 WaPrb8CrgXLah3XxDQoqhrpx9gM8f1TNJDZStQIeDu7UUnhfOGBMhGApuwEY2dr1cZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iQGBctqj;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7DB606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A7DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iQGBctqj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ZS
	vwR2YJ1CP/uX9g/vwhWrs7jjPYqf6IJu5EEXhYd60=; b=iQGBctqjxevSf56Pqs
	8MkTC6RTQ6Bhe/KrcpS/rbyFYK9EpKEkrdTKxrbcu7uiR777hKGSgIdC7WnhJps/
	aUGnnQxm5c7menTEQAfAyfQNHQmVGvNTtrqVvwRx3H14yWAmx0iXRsd2rn3Qvyq8
	la9S/OxOnr3bPUHQpvfQfRWy0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBnk4vOM9xqL9z1Bg--.19254S2;
	Sat, 24 Oct 2026 12:27:59 +0800 (CST)
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
Subject: [PATCH v4] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Sat, 24 Oct 2026 12:27:52 +0800
Message-ID: <20261024042753.2276779-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgBnk4vOM9xqL9z1Bg--.19254S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFWkZF1DtrW5GF4xXFy8AFb_yoW5tw4kp3
	95W3yUAa1kKr4rGrnrZr4UWryagwsrG3yaqF1kt348GrW5JF1Yqrn2qa13XFsYyrZ2yFZ3
	ZF1jganIya1qyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziWE_tUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbC8BHSdWrcM9GwRQAA3n

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

Changes in v4:
- No code change; resending after the proxy exec discussion to resurface the
  patch.
- Proxy exec has the same re-arm problem, but it is handled separately:
  t->is_blocked cannot gate it (in ttwu_runnable() the real wakeup enqueue
  sits inside the if (p->is_blocked) branch, while is_blocked is cleared
  afterwards in ttwu_do_wakeup(), so !is_blocked would suppress the very
  re-arm this patch relies on), and task_is_blocked() cannot replace
  se.sched_delayed since a delayed sleeper has no blocked_on. Coupling them
  would also prevent backporting to v6.12.y..v6.16.y, where the bug exists
  (DELAY_DEQUEUE, v6.12) but proxy exec does not (v6.17).

v3: https://lore.kernel.org/all/20260922082432.2987855-1-albin_yang@163.com/
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

