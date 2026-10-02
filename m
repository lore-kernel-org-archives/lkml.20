Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86624E433F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955911; cv=none; b=WtoF4b9EtIghv6cFvMrS2QwUQKHqyVSF2KhzEKlC8gnmN8hyvwFpnAWPRvy01uzE7UO4hnSDuU/gqEwiqw4SqSW82l/yTxb9r7MDO4c8bAaN6vkLCWQ3tXzM148HAxk7smPJ2mMELDRcNL5AvL23XAfE4vq7/fuAsi7F1O+fTz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955911; c=relaxed/simple;
	bh=Jf5E32GF85o6HQAbOOcsttI4ZjzXaQd9Z4H5WyGTqyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KebZlB88RIbf2h2pmWtXc10MclSmua4CEJQtZEm7VLm9PQyvjDYHOrvyagmuCKnasLHEA0uPrfwe8hF6QnJZ1gumejJU71NPecnJYuYz8g3K6JuOTLJNfoRevPxoOYa5SF1RPOw9fXbjyKCTqWINVF9IMa0rQau4n+cmlykplH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CW1HfXKO; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CW1HfXKO"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso423725e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790955906; x=1791560706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2kuJVAAelDyNc/5dJ9IAgD/T6ohQyK6/p84njFW19Y=;
        b=CW1HfXKOfuGyxZLPfqJUcAQ/fNw8syggChfziVe9qSIidb9MYnWC1TjI+81tU+cXv5
         B1uc3dZLW0DDocwIdIZk9y8t0O2FwM6YIEk4/XRJXZsVwJeaYpDlJH6WN36xJm/9tZX6
         hF59EFb0/1ZldpJqlFC9jfWMA+Qe/68r7dzOSqruPV6m1vYyFBR69DEM5Q0Jb1eAlS4o
         nWexo/PZDeVO4ukpxxm5BtGbPPW+7QYQoFaaTUm0C4nfMbWs6Xnj077Qp0QL7SnysP8y
         xe/OOYylQSmdq4MNnYpTcBsT9TOag22pe/wJNz6HnQdvVuykKd3NOboRufGczzW+oNQN
         tk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955906; x=1791560706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2kuJVAAelDyNc/5dJ9IAgD/T6ohQyK6/p84njFW19Y=;
        b=grl6L01hNEnz340RACjB1ob7ojm7Us21Geu+2+oEWXzeLBsqKrEqqD8EWk/qrmb2Ff
         78RWFIiD9XPAwt1/vcSkQmLWPvMdoawsHm0GeGisGYzXoz6LdC7LQ97EL2v1oQpJj7yZ
         a00/1+oWiMLDnAmww7dHjhuQZ90D/flv0pW81TkZgD5JtfU4VzoPJn2UEC7j9uuAu1UJ
         QSCyo5VBrY7qoRlYT6UbySP7kCaIq0jarluDWAoB96c4eHNVJa5FA5RmB/S4Inb5v76B
         BTtxNNWTYrlfDQRNCvjz38QuHHlo/T2vjuisJ9I36VnGWmVfrPh88qbcyuL2wZAoFuvp
         Ljjg==
X-Forwarded-Encrypted: i=1; AKwUvBwPQX4l2d6lKTNFCQ83UgtzMu5Txs/xoQSZiDmh+wDtwmRSOCe4uXjWMmrIPoHxvfJkr8JQRsxkm/ha/5M=@vger.kernel.org
X-Gm-Message-State: AFuF++nU/eEYc8hQDuMlgN1CZuU4B5sohCYlFeHsweC1f9XbMg/T2csG
	Ih+70kpPUFabjrQT5UlbwDVtHtV2HwIdZPvmdKwTJhwarxfGdv+8o6bo15h1ZLjrYGg=
