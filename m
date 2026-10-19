Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504404908AE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399403; cv=none; b=NbFrqA3A3kDvqI1I3izF2ACwCrwIJAzrS9+KOW0o5dU6dwaIOYIAJHegjYizgFbjsyrieXTWeQpGzXqipx/Fb90mwqWn9SoZ3b+4VfN1B3PKfrJH7/Eytv7Cz1GOK7TatI17prls8Y83tfcQOujTXdBqMxrlvqEjl8WeqBgOWBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399403; c=relaxed/simple;
	bh=gzWLeCzefFkwWIhxR3fEpyM/vKrfUpCJyJKJMfvlbVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mh3dB7gpIS7bOqkDeqgRwEyHM9+BPOqKbHsRKIxumjIJSRIBeGbtshr4dQ/GAvvXtekTW8pNmfbIay0Ig94ipUxZVSOOWKFOyRPhxGTRylDQpocOmZlMXrJi+MIhM94J6wBe18FH6ryLCvGa9ATvtDZfsDKJAfqI9A2G1onU90g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mHcNn0J8; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mHcNn0J8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Nu
	0yQN7bhLhr8bDqdr0q6HH12zA2QVcA+U6iZqh2KIw=; b=mHcNn0J8DjY6J6LhIo
	J/CAkIMpmbvADsjUthx34hFLFsqQIS542R07Puek3+nFCpuOJDRWROA4Xpr4W8Ez
	0tldTLOTTFuCC7giXI+aFGdhVPlurkGLSWbPqYZkGZt1taEYkvhc15jrj6/zBSm0
	ybbfQ9pbV53YR0Xepr/QotIEc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnt9ng19VqcQOlAw--.9091S8;
	Mon, 19 Oct 2026 16:42:19 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ben Skeggs <bskeggs@redhat.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dave Airlie <airlied@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 6/6] drm/vmwgfx: reject empty VRAM ranges
Date: Mon, 19 Oct 2026 16:41:38 +0800
Message-Id: <20261019084138.1821477-7-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019084138.1821477-1-yaojiale02@163.com>
References: <20261019084138.1821477-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnt9ng19VqcQOlAw--.9091S8
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrW8Xr1kuw4DArWxKw1xKrg_yoWDKFg_ua
	y0yrn7XF4UuFn8u3ZFk34fZFyaya1kuFs5Zw4fta45t3ZrtryxWryjgr97X348Gw13Ca4k
	ur45Gw4ftFsrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRi9YFtUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wtAemrV1+s3GQAA3z

A VRAM size smaller than a page becomes a zero-page TTM range and
causes drm_mm_init() to hit its zero-range BUG check. Reject such a
range before creating the VRAM manager.

Fixes: 37205891d84f ("drm/ttm: make ttm_range_man_init/takedown take type + args")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0f101aedb49a..33284a776fa6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -692,6 +692,10 @@ static int vmw_dma_masks(struct vmw_private *dev_priv)
 static int vmw_vram_manager_init(struct vmw_private *dev_priv)
 {
 	int ret;
+
+	if (dev_priv->vram_size < PAGE_SIZE)
+		return -EINVAL;
+
 	ret = ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM, false,
 				 dev_priv->vram_size >> PAGE_SHIFT);
 	ttm_resource_manager_set_used(ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM), false);
-- 
2.34.1

