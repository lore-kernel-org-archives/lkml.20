Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDEF44BC94
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756189; cv=none; b=np3U8TlJtFdSxubqh9jT75j5Ppie8BPEnQcRG7BgK3DojyPEiZe5sldj3GeVt20eaTc2HyOLy8/s8IUNXd0UcGKYGlQtTINBaaUi6XWyP2hY4tbxJArJwWgbFkg0K969sKVrcT0qJQrbtgqZRUpZMKJt1TSvqGdTuvRR6W5ea1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756189; c=relaxed/simple;
	bh=lYX6L83HMxmj5B+b5FE2riZNPsVxbs5DkkcnwfLj/x8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hY+wij2xuZdGnZzUUTAJR+YlOgADvlrV83ppY6xjDSiExEWjQSiVuaHgKD6nG9zvBLY+XTstTFvIVSDG2hMAAJ8NLXFmRaqQlP67qtT+77WQuV1eGLyL73KF34bxkyvQW2Tb7F4DMDCodm9S5erkSV3Znf1e4ST+Oa/AcDgj1Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SJc1E/uO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SJc1E/uO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787756183;
	bh=lYX6L83HMxmj5B+b5FE2riZNPsVxbs5DkkcnwfLj/x8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SJc1E/uOuw8vPgmc3HWK+0KxykI/jUJ9QKnBhznDJhtUSMwUy2NrWuqSnLFXtQ+rD
	 CSQ16/4aoX1XwHANhnLm2AVTIDEzR89rKCv+znXTp++hmJTAnQEBfz2/qOQkS1b/yA
	 7gFaetlVxt5DlRM71hd/B84MQgCnJnpmTaor/MjiZmrbCqPvy+m3unCoysdl7reyE3
	 JUtvTvqC6HFNUPrDe+hLhrFQH8aJpXCw6eZn3w8363xkTqQifprQmVrlKo6I8lnbgL
	 TYQxrZq326O6Xuy3uJfOXyGum2Hmnz/HPexIs0qpBYLJ/L9MNM7+rfQlpHnXGwT8P1
	 0Y87PfCVuZrOQ==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4443D17E0FE4;
	Wed, 26 Aug 2026 16:56:23 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 26 Aug 2026 16:56:06 +0200
Subject: [PATCH v4 07/18] drm/panthor: Move the debugfs initialization to
 panthor_device.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-panthor-unplug-fixes-v4-7-982cc8f4234b@collabora.com>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
In-Reply-To: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787756178; l=2712;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=lYX6L83HMxmj5B+b5FE2riZNPsVxbs5DkkcnwfLj/x8=;
 b=j2/vfP0MMmCluSJ3oVjeBzk273Ty8Jp1trJCnLJkOTup8gg9h+02NVV3BneQjpf860mNIvo8f
 Y0RGWpxXt/5CWVhqLsKAqIMTiYO/t/NSST1aGqsPDkUyN/37wcLqxd6
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

Those are per-device debugfs-files, so it makes sense to have the
initialization logic in panthor_device.c.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  9 +++++++++
 drivers/gpu/drm/panthor/panthor_device.h |  4 ++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 10 +---------
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 08bb4d410941..19d3669f5ec7 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -13,6 +13,7 @@
 #include <linux/reset.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
@@ -661,3 +662,11 @@ int panthor_device_suspend(struct device *dev)
 
 	return 0;
 }
+
+#ifdef CONFIG_DEBUG_FS
+void panthor_device_debugfs_init(struct drm_minor *minor)
+{
+	panthor_mmu_debugfs_init(minor);
+	panthor_gem_debugfs_init(minor);
+}
+#endif
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index a7ea475fb407..e12049961912 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -421,6 +421,10 @@ int panthor_device_mmap_io(struct panthor_device *ptdev,
 int panthor_device_resume(struct device *dev);
 int panthor_device_suspend(struct device *dev);
 
+#ifdef CONFIG_DEBUG_FS
+void panthor_device_debugfs_init(struct drm_minor *minor);
+#endif
+
 static inline int panthor_device_resume_and_get(struct panthor_device *ptdev)
 {
 	int ret = pm_runtime_resume_and_get(ptdev->base.dev);
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 67db6701699b..3993e1a81495 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1764,14 +1764,6 @@ static const struct file_operations panthor_drm_driver_fops = {
 	.fop_flags = FOP_UNSIGNED_OFFSET,
 };
 
-#ifdef CONFIG_DEBUG_FS
-static void panthor_debugfs_init(struct drm_minor *minor)
-{
-	panthor_mmu_debugfs_init(minor);
-	panthor_gem_debugfs_init(minor);
-}
-#endif
-
 /*
  * PanCSF driver version:
  * - 1.0 - initial interface
@@ -1807,7 +1799,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
 	.gem_prime_import = panthor_gem_prime_import,
 #ifdef CONFIG_DEBUG_FS
-	.debugfs_init = panthor_debugfs_init,
+	.debugfs_init = panthor_device_debugfs_init,
 #endif
 };
 

-- 
2.55.0

