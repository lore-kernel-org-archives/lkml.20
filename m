Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521AB408626
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253058; cv=none; b=mF1Fi6i8UVWp7kA/TS8oQbh/xiyvHZ2Hl4dG2eRGIYt+6R+6GQGEi9r4CnPXj/XZmOx5AnxLEXywYhZoR/SZxw1eM080NlPxXy/ZnNHvcdEiu6wEAhnptI5q9LiMM2j9NBTW2bSvYXZwjT/REmmQR9M6wNAKXgL9wJ3ilXjeSTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253058; c=relaxed/simple;
	bh=rsgS7rHkTq7viCTKRBVhQwtXUX5Iw9WtW8IFUt/hYzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nuu/7LrxChL8h4vFKLTKurif1FVR3BtoQoA5NHhMBHKNnL456ZjJ2DODNY+F+2qAExHv92woe+qxLFNNCw/6JPvoG0ZGUATdMfVh3wPk7NV+pNRUSFTajEOJP/hZNSdcuva1+klBCg3pMyTGNP4RxVhq337oiZwlcjRSpD9/9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b//Sv/IQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b//Sv/IQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790253054;
	bh=rsgS7rHkTq7viCTKRBVhQwtXUX5Iw9WtW8IFUt/hYzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b//Sv/IQIDLDzU7wIf/kerQCMO3IR1zwBMva1V7e3E8PLIFsf1A4Cqys4qXkpyi3H
	 G1915I+vDaKg5zsRY5x8eVgHlDv1MVeDKgx1jDtEniSYmonyuLgv3v6MQ4dWlm5ahV
	 k/TyUHCD9JeaCkKDSAE+Zul0OAX3XZRv2cOSWqlJ0oZEyQbBFhurlRx7STN2nEM7Ys
	 4vCeW/K9AEuacWKq9jf6gQEt7kSoZmeHm2OAuxda+IBuE5YMg2RlOQKQleDXTkoD8t
	 Fmlt/tDcVbMRET6Gi9ObAnKZm+EE2PRIcHYPnGkmrp1PmyyiKMYF5Y3t22vBCQvLjB
	 gdr/o1JwUPjmg==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA0A317E0D5D;
	Thu, 24 Sep 2026 14:30:53 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, 24 Sep 2026 14:30:45 +0200
Subject: [PATCH 3/3] drm/panthor: Move cache-flush after UPDATE(UNMAPPED)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-panthor-mmu-fixes-v1-3-e25f9b106466@collabora.com>
References: <20260924-panthor-mmu-fixes-v1-0-e25f9b106466@collabora.com>
In-Reply-To: <20260924-panthor-mmu-fixes-v1-0-e25f9b106466@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Akash Goel <akash.goel@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790253051; l=2299;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=rsgS7rHkTq7viCTKRBVhQwtXUX5Iw9WtW8IFUt/hYzg=;
 b=R2OTeuEvmvcvLmu7zMLWxLECynGQWE2U58cPhqAF006drMWikFuxxPkYN2i+75gJR4K6c0klb
 IEJN4Wcgl6IBxFN3Pdyh/lnUDSHtSnLj8unAo9C46DTZS5ReHOXIE5k
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

Right now, there's a theoretical window during which the GPU can populate
the cache with data from a VM that's about to be evicted through the
UPDATE(UNMAPPED) command.
In practice this won't happen (hence the absence of Fixes tag) because
when panthor_mmu_as_disable() is called, the VM is guaranteed to be idle
(no active CSG pointing to this VM), but as we say, better safe than
sorry.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 038a092fd08c..bb71274aa36b 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -631,12 +631,6 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	panthor_mmu_irq_disable_events(&ptdev->mmu->irq,
 				       panthor_mmu_as_fault_mask(ptdev, as_nr));
 
-	/* Flush+invalidate RW caches, invalidate RO ones. */
-	ret = panthor_gpu_flush_caches(ptdev, CACHE_CLEAN | CACHE_INV,
-				       CACHE_CLEAN | CACHE_INV, 0);
-	if (ret)
-		return ret;
-
 	if (vm && vm->locked_region.size) {
 		/* Unlock the region if there's a lock pending. */
 		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_UNLOCK);
@@ -648,7 +642,18 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 	gpu_write64(mmu->iomem, AS_MEMATTR(as_nr), 0);
 	gpu_write64(mmu->iomem, AS_TRANSCFG(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
 
-	return as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
+	ret = as_send_cmd_and_wait(ptdev, as_nr, AS_COMMAND_UPDATE);
+	if (ret)
+		return ret;
+
+	/* Flush+invalidate RW caches after we've unmapped, to make sure any
+	 * cacheline eviction is effective before we potentially return
+	 * memory pointed by this VM to the system. This needs to be done
+	 * after the UPDATE(UNMAPPED) operation to guarantee that not further
+	 * PT-walk can pull VM data into the cache.
+	 */
+	return panthor_gpu_flush_caches(ptdev, CACHE_CLEAN | CACHE_INV,
+					CACHE_CLEAN | CACHE_INV, 0);
 }
 
 static u32 panthor_mmu_fault_mask(struct panthor_device *ptdev, u32 value)

-- 
2.55.0

