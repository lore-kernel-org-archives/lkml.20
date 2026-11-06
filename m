Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978401;
	b=4nLEDWjSrCpqKg4CQpwJAnZh0i09sgqcb40CLfy/x1Yj2n3mhqwM+QdYDEpt35QCE+fz
	 vXPpEmBbhaHbdtQ3fYzh7ic17+WlLe3B/l43Oqyer8ppiBC21tsEszdADt52qgbJkex6N
	 /JODtI8JLS1nin5slXtIssuCmc5sC/JwtOllOIGBFOvLgDYuI8brBgzgV3GwKnCDS2uWn
	 DLDRiG1fJtxBXvEMetjqmtMx+ItZXLPb0NggHQ4LP4pnHsK2C+/uCMtZCoxc/VU2DIfBj
	 XxqnP3IZAxnZU86XIxA7JivvM+lXgZnu7zekb3pXGZ4zGCmwosIKiYg42k3r+b9BLNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UwfbJWPzhnrx0wIoFojbwEGGK1EaNf0y0KOrOChCXjU=;
	b=2EpOACZ7/fs7VTPMe2RbR4KLlxYcMYswsEwEy1BjHtlCmLeFEO66Sj9dNIkca293qk7a
	 pY92xpQI6RQ4Lbi9K09Mid51kZA3moRJaL5R7Nr+s6J9FykIBBwqOlMNMylRWSmb+q72O
	 F9DrWU4WhPKUaQHWECzdKrvwQQKRHQUEMKYinCUbNsCrlwb8dylFpBx6WpeFfSKB192ro
	 qwKM0LYQpaT3DvX25XqPX/4PUTunOQ8W8gTdTYlQu3J1+8rcCr7AqytSi0t1Qi/aiZAD8
	 vJ4U1jygFj0rmJwW7tnUyVQgFu3E3lFspwmJQWewSP8w6PNgbaqyBEOPjUQSDBoEq8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m+2yBrse;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDD2606A33F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFDD2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m+2yBrse
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e46e449e8so491822f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793978399; x=1794583199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwfbJWPzhnrx0wIoFojbwEGGK1EaNf0y0KOrOChCXjU=;
        b=m+2yBrseO5m5TLXpRDXIXWYVcsoRdptxoOkmolG4XHT7SEj7Mp39I9L9JZYYL2Of2m
         lxCcycP7+JGKx2+ZoYVWvItVoSDKs+lrRsZ5/Y1X2zSGkQn8J3oqQMd7EbcjCK2X96JM
         +Gv+HEPU964scI6YZsIMG8InYSpnprKcrLkr/MOarIFAak2A7y7HbmgrcQtMGJFLwJ3h
         hdb4id41sSMQekNAjW0nT3GF8Tv3acqLHcTKJ86EDd4NkDwdCrQZrgoS3IyxYji4c7vU
         RbIPg5Bzh/dui11dUB2uVOdevUAjAtDcPoNDjt6nKLQBq0GjxgjkljZDZYueez9AeTOb
         ByGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978399; x=1794583199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwfbJWPzhnrx0wIoFojbwEGGK1EaNf0y0KOrOChCXjU=;
        b=t6UpGTve+r2FoH2/z/CWP/WUJZ9C+YqdgaPFDGucmK+ZB3121ZVuXcxtLzvB4rKZ9A
         0HmHLI5C8Om6k72XqdO8RjuTOZPcZL1IvO3gACYYPaniC3nHzxmKOBJPG9hRTU5LYO2v
         9kiudTDbdeKHDav1sBw3vMK+ieUpxyAcyKRr4zEAZSbXwsRxEYwvYSBvE8pnd6i41+FN
         QiOiRgMhICowKCeTJ7JpTBE6AFLYG3dzskBlB69ZkRNz4IZH/D/CaoUIRDnqhVXTT7eF
         jANCd0GZu7Ra+JPCWB6aQc7n7pXH+A1+tuPjYezxqS2UPiXun8Lf5sLVFOhEePy6NKZE
         BKgQ==
X-Forwarded-Encrypted: i=1; AL+hErH4qCFCaMHWd3owPh4lcY5IGToIaQTYWKUKh1GEp28wKIULk6H0KEskXYDrz+iVm/hIGjhyRLIPvEhe0dI=@vger.kernel.org
X-Gm-Message-State: APuU4Z91lPKGtYO0mR4bY+Af1KWXvNHhQDyPhiSfYEzXT4zq4AlYVzIv
	czcSptr9HU0KAYxs/NmO7MDt4vcIZZJw+eospoKQtIQplko7++Gnxt+/cIpxOlQ20XY=
