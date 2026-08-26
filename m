Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D01448B94
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756189; cv=none; b=CusQJ4p8jQVzhfCRP1lAJoRsW0S0eJEvdp9+cE+4hI2LT8azEwVFw5E2Gy/a+V2eFETM+9tZ5cin0/iPaayswICcubVfZ1N7yTAL/30XfBZY7Io1h9+ZQs4UCkIrvQSYFy4lp0AoWCI/9JUWB+BLim1kqz+SOBXV3p9nriJTwVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756189; c=relaxed/simple;
	bh=aUM29SZkaOd9zVNrKXQmiHOFEwVU7hPuGW3WA+deM88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCYZOcnXK5W1ePFPIiOMWRyk75ML6XDv4JvVY4XZp13VeM2qTeVj9NIGj0ceF9NgDrMqNP8KILyJGlQ5WZ/QFN1mSnxot+ytaXQTXLO7Sa/OhyKpH/zSU3xMrISrKRuXXvTchCt8EGfE/hN9DM1ofssghoptbYT96jRtmMSJpkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UQbrvJEI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UQbrvJEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787756185;
	bh=aUM29SZkaOd9zVNrKXQmiHOFEwVU7hPuGW3WA+deM88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UQbrvJEIJ5kW8Hl1pmQHxtKF3cG36QoUSyp1zFVtjY16p/r4TipDkJx2Ov75PXlmj
	 Ik5Rcwt/Q2mKLWYJ7YBeldDvQSrMRn36XLRsNqiGOnqNMhzoT20pymBH/6MxF53yX/
	 f56Bqek7ziSh1cfkIKIASvjPpRvTpZpv+wQdTNm1eSnBIoa7B29Lz0kOivEeqVa8SA
	 POTbPPZBxB+ceOC8BWfyPBYgmcSVF60XT3uDubtvK1YC2aeFiqPd2nabBSbGJzHZMR
	 zWCVQ3D0t+W7UE752ARIVxExxsPREWePxUqwoGcWMVHp67izMBT+ueDA6w8neuS5Lh
	 0ZNZ4FcP9ZQ5A==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 12C1417E107E;
	Wed, 26 Aug 2026 16:56:25 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 26 Aug 2026 16:56:09 +0200
Subject: [PATCH v4 10/18] drm/panthor: Check AS state before disabling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-panthor-unplug-fixes-v4-10-982cc8f4234b@collabora.com>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
In-Reply-To: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787756178; l=1805;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=aUM29SZkaOd9zVNrKXQmiHOFEwVU7hPuGW3WA+deM88=;
 b=vymce1x9mDtd5VRXzD7RXPKc+/ca86OW7oKX0ixQicwArzhltgPCL8SK3HeyQyVvvM/uIs4lH
 OTOmLW4KDsYDWDkYLO0l5GvMiYToXQSKjTQNBMozh9KpXCTm0eyF9BU
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

Use TRANSTAB == 0 as a way to detect if an AS slot is idle. This
allows us to make panthor_mmu_as_disable() a NOP when it's called
after a SOFT_RESET, which will be needed for our unplug rework.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 3d9f9bf29e1d..58f0bd2ac7a2 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -640,6 +640,10 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 slot,
 
 	lockdep_assert_held(&ptdev->mmu->as.slots_lock);
 
+	/* The AS was disabled already, nothing to do. */
+	if (!gpu_read64(mmu->iomem, AS_TRANSTAB(slot)))
+		return 0;
+
 	panthor_irq_disable_events(&ptdev->mmu->irq,
 				   panthor_mmu_as_fault_mask(ptdev, slot));
 
@@ -662,11 +666,17 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 slot,
 	if (recycle_slot)
 		return 0;
 
-	gpu_write64(mmu->iomem, AS_TRANSTAB(slot), 0);
-	gpu_write64(mmu->iomem, AS_MEMATTR(slot), 0);
 	gpu_write64(mmu->iomem, AS_TRANSCFG(slot), AS_TRANSCFG_ADRMODE_UNMAPPED);
+	ret = as_send_cmd_and_wait(ptdev, slot, AS_COMMAND_UPDATE);
+	if (ret)
+		return ret;
 
-	return as_send_cmd_and_wait(ptdev, slot, AS_COMMAND_UPDATE);
+	/* We reset the other fields late to ensure that, if something fails,
+	 * the page table is considered active (TRANSTAB != NULL).
+	 */
+	gpu_write64(mmu->iomem, AS_MEMATTR(slot), 0);
+	gpu_write64(mmu->iomem, AS_TRANSTAB(slot), 0);
+	return 0;
 }
 
 static u32 panthor_mmu_fault_mask(struct panthor_device *ptdev, u32 value)

-- 
2.55.0

