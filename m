Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955024;
	b=zGuly3tvMqdrTudV/gcJrIb2M5PikwEEYMy/7iGZ9TA5wnJwV8FQVhaP4AYv44/UACBS
	 ajIx1r4ONXjOMmiAQDo2Hx5we1jLY6EQ24iXBOd6gv9N/oEe16DoQmbXBA3ppVwcz0adb
	 OKLAbnxGXM6pjMdGmQTggfWZlr8E/vbizS8BDFfxPOQsWKm8N7z5p+J/y6ZFRo4PSIXnP
	 ZSbzf928mcP+6A8HIRbDzpfeCDzxQ/2vWp20qJJVW1Pfa/NTkB/ioBZhfTS8RFyAad4kc
	 Gwx5qIEclV8uB3+NAU0Re90LfDz7t2KU8YU3OVHGE9Vqzr9MGrWWOl5IgbRchK7BjyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955024;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3OxptjHUIAl4XUbPN1jZ9IZYLZkszGb2FWI5JIXddg0=;
	b=2A8JKV//S36fcLO0mPvnWVXJCc/WEooDruFVxUsOlXfOns64wrO78YJgzUq9EF1Kj4zE
	 4efYt44ZdesGSWDbzwd3IWfz2MmS8fgpZfqlhKYzL401bcHXRyVIx6597AOQuLtIkhJAf
	 GIdnFa6+H8cDrH9+vQX7pd3mt+2S+e0YlqVhWA9FOaW+7wFL/mwZngvgrAVZCduBnzHLP
	 g6ZyjDEA/fvCXCOiCNXGCKQ8jqoFtUjdYa7aBp5HzgzPcwUvP3cX6QAAX15ibXqTVA4IR
	 TSz4PDoRz2xtQCOpEVRj8QqhxEtZjEcEaPQz4QVFOodjbNdDOWrn5KQFsAFR0+nOrJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=WXD4wcL8;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF7606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEFF7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=WXD4wcL8
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793955018; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=3OxptjHUIAl4XUbPN1jZ9IZYLZkszGb2FWI5JIXddg0=;
	b=WXD4wcL8pU6XAMxqy8oKkdJrV0ETAhj9QtHYiZoRU8RxKrpoZmL2FTJxXTeVj5ZRQcmSVssntFEwxZ8gEgkEDXm1FsmpWHybD1HhOa7kswdJrNIekqJBvP8/6DiGI9M5c9hll2JAsz6iiZpRvHDogCueyrPTaKc/KM1sxGKaQ3Q=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=peng_wang@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XEBGkO._1793955016;
Received: from localhost(mailfrom:peng_wang@linux.alibaba.com fp:SMTPD_---0XEBGkO._1793955016 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 16:50:17 +0800
From: Peng Wang <peng_wang@linux.alibaba.com>
To: peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: mingo@redhat.com,
	mgorman@suse.de,
	linux-kernel@vger.kernel.org,
	Peng Wang <peng_wang@linux.alibaba.com>
Subject: [PATCH] sched/fair: Fix the runtime check in preempt_sync()
Date: Fri,  6 Nov 2026 16:50:00 +0800
Message-ID: <20261106085001.36135-1-peng_wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.0
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

With NEXT_BUDDY enabled, preempt_sync() only lets a WF_SYNC wakeup
force a reschedule once the current task has run long enough.  It
computes the runtime as rq_clock_task() - se->exec_start, but
wakeup_preempt_fair() has already called update_curr_fair() at that
point, which sets se->exec_start to rq_clock_task().  The result is
always 0.

Use sum_exec_runtime - prev_sum_exec_runtime instead, which is the time
the task has run since it was picked, and drop the now unused rq
argument.

Fixes: e837456fdca8 ("sched/fair: Reimplement NEXT_BUDDY to align with EEVDF goals")
Signed-off-by: Peng Wang <peng_wang@linux.alibaba.com>
---
 kernel/sched/fair.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc9822..6164cb7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10090,8 +10090,8 @@ static inline bool set_short_buddy(struct cfs_rq *cfs_rq, struct sched_entity *p
  * multiple tasks must be woken up.
  */
 static inline enum preempt_wakeup_action
-preempt_sync(struct rq *rq, int wake_flags,
-	     struct sched_entity *pse, struct sched_entity *se)
+preempt_sync(int wake_flags, struct sched_entity *pse,
+	     struct sched_entity *se)
 {
 	u64 threshold, delta;
 
@@ -10102,7 +10102,7 @@ preempt_sync(struct rq *rq, int wake_flags,
 	WARN_ON_ONCE(!(wake_flags & WF_TTWU));
 
 	threshold = sysctl_sched_migration_cost;
-	delta = rq_clock_task(rq) - se->exec_start;
+	delta = se->sum_exec_runtime - se->prev_sum_exec_runtime;
 	if ((s64)delta < 0)
 		delta = 0;
 
@@ -10226,7 +10226,7 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
 		 * waker and less likely to be cache hot.
 		 */
 		if (wake_flags & WF_SYNC)
-			preempt_action = preempt_sync(rq, wake_flags, pse, se);
+			preempt_action = preempt_sync(wake_flags, pse, se);
 	}
 
 	switch (preempt_action) {
-- 
2.47.0

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
