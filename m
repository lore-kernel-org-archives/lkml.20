Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA413890E4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 23:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791416665; cv=pass; b=p2c3ZT3JK5RrRB7P2xMJbW1sT3Xx4C9lB77EJC+ppq4UX+LWyfSaWu9LgCq5V5vnPIOEubW7RGwsmWn1KRH8Q6v1ByHJNhGZ8S5Gskq54chQj9CU8Xi8/dc6hA5RN/UiQUms5ENX6TivOQPIR+N8MGxDTD7wJBdIlOvcPETx90U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791416665; c=relaxed/simple;
	bh=1NC6JbP9YeSjejJ7XZFftPMwKC3c1jXoMn6zNAHeTm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUNbxoaeD6CbIRHaCJAPkxOoO8ouvO1oJGx3ZYR2dYPUofLllMb4Per3rdSkCmKLpcPkn0MJsIgMs8XdSwdDC+0cHgIWN81HGEK1Ku4CjBSbbMYEnKZB7Bz+6nua6IP2qOl0Bf5ljoPfcvgh1O1QAaVc901s9FTzIO59FlnNndM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=E5F1kDX0; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="E5F1kDX0"
ARC-Seal: i=1; a=rsa-sha256; t=1791416644; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HE0e3X4rvpTxJG0opnR0kZwUbufyrPfyE7YGmuRvfext7EwSHz3dn3OEyl6YNGi7pjkqAlCpKuomfn5uiW4FfCoHU3jKH3/hh5+RxF17fKVZWXsyc4zZOSF49UZAdShDT71RP+ek+dyAJhS9M0H8jmlaD+sRgfZTrWsbyGBsGpg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791416644; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3zLgjT3JfLXHkpzJh4PbWNTcLr4FUqsFF57+vQ+BFbA=; 
	b=Lu0O9SbF8RIN+gW4a9vheeZNsBxjLq5/teMsCJE48Th1UPQm3Cxsiera+cp0LodlVkVhmKV4FoRttjgRJ4d2jIztMJbkAlWi/xfDNxLClYJumdxb/YtxmAqtrxExxit2xPdL+06qc3PLdwO9l66ER0UiB6rXLwMGnr42stuRB+k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791416644;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=3zLgjT3JfLXHkpzJh4PbWNTcLr4FUqsFF57+vQ+BFbA=;
	b=E5F1kDX0fDS7nrG8hqC/chlbN1OXiEH4gy7NnW0y5yJm72xjiFEoxIq9oASN3aj/
	iSwqmX9fAEWlT58h866u/gCbi1yYkl9vOvuezaJ3aruwhVkMq5aLouqnfMy8v/myoHe
	zJwf5Z2OJhKDT7F3YkLhaqgUVFwImvzZtct6XfmM=
Received: by smtp.zohomail.com with SMTPS id 1791416644222943.7494138748389;
	Wed, 7 Oct 2026 16:44:04 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Thu, 08 Oct 2026 00:42:54 +0100
Subject: [PATCH v13 11/15] drm/panfrost: Move perfcnt GPU disable sequence
 into a helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261008-claude-fixes-v13-11-d6a493185860@collabora.com>
References: <20261008-claude-fixes-v13-0-d6a493185860@collabora.com>
In-Reply-To: <20261008-claude-fixes-v13-0-d6a493185860@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2775;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=1NC6JbP9YeSjejJ7XZFftPMwKC3c1jXoMn6zNAHeTm0=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqxtj7i1ibokgi20pjkMPijObRh1G4dVQ6rt2yv
 gpGeQDfFWGJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCasbY+wAKCRAOJn5M7lND
 PT8jC/4yZkTss+B7neoCiQ4R1XJM8i+l/y1M0it06HaNCHLqShM7j8YD4ba5VMbNmpF8xJGwUHi
 zwkU4Apfh7rc+Gkh7XmoORv6s0m9iPNEnSZYYYvN9h+hLhArqSigwCChAJAzJQhQqPx4G4ROaf0
 kkCP7CE0witxO9OzsOdC1zdJob1f7MKXpYR9WK1nRULr4L+wEao5yBQRnPaIABth+UkRr/IVqzK
 ilnhDkfYRg6IlJZwMo7NLC+ar4JMR+9PP3VHpDBRtDo012wzyDWuPdnxdl67f7fefQA7OenuXOc
 M/VYZT7vRnNJXJUYWpF1zvd+EeBOMLg453D24BQ83ePHuIdxSXg2Or2Dv/HWAQBe0Qad0MikKrw
 wysn534xgpAnb0SMIEw/DL7ZQzHYz3u1wScDLg+my1g+31aGVDBqgC5YI+djdAZEcOqOIV/fdsz
 M37ytTzv7KT0JsxGc+Mdp3XPcHtaiWnkZ4RkhHrIwExL/1ZO4Xmje50f8Y0rqbxZ7orBw=
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

