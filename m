Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BBF3BD63D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950741; cv=pass; b=rYh4j6eL8PlQ8HZCQ/6tLMy9OaCOIztHIcqtZCcDeyyWvUQI32SqtK9UtGu8g9/Ib/j+OWsHkGbXavA+lbksDnVHpMJGXTrQY4MhO3Rc/KU3BAH8moezm651kFvg8Nc1QwT4CvC19eTeAD1afADgqLAOfq7gXAVbFc86GewnFds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950741; c=relaxed/simple;
	bh=J9CHCk3QpX+mivXyUDpPJIhyJ9HRDBF/6DqmUTlUvYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/CvdxW4EfnxYM4YG33SBkGO9/T4MFcw3ui3aV7qYbxFIM7mlXv/Q6xC44A84e6bjCOxsKWqweRxmjpO6HujVuWKwEBXbp43otqBwIEWUjeWfx5fkQD5tp4L0xbuDH+Ok67FryGtjwmOVy1TvVeMHAWv6U+7Me5stvuVVYIL/q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=A0ptoL6U; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="A0ptoL6U"
ARC-Seal: i=1; a=rsa-sha256; t=1787950702; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zes/b+aLXcYvsycA3IP9Sh4QXjkU4t3K5+kMf5l38LzW7NVqlYlX5fU6275DjUkizSvPmvZjZOeOM8F6q+wervM9h+DURQlJ3c9Q2m5wwDK1lx7EwTU8Ch4ew6xexopZ9nz57KVmTCPoMEchTKcHoLQ7RSWTwKXhEhAPNMidqCs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787950702; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3jrlPnBQL8zuTqbDB87H629jdJh7w401wmqKLNZZ1mc=; 
	b=YT4Ec2njXYeVmCI4XkQ6Mkkie4BwESOLH6pN7G9H1apG+tBWI1uemqDjc++QnVgCRHHm0ZrZPy8F4fofCG8kPbFqFkBRb25K0TGFi37IdjigN+zqxL05t4Dsa1O0cQwNnG8Gxlzra6B3ejEwZu1vcdMSgPzd0YHkaBqz8gRDhIs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787950702;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=3jrlPnBQL8zuTqbDB87H629jdJh7w401wmqKLNZZ1mc=;
	b=A0ptoL6UQ0Ae5IkseuwyxhRJc2QUhTK5pyS9OuhJ+gsKWjHwoenGLOaXYxiDtdU7
	6ivkdv6oFndC4oMIUg9lkjsxi5932InLRFq2sm0nQcF3yA52Wpkv8arNyEUjfxyMVop
	sh+TSt8GvVhlTU6T2OMwOUQP4xSAOveluIhy9pDk=
Received: by mx.zohomail.com with SMTPS id 178795069985046.25160696824071;
	Fri, 28 Aug 2026 13:58:19 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 28 Aug 2026 21:56:50 +0100
Subject: [PATCH v7 10/17] drm/panfrost: Add warning messages to fatal error
 conditions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260828-claude-fixes-v7-10-72a13b2c125d@collabora.com>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
In-Reply-To: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1551;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=J9CHCk3QpX+mivXyUDpPJIhyJ9HRDBF/6DqmUTlUvYo=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqkfYtKlexg95emX9ufAA1lnNe8x7alxvV94HlC
 j4ZU8buu82JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCapH2LQAKCRAOJn5M7lND
 PdurDAClIWb0cipnrF1nUZLIjLCrtch2qljRkqPpSfZCutJrPQDIG4CsdWAW1DXRj0S3Yp41yzF
 8GNTuiYYFzYSyYoRfpZC4YK23CyTJTphUc+0Lmz6sKHFyq1/Me7QvOycpzAmniM3M8Io/M5zpq6
 GmH5GY1ajpV0fiHD3w7QOKteN9HayPFnU24Tkf5XyMBEuD0MEJEF6+tUF/2WU9dlh0o+EGK6edZ
 LLh/ziMxSNh5hq5CqZDZgNS09XqezF00vsjWbEqYylRgqxGGKyENL+faTkp7rYwLkLMDkA/4+pK
 jYwxaX4lIeVdZZ0Pu6hMOY9D05w1x0EBauKqGrjKpGaxo8x2kCReqiCXo83GFItBv/3Y3N/nTTZ
 lQ//rmOz4arDEeU2ivUFjK3SPdPCVn4RcC7mc5jABZczF+1XKIn1rn9MVh9R75AXa6gFB6hvyME
 +UJH5vYUf7TfNciBJyRfVS6sK47dLdGt5jx/EsNKGx3tmUh8/8q6SM+nDeiCsYAyyF+EA=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Rather than just failing silently, let's warn the user of device remove not
being able to take an PM reference or the PM suspend path still reporting
inflight jobs. Neither situation should ever happen.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 70c8109ea698..d8acae9b8cfa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -9,6 +9,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
@@ -367,7 +368,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 void panfrost_device_fini(struct panfrost_device *pfdev)
 {
-	pm_runtime_get_sync(pfdev->base.dev);
+	drm_WARN_ON(&pfdev->base, pm_runtime_get_sync(pfdev->base.dev) < 0);
 	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);
 	pm_runtime_put_noidle(pfdev->base.dev);
@@ -517,7 +518,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
 {
 	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
-	if (!panfrost_jm_is_idle(pfdev))
+	if (drm_WARN_ON(&pfdev->base, !panfrost_jm_is_idle(pfdev)))
 		return -EBUSY;
 
 	panfrost_device_disable_hw(pfdev);

-- 
2.55.0

