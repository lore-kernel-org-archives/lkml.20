Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525864825B0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273418; cv=pass; b=PGPl+yf9rDAH2XEjEsLLkB2imj5mGdqIOgGvJ+jaZdfBymkx2mnnPjfxjH/2EQt6BDnsryK/Y4GB9I1knJDWCMWSKBrhFpM8qNjT0pGqQv8YOpy9Idc9SDrIAgI4H/kZGhnAG6ahGbj+RXh+Pq1UZpsPbU0leF8HjDFBLaWZuVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273418; c=relaxed/simple;
	bh=stB54yy+rzsgjj1qVzBZEJWnEUOo5dHMeMALr6aQN1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUEQqTdbLZQrLh9JtUHHEXMNH94gAfz7OHiJuMy5i+Yqa1tes9+bEH75AqPzj2QwREwXTwZGQ99VgKQxlJlC3Xl/YcSuL5JzmPaew6xe5vIqLB/CaXT3doiUeAGd+QuZBMtYoOjfYG5IYZ6Mwnnx0z1WvNS/PHVulr3IFjfBWd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=XS45/jq9; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="XS45/jq9"
ARC-Seal: i=1; a=rsa-sha256; t=1790273383; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Prvo8vPSiRC2rtEmaXCZ2++3F4q9K0AERKcunrxIO6bIO8m///uAquGoC4WsycZHASYkEoinIc/Jd514reUUbvwwiSvbKteEM/Dsz7NEkAPVNS+OMMzLJ83MAsGiwygWP/xr0AuK7ismeHmJ/XhcBZg3YKLOFn8T6KPcUIvljrU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790273383; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tgZWphGgU/74z0QaLxGpjKzaewG66DZ1iM4zlbILEjk=; 
	b=kSxaH7tFzV9xwk3QBPNMzVwLI+H3nOdcwL8hhbQL2g8JMif84nDfPqQ+nxEJihKlqzggPbFWFCNkiMXgACITESRS4pave8Nujk8DhzsR3mBMzXhbBhfs5yay07Q8OwVZBrVbkPOMw1l5RX5Nc1t/TpsykAjIrx7nlM739SBRmck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790273383;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=tgZWphGgU/74z0QaLxGpjKzaewG66DZ1iM4zlbILEjk=;
	b=XS45/jq9YKKOwqSeMI5YQoFW6EL3F+Uf/BVfLkbzooNQzcGStv/OEX8NdKgNRfJC
	INAQ6MGHQXCjBax/TvF81UXwYOuM7zsqP3/MQxVCczDW6dVwGWYZNX4eXLutdtJrXFB
	yrFMpBfnhWbuk9GWWy0Oma+bnov0hRiShJ8+xEoI=
Received: by smtp.zohomail.com with SMTPS id 1790273382146144.7467675855312;
	Thu, 24 Sep 2026 11:09:42 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Thu, 24 Sep 2026 19:09:18 +0100
Subject: [PATCH v10 01/15] drm/panfrost: Move shrinker initialization and
 unplug one level down
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260924-claude-fixes-v10-1-755929b3cc19@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6389;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=stB54yy+rzsgjj1qVzBZEJWnEUOo5dHMeMALr6aQN1E=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqtWdYahf0IDQ7CcIj2ZGPCJFK3w6ptELTHyHjM
 ZOq0itZWq2JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCarVnWAAKCRAOJn5M7lND
 PVVIC/9WDbUMMttNz0bAMvhMqchUrnowCpnRkcRpkTzTwGpJUJstCjo1kGcYPSTOSkITEdiP4H/
 eAXjAmrTT84Rec2cvVLbTselCZ3zmiyQ4nJJFjvkdjdzH4xTo4GOv9OIxNmHHqOmwSCP8FwMmZ1
 6TCQiGqUKkLzmPSlkMnXVkok42yY7Kf56shHiSG4fJVwWTA3+AwqadVtcj81UxJT7te9gqISpCq
 r3TB1Drc40PvVMk5NR34UfvCNzLDEYeCMJGX14jcn9aHQhudNrGWRCmA6iFODG2gv6bMT6bh1K3
 CU11yPnfNKjIaAlQXJJgvX3oxvLUJ/e1G3HcPHLK4XGQW3//Y/kCBTR6NaeNbNmB6JP6+Q7NKje
 TdLka8gRkSQuj1IA39I0Qto9ctjCaQEGF+ndHb5LBCdKe97zo+7+o0zCoJTB2Rgl4TkM9uA+aLz
 jxgK2FGnGRMtV0x1OwaX14YRGx8pAgfqemnE0CMShpTAVIYjMmtKpN0FA7lL5luno2uEQ=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Since the moment we call drm_dev_register() the device should be in a
position to accept jobs, so it's best if the shrinker is already
initialized by then.

On top of that, make shrinker functions take an panfrost_device pointer
like other functions in the same sequence and rename them accordingly.

