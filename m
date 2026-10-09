Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB7C451981
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549326; cv=pass; b=tDn6JiWO8W0HRspyOHQj//p3soN0EzMglMqCdiCX32ZpZ7p8LG8EqgdPeNI0sF3RQ9JyCiivxmM55PaBbokkVGPc4bx/+yuPvsGQSHDh41DcGMuUQztL3Fj9QWll4mT2dGZoAKtfuaWwMCY9ewQkHkP924R293Cohq7gknlU7CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549326; c=relaxed/simple;
	bh=C+aZNX7+BnRco3oE1Uwz3UD02CNIOs99szgIunWDsWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qx3NUvYOiZQRAy0MESpf1nHhF63da5coOecVXtRbQz3fjUvGpdCWllzemkz55F4gaegXh8C4xUk3R9i0g11EOgSkQ9gvHeiIjk/iJF6FPZToW8lPzZ8gU8809wcvo+h3POgs57IMWzo+0E0wv5dp7X9KRIwP5eLUWmzc73fpGbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=K4EVIYrZ; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="K4EVIYrZ"
ARC-Seal: i=1; a=rsa-sha256; t=1791549291; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T1eexLbQfbVurJXZQAe96D7vR8LPZ1oyj5/wT5FhC1j6xviLXMsTqxxVJRHl3ryv4foWFYiK/wJCSTAxBiTuFvayc9qu08BJeJjCoYJEaN5FRUkldYfiCMLRa7DfiR0OFevt9jGxDxJJOAtcT+65oyzxiLcODF6lI6BOLJC4tKc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791549291; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1ZKPGzGFIKzRpgJ8bQvtWgmP876BGVh5STCt3ZGycg8=; 
	b=UKKFo6MwqbabJfrYHVOxE/DAqhLjTB5m535DjqniNsn2DaWMNNNftuoPjd7D1Ldd+uHBjMPX+frAwHwIRnh6IJ4ZA8l4+cu8gW5WLxR0Pm7zcaxu017AXIDx4QNpmp8i7hlfl9/oPQDZzIgyk/f2vwYWKXw0ZRXdqytMXq7tAvU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791549291;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=1ZKPGzGFIKzRpgJ8bQvtWgmP876BGVh5STCt3ZGycg8=;
	b=K4EVIYrZC+O8M+BPCSuzTG/jxIRMst9ofip5SWQdpc40aIqLadrzHtSkxc8vv9YW
	istR3h9PtcmQBKSlYYCXdN+cKt3cmVd3DwZcFa9QZJLGMZ8q9zU4iTZDqodHCnZaiKO
	kS8XReQXgTH94hfiZ1EHig1YAluTvDgnneDgjLD0=
Received: by smtp.zohomail.com with SMTPS id 1791549290385458.0726644044772;
	Fri, 9 Oct 2026 05:34:50 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 09 Oct 2026 13:33:56 +0100
Subject: [PATCH v14 09/15] drm/panfrost: Warn of RPM get failure at device
 remove time
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-claude-fixes-v14-9-cb743b3b973b@collabora.com>
References: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
In-Reply-To: <20261009-claude-fixes-v14-0-cb743b3b973b@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=C+aZNX7+BnRco3oE1Uwz3UD02CNIOs99szgIunWDsWQ=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqyN8vj4T44WlQrip0z29FE6NTOK1rptXAEdxRk
 R88gh/+PmCJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCasjfLwAKCRAOJn5M7lND
 PSyWDACmx30nvVAS4jyHIAXZrDhvp/agXcEp1ju6Ixdqi6aNkr9MZ5DYqU8KX2/pF181mUtNds3
 ENkJJnesF0TR6fyIG2SXW3SqiTJ9ARtlM5bvXiDaY51RDyB0x6Glha30QDy1obMf6HtIk1ZDTSN
 KiC47E6SNxO4uZmDWf2DthUQSZJKVKdfXRrFjRHaHi0qrzK3l6Tr2gjgJ5qmrtqRTM85nSRewmb
 IsufMPyqRcrHsJUjtXiG/v+7aw6qcywfnM4fJgLVMqb+VPnxhDRIncaSl7iN/qS95okgaXfTt64
 iHxPstMYjWJNvIitMc6+Y79KaY5W/JoJbhdadV9RT37j3hpe8osaC7UkMF0p819JT7PBIKGf/jF
 YZFCogczCWdz8LXXg9WOIuc9jKMxuMidubrP4w1kn7t+ySyeAJ3kSBkenNxpkFp7I2f903nsUVp
 Vb/tcIsL8V5E+amSe+6WXuAcYHmlLZ48dA3RJZRQ6jIm/8easLt1R/XZsfYgpbv1QnWzc=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Rather than just failing silently, let's warn the user of device removal
not being able to take a PM reference, because it should be seen as fatal.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index a6deabb39fd2..687230225743 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -9,6 +9,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
@@ -385,7 +386,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 void panfrost_device_fini(struct panfrost_device *pfdev)
 {
-	pm_runtime_get_sync(pfdev->base.dev);
+	drm_WARN_ON(&pfdev->base, pm_runtime_get_sync(pfdev->base.dev) < 0);
 
 	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
 	pm_runtime_disable(pfdev->base.dev);

-- 
2.55.0

