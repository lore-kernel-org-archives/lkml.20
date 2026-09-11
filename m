Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F804078FE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169368; cv=pass; b=n/1cw7b41+1idKxi6NIvBDLqRCe3Q4AKXKa2DCR0+o14Q/CC8R6h5ovQ0BxOHswi4x767p5ztjVS+wQcbp2QnEfXwM3Aqv41Zmp45w9JDQO2whhE5H6DMAQ/Z1xhlw3kwijo/QAdEDgFXNZ+aWRz9DM8/XFVpJFsMItzo5lnUBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169368; c=relaxed/simple;
	bh=gaC0+1O8X+1ekPx2yyjs3TML4ntPpS6VV87kI6pMefI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3/hIU0FSbWBHskRlebs6yhaxFJgOccgLWhkH6qjoP4oUF7KbAmJoJq0hmzAOHFzSQ7tmDm+zx7Y582F4MdjPrajppo9BrVW3Dfzqqaw/w+Bjbf/GWLo67/7Ju/XzBmPGU9qmiKjBf/1pKPN/CPjkuEdNYdMjVivcSUHDXYCu/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=StVb9KBh; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="StVb9KBh"
ARC-Seal: i=1; a=rsa-sha256; t=1789169329; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TKXgiz4a/kyp1EK/09qafkxSsVlY/VG7RdznjzYGt3WUrwStbA0kxORuxwPyJhi+wkQNGUxvoRcH0XT5l0Qafgr/PFKjrX+G1rBxNo/mVAZQsHwvxHZGf2fDqCDhcDj7uv7piYK6KRakhcNfdXcFvK2AzbwPIpBHEJ+6bGnFYLI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789169329; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=m5YBCA6R4tWevPKLl5rXoiYD7PwSuvUlN1mPDxXHfsU=; 
	b=ZJI1oBNd4u/SMVo5p/VHOMVF7W8Eapa3D9P2Op9RqVI7+tXgDAfzMmfpyXmaI2YQgmrkQasR13W1QdFFpooCkfgwg26GY3gyOMUlBZv/RZQs9F0w1kF+CFdQ6M2+8763Og0kOxGAhFEFbyl1R++oHzzEr3U/AteNRHkbSYaoK0E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789169329;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=m5YBCA6R4tWevPKLl5rXoiYD7PwSuvUlN1mPDxXHfsU=;
	b=StVb9KBhtTZMyob35Y1ciXD+zC6gB5JHFOEL1us5RdXvhKKdpNiDqTVWimAFX9Wh
	tnBCtZjtQB2LTbWArZtUUEI5/1QBnUqBpdFYa6n0BTgSlg1Y3IzGvc2fGqjDyhXFu18
	iFVNAQh/2srsB+lV35PAwclClf9jLTMiGa9dgnE0=
Received: by mx.zohomail.com with SMTPS id 1789169329619630.4904003755993;
	Fri, 11 Sep 2026 16:28:49 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Sat, 12 Sep 2026 00:28:09 +0100
Subject: [PATCH v9 08/16] drm/panfrost: Move all DRM device initialisation
 into device_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260912-claude-fixes-v9-8-e588feaa61ef@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5230;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=gaC0+1O8X+1ekPx2yyjs3TML4ntPpS6VV87kI6pMefI=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqpI6DYxj2uT2NkjtdVOc9A8DzzDSLhn0tq11O0
 RHXxhsp+beJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaqSOgwAKCRAOJn5M7lND
 PQkGDACUgGh/jayESIpsoynI0UDuKxzaR9MDkREAfKNsRIwFSmC+iC80F7aJrr0eJC01Q3BR9NR
 6M/6aykFoq4oXZuE1LBNvtBjbzWw2POvJ6jIHDhegGiP7YHMC5SgDPSs2ZO1SmTmSZfDt+4HFwL
 cJBnepyeXeOcB1Yf36wkquOhy2I0tsKAJgunBd2+AfUtafni/oM72bK9U24N3/KIXO2Ec1RMTSX
 b6ja11Jv2zbSB1G2fYV3VgMsN8d08DGKJjCJ/jAK0rV3aS49wRCucr6jglrmGIO91IwMtTBxcgV
 uNGIl3LnP8z73FJT3HaMbO90gnsWiQ8uoBdS4Vk2WcQkhe6j8rrnfxCgSAlHqgMHBeFEXSVDCE9
 rWCGL9txL974B3NOaMaN/n/RyX7G3hfE2AgwcdvtN3Vjbxd5ppISK4/U9h2etkOEm2vkmoAP056
 8VBnqG7f+tIM099pjK6b12bZsxiETC2Igsz7DQqMxikGgCpva8P3BhCRZR6OfdxdQlqsM=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Ideally the probe() function will do as little as possible, and all device
