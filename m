Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384D2E7162
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433168; cv=none; b=maDA2iv6z105s6Z4WYu1VEufMTntGW9gHsoqLjHNDjwqnTagMqxYmrAwLAoVDmVekCWjOUDkAhHnBxEOf9egHFtwphGDymuy3UvWCIHB64VEShK5aoKqqep3HhDz1L1l/IBwpbdESd+BuHfICd3PRx9buxkWo2U5plv/0btYb4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433168; c=relaxed/simple;
	bh=wlblJ404sbABBl/0zdj29ymj/j29lL8iOtwKRfSirpU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DsBJTpnDhAfbXkTIG6t7Eqh6PPj8qSPKHMcG5ydwN//t3UR5Ji4APM9oEaPo9EvFc3fpttMkoeFOAu304OmPlSamKzol0H/SIVrBWLIAGKb9SYhjD//7hRF9T8+ztJ/kQdB6B141usdSKXJCtsg7jppwCvZbeiCwHOFzv2zfP+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mdPxfJLN; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mdPxfJLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=y8
	uk6acIn5+spuh54iSxJYMKnZSAnNC7gMYO6fVnpnc=; b=mdPxfJLNwx6YY83Auv
	0fPtxCpADKcY1v1wYNv32qUC0ZvLsOXL893lisG/QlJD0Q2BKsE5qblUVzySUSFS
	2KKW42/Tr3NwRGLuSM/fgqLNBq/xVu8qYv2HoQetOxTiOtbSgSMdhcZ8QBi0Cr4v
	TTTpBEg4OqRt1aY53FoiEQNOA=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3N5Y117dqTFyMAw--.64413S2;
	Sat, 26 Sep 2026 22:31:19 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Mihail Atanassov <mihail.atanassov@arm.com>,
	"james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] drm/arm/komeda: Fix early runtime PM NULL dereference
Date: Sat, 26 Sep 2026 22:31:16 +0800
Message-Id: <20260926143116.3457144-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3N5Y117dqTFyMAw--.64413S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArWkGFWUKw18WryUuFWDXFb_yoW8WF48pF
	4UWF4UJry8GF4ay3srAanrZFy5GayfX3y7Ar1Uu3Z5u345AF18tryDJryvyFWUtFZ5AFnF
	grn7XF4xZFsayF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU1OJnUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzReLxWq31zfhbQAA3l

komeda_platform_probe() enables runtime PM before publishing the driver
data.  The runtime PM callbacks dereference the driver data, so a
callback running in that window dereferences NULL.

The debugfs register file is created while komeda_dev_create() runs and
its read path calls pm_runtime_get_sync().  The DRM minor is registered
before dev_set_drvdata() as well.  Either path can invoke
komeda_rt_pm_resume() while the driver data is still NULL.

Publish mdrv immediately after komeda_dev_create() succeeds and before
enabling runtime PM.  This guarantees that runtime PM callbacks always
see a fully initialized mdrv->mdev.

Fixes: efb465088518 ("drm/komeda: Add runtime_pm support")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index 67fffab018ae..82efa74199be 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -73,6 +73,8 @@ static int komeda_platform_probe(struct platform_device *pdev)
 		goto free_mdrv;
 	}
 
+	dev_set_drvdata(dev, mdrv);
+
 	pm_runtime_enable(dev);
 	if (!pm_runtime_enabled(dev)) {
 		err = komeda_dev_resume(mdrv->mdev);
@@ -86,7 +88,6 @@ static int komeda_platform_probe(struct platform_device *pdev)
 		goto destroy_mdev;
 	}
 
-	dev_set_drvdata(dev, mdrv);
 	drm_client_setup(&mdrv->kms->base, NULL);
 
 	return 0;
-- 
2.34.1