X-Gm-Gg: AYBFou2lLXWOh0QuYSpDwmwUahJCFjcNg4cwmGhq0I27keO4K8OSpCO91XItoZk/obb
	LAbwzIaHzuCS/rMnh5IlGAyVARUqm7x+A6fcvOcK75wqJ9rlFmBKNdCOcOv266snD2to0gERgKk
	+znF62WBZOfCsQBj5v82o8RgPjJnuoSw54vYKcNHKXEY0B0JS9ttMmvENvzMD4uf2EZM3nKqZLz
	runuYIR0mNgvQcq2SFkdqT8OZuj25Dt7+FbLsWib7t82/S6SyqqRspRZ2JzbNICcsBPkVTirxwF
	0qaU6nFAf4lTaI+3pXXE0V7UKd+KKLezeE1OYKFuZsRkcWm327pJvAhUwEPnrgYAUD0dWqVPlWb
	d5X7VaDtDbGmoH0l6bpj9zcWAnXUh+DX94BuVNuo8PZrF/lyEdeEzqgYolY/uu5EekXMHB71lNf
	ZS+qIOKMk6s9H8PJOGYMUToZMdDHQ7wgMzTzd6DW3GmagI8TYu+LZtKjOPmjtAd7clKLBZIQ+L1
	JlEDN3jSbOjwa9FmoMKqcLViGzqGBgzDGiZXj7bdeSoPgWMMaQAzxU6lDprUneCsllMaXPaWqXC
	vw4gUmc9kYdRPUFQdNERXusjWReKBgX0PJ+asGI1U715i0M=
X-Received: by 2002:a5d:5f04:0:b0:491:68e2:bf2f with SMTP id ffacd0b85a97d-49278174603mr5569876f8f.52.1793978399093;
        Fri, 06 Nov 2026 07:19:59 -0800 (PST)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:ed97:32bc:977a:3b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc5e23sm4477405f8f.45.2026.11.06.07.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:19:57 -0800 (PST)
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
	kayracizmeci@gmail.com,
	tim.c.chen@linux.intel.com,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 05/20 v3] sched/eevdf: Add per cpu cached min_slice
Date: Fri,  6 Nov 2026 16:19:32 +0100
Message-ID: <20261106151947.3991524-6-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106151947.3991524-1-vincent.guittot@linaro.org>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
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

In order to use min_slice during CPU selection, update a cached value when
needed after en/dequeing a new task. This cached value includes current
task.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/core.c  |  1 +
 kernel/sched/fair.c  | 28 ++++++++++++++++++++++++++++
 kernel/sched/sched.h |  1 +
 3 files changed, 30 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d7c3b43158de..031efe7d49fb 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -9012,6 +9012,7 @@ void __init sched_init(void)
 		rq->sd = NULL;
 		rq->rd = NULL;
 		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
+		rq->min_slice = ULONG_MAX;
 		rq->balance_callback = &balance_push_callback;
 		rq->active_balance = 0;
 		rq->next_balance = jiffies;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6ce4162a7703..cfc99b94d9ce 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1130,6 +1130,30 @@ RB_DECLARE_CALLBACKS(static, min_vruntime_cb,
 		     RB_AUG(slice, min_slice, min),
 		     RB_AUG(slice, max_slice, max));
 
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
+	/*
+	 * When there is no task enqueued, we check idleness instead of slice.
+	 * Reset min_slice so the rq will be selected because its idlenes and
+	 * not because of slice comparison.
+	 */
+	if (min == ULONG_MAX)
+		min = 0;
+
+	if (min != get_rq_min_slice(rq))
+		WRITE_ONCE(rq->min_slice, min);
+}
+
 /*
  * Enqueue an entity into the rb-tree:
  */
@@ -8295,6 +8319,8 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		__enqueue_entity(cfs_rq, se);
 	}
 
+	__update_rq_min_slice(rq);
+
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
 		dl_server_start(&rq->fair_server);
 
@@ -8420,6 +8446,8 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 	if (se != cfs_rq->curr)
 		__dequeue_entity(cfs_rq, se);
 
+	__update_rq_min_slice(rq);
+
 	sub_nr_running(rq, 1);
 
 	/* balance early to pull high priority tasks */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 24f9b7bd8f0f..7a95df4f14d2 100644
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

