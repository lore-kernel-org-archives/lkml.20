Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793546859;
	b=EenUFDkwRPaoNdbyfgwJgDMteiw4kNaih9IyOoSPIGJGA0QGHA4YQ5HJ21eYCCbzUPPX
	 c8FKUQZ4N4LscaT06gH8/f/LAtEY4XNR0UZFDCJR8t0jWhFv7do+cpjlH5BcJ89TY9AJh
	 TfshYZ6A0toxVYtcTLca1Uxg7FEgYXXl03Jpz0TnQ54lhgSACWYde4ocMgKTht6DOuzzR
	 Bkfx5hYYiN+obIoTcqX/P3G7VEiO4Qlz/+p+i22u2FkcvkWc077JvqtJUsV9Q+j2K+Uqt
	 RYaEx3jeXK/tM/SWGE0iAY0sVuqiGibktIvdpTnvtZrKPaUqcyxStk3CIsfurojEzRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793546859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+bKr/RFDIZ8ixgTkWUWiPbn716+CDJnqMbdyJznVXpM=;
	b=yRuj2QuUJiVjdN12GoeKhAyvUX1ziId/5Ay+lcywx2JW1b6spFQUApQw7pla2gIUyg6a
	 aHZsXeG8BkW0ruc1IpkxXUTm3koWNyX2xk/eBeBg6KWgjYH/DCB7bCbYF5CtF3DLGjj7z
	 TIMeFI/hg3hC5qSM7pXduHy5bJByXXivjt6eQNSPU5v/86WtzOtjnQar7ui5bc+5Bm+de
	 mJUf/DpXV1IaHgrxHfYHtluB9UEALtib6JQilJILK2bGzNQoPSpFtogtvQRfH/fG7YMSq
	 AxAQBpkYfpRaAUEwLxWtBbEF3Iu1zWhGL667aIjqgJ8RGeSnRh/5RvHK/Qe2bZlPlfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=FDLxk9tm;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C827A606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C827A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=FDLxk9tm
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so1621146a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1793546858; x=1794151658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+bKr/RFDIZ8ixgTkWUWiPbn716+CDJnqMbdyJznVXpM=;
        b=FDLxk9tm6RqiUxsDdmXi9xJvbebk5yMD0ZyWuSZh1rENmrorQLB01Ib46YmleF0uqf
         0DIJ0B+zx/kuNz3M1g2u23on4+LmgYSQfDxxf9/bBdCVbY7tW89G0MOcO4RRhOTcYVZ8
         I4xDjdbzywGVv0luoxBJhNo0sROA29oNJ4eeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793546858; x=1794151658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bKr/RFDIZ8ixgTkWUWiPbn716+CDJnqMbdyJznVXpM=;
        b=L6CP4vOm+fV+75ipziMKppPhiphsaXOygLJpCORw5ibReWKwOUH6m3ZMRarVdqK79d
         N7beTYLeNHvljkmkzlNExjD2g5U5qAOrUXnz6Q9uJpukSqomxwB6eiGOZhI6gZM16BPb
         Sj0O6EfNcBK3RSXmoUZAmK+FknF7w2nlm0wk14PS2uxAwrCLxpm35YJCVFosEbq9M4Cu
         LDr+rE08uFS6TH8gItAh37kfm1+iY3jdWFGkeLI8HLvyIfOMgD1MRg/zM8OnXtyw1RYs
         606aSNIt31yCS3hxP8RL634dbI5c5bQHgAP0hkbFF7hb3NsOzSmzeZmn3DenLNURl6Ii
         TtYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAt7ptSP9fsvjdv8I63CkHLtwb5gCyWR1u85R1DNWYGEZ306vZAm7ynuzX4BgaCWnAYRkGCdSFvc41zec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dTqkPhZtKKxTjeZ1W4ZeRKNkTTCxmQ8gOE2iGl2RLf8XN+fiY
	IqBtNrLG00XOOUXH3YaYnWssWfKMctF6tJ0lR53+y26yGjt8IsoZeYfGOaKmsbIchLg=
X-Gm-Gg: AYBFou3mp81bUrwD2JZJkgPH2lOB5vGPtfiHySHY/csvt5A2dabbUkX79qfkwG3cUk+
	BFEXUHVa4lZrXzcxCvcQ2kB+Dw7m7yUwixpjqY/RW0juH4n1tEwia2hq3vFBFhgIBKiy27mvbGr
	5G1Uk4Eg+3Ged1uP27Rult2dCwSyVbozcD70Gi17VJcG1a9ZZTL5PTJd2RgjDqEcSYIJzJ+Xfag
	1tUpUxPJ4maOTm0NBAtR3+mnpJhB2AssADV2FVgtTa/ZjjeyLncGjCBpKdBHuwqlG155ScLM6eA
	kcl/eUWCaJ7RGXD1rGo9iZvocTwN7tVRV2W3m5d8AMGmfqBYGGtT0RoAoxJ0PvP/jHswfmQoC5P
	z+q6Oevlo5aYIPatVxRVa2N56JhJxHU2o0gkhiyM73yuimx/PQ9GvBDsnm+aJSJ7j2/6Ohyncbf
	LC00ixti9hAGmPOxRYLkJs6pfRjKHStXXwySUvZOY1FLcyL6z6AR55gut0Ows2D+3/YcZe0eXKU
	LfPcWFzOh8AmWlR3Il+hBCl5awjGhaZMwHvBX4gPJwloloOB8MLwHPS9ymcwOleKHn3yGU/5NIN
	RtNyUjipq/7s5R6IrlNvJEmAhtTT+NQjXBGxtlXYV0H1Cnndeq5T
