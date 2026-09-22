Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6CC560AB8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091538; cv=none; b=HXJVu0SDrFRdfu5DzEsKHyKAVcmN8zekMxZs7EKr/0a1gxiS/Tbnwa2gUI/jF+N/7prTtAb9Jcl0Srw83tURxSDn9lwliuvMiSJeQlQs0Vj0pknysOE10b2Ny8sZ2EGMFxZJslk97mni9hsMuaf48e7q/zhQlWNFBVwOXv0NBjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091538; c=relaxed/simple;
	bh=l5TWkTm9bPjUd2TQlvJ/ycjJ3MOJwBf9Sg08k8zmqC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rwa+9aDi1rsMCEIWNxg7KWHz+ZBbIasvUirNUH7uvPDznJgVoWnMJL1ElUHK6e0ufautYfb5jT472HyQio2gNUllqtOQYQXqlrYhypC4W9P9nwh3jO8O+an3MpOokUEhcu0iyTxvRdoqDqmu3l/5p8hvu+9G0Fb8ZgZdrpPSUQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qdcuyX9D; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qdcuyX9D"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so30076555e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790091535; x=1790696335; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5jxz2R7aklALF1c07VlaANJo82uSjv4mznBGg6lztU=;
        b=qdcuyX9Dd+hIcpCWBHt4El8uPkOg2BMBh7XcBmU15diaJ8ytem7WpGJlglauiqUbWP
         4jbplk5i3+oHe8mpEmYsLDv+7mVoyUms56eXh3tfunuOtxqAMFX7ZWP4kMsrA0+6938t
         SuL8IMs/Q66NrqETp1hFM9qpXzrNk7KucyCjacxdgn/UcMsD7JcD8aCK35XAIzH8ROv/
         Gi+wikQjJ6X1Uu2LsLCFXKoob4W++LahJEouLJz6mAKbQNL3lEpI3cOsbwzYQOZVHg5o
         Ow93+/YRqPgiKj3j+5R3uGCGE21fSGjJZvUAzaJWMINBcpRhHcYDGj1reUww9S5ZlYPR
         OptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091535; x=1790696335;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5jxz2R7aklALF1c07VlaANJo82uSjv4mznBGg6lztU=;
        b=bNFEApGuIascyprGVeiR8qvlgM3dpf8UHshvNT9Hmzrw5szP6WsMIkB+SxknIu/5Fn
         HIzjCDB9AYxfqZ1Ll+bBFAqp7KBygJjISzm4OeYbdjFzOLfYXPrA6D2zr5Zc7790rQsl
         tMbJwEXa5xuzhl1zeJQrksegLiNvGcyLsvfP0y+DFjP5jWay8ZIShdSVneYdUerHFwKT
         bZQxsCjRD+8TmzhOmCTRKC4fkwfyBz/HgNBzun02j7ahebidaGESvQiVaTi8+PG/khqS
         iVk+EJi2ZgjkUaG5NDPpJzgz88fhuGNIaQZF3Q4WVGZApMR5HKDkGqNEH8nbX3Y9lL2s
         aPpQ==
X-Forwarded-Encrypted: i=1; AKwUvByUZJeikZQGH/F0Ox/V4JSINPg2P9MAGasXora5FI3vwZIo9Q2Su0tIMDAVWJcaipQFCTGLuTmS1FDpLxI=@vger.kernel.org
X-Gm-Message-State: AFuF++leuGiBr/c/VvqyvrlHgvUrmng2sSA63nwHYv44aQi454a6W1OK
	Q8cl3cmKGdeOdFUzf24RYesMxC2vGCmBekTwBzdqN6B7VJ30jqK6OKMgOSqa4g==
X-Gm-Gg: AYBFou1WbsmgV6VIzW671tkX71s3HNRiTIHFbzKnGBOmfOkMXP59SBweAQ7g5o7KknV
	7YQTkaHAkc+vFj4BkAjNzw4SuOKITXc0rXkUUba9eoNI1pwBTH45ppq/XmXpnEzlm2fk9MqoucB
	os/WskB4Zz7UrE29zeyEiy0RATwE5aueDHKQ5QrXt1ujWyRGFg2E2D+ywyxwtJhBWyEqruHfhIe
	sg01/HsWHnKq8jIhUINSyMIH8igTmpPU2GC0yy7whbHR1OceuO90jfeNiNW5i6eig14xcNje95r
	D6qKhJqhMqrhpn585U9Z8br+wpmGtPQeTbADnBWSbaZh8MdwM2mlyCqkVx58IH1hC+sOMEzg8Ms
	cfJaGoGR9uykfWFwy69qKCpmTwaQ+PhtSFVdzVW6d9pB+iyKRCMHG6q8TqWsUSMpeYFGwwEEl+V
	tvsn31OB9hhNj/M8XW5qVAPffSKcwWY4zWx1NVAa6LDcJ+fDUXMTfEE8YJrnP5m7knEOzUhSjsN
	gozE3+/EQcQ+yXVp7H1bgRpqhFe2TaX9OQzS49Ih8+Q9ds=
X-Received: by 2002:a05:600c:468c:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49fc56811dcmr212862655e9.4.1790091534593;
        Tue, 22 Sep 2026 08:38:54 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862786f40sm5410966f8f.27.2026.09.22.08.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:38:53 -0700 (PDT)
Date: Tue, 22 Sep 2026 18:38:52 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: unmap GART dma pages before free
Message-ID: <arKhDFCSoPDNYaxX@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

amdgpu_gart_table_ram_alloc() maps the GART dma pages
and neither the error path nor amdgpu_gart_table_ram_free()
unmaps those pages before freeing them, which could leave
the device writing to freed memory.

Fix by unmapping the GART dma pages before freeing them.

Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
index c4c21dbbbdbf..780fb01530e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
@@ -209,6 +209,8 @@ int amdgpu_gart_table_ram_alloc(struct amdgpu_device *adev)
 error_resv:
 	amdgpu_bo_unreserve(bo);
 error:
+	dma_unmap_page(&adev->pdev->dev, sg_dma_address(sg->sgl), adev->gart.table_size,
+		       DMA_BIDIRECTIONAL);
 	amdgpu_bo_unref(&bo);
 	if (sg) {
 		sg_free_table(sg);
@@ -240,6 +242,8 @@ void amdgpu_gart_table_ram_free(struct amdgpu_device *adev)
 		amdgpu_bo_unreserve(adev->gart.bo);
 	}
 	amdgpu_bo_unref(&adev->gart.bo);
+	dma_unmap_page(&adev->pdev->dev, sg_dma_address(sg->sgl), adev->gart.table_size,
+		       DMA_BIDIRECTIONAL);
 	sg_free_table(sg);
 	kfree(sg);
 	p = virt_to_page(adev->gart.ptr);
-- 
2.43.0

