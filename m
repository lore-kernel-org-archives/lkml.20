Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D2725DB0D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791505294; cv=none; b=AbIgnKQ1BHvDAvc5vjilOJkyeO4gEm8H2grbHMYbq6eEALMVA1Iw1u2hqnBK9VJUY5CLMidYYAmZUDLDTh0j7IXg25WueLvNQq8Ih/6e3nt50nDdY9K4slAv9yXfIc75G+4vVgkgPUTk+due1i7zcvV2ElmRkWoMQLoiwdeMTls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791505294; c=relaxed/simple;
	bh=NVIDiLXAJf3+ZJHF4QiA1R4ioaT/JGKrOJyAdNKIbc4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bDRl8XGdOZFt+yWUhu4RmhhQeF1fsWBTQO72Yo0utnDLP1f5ISGF8eyCVBYq8r2pPtcei0UbQm5Jt6xrF6z49cyj8lArwKCg6z6dlcihzk83yIPzSzx2zMcytqYxpnVhuaxfpPwQV7fyqPdB7uW/Pf7vrKtp6HOFlJsuJq1cGdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsZsNgD3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsZsNgD3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a020e65269so26900975e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791505291; x=1792110091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIz/qZTA1DVdo8Wv1KvtH0Jov9NyNDxXYjGr4vU3wa4=;
        b=AsZsNgD3nHdz21PLQgZ9iXPTrTocPQsn3eJA3Ub4TWfW2i7ZuU8DZOKbOJv0EciY8c
         knP1v5LY/Wd2wcDJac3mImvkpuGHCWeKc/Jf0FLed+EXrBO40BmHp4sOhfixNyiy+4y7
         kx2da2PAZ4xHnYCrgkSntSSB2F3odSDqx8tADYOuP09hHVhI7y6UiuWfACa/BZRvqWlC
         VlHgoMAQF9YTuZOzD4+cxu0ozPjiYHkU5wbRC62uw4b6v4Km8KC7s8bksKJKDSaMlDgJ
         ACFlkOUNqABrYCdq6PK18x/tolT4fa/NkILv130RmoYQBD3x+si/m9IZuAr4OHafjTkP
         Dhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791505291; x=1792110091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIz/qZTA1DVdo8Wv1KvtH0Jov9NyNDxXYjGr4vU3wa4=;
        b=J8zKW6lrlTGJF50zqSB2sLlpg+OO3G8TViE6+wdO05g8ER7X5S7cgJSDbx3bVwpyKL
         GiOGxmzIxcyAIeTrCpd0uc0C4/9jxt3wCOOww1Vzmj7ryIeNarCFmXDqDCpcHZ5sPCfN
         XMYyuEzHc7hHKp2leWSV19Xb2HXWdTzjXnY9bz/gLK+Wy6eg3eGNPwl/hgL8a7Wzbs5z
         H3nmdPjt8imwgfZwisSK7czNuK28qs6L+WUiXIOUzPAYLrmfNDSeMb94UVGtTpfGX0lL
         L2MWJw4pLvPLJBptXJ6HEiRsW/OD26qXp7w1PSBf3DN0/0ADml9J9gZNJVZjfsNTF2du
         2XBg==
X-Forwarded-Encrypted: i=1; AKwUvByc7fgZV9V6X8MREl1qRHsAXuphjSocbpbySi4od1knkDpN3bYWdezOnU+7FgRg6Vw9tH8EMFmKppVDoq8=@vger.kernel.org
X-Gm-Message-State: AFuF++lh4+nDXjf14dgZ09iSJC1o898B0jVtqXdYp7EBetzpBAJoMkB3
	8IKaKsRD/oNhSiMY2o9y89QtSjs9cZDjum2fJ583iy2e3eCngkGyqUQA
