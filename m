Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280992;
	b=yrH0GFAkTmURJb4FHDImhf7Y1dPgiZiv4/FQ306w1H2+O6aMEty5JiJZ5ax9JAje9uQ/
	 kdUEVPrkEFnzekpKbNcQVnoTg9ylRurO2+Srmz6DE1j1dyUoYaohPe7O5q5gD1+MQxsOV
	 L8+SgJOPxcsh9B+7vhLO54qASlvrZVvkT6+eiTzCHpb6n0lbY/CQarA/3/7PRQ3IQwaPD
	 sRfQRSRD9t22f2/dGhr5orWdmbkf5S2jX01ZBfUoJEru1KVKCHf3p6wG/aYs9B8zYKdo0
	 v+bo1BVHcBfrX5E3O3l7fiU3YmoQ+dzujQS2KD1tulbe6AlF4CghQbSd2hjYgoLZwPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280992;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=JT7hU3QdLKJDaT47XHUJJB8XPz47k2dBS5FgLMn8MDE=;
	b=CO8tLm4ELhszzSirhqviv8JKk+8QHD1pLT7LjX7aSrBi2mx4Fcle2ExN6o8lHdp/cLAc
	 Nqph4P/n1uhS2GyZ08I04o4MA8QlklkUlJaFl8L3tt0YbvDGBYchVPrGgYVXD5CrBFygv
	 UwGLHmIDH817UrgmBM0ecnRCJnK5BWaLned6gO7M/DeVvS9hvtSEfwCZucH2Nm/cP20Z1
	 LKHnXkPB6HX39IfFY7AkGVlZfyh86XOwK/Nf3tYZuWG7/WIg3F2WsoEVE02MFKEONH9d2
	 T17JCeSGpnLACAoYrbOs1vjwRdpMlSlYFMA0K09s5sVwxI4mHqaCyAex3NjzWdXQ0eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9U5iw7k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A0F60A2603
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9U5iw7k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68701F01825;
	Thu, 29 Oct 2026 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793280991;
	bh=JT7hU3QdLKJDaT47XHUJJB8XPz47k2dBS5FgLMn8MDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P9U5iw7kz/kTebaQI+xb0VPsQ+R4fPCYbLvBXgrQwC5PgOkxcHfsjx0CH7q7WW/Wy
	 +F8wlzdIg7L+2rF/vZOaY3WTAcukmBfvMY13tJ0G4PONQvZn8WLwYtWMTW+0ij35jo
	 W4+KVtTkZxdoBzbSWBju26HcAJ1FpV1lmeuNEahypcrEJ2KaNMbH3CUQC4VnTto+kQ
	 P9M8FWmEMl6Ks7cMM9CLjfOZgch9ct7lU61Ec3a5Xj17SaCnQcsDoMJqmmLzAANDiL
	 agsWXtXuyuQwp3SLuPIlRMRmugnR85CdEk3Y2b7berXztxoaJU/XtUNdy/0R16KNCF
	 sQMC+UBvZgN3w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 29 Oct 2026 08:35:58 -0500
Subject: [PATCH v4 11/31] accel: ethosu: Clear SRAM before submission
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-ethosu-fixes-v4-11-4aa25e22578e@kernel.org>
References: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
In-Reply-To: <20261029-ethosu-fixes-v4-0-4aa25e22578e@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

SRAM contents persist between jobs including different users. Clear the
SRAM before programming the SRAM region to prevent one client observing
another client's data.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
 - New patch
