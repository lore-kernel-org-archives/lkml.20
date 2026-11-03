Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702909;
	b=iIsa8GiP3aqsOsR2KSoHZbioO3BhI4OTfkDxdvTuY1i2AP0lPVJb8tBmnJiWWAgaSeO6
	 KsgFUCSB1G1ZgqEURT+rzA7/lR5mMkOXD9xjcyQirsFEHaEl+Z374Xm2iumNppr8EENp1
	 XyKLm2qxZecVjUhH0XRaK+qpcLytp27ekuZCPudvtCsD8AJLPXXSalRCkz82ms4fCFiQx
	 kAq3ZL41Yyb2GqbIQqSa0+bNqSI97MlhcInWn+ozVXMAEx7Ta4H25VWNP/tfhrr3vRHuH
	 iWMHjUf6tOxCPIRWgaYugdivRggo676IJ2ThUuiD9ESi4p3LQzJI9PgzarT509LHMkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X8sXmYjyhFJrjlaYlt5dN5YNRChBshG6yU0r3i1iBRU=;
	b=qNsSAFOHC6kxofBbJU7lpAYgg4UMmNLWyDwyd9RF+ajadHu20K1xkholbi5W2gO/Xm2Q
	 WK4GNWt1dghCTvtQVLOGF46R0DN5L/cEx8TZmk9+3wnHZTQau6wFyHEFboNBYNw33o/0O
	 EMUIOmQidWXXQ5cmWUpVtsyR/JaV42bYVnmMmuyZXhND9EhTrY+XkPuO5zoc7yaBsJZM7
	 rS6X4aVtb6Ifv/3vsRTH5aQqNuzLcHnI7mWPmQ3gSNf6M3jivw3a7KyZ4BiryPk/qO0nG
	 6KiysoOTpWurg0oGx9CvdOM/oHjiKWbiYAvU9e6t3mXYZCeQLOOOJqPmRu9Uy4FUcXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=o233Ghkg;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA444606A83B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA444606A83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=o233Ghkg
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3928678eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1793702908; x=1794307708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X8sXmYjyhFJrjlaYlt5dN5YNRChBshG6yU0r3i1iBRU=;
        b=o233Ghkgy+yLbmKBiHwSir9J4Tgsz/kqcE1yHQh7xxWIZxPfymuMqHxprQ+iVFF+NG
         5hDHH/1gM25jtr1YomGzNRMyHPim6KAuDYIrnTiSeOoIqRWdbbGNuk7YkTNp4o5pNVTV
         eonj4eADfkxtqBn9jl88MYiRuEHNiEEAUbqoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702908; x=1794307708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8sXmYjyhFJrjlaYlt5dN5YNRChBshG6yU0r3i1iBRU=;
        b=zdrnp730awjZJpH+oc0ljjabIyVFZQ4nzDRNcHC/th1Pyg5/TienrfZk4tqxna8RkW
         rq2S4lHkmgy9TAfGpO8gKB+NYuH24UvgvS7PI0DxNT26TZ5zRt9Y6nnFPBWqmwAUS/qo
         jhOx07emTCiW5f53KInbTD1jt6HonlNU6xJuJBRFucLoqEcKD+czo01VAj6n+LUtKBFO
         oRU0cTZH6qDn9pV9vZYB2/AxXChwxK8421jzjEYwixH5mEpquPL3Eggv/O3L3srwmfZW
         fNf4Hbb4PsNrS9R+P5xU+ZPuAZj6m0uJNKW/7sJHCLkyd2uGp1wcAnBBoUWRBiNtXXek
         x1eg==
X-Forwarded-Encrypted: i=1; AKwUvBy4v9Bj9CNt6FJAc9isgcgsE96VdQFaur03tc4ypW1J8id+dYe1MElmDcZOSANsAhl3VhwkIXo7AfcB5nA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UZj46A8tRKV6BpfAHxdqzpP5w1i1etj2Ih5sdkElkDH1GWspc
	V14lv5BWbdOrvELDmuCtkeCplm4nq2tsVXQYYkpxBckUM7jzwG5shjSleAKQI6+jRLohAL5aMb1
	Q63CqydE=
X-Gm-Gg: AYBFou27eb3GuL9KIZVclyKRvVPZLbMZXaoLApR3+LyItPIAtdrnYC+p9BdcEmmTxwI
	FXYlK3HNm3IlRDw4ZYNXZdgvv4g1V70omCFMQnGw07ITUhRd+5KfKVLGPeFL1Bgq8Z11neRtbH5
	fEPJLBKIvoO9f6seCx29c8L3nS4Mf585eT66jQZci3XhxrMb+dFWKgobZFGriGpgoIf+DuT5uJg
	1nJ8jrBx1e33KdmU//I/ppMUqe8AKFoppVH2gKTO/TU7QFReqodPxYonN1niphzLe3P/BcHBK0w
	HLkyI6H4CXohU40BhyNTlhr/UStekOYjFEqrgQLAUYZ/Zuswa22xxNkpMOmsToPCicbibIg9cgG
	yI9IqzlhKpfQTJC9Dv0ncxtUGZqLoAYZ0tepvUlJUDABxRO9dPb1R3p4NIxitLPNSVEPL/IO7qk
	imM9wlOYNTSzDKT0KpJWhziv3XUoTYNJ2UVx3CbHmhBLNF6Dd81ENwHf8u9YLIep3fPBbqo6GuN
	+ffaXRqzrfAkjjN6tQhfarYQUpvhFsIH3Y9BghkdmzjlHamNhWW4qiwuCYyns80KJdt9QpMtI2V
	sk0wfYWo6TJoOYdqpaI5g0/HSorbUos=