X-Received: by 2002:a17:90b:4f87:b0:3a7:b260:9ccc with SMTP id 98e67ed59e1d1-3ae8985d7cbmr6338462a91.65.1793546858125;
        Sun, 01 Nov 2026 07:27:38 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae880b1f71sm5956284a91.4.2026.11.01.07.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:27:37 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v2] accel/rocket: Report per-core engine usage through fdinfo
Date: Mon,  2 Nov 2026 00:27:23 +0900
Message-ID: <20261101152723.1430312-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
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

There is no way to tell how much of the NPU a client uses, or whether its
jobs reach more than one core. Implement the DRM usage stats: account the
time each job occupies a core and report it per client as
drm-engine-npu<n>, along with drm_show_memory_stats() for the BOs.

Jobs can outlive the file that submitted them, so the counters are
refcounted and each job holds a reference. The time covers the whole
period a job owns a core, so it also includes handling the completion
interrupt and the gaps between the tasks of a multi-task job.

The array is sized by rdev->max_cores, the number of core slots, not by
the number of cores bound when the file is opened. A core can still be
probing while a client opens the device, and the IRQ handler indexes the
array with core->index, which stays valid when a core is unbound. A slot
with no core bound reads as zero.

For example, teflon running a model two operations deep 3001 times gives:

  drm-engine-npu0:	22719385 ns
  drm-engine-npu1:	23345296 ns
  drm-engine-npu2:	0 ns

The NPU is busy 15.6% of the wall clock time and one core is never used.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
v2: Size the per-core counters by rdev->max_cores, the number of core
    slots, instead of the number of cores bound when the file is opened.
    Sashiko reported the out-of-bounds read and Gyeyoung Baek reproduced
    it with KASAN.

    This depends on commit 6eff1d69dae8 ("accel/rocket: search every core
    slot when a core is removed"), which added rdev->max_cores. It is in
    mainline through drm-misc-fixes but not yet in drm-misc-next.

Link to v1: https://lore.kernel.org/all/20261031083642.1076356-1-sidong.yang@furiosa.ai/

 drivers/accel/rocket/rocket_drv.c | 60 +++++++++++++++++++++++++++++--
 drivers/accel/rocket/rocket_drv.h | 14 ++++++++
 drivers/accel/rocket/rocket_job.c |  7 ++++
 drivers/accel/rocket/rocket_job.h |  4 +++
 4 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 2bcfe4ab3c68..58a486206565 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -3,8 +3,10 @@
 
 #include <drm/drm_accel.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_print.h>
 #include <drm/rocket_accel.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -68,6 +70,25 @@ rocket_iommu_domain_put(struct rocket_iommu_domain *domain)
 	kref_put(&domain->kref, rocket_iommu_domain_destroy);
 }
 
+static void
+rocket_engine_usage_destroy(struct kref *kref)
+{
+	kfree(container_of(kref, struct rocket_engine_usage, kref));
+}
+
+struct rocket_engine_usage *
+rocket_engine_usage_get(struct rocket_file_priv *rocket_priv)
+{
+	kref_get(&rocket_priv->engine_usage->kref);
+	return rocket_priv->engine_usage;
+}
+
+void
+rocket_engine_usage_put(struct rocket_engine_usage *usage)
+{
+	kref_put(&usage->kref, rocket_engine_usage_destroy);
+}
+
 static int
 rocket_open(struct drm_device *dev, struct drm_file *file)
 {
@@ -86,10 +107,19 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 	}
 
 	rocket_priv->rdev = rdev;
+
+	rocket_priv->engine_usage = kzalloc_flex(*rocket_priv->engine_usage,
+						 elapsed_ns, rdev->max_cores);
+	if (!rocket_priv->engine_usage) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+	kref_init(&rocket_priv->engine_usage->kref);
+
 	rocket_priv->domain = rocket_iommu_domain_create(rdev->cores[0].dev);
 	if (IS_ERR(rocket_priv->domain)) {
 		ret = PTR_ERR(rocket_priv->domain);
-		goto err_free;
+		goto err_put_engine_usage;
 	}
 
 	file->driver_priv = rocket_priv;
@@ -109,6 +139,8 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 	mutex_destroy(&rocket_priv->mm_lock);
 	drm_mm_takedown(&rocket_priv->mm);
 	rocket_iommu_domain_put(rocket_priv->domain);
+err_put_engine_usage:
+	rocket_engine_usage_put(rocket_priv->engine_usage);
 err_free:
 	kfree(rocket_priv);
 err_put_mod:
