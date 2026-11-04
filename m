Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758821;
	b=2e9/HGHsE3nvBwIpCyQ9kO7F+4jDCPA/OEEYFiDoagfmxUszT0rzKVPo3EFyJMCENtN0
	 uAqcG7JTkM4LMXnRedB8N0h+oBGkqPdbAiL3xKPFkbMWdw4OTAZm0BvK7TUNk4ygfPdap
	 UZY8x3kD7JL65ztMziErDAqdgjSxCTd8yqage/5y5H1Ze1vUnV+94cBkATgXIji2xhqmF
	 nxrAuzn8n1jEa95M6tdT1nhMrnsL3DaAZV5X3qU6d1eoImOObiN3p0Nb0cU46nNO7EfXg
	 lQbUMDwQtj+8S8xJyVrrlgI40lz8E5ctXOMHjK3JMPLCgzs7JOCHPSJ5ImVPX/rmkOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758821;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=jJ5UTsqtLuXDBEbnL6J0rW1m5+pjr7YLjzdDpL+Y9n8=;
	b=I7b1UMMqsMTVF9n4lqn3U5TViO/0mdo8Bj5uoezJttguSYYUfVuUjyusKtrPDkZ0P0hA
	 NcRI5HlooLtBB4S72OjbS/Aos1EMcMZgGjq3zz0Tq/nISUQzmhnAgIkw323qlpIsYS3Cl
	 k2Mm3V/tBDvDTqZFck26zvjzEbNh3SfRdjbZAY+74zOtArRD+z8JTrECTuRDhHdl+XdxY
	 gasR+IGuOTgr4OAkUuD2PEKb2FAfTPjsa7SUZHqBk0mc75lhdKZG05Oq5yFmDoGclIXJr
	 b/uPQr8r/E4CqgyMCZBxN3zBcsiF5YKP52GnnM9+hzyuYuVc6mbPc+QnLSpcMs74v5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d4OAfID6;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78514606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78514606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d4OAfID6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793758819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jJ5UTsqtLuXDBEbnL6J0rW1m5+pjr7YLjzdDpL+Y9n8=;
	b=d4OAfID64DQooFFGRS363eJodYlOGv8lUZz4t+NtyHwNByGPTda6sYsOxcwPcp5l0O1S4x
	4OhHCH9nW6eQ26bTstvUxzDyh/dxCrOZzmj6/NFwMt7tx0h9g8k9Me7udZppSFKwrZSsfP
	ov242Es+8SSOoAlYTuC07+MpdVBq3HY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-527-GfslbJhkM8O4u-O1fdKC8Q-1; Tue,
 03 Nov 2026 21:20:15 -0500
X-MC-Unique: GfslbJhkM8O4u-O1fdKC8Q-1
X-Mimecast-MFC-AGG-ID: GfslbJhkM8O4u-O1fdKC8Q_1793758814
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88A44195607D;
	Wed,  4 Nov 2026 02:20:13 +0000 (UTC)
Received: from snishika-thinkpadp16vgen1.tokyo.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E335918004D2;
	Wed,  4 Nov 2026 02:20:07 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Josh Don <joshdon@google.com>,
	linux-kernel@vger.kernel.org,
	syzbot+681e729b2cf0d4860042@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Seiji Nishikawa <snishika@redhat.com>
Subject: [PATCH RESEND] sched/core: Do not touch SMT siblings that have not joined the core yet
Date: Wed,  4 Nov 2026 11:20:04 +0900
Message-ID: <20261104022004.3810619-1-snishika@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

When a CPU comes online, it is added to cpu_smt_mask() of its siblings
before sched_core_cpu_starting() sets its rq->core to the core leader.
For example, on x86, ap_starting() calls set_cpu_sibling_map() first,
and calls notify_cpu_starting() after that. This order is intended.

Before sched_core_cpu_starting() runs, rq->core of the new CPU still
points to its own rq. But rq->core_enabled of the new CPU is already
set. __sched_core_flip() sets it for all possible CPUs, also for
offline CPUs, and CPU offline does not clear it. So __rq_lockp() of the
new CPU returns its own rq->__lock. It does not return the core wide
lock.

If a sibling CPU runs pick_next_task() for SCHED_CORE at this time, it
checks all CPUs in cpu_smt_mask(). It calls update_rq_clock() and
pick_task() for the rq of the new CPU. But it holds only its own core
lock, not the lock of the new CPU. Then lockdep shows this warning in
update_rq_clock().

  debug_locks && !(lock_is_held(&(__rq_lockp(rq))->dep_map) != 0)
  WARNING: kernel/sched/sched.h:1666 at update_rq_clock+0x40a/0xd20 kernel/sched/core.c:875, CPU#0: syz-executor251/5712
  Call Trace:
   <TASK>
   pick_next_task kernel/sched/core.c:6375 [inline]
   __schedule+0x1c69/0x6920 kernel/sched/core.c:7199
   preempt_schedule_irq+0x4e/0x90 kernel/sched/core.c:7606