X-Gm-Gg: AYBFou1JnaRIUsVouuC08Zgsub+//6fr5gco2JKxJStYyV9au0dZtEiEedQUCRJSA2o
	CmsNUtCUZ61z/VdYCuRRxXKSX5NhRWbKxIl9EKp2HeG4jlgmME7iwPQk+WZrtn7H5ZGCjSPR1CA
	Qdk6FFpG01OF6627eaZZkkPFVIvZ1vgLiurh+NHH/bvkm7uPegyWOk1IY0f/noqxTW89jyCaG/6
	bHSQrH1mtkP7XYcs5sjCG80S7LNlECjoYXIicdUtiDN91cHldi2YJZW+08jCnNWB/a43LfswDLQ
	XFVcMNRJNVfW3sAqpU/bUX/M+KxpLzZFXYPsxm2hAhknmj03qRyNiMrMBBpysR1YmJjN9hWFKaH
	uV7racjxLvU27whSQYkoxieU0MuXxdgOiHuxdykEAe5Z1id9D2UweF/FRoogw6gNtIJqXnxCt2V
	sjUyVu7Ax1aoYeQEZw4qRuk0RouAzwiWMvJF1yb68xV97yHM/WP+VQTdXGLtLjNoF8hpg1baoYz
	EoAgYCzuMQbHU0Un+ZcCgyKATCxciZMpU7A/0NjXRcgCI48LN6imbm4lPHWBV7ysW8d0dnKz/LG
	pf9bGOO6Fi6K3ZyxomLtfknJKesZ/4+n2MHdcR2f2+LGuGSp20aluNBHONkcRyRRmOTEhKvIB/G
	fuTHy2Kk=
X-Received: by 2002:a05:600c:6990:b0:4a0:1ea1:477a with SMTP id 5b1f17b1804b1-4a18e4d8bbamr2152055e9.27.1791505291199;
        Thu, 08 Oct 2026 17:21:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4987casm3364605e9.1.2026.10.08.17.21.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 17:21:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] drm/rockchip: Map imported buffers from DMA addresses
Date: Fri,  9 Oct 2026 02:21:14 +0200
Message-Id: <20261009002114.67851-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261009002114.67851-1-kmehltretter@gmail.com>
References: <20261009002114.67851-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rockchip_gem_prime_import_sg_table() uses iommu_map_sgtable(), which reads
CPU-side pages and lengths. DMABUF_DEBUG clears these fields, causing
the RK3588 import failures reported by Diederik de Haas.

The attachment's DMA addresses belong to the VOP's default domain,
while scanout uses a separate DRM domain. Use iommu_map_sgtable_dma()
to copy the live mapping into that domain.

Keep native allocations unchanged. Unsupported imports still use the
old page-based path and remain unfixed under strict DMABUF_DEBUG.
This RFC retains reverse translation rather than sharing the DMA domain.

Reported-by: Diederik de Haas <diederik@cknow-tech.com>
Link: https://lore.kernel.org/r/DLR74W1U9YPC.375IK0HOYHDIG@cknow-tech.com/
Link: https://lore.kernel.org/r/DLYLA3WQNN3X.3FB9MO8ZWBQ5@cknow-tech.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 9a1dc9f12072..501c94cb921a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -20,7 +20,8 @@
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_gem.h"
 
-static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
+static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj,
+				  struct device *dma_dev)
 {
 	struct drm_device *drm = rk_obj->base.dev;
 	struct rockchip_drm_private *private = drm->dev_private;
@@ -40,8 +41,16 @@ static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
 
 	rk_obj->dma_addr = rk_obj->mm.start;
 
-	ret = iommu_map_sgtable(private->domain, rk_obj->dma_addr, rk_obj->sgt,
-				prot);
+	if (dma_dev) {
+		ret = iommu_map_sgtable_dma(private->domain, rk_obj->dma_addr,
+					    dma_dev, rk_obj->sgt, prot);
+		if (ret == -EOPNOTSUPP)
+			ret = iommu_map_sgtable(private->domain, rk_obj->dma_addr,
+						rk_obj->sgt, prot);
+	} else {
+		ret = iommu_map_sgtable(private->domain, rk_obj->dma_addr,
+					rk_obj->sgt, prot);
+	}
 	if (ret < (ssize_t)rk_obj->base.size) {
 		DRM_ERROR("failed to map buffer: size=%zd request_size=%zd\n",
 			  ret, rk_obj->base.size);
@@ -131,7 +140,7 @@ static int rockchip_gem_alloc_iommu(struct rockchip_gem_object *rk_obj,
 	if (ret < 0)
 		return ret;
 
-	ret = rockchip_gem_iommu_map(rk_obj);
+	ret = rockchip_gem_iommu_map(rk_obj, NULL);
 	if (ret < 0)
 		goto err_free;
 
@@ -457,7 +466,7 @@ rockchip_gem_iommu_map_sg(struct drm_device *drm,
 			  struct rockchip_gem_object *rk_obj)
 {
 	rk_obj->sgt = sg;
-	return rockchip_gem_iommu_map(rk_obj);
+	return rockchip_gem_iommu_map(rk_obj, attach->dev);
 }
 
 static int
-- 
2.53.0

