Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5953FF1A5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653537; cv=pass; b=EPg92uDHdRbjpY1/bKzdWx1pQKooT2/olRkGHjeOLUJcBgHzV9XiSP/rA+crd3yenKoWpe/lbS0YVge3pDDmqrFw9B0ARRy0nuEXIo4scSYnNOWFMo95ZqyLnG8UQYw9AuhDiWlFeiBp7VNpqhLqxJUcxA+fRXn3Tyk8jZdI2Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653537; c=relaxed/simple;
	bh=BseDd5ptshL8O0X6ZZAknqhIzPZMy2A4L4RfHDWk90U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWxOzSAz6XXZQKX7XgjM4CQusa2zhhnM7W1PKdVIN2VyQ6anFBP3ZY0GMtVdK5MPfjJ0fRDAv90BMun1krhQwvnyW9zNi7mAmx5XgLXaz/yKg9URIPymTgZZDlXHlneIMt6cgYOhKetpBTChJNbBC65uULekXWZ6gv0X7FkTTvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=T/InYKuv; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="T/InYKuv"
ARC-Seal: i=1; a=rsa-sha256; t=1790653504; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EIhvIsCjpUpHMl6up/SqOClj997+Q63LiI+LFPCLfQzG9e+nDN7i48ITtA8Aajv/uykeWSkVn7rGP45BDZAkg0/BUouv0OrcnJt6UJG0RrJzinJ10vyhCDLViy64jALIqebjYqDOwS0fRvDTafgIt98DJnkK+oLLMc4GdjdLKfY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790653504; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LZw4Kt2mQuWgyKmlrDPFTNJYeu3IN02ygsBncDd+4ds=; 
	b=jZxzeUXK7paGbyI9m2LaokZ8xzfdwe4d2Udgm6jBwtm1OgBT0/5RDGE7yqySwD/RjVP10r4i7bPGctzvmnyqqOQKlbgAWLDTImgYhwjCTLEozosbIT0yg6TsyLwoC5NBhTh3usnKaDxhzuBlvjpghcKZ4EYZc1qCyykVAVQe3mw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790653504;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=LZw4Kt2mQuWgyKmlrDPFTNJYeu3IN02ygsBncDd+4ds=;
	b=T/InYKuvloZ9M5tgfScFdgc2KA+z2KRg1FtGcUH/Y+FbCNqWqeX/FDv95fHpSxpK
	azJDAC+z0hDVS6FJGI2PjuYnfRNXhC4nVhyVWRv6p2zYeZtf560TN0BBSfzyHFsK/zo
	+FQCaR7r1sVE83ebovGNa2Nl45mbO4bMCFIVC/rQ=
Received: by smtp.zohomail.com with SMTPS id 1790653504056742.1857575832111;
	Mon, 28 Sep 2026 20:45:04 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Tue, 29 Sep 2026 04:44:36 +0100
Subject: [PATCH v12 02/15] drm/panfrost: Move lock and modparam
 initialisations into their subsystems
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-claude-fixes-v12-2-62beb08de207@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7189;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=BseDd5ptshL8O0X6ZZAknqhIzPZMy2A4L4RfHDWk90U=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBquzQtAnXIJiLdWS7hzCJbsneL17KK88NA7IUw/
 ByLjwPowymJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCars0LQAKCRAOJn5M7lND
 PataC/9ecfdXGfHGhvI4QD5byDiIkXDgpD9j8TQrH1uPhqXYn1m51TlXYDOf/QUr5tMBIeesHGo
 E38vKyTDFTU6shRDgTPjPpe0NRblZMCoKlNF/KlHtX4s9jqtHbhyXivuIaRt6p4Ch3VClcLkw3y
 pFSXF7Hv3mSpv1Deofn8HaSc5gbZ9vA0ujQ9NNGdXwYqyoTxLpVgL29ltpbHw17EDrBu6hSB3iH
 12yujzgB5XjOKfOpjOuiArhHDGej1YuciakWM14S26BdQ1FB+5jHoT4dRzT0fHe5mVbAWfiAzl7
 7WfKCzW6G20QreuBVgiiM1lzUi9B43lrzMrJGWiSAmKlGnI+F3ChR48Yl5UNtWdjaxAyQahJXR4
 ulb9RLsHC40/4kHAc48AfiMMKZ2o+Srm4C1A8tUgDtR0S9M3to7SUtDH/FzZO7VuJAlynxN6YJa
 43r9vvWo0xRgmwHFk121CVOH6IJvpsVL++Ljaqk7E4DR8X9mHbaweYdKeL6KYwH5UeeP8=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

The device init function feels a bit cluttered with things that should be
done in the specific subsystems where those locks and lists are being
used. Same goes for module parameters, it's best to limit them to the
subsystems where they're relevant.

