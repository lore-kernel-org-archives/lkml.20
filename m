Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BB9483BC5
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779220; cv=pass; b=G4VXCiODxIDOvjlWHXgIKpDsR26ZYnUWTSfMVVzsuebghMFnv2s83ZdnjKD+W8OcjyZGb6L8ii5rGaj9LTwbZBWiOVgPDxMduE7h45FSyssXyBpCSS6CH4Q1y7eTD/mRUTKnqhI521e0nj+ftZcuTchvvnKb3nZujMykLzozcNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779220; c=relaxed/simple;
	bh=pVmrmUYZBdwIUMlOq4luZR8AC8h9ODVC/V/HaAGiM8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ECNsbsxLLEOmZSrJkHAcWYAZialfA4/ns+yWA/z81jc6UkyVY3BsuW9Z3iVRuwTaGAH4fuUWWoFg0Fsd+1x3pTZOiWQIXa8Dkvd8rwEvIKxwLbPtdS3zB7+KuhS1YpMFevFAWK6o3BbtDTZ3GX50xMLYti+MiBLFtDaIrcdcqVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=UNXHvLMm; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="UNXHvLMm"
ARC-Seal: i=1; a=rsa-sha256; t=1787779180; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dOudAr/GfbpkvxdHaChA1wbNHq57ov4QMtIVv9Y2XDxIKlskx3kZC3PPZMHm17C2RJVjTZlOcjEvMBmdM7ikToX6NpbOemkbL7q1jk0i6xTV0fTinJJqTY4K/peIA1Hnte2/8QD8BQmoEFOQLtYdVdvh1o3losABdeOZ6/VhcI8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787779180; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QmHCSqaC4BFChgC+Mo3s3VRZb7yr2DU+TnltFCeZfiw=; 
	b=FpFVEU9vW4fVkUaYQGNGS0MrwqYjolByGNjI+kZJ/vmC/t/nLd1vlZsaTqFP1tdKwDwZpQfloMXFGYp7jue/KcYWUzHo6m70nNoi1nCaS2lVl2S9xN9S1645Cdrd67r+LbyzE3v1dNdWqj2MmqfV1I/tq/RYuxo9OT1eyADwOg8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787779180;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QmHCSqaC4BFChgC+Mo3s3VRZb7yr2DU+TnltFCeZfiw=;
	b=UNXHvLMm6fNUdT9UJzELzPG8pcrQDrJGwDxLGULuv43HbQ/koSYAl1paEUB9o3d1
	lpY2K3WZHsHW4Cmx2RvoJz+K1KAD8yjGIEGrYwfrbW4od84mrzQEpoyA+L+iB/qzuJw
	5omG0Ile4GJB6+FmJAqell6HMlqdmUjvI7zNyfiQ=
Received: by mx.zohomail.com with SMTPS id 1787779178917438.21898684642974;
	Wed, 26 Aug 2026 14:19:38 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Wed, 26 Aug 2026 22:18:16 +0100
Subject: [PATCH v6 14/16] drm/panfrost: Introduce a reset lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-claude-fixes-v6-14-78119af409e7@collabora.com>
References: <20260826-claude-fixes-v6-0-78119af409e7@collabora.com>
In-Reply-To: <20260826-claude-fixes-v6-0-78119af409e7@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3007;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=pVmrmUYZBdwIUMlOq4luZR8AC8h9ODVC/V/HaAGiM8M=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqj1gMsXaaPgL4fsDTjghO73c7AaUq37LoGPvn3
 IdTVM9ByWmJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCao9YDAAKCRAOJn5M7lND
 PV8/C/wIPb6p8nlP/ZpeQngxxG7hYBgzGlb6z4e9wR8AHq0D++aiDS7ef5yuMgHd7mIDWMZEx3D
 dWwfn5tUuy9ew31D0rCe3VypRqMSSWokRIsKb5z8xbnMJAq5EgUuuJ/0m37AzgYs/J6VVOlYOXp
 f6PtjrcW5FM4fY6pUE8m3h7i/FP0Qf3bAceP3D1xO6aRzB3gm6LDfMg8u7x+98TU8iYUTE4ssis
 +KLnB/i+6Pp296wjSztkYh/WLp6BELAIaX8mZiICAVkG71anYd9qySOgYm/zpVNOuK42BXbPh7I
 1808J/9jDejSfAp17XzQrGI4yUppAijq4lfvOFrV+sunLQo9ZAUDiOwWEpWmWN5QKT4oZtimA+6
 pgldf3Ix42z8Z311rfCXKcNgYVdXYIxsttfxAeu4qP2f5I0VosILLU6N6/c1AyC41riW9co60X2
 mYH/+nSRUlbPQERf/yPIDI/93wJiqfS3XphTOnFwiMyRWv/VTb1vfAt1PBhbUGb7FG5PA=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

So as to avoid accessing HW register while a reset is ongoing, a read/write
semaphore that envelopes the reset sequence will help driver entry points
avoid racing with it. For now, the only such racy entry point is the ioctl
that returns the current GPU timestmap.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 2 ++
 drivers/gpu/drm/panfrost/panfrost_device.h | 1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 9 ++++++---
 drivers/gpu/drm/panfrost/panfrost_job.c    | 1 +
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 0c8f53905da8..ce1d3eb40332 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -491,6 +491,8 @@ bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
 
 void panfrost_device_reset(struct panfrost_device *pfdev)
 {
+	guard(rwsem_write)(&pfdev->reset.lock);
+
 	panfrost_gpu_soft_reset(pfdev);
 	panfrost_gpu_power_on(pfdev);
 	panfrost_mmu_reset(pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index c94546b49662..0570cb1d650d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -165,6 +165,7 @@ struct panfrost_device {
 	struct {
 		struct workqueue_struct *wq;
 		struct work_struct work;
+		struct rw_semaphore lock;
 		atomic_t pending;
 	} reset;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index f77780c72a1a..571a26b84126 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -41,9 +41,12 @@ static int panfrost_ioctl_query_timestamp(struct panfrost_device *pfdev,
 	if (ret)
 		return ret;
 
-	panfrost_cycle_counter_get(pfdev);
-	*arg = panfrost_timestamp_read(pfdev);
-	panfrost_cycle_counter_put(pfdev);
+	/* We should not read timestamp register while the GPU  is being reset */
+	scoped_guard(rwsem_read, &pfdev->reset.lock) {
+		panfrost_cycle_counter_get(pfdev);
+		*arg = panfrost_timestamp_read(pfdev);
+		panfrost_cycle_counter_put(pfdev);
+	}
 
 	pm_runtime_put(pfdev->base.dev);
 	return 0;
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 087905cd347a..6107485a5332 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -876,6 +876,7 @@ int panfrost_jm_init(struct panfrost_device *pfdev)
 	INIT_WORK(&pfdev->reset.work, panfrost_reset_work);
 	spin_lock_init(&js->job_lock);
 	mutex_init(&pfdev->sched_lock);
+	init_rwsem(&pfdev->reset.lock);
 
 	js->irq = platform_get_irq_byname(to_platform_device(pfdev->base.dev), "job");
 	if (js->irq < 0)

-- 
2.55.0

