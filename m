Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A833D9DA2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169372; cv=pass; b=f+2T+2p/gKR6TUgjR4bMl67pJmnoIswOT9aDhN7Sl+kzkpEFn+kTJowtzKmw4gk0uD5Mo7YTZcOz1Ony1oGC3SkDpkSoSWyzU05+pJ4ZfNsyqS+KIuaPkwSgcCzrH8fu3xcF1QQjLQPNnqwQv8c+vgpdXNiDDEaALKAXOmK+iAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169372; c=relaxed/simple;
	bh=j8qrQUubvamccgGJ9GLGGmSrfxlD+QXeJh9w1qjNAgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=coIpP1zK6gmxGHdlKpXYA4zTOhSFFe1NLK09IkALp8L/R5DYPArpXo9Nzm7GMVJPyI4NIy5m3bFPbpzgqvyGSVkmTliv4ZiSM9W7YDlBr4yIvQE2fvaYsfwM8AB00kaicArFUiU0mqqESLp4tTaFfEieeuRoOmTTdw1FqLsaIU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=k0dYPoc4; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="k0dYPoc4"
ARC-Seal: i=1; a=rsa-sha256; t=1789169335; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=liSoQuZJdu4VD++VM6Eb+ng73EYTFGHI+QkjvFlK6xquYMP0vyER9z8OloTPlSA++FE6Xi5F9hc3RmMpaEN5Q9eMKzjsYGL3cgifztAuFlMrA5WwkNScRcZi3NXElzHxe4t3spZGB8MggTXz38cBDC4jOL3HTkd8JeUWxhuZ9TA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789169335; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PdTeMb52nf+zL0XsG6UuSmjMA2646Gcmmi64FeA/r4Y=; 
	b=Kr0ycLRHi3Ng/vcK8XwpmIf8HHx906rWPbnxYI6/8QqH6XZj7pi6sMNGikjt3KXb9q2owNYcO4NmDtmhXANZfZesfeXsu8guoG3VCfcu4xQdaqj/jVp/e9hhYLpps6MZa4DjCAjRXKiybrzwMIPF6k/eY718tryOFMvbXaVZYV4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789169335;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PdTeMb52nf+zL0XsG6UuSmjMA2646Gcmmi64FeA/r4Y=;
	b=k0dYPoc43Soozllmqj/4vBuQ5+D8FEPFSfVm2OdRybhHuAoJW/EvtMuitvXqsp8A
	iyvfFQuoTGckuTeMisZvej/PvHDA4Dk+ptbwZ/6Z1Fn8dxCgbd1lY2HenOteLLbx1ji
	g6xpOSdgYCo+IIpcx57BUtw8H2+R+/77pNaT8JXw=
Received: by mx.zohomail.com with SMTPS id 1789169334649605.3674708644796;
	Fri, 11 Sep 2026 16:28:54 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Sat, 12 Sep 2026 00:28:10 +0100
Subject: [PATCH v9 09/16] drm/panfrost: Add warning messages to fatal error
 conditions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260912-claude-fixes-v9-9-e588feaa61ef@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=j8qrQUubvamccgGJ9GLGGmSrfxlD+QXeJh9w1qjNAgU=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqpI6DRZrc6GYXBgn0oS1KcyfnF81VWc4Z2rv2U
 9xpxbNZgTaJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaqSOgwAKCRAOJn5M7lND
 Pd4KC/9MqzDK800llGMTZEGPwwWwqyUSsBQkTAhfm0rsD/hRGB2HlEIXjdhCLSZsYVRTzbtT0ej
 IXQ/rDzJUn4Arj+OfbkXD2Jv9/Ov2M6cpmK39w2MhFCvChZ2sQC+FSLF16HcMc9XDTRkjKK1Fyz
 VxCIyvjQQVtWC5JZVy7la9zkRIujfp6L7OvfbKdcD5g9HppWJjsPqKTZUyu9xGmHAcd+abgCdrn
 MYcT+/1N2wbcGpGCDVRnxI8OdaEPSiGDSQOFGmZ0UVjgZs+QAmM/w9Xb8xTBIakzd8SAsmKpsTB
 FO3A/FXMKhGENFnGJhlWiuM3uUbfuLQNcOElAc6t34agcycuKjeczREf9jCh6qQG8i/SlVq6RQa
 UdBb2bizeLwEqWCF+ukFqafHK6qLl08RythWv9YSxvchtYvKwuwUwy57NsXApBBBTZ6aUgdF2RD
 VDH5DIdzQkwB1+Qtl2DvimVA40YffXkjKFsrTeEVOB6b+GIBIklU0dgpbbKSnlJw3i2I8=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Rather than just failing silently, let's warn the user of device remove not
being able to take an PM reference or the PM suspend path still reporting
inflight jobs. Neither situation should ever happen.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index ec2b1d29a26c..d75566a45392 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -9,6 +9,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
@@ -346,7 +347,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 void panfrost_device_fini(struct panfrost_device *pfdev)
 {
-	pm_runtime_get_sync(pfdev->base.dev);
+	drm_WARN_ON(&pfdev->base, pm_runtime_get_sync(pfdev->base.dev) < 0);
 
 	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);
@@ -504,7 +505,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
-	if (!panfrost_jm_is_idle(pfdev))
+	if (drm_WARN_ON(&pfdev->base, !panfrost_jm_is_idle(pfdev)))
 		return -EBUSY;
 
 	panfrost_devfreq_suspend(pfdev);

-- 
2.55.0

