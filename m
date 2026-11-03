Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721234;
	b=xal0HW62Iu54I+YOeMvFCVDuUPP6sbsoStC8BWUjnSPGCfNNbztn6EmkFY97OO5goPiA
	 j5O9neJgS99/Vfw0hKgDxnrFnTw3p1caxDYPNeBs+N3Ig/PQARaw6K30kYWkCCHZVjtrL
	 PmGsHwBFhoNTp9Kh4KtRtAJLm9omDF3NxZBqqnxy9KHz+qwM2apUTzscLYvs2Wqqn1Sid
	 56no2MHQqiSwsUCtp1W2uZKJok11AGKGGXJ3EUn4ddmgizbt4EvvtukA1bwJiFv3PgQof
	 UuQODy641OlqzRfe9j4YasSjtjfrS7oCECJgW2KRu9DgI3UtzfGcG1uwdhpxBA0COIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nEmxC+XMyeaIoNlwPc1SWvO2neh4TtG8l/JL7r+0TCM=;
	b=K0/EjEL/q0eOdf5bfd9uOPtTBfJzNMYTxhsNgKQ1u8P4vn1MKJfPFjqTOzHpXsh0uxE3
	 gzxTdDwbYNgrkxC6FIPXi6KcVfiOOTY4Pfugb3r9uy+3fFl+meVv9eM8ip0auPMvp3AF7
	 9Y19HVaflefeUD99+bEsdpgNjzAjyl3tVkjESgw2B4FDFw8RD3SB4HHV9CJwj9V+bJEW5
	 Gcqvvz3ctKVtgy3DjoXpQznY3OsyCVexeKwcjKHMpYTFiAGRodMqmNOuAn82Fll+wMFjF
	 GiQvKUlkoLWgaPIOV2CRmgSrdqGmcLxz5+pr7auaL1F5hy56k/EMLtkqqjtEILnxHYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b="AR/4TJEF";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BE2606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1BE2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=AR/4TJEF
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a18fc7a38so8240918eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1793721233; x=1794326033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEmxC+XMyeaIoNlwPc1SWvO2neh4TtG8l/JL7r+0TCM=;
        b=AR/4TJEFrCGlwDRiiHGBh+aPeZrm3/cwT62e+jkMKSR83FyL40YXWEk8+ErnCLRozc
         xKQYxEomHSZ9Fovh1EBTjXveSLwT4g5+9PS3OzB/Iy5wR9Ple5+6lW7Zofued7FKPOZp
         J6EjuyHSeO7xLxbOo3j96NDyDt8khMorLDgoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721233; x=1794326033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEmxC+XMyeaIoNlwPc1SWvO2neh4TtG8l/JL7r+0TCM=;
        b=KL6jWlZI9n6P3DYkSvWxYtXvOaPfEuR4/5Fxqi1DtAD3nFfGipVDP9MXcJvujs2ojX
         1/3ajMnIraX7sBjyHoIXIU6FvCuqwlQtxAwCdC3nJpQspIgH2mhtj4Z63+oiWCrqnb0j
         +1J3chwBDG9HwFeGMRKDk73MlH9xZTcxDl0dZI4t4HBw+0oHnChSooKipUofDPHDz7ww
         flEysB+DC4D+LJ4fM35vqcH7WuaD+arKGY/Epe7CuIqMRv6fMK3drREt2JQ07mXnFNKx
         jxJxEXt9wNKyKU3T27HZLxOlBqSyYy5mTj79vk3zItXjNVyKHkczK5flcYE0rkrIMSWt
         PbFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAuUinAhsk8AC1gxBID4WcXj5o9a2CHm6g/MHYU/RiSgf75mzRJeY3Xo+JSIciAGBCw9A9x/7swWWysms=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gjlJZuSZ3x5kCjsn2tINIdt3LURuUQGpd5WaEF9MBc2srRLTt
	nX8Y6tjbAL4M+LvNI51j2heq9mRje/k8ImBTbtPrDzenZAe5XfGc+GZtEZZVnshwpJQ=
