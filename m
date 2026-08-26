Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777E548989F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779149; cv=pass; b=pj1uFYlZ4cOH1mrZ6DwOZacSEfmNaUOdfoEEimdaRpXzVanNtBCPNMp4ElzZt4iO50uRYGKV2zFpncGWX5p/0LduTnfS6E4SgwGmDYssJ7Do9ZRDnMGza9B9LfoumuL8GP8R1+jpDMfpjS+IysL0ol6I3+h39rCkWO3bR0NuR1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779149; c=relaxed/simple;
	bh=sD53kiakATC+UcUaCaf7NbRw9ob5hiejFyKuZ4y1uXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVA4aITi/mTtkqriRP5G7aODtpN5PHYswz3SGGe6PzyShM+bWgAoGqOroNot/l0SEr2xW2KmCdtbIo2M+VRUVWITfgj3ZGGPSBSAY8rZBo80e1ckkSLaJmVp7SeJc9XuBSSv/WQTXcsbG8xBSvSDogGSyUzohOULnZ5o9L7r8+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Wooz17zI; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Wooz17zI"
ARC-Seal: i=1; a=rsa-sha256; t=1787779110; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ILAlweHvd2JGgfwb8xwd1SqMC2lUvNlubLLL47WJ4uz0tExkbtLNBRPu/6jY67tAd7p6mekgnl2baGZXiWNQiunx1Z+APkzvx7wjp2x3foXBIAs5FQsmX3TiUfFFOOgEmvwvCUFN27eCwHvVjNtCQ9plO4FSUTdIwgFDudt94F0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787779110; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w3iyg6HDBs4Cp03goVcc+iKtUKTimcI5YnSFSphq3ZA=; 
	b=iGbf3dHDPAt2xLcQEYLGgmCsv9EuEEG3ibBnyvJ2LZfEt4JtqAhb47I31SeDwl62R14rdgmTwFPX6Zdj6fJ4HTKHqv85ps4h3MhxPf8DznmUg9tM2ItkCT9darliNV5aRvMXZYmdkv5q+6zu/qN2LOJeOVT64uXws//2Lrs1/AY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787779110;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=w3iyg6HDBs4Cp03goVcc+iKtUKTimcI5YnSFSphq3ZA=;
	b=Wooz17zIaBJDu6XAQOZYfE4HdcFRaqQrFWn8XZS1SDXxLLLdkuLcgC/OuCW9o3n8
	dUNqRIjtkAms+oTF6q1o2j+sXgMcWodSmzUWXSIzNZ9YRjaBW4NYooNF0WXOBhT0EmA
	bylUKceH4XIAVmxc1DKGQwG+yHG2tS6yuu57L0PQ=
Received: by mx.zohomail.com with SMTPS id 1787779109030691.2423862351918;
	Wed, 26 Aug 2026 14:18:29 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Wed, 26 Aug 2026 22:18:05 +0100
Subject: [PATCH v6 03/16] drm/panfrost: Move lock and modparam
 initialisations into their subsystems
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-claude-fixes-v6-3-78119af409e7@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6181;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=sD53kiakATC+UcUaCaf7NbRw9ob5hiejFyKuZ4y1uXI=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqj1gLFDx/x9FUHJMD+S5WREyBw2/tbl5PQrCy9
 ESTRSb98JqJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCao9YCwAKCRAOJn5M7lND
 PQwaC/4vr4FwYLxDCr/o1dFIt8ZD9sRwMOZiz3WNAcgrnWBzGLk686LeybovBegSvjcTnh4neFf
 7053S/92y0oGYOQk9XaqBBKsDEzzE1yEKmnBkx68BwXMtRXTvDOr7Pv89WZH0HyZs41m24QPmht
 r33zmlx+ItBFsQHQ9WvUGU5zukJjiaP28CkiWHO7jvvPBoj6hbta7yogGBMkVk1mXGkGrxRDre/
 qzMgbpOV2X1ngdDKl7xWxbaQHJmGsqMGnrFKqCBIFPpTuxUQbNN5A5f5Bg6Mp6P7h3nnJn9HTY+
 aqHbNQqn5eEEQvxOYZ2HW0PavIstfLLABC+GKty/FeSffwDElhyIvRwiOMJe9lWqz9igd9CImb1
 A8S00+f6es1caH2MJJ8owOVapO1dk0T4AtsJLNepmM1vJZGaPBivPN3BqGNZc9H5RdrtKiDBttJ
 ZEephl3LSrrWZVibZlaB1Bmhh5AOPtKdJTqX2mm3d7bmCTZ2afb4CIMir56+m/ICyH2RM=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

The device init function feels a bit cluttered with things that should be
done in the specific subsystems where those locks and lists are being
used. Same goes for module parameters, it's best to limit them to the
subsystems where they're relevant.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c       | 10 ----------
 drivers/gpu/drm/panfrost/panfrost_drv.c          |  7 -------
 drivers/gpu/drm/panfrost/panfrost_drv.h          | 13 -------------
 drivers/gpu/drm/panfrost/panfrost_gem.c          |  9 ++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c |  3 +++
 drivers/gpu/drm/panfrost/panfrost_gpu.c          |  2 ++
 drivers/gpu/drm/panfrost/panfrost_job.c          |  1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c          |  3 +++
 8 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index d2d2830f11a7..7daa2143f3c4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -223,16 +223,6 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 	pfdev->coherent = device_get_dma_attr(pfdev->base.dev) == DEV_DMA_COHERENT;
 
-	mutex_init(&pfdev->shrinker_lock);
-	INIT_LIST_HEAD(&pfdev->shrinker_list);
-
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
index 80996e311a9d..ec8c1c08e147 100644
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
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.h b/drivers/gpu/drm/panfrost/panfrost_drv.h
deleted file mode 100644
index bac0c415d4da..000000000000
--- a/drivers/gpu/drm/panfrost/panfrost_drv.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 or MIT */
-/* Copyright 2025 Amazon.com, Inc. or its affiliates */
-
-#ifndef __PANFROST_DRV_H__
-#define __PANFROST_DRV_H__
-
-#if IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)
-extern bool panfrost_transparent_hugepage;
-#else
-#define panfrost_transparent_hugepage false
-#endif
-
-#endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 7b993a089af2..15105b7f954b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -11,10 +11,17 @@
 #include <drm/panfrost_drm.h>
 #include <drm/drm_print.h>
 #include "panfrost_device.h"
-#include "panfrost_drv.h"
 #include "panfrost_gem.h"
 #include "panfrost_mmu.h"
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+bool panfrost_transparent_hugepage = true;
+module_param_named(transparent_hugepage, panfrost_transparent_hugepage, bool, 0400);
+MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount point with Transparent Hugepage enabled (true = default)");
+#else
+#define panfrost_transparent_hugepage false
+#endif
+
 int panfrost_gem_init(struct panfrost_device *pfdev)
 {
 	int err;
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
index 2d12b83e900a..6f920fd0fc4e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -873,6 +873,7 @@ int panfrost_jm_init(struct panfrost_device *pfdev)
 
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

