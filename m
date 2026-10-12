Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB314908B3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816556; cv=pass; b=d3pvxFpeS8o8SMOFfRdHrJaeRgSQnVXaSnN39bmzlKGUfWYrrTCbodBEZeF7B7M70Yl6+7lLfQXtoZmr6tRqiwEGvoiGUVHtBHjHvpbNw71v6Z0UZsLmlSgIjxZ6GfqwiPe0Ukv3F5a5lXbPY3jpoJTb0YTXYSWsjQrlM8tRFTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816556; c=relaxed/simple;
	bh=ibqQrytkwD4dZGH6qzBtr8PizCkzDsq89TU6EwA853g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yv8ZpaoBx7ENxG1Kp4TPvzmzephfqeaqCmx21RGgloFDmExz2Ar450kDU4khyBkP/r2fjWGLqjVGK7cueyqDY6boWFKFQPqso79we78HLJcRnfH4Gox4lix4sJsv46M4PFe62z6zYWRQlOgRDNyISS0/NkSsa7Q/2lQ6UNfbxsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=j52znOYi; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="j52znOYi"
ARC-Seal: i=1; a=rsa-sha256; t=1791816530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VWfcLbsOi4B39gH9aqmIUn1YAx4fs67w4cEsAhxbMCGxg9bM5PdZPVCiQD1U67NAE1QIbTaFbjTpfxKLPwjhefM9Nm5HgrCrLnrof3IS6B23jFQnjsmjr/N7FOzgNiys4MFyiI6xUeU0CshYPLqtxQgu7DiabymE1tkchUC+Wv8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791816530; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2nQ1TX+5x9cuc2w92LZrFtQlD1LLotYmanIFBBwFcIM=; 
	b=ekbF9U2SOqSH4uLYgKC/mDrCaIYe69aCUrbnaMG0FT+F4CTfGAoQYw9zVw/Std1/HOpY9C5hIj5+6hqNuzH1C9M0xSToMLqjzAN4eeltqxF5l4zgap/FodAIE4z6mNuU7sCo/eNrqrB2cX+yyabOLdprmTaHfkABoOsWs0FFZYs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791816530;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=2nQ1TX+5x9cuc2w92LZrFtQlD1LLotYmanIFBBwFcIM=;
	b=j52znOYiE5tRqrYRzp9MKJUACWH2QyKdx3ZIPB/C4YspQ0tC4unTJeRVuBCiCUF7
	g5l/u5QX1XBEsPbDPhJCLjh18NwUVnHS+8nYIMLk+ehpQ4PgwRPxtV3b8GSWTKaAMrJ
	o0FIwqX63dN+OnKIdQlUbJ02YJyBtpb3QBuZtLp8=
Received: by smtp.zohomail.com with SMTPS id 1791816529194709.4607257124592;
	Mon, 12 Oct 2026 07:48:49 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 12 Oct 2026 15:48:01 +0100
Subject: [PATCH v15 09/15] drm/panfrost: Warn of RPM get failure at device
 remove time
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261012-claude-fixes-v15-9-bc0a6c498553@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=ibqQrytkwD4dZGH6qzBtr8PizCkzDsq89TU6EwA853g=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqzPMa2BsSvslULVxkJ/r0QxpZGiBeyYlrG9g4f
 Wz8YTbPWQ+JAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaszzGgAKCRAOJn5M7lND
 PYwlC/oD7QfjG0brIQ49qFvx2tc+8h75rFTi0CTI5TcxkzUcgtPzvOdOCiKUO/YwYCL/jMcGyL1
 dE5du+WW0Z92h1iR0WpTuhkEs7P0lg07xB4Vvpg5CM+GE1qOuNbRfL5lrXQLjX4ApvGtV5Tn1hx
 qt3kp+NFyV78xykGwfnEO2yv0TPPSAWUIeny1C0BNTC72ttIrD+YgFweyIUhHZMbpgJ9sOkvzAn
 qHWLaWVOiU07exnlRn+G/3TEbgd4Mr3m3qs+2HGBHnWJQpg9rjjqIjNSPX5jG0LQfmhCauBStJ9
 ZQM6dByIujHaCYfwvKToECCtkz0H5qIHbEZ2kMKxmsxMuIgzkJmuwTWN2TkG57Ys0mfL+zmdjQA
 c1qoNraucQTCMO7z1BDB4/HcW72K++1gqwUi+QTR773sCENL7ZFv2ddASgRFSiVzuL1V5f+tr0p
 WvT6yw2lb3N/5PtD1VBiTY7sMCLnuWnxDlmPZ5kQ5UoGUUMzggy/1lUKI8bhgsbBR9sDk=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Rather than just failing silently, let's warn the user of device removal
not being able to take a PM reference, because it should be seen as fatal.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
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

