Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0157A3F8709
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779195; cv=pass; b=eCMUiJHllbaHh3KQc0AgrKDJ/StaaqqMLCtetrO8XwvOhz5/88W4rExe0pRIvYsXbGAEaxrKhfWO2s5CeLmOnXS8+LAGcc0mZYd5ynINABMucZ6xv8HGLqzx8cXLpOjPZncgiLbo6p0uhAfrPZ8FansAa88ZCwgLAdqNpbRTFkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779195; c=relaxed/simple;
	bh=y6TOO0IoJMecD+tyIIJcv8t3bo2nQZ0foj0Vfe9uo9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GtNI23Tip4ZG5uVXK8XyNLqHtd0C30MC36JDX/jZkfhBU1qk06B6Lvlvf8ehK5cpWcUlMkM2ejReDCVUsMb7c4O6mJjb1qwyJFr/yUd1H/sHw+DEhXxMWT8vg/Jwf9Vk1SJPU2Kx4sYCQ5JVAywub1nBUNHAjNWo3aAuSgBIz5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=ghQDJMnG; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ghQDJMnG"
ARC-Seal: i=1; a=rsa-sha256; t=1787779156; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j6FBQnezEpVTkJb16C8CWQz3ltwo9rnEzZUlwesWKsQfhUW4e2sl12ypjnWyPccdWOJ1KHOnsqZYKmEeyA/+j6Zl29itlMzZyqRtweMlmOtJ6vFkM1dJLtt7uiBfe45PcEleuIipFXldDRGdajt4jMFRmfrOlkvJALuLm7T0kuQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787779156; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ai+KSXHNrzb4R3t2qujtq6pFbs6sfa3sY6SEIc6LIQU=; 
	b=ZkHuIueIQwGvWlo+/byINX/SYAxpk1G7zNvP31DgJQcKqmiiJ1ipIPfsacGiYO9ZJ2F6sa42aysSAQEo928/EaGOy4Zkwldmf8XiDHnmZwOvtSnm4DWtYOF3EbTiAbEiFmYF9KekWb0hf9leZXq/3WevfpTK1C7LAWZq94PKjrc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787779156;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ai+KSXHNrzb4R3t2qujtq6pFbs6sfa3sY6SEIc6LIQU=;
	b=ghQDJMnG+Qbu1XWkzxwlQ3nB+XM+aAScAgCyl+jXmuU89zrAo5RBQ7zZrbiGXVU7
	RxVonigPnl/MC8QbcFQyBAvuHS0mKeVTcK6lFsNvhSEtljcz+FLjkzDAwUUbw3cJmWs
	y+rlXJf43tqV7gA22ICpd0KP1A+KAmN9WVVD10vw=
Received: by mx.zohomail.com with SMTPS id 1787779155453777.4053819956326;
	Wed, 26 Aug 2026 14:19:15 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Wed, 26 Aug 2026 22:18:12 +0100
Subject: [PATCH v6 10/16] drm/panfrost: Add debugfs knob for manually
 triggering a GPU reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-claude-fixes-v6-10-78119af409e7@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=y6TOO0IoJMecD+tyIIJcv8t3bo2nQZ0foj0Vfe9uo9g=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqj1gMCe4XHtdbiFjGqWKu4bUqQ02/sTb8FdNEn
 9psgu/mmVqJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCao9YDAAKCRAOJn5M7lND
 PS1GC/9rArr9yfK/8VziCFs+RAo6yTxeGpz4bsFzKR1reKUh07xKohJ6OKgbX1TgIf3tH1vY4RK
 f1v3mdb7E7inTdCamicme6CUNtNTiLOzR0pDNQgAHqtqqrCuMhT7DeUP1vJ8CzmxYDKzYyyR8ms
 F6Wo2+v0o347abSyqbK74sVtH+dA6pVBDf0aJ7P8odNH5Fbh18QXf2k/dvVU01B2xlrDxoJ1htJ
 Hhr3dUsK6exNfoBAwSLLHO72E2jxR0G683L/g8cGVqEOpbfKAYtWnmJT50bFJFEX8Ib5tfxpD9V
 +2trnOIAmA0CizkCJDaifx4xpA1fMK+ZKif4bcOsOrtNoVuweLJtESXjDLkCXQyQJbVNXPiXfxq
 yQB8L0bx3QM6NDfS6BRWfKeogpZdtpSYQuhUvfK3gu0VjvDAjRXFmzMGCAI4RSMcP3AaXiIdCBR
 wKTWuqB4RcTfvki0H9K37Yq8FOVXeMTMPyKTTib/FO/jfdaLD1CaEtaPRSTH0kkmE8FG0=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

This will be of great help when testing potential races between the GPU
reset sequence and other parts of the code accessing HW registers.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index ee4c468b882d..0c8f53905da8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -2,6 +2,7 @@
 /* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 
+#include <linux/debugfs.h>
 #include <linux/clk.h>
 #include <linux/reset.h>
 #include <linux/platform_device.h>
@@ -599,9 +600,46 @@ EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) = {
 };
 
 #ifdef CONFIG_DEBUG_FS
+static int reset_get(void *data, u64 *val)
+{
+	struct panfrost_device *pfdev =
+		container_of(data, struct panfrost_device, base);
+
+	*val = atomic_read(&pfdev->reset.pending);
+	return 0;
+}
+
+static int reset_set(void *data, u64 val)
+{
+	struct panfrost_device *pfdev =
+		container_of(data, struct panfrost_device, base);
+	int ret;
+
+	ret = pm_runtime_get_if_in_use(pfdev->base.dev);
+
+	if (ret > 0) {
+		panfrost_device_schedule_reset(pfdev);
+		flush_work(&pfdev->reset.work);
+		pm_runtime_put(pfdev->base.dev);
+	}
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(panfrost_reset_debugfs_fops,
+			 reset_get, reset_set,
+			 "0x%08llx\n");
+
+static void panfrost_reset_debugfs_init(struct drm_minor *minor)
+{
+	debugfs_create_file("reset", 0600, minor->debugfs_root,
+			    minor->dev, &panfrost_reset_debugfs_fops);
+}
+
 void panfrost_device_debugfs_init(struct drm_minor *minor)
 {
 	panfrost_gems_debugfs_init(minor);
 	panfrost_sched_debugfs_init(minor);
+	panfrost_reset_debugfs_init(minor);
 }
 #endif // CONFIG_DEBUG_FS

-- 
2.55.0

