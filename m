Received: from mail-vs2-f15.google.com (mail-vs2-f15.google.com [74.125.227.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE88A417D99
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166375; cv=none; b=XPJD6kftnkiCrcSD34WzowRpTJB6hN4FI4XpgBTRCgZso4AIwkABPrVJMUTA3vmQjGHCDxKnC84xkjO9qo85DvhRo8YbZ26ru83p9yUspB0G10XHl2VW9KQFZl0gb46dX68H6DejdOXqYcsx3qFUUVELm1CZc4ym8gRvwu/38Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166375; c=relaxed/simple;
	bh=kNdIXJ1Otbd5WDD93H3kawpKsCob7ioia2rmMR8QpDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MXVRba9Yhmb0l/qxqZ2GA9Hjn700uDtvA4yS4tvvyJl0m3U08l8tQ/zVoxmCpMoiJK6zoZ094NMjzxEFS3zxhC4FwlhG+OEFPCEdQJaKAUSGL+2z7TYSp+tC1H5t8MPPLqNx0sVmuiToWuT8h8Jrxu8l4h3DbxxR37feeXntVkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLc9dTAA; arc=none smtp.client-ip=74.125.227.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLc9dTAA"
Received: by mail-vs2-f15.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso659013e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166373; x=1790771173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3lfa5GPOn19zRKVJ4YVgkdAOFskUQn9deVo/jHnP1F0=;
        b=QLc9dTAANkTWyw9hfIHKGPRF2hxyZHAZDroIsJvGmwGoif+N+/CLqesQP1wT338/Qj
         Gevl2j1ETf6fzQFBAsZyzfIDAgAlwWfYxjmgB1LhCZjckl9GELH0YUAmqmbPjl8ICcvq
         d5IFDH5+OqBx48N/6wepfLHquWuyXbN+4Dr4mXG79vXwCJOE2uHXEZrMcrphrYmdDZzw
         k2k54iZoQ8+/mskdTNJ8MDA2YrOKx7Ado/Q2zdgUdk3xD61sR4VC5XknBikdblzhTAtx
         3+TPlyQerlH8tO1YpA/6uD9vxDtgbhOmRnJgEIOXChiM6IZBf8EtPMx7a2LwhCG3F61O
         4PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166373; x=1790771173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lfa5GPOn19zRKVJ4YVgkdAOFskUQn9deVo/jHnP1F0=;
        b=APbmMZn13wwDjtIljCGgdhrcms9pOOcFzMLL6w9/dnFx1gMsj7PYNPDpYH+28+ATrJ
         +pwHQsFCznPddufRJ6r+9TOkMoQ8pWQMJunqNAIIiyysYM9ywDZGN7FPXRWTcDnlqame
         zuOIDtfpuL69lBJtQoLuVROY7nJkbEKlp8n39i2yOK7qr3VFzADSnlLKqJWw+LJlJAzz
         Tjkywp7OKfZhtJqtaBEXAqqFJ5Fzvmv8T6yW4IncXGBpp9CO0nPYfFqO96gG40uHiaNg
         fqhtjR+gkA6W4OJUOBW1ig8XrfsK4483M1XCsmSiEHRI/fOxsqdXAcbiBwxloM7QiL1I
         iPEA==
X-Forwarded-Encrypted: i=1; AKwUvBwU78c97yV+o4p5yw0PJAIG+dUi1D3i9k+gf1ZtQDfB4Kf4uq+zj75fp6DpNMVsqzURdcRSHRg2F8yrDkI=@vger.kernel.org
X-Gm-Message-State: AFuF++mlAQIxZkIKy1CScVk5nxYSpUozc07a9hpzz8J3DIhU+smEPxyq
	DygVYn0kXv7PN+DM+Hc+D0cmRwocwy3z3g/22hUZATX0mJ1JtBhRNIFk
X-Gm-Gg: AYBFou12VR+mjb1ZZmxikUu3iiVrliiZAznsa/vAA/n6IWxYUwjXkNZT8UKm2HXGXG2
	qUXf/PF+htS98wt9ZSUGBcDMy3KUV1SBGwyNozp5xkzjWkaA2cGn9oCs8SNXdtbX8mb4QSU5aPr
	T/fxORNXjq5MxqDJ8PHEdYtNkob/BbG3KTLJx7O3PYQ1KhIwUAve3N9rkhZPsyeUdbtrUHlZ/gI
	9J4lgeW+bPkrdFTaIWIZurHbEdF2+9pt93mOrDYJmfFC0ySF70AWAxa0Y2/+FwLs+rC3dD2Y/k+
	bOltco1YmxwGILU8dJ8Er5qr/gVwTiViw4QZjH+jj3cbgH19wIWaphtZI/hTBMCpSnv3FE9Rt5K
	chRa/uHUxuuaeeQl1vBSJZDD3PkS5/mE1YlpCC48EDJCqDhzo7Yy0m3aSAvOFBrmgUS22Ol/7AM
	Y45PAW6Zf/Iqi3zuGbs1c7EoCLyyDJt/ULrJrfVBOU2mAWkDO6StEIgMb85wesayE=
X-Received: by 2002:a05:6122:f93:b0:5c8:228:5ea6 with SMTP id 71dfb90a1353d-5c9f159ab1bmr3134360e0c.5.1790166372720;
        Wed, 23 Sep 2026 05:26:12 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04f5b93sm3002417e0c.8.2026.09.23.05.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:26:12 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: do not hand the embedded sg_table to the PRIME core
Date: Wed, 23 Sep 2026 09:26:01 -0300
Message-ID: <20260923122601.438892-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmw_gem_object_get_sg_table() returns vmw_tt->vsgt.sgt when the buffer
object has already been DMA mapped.  vmw_ttm_map_dma() sets that field
to &vmw_tt->sgt, which is a member embedded inside the struct
vmw_ttm_tt allocation and not a table of its own.

The core owns whatever .get_sg_table returns.  drm_gem_map_dma_buf()
takes the table and drm_gem_unmap_dma_buf() destroys it in full:

	dma_unmap_sgtable(attach->dev, sgt, dir, DMA_ATTR_SKIP_CPU_SYNC);
	sg_free_table(sgt);
	kfree(sgt);

Both are ops of drm_gem_prime_dmabuf_ops, so the core ends up calling
kfree() on &vmw_tt->sgt, which is not the start of an allocation.  The
preceding sg_free_table() also destroys a scatterlist that vmwgfx still
considers its own and frees again from vmw_ttm_unmap_dma().

drm_gem_unmap_dma_buf() runs from dma_buf_detach(), including the
importer's error path, so a failed import is enough to reach it:
exporting a bound buffer with DRM_IOCTL_PRIME_HANDLE_TO_FD and
importing it on a second DRM device with DRM_IOCTL_PRIME_FD_TO_HANDLE
is sufficient.  Both ioctls are DRM_RENDER_ALLOW.

Observed on 6.12.101 with KASAN, as uid 65534:

  BUG: KASAN: invalid-free in drm_gem_unmap_dma_buf+0xb3/0xf0
  Free of addr ffff888008290450 by task poc_mm04_sgtabl/321
  CPU: 1 UID: 65534 PID: 321 Comm: poc_mm04_sgtabl Not tainted 6.12.101 #4
   kasan_report_invalid_free+0x94/0xc0
   check_slab_allocation+0x116/0x120
   kfree+0x103/0x360
   drm_gem_unmap_dma_buf+0xb3/0xf0
   dma_buf_detach+0x165/0x510
   drm_gem_prime_import_dev+0x33e/0x430
  which belongs to the cache kmalloc-192 of size 192
  The buggy address is located 80 bytes inside of
   144-byte region [ffff888008290400, ffff888008290490)

80 is offsetof(struct vmw_ttm_tt, sgt) and 144 is sizeof(struct
vmw_ttm_tt), which identifies the freed pointer as the embedded member.

Always return a table the core can own, as the other drivers do.
Reusing the cached representation would require copying it into a
freshly allocated sg_table, never returning the alias.

Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index 39f8c4655..a0233729b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -73,10 +73,13 @@ static struct sg_table *vmw_gem_object_get_sg_table(struct drm_gem_object *obj)
 	struct vmw_ttm_tt *vmw_tt =
 		container_of(bo->ttm, struct vmw_ttm_tt, dma_ttm);
 
-	if (vmw_tt->vsgt.sgt)
-		return vmw_tt->vsgt.sgt;
-
-	return drm_prime_pages_to_sg(obj->dev, vmw_tt->dma_ttm.pages, vmw_tt->dma_ttm.num_pages);
+	/*
+	 * Do not return &vmw_tt->sgt: the core owns what this returns and
+	 * drm_gem_unmap_dma_buf() sg_free_table()s and kfree()s it, but that
+	 * sg_table is embedded in the vmw_ttm_tt allocation.
+	 */
+	return drm_prime_pages_to_sg(obj->dev, vmw_tt->dma_ttm.pages,
+				     vmw_tt->dma_ttm.num_pages);
 }
 
 static int vmw_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
-- 
2.43.0

