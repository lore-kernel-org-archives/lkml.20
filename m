Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C5B48FF8C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816514; cv=pass; b=ZaMGBusEf78F7T5JXcJDjb42XwI9Acu8qKuKkerFdb/VamNXFlNfav3aQUvlrhr1jtPPCbefCmtO1gEwT4Of8MZT3rIFUcK2ZfKr2A6ehDHxJcbfd/y8/o12V2cZcIvNC4jLpdDgUIAEjiA0mT7U9fY073T/cnZXu0NTd+bkcmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816514; c=relaxed/simple;
	bh=oSIIIHL4h1iE61MtPq4p4qt1qjvvSCjdFVkun0F6wEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHiwXi1oZiOOTUpVB10tYaHf1C0KCIpH6Z729lwwk/StwQGEPJxgh11teQpf1MOu5XQkxSqOMk8aWbC4fb5RNWrv+X7o/AHPFzT8FdCjlL5i/UHcHJl2xWJ+NlM49NophxJqM0DiTftOy4WkjBxjUBo2Uw30WExQ4u5YzEPAtuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=k2+YhiFR; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="k2+YhiFR"
ARC-Seal: i=1; a=rsa-sha256; t=1791816488; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mzGxcYYD3qwOvvhocOdRYoHlHFgIw9dxvWkko2UQ5EZ2NUY+dF3HAnU2uSUek51kNZJTFCSgrSTMQdFRMIZ9ph7Hs3bONnjB1aagzeCE7FVrklIaUOeRrXIUiVagPsHnak8LhZKKG90njO2/A6ikMUiViIwBdWXY6/lbWbLY4Wc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791816488; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GaF7GVmmm2DnQaqOTyiaGO68wSwIY8KYDGY41wixYag=; 
	b=Unv08jqxBGKMQLCiqCZ6Q1nGi8tvlhNqizJ88ZeI2JH8tm2npvomBUH27z7FsjOAa+XAsLglspka0fLrCkBKLQDQWqobTe35QLAvsGHWUjjP8KAag192kUdTFwcOW0cHHzWIRh/aYBBroESvbMzlUTIFoE2pgnuErbaoWAJx1oI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791816488;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=GaF7GVmmm2DnQaqOTyiaGO68wSwIY8KYDGY41wixYag=;
	b=k2+YhiFR2vifgMclEI/7VNzEdTf9p3lI8b7oE1WCTIHL0yOjdGKD9w+BliZKGXYz
	1FKEERIuwAiM8omhCGAdLKslPL8XE5PqFznQhPPxVf8QO2KA4xFqMRCbMq4F87Ls8aF
	xwvx2EZbJEujzE/TFzF3H60JC/qT8m4M6o0XxPYU=
Received: by smtp.zohomail.com with SMTPS id 1791816487017229.16150682440843;
	Mon, 12 Oct 2026 07:48:07 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 12 Oct 2026 15:47:53 +0100
Subject: [PATCH v15 01/15] drm/panfrost: Move shrinker initialization and
 unplug one level down
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261012-claude-fixes-v15-1-bc0a6c498553@collabora.com>
References: <20261012-claude-fixes-v15-0-bc0a6c498553@collabora.com>
In-Reply-To: <20261012-claude-fixes-v15-0-bc0a6c498553@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6439;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=oSIIIHL4h1iE61MtPq4p4qt1qjvvSCjdFVkun0F6wEE=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqzPMaLdMtcUk1KRKotG13C9jxhOzqdhX21cbCW
 ywemtw3gPCJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaszzGgAKCRAOJn5M7lND
 PcBzDACmPS0Cmb4KG4DdbhdiPtyFkY/150o0XoGgHAYnDAYuehecRM7L599Ny7Op2eNxOCEI3iu
 8jLgM0B9mTcaWOQWo5bNgf8GRP1JL9NInatdZ7MnZC009UzNqqdfNpKVzAB+Cty8osUNF8Hdc7V
 7a0Y7jN84wz1AsCxM1i/XrWiX1ciIuEAnb6WLW4Gl0f7wjegnrZFdTwWA1Yx/5YUQt42O20VxHf
 07cpfejzZfAM35fffC/jZWnvvVne6qjyG7m1vkhdPZTrK1pe9UpJ3VzFO91WGq6ocrHnblZ6isp
 JGqSbB/FGxahm89ULOKFPLbyvJ/ojRwa1nxbTBtE2Cvuw6ONKiobSxzlJO1+zEswp6XpnBgx6DD
 Klu0WlZRECHfOyiV91vZ+5D8NLkVbUTw4YjFOFEJWYBKlHo1xFu4d5gdjNUJOtkFDgcOAud/B3X
 57lUoBZ0FXyg+8iOOjLUn1HJjNf8B3KssQPWClkIPt0Z+MVtPrF/4VxsmclZte1JUn6c4=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Since the moment we call drm_dev_register() the device should be in a
position to accept jobs, so it's best if the shrinker is already
initialized by then.

On top of that, make shrinker functions take an panfrost_device pointer
like other functions in the same sequence and rename them accordingly.

Essentially mimic the init/fini behaviour in Panthor.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
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
index 70c05210ea84..130ec763343b 100644
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

