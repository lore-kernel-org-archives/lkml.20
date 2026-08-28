Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51173DC4D3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900875; cv=none; b=oW9CQfMWdIHJqeXa647BQE9QKB4Kh9qWlgRLUTdLB6BHzj0UFxid/ww8bMNrSM/b0qxL+2pWEGoe7n4gQP9oBHsL60aQOPwFHmaIybMrnTMv+I/PFQp3rjqSCB1auVGUQUOxAecH+R2BHsiedKxT235GFJBR4q1MeZ225yg7CS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900875; c=relaxed/simple;
	bh=lsBZYsAG+nr8THk4a+Io/3qdHObvPBkAo1nshLqp2i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RU2bu0ShG8llh4diVcEyg8WDEIZxTcrklMk2pOOVc+VT0WgvHbxWbLaJ6zAYsVVJBRrEsFvuj7ywQ94VzYTZGtZphoBOplLSDiyGls54d5rPFED5s8Xm2yyfUlVLZFilwij0Kll9n3fV058R8huRJeYa4vqqjuSbQaKCTddCrQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=JyBeBZu3; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JyBeBZu3"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so560279a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787900873; x=1788505673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRFIKfxO5tXI3eQnrJwwXHHecr77RgRWRC9iwHx3Doo=;
        b=JyBeBZu3Q/Gyj3j11QVt2JAKWAVYS3nDVOUymsiMPp1gGJOR19Ojwl4kBBWV2/yrfF
         tTHJv+RUGSSR2TI/MPWgLA4Y2anqJWjuPHOQdilb+c9zlnkAuo0dg0rEfYqIuvu7aWCw
         DDwsD1s1FdpI4oR6U1qMg56ScGp6tuCl/k5hMwm+gQGevoFDLPVVVg/zST6sxKRJflAQ
         L3RG3+u4kQhRSBegoimud2S5A72ELCNuZoet8e/B9XdmXapUTiIhaX5xZetQEsyEfRKy
         bzJOruIGT91ccgYYSyjsvx2Ph/zxWo8JuyBl831yZJrrqBWDgPPnTTcJM8aRZ3/b3fkg
         9Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900873; x=1788505673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TRFIKfxO5tXI3eQnrJwwXHHecr77RgRWRC9iwHx3Doo=;
        b=MXWcRNDvnCn2O4O/QqACrDuXvUbUijcv3AsxrZtopTibleC4r1OqtOx3erWHmSspYq
         EI7OYUWx4z0/MGp34dD+sHuwELOc6IohuKkji+d5KL3oQd8GmoL9DsMTSWb8TW4Lw+EI
         VrJPCYD3tT8RcdPAFJkFt5ZTAml6l49cpcLEnyunKxTN4xyKAeRGABb9L+uKaK+9k11k
         iUXgs7EFwJZg4rZ5lDvqZ/wmM/Fufb3lIO9YtAB434mWQbwdrJJL9dcgs3pCLZdj2Vkt
         Lq6GTnhGlpWq+c3mqM2ELPkSX0HJWmGBi+Fgg9lUQ57W9PuJ4WDTr4UifrfNQj2fwD35
         1jig==
X-Forwarded-Encrypted: i=1; AHgh+Rrr8lmg2D9dycrPY4BaXr+59D2BNCuuLSVa1nTbZlFIve+L64ibgi+w4P0WKqUfb3a3sUO9SyZm7WpRltk=@vger.kernel.org
X-Gm-Message-State: AFuF++lr8fsIA3GwZxaJbDAalJnJqlpUSK1ongtDxn7u7xKMdWWwApX5
	fKhthtvnRTa55sAOFP7OlB0XDJz0zJyzdq2r5gXumL1k5Qt8KS+m6YcJK+VNbR4a518=
X-Gm-Gg: AR+sD11raVyXGZDILf27oc8vx/e9WL6f9A1AdgM0WLkYDRDLOhbJ73KzWecMfrpU0ZV
	0WI4MFxBEukeD4sM8BMJguWMCkbuCCgEMFG2rZG4vgGCZqK9lyb+M6fVLNzIcbssqd/ZkV/cvgr
	5zm0BkfmVn0iucJ8IicQCMd3P8TJAeUAl1MMZgOhiWR3P6GL70RoOnhf4QaXIqiykU7N3EuCbgS
	zmkyTPQ9fqMXBAL9mrzCpjRQgUxdGPlZHKhenwmRVV4iVoTPK/nSAQd/kRkY0zmmersF4Ng8gXC
	+TRZeUdLcdCojNjsCSKgrxpQz4/ZYL9mb7X2cq8lu61qBvqsTjYJgWctipC5IMWyp+CGndMWgKb
	ozCr6EcBoMCem92w0NIcdZ5Kee5TAD9JVbJNWs0I5zkwU9SOkc7SwfGSgzYsDmMWluMxeNFwiL2
	NEAiM9j0tHhy7FOyIWc234nCTv6ldKWpLPWP+oHjFHB1a0F2tPBWoW9f9K8BICOzVVVk135bc5
