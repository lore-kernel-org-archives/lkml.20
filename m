Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE5B3F2101
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812315; cv=pass; b=qPMrKZltW9+QlHp5g/Mf+79Dux83cvyFosKLjtF+MMAQIc03wrsMouRUEdmpDt1cS0h5nhpZNrLr1KS5xpf4GMFm12fiIpPGo+CKcjLhqXFXHwPdM/opLa4NyiQZyFzPUJqKA1V+qFrezNvmPKzKglaJUbR4Y23HPfbnqUgv9NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812315; c=relaxed/simple;
	bh=RLXJVqDsqciJ2yl5PsUrLuoeCj7qRp4bu3LBKb54af8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1c4YnM2wh5FPQFt6ylObuNRWrPZUsXeJ8BMGhvzZ+Ujrd8JSDZJmg6nQinHuMbX7PMBkO5uFW/tjEyc7QHgvLMYIVm22ZcNdSjxcqkVQpBTP83WRqT+XBcMEVSbic+vRwu29KWqZCUetuFWy8Fi1+NLW0pYYoS92ie4buSL0T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=cWsuLsUg; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="cWsuLsUg"
ARC-Seal: i=1; a=rsa-sha256; t=1788812279; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MuA8NHhE1oHwzXPlO4jmuk6dhxBSmhNzY7Yijeoe1+8/yz3fbUMNNeI76Phut8bua71eI4gHQsWTy76r62JDoDrIAo+FohCIilhmrKZONjPHpTRzPE61PF1IVqAvN8U0rk9u9N+i7palD/rYyTRaYy7MU2K31Q796x5qVjHVdXY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788812279; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QpVjZQIXEM6PuM7BJI1fj2uYWU3Giv1q4JGW4lXGAUQ=; 
	b=A3IKjnZIz+olCDLUFnGfNMx8vBtKNLVr0KmaLF8wjx0BAkkxL6+NBtVlucMoufrdEVCU583mvWdWCDA5hbYSw8CsEXCyb9MyRFuxd/i9vhDZOdoIHHclwSfZ9XFAV8heF7yM0/vBzRI/sEpCy3OTd6Ox+91A/hxlekNH/Tv7/t0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788812279;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QpVjZQIXEM6PuM7BJI1fj2uYWU3Giv1q4JGW4lXGAUQ=;
	b=cWsuLsUgV33aRvZ36uMK96b86LSCQCDvz6OU5nQnJXcI5D7sTIF0c9XfUHhBdvED
	UxtRyVKF2FOdoregGHnFOJt3JioK+/Abb18T9H03gSFa8/38KucIomWQmtvOQLY8AcG
	m7xizWX+40+xSu66W0MQNkf8qu6MGQOU4TJB2Ox0=
Received: by mx.zohomail.com with SMTPS id 1788812277306611.3921507709811;
	Mon, 7 Sep 2026 13:17:57 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 07 Sep 2026 21:16:23 +0100
Subject: [PATCH v8 14/16] drm/panfrost: Introduce a reset lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-claude-fixes-v8-14-c2bcb5e82184@collabora.com>
References: <20260907-claude-fixes-v8-0-c2bcb5e82184@collabora.com>
In-Reply-To: <20260907-claude-fixes-v8-0-c2bcb5e82184@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=RLXJVqDsqciJ2yl5PsUrLuoeCj7qRp4bu3LBKb54af8=;
 b=kA0DAAoBDiZ+TO5TQz0ByyZiAGqfG4zIy/uoHluHI30JJNL0ohN3HvSelA46mFR+kXQLX7B/h
 YkBswQAAQoAHRYhBDJAMOjABRdd+TcHpA4mfkzuU0M9BQJqnxuMAAoJEA4mfkzuU0M9lpIL/2Gs
 13JUt2Ff8xhtU1X2fbFpyQnGsubbEKvRdqEqPcJsBZt4+XRovsaWjtm0URouLtNada2IOcBEF+3
 khQsRardsNyiGGWDLc3hcdDwtTXggDY4+eKOdvyO0T2lJgExI/L70etMHmEf8NU4O+66tT95ozx
 AJE+xJoMQB546lBbJ3CgFyjCk3xeTo+bSPCYy/wWpApKjdSBAa1CybpbZmMHUp1ta5FLKWIn3Ov
 8a3P81YzjNz338gGuM6Op0KA5pDelpOukfDOX9bgVyv7C/X3oJedJgmx8I0x8mn0cRHNm++ZqFI
 KziFyHNnpZWrqpw1LIzyI4HGh0jnUfiYXGF4fTnK3LXWQJzMqr3ZZBWpu3vQ6FE8V+LYuApRYCz
 JZYasrVJRs9KjutvUb5LD6ODWteRzSa7kL3yteJIIlBE6NV4kTOEu/4rpteWYIgzV/2isVJeDaS
 3PXedRKeanZkqqJoVd13DLEowbGNSwDJab36MnNYTi1SDjzygrAOLHJiiO4g==
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
index f171abe26f80..e90efcff5ce7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -466,6 +466,8 @@ bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
 
 void panfrost_device_reset(struct panfrost_device *pfdev, bool enable_job_int)
 {
+	guard(rwsem_write)(&pfdev->reset.lock);
+
 	panfrost_gpu_soft_reset(pfdev);
 
 	panfrost_gpu_power_on(pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index a0b9a2145fc9..63452febb1cf 100644
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
index 00fb36c577df..c2b1f1087e21 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -877,6 +877,7 @@ int panfrost_jm_init(struct panfrost_device *pfdev)
 	INIT_WORK(&pfdev->reset.work, panfrost_reset_work);
 	spin_lock_init(&js->job_lock);
 	mutex_init(&pfdev->sched_lock);
+	init_rwsem(&pfdev->reset.lock);
 
 	js->irq = platform_get_irq_byname(to_platform_device(pfdev->base.dev), "job");
 	if (js->irq < 0)

-- 
2.55.0

