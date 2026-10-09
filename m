Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8584E4319
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549339; cv=pass; b=Aw0ObUq+95zlSQxiFGwGdU2fvbj3ndcYx34JokMYexCeLNGP1RWHbNsTt+X8a/niQYiNSjp0kYuaKdBNtn0gicD8G3Rhd+/31UNJoLPU7tYQVQAIkcRiixaRXdLqwsLVAYx8MqyF01tFrf07pDh6aUB89Fe/+pji8JI8+SVAzPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549339; c=relaxed/simple;
	bh=zj6ByHcx9EXAkKLvo7VN9yTxNWqqlfy+DFuHpA3MNsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cqBKlqqDB4nKnJ86Zh4lLGFUxzf0ct34Hq+ku00hcUb42S0zOE0GCw2BvAeyjS0qi5GbUFoSMk9o+R+F7xYzPIV7qGxdpWjU5CNzR8Fz9+mUFoJ1ui78N73Zow06KfymGG5pHFQKfh1rLZeky7QGOVx71xoNF4aSxnzrl05h5Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=fXCyaftO; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="fXCyaftO"
ARC-Seal: i=1; a=rsa-sha256; t=1791549309; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PqvjW47Wuaqv4tx+3v6UWt+UaIdc2iMrFKgw2jmcNG1aRl0ffoRIF27GTqVWd1TxYL9OKErcIU8FmWI5jUcQRLUkpKPlyyEqqCzJ1nSqZTg4e5hP3srtvPmBIN1swKYO2VVtInQ3FjAXLzpns2oWdXM6nR/vNLp0fpjyumzMR2I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791549309; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dDjMh1GirSnCP3cCmJwz3WFUErTlegEWrnDqmZwHstQ=; 
	b=KFhH62YWlSgqcuXlPFQyIUhY4F0wlssKRin9/mssPpS/7vgHSCHacU5Pp/3o4QJI4cxqLfJufFTo+dGvWJS8r0O+cFO9PyKxncwR9jE8epU4/ghstr0aIPBhWnBsz+mvImWRPP4RuHpXis68raoXmQeIk6EJz1D3wfKC8fP4/c0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791549309;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=dDjMh1GirSnCP3cCmJwz3WFUErTlegEWrnDqmZwHstQ=;
	b=fXCyaftOxbMUthLHT6LObbcFw97GND7DE5qhOr4OcLUNZaNhTpKm9pSVfMWj13a6
	SUaWGfOmUBPZJgYC38hqXn968alqWZZzWccE0rYbZd1nbUp3ziDzVgoU67DGWPP0N96
	OGVE1857uwhr5F6qtLeXSnVPLORftYwvlJy+ALJU=
Received: by smtp.zohomail.com with SMTPS id 1791549307607619.8839588448393;
	Fri, 9 Oct 2026 05:35:07 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Fri, 09 Oct 2026 13:33:59 +0100
Subject: [PATCH v14 12/15] drm/panfrost: Skip cache flush/invalidate when
 enabling perfcnt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261009-claude-fixes-v14-12-cb743b3b973b@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=zj6ByHcx9EXAkKLvo7VN9yTxNWqqlfy+DFuHpA3MNsY=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqyN8vDIsiH0c93VlcDQOizcHrqGvl/sXjd/+yn
 SZFXHcuPuGJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCasjfLwAKCRAOJn5M7lND
 PSr2C/0VbYcfLrP35Q0Wo0U4UG56QKR7w4T7E8fRlJGb+k0M2Dq00qfxXyU5gup6pgiCvhOC242
 oi44d3iQ9VpV70EVhTpA9jf3VVjoEMem7anXdhoGzrRwbQeG0UMru4AKuj2YBSuJeKdYmAyxzYv
 AFVFJ2sAfCyAfaW+Wm622gsLOnFNHXJ5+RI9Lm0oSuUCifPvMKpNGFPfVxWUm9RQb50G7a8GLkO
 yPZqgiOyWzHcev+bwEj7bA9lc+WT2DTwuIsJ45bPWVDSZikr9sfGepK066L2oTgjFK4opLl+aM+
 CrACTjujSv0OYieDXf63pQqAvxbEtBkR6+64n0axAuFQRvmrVsoKkoh4gZOlUpcwlMJ/mUsw2Cl
 we9VWLqNfzyZFbN8uv9X6dd+oGUKgksEmqrPycmFlz6x+dYbAE4afsmTuEG7hpe+vnzoZL9TYWb
 oYteSonMV6cGVOlc01K1G5aCvhv+zgZGIMEB7qxw2krMHUCJIsD9eMVjm0WOHMSrOsjtY=
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

