Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8378946EF94
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653564; cv=pass; b=kKg7VzQHbQIo8XkZEUbhGY8G1ahwiCObDV4riojcAY4Goz9p1u1lp4yaU5DRQ0XWuDdJWzzi3ZuF5Yr10LkY7COHWz0CuoDZP1P0Ju4lZ/NcjHRAADor4e7r6DVJRbesD1cybgbSx/MY5rW8GgHXU3jy+ckxdIh+XxKyduslrPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653564; c=relaxed/simple;
	bh=f7AtK5MLeAUCfPkCWWnY8jVHZLXs96cptA6x3dMpXsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6nH9Z86TuHu7muSdVnus9TwLxR4/Blu4j5j6sY+BBq3Ejl/91rdoeMH7RuhqEEyhpNYjSQsGqfV3IlJroXVHq96Epzg9pBO+5ZPwf5qsuwDSqaCC0iakkXmN6KMZiwHItKBVfHZageO7e4tyYCninezoDwJYU7p+Y1r+DCaXMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=eXcbIAb2; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="eXcbIAb2"
ARC-Seal: i=1; a=rsa-sha256; t=1790653536; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lKvdO+k1cK97yNJ5ea5tOvdxhc8xNdbr6Wtn7yyhCm5RViZKDqKEXTbQhABNrpwUQqZLejCE7BejLV2u5jj4vP9/lfbZBMITpfigRVS8LmCd1eq2OYQm/iFcDsac0SrL5KWx+h3izSRl9yH03uKEMRMIPkTWfIjPDrsC3N2ZkCo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790653536; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SamyGAq1nTps3UPpW7W33rjK4xeY0oXwuwjKZ1OD1yw=; 
	b=h2IgT/90sal2euUmGZNzOMcpCLo4tBxmADVhpyw7qz9sH9KG3leiNRbDiarZSiC5tqFuAgODLNd/rkIDUuIlbm2s6HH+OtQfHOtFsFQ+R0x3iZzioIuTtSX5wx1Touuq6tKzyuI+dwivF9+fPJ+vWKNYn1r81ywZP9/LbTjYM74=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790653536;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=SamyGAq1nTps3UPpW7W33rjK4xeY0oXwuwjKZ1OD1yw=;
	b=eXcbIAb2hs3REc0fHQGMwV9aMgeVtzH4E1Yw5O9vfs8/RYL8yf8ar3Jc9/H/2W1g
	AinF4YlSAYv7yy9dg4R0pXCFHSQZbuvXEckRSVq5VTVYwNVKbOO0FTDzKm5Fdrh/M24
	+YObbqQ+6hT0xJNjWf9YZB2hM7tl8BKS7Z7HXqWk=
Received: by smtp.zohomail.com with SMTPS id 1790653536666883.6461767392873;
	Mon, 28 Sep 2026 20:45:36 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Tue, 29 Sep 2026 04:44:42 +0100
Subject: [PATCH v12 08/15] drm/panfrost: Move all DRM device initialisation
 into device_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-claude-fixes-v12-8-62beb08de207@collabora.com>
References: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
In-Reply-To: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6295;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=f7AtK5MLeAUCfPkCWWnY8jVHZLXs96cptA6x3dMpXsg=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBquzQuE3zNyzy1ci2EDsylWdCO0JtvskChhgXus
 n/sQXx1Z96JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCars0LgAKCRAOJn5M7lND
 Pd3LDACwLHkv3VSKtvEoI6bAxuo7M3wNxVBrkpoXCCuWC/+dxH5NpQxGbdOz4Zoz8Avldvv89XJ
 /EuV3zz/qGAZeYg3bz1pgXhqua5VvS/zeB+Fy47DDpqUcIy9Ti8iFOegtnlKez6KGBG4i52OHl3
 lSnRRjSsHq9hng78YYTjj60smTDD7zJi+xnM+nRuYVQCMxk6VihUP5MEX9MJEDzspZ1NQOEXr9S
 GPKkzzlXcPS2z33lYKVP6PSTPMI5bLuyQPTDPMtdQQxQ00AIW9RqE7C7XkHAA05zyJS7Cx256sV
 gk62q+t0VrrEctM9r9hP/0S8QeE3XaWXC69wqBZsFpqEX6CiUMrIBM4OGRT0Gu8E+fALkFK5RVV
 oXKAo3accsbLGC8JthLgoOFgcKDN0yZzi5KVBJbz5K7WBZY4dcQD2hQwmUZfah+0BNUKeEmocXk
 u1nIKwwxIHqOVVe2aQa9+sBVthLZXGenrvX0VGxFNHPFv6j+TDKKY+LL6tswxga2lKEZI=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Ideally the probe() function will do as little as possible, and all device
initialisation and registration should happen inside the panfrost device
subsystem, just like it's done in Panthor. This also simplifies resource
unwinding in the error path.

