Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A14A6CC2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052971; cv=none; b=O3673o3PsIvm72IAhSH1FFHLDbABSzE+ZEPlNLwb/8oFYmC2FAcKCvc5GjMZM0fC4/l1yFZ0vnB9wL7ohHQMIP22Us2VvW3TXS4jgZfA6QPrO+Gwc3W8arUXSuFfmiC9FLdqS1Y8CcIjK1/tipwO8cw4uUX+29lbv/qgNwVjR3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052971; c=relaxed/simple;
	bh=78MRHVQSJvQeyZOflV2ZvbVXvb/8wXyrgbfnuHU+8Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rgXXuzg/0+31eLacaWLy1DiIJkY9g6j5ZEaCFf2NHb4iReElR+eWtx19AosWLRK8dMCQ0Q3g1hhkFxCvSyWfyPGV3bDVH2dJPcrvC+hLQuHgBFPbA2SaBcKIIyX4Xp5CQQuf21FqTZDLxFLHA4MbGDjPXldrCQNkxg4JRuBbbXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pof+gJ+R; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pof+gJ+R"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48affdf66f8so884077f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792052968; x=1792657768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQ2xB5qhLyr/e9h940UfG+hGl4BSZKa2pc+DJvl1obs=;
        b=pof+gJ+R3+BEcHLsE7nMVtHJS5jkHduuHPpuRO7SlQSiponsFwfTbMarxMAnJmdszV
         Cs/ZfcwO9d4n3VBaDLzG8eRq5ip2PHp1TMOVfq7rM7Bch7KVvqLUSJHMgKg1g3g/gNge
         /ctLHAnllCVlqvAjdMS+1dwwHOTDt1GFdULlIJDMgd2kW4O4qoduO5lrElE4Zm9pqV42
         zjNcRbdWJZzH/A4k7DKIQBp9tAL/VS2YuT6E8BGJsOGnlkauQ32Wd/hl+4viBs1I/zDU
         TQn/K77zuHWKFfNbgEhbcNqsbi+2FOlLLtyvOw/P+QdzTZ4d+qMyovR3q/ZkG+JgasT7
         UT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052968; x=1792657768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQ2xB5qhLyr/e9h940UfG+hGl4BSZKa2pc+DJvl1obs=;
        b=ZKUTZ0h3NV+AfiBB1Ohmitktt1vsnhx+l7/nhPl+cD1lQ4QjB0PY8OUs5ybM0DMVuw
         27WdVQa2l1zVijJ4Q3yLaw4YzcvtuMAJZjUYb3N2IoELVGCGx1mexvlQwgRTjP8T5/n8
         C4BIDzvlbIl0y8OWLkUt8VzUwiSLMT6Sy1Bc8YlL+HaSdXGHaYnt+pr7BsP37KUxRwC9
         rFQyF4bB2bnDyRVHsToihAFfgEMmKwXmPg709+MYKzifkD5DO+FvxbkaxjkzJPAyYl9g
         1QSiaEXKAaP0hVH+xPsSRcGWfvkVUIkcTnCkAa1WrkPIOJ/lSx7v6EDr6s00ccKc80fX
         b6vw==
X-Forwarded-Encrypted: i=1; AKwUvBy/0v4jvR7yK0W6aUPSCGKia+zhCd3cDBLDc+SbbNrN0zDL/Hv/MGs6Knzcqh1j7BrAdVR+B67lqDgv1yY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4pr0l06mnNZORsnqdTg4fVjfGMeJRNwHgyg5RKwjeuG9DpF/5
	TL4UFNtElUNdv53gKz0eONUhPbfK6Ik45foEl9X4Y8rL6Aw+ysuyJNFY
X-Gm-Gg: AYBFou1ZccadWAFuB20HhPCyKBolyFO+HouTdzRbIPF1WcOUCsX6g9GoBAOx0n7nOwR
	pALqHeYlW1mNVr6cKG2tfQnCDB+LwEVtwdiZM36rjjuod7AemUE7Y2Yoq31f3s41DxCPW7GmXoO
	4G8lh/YDy0fi/2qpeE1tsdXx0/0WvRoUhtG2/fTJAK1ujIuDHvoG80YD/B7aW/lBxuhuEj+mJzu
	Osn66AQPDNtRPZz97P9wkX0LXaWF1BOPYiIVd+jabGrndOH3Wj8Ht0UNQgd/uV18YN5LRtkOcGR
	WavJPJniIx+tT4QwvoJYDmlH+xwy28xnQmpv09FKZ1oTv+z1o20T0l1XVqondrpXWdq0bktCbks
	pmx53p2EhiGHIKFTlgCz4x5ReATTFIfSvHl/JKZFiqiZJxpa4f64SbRd3UITBjmgYV4bf4wJ8YJ
	C+sw61u6+BN3VL81tZneKN588oXpyXlwNO7XIc2RFmf75yY4lmy/eMqpN2GNXOWEGy5L/mLgO9B
	vfaet8jzE2gh2wbrUnX4Q==
X-Received: by 2002:adf:e004:0:10b0:487:402:6cf1 with SMTP id ffacd0b85a97d-48dba78b867mr24780714f8f.1.1792052966909;
        Thu, 15 Oct 2026 01:29:26 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48defca4013sm7369761f8f.9.2026.10.15.01.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:29:26 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: christian.loehle@arm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "sched/fair: Remove dead code on enqueue_task_fair()"
Date: Thu, 15 Oct 2026 11:29:18 +0300
Message-ID: <20261015082919.4344-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 819224e506bc7c2d61ec6a58ec6e876b505abce9.

The cfs_rq->curr == se case can actually happen with CFS_BANDWIDTH,
so the removed code is needed. Document this.

Fixes: 819224e506bc ("sched/fair: Remove dead code on enqueue_task_fair()")
Reported-by: Christian Loehle <christian.loehle@arm.com>
Link: https://lore.kernel.org/lkml/fd3f9d83-cb5b-496b-b7c1-b40f31cf795e@arm.com/
Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
Killing my own beast :-).
Not tested at all BTW.

 kernel/sched/fair.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b42a0ca2a69e..436270f1786a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7991,6 +7991,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	struct sched_entity *se = &p->se;
 	struct cfs_rq *cfs_rq = &rq->cfs;
 	unsigned long weight;
+	bool curr;
 
 	if (task_is_throttled(p) && enqueue_throttled_task(p))
 		return;
@@ -8019,14 +8020,25 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (p->in_iowait)
 		cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
 
+	curr = (cfs_rq->curr == se);
+	/*
+	 * This can actually happen with CFS_BANDWIDTH, a task can be throttled
+	 * and dequeued, unthrottled from another CPU and then enqueued again
+	 * before schedule().
+	 */
+	if (curr)
+		place_entity(cfs_rq, se, flags);
 
 	if (se->on_rq && se->sched_delayed)
 		requeue_delayed_entity(cfs_rq, se);
 
 	weight = enqueue_hierarchy(p, flags);
-	reweight_eevdf(cfs_rq, se, weight, false);
-	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
-	__enqueue_entity(cfs_rq, se);
+
+	if (!curr) {
+		reweight_eevdf(cfs_rq, se, weight, false);
+		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
+		__enqueue_entity(cfs_rq, se);
+	}
 
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
 		dl_server_start(&rq->fair_server);
-- 
2.53.0

