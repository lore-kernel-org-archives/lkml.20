Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3B246EF77
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779200; cv=pass; b=cKrs4z/zGzzZyHxFGW9/hmZRkEYQQZKO7HcCp4L3dyVPGVKffFvP8EtXKm780mMXZBAxwCaksMBF5vtfdP0hrVnI6o9aGKxjDLYFt6n5LRE0tncxn8DRyQWwmRXHROg07xHUfuygNua0DmZRVqvKvIeHDRXea0uEGOFevchhpcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779200; c=relaxed/simple;
	bh=1NC6JbP9YeSjejJ7XZFftPMwKC3c1jXoMn6zNAHeTm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5C0mdXyEqEGOGoO8DDQgw4JRyvFwR95szHH0Tv5t7V7UjFoac0+WeDlArAVS3j5aYz7iK+lx2eLa5ZxDN2R0JXd414VCrU54MpkspYkweq4nTFzPpru/0wTojiNYe7T4BP+8E+/ocnR4nBfSazyDIM/8VzM6lYUn5zauXmvmfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=ZSm+2DS+; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ZSm+2DS+"
ARC-Seal: i=1; a=rsa-sha256; t=1787779162; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ft0CFpNXm0AEVlEx7ttyqqIOBJuo3ENpATHlB5Nwc4aWUnowyHpp09T23c6ZNNjJQ10nfjPMhVS49yX/BYMXQArBaieJgocZK841LWEu/Newmy82uE82/Ikg4lZdldEKxIMGW2cx1miVCzNtf38yE6gzI0c2ngsmzHEueJO7I3c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787779162; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3zLgjT3JfLXHkpzJh4PbWNTcLr4FUqsFF57+vQ+BFbA=; 
	b=EvXF8zht69wXNekn4uJIELhYDMWC8Axxp2s21cqiGpYIxeLq3pTDiPV+b600mJDiDgEVHO0wLZL2FZrnk5UFV293QK/jpnQi0oBMHxe/09CBHjiyppSSCuD+Nq/Gdc7nZwFqN1gEJeigFFk8AnUhbdTJb/8fTCNui02TIEQ6JEk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787779162;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=3zLgjT3JfLXHkpzJh4PbWNTcLr4FUqsFF57+vQ+BFbA=;
	b=ZSm+2DS+S1RKBZQObx+ub7Mc5ckMEukc956nrVw1aKYPu1Ke+hngTOS9YJNp1xyu
	dTyzWrb0oc737OuUAdip0/LE9gN+0MNSPhV+Ced/zPvisWWAHf1vXj8aSPm0SvCXSEy
	Rzq0NPApdWZW2NXDUIOqR8pBWsUui/hKCMGOj8kk=
Received: by mx.zohomail.com with SMTPS id 1787779161566577.4919440356412;
	Wed, 26 Aug 2026 14:19:21 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Wed, 26 Aug 2026 22:18:13 +0100
Subject: [PATCH v6 11/16] drm/panfrost: Move perfcnt GPU disable sequence
 into a helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-claude-fixes-v6-11-78119af409e7@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2775;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=1NC6JbP9YeSjejJ7XZFftPMwKC3c1jXoMn6zNAHeTm0=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqj1gM7M5bnObycS35/fZqM2OZT+mSTvtK9IK2o
 LmYCMwY4WOJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCao9YDAAKCRAOJn5M7lND
 PfgCC/9XbaiaGpYK+7fcJxGuKnhNnsc8UBBf9YED4m76oIxsea0hbBT+RCMEvDwQOlRlNN3lAuQ
 6wXHzhFHiWg2GLBNKXhmCLZdx2sLRPIprNkNnCcr45zNTrvfohI1HQDuJcyi1MeLlat+SWMXZHa
 MCziRtGg0ce53UjgeVwOodiauQAKLyRu6Xvi/WcfHTMDFRULVWENHt+AvjRulalA2Bb+OMVTFWV
 BNxM8ZyuX+mtqcxy2S1JsMRlhPOYasT+YuVOUVvih7IScHSTWFl4i/Ga71Vzk5zGDQwf1NmSeme
 B3ATgfQIkKacjzvnU9AisZD/G+9SMAzAJDO4au2SXRNt3HTBiSfraN3L8/h6H9G+0JFGx2R9m4O
 k1WZQ4ozkwnYJkc8D+xOP7Q5MiDGz+2WU9sr84ddftdc961IUMqP7pj27m4Ew34hyeh7Uhq8iLu
 i+Rslv7N6T1wYqp02oYwNyonDgzRgzq78tXLrMfgkb8PgFnWABQl4QiPW79192o8CvMuA=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

Just for the sake of avoiding repetition.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 31 ++++++++++++-----------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 7020c0192e18..f71534e741b6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -35,6 +35,16 @@ struct panfrost_perfcnt {
 	struct completion dump_comp;
 };
 
+static void panfrost_perfcnt_hw_disable(struct panfrost_device *pfdev)
+{
+	gpu_write(pfdev, GPU_PERFCNT_CFG,
+		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
+	gpu_write(pfdev, GPU_PRFCNT_JM_EN, 0x0);
+	gpu_write(pfdev, GPU_PRFCNT_SHADER_EN, 0x0);
+	gpu_write(pfdev, GPU_PRFCNT_MMU_L2_EN, 0x0);
+	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
+}
+
 void panfrost_perfcnt_clean_cache_done(struct panfrost_device *pfdev)
 {
 	complete(&pfdev->perfcnt->dump_comp);
@@ -193,12 +203,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 	if (user != perfcnt->user)
 		return -EINVAL;
 
-	gpu_write(pfdev, GPU_PRFCNT_JM_EN, 0x0);
-	gpu_write(pfdev, GPU_PRFCNT_SHADER_EN, 0x0);
-	gpu_write(pfdev, GPU_PRFCNT_MMU_L2_EN, 0x0);
-	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
-	gpu_write(pfdev, GPU_PERFCNT_CFG,
-		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
+	panfrost_perfcnt_hw_disable(pfdev);
 
 	perfcnt->user = NULL;
 	drm_gem_vunmap(&perfcnt->mapping->obj->base.base, &map);
@@ -327,12 +332,7 @@ int panfrost_perfcnt_init(struct panfrost_device *pfdev)
 	perfcnt->bosize = size;
 
 	/* Start with everything disabled. */
-	gpu_write(pfdev, GPU_PERFCNT_CFG,
-		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
-	gpu_write(pfdev, GPU_PRFCNT_JM_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_SHADER_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_MMU_L2_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
+	panfrost_perfcnt_hw_disable(pfdev);
 
 	init_completion(&perfcnt->dump_comp);
 	mutex_init(&perfcnt->lock);
@@ -344,10 +344,5 @@ int panfrost_perfcnt_init(struct panfrost_device *pfdev)
 void panfrost_perfcnt_fini(struct panfrost_device *pfdev)
 {
 	/* Disable everything before leaving. */
-	gpu_write(pfdev, GPU_PERFCNT_CFG,
-		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
-	gpu_write(pfdev, GPU_PRFCNT_JM_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_SHADER_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_MMU_L2_EN, 0);
-	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
+	panfrost_perfcnt_hw_disable(pfdev);
 }

-- 
2.55.0

