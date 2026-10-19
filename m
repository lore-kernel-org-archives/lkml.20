Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF7549B44D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399392; cv=none; b=Yrc6NhuIlUK8NqVluoSRf3gulllt+pywZbeHpammjf3+Hd2EAKJ2N7QgAjjTi/1R2fJgUNBV/Oi+zZZwBVdq5BL3AHvXDLcIQRSXg6jL6USNpofeR7UfB+r4dQHpF2FlgXMmUnEreBPvk2/oPC8jyueG8uDKKpbQnxho16V7E1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399392; c=relaxed/simple;
	bh=NYx71Kn4n5bzl4yCjZZiDc5gAcEOT7IhuRYpjwkXkG4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WMTJUhwrt1kionYwILJynZwqecvXfyBWeAUHHToRt0y/XsGqKRxhFWDVMTFrvYfq3mee2UiW3JTaVwZHpdRcRI3eKEdCoVkZWljf2TsJvsyHzuvSnmw+gpPgoC2Gx925BIy+W0a03r4PchTRpG6mkAudwmwErJNFCBc8BR49dBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EQB7szLg; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EQB7szLg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wi
	SgM3R8DltnKlDzzq9tlD8y5p7AFM+owbcZ0ZWu3QY=; b=EQB7szLgTbN//+NwUS
	c8q6q/m/FZn8ajNiWgUXAckWVsse7PYoHse542HImhUTVd+ApBmAetAsooz9dq5Z
	XJea61dXJ73X4NIrS2db8GbtfLBBHndGKDqYpozzUQ2OAzd6J1j1c7XlE+CNGRcv
	PDrIrngDu11I9hh7CZpGJvDks=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnt9ng19VqcQOlAw--.9091S7;
	Mon, 19 Oct 2026 16:42:18 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	David Rheinsberg <david@readahead.eu>,
	Dave Airlie <airlied@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 5/6] drm/ttm: reject empty range manager sizes
Date: Mon, 19 Oct 2026 16:41:37 +0800
Message-Id: <20261019084138.1821477-6-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDnt9ng19VqcQOlAw--.9091S7
X-Coremail-Antispam: 1Uf129KBjvdXoWruw48Wr4UCw48tw1kuFWkXrb_yoWfXFc_u3
	y8Xrn7WrW3G3sxAF1DAw1fZFyaya15uayvvw1Fqasxtr98Z348X3429r97XrykX3W7GF98
	uan8tw1rtr13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRt5l1tUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wpAemrV1+o3BAAA3u

A zero page count reaches drm_mm_init() and causes its zero-range BUG
check to fire. Return an error before allocating and installing the
range manager.

Fixes: 77ef8bbc87be ("drm: make drm_mm_init() return void")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index b818836f0726..5fd484ae1706 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -184,6 +184,9 @@ int ttm_range_man_init_nocheck(struct ttm_device *bdev,
 	struct ttm_resource_manager *man;
 	struct ttm_range_manager *rman;
 
+	if (!p_size)
+		return -EINVAL;
+
 	rman = kzalloc_obj(*rman);
 	if (!rman)
 		return -ENOMEM;
-- 
2.34.1