X-Received: by 2002:a05:693c:8945:10b0:36a:3bba:2e07 with SMTP id 5a478bee46e88-36a423becbdmr18650870eec.26.1793702907581;
        Tue, 03 Nov 2026 02:48:27 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36c8d3277e3sm4736193eec.29.2026.11.03.02.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:48:27 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v3] accel/rocket: Report per-core engine usage through fdinfo
Date: Tue,  3 Nov 2026 19:48:04 +0900
Message-ID: <20261103104804.1887489-1-sidong.yang@furiosa.ai>
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
Reviewed-by: Gyeyoung Baek <gye976@gmail.com>
Tested-by: Gyeyoung Baek <gye976@gmail.com>
---
v3: Add a rocket_engine_usage_create() helper for the counter
    allocation in rocket_open(), to pair with
    rocket_engine_usage_destroy() (Gyeyoung Baek).

    Still depends on commit 6eff1d69dae8 ("accel/rocket: search every
    core slot when a core is removed") for rdev->max_cores.

v2: Size the per-core counters by rdev->max_cores, the number of core
    slots, instead of the number of cores bound when the file is opened.
    Sashiko reported the out-of-bounds read and Gyeyoung Baek reproduced
    it with KASAN.

    This depends on commit 6eff1d69dae8 ("accel/rocket: search every core
    slot when a core is removed"), which added rdev->max_cores. It is in
    mainline through drm-misc-fixes but not yet in drm-misc-next.

Link to v2: https://lore.kernel.org/all/20261101152723.1430312-1-sidong.yang@furiosa.ai/
Link to v1: https://lore.kernel.org/all/20261031083642.1076356-1-sidong.yang@furiosa.ai/

 drivers/accel/rocket/rocket_drv.c | 71 ++++++++++++++++++++++++++++++-
 drivers/accel/rocket/rocket_drv.h | 14 ++++++
 drivers/accel/rocket/rocket_job.c |  7 +++
 drivers/accel/rocket/rocket_job.h |  4 ++
 4 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 2bcfe4ab3c68..d9fd05e9b1f3 100644
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
@@ -68,6 +70,38 @@ rocket_iommu_domain_put(struct rocket_iommu_domain *domain)
 	kref_put(&domain->kref, rocket_iommu_domain_destroy);
 }
 
+static struct rocket_engine_usage *
+rocket_engine_usage_create(struct rocket_device *rdev)
+{
+	struct rocket_engine_usage *usage;
+
+	usage = kzalloc_flex(*usage, elapsed_ns, rdev->max_cores);
+	if (!usage)
+		return NULL;
+	kref_init(&usage->kref);
+
+	return usage;
+}
+
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
@@ -86,10 +120,17 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 	}
 
 	rocket_priv->rdev = rdev;
+
+	rocket_priv->engine_usage = rocket_engine_usage_create(rdev);
+	if (!rocket_priv->engine_usage) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+
 	rocket_priv->domain = rocket_iommu_domain_create(rdev->cores[0].dev);
 	if (IS_ERR(rocket_priv->domain)) {
 		ret = PTR_ERR(rocket_priv->domain);
-		goto err_free;
+		goto err_put_engine_usage;
 	}
 
 	file->driver_priv = rocket_priv;
@@ -109,6 +150,8 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 	mutex_destroy(&rocket_priv->mm_lock);
 	drm_mm_takedown(&rocket_priv->mm);
 	rocket_iommu_domain_put(rocket_priv->domain);
+err_put_engine_usage:
+	rocket_engine_usage_put(rocket_priv->engine_usage);
 err_free:
 	kfree(rocket_priv);
 err_put_mod:
@@ -125,6 +168,7 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 	mutex_destroy(&rocket_priv->mm_lock);
 	drm_mm_takedown(&rocket_priv->mm);
 	rocket_iommu_domain_put(rocket_priv->domain);
+	rocket_engine_usage_put(rocket_priv->engine_usage);
 	kfree(rocket_priv);
 	module_put(THIS_MODULE);
 }
@@ -139,7 +183,29 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
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
@@ -150,6 +216,7 @@ static const struct drm_driver rocket_drm_driver = {
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