X-Gm-Gg: AYBFou24CHpmj7QKbkgTD3IK09nUkohKrhJwHdz8J4G+ScwiOc89K5a+od9edsGn6k0
	LDYEOswaEfdh1Gt0jBo4hTA8tJzru6/h5Ksq+4IURqvwRPebwA6Ku9Dy5BANGAH+h69jGAciDZt
	Bh30OLn9oNL6g0H1oFr82fNrL1XAzsrGzJKvUyf9LjlQYhDoOJ4gE9rub/Hvvs6QhdStFABJ2Xm
	Dsa00GKwVsP9A9nvh+Hz7mYF+513Zzv4Pncj/8Tk0DgznQaXIDtl0SZEqLmwcvYQUhFOohTtrjk
	LhNqbYKRslFPsxyMwB17GANuxIVYUFJ1u79gW3ORYrkNKTKXgTjLCLjyKT5KT5ZIn3/WWLNqr4d
	kPeY3NQpfkK5G3CS87rKOQh9pkkarWJEhTSNgf07zSl6wCMmht7W4XEaeoEntJnVFJLOzz8OUdt
	Cxq34NjEsBymqElSisLqoTEkbkD6MCGKzrHofQOgFnZ7zEDGUxDChNCWmtJH9Gg5/79yfnCAaWm
	ljyWOt88TJXI9sbHEk+fnQDL3uYgZ3xD5yTopPDQotQtUzqVk6hMFOYyXyCB2xpoGJi41Olfx70
	NEsnCiCWb4eW5iwrmt9YYr5j5XU8Lv0muBzg7NlZILZDkuW4vViQ
X-Received: by 2002:a05:7300:d0b0:b0:369:9eea:cd25 with SMTP id 5a478bee46e88-36a4235f6ddmr19919106eec.7.1793721232748;
        Tue, 03 Nov 2026 07:53:52 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36c8d3277e3sm7092744eec.29.2026.11.03.07.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:52 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
Date: Wed,  4 Nov 2026 00:53:38 +0900
Message-ID: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
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

There is no way to tell how much of the NPU a client uses. Implement the
DRM usage stats: account the time each job occupies a core and report
it per client as drm-engine-npu, along with drm_show_memory_stats() for
the BOs.

The cores are identical, so they are reported as a single engine with
drm-engine-capacity-npu set to rdev->max_cores, the number of core
slots. The time is summed over all cores, with an atomic counter as the
cores complete jobs concurrently.

Jobs can outlive the file that submitted them, so the counter is
refcounted and each job holds a reference. The time covers the whole
period a job owns a core, so it also includes handling the completion
interrupt and the gaps between the tasks of a multi-task job.