The next loops in pick_next_task() also change rq_i->core_pick of this
rq, and can call resched_curr() for it, without its lock.
resched_curr() has the same lockdep_assert_rq_held() check.
__sched_core_account_forceidle() also checks all CPUs in the same mask.

CPU offline does not have this problem. remove_siblinginfo() and
sched_core_cpu_dying() both run in take_cpu_down() under stop_machine.
So no sibling CPU can be in pick_next_task() at that time.

Fix this. In these loops, skip a sibling CPU if its rq->core is
different from our rq->core. At run time, rq->core of a CPU is changed
by sched_core_cpu_starting(), sched_core_cpu_deactivate() and
sched_core_cpu_dying(). The first two hold sched_core_lock(), and
sched_core_lock() takes the rq locks of all CPUs in the SMT mask. The
last one runs under stop_machine, as written above. So while we hold
our core lock, the result of this check does not change. A CPU that is
not in the core yet will pick its own tasks. The comment in the
reschedule loop of pick_next_task() already expects this case.

I tested this with the syzbot C reproducer in QEMU. The two vCPUs were
SMT siblings (-smp 2,sockets=1,cores=1,threads=2). Without this patch,
the warning came after about 100 seconds. Just before the warning, a
debug print showed that the loop on CPU 0 saw CPU 1 with rq->core
pointing to CPU 1 itself, and cpu_online() was false for CPU 1. With
this patch, the same state still happened, but there was no warning
in more than 2 hours.

Fixes: 3c474b3239f1 ("sched: Fix Core-wide rq->lock for uninitialized CPUs")
Reported-by: syzbot+681e729b2cf0d4860042@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=681e729b2cf0d4860042
Cc: stable@vger.kernel.org
Signed-off-by: Seiji Nishikawa <snishika@redhat.com>
---
Resend of https://lore.kernel.org/all/20261006061253.1199941-1-snishika@redhat.com/
No changes, only rebased on v7.4-rc1.

 kernel/sched/core.c       |  7 +++++++
 kernel/sched/core_sched.c |  3 +++
 kernel/sched/sched.h      | 11 +++++++++++
 3 files changed, 21 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8c..7d9f0989eaad 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6414,6 +6414,8 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	max = NULL;
 	for_each_cpu_wrap(i, smt_mask, cpu) {
 		rq_i = cpu_rq(i);
+		if (!sched_core_sibling(rq, rq_i))
+			continue;
 
 		/*
 		 * Current cpu always has its clock updated on entrance to
@@ -6447,6 +6449,9 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	 */
 	for_each_cpu(i, smt_mask) {
 		rq_i = cpu_rq(i);
+		if (!sched_core_sibling(rq, rq_i))
+			continue;
+
 		p = rq_i->core_pick;
 
 		if (!cookie_equals(p, cookie)) {
@@ -6492,6 +6497,8 @@ pick_next_task(struct rq *rq, struct rq_flags *rf)
 	 */
 	for_each_cpu(i, smt_mask) {
 		rq_i = cpu_rq(i);
+		if (!sched_core_sibling(rq, rq_i))
+			continue;
 
 		/*
 		 * An online sibling might have gone offline before a task
diff --git a/kernel/sched/core_sched.c b/kernel/sched/core_sched.c
index 43e0bde3038e..b21eade02c23 100644
--- a/kernel/sched/core_sched.c
+++ b/kernel/sched/core_sched.c
@@ -275,6 +275,9 @@ void __sched_core_account_forceidle(struct rq *rq)
 
 	for_each_cpu(i, smt_mask) {
 		rq_i = cpu_rq(i);
+		if (!sched_core_sibling(rq, rq_i))
+			continue;
+
 		p = rq_i->core_pick ?: rq_i->curr;
 
 		if (p == rq_i->idle)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c7c5633524a..bd0eb5fe6270 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1534,6 +1534,17 @@ static inline raw_spinlock_t *__rq_lockp(struct rq *rq)
 	return &rq->__lock;
 }
 
+/*
+ * A CPU coming online is set in cpu_smt_mask() before
+ * sched_core_cpu_starting() links its rq->core to the core leader.
+ * Until then it does not share the core-wide lock, so it must not be
+ * touched as part of the core.
+ */
+static inline bool sched_core_sibling(struct rq *rq, struct rq *rq_i)
+{
+	return rq_i->core == rq->core;
+}
+
 extern bool
 cfs_prio_less(const struct task_struct *a, const struct task_struct *b, bool fi);
 
-- 
2.56.0

