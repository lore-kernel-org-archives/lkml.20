Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF13361963
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779144; cv=pass; b=Hpb92eWPHlGXD4zWUFe/ErnYbFvs/HwV4dnAfQ/iAX4HeOHhQvvnEjJKMungpqqffumuVxVwSSNOwuM5xdG17PbJNZmo5ZmDqWPoQgO5LWntmLL0JO53Qg/Lxnyru4oJ0f3Xa2tj4kS9J5DbFm6BGn4+KmTZmCAtIj9WhNhrb18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779144; c=relaxed/simple;
	bh=+7lLC3RASscJtzYIoHPamAqwjiOy0dTWtgEK2tQLZCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATO6uZAfSy4Ui5DU2/xcx6SBcoF3vo381ZU74e7clk98fvx1Zd2QZI27wS4pSOIpRbhtnTmIYd5/n9ICsG5PIxobJcLSqI5oLetn9UxONN6Wa9hpt7FnZprL8pjF1HtlR8F4Z1oNThQ9ptZOyJLGIqzDlHJPbEgfRY5OIkQBEDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=lIz+CAfZ; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="lIz+CAfZ"
ARC-Seal: i=1; a=rsa-sha256; t=1787779104; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CdB28Mk/vunbih+z3b6/QxjB1zjtv3r9RyY6cQ/4XQpzNd+5nLv9GdVIj2x+Os0ltlnNhGBAkiv0591PyabSMPbbQ3ff8EBZjaLiFG5wmk/m1wZiTHQQp4PXEAlNv1SQtcpyqbNyMagXMw06Z3YBwulhuGCOmIyXQQnsOq9KjIs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787779104; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KTjS5hBPQO6+RTeil7zhPBG8q7IaCwN0MeCCodQTYuk=; 
	b=ZudoOIJJQpvSLY8/lwY0iBAHKLoRY8ZL8Yz004TSq/imuauBwPdj5h26dwsvjcN3ZHTKjbMsRRQfg8WPfjIQye52I/POQOg7MMwlqInZ4qeOuPnUEBN9cqX61qij1S6Zg8zLFQzCsI90MmKxYSNqMmLKmJTB1xe0h3qBYXbdvGg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787779104;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=KTjS5hBPQO6+RTeil7zhPBG8q7IaCwN0MeCCodQTYuk=;
	b=lIz+CAfZxH8xyXbwhxgOfjT7oPR/CM5Ak7a5MlRn0k/iPVEpBf1vR+/PHg1ya5kG
	GfNrphv6mlKd5/4UheL1n+6WdEUEyiihdz5Y9reBU1CuNFHJIFE09794hpH2QzCcKrn
	DOsuixE7MKpPXYsH/VoquH7TYLd/IzpWAJ9kmH2Y=
Received: by mx.zohomail.com with SMTPS id 1787779102829956.5009696482655;
	Wed, 26 Aug 2026 14:18:22 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Wed, 26 Aug 2026 22:18:04 +0100
