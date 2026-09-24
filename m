Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8321E4A6CFC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273492; cv=pass; b=meO+qCbzC+Zk2XmglUVenOD0OWrqPRcmi5eATmNhYJ2H1RZYS6q5xkGd67LHWdhskFE82ldEgi85ZnyikQJwsns1tfm5n7AEnuuXelcirtq8lYcgU+05SN9M28ODLgnaXEkRrEHbsy03MzTO32PlwlhMIEQTm9oHLunnYL2nmXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273492; c=relaxed/simple;
	bh=lC6Y5eZm/uMZrlAIi3lGByC1w461KxkiA3Reum0Cxyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gtNE0VTeXP6KQWrotwQ3TgEjU66IGaQWcteyUUNRek9t+eNIY8oE9mrSv8H1GBE/rDqBca/G0u3rxoCQaHiCxfvaIjunS6RA6WkEEDuP6PI2lAgPy3nv9p9e92K9CuIDeG8dZz4YEMM8VuAN2LM4Gl8mD3VfK+4VGBTBlLxOqJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=KYQsZbsC; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="KYQsZbsC"
ARC-Seal: i=1; a=rsa-sha256; t=1790273459; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b4TpBQRq2OpvCkf68GK7Ic0ttPHVfyhHzDPLD21HDxc6srjn6KRwrTGif9hLAQTmt2glieEJ5qqt5/CIT1owwvtGZ4hVBaSz55eKcMo6Id2mggraZ4QyZ1wrLl1Y7KCs9VpdyypoRodIShgYYtwVLgKy0bmy7ci59yXCfzXG5BE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790273459; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BHKexhH9+GVjIT9SqmYjvfoX5uAseU6q/THZLuja+Ac=; 
	b=ituBu4tmZ8IHx+UWIOqTh6rlsnts8eWlEtErI95WchItYoB7VBdLN7VhZUmmn2IH5YcB9e2HtI90v18QpkXZsBQyg36o7HFM3Ehk3x9y+B+Z/FnGhRJCP/LXO1Rx0+Ux0znOUd+Y1vUETKe43W3BxkX6sQQcOGI5TpFp1LtJHK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790273459;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=BHKexhH9+GVjIT9SqmYjvfoX5uAseU6q/THZLuja+Ac=;
	b=KYQsZbsCkY94r4BtU8r4eEsn1G3feVYSsesWdheWqKtEFDHumIFIie2C5hdcukCA
	znXO2Mf/uvF6SzoHEQmAs8KuhZczQOUUoF85jdW9QBkzIXMZpDAGID2/0KMmUAQx0bq
	Lqkof9Gv0LWmFez+oMjwHZvoJBS4MozJXiaAB8sY=
Received: by smtp.zohomail.com with SMTPS id 1790273458499988.3211694048925;
	Thu, 24 Sep 2026 11:10:58 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Thu, 24 Sep 2026 19:09:31 +0100
Subject: [PATCH v10 14/15] drm/panfrost: Introduce a reset lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260924-claude-fixes-v10-14-755929b3cc19@collabora.com>
References: <20260924-claude-fixes-v10-0-755929b3cc19@collabora.com>
In-Reply-To: <20260924-claude-fixes-v10-0-755929b3cc19@collabora.com>
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
 bh=lC6Y5eZm/uMZrlAIi3lGByC1w461KxkiA3Reum0Cxyc=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqtWdZ6bMw0w1li37Mc53e8LREqxJlXRi4h2cNX
 KIod6LgCEiJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCarVnWQAKCRAOJn5M7lND
 Pe/EC/4lX6J/d/H8kFdS1ty/HGCiSnyIF8xyW+QLM0Cr/shKbeZBCRUI1REWYamHami2Ufhtkgo
 btwM+dv29YApcNEwVddYQ9EzCu1w6nylZBQrFCCd5AZH0Mx2aE0n3XBA1n0nVmCr/VmjERJ2T9i
 ZTvqcxviYtYnqCwFlhHFQ2mGaXnKaEPM3KhXvjvz7HYHU4ED9oC/jMunIAJO/0g9H4w7okKZkow
 GzfUZklJ48oo+fV+j1ZJJWIMEVd5IFx8c2oBsNaLt83TlAhlZAZh4K5eYEozmYKdBNjhJoCKtNG
 7S12uM3t2ZCwxh2wbfnRDRFo1+zDq4XkTyF+sE2UjUME4TQWGbbGF4te5+OP7VSicaq+OZSlLOB
 KuTPpzpFwRyxgvGGPYd+kdDBei3rXuSJ+KZzySOSIANJdCdk2usERaLU+flBjnr7TpksZ3k3WHo
 Rx9ecTfo4qpxWzE67lt+3TPYnfI2W5B3Im0Y/bMBmgKgIe2tR1NndvMgVKu/0vkyvGE5Y=
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
index fd5046b363e9..801ca07ccb28 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -473,6 +473,8 @@ bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
 
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
index ab65786bf63b..4ddf4b722ddf 100644
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

