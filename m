Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C34A43FF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273423; cv=pass; b=RWj5B5h/7h5uUSeLUdLo7L75NxqvfjWPkADLl0cIJsaTSmODww8seOax5dOOl0ODgRfMHN7+ePbADzn2GsssAMgCFQzOlXZRK7GfiMIhAF3vQ69z+3VvyqT3poKnlpL/rh+CabPBLWpht3QcAN3IUhu3a8m5EYEtthgu0nOX84Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273423; c=relaxed/simple;
	bh=BseDd5ptshL8O0X6ZZAknqhIzPZMy2A4L4RfHDWk90U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tjAFXdOYLHPA6S3bO74gYVHdSCtTubjN++H/XTwvXGqutFGybRtiHoD+plSaaaPCzjcLxpuj3pfVlzufJTVNbjFA4dUd4BIAdmDHs+kMGQktr/AqQiWaix2bc7p3jMcZ+c9yNbJRZYDjpinmoSs4pt6l5stLXxFyfVBFkV0/lhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=h6gQ1FDw; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="h6gQ1FDw"
ARC-Seal: i=1; a=rsa-sha256; t=1790273389; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K8hOOPtZJVYnAiqOg/Prw7yfjSb1hYihdsfjevKA6i+NpwqXjvHb0hVLFJSXjBhCM4zgCqQTPX+4+3xWLbmxqXbYB5f8R0KcOsQ26sTMmUGcFhh/rkIKBhmaM7dshQKVss9wmm45O2O9GJUrg7YT/qILo7GaziBGDR3+NWNP/tg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790273389; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LZw4Kt2mQuWgyKmlrDPFTNJYeu3IN02ygsBncDd+4ds=; 
	b=GmKOb3GkbJjWPibp09VO0V2r+GQPcV33YCNtc8C7OaFm1C9BBdm1574gynaOmT+pcgX6DUmNBW0grkEpxgvRLGL2wDE3VuJq3Uq86f8uSfRB3hQv8ABPWlvMZ8J2aIIJk+kZsfwflEWDu8D7qnZlK6MfrTfqGhk51dirVVS4ocA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790273389;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=LZw4Kt2mQuWgyKmlrDPFTNJYeu3IN02ygsBncDd+4ds=;
	b=h6gQ1FDwfe3G46/1MxyDNV9w22MSydSobawr2SobZze6UTAFS3zjWdcvVsuV61W0
	JoEZIX8BrfrjPyfZBIbX7BUb1VsiliDzgw1SpTHTBsfVQxnHslWAuiT42L/s/xhQoNs
	RKTsg/xVTKrMGUpRQZ3iNZ6UYqD/8yIJR5N/phaI=
Received: by smtp.zohomail.com with SMTPS id 1790273387940533.0015023493623;
	Thu, 24 Sep 2026 11:09:47 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Thu, 24 Sep 2026 19:09:19 +0100
Subject: [PATCH v10 02/15] drm/panfrost: Move lock and modparam
 initialisations into their subsystems
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260924-claude-fixes-v10-2-755929b3cc19@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7189;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=BseDd5ptshL8O0X6ZZAknqhIzPZMy2A4L4RfHDWk90U=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqtWdYqRo0nqnfSdTouonr5Ss5TPaLKAFQEGYh6
 fmRcyMtZuqJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCarVnWAAKCRAOJn5M7lND
 PbiiC/9wDTNujfIwOWbuP2TiSGJXUvaDjn+26LZ/FlW54Bv5OBgDo3y7Ruka7bYEQL1LzpRuUav
 UnY6xdtLehcFUsJPXm838sTTdr1Y3zfPprEEPOoZRNiBc/VyiU0/hUNj8DoPFwO8d18fc3XEd2Y
 BBgT4bLz2/1C1PFE0NJwCVwx4igqLAK1TYYkDsPcfitZ8sdu5nugBxApXTBANKZQ54cYSf6k4Q2
 LahJWlV17jyv0maWklS+cD6gFCpUqx4SHEb1Tdd9q6lr2yTl1BBgIygjmZB1MFKp6FULot6mBW8
 0+s8Zn5++TivGZulkGbElW9V9RdaTiPfvjqvjAFb/daeuJE2NmvwL9Yj8vS/4ndWKSYc5rhAHg3
 QMr+GSqFRIPw4N24oGypBlDInuPKJsYv2UIZPtUBBDqDlIdDqGAT7e9CWw2Gf+RVp5TUYRg2Ye4
 0ec1xyhXoRr9kvKPbKDDZeFfnfS+yvhkT5PzJ5KXpUwVYNRjvtjKgUiDBs06ViUcVnzIo=
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