X-Received: by 2002:a17:90b:17c3:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-396d0ea9ce7mr7181024a91.2.1787900873239;
        Fri, 28 Aug 2026 00:07:53 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1b38esm3156610c88.3.2026.08.28.00.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:07:52 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	mark.rutland@arm.com,
	andrew.jones@oss.qualcomm.com,
	guoren@kernel.org,
	david.laight.linux@gmail.com,
	zhangzhanpeng.jasper@bytedance.com,
	yang.yicong@picoheart.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v7 2/2] drivers/perf: riscv-iommu: protect shared state with a raw spinlock
Date: Fri, 28 Aug 2026 00:07:47 -0700
Message-ID: <20260828070747.4009519-3-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260828070747.4009519-1-zong.li@sifive.com>
References: <20260828070747.4009519-1-zong.li@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Events are bound to one CPU and the interrupt is affine to it, so the
perf callbacks running with interrupts disabled would be enough to
exclude the handler.

PCI MSI/MSI-X on IMSIC breaks that: the irqchip sets
IRQCHIP_MOVE_DEFERRED, so irq_set_affinity() reports success while only
recording the request, and the move is applied in interrupt context upon
the next device interrupt. Until then the interrupt is still routed to
the CPU IMSIC picked initially, so the first overflow interrupt can run
concurrently with the perf callbacks on the CPU the events are bound to.

Take a raw spinlock, with interrupts disabled so that the handler can
never interrupt a holder on the same CPU, rather than depending on that
irqchip behaviour. It covers the state which is reachable from both
sides:

 - IOCOUNTINH is read-modify-written by ->start()/->stop() and is saved
   and restored around the whole handler.
 - pmu->events[] is written by ->del() and read by the handler.
 - hw_perf_event::prev_count is updated by both.

->add() and ->del() call the unlocked __riscv_iommu_pmu_start() and
__riscv_iommu_pmu_stop() so the lock is taken once per callback.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/perf/riscv_iommu_pmu.c | 66 ++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/riscv_iommu_pmu.c b/drivers/perf/riscv_iommu_pmu.c
index f6acd56f2f61..ee2f6d1fbece 100644
--- a/drivers/perf/riscv_iommu_pmu.c
+++ b/drivers/perf/riscv_iommu_pmu.c
@@ -101,6 +101,7 @@ struct riscv_iommu_pmu {
 	u64 event_cntr_mask;
 	struct perf_event *events[RISCV_IOMMU_HPM_COUNTER_NUM];
 	DECLARE_BITMAP(used_counters, RISCV_IOMMU_HPM_COUNTER_NUM);
+	raw_spinlock_t lock;
 };
 
 #define to_riscv_iommu_pmu(p) (container_of(p, struct riscv_iommu_pmu, pmu))
@@ -485,7 +486,8 @@ static void riscv_iommu_pmu_update(struct perf_event *event)
 	local64_add(delta, &event->count);
 }
 
-static void riscv_iommu_pmu_start(struct perf_event *event, int flags)
+/* Called with pmu->lock held */
+static void __riscv_iommu_pmu_start(struct perf_event *event, int flags)
 {
 	struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
@@ -500,11 +502,22 @@ static void riscv_iommu_pmu_start(struct perf_event *event, int flags)
 	riscv_iommu_pmu_set_period(event);
 	riscv_iommu_pmu_set_event(pmu, hwc->idx, hwc->config);
 	riscv_iommu_pmu_enable_counter(pmu, hwc->idx);
+}
+
+static void riscv_iommu_pmu_start(struct perf_event *event, int flags)
+{
+	struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
+	unsigned long irqflags;
+
+	raw_spin_lock_irqsave(&pmu->lock, irqflags);
+	__riscv_iommu_pmu_start(event, flags);
+	raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
 
 	perf_event_update_userpage(event);
 }
 
-static void riscv_iommu_pmu_stop(struct perf_event *event, int flags)
+/* Called with pmu->lock held */
+static void __riscv_iommu_pmu_stop(struct perf_event *event, int flags)
 {
 	struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
@@ -521,13 +534,26 @@ static void riscv_iommu_pmu_stop(struct perf_event *event, int flags)
 	hwc->state |= PERF_HES_STOPPED | PERF_HES_UPTODATE;
 }
 
