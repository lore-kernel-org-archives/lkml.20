Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648494;
	b=EuwJzS9uXLt1dbq+z1wQOsbQqrdzfNtPLW4lcKvDwHumwXZ+/wMmbyeDkCFfzIR7lze2
	 JLro9IK+yvVcymdkoI0FoEP7hnvSQcCzAALHEhQeViymDF3L9HhnmuWQkOaFlKUQbHIuf
	 3M0ZmKkjMZUYmB4RljaeGWejVGOUVmKZ+q06qf6fUoUlzmbJCzcIYDNo5cQWf6ZIsFqYi
	 xCmvlxsUv8SOXDEMJai5iOEQkx6lFPNiof8C1mYGLyAT/s6zeTkcnYNdft7sQFL9JCpmH
	 ZlOd+g2ZiLpWsz8gPEkDjSwv/1X/zgN2gclmb9KPFPJPXS3XICQtvbF+56/zgmf4ciA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648494;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=PgCeAXyiqVwJaEm+FM10gP2051t7wM0DAOC7XHreHNc=;
	b=yPAtqMpVX6AhxiJWCpZKbvwe6KP+Ywjpn4dXGlUDMzQpyPsZgSz4r36DhEAkgdtKz8Er
	 CrnRsQQX7t0pSYpxKEXfdBtea4OvSbfqRrf4j+OMoiTBqaVd3QLy+GqJDtRXB2YxYTH3Z
	 74CyCBHXWkhiRaPKjOvXVUNigOfVcuJnin4UYew39Yq58OIjzTO817IWFZQ9DImlsSrX2
	 m4etQjvN3JhVHthQVnSpOG4E7dqzADqKXPEfxEYZS0KK4tQU2sq+xgOaI8L9rZvmmOUBB
	 Jjb9DIojC3PDkO0r785VV02p3yozv49O/tTZUTfBCEvF7tw9DWI0xIXEhhe4yRSiVDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Nbr6nu3k;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F49606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F49606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Nbr6nu3k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Pg
	CeAXyiqVwJaEm+FM10gP2051t7wM0DAOC7XHreHNc=; b=Nbr6nu3kevCaBk+R1F
	m9ShRVq9//DSscl4ErJXRxzkBghNnvmGkAm01hgGIFle9sfBXyQdVtnMQoV6kXJk
	8vM4jlm9H4VNH5tfsBHsVgQkPIqfeoC0po2NIDS5ttew5C+4/twa0sI9c6aAzgsw
	2LD/LstPGVtBWhCF9ayTd2nwg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wB3ZTdRKfhqm+6DHg--.7620S2;
	Sat, 14 Nov 2026 17:26:42 +0800 (CST)
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
	kayracizmeci@gmail.com,
	linux-kernel@vger.kernel.org,
	albin_yang@163.com,
	albinwyang@tencent.com
Subject: [PATCH v2] sched/stats: Fix run_delay over-count for tasks parked on the runqueue while blocked
Date: Sat, 14 Nov 2026 17:26:37 +0800
Message-ID: <20261114092637.3206631-1-albin_yang@163.com>
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
X-CM-TRANSID:_____wB3ZTdRKfhqm+6DHg--.7620S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGF43KrykWr15Ar4DCF45Wrg_yoWruF1Up3
	yvg3y3Ka18Kr40ga9rAr4UGFy3uwnrGw47KFnay34rGr45J3W0vFn7tFW3XFsYkr9akFWa
	yFs0g3y2ya1jyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pieyIUUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbCzRM32Wr4KVMwBAAA3s

From: Wei Yang <albinwyang@tencent.com>

A task parked on the runqueue while blocked -- a proxy-exec donor migrated
to its mutex owner's CPU, or a DELAY_DEQUEUE sleeper migrated across CPUs --
is re-attached with activate_task(rq, p, ENQUEUE_NOCLOCK), i.e. without
ENQUEUE_RESTORE. That arms sched_info.last_queued although the task is not
waiting for a CPU, and sched_info_dequeue() charges the parked time as
run-queue wait when proxy_needs_return() dequeues the donor (TASK_WAKING)
on wakeup.

