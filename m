Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE6449365D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399389; cv=none; b=t+YCsyktoXFBU+SRLNTeiNbFsTMNA8Z/ezlERK6JM2MSNmSV3dpb1gycaWjyEslDMgSPoJ4LqI1ud35vTF4WfqRIRgZF2v+ofEdr7smWnb5eygYZuCgzRCokBPiIRzl9Fm2JhIirirmH5cxlEKZIrS4x6xt5OCHVB9nvy0LZx1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399389; c=relaxed/simple;
	bh=Lu5TBdIyzKhZ+brnk39mnHDJuYNLWAIYX/dNnqk7HsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YS3P5YZNgL2j+yClrwEF7ibUtPaaAdTUPazt9IZMJonzovdu7RY6ShKeK7EkpECsEqDt9Nnj3L5upcS8+vFhwS1cRvkfR5i0VjeWDU/rEsOzwEWtkt/9JLT3t+983mNtUbcitQz4O1oLZZq03tRyP9dF1HxTD4lJgnr3uKIgdSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gA/ganGW; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gA/ganGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tk
	RPXdmYIqMieAMP2DyKNkrVsM6DlDMzPggswxU5olI=; b=gA/ganGWxkDgvPVy9Q
	4BDvnetiOhisukt915QCuTz/KTR5YaZ9geKSJPU34QW3HeyAU2sGOLXisxTomi0Y
	4CSHv3x2icISupZxKtuqij99L3BzT7nlLsyDGkikrLsFmorlWgTS3c/tCQKkPNS5
	fc5XH/tS9QyeS/8CzYAduBMUs=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnt9ng19VqcQOlAw--.9091S5;
	Mon, 19 Oct 2026 16:42:16 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 3/6] drm/qxl: reject empty TTM memory ranges
Date: Mon, 19 Oct 2026 16:41:35 +0800
Message-Id: <20261019084138.1821477-4-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDnt9ng19VqcQOlAw--.9091S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrW8XF18tFW7Xry3Ww4rZrb_yoW3KFc_WF
	48Zr97Wr47GF1vyFnrCr43ZFWava1q9F4kXr1Fq3sxXry7CFy8X347ZFn3Xr18u3W7CF95
	Ca1Sq39YyFnakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRhYFkUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzghAemrV1+gz1QAA3a

A zero page count passed to the range manager reaches drm_mm_init()
and causes its zero-range BUG check to fire. Reject empty memory
ranges before initializing the manager.

Fixes: 37205891d84f ("drm/ttm: make ttm_range_man_init/takedown take type + args")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/qxl/qxl_ttm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 5d495c4798a3..c8cda805b645 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -185,6 +185,9 @@ static int qxl_ttm_init_mem_type(struct qxl_device *qdev,
 				 unsigned int type,
 				 uint64_t size)
 {
+	if (!size)
+		return -EINVAL;
+
 	return ttm_range_man_init(&qdev->mman.bdev, type, false, size);
 }
 
-- 
2.34.1