Subject: [PATCH v6 02/16] drm/panfrost: Move all DRM device initialisation
 into device_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-claude-fixes-v6-2-78119af409e7@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5174;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=+7lLC3RASscJtzYIoHPamAqwjiOy0dTWtgEK2tQLZCc=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqj1gLdvrLyXJhJ4BggXx8G1014OtUEDJyP1fvc
 0u5W7ppf+OJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCao9YCwAKCRAOJn5M7lND
 PX/uDAC2pR06/NS3OJm4JXFbzaIBLfxTsO0pc84GJNbkzh+3JPCeN5XnpfCSfqPWsAGYmEzVAsI
 NKvY5C/L1jSL/dTSwtHo5nLfH04RMw4O+Sxsooj3S8sU15qX23UFedXB4bggfKPM+O0XT9FKvOa
 Tz8ZTUR0WUh6d09Mcc7SEO++PVt8KGaxoPBz5T9/USUg721VWES3q86XYHeIWusS2uE8DmqF9t0
 6CoEv/tDNJmXobmsrCtHyvdzhm8qZ+LlpoUrU38HOE48BhXCu8thpnstob4ux+ALQQDm7zuXmPi
 j+QLav2X7fox9QEFn5khFDxz8qSa2Zr+D0cI1GaisgdHuHPzvPlCIWI1/3+eX+9Ki6ek+83mxGX
 LJBXZh7lVNx2G0zr3mQ9dp6BDZRhTeLChjvYSeajfFGR+TxqvraE5txvZrpvWu6OcmDMNPqURSu
 bac/i4X5J5OiY5Qcj/GCzaXF2dzD2/mfLZahVJdvk28jJNTB2n40RuF0JecF4rj560kgg=
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
 drivers/gpu/drm/panfrost/panfrost_device.c | 33 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 44 +-----------------------------
 2 files changed, 34 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 05c40d5a20b5..d2d2830f11a7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -8,6 +8,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <drm/drm_drv.h>
 
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
@@ -216,6 +217,15 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 {
 	int err;
 
+	pfdev->comp = of_device_get_match_data(pfdev->base.dev);
+	if (!pfdev->comp)
+		return -ENODEV;
+
+	pfdev->coherent = device_get_dma_attr(pfdev->base.dev) == DEV_DMA_COHERENT;
+
+	mutex_init(&pfdev->shrinker_lock);
+	INIT_LIST_HEAD(&pfdev->shrinker_list);
+
 	mutex_init(&pfdev->sched_lock);
 	INIT_LIST_HEAD(&pfdev->as_lru_list);
 
@@ -284,8 +294,25 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	if (err)
 		goto out_perfcnt;
 
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
+		goto out_devreg;
+
 	return 0;
 
+out_devreg:
+	pm_runtime_disable(pfdev->base.dev);
+	panfrost_gem_fini(pfdev);
 out_perfcnt:
 	panfrost_perfcnt_fini(pfdev);
 out_job:
@@ -304,11 +331,15 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	panfrost_reset_fini(pfdev);
 out_pm_domain:
 	panfrost_pm_domain_fini(pfdev);
+	pm_runtime_set_suspended(pfdev->base.dev);
 	return err;
 }
 
 void panfrost_device_fini(struct panfrost_device *pfdev)
 {
+	pm_runtime_get_sync(pfdev->base.dev);
+	pm_runtime_disable(pfdev->base.dev);
+
 	panfrost_gem_fini(pfdev);
 	panfrost_perfcnt_fini(pfdev);
 	panfrost_jm_fini(pfdev);
@@ -319,6 +350,8 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
 	panfrost_clk_fini(pfdev);
 	panfrost_reset_fini(pfdev);
 	panfrost_pm_domain_fini(pfdev);
+
+	pm_runtime_set_suspended(pfdev->base.dev);
 }
 
 #define PANFROST_EXCEPTION(id) \
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 9882a3ede75f..80996e311a9d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -964,7 +964,6 @@ MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount point with T
 static int panfrost_probe(struct platform_device *pdev)
 {
 	struct panfrost_device *pfdev;
-	int err;
 
 	pfdev = devm_drm_dev_alloc(&pdev->dev, &panfrost_drm_driver,
 				   struct panfrost_device, base);
@@ -973,45 +972,7 @@ static int panfrost_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pfdev);
 
-	pfdev->comp = of_device_get_match_data(&pdev->dev);
-	if (!pfdev->comp)
-		return -ENODEV;
-
-	pfdev->coherent = device_get_dma_attr(&pdev->dev) == DEV_DMA_COHERENT;
-
-	mutex_init(&pfdev->shrinker_lock);
-	INIT_LIST_HEAD(&pfdev->shrinker_list);
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
-
-	return 0;
-
-err_out1:
-	pm_runtime_disable(pfdev->base.dev);
-	panfrost_device_fini(pfdev);
-	pm_runtime_set_suspended(pfdev->base.dev);
-err_out0:
-	return err;
+	return panfrost_device_init(pfdev);
 }
 
 static void panfrost_remove(struct platform_device *pdev)
@@ -1020,10 +981,7 @@ static void panfrost_remove(struct platform_device *pdev)
 
 	drm_dev_unregister(&pfdev->base);
 
-	pm_runtime_get_sync(pfdev->base.dev);
-	pm_runtime_disable(pfdev->base.dev);
 	panfrost_device_fini(pfdev);
-	pm_runtime_set_suspended(pfdev->base.dev);
 }
 
 static ssize_t profiling_show(struct device *dev,

-- 
2.55.0

