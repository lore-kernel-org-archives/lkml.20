Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82E34BB271
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004181; cv=none; b=tnsN4boqDH12AjV+AZAhcaAKz2BYZNxgfF4CJQ5GX5pf37kX+RgPZgV+TWiwkkoUmvcfe+LmViRyd0yD/uBTbEH44Qc6xq9YV1VS7oR0ruAGZKbYoYQfuf2YQ3qBXVUohJTvFvuowuPXim2+e8CatLqgGXAlm3wwFr0+w2hnDN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004181; c=relaxed/simple;
	bh=VmklHztae8noGlZDZPbgvZMWDFIRiHMVBZFA5OBshaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPo25P3XmY5iOKGubuL84DOi6zZ/4HqK4/SsGp03TOwGKqpamWJMAhuIwnQIlHZKnhHa4Zq+eUD7+a4AGfz98e7NSE4xrLskQ116RxGN4th5B/NOnnfQt1OPqtIboSkpVOk+ooW+tGLgjFdA4G+xkwfGsdzRyUPX6gy+JLU5b5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=il5nlsCN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="il5nlsCN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso44366785e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790004178; x=1790608978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQPNgCwsYO9IyF2ZmLp32Dch9UnZOPItESi3x5Q27kM=;
        b=il5nlsCNhGTPtxCambClYiMct4qVfyj/Un6tLRrOIRQ9HOX4ODohCTyyWyX3tb+VNU
         WOE9D3dokrbXeqxHgT8yFcX+kY1HPhfnM3o8wLJEzTX8V0fz0Fu+MUUvCuXd5sTNxGrA
         WijqYMWwdt5/o+WnNBbe1lY+By6NlQ/6gOlv3B0X9NfD1QiL3r+Tva+uAZ4sEiyZQd4h
         FlZf468FLCWjiv3AVFcadzG7F4tvNYhgpyfGpSc9XvwZ9dNNZ5s8rnbGAHzxYiTAn5K8
         BNeEv5COXAp0qIykL6s1dOAmnAgiLe4mENYRORcf1u5gp5gK4Cz+zoLqVih4uDxe8Pfk
         5p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004178; x=1790608978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQPNgCwsYO9IyF2ZmLp32Dch9UnZOPItESi3x5Q27kM=;
        b=kG6OViwiOIMxrGWt4f5tKw198ec9TcABLvQCgytN8KyPwzRH8xW1doavpFE/TCaB5n
         6FixB8LWjrbgZwidjMqQjOzWH/mHz41c0XLsp7yQNZZ5Osm9CS9PppcRPdBBEgUWhRl+
         c8WioG4DnC8FrjK7xLRpy2Xdp7Cx+07QDR4Jxx3vBalfqafoZp16HKAa5ogs2dYEjaKk
         ZmcvbkuzjeIdmsASyOmspJDvpPJ4K4fq1fVjRYPS+V6A8Lna1P4Wq2fyy0Vjf5kDJvq/
         +CNS2m65Vce196CofRkMLiGhrMFo9N/pUyvPfYXRwPnby8fjUEMQrLnEbq5JXLtmF4Lw
         OIGQ==
X-Forwarded-Encrypted: i=1; AKwUvBylBpFfDbHg5OEngjllwC9Ykpn/uAbLIiFI1R/DxbQQueTySv9Rv9+OZp8z9gxRrusoaKfST32k0GfIyPo=@vger.kernel.org
X-Gm-Message-State: AFuF++kDiWiXtFxT8dYuQsWrZAman/lr6UiIFfJkAUwvp5rKQbHYBFnw
	8GLQv76pCCuT+tB8e1dZhpWOn3ENcQlJz1HxVu/FX9zMXN9K0slFvvuEiDuoVv6Wyzg=
X-Gm-Gg: AYBFou0bIh85GB0nzZS12IVDlu5dTftLroTrldLQYIgDhakI9lqDu18T5plKt/0W/cf
	u0wUENWC9cWeYgaz5Cd5xOQ8w7WqheeHSWgZZJJleN1esfYXadbIheo4lqcAwmZ9Cagnk9PMLmL
	iZ6s/6USM4HRgCPsYZa8Hwa6SXCrLtWvK1VlJ7wuv+9Wp0gK5XpZtR8OU0wHMMhn+PClYaFXwJ1
	RFCVH0nE7IYdeomtbOZHjvpaxZrAqwBBfT07S1INerfhQi+M0vETJ6swGCkv37zMKkXi3UCEBPB
	IrK9OxovjuZZoAW/mtThKvMUgL/foK7CuouB4GKwcyw7U0P452GUWlevutlKEgFQRpWVN5nW8bF
	n7IW3P/XkMCo1fy7ij22C5JN2pvriorUJn/jHW8QSfmSGQ3HrwXhjsQ0popW3uafaZFBBmzxKMY
	/dt/mldUyHu9ZKVaSNQDtXnO4aewzvp/s2AnAAArGpVmVr9B1uPFdNQf0dLrGnTWiD7UrqJ0+Ug
	zRX9ZlzUtt73zg=
X-Received: by 2002:a05:600c:4e14:b0:49f:bd3c:bc19 with SMTP id 5b1f17b1804b1-49fc572eff5mr154822575e9.20.1790004177762;
        Mon, 21 Sep 2026 08:22:57 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:df5:e9a4:98b5:65d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bf159sm223745675e9.10.2026.09.21.08.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:22:55 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Cc: qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 6/8] sched/eevdf: Add per cpu cached min_slice
Date: Mon, 21 Sep 2026 17:22:36 +0200
Message-ID: <20260921152238.3804392-7-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921152238.3804392-1-vincent.guittot@linaro.org>
References: <20260921152238.3804392-1-vincent.guittot@linaro.org>
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
 kernel/sched/fair.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 739a3af60520..a01a88dde811 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1089,6 +1089,21 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
 RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
 		     run_node, min_vruntime, min_vruntime_update);
 
+static DEFINE_PER_CPU(u64, rq_min_slice) = INT_MAX;
+
+static u64 get_rq_min_slice(struct rq *rq)
+{
+	return READ_ONCE(per_cpu(rq_min_slice, cpu_of(rq)));
+}
+
+static void __update_rq_min_slice(struct rq *rq)
+{
+	u64 min = cfs_rq_min_slice(&rq->cfs);
+
+	if (min != get_rq_min_slice(rq))
+		WRITE_ONCE(per_cpu(rq_min_slice, cpu_of(rq)), min);
+}
+
 /*
  * Enqueue an entity into the rb-tree:
  */
@@ -8073,6 +8088,8 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 		__enqueue_entity(cfs_rq, se);
 	}
 
+	__update_rq_min_slice(rq);
+
 	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
 		dl_server_start(&rq->fair_server);
 
@@ -8195,6 +8212,8 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
 	if (se != cfs_rq->curr)
 		__dequeue_entity(cfs_rq, se);
 
+	__update_rq_min_slice(rq);
+
 	sub_nr_running(rq, 1);
 
 	/* balance early to pull high priority tasks */
-- 
2.53.0