@@ -125,6 +157,7 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 	mutex_destroy(&rocket_priv->mm_lock);
 	drm_mm_takedown(&rocket_priv->mm);
 	rocket_iommu_domain_put(rocket_priv->domain);
+	rocket_engine_usage_put(rocket_priv->engine_usage);
 	kfree(rocket_priv);
 	module_put(THIS_MODULE);
 }
@@ -139,7 +172,29 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
-DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
+static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct rocket_device *rdev = to_rocket_device(file->minor->dev);
+	struct rocket_file_priv *rocket_priv = file->driver_priv;
+	unsigned int core;
+
+	/*
+	 * These are estimates: the time is taken around the whole period a job
+	 * occupies a core, so it also covers handling the completion interrupt
+	 * and, for a job made of several tasks, the gaps between them.
+	 */
+	for (core = 0; core < rdev->max_cores; core++)
+		drm_printf(p, "drm-engine-npu%u:\t%llu ns\n", core,
+			   rocket_priv->engine_usage->elapsed_ns[core]);
+
+	drm_show_memory_stats(p, file);
+}
+
+static const struct file_operations rocket_accel_driver_fops = {
+	.owner = THIS_MODULE,
+	DRM_ACCEL_FOPS,
+	.show_fdinfo = drm_show_fdinfo,
+};
 
 /*
  * Rocket driver version:
@@ -150,6 +205,7 @@ static const struct drm_driver rocket_drm_driver = {
 	.open			= rocket_open,
 	.postclose		= rocket_postclose,
 	.gem_create_object	= rocket_gem_create_object,
+	.show_fdinfo		= rocket_show_fdinfo,
 	.ioctls			= rocket_drm_driver_ioctls,
 	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
 	.fops			= &rocket_accel_driver_fops,
diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
index 2c673bb99ccc..eff5c2ac54d1 100644
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -16,6 +16,15 @@ struct rocket_iommu_domain {
 	struct kref kref;
 };
 
+/*
+ * Time each core has spent running a client's jobs, in nanoseconds, indexed by
+ * core. Jobs hold a reference, as they can outlive the file that submitted them.
+ */
+struct rocket_engine_usage {
+	struct kref kref;
+	u64 elapsed_ns[];
+};
+
 struct rocket_file_priv {
 	struct rocket_device *rdev;
 
@@ -24,9 +33,14 @@ struct rocket_file_priv {
 	struct mutex mm_lock;
 
 	struct drm_sched_entity sched_entity;
+
+	struct rocket_engine_usage *engine_usage;
 };
 
 struct rocket_iommu_domain *rocket_iommu_domain_get(struct rocket_file_priv *rocket_priv);
 void rocket_iommu_domain_put(struct rocket_iommu_domain *domain);
 
+struct rocket_engine_usage *rocket_engine_usage_get(struct rocket_file_priv *rocket_priv);
+void rocket_engine_usage_put(struct rocket_engine_usage *usage);
+
 #endif
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index ce994748dd5d..c0ffbccfb6cc 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -13,6 +13,7 @@
 #include <linux/iommu.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/sched/clock.h>
 
 #include "rocket_core.h"
 #include "rocket_device.h"
@@ -265,6 +266,7 @@ static void rocket_job_cleanup(struct kref *ref)
 	unsigned int i;
 
 	rocket_iommu_domain_put(job->domain);
+	rocket_engine_usage_put(job->engine_usage);
 
 	dma_fence_put(job->done_fence);
 	dma_fence_put(job->inference_done_fence);
@@ -351,6 +353,7 @@ static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
 
 	scoped_guard(mutex, &core->job_lock) {
 		core->in_flight_job = job;
+		job->start_ns = local_clock();
 		rocket_job_hw_submit(core, job);
 	}
 
@@ -379,6 +382,9 @@ static void rocket_job_handle_irq(struct rocket_core *core)
 				return;
 			}
 
+			core->in_flight_job->engine_usage->elapsed_ns[core->index] +=
+				local_clock() - core->in_flight_job->start_ns;
+
 			iommu_detach_group(NULL, iommu_group_get(core->dev));
 			dma_fence_signal(core->in_flight_job->done_fence);
 			pm_runtime_put_autosuspend(core->dev);
@@ -587,6 +593,7 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
 
 	rjob->rdev = rdev;
 	rjob->domain = rocket_iommu_domain_get(file_priv);
+	rjob->engine_usage = rocket_engine_usage_get(file_priv);
 
 	ret = drm_sched_job_init(&rjob->base,
 				 &file_priv->sched_entity,
diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/rocket_job.h
index 4ae00feec3b9..14aa78aebc99 100644
--- a/drivers/accel/rocket/rocket_job.h
+++ b/drivers/accel/rocket/rocket_job.h
@@ -38,6 +38,10 @@ struct rocket_job {
 
 	struct rocket_iommu_domain *domain;
 
+	/* When the job was handed to a core, and where to account the time */
+	u64 start_ns;
+	struct rocket_engine_usage *engine_usage;
+
 	struct kref refcount;
 };
 

base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
prerequisite-patch-id: 519bcdfdde80d902309c8346f749ebc4bb6b29c0
-- 
2.53.0