Document the keys in the rocket driver documentation.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
v4: Report a single drm-engine-npu key with drm-engine-capacity-npu,
    instead of drm-engine-npu0..2, as drm-usage-stats.rst specifies for
    a group of identical engines, and document the keys (Tomeu Vizoso).
    The subject no longer says per-core. Gyeyoung's tags are dropped as
    the accounting changed.

    Still depends on commit 6eff1d69dae8 ("accel/rocket: search every
    core slot when a core is removed") for rdev->max_cores.

v3: Add a rocket_engine_usage_create() helper for the counter
    allocation in rocket_open(), to pair with
    rocket_engine_usage_destroy() (Gyeyoung Baek).

v2: Size the per-core counters by rdev->max_cores, the number of core
    slots, instead of the number of cores bound when the file is opened.
    Sashiko reported the out-of-bounds read and Gyeyoung Baek reproduced
    it with KASAN.

Link to v3: https://lore.kernel.org/all/20261103104804.1887489-1-sidong.yang@furiosa.ai/
Link to v2: https://lore.kernel.org/all/20261101152723.1430312-1-sidong.yang@furiosa.ai/
Link to v1: https://lore.kernel.org/all/20261031083642.1076356-1-sidong.yang@furiosa.ai/

 Documentation/accel/rocket/index.rst  | 28 +++++++++++
 Documentation/gpu/drm-usage-stats.rst |  1 +
 drivers/accel/rocket/rocket_drv.c     | 70 ++++++++++++++++++++++++++-
 drivers/accel/rocket/rocket_drv.h     | 15 ++++++
 drivers/accel/rocket/rocket_job.c     |  7 +++
 drivers/accel/rocket/rocket_job.h     |  4 ++
 6 files changed, 123 insertions(+), 2 deletions(-)

diff --git a/Documentation/accel/rocket/index.rst b/Documentation/accel/rocket/index.rst
index 70f97bccf100..53c9aa7e2229 100644
--- a/Documentation/accel/rocket/index.rst
+++ b/Documentation/accel/rocket/index.rst
@@ -17,3 +17,31 @@ project.
 Hardware currently supported:
 
 * RK3588
+
+.. _rocket-usage-stats:
+
+Rocket DRM client usage stats implementation
+============================================
+
+The accel/rocket driver implements the DRM client usage stats specification as
+documented in :ref:`drm-client-usage-stats`.
+
+The NPU cores are reported as a single engine, npu, with a capacity equal to the
+number of cores. The time is summed over all cores, and covers the whole period
+a job occupies a core.
+
+Example of the output showing the implemented key value pairs:
+
+::
+
+        pos:	0
+        flags:	02400002
+        mnt_id:	33
+        ino:	749
+        drm-driver:	rocket
+        drm-client-id:	246
+        drm-engine-npu:	2296549300 ns
+        drm-engine-capacity-npu:	3
+        drm-total-memory:	24216 KiB
+        drm-shared-memory:	0
+        drm-active-memory:	1920 KiB
diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 70b7cfcc194f..288764730d23 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -218,3 +218,4 @@ Driver specific implementations
 * :ref:`panthor-usage-stats`
 * :ref:`xe-usage-stats`
 * :ref:`amdxdna-usage-stats`
+* :ref:`rocket-usage-stats`
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 2bcfe4ab3c68..e22e8623db64 100644
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
+rocket_engine_usage_create(void)
+{
+	struct rocket_engine_usage *usage;
+
+	usage = kzalloc_obj(*usage);
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
+	rocket_priv->engine_usage = rocket_engine_usage_create();
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
@@ -139,7 +183,28 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
-DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
+static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct rocket_device *rdev = to_rocket_device(file->minor->dev);
+	struct rocket_file_priv *rocket_priv = file->driver_priv;
+
+	/*
+	 * This is an estimate: the time is taken around the whole period a job
+	 * occupies a core, so it also covers handling the completion interrupt
+	 * and, for a job made of several tasks, the gaps between them.
+	 */
+	drm_printf(p, "drm-engine-npu:\t%lld ns\n",
+		   atomic64_read(&rocket_priv->engine_usage->elapsed_ns));
+	drm_printf(p, "drm-engine-capacity-npu:\t%u\n", rdev->max_cores);
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
@@ -150,6 +215,7 @@ static const struct drm_driver rocket_drm_driver = {
 	.open			= rocket_open,
 	.postclose		= rocket_postclose,
 	.gem_create_object	= rocket_gem_create_object,
+	.show_fdinfo		= rocket_show_fdinfo,
 	.ioctls			= rocket_drm_driver_ioctls,
 	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
 	.fops			= &rocket_accel_driver_fops,
diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
index 2c673bb99ccc..495d8b4a4d43 100644
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -16,6 +16,16 @@ struct rocket_iommu_domain {
 	struct kref kref;
 };
 
+/*
+ * Time the cores have spent running a client's jobs, in nanoseconds, summed over
+ * all cores. Jobs hold a reference, as they can outlive the file that submitted
+ * them.
+ */
+struct rocket_engine_usage {
+	struct kref kref;
+	atomic64_t elapsed_ns;
+};
+
 struct rocket_file_priv {
 	struct rocket_device *rdev;
 
@@ -24,9 +34,14 @@ struct rocket_file_priv {
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
index ce994748dd5d..e613fae133e4 100644
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
 
+			atomic64_add(local_clock() - core->in_flight_job->start_ns,
+				     &core->in_flight_job->engine_usage->elapsed_ns);
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