initialisation and registration should happen inside the panfrost device
subsystem, just like it's done in Panthor. This also simplifies resource
unwinding in the error path.

Do the same thing for DRM driver remove, as in, sweep most of the action
into panfrost_device_fini(), just like we did for device probe.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 37 +++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 47 +-----------------------------
 2 files changed, 38 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 2fcbd223204c..ec2b1d29a26c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -8,6 +8,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <drm/drm_drv.h>
 
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
@@ -230,6 +231,12 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 {
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
@@ -291,8 +298,31 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	if (err)
 		goto out_perfcnt;
 
+	pm_runtime_set_active(pfdev->base.dev);
+	pm_runtime_mark_last_busy(pfdev->base.dev);
+	pm_runtime_get_noresume(pfdev->base.dev);
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
+	pm_runtime_put_noidle(pfdev->base.dev);
+	pm_runtime_set_suspended(pfdev->base.dev);
+	panfrost_gem_fini(pfdev);
 out_perfcnt:
 	panfrost_perfcnt_fini(pfdev);
 out_job:
@@ -316,6 +346,13 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 void panfrost_device_fini(struct panfrost_device *pfdev)
 {
+	pm_runtime_get_sync(pfdev->base.dev);
+
+	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
+	pm_runtime_disable(pfdev->base.dev);
+	pm_runtime_put_noidle(pfdev->base.dev);
+	pm_runtime_set_suspended(pfdev->base.dev);
+
 	panfrost_gem_fini(pfdev);
 	panfrost_perfcnt_fini(pfdev);
 	panfrost_jm_fini(pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a3eff77add55..f77780c72a1a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -830,7 +830,6 @@ static const struct drm_driver panfrost_drm_driver = {
 static int panfrost_probe(struct platform_device *pdev)
 {
 	struct panfrost_device *pfdev;
-	int err;
 
 	pfdev = devm_drm_dev_alloc(&pdev->dev, &panfrost_drm_driver,
 				   struct panfrost_device, base);
@@ -839,46 +838,7 @@ static int panfrost_probe(struct platform_device *pdev)
 
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
-	pm_runtime_set_active(pfdev->base.dev);
-	pm_runtime_mark_last_busy(pfdev->base.dev);
-	pm_runtime_get_noresume(pfdev->base.dev);
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
-	pm_runtime_put_noidle(pfdev->base.dev);
-	pm_runtime_set_suspended(pfdev->base.dev);
-	panfrost_device_fini(pfdev);
-err_out0:
-	return err;
+	return panfrost_device_init(pfdev);
 }
 
 static void panfrost_remove(struct platform_device *pdev)
@@ -887,11 +847,6 @@ static void panfrost_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(&pfdev->base);
 
-	pm_runtime_get_sync(pfdev->base.dev);
-	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
-	pm_runtime_put_noidle(pfdev->base.dev);
-	pm_runtime_disable(pfdev->base.dev);
-	pm_runtime_set_suspended(pfdev->base.dev);
 	panfrost_device_fini(pfdev);
 }
 

-- 
2.55.0

