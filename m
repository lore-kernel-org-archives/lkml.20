Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFBE3F2101
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812305; cv=pass; b=rScgoyFD1zFTAsxxltHJQzmW6hDPgEM2+pwNQb+Ftfin0ytrxj9KbT1/4RDYSroP3fX4AukF3aKRLPeC5Jul1LYAw14594mcuHg04XTy1Hq2zUe2dwylGc51NYeNurvwu2wu1vBTIcBj3gYBwqWoA6W+Jz4Dlax1Swqb0QlHOfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812305; c=relaxed/simple;
	bh=F0RVJv4zmQDLG69ZrU/+60HS5v7NarQ+E2qnB8Iq9Pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHZK4wDNWAhgpcjQ8qdm33Am2gOp4lBD233Bo7jzPBzORI6NAexXsms8RGktUNU+Hb6HK2+2tgWcf9t9wX73W9QI5XAiEz9BHhUaPjRXsUf6UoL2thKHLHDOTjTvORv2uTXrTqKjTJz7PnDBSwNKTOE+S9r1EbiQqQW81McwS6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=I0IQYLU/; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="I0IQYLU/"
ARC-Seal: i=1; a=rsa-sha256; t=1788812265; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GYjQgPJubFsGiy/35g4tujCU2mk3L3glQRRnQFE1a9XpMYSPTrRkHygwPmkQaL5BVm9rssBvpe2S9q2fBTLublKOevR/W/OXYWRF54MA+mL253Vfs5kvOx1VabogLIF8MvJ97b2b4kxXva+34M22Pa+fqWpEKfRyUJGoeo9vLFI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788812265; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nWV812BLSXmGL2bwlh63A8Rlix0yVVzCrVgfDvlUkzI=; 
	b=KUeDBGJfdJLV5Nfq+89JjgXFQSLAiGxgSzunTyVkksD2FACVs6lCNVGDqoJdQsTP6GyHpMSB5sZ6HWJ/MkDIOuQ2t201Feq+s50VnbueupbqB0rc+Xk2Zj1DTsN7EbsWl0hP/eZElKZt913Cs5okQfFz+URftqhZ+mKqucy5oCY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788812265;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=nWV812BLSXmGL2bwlh63A8Rlix0yVVzCrVgfDvlUkzI=;
	b=I0IQYLU/Ps55gJIig3jwpzqIbIKlZKLFwIv+6QYm2NJMui2Aja1jV2gE6mbRiFRu
	hj8kWsAPRKSZQUOAGU4ZR0oHsxBsxqqLfwvxFlhxIAUZwKjvic0MxNbYdMIGVFt2DWg
	IzR/wTUoZsPGiwyuPpCDvfncyscuLO7sYmSM5KRc=
Received: by mx.zohomail.com with SMTPS id 1788812264158519.255214047487;
	Mon, 7 Sep 2026 13:17:44 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 07 Sep 2026 21:16:21 +0100
Subject: [PATCH v8 12/16] drm/panfrost: Skip cache flush/invalidate when
 enabling perfcnt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260907-claude-fixes-v8-12-c2bcb5e82184@collabora.com>
References: <20260907-claude-fixes-v8-0-c2bcb5e82184@collabora.com>
In-Reply-To: <20260907-claude-fixes-v8-0-c2bcb5e82184@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=F0RVJv4zmQDLG69ZrU/+60HS5v7NarQ+E2qnB8Iq9Pg=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqnxuMJTRWQbeT8wNHkFP/Pq7V1jdosBksWXbnJ
 +FG5RORZeaJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCap8bjAAKCRAOJn5M7lND
 PSZlDACBWqZieqtvUkETvF9tpl6Iq16M5aSBAp29K14Ixxj2FLmXT/dboXH5fpp4Enx7vQP+EYD
 UrvVukt119plJsP+LZXyedjLHAcX4okJoNzWQ9gMi6oFeIV1LR7/fJh3NiwjWIIiggWgJOoWNtr
 HqeAAA+1FCo0VdqO33Fqpr1sjESbhRAWd3DmVG/avcJekR8C21RY+54jaYzXw0y27o5EyGpxRRW
 6rC57YZGW/eahj+XNdQsP6L3fb/5VNhcRBuQLCWBsX6YOUyGD2TAceQlPAvLclM+p8XbAZYvQMY
 WUTeUwJsN0hpJ817TeXnV3RxwGDMqrJR1zjJ6XO7FIiSQVmVBPahRc+02hO1x+sHqvRR81WVIXf
 RNL3pCq8OqDleNLjNBYX53lUrm3YAUJmyE4m0WALSgFKmaInKfVJj3yIqXouQYqDTM3yFc84KPH
 ZkG/mKR7VwuVBZEY+GgniJpNm2eWzeZ2YA6pU3xxQFRNgzJEKLKsRSlHKD6znf/ROB3DA=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

The GPU cache flush/invalidate operation is unnecessary. First off, the
GPU doesn't read off the perfcnt sample buffer, only writes into it, so
an invalidate doesn't make a difference. Then flushing GPU caches after
each sample has been written is enough for the CPU to see updated values.

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