Essentially mimic the init/fini behaviour in Panthor.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c       |  8 +++++++-
 drivers/gpu/drm/panfrost/panfrost_drv.c          |  6 ------
 drivers/gpu/drm/panfrost/panfrost_gem.c          | 26 ++++++++++++++----------
 drivers/gpu/drm/panfrost/panfrost_gem.h          |  7 ++++---
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c |  8 ++------
 5 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 485349faf251..05c40d5a20b5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -280,9 +280,14 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	if (err)
 		goto out_job;
 
-	panfrost_gem_init(pfdev);
+	err = panfrost_gem_init(pfdev);
+	if (err)
+		goto out_perfcnt;
 
 	return 0;
+
+out_perfcnt:
+	panfrost_perfcnt_fini(pfdev);
 out_job:
 	panfrost_jm_fini(pfdev);
 out_mmu:
@@ -304,6 +309,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 void panfrost_device_fini(struct panfrost_device *pfdev)
 {
+	panfrost_gem_fini(pfdev);
 	panfrost_perfcnt_fini(pfdev);
 	panfrost_jm_fini(pfdev);
 	panfrost_mmu_fini(pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 96a66d673ba6..9882a3ede75f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -1003,14 +1003,9 @@ static int panfrost_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto err_out1;
 
-	err = panfrost_gem_shrinker_init(&pfdev->base);
-	if (err)
-		goto err_out2;
 
 	return 0;
 
-err_out2:
-	drm_dev_unregister(&pfdev->base);
 err_out1:
 	pm_runtime_disable(pfdev->base.dev);
 	panfrost_device_fini(pfdev);
@@ -1024,7 +1019,6 @@ static void panfrost_remove(struct platform_device *pdev)
 	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
 
 	drm_dev_unregister(&pfdev->base);
-	panfrost_gem_shrinker_cleanup(&pfdev->base);
 
 	pm_runtime_get_sync(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 3a7fce428898..f39c0f50ed4f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -15,20 +15,24 @@
 #include "panfrost_gem.h"
 #include "panfrost_mmu.h"
 
-void panfrost_gem_init(struct panfrost_device *pfdev)
+int panfrost_gem_init(struct panfrost_device *pfdev)
 {
-	int err;
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && panfrost_transparent_hugepage) {
+		int err = drm_gem_huge_mnt_create(&pfdev->base, "within_size");
+
+		if (drm_gem_get_huge_mnt(&pfdev->base))
+			drm_info(&pfdev->base, "Using Transparent Hugepage\n");
+		else if (err)
+			drm_warn(&pfdev->base, "Can't use Transparent Hugepage (%d)\n",
+				 err);
+	}
 
-	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
-	    !panfrost_transparent_hugepage)
-		return;
+	return panfrost_gem_shrinker_init(pfdev);
+}
 
-	err = drm_gem_huge_mnt_create(&pfdev->base, "within_size");
-	if (drm_gem_get_huge_mnt(&pfdev->base))
-		drm_info(&pfdev->base, "Using Transparent Hugepage\n");
-	else if (err)
-		drm_warn(&pfdev->base, "Can't use Transparent Hugepage (%d)\n",
-			 err);
+void panfrost_gem_fini(struct panfrost_device *pfdev)
+{
+	panfrost_gem_shrinker_fini(pfdev);
 }
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 79d4377019e9..5c823cdbd980 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -129,7 +129,8 @@ drm_mm_node_to_panfrost_mapping(struct drm_mm_node *node)
 	return container_of(node, struct panfrost_gem_mapping, mmnode);
 }
 
-void panfrost_gem_init(struct panfrost_device *pfdev);
+int panfrost_gem_init(struct panfrost_device *pfdev);
+void panfrost_gem_fini(struct panfrost_device *pfdev);
 
 struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t size);
 
@@ -154,8 +155,8 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
 void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
 void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
 
-int panfrost_gem_shrinker_init(struct drm_device *dev);
-void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
+int panfrost_gem_shrinker_init(struct panfrost_device *pfdev);
+void panfrost_gem_shrinker_fini(struct panfrost_device *pfdev);
 
 void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
 int panfrost_gem_sync(struct drm_gem_object *obj, u32 type,
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index 2fe967a90bcb..fefae87535d6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -95,10 +95,8 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
  *
  * This function registers and sets up the panfrost shrinker.
  */
-int panfrost_gem_shrinker_init(struct drm_device *dev)
+int panfrost_gem_shrinker_init(struct panfrost_device *pfdev)
 {
-	struct panfrost_device *pfdev = to_panfrost_device(dev);
-
 	pfdev->shrinker = shrinker_alloc(0, "drm-panfrost");
 	if (!pfdev->shrinker)
 		return -ENOMEM;
@@ -118,10 +116,8 @@ int panfrost_gem_shrinker_init(struct drm_device *dev)
  *
  * This function unregisters the panfrost shrinker.
  */
-void panfrost_gem_shrinker_cleanup(struct drm_device *dev)
+void panfrost_gem_shrinker_fini(struct panfrost_device *pfdev)
 {
-	struct panfrost_device *pfdev = to_panfrost_device(dev);
-
 	if (pfdev->shrinker)
 		shrinker_free(pfdev->shrinker);
 }

-- 
2.55.0

