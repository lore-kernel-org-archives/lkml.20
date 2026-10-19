Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723EE492E2E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399381; cv=none; b=X3br+6c3EDK2OjTGC04fqa2bHc2EG8F+CxSIGpwgmHNB/nZ9Tf5HODhbU8R8K18yxaTFg3t9q8aPbltCT7iIIND/pzbXq06ZEXJZNXHg+b/5MPEXqEAhpynOFssyZF/yFrgwa+NqRKjpNE9mrNG9QzCHAmRLUooeWW3BvI/9JaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399381; c=relaxed/simple;
	bh=/qX7jq3Vxcnbwiop1BkOR0WyYRGmgrCYKG7zxbDnLJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RtDaKJr4x9SXHj6nKOrsO0ckPQE6IR78gqWiJbAormMBR89ax3scFzcJjfw75PALfkc4BdXOZdtPHoDZtoPNw6afvCm9gUjej3T1o6Tzllk9si/3UvZK0to50hK2nepPAdBqzhfSkHeWF1ne5+01efALifYIcKvWKZRr0o9F2d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XPOnmQnx; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XPOnmQnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=da
	13CFE+ZPvGuNuuZVb+iDMeA1YYGpy3GImvJBlr+po=; b=XPOnmQnxpnevyf6ih8
	8SbYpfqSet+Jy6op9GyLzLX8greIkhbIe69R6AtHrEKsemwBBjUvJsPtc0zGKOP9
	1ZS+RdJV9Uc1/vPmisrsfxUMWTLF9yuNZHZKZZOQUbzBrU6s4NqCNdfBdotLk4vG
	UcAQ2eNsF/c6Enzpp3qoJ9mUU=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnt9ng19VqcQOlAw--.9091S3;
	Mon, 19 Oct 2026 16:42:13 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ben Skeggs <bskeggs@redhat.com>,
	Dave Airlie <airlied@redhat.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/6] drm/vram-helper: reject empty VRAM ranges
Date: Mon, 19 Oct 2026 16:41:33 +0800
Message-Id: <20261019084138.1821477-2-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDnt9ng19VqcQOlAw--.9091S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrWUCw4ruF17WrWkGF4kJFb_yoWfWFb_Ga
	y5XFn3Gr1Dua4qyFn3Aw47ZrySyF1DuF4Fvw45KayfA3srJ3WrXr12g34kW348G3W3AFyD
	Ca1aqrWSqrnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiAwI7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgU-eWrV1+UzdwAA3E

A VRAM range smaller than a page becomes a zero-page TTM range and
causes drm_mm_init() to hit its zero-range BUG check. Reject such
ranges before initializing the TTM device.

Fixes: 37205891d84f ("drm/ttm: make ttm_range_man_init/takedown take type + args")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index bca802ccddee..f8bf2d002236 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -851,6 +851,9 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 {
 	int ret;
 
+	if (vram_size < PAGE_SIZE)
+		return -EINVAL;
+
 	vmm->vram_base = vram_base;
 	vmm->vram_size = vram_size;
 
-- 
2.34.1

