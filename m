Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADE844A708
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296973; cv=none; b=ZsRrM6LL7n2b3WCnJY0keAAa2bk6SCP37UJyYwdJpGzoLiEY5f6jmdISZNwHPlx1Aa/dC1ajRj71/rnmfusTivUakAYpgSidFUjIrU7UlGOhoTL4IorN3j/CyQFVQMUmSw//0ydlOy4KcdLQY8pN+DvZCAGEpc/paieGgE0CulI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296973; c=relaxed/simple;
	bh=cEHWONheEN7vIYlxfAjUrQCMBMdo4DoYV4/c1VnjzUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFJZXsZT/xNcyyNL8+7wZgU2KYbXkSnHN9GnjRZWFWjaxG/jDOnZ9KEcKZBfvYdxJayNUVPjY2f+PBMvOWhzgU9kWTIEl8VFCBgJNaoVo9EFxk8f5OYQ706ap+CKyPzIFICgFkJyc+ZCs2GpuUrGQgZNH2bXvZfo6vtuugLdojE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDa/ZZrm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDa/ZZrm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428711F000E9;
	Tue,  1 Sep 2026 21:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788296972;
	bh=Gao1hqBNWHUQTPyG0uVQNOcrDIaTaqrdEXxIfJAi6x4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QDa/ZZrmOtUdLA88xlbQFL7moj5f1w5fnPoJCJSbS0YygP2YzGV0bTu/W2o8QkO3Y
	 yfzAOjipPLhxLJu11JSnwMXqxM+oZcO4ckYC5TAyYfv5cej838WLb7PeH/cOG23Ktm
	 /6GiNIVIJMzNuJrE9YRV1Prmv+BeaGEpIr/20CmPlleegexYc7xmx3f9zJOFKrN2px
	 Zz1vX2aT1P2TXLhmwcaidaM1QzqOztaK3b+JONmLUPAL9t9FWRcOL20uswq7LOTkTx
	 ZNwkyZKmB8HLXGQ3JhRYrG4N6atFR8e0J0yYHdp39qVmJDkvkeCNpg++eTpaRRotR+
	 bGNJ1+bzHDkLw==
From: Tejun Heo <tj@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Yao Kai <yaokai34@huawei.com>,
	liuyongqiang <liuyongqiang13@huawei.com>,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 2/3] workqueue: Maintain pwq->total_in_flight
Date: Tue,  1 Sep 2026 11:09:28 -1000
Message-ID: <20260901210929.3092513-3-tj@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901210929.3092513-1-tj@kernel.org>
References: <20260901210929.3092513-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pwq_busy() scans all of pwq->nr_in_flight[] to tell whether anything is in
flight. Maintain the sum in pwq->total_in_flight, which fits in existing
padding, and test that instead.

Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/workqueue.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 9c69efcf5e2e..d19d2e59ec05 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -274,6 +274,7 @@ struct pool_workqueue {
 	int			work_color;	/* L: current color */
 	int			flush_color;	/* L: flushing color */
 	int			refcnt;		/* L: reference count */
+	int			total_in_flight; /* L: sum of nr_in_flight[] */
 	int			nr_in_flight[WORK_NR_COLORS];
 						/* L: nr of in_flight works */
 	bool			plugged;	/* L: execution suspended */
@@ -2082,6 +2083,22 @@ static void pwq_dec_nr_active(struct pool_workqueue *pwq)
 		node_activate_pending_pwq(nna, pool);
 }
 
+/**
+ * pwq_inc_nr_in_flight - increment pwq's nr_in_flight
+ * @pwq: pwq of interest
+ * @work_color: color of the work item being queued
+ *
+ * A work item or a barrier with @work_color is being queued to @pwq.
+ *
+ * CONTEXT:
+ * raw_spin_lock_irq(pool->lock).
+ */
+static void pwq_inc_nr_in_flight(struct pool_workqueue *pwq, int work_color)
+{
+	pwq->nr_in_flight[work_color]++;
+	pwq->total_in_flight++;
+}
+
 /**
  * pwq_dec_nr_in_flight - decrement pwq's nr_in_flight
  * @pwq: pwq of interest
@@ -2106,6 +2123,7 @@ static void pwq_dec_nr_in_flight(struct pool_workqueue *pwq, unsigned long work_
 		pwq_dec_nr_active(pwq);
 
 	pwq->nr_in_flight[color]--;
+	pwq->total_in_flight--;
 
 	/* is flush in progress and are we at the flushing tip? */
 	if (likely(pwq->flush_color != color))
@@ -2455,7 +2473,7 @@ static void __queue_work(int cpu, struct workqueue_struct *wq,
 	if (WARN_ON(!list_empty(&work->entry)))
 		goto out;
 
-	pwq->nr_in_flight[pwq->work_color]++;
+	pwq_inc_nr_in_flight(pwq, pwq->work_color);
 	work_flags = work_color_to_flags(pwq->work_color);
 
 	/*
@@ -4031,7 +4049,7 @@ static void insert_wq_barrier(struct pool_workqueue *pwq,
 		__set_bit(WORK_STRUCT_LINKED_BIT, bits);
 	}
 
-	pwq->nr_in_flight[work_color]++;
+	pwq_inc_nr_in_flight(pwq, work_color);
 	work_flags |= work_color_to_flags(work_color);
 
 	insert_work(pwq, &barr->work, head, work_flags);
@@ -6098,11 +6116,8 @@ EXPORT_SYMBOL_GPL(alloc_workqueue_lockdep_map);
 
 static bool pwq_busy(struct pool_workqueue *pwq)
 {
-	int i;
-
-	for (i = 0; i < WORK_NR_COLORS; i++)
-		if (pwq->nr_in_flight[i])
-			return true;
+	if (pwq->total_in_flight)
+		return true;
 
 	if ((pwq != rcu_access_pointer(pwq->wq->dfl_pwq)) && (pwq->refcnt > 1))
 		return true;
-- 
2.55.0