+static void riscv_iommu_pmu_stop(struct perf_event *event, int flags)
+{
+	struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
+	unsigned long irqflags;
+
+	raw_spin_lock_irqsave(&pmu->lock, irqflags);
+	__riscv_iommu_pmu_stop(event, flags);
+	raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
+}
+
 static int riscv_iommu_pmu_add(struct perf_event *event, int flags)
 {
 	struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 	unsigned int num_counters = pmu->num_counters;
+	unsigned long irqflags;
 	unsigned int idx;
 
+	raw_spin_lock_irqsave(&pmu->lock, irqflags);
+
 	/* Reserve index zero for iohpmcycles */
 	if (is_cycle_event(event->attr.config))
 		idx = RISCV_IOMMU_HPM_CYCLE_IDX;
@@ -535,8 +561,10 @@ static int riscv_iommu_pmu_add(struct perf_event *event, int flags)
 		idx = find_next_zero_bit(pmu->used_counters, num_counters, 1);
 
 	/* All event counters or cycle counter are in use */
-	if (idx == num_counters || pmu->events[idx])
+	if (idx == num_counters || pmu->events[idx]) {
+		raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
 		return -EAGAIN;
+	}
 
 	set_bit(idx, pmu->used_counters);
 
@@ -546,7 +574,9 @@ static int riscv_iommu_pmu_add(struct perf_event *event, int flags)
 	local64_set(&hwc->prev_count, 0);
 
 	if (flags & PERF_EF_START)
-		riscv_iommu_pmu_start(event, flags);
+		__riscv_iommu_pmu_start(event, flags);
+
+	raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
 
 	/* Propagate changes to the userspace mapping. */
 	perf_event_update_userpage(event);
@@ -556,18 +586,26 @@ static int riscv_iommu_pmu_add(struct perf_event *event, int flags)
 
 static void riscv_iommu_pmu_read(struct perf_event *event)
 {
+	struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
+	unsigned long irqflags;
+
+	raw_spin_lock_irqsave(&pmu->lock, irqflags);
 	riscv_iommu_pmu_update(event);
+	raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
 }
 
 static void riscv_iommu_pmu_del(struct perf_event *event, int flags)
 {
 	struct riscv_iommu_pmu *pmu = to_riscv_iommu_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
+	unsigned long irqflags;
 	int idx = hwc->idx;
 
-	riscv_iommu_pmu_stop(event, PERF_EF_UPDATE);
+	raw_spin_lock_irqsave(&pmu->lock, irqflags);
+	__riscv_iommu_pmu_stop(event, PERF_EF_UPDATE);
 	pmu->events[idx] = NULL;
 	clear_bit(idx, pmu->used_counters);
+	raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
 
 	perf_event_update_userpage(event);
 }
@@ -635,12 +673,24 @@ static irqreturn_t riscv_iommu_pmu_irq_handler(int irq, void *dev_id)
 {
 	struct riscv_iommu_pmu *pmu = (struct riscv_iommu_pmu *)dev_id;
 	DECLARE_BITMAP(ovf_bitmap, BITS_PER_TYPE(u64));
+	unsigned long irqflags;
 	u32 ovf, idx, inhibit;
 
-	/* Check whether this interrupt is for PMU */
+	/*
+	 * Check whether this interrupt is for PMU. Done outside the lock so
+	 * that a shared interrupt line is left alone as cheaply as possible.
+	 */
 	if (!(readl_relaxed(pmu->reg + RISCV_IOMMU_REG_IPSR) & RISCV_IOMMU_IPSR_PMIP))
 		return IRQ_NONE;
 
+	/*
+	 * Hold the lock across the whole sequence below. Stopping the
+	 * counters, processing them and restoring the previous inhibit state
+	 * has to be atomic against ->start()/->stop(), otherwise a counter
+	 * enabled in between would be inhibited again by the restore.
+	 */
+	raw_spin_lock_irqsave(&pmu->lock, irqflags);
+
 	/* Process PMU IRQ */
 	inhibit = riscv_iommu_pmu_stop_all(pmu);
 
@@ -672,6 +722,8 @@ static irqreturn_t riscv_iommu_pmu_irq_handler(int irq, void *dev_id)
 
 	riscv_iommu_pmu_start_all(pmu, inhibit);
 
+	raw_spin_unlock_irqrestore(&pmu->lock, irqflags);
+
 	return IRQ_HANDLED;
 }
 
@@ -735,6 +787,8 @@ static int riscv_iommu_pmu_probe(struct auxiliary_device *auxdev,
 
 	iommu_pmu->reg = iommu_dev->reg;
 
+	raw_spin_lock_init(&iommu_pmu->lock);
+
 	/*
 	 * Counter number and width are hardware-implemented, detect them by
 	 * writing 1s and reading back which bits stuck.
-- 
2.43.7

