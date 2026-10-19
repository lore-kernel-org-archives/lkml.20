Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26B048FF8D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399375; cv=none; b=jWms2FqGC41gF8l21wHQ1ltD8Ob3GuGb/nL+xA5oezD+R+q1bl9dNaHyXElpB/2KJK3xwsKoVDCbEl2e+wkM8xzP9ZWNczihxtXzU7jJqFLE8XBdLqfxVk37/jv0RJt6AtkNvrCdumem7lvYl8sMEgyK4IBGKUGXmjqkftdG1bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399375; c=relaxed/simple;
	bh=Ca3mi8X7qY9ar+qDu3uo3Sq5SV2qJRrrGEnlR97F5qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fuaJue8O05/HGzjqje6fxJxT60Lt0Zun074tjafO8oBnCIrydyKYiuSBWCgZDfgPGurs5eAmbvkC2sg2/+sYDAlA5mMieJRM/pCxOh2DXGi8SqyDUcuoL0Drx8AX8eW1hzLNcoJgq2N4zJu0Lk7xvWNLiCyCTHd5uKNTG/tvSl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=W+SsKTAA; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="W+SsKTAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wh
	cwWcGUKRfvtRwNpcj2S48Yg35okxV42v9ufuqcUeM=; b=W+SsKTAAxDCRa/2MyW
	7zwswFvwlpPCDRlltEZ6E+KT3p5mq8UV4sv+a4IF2KMh5C+zcUmpysq+ubRRPi3J
	iL3hGfLCqIJFXAGLjmHqL4FxmxdDIzbKa47RmRvysgh7NA4n0oa/lrTrfpGao2U6
	n1EYUuUgdyKUVkGdCIUqmVwmM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnt9ng19VqcQOlAw--.9091S4;
	Mon, 19 Oct 2026 16:42:15 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ben Skeggs <bskeggs@redhat.com>,
	Dave Airlie <airlied@redhat.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/6] drm/nouveau: reject empty VRAM ranges
Date: Mon, 19 Oct 2026 16:41:34 +0800
Message-Id: <20261019084138.1821477-3-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDnt9ng19VqcQOlAw--.9091S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrWUZw17Xr1kArW3ZF18Xwb_yoWDXFc_CF
	4xXFn3Gr1kKrWDtw4DAr43XFW2ka1UWF40vrs2qasxtry7XrySg347Xr1fXrykC3WIgFZ5
	G3Z0van5KFnI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRJManUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgc-eWrV1+czqwAA3Y

A VRAM range smaller than a page becomes a zero-page TTM range and
causes drm_mm_init() to hit its zero-range BUG check. Reject it before
creating the VRAM manager.

Fixes: 37205891d84f ("drm/ttm: make ttm_range_man_init/takedown take type + args")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index cfc0868e2dd3..99c74c3b5976 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -181,6 +181,9 @@ nouveau_ttm_init_host(struct nouveau_drm *drm, u8 kind)
 static int
 nouveau_ttm_init_vram(struct nouveau_drm *drm)
 {
+	if (drm->gem.vram_available < PAGE_SIZE)
+		return -EINVAL;
+
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
 		struct ttm_resource_manager *man = kzalloc_obj(*man);
 
-- 
2.34.1