X-Gm-Gg: AYBFou2smCXeDH9mmg7Kw+nVyqp9NltSbu78+n22eEysh8SCso8RZAd2e9NUM3zS1TC
	ZY60mXxa545f5nky4Wig173Dle3b0ibtXbrjPdzXVtpvpyz234U7251Kn1UpMRePTMYv95Ei26/
	Xb1hbzUMzpV+Tk5vvqaFaiQtCNI/jziiO25zv/+j9Fs05NJExRfY46pudoex/P6BQm5RnzcnRCg
	gmSItKDhyQrQV6rnN/OLUMc8334/+7OiXpNGXXo2MZPIzEKYnvta96x2knuY2kDNhA9dgtwV/Du
	lUQp+cZ5aMYg83O/suLnUuFJJ+ngyJoXuMRjmMdqPeauXu4S2UIsreClv6bZ5S2XeGrSQJ0b2sH
	N7OVnvN+Pu0gO7ulhOI/2oZw5OrdstvMff4TWc312ZRocETcq0/XXC6ZKwrWeLOXJ9+ycTs/vMZ
	3sDt5xMQxmK/jEd0pcgosPhgSsu7KZfo4zVe8rtr32/Y+NPuacZHgMM8bdW1I+/O4iHkw4JoNIt
	oNx/qLcObhoXabB
X-Received: by 2002:a05:600c:a010:b0:4a0:251f:a726 with SMTP id 5b1f17b1804b1-4a02759badbmr51939065e9.24.1790955906410;
        Fri, 02 Oct 2026 08:45:06 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:718b:4747:291c:e5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm101958045e9.6.2026.10.02.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:45:05 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	lukasz.luba@arm.com,
	rafael@kernel.org,
	linux-pm@vger.kernel.org,
	tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	sched-ext@lists.linux.dev
Cc: qyousef@layalina.io,
	christian.loehle@arm.com,
	pierre.gondois@arm.com,
	sshegde@linux.ibm.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 03/18 v2] sched/eevdf: Add per cpu cached min_slice
Date: Fri,  2 Oct 2026 17:44:00 +0200
Message-ID: <20261002154415.2270586-4-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-1-vincent.guittot@linaro.org>
References: <20261002154415.2270586-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to use min_slice during cpu selection, update a cached value when
needed after en/dequeing a new task. This cached value includes current
task.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/core.c  |  1 +
 kernel/sched/fair.c  | 20 ++++++++++++++++++++
 kernel/sched/sched.h |  1 +
 3 files changed, 22 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ee9b443f760d..f38cf5a37a8a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8902,6 +8902,7 @@ void __init sched_init(void)
 		rq->sd = NULL;
 		rq->rd = NULL;
 		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
+		rq->min_slice = ULONG_MAX;
 		rq->balance_callback = &balance_push_callback;
 		rq->active_balance = 0;
 		rq->next_balance = jiffies;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4c8f12fc8869..ad72b8536d6c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1116,6 +1116,22 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
 RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
 		     run_node, min_vruntime, min_vruntime_update);
 
+/*
+ * Entity's slice is in the range [100us:100ms].
+ */
+static unsigned long get_rq_min_slice(struct rq *rq)
+{
+	return READ_ONCE(rq->min_slice);
+}
+
+static void __update_rq_min_slice(struct rq *rq)
+{
+	unsigned long min = cfs_rq_min_slice(&rq->cfs);
+
+	if (min != get_rq_min_slice(rq))
+		WRITE_ONCE(rq->min_slice, min);
+}
+
 /*
  * Enqueue an entity into the rb-tree:
  */
@@ -8089,6 +8105,8 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
 	__enqueue_entity(cfs_rq, se);
 
+	__update_rq_min_slice(rq);
+
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
 		dl_server_start(&rq->fair_server);
 
@@ -8214,6 +8232,8 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 	if (se != cfs_rq->curr)
 		__dequeue_entity(cfs_rq, se);
 
+	__update_rq_min_slice(rq);
+
 	sub_nr_running(rq, 1);
 
 	/* balance early to pull high priority tasks */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 69a2a749e188..e025d2a6c302 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1173,6 +1173,7 @@ struct rq {
 #endif
 	unsigned int		ttwu_pending;
 	unsigned long		cpu_capacity;
+	unsigned long		min_slice;
 #ifdef CONFIG_SCHED_PROXY_EXEC
 	struct task_struct __rcu	*donor;  /* Scheduling context */
 	struct task_struct __rcu	*curr;   /* Execution context */
-- 
2.53.0