Then we can also discard panfrost_drv.h since the transparent_huge_page
doesn't need to be accessed elsewhere. We can also simplify the
creation of a mount point, because drm_gem_get_huge_mnt() would never
return NULL if drm_gem_huge_mnt_create() returns 0 when kernel is built
with support for transparent huge pages.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c       |  7 -------
 drivers/gpu/drm/panfrost/panfrost_drv.c          | 10 ----------
 drivers/gpu/drm/panfrost/panfrost_drv.h          |  9 ---------
 drivers/gpu/drm/panfrost/panfrost_gem.c          | 19 +++++++++++++------
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c |  3 +++
 drivers/gpu/drm/panfrost/panfrost_gpu.c          |  2 ++
 drivers/gpu/drm/panfrost/panfrost_job.c          |  1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c          |  3 +++
 8 files changed, 22 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 05c40d5a20b5..c1a2e93a2b9b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -216,13 +216,6 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 {
 	int err;
 
-	mutex_init(&pfdev->sched_lock);
-	INIT_LIST_HEAD(&pfdev->as_lru_list);
-
-	spin_lock_init(&pfdev->as_lock);
-
-	spin_lock_init(&pfdev->cycle_counter.lock);
-
 #ifdef CONFIG_DEBUG_FS
 	mutex_init(&pfdev->debugfs.gems_lock);
 	INIT_LIST_HEAD(&pfdev->debugfs.gems_list);
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 9882a3ede75f..59af79a534fa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -21,7 +21,6 @@
 #include <drm/drm_utils.h>
 
 #include "panfrost_device.h"
-#include "panfrost_drv.h"
 #include "panfrost_gem.h"
 #include "panfrost_mmu.h"
 #include "panfrost_job.h"
@@ -955,12 +954,6 @@ static const struct drm_driver panfrost_drm_driver = {
 #endif
 };
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-bool panfrost_transparent_hugepage = true;
-module_param_named(transparent_hugepage, panfrost_transparent_hugepage, bool, 0400);
-MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount point with Transparent Hugepage enabled (true = default)");
-#endif
-
 static int panfrost_probe(struct platform_device *pdev)
 {
 	struct panfrost_device *pfdev;
@@ -979,9 +972,6 @@ static int panfrost_probe(struct platform_device *pdev)
 
 	pfdev->coherent = device_get_dma_attr(&pdev->dev) == DEV_DMA_COHERENT;
 
-	mutex_init(&pfdev->shrinker_lock);
-	INIT_LIST_HEAD(&pfdev->shrinker_list);
-
 	err = panfrost_device_init(pfdev);
 	if (err) {
 		if (err != -EPROBE_DEFER)
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.h b/drivers/gpu/drm/panfrost/panfrost_drv.h
deleted file mode 100644
index a2277ec61aab..000000000000
--- a/drivers/gpu/drm/panfrost/panfrost_drv.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 or MIT */
-/* Copyright 2025 Amazon.com, Inc. or its affiliates */
-
-#ifndef __PANFROST_DRV_H__
-#define __PANFROST_DRV_H__
-
-extern bool panfrost_transparent_hugepage;
-
-#endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index f39c0f50ed4f..383ac8cd5645 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -11,20 +11,27 @@
 #include <drm/panfrost_drm.h>
 #include <drm/drm_print.h>
 #include "panfrost_device.h"
-#include "panfrost_drv.h"
 #include "panfrost_gem.h"
 #include "panfrost_mmu.h"
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static bool panfrost_transparent_hugepage = true;
+module_param_named(transparent_hugepage, panfrost_transparent_hugepage, bool, 0400);
+MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount point with Transparent Hugepage enabled (true = default)");
+#else
+#define panfrost_transparent_hugepage false
+#endif
+
 int panfrost_gem_init(struct panfrost_device *pfdev)
 {
-	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && panfrost_transparent_hugepage) {
+	if (panfrost_transparent_hugepage) {
 		int err = drm_gem_huge_mnt_create(&pfdev->base, "within_size");
 
-		if (drm_gem_get_huge_mnt(&pfdev->base))
+		if (err)
+			drm_warn(&pfdev->base,
+				 "Can't use Transparent Hugepage (%d)\n", err);
+		else
 			drm_info(&pfdev->base, "Using Transparent Hugepage\n");
-		else if (err)
-			drm_warn(&pfdev->base, "Can't use Transparent Hugepage (%d)\n",
-				 err);
 	}
 
 	return panfrost_gem_shrinker_init(pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index fefae87535d6..72cd7a165e6d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -97,6 +97,9 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
  */
 int panfrost_gem_shrinker_init(struct panfrost_device *pfdev)
 {
+	mutex_init(&pfdev->shrinker_lock);
+	INIT_LIST_HEAD(&pfdev->shrinker_list);
+
 	pfdev->shrinker = shrinker_alloc(0, "drm-panfrost");
 	if (!pfdev->shrinker)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 7d555e63e21a..8a15ccce08e9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -516,6 +516,8 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
 {
 	int err;
 
+	spin_lock_init(&pfdev->cycle_counter.lock);
+
 	err = panfrost_gpu_soft_reset(pfdev);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index d59b4863b8ad..476c936b54e6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -874,6 +874,7 @@ int panfrost_jm_init(struct panfrost_device *pfdev)
 
 	INIT_WORK(&pfdev->reset.work, panfrost_reset_work);
 	spin_lock_init(&js->job_lock);
+	mutex_init(&pfdev->sched_lock);
 
 	js->irq = platform_get_irq_byname(to_platform_device(pfdev->base.dev), "job");
 	if (js->irq < 0)
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 4a3162c3b659..5c393ed6e310 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -955,6 +955,9 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
 {
 	int err;
 
+	INIT_LIST_HEAD(&pfdev->as_lru_list);
+	spin_lock_init(&pfdev->as_lock);
+
 	pfdev->mmu_irq = platform_get_irq_byname(to_platform_device(pfdev->base.dev), "mmu");
 	if (pfdev->mmu_irq < 0)
 		return pfdev->mmu_irq;

-- 
2.55.0

