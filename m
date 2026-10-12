Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED2E497B95
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816575; cv=pass; b=GQkiVvdCwQFpZ6FK9NgmB3jP0e/Ds4BXaT8TjaIZVt6FcwOCTdi6y0NGvtq04lZ+oeevwKP3EWxfCbemZpeW7VcvK3wZMIcjBNTfH+ZZVaB0cCQfRB+tlvtTFDUCtuZclhIIaAiN51guSUAk5zOyJfpQ58G10ONlpsfUKgHFUL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816575; c=relaxed/simple;
	bh=lE+jYQMxilQCo6fuxYUEC5h25G7S4Oeg/1Oo4gXCRP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HNlvN02KhegnHNzoGNKF4m8ES13n0jNiZ+Vcayxn04G589JqfE/OJtgsJbJshl4/gLCRBs9M07fGr/ZNLEJ3CuZlwRmWL/fmAE5ZU0cuSoMYvKcq61lf/aALsayhMsXu9QhUGWFxTfUzYaDcQaRLvUj+H0vqvNvxkIf1pHKnkGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=kKswHAzq; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="kKswHAzq"
ARC-Seal: i=1; a=rsa-sha256; t=1791816548; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UkywSF31lkOPT1Mu0Xw15D0HxRC7ZdhLdpfRrf/fPA8LalIFbbD5Pni18oo/FdJJPNchXvomTHGHoNhgIcPOoLg+euqiN4QxXXpHOBL16iEU7VVtCQq+p9ukSTQNqP7ve02hbvYdQZTLyLczgDTUj1+4EbYNFPM57MvIuTPhXpI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791816548; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pMwck01gWCGwTLmYzhbCAC9v9p9fKOU6QiNin4sTYE8=; 
	b=kveh9W+xOaIQE4BizARtjFcOUu9UDj9iRh4+n576z7DRVzak43WZhfJO7WXILEDWxB3HRgWzft3/JQPb3iPjJZ834R9YRWxLLp/ubzLPg5oo7YEqImCQueMAZfnI/3bwhENVZz7MEAJbY76glJiZH4hNfb1UwOUAfYCZ0/3A/c4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791816548;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=pMwck01gWCGwTLmYzhbCAC9v9p9fKOU6QiNin4sTYE8=;
	b=kKswHAzqq5zBRaRmsyOy+jC9lM4JTCtzflPg7bgtnQNRZGhRYeYo+bl1UbeGb4yl
	VIxihyAkX06lBwvkDPjLFaSft3cF911Idvi7boxOv0PoAV1TuS5DHC+48vpboy/tCc2
	BlqMe0/vhA7zEcuS8mTcB7FcGrZOrgtlYHvhs4KY=
Received: by smtp.zohomail.com with SMTPS id 1791816547287995.1377816619771;
	Mon, 12 Oct 2026 07:49:07 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 12 Oct 2026 15:48:04 +0100
Subject: [PATCH v15 12/15] drm/panfrost: Skip cache flush/invalidate when
 enabling perfcnt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261012-claude-fixes-v15-12-bc0a6c498553@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=lE+jYQMxilQCo6fuxYUEC5h25G7S4Oeg/1Oo4gXCRP4=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqzPMbzijBA2xp06SRN8jbecPSRjSdDJITTPop2
 G4MvFL4iNSJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaszzGwAKCRAOJn5M7lND
 PcWdC/0b6BiwMzbi7xIuMZOEP2bF5d81W8vLAaYkiycGBtYwhyDG9QMd5QHp+2k/7sQ16ZXPhYq
 kj/+8Set8KzjwczQHVSB+zM7fJLa5E2/i+y6W3bTg77VL61hP3ssyiDcVhxTRTgSievUz3FjTJ/
 bXFqEADaHagxQDAfhzGUzUpINQSxmkzPcWGZ1og2HhXmk0po5zDhfV9QzOkpaZ2p4Fd19jRs9vH
 PKZxLyKG+X6wUh3NbKMu0AnIi1hyZx1OH/tDD1pPjQnmFLfWIyjkAaK85KKBPE9nu7PdA1zPaxB
 +3JyJLIOKtvRy/2szByp83ujMcELiPB0RqnMCnAeR2J6es1oOGDGT6CexRBFZB4egXr+F0lrgtg
 H9ucHp34NtzHDwQHMICbhhCUrPSGW3I+WWENjM3MKUijWPrCuAfcUz0DpeOWFc7gzmCORns3Vld
 tMxK+pPFE7ga4wh9TmlKe0yIuwSSfPaTgBH0C6M2QSHWAFMtrsB+4lfHpEVj/H36DP2xg=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

The GPU cache flush/invalidate operation is unnecessary. In the usual case,
before a perfcnt dump is requested, there will be no stale lines in GPU
caches for the sample BO's physmem pages, since their memory had not
recently been addressed by the GPU.

However, in the off-chance that the sample BO reuses memory that the GPU
had recently addressed and for which it contains stale lines in its caches,
there already was a FLUSH_PT command being issued as part of the buffer GPU
mapping procedure, so by the time panfrost_gem_open() comes back at perfcnt
session enable, stale GPU cache lines should've already been evicted.

In either case, forcing a GPU cache clean when enabling a new session makes
no difference, and removing it simplifies handling of the error path.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index f71534e741b6..ffc77121070e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -124,21 +124,10 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	panfrost_gem_internal_set_label(&bo->base, "Perfcnt sample buffer");
 
 	/*
-	 * Invalidate the cache and clear the counters to start from a fresh
-	 * state.
+	 * Clear the counters to start from a fresh state.
 	 */
-	reinit_completion(&pfdev->perfcnt->dump_comp);
-	gpu_write(pfdev, GPU_INT_CLEAR,
-		  GPU_IRQ_CLEAN_CACHES_COMPLETED |
-		  GPU_IRQ_PERFCNT_SAMPLE_COMPLETED);
+	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_PERFCNT_SAMPLE_COMPLETED);
 	gpu_write(pfdev, GPU_CMD, GPU_CMD_PERFCNT_CLEAR);
-	gpu_write(pfdev, GPU_CMD, GPU_CMD_CLEAN_INV_CACHES);
-	ret = wait_for_completion_timeout(&pfdev->perfcnt->dump_comp,
-					  msecs_to_jiffies(1000));
-	if (!ret) {
-		ret = -ETIMEDOUT;
-		goto err_vunmap;
-	}
 
 	ret = panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
 	if (ret < 0)

-- 
2.55.0