Do the same thing for DRM driver remove, as in, sweep most of the action
into panfrost_device_fini(), just like we did for device probe.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 49 ++++++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 52 +-----------------------------
 2 files changed, 50 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 9f2b1967a398..c6bf3d0663df 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -8,6 +8,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <drm/drm_drv.h>
 
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
@@ -228,8 +229,15 @@ static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
 
 int panfrost_device_init(struct panfrost_device *pfdev)
 {
+	bool device_initialised = false;
 	int err;
 
+	pfdev->comp = of_device_get_match_data(pfdev->base.dev);
+	if (!pfdev->comp)
+		return -ENODEV;
+
+	pfdev->coherent = device_get_dma_attr(pfdev->base.dev) == DEV_DMA_COHERENT;
+
 #ifdef CONFIG_DEBUG_FS
 	mutex_init(&pfdev->debugfs.gems_lock);
 	INIT_LIST_HEAD(&pfdev->debugfs.gems_list);
@@ -291,8 +299,35 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	if (err)
 		goto out_perfcnt;
 
+	device_initialised = true;
+
+	/* The reason we must manually set the PM status and usage counter is
+	 * we have just powered the device up but did not go through the PM
+	 * runtime resume callback, so we need to update these ourselves.
+	 */
+	pm_runtime_get_noresume(pfdev->base.dev);
+	pm_runtime_set_active(pfdev->base.dev);
+	pm_runtime_mark_last_busy(pfdev->base.dev);
+	pm_runtime_enable(pfdev->base.dev);
+	pm_runtime_set_autosuspend_delay(pfdev->base.dev, 50); /* ~3 frames */
+	pm_runtime_use_autosuspend(pfdev->base.dev);
+
+	/*
+	 * Register the DRM device with the core and the connectors with
+	 * sysfs
+	 */
+	err = drm_dev_register(&pfdev->base, 0);
+	if (err < 0)
+		goto err_disable_rpm;
+
+	pm_runtime_put_autosuspend(pfdev->base.dev);
+
 	return 0;
 
+err_disable_rpm:
+	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
+	pm_runtime_disable(pfdev->base.dev);
+	panfrost_gem_fini(pfdev);
 out_perfcnt:
 	panfrost_perfcnt_fini(pfdev);
 out_job:
@@ -311,11 +346,22 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	panfrost_reset_fini(pfdev);
 out_pm_domain:
 	panfrost_pm_domain_fini(pfdev);
+
+	if (device_initialised) {
+		pm_runtime_set_suspended(pfdev->base.dev);
+		pm_runtime_put_noidle(pfdev->base.dev);
+	}
+
 	return err;
 }
 
 void panfrost_device_fini(struct panfrost_device *pfdev)
 {
+	pm_runtime_get_sync(pfdev->base.dev);
+
+	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
+	pm_runtime_disable(pfdev->base.dev);
+
 	panfrost_gem_fini(pfdev);
 	panfrost_perfcnt_fini(pfdev);
 	panfrost_jm_fini(pfdev);
@@ -326,6 +372,9 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
 	panfrost_clk_fini(pfdev);
 	panfrost_reset_fini(pfdev);
 	panfrost_pm_domain_fini(pfdev);
+
+	pm_runtime_set_suspended(pfdev->base.dev);
+	pm_runtime_put_noidle(pfdev->base.dev);
 }
 
 #define PANFROST_EXCEPTION(id) \
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 907d4a14a0b5..f77780c72a1a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -830,7 +830,6 @@ static const struct drm_driver panfrost_drm_driver = {
 static int panfrost_probe(struct platform_device *pdev)
 {
 	struct panfrost_device *pfdev;
-	int err;
 
 	pfdev = devm_drm_dev_alloc(&pdev->dev, &panfrost_drm_driver,
 				   struct panfrost_device, base);
@@ -839,50 +838,7 @@ static int panfrost_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pfdev);
 
-	pfdev->comp = of_device_get_match_data(&pdev->dev);
-	if (!pfdev->comp)
-		return -ENODEV;
-
-	pfdev->coherent = device_get_dma_attr(&pdev->dev) == DEV_DMA_COHERENT;
-
-	err = panfrost_device_init(pfdev);
-	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Fatal error during GPU init\n");
-		goto err_out0;
-	}
-
-	/* The reason we must manually set the PM status and usage counter is
-	 * we have just powered the device up but did not go through the PM
-	 * runtime resume callback, so we need to update these ourselves.
-	 */
-	pm_runtime_get_noresume(pfdev->base.dev);
-	pm_runtime_set_active(pfdev->base.dev);
-	pm_runtime_mark_last_busy(pfdev->base.dev);
-	pm_runtime_enable(pfdev->base.dev);
-	pm_runtime_set_autosuspend_delay(pfdev->base.dev, 50); /* ~3 frames */
-	pm_runtime_use_autosuspend(pfdev->base.dev);
-
-	/*
-	 * Register the DRM device with the core and the connectors with
-	 * sysfs
-	 */
-	err = drm_dev_register(&pfdev->base, 0);
-	if (err < 0)
-		goto err_out1;
-
-	pm_runtime_put_autosuspend(pfdev->base.dev);
-
-	return 0;
-
-err_out1:
-	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
-	pm_runtime_disable(pfdev->base.dev);
-	panfrost_device_fini(pfdev);
-	pm_runtime_set_suspended(pfdev->base.dev);
-	pm_runtime_put_noidle(pfdev->base.dev);
-err_out0:
-	return err;
+	return panfrost_device_init(pfdev);
 }
 
 static void panfrost_remove(struct platform_device *pdev)
@@ -891,13 +847,7 @@ static void panfrost_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(&pfdev->base);
 
-	pm_runtime_get_sync(pfdev->base.dev);
-	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
-	pm_runtime_disable(pfdev->base.dev);
 	panfrost_device_fini(pfdev);
-	pm_runtime_set_suspended(pfdev->base.dev);
-	pm_runtime_put_noidle(pfdev->base.dev);
-
 }
 
 static ssize_t profiling_show(struct device *dev,

-- 
2.55.0