Use p->is_blocked as the primary indicator: sched_info_dequeue() drops
last_queued without charging while blocked; sched_info_enqueue() refreshes
it on every enqueue while blocked, so the stamp ends up at the real wakeup;
ttwu_runnable() adds an explicit sched_info_enqueue() call under the
existing !task_on_cpu() guard, for wakeups that have no enqueue of their
own. Delayed sleepers also have is_blocked set, so both cases are covered.

The p == current early return in try_to_wake_up() now documents why it
needs no sched_info_enqueue() call.

Both over-counts disappear with this patch, and run_delay still grows
normally for a runnable task contending for the CPU, so the counter is
alive rather than switched off.

Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Suggested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Signed-off-by: Wei Yang <albinwyang@tencent.com>
---

v2: switch from the v1 !task_is_blocked() gate to the is_blocked based
approach proposed by Prateek Nayak. Subject widened: v1 only mentioned
proxy-migrated donors, while the same gating fixes both cases.

Measured with two CPUs used (CPU0/CPU1); run_delay is field 2 of
/proc/<tid>/schedstat:

  proxy exec, donor migrated to the owner's CPU (~170 ms block)
    unpatched       167.07 - 167.09 ms   5/5   migrated
    patched           0.00 ms           20/20  migrated
    same-cpu control  0.00 ms            0/5   not migrated

  DELAY_DEQUEUE, sleeper migrated across CPUs (~150 ms sleep)
    unpatched       147.94 - 147.99 ms   5/20
    patched           0.00 ms            0/100

The DELAY_DEQUEUE reproducer self-checks (must reproduce unpatched) and
shows ~40 ms of run_delay growth per round throughout.

v1: https://lore.kernel.org/all/20261025130740.3324391-1-albin_yang@163.com/
Full test results and the discussion of the split:
https://lore.kernel.org/all/20261101143101.353033-1-albin_yang@163.com/

p->is_blocked was added by 4c2a20413d7f ("sched: Add is_blocked task flag")
and is only available from v7.2-rc1. The DELAY_DEQUEUE over-count goes back
to v6.12 (152e11f6df29) and still needs the sched_delayed based variant on
older stable trees; that is a separate, independent fix. A second Fixes:
tag would make the stable backport machinery try this on v6.12.y, where
is_blocked does not exist. Hence only one Fixes: tag above.
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1a088d4576f5..bb7914b713b1 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3962,6 +3962,8 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
 		 * it should preempt the task that is current now.
 		 */
 		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
+		/* Start accounting wait time. */
+		sched_info_enqueue(rq, p);
 	}
 	ttwu_do_wakeup(p);
 	return 1;
@@ -4357,6 +4359,11 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 		if (!ttwu_state_match(p, state, &success))
 			goto out;
 
+		/*
+		 * No sched_info_enqueue() here: current is running, not
+		 * waiting for a CPU. If preempted, sched_info_switch() ->
+		 * sched_info_depart() arms the wait clock instead.
+		 */
 		trace_sched_waking(p);
 		ttwu_do_wakeup(p);
 		goto out;
diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index ebe0a7765f98..84d1fb208740 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -240,6 +240,9 @@ static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
 {
 	unsigned long long delta = 0;
 
+	if (t->is_blocked)
+		t->sched_info.last_queued = 0;
+
 	if (!t->sched_info.last_queued)
 		return;
 
@@ -290,7 +293,7 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
  */
 static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
 {
-	if (!t->sched_info.last_queued)
+	if (!t->sched_info.last_queued || t->is_blocked)
 		t->sched_info.last_queued = rq_clock(rq);
 }
 
-- 
2.43.7