---
 drivers/accel/ethosu/ethosu_device.h |  2 ++
 drivers/accel/ethosu/ethosu_job.c    | 47 +++++++++++++++++++++++++++++++-----
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/ethosu_device.h
index 1a90d0ebe5d9..af1489fe08c4 100644
--- a/drivers/accel/ethosu/ethosu_device.h
+++ b/drivers/accel/ethosu/ethosu_device.h
@@ -205,6 +205,8 @@ struct ethosu_device {
 	spinlock_t fence_lock;
 
 	struct drm_gpu_scheduler sched;
+	/* Scheduler entity that last used SRAM. */
+	struct drm_sched_entity *sram_entity;
 	/* For ethosu_job_do_push() */
 	struct mutex sched_lock;
 	struct list_head sched_entities;
diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
index ef95a8abd61e..3976115902e8 100644
--- a/drivers/accel/ethosu/ethosu_job.c
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -45,11 +45,27 @@ static const struct dma_fence_ops ethosu_fence_ops = {
 	.get_timeline_name = ethosu_fence_get_timeline_name,
 };
 
-static void ethosu_job_set_in_flight(struct ethosu_device *dev,
-				     struct ethosu_job *job)
+static u32 ethosu_job_sram_size(struct ethosu_job *job)
 {
+	struct ethosu_validated_cmdstream_info *cmd_info =
+		to_ethosu_bo(job->cmd_bo)->info;
+
+	return cmd_info->region_size[ETHOSU_SRAM_REGION];
+}
+
+static bool ethosu_job_set_in_flight(struct ethosu_device *dev,
+				     struct ethosu_job *job, u32 sram_size)
+{
+	bool clear_sram = false;
+
 	guard(spinlock)(&dev->job_lock);
+	if (sram_size && dev->sram_entity != job->base.entity) {
+		dev->sram_entity = job->base.entity;
+		clear_sram = true;
+	}
 	dev->in_flight_job = job;
+
+	return clear_sram;
 }
 
 static struct ethosu_job *
@@ -64,7 +80,8 @@ ethosu_job_clear_in_flight(struct ethosu_device *dev)
 	return job;
 }
 
-static void ethosu_job_hw_submit(struct ethosu_device *dev, struct ethosu_job *job)
+static void ethosu_job_hw_submit(struct ethosu_device *dev, struct ethosu_job *job,
+				 u32 sram_size, bool clear_sram)
 {
 	struct drm_gem_dma_object *cmd_bo = to_drm_gem_dma_obj(job->cmd_bo);
 	struct ethosu_validated_cmdstream_info *cmd_info = to_ethosu_bo(job->cmd_bo)->info;
@@ -79,7 +96,12 @@ static void ethosu_job_hw_submit(struct ethosu_device *dev, struct ethosu_job *j
 		dev_dbg(dev->base.dev, "Region %d base addr = %pad\n", region, &bo->dma_addr);
 	}
 
-	if (job->sram_size) {
+	if (sram_size) {
+		if (clear_sram) {
+			memset_io(dev->sram, 0, dev->npu_info.sram_size);
+			/* Order the SRAM clear before starting the NPU. */
+			wmb();
+		}
 		writel_relaxed(lower_32_bits(dev->sramphys),
 			       dev->regs + NPU_REG_BASEP(ETHOSU_SRAM_REGION));
 		writel_relaxed(upper_32_bits(dev->sramphys),
@@ -263,6 +285,8 @@ static struct dma_fence *ethosu_job_run(struct drm_sched_job *sched_job)
 	struct ethosu_job *job = to_ethosu_job(sched_job);
 	struct ethosu_device *dev = job->dev;
 	struct dma_fence *fence = job->done_fence;
+	u32 sram_size;
+	bool clear_sram;
 
 	if (unlikely(job->base.s_fence->finished.error))
 		return NULL;
@@ -273,8 +297,9 @@ static struct dma_fence *ethosu_job_run(struct drm_sched_job *sched_job)
 
 	ethosu_switch_perfmon(dev, job);
 
-	ethosu_job_set_in_flight(dev, job);
-	ethosu_job_hw_submit(dev, job);
+	sram_size = ethosu_job_sram_size(job);
+	clear_sram = ethosu_job_set_in_flight(dev, job, sram_size);
+	ethosu_job_hw_submit(dev, job, sram_size, clear_sram);
 
 	return fence;
 }
@@ -482,12 +507,22 @@ int ethosu_job_open(struct ethosu_file_priv *ethosu_priv)
 	return ret;
 }
 
+static void ethosu_job_clear_sram_entity(struct ethosu_device *dev,
+					 struct drm_sched_entity *entity)
+{
+	guard(spinlock)(&dev->job_lock);
+	if (dev->sram_entity == entity) {
+		dev->sram_entity = NULL;
+	}
+}
+
 void ethosu_job_close(struct ethosu_file_priv *ethosu_priv)
 {
 	struct ethosu_device *dev = ethosu_priv->edev;
 	struct drm_sched_entity *entity = &ethosu_priv->sched_entity;
 
 	scoped_guard(mutex, &dev->sched_lock) {
+		ethosu_job_clear_sram_entity(dev, entity);
 		drm_sched_entity_kill(entity);
 		list_del(&ethosu_priv->sched_entity_list);
 	}

-- 
2.53.0

