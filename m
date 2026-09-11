Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150431195B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169397; cv=pass; b=fbzmSDmGkCQkWcAz/94z8giCqTFumvsshoGwRs/oic904uhjj93zn/8GCLyAhoqDo/pcPrTP1V3MYUjol+vkOI9+jDS6+bkEs1JRMQyZG6uwq66rmlQiNpZ2IHyw0cMq10BT7GFLhrCUcdSl7yyutMkuGmGVy8FAODJfPuUYHrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169397; c=relaxed/simple;
	bh=t94C+i+77bqQPIc1YPjouSk75NmnND6AUXctkHleKTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNrtI/EgYBBsoX2YtQ4afJU779Xx8Uy81nnxZa2+74vNcArgrNYUXCJj2CJjAOKo3l1EJdBI43AH9Z/rQXoIoSNp/lOkswwsj+AaobT3epaEFXCQt9p5KINGGJRSUrY8QgQs+2Ji/hjEWI/FwQc8NKNmVpVzAlFuxCcff9DfHvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=deEDQVNG; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="deEDQVNG"
ARC-Seal: i=1; a=rsa-sha256; t=1789169361; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LjmUHnkRDM8yI16OFC0Wyj7DTerF4pF3tg2JE/PP+r8Gx7ObSnh6rCfgLGnW1/2MRxJ3UOts3wueEbcqNqELjgWHcOuUmcIbSK4KPIOF1QE9qw5D1SYK5lncIer+Qgd2ghJBRUjWmt6jaelSS07jmGC8jiNePbzYBIscI8rdQEI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789169361; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qdvTWGJf7ebWGniVJ+6e0Uei/MWMYa+gp7uu3laVU9g=; 
	b=SQPXd++g2tQxpE20KYvJXlOSdXVf+2pfbCb35AEindsWR++K85vahCs/AClO28CxoEi+zGwqFjh2+H14kkV40scZ5aLlIUxfLbipwGV188ryi7UL2Ffvxb17DrTSwxmVam4Ba2jwtZ5sYIq5zPeLWNPCwzdNtvS8T9YFmq+PgbE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789169361;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=qdvTWGJf7ebWGniVJ+6e0Uei/MWMYa+gp7uu3laVU9g=;
	b=deEDQVNGw8lYX0NApiMeZLuojkCjvrsEj7Bj4queXAEKJj47zDAFv6Wg/oJcn7+L
	bsxjIIPDBc+h9AdX4YjJhaG6c4Xfmxn0S35/x0WuOgNVhX3OuZIorDZyZYpyrq/Iz8S
	i0hBDGJPpLAbaFQqwdFCjUhPncgvR1+a7Skx2zgY=
Received: by mx.zohomail.com with SMTPS id 1789169359857260.3754325489339;
	Fri, 11 Sep 2026 16:29:19 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Sat, 12 Sep 2026 00:28:15 +0100
Subject: [PATCH v9 14/16] drm/panfrost: Introduce a reset lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260912-claude-fixes-v9-14-e588feaa61ef@collabora.com>
References: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
In-Reply-To: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
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
 bh=t94C+i+77bqQPIc1YPjouSk75NmnND6AUXctkHleKTg=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqpI6EGynfLHzZx5xj/VjCS+UiBXpp7br2fIYN9
 cI+Lp1JZPiJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaqSOhAAKCRAOJn5M7lND
 PSOsC/497Y/7vwDh+YlRLreZlg0fL56h5YDE5MA6K2xwrZYe9PLsLqzk6b7VD5OI0TilbTq28XM
 D6MlCbISLbcZsNgP9i+eU4zUu2LaX+RdjOv6SmnfnNEdha/v/rUt1SPMAZ01eSI0VcFnbVVIKtC
 vajXc5llBdzrepRDTKh4ePKD7i6x7jHpqgw4r5zvzFOtzl7kz36Xq1/AJOQjkw3cC0+l/QfBjiu
 j7TKZR4mig7gTnLKBWt+BWJnq3dX0paCqjnircJNkw3YSNMFgdaZB4SK050QcXqHCzdZha++Ja2
 WO9ObD26q3BchJ6IqsMzDoO5apyNrmg6VHkwLkZCkPfPGj3/20ojImakVmh3KptssNKVkuxuX2h
 6un6kniOT0AD9dhMec5gO7sw9uTeECJ2gA39tGaKq8dROBk8Lafo+5QB2aSdfdCk897gHWBpt9K
 oSubUgs6qWqlMqjGtSmg5FgsqAjfwysuwc2TEw4aDTRsvl0gyscYg4yXhETPemV7MkW/k=
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
index 0aee1d87a7ab..6c65feae63aa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -469,6 +469,8 @@ bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
 
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

