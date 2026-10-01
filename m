Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473324BB287
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862003; cv=none; b=T8neHRXZbTdJgdHMpBD6DEyFjzjppGpCWj6Nm/ozYGCh+zUY6ZFZBrrybV83rb/qRnvuu223zXYL0skz5rVj/hRu8XMwiBHP1AJzhVV+YvX6U8SUdsrpRS5v9ouu2FR5EmwthlKKkEKetcSpF7IoiM8pLT2dQjZAa8MoYyYULJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862003; c=relaxed/simple;
	bh=0cTQV9BkyRSiJsbfvVc6+NMXizqsSVjyP0Ot0996dd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=INcBhxdkkPsYPj7mUYqONmszNG109yLDYgvlUdTXQSyiTTVxzvZ58CGI2LyPfnUwzsVQgfA4p6Q9KltG6t/F1sj0BzbV1RtucmtvCIFwzmzwpVaLBHYhKmhtqDwSEIpXJyNtk+jdIwpolYHaj0C0Hjh4zJ58hU/nAC9FTGFhU2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMX7t2v2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMX7t2v2"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so3659993a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790861999; x=1791466799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMOf9/GogbibFylj3xpGTq6kKy08fEk3RcF0K8Q5mJc=;
        b=EMX7t2v2buiZw4vJ2r7EW3Z4R44Mx3+LiKXsFc1DpDYJp4t/J/rZIIcfFCVHUgQb3e
         1Miln0xNOG3NYMYUroGjfwZ+W0g27VGf64UFgfYKfKU+cc41TlGqRBx/QeprmdErcah0
         cAXpXFFL13dzQ8Ull06J186uOS993uSLxhBgPTjSYvbLyJ3VCWOYTRy/LN9SwF/m6A9g
         UawQ/LMc4x829lbozs8UZTgCxfRT+rXTQvSMwIcFfrNC/V3ze03UMhei/3NjZjJyxWJY
         mGheu+jROhUqcelbtGiJo72E+nvKtpajT+RPuB9f+KLJ/dyBvwaJ96kQeTqUPEoFBinD
         xiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861999; x=1791466799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMOf9/GogbibFylj3xpGTq6kKy08fEk3RcF0K8Q5mJc=;
        b=kGzO/Isk5EaoGyqJKamBNc2hHdDYRcwXTeN+VuheYIVMCc3Z0mIJlUUs8wr8rgoPPM
         8g1XvjKYjc2HXEna3ZkHrG1e3OG9pSnHfVErkqIOKLFMAmS+N9Dm0hJm+CwOLXNaQcMn
         wibk2CEZk5yhGFonluKL2kyOxkYfETcqx7lHTOOtFf8ioRqFSxmgXrJ8wFHM7nka73ic
         QZHma4q4S1K6aiaePKSKg2nytsVtViYICkPxpPkvDF7WtDXbUGF1i0tkHMn2ND8h04w9
         QeE9xhNA87cwvcab20N8EeqQ3LGEH7ni7iv4xOL3tdp0yUI0gOZ9sVD+bf+vq3bP6p00
         j2VA==
X-Forwarded-Encrypted: i=1; AKwUvBwXAHEFzWqX+0TpjzRDjyM+pxa8bI41duksK52iGcZS30nf9vYYWkTsEjX9npuiTRjqBmm3oVT7I4InYGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/FYjUXUGM0r2wRYuIwpj12Y1DT8JgwjyR70oeFC5ix0AkO6YC
	T4IyzDnwPTrAUIEFvWrOmPdq0RfU5YB/N/Z6FyXtISU6/P/I6obRJik+
X-Gm-Gg: AYBFou2z7pTzYpy3MEJCA/3fwOtSG8xCOk0aVrS71LwKVgiYfUR5tBXt5Z0BSO85ubz
	mjzBT2SwjCmV5uXMJiqnzL/aZBePb+kVukvgyicEG+yqDC7RjjH2ott9vinu0YGuWbf/7VwmBg9
	tn23B8Zo+RlzPp58V/jMpjYYCY0yWGF15LcO0SN3HLg19FzJrnNWRv7fG8npW3fDJjRZJZCUkig
	8gSdXqbNG/WDQU/FqfKRK6Fy2DjHD0yoifb8SMCQ3lCvUU4juQE2RuwNfsa6EQVoGQyIwyAVLgc
	DrgANphRc3zBJQBQOXU/3Kgdgg0wFgU4c2/a3z2BpHhzzRFe4PTIsNQwXQeUewj0cZvwXGjG8+n
	3xPhIs/GmbxSWTfEy6n+7DxjQQ8g1xXX2wKvR8GEelhB571lmLKZhkMgoX0hmL1R9hVzQO1NLhU
	1ZYzPEHXbht4jJ2WgsXKCcmLT8UTfnZodd8R/7ZIYU1ixa+hNcQrDBFq9k7AMAbkg=
X-Received: by 2002:a17:90b:4b0d:b0:3a0:ddd6:896c with SMTP id 98e67ed59e1d1-3a6c2276bcfmr375685a91.17.1790861999525;
        Thu, 01 Oct 2026 06:39:59 -0700 (PDT)
Received: from [127.0.1.1] ([1.243.227.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cb357sm4673435a91.17.2026.10.01.06.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:39:58 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Thu, 01 Oct 2026 22:39:12 +0900
Subject: [PATCH v2 1/2] drm/imagination: Fix reference and vm_bo handling
 in remap()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-pvr-fixes-a-v2-1-f58254e5dfb8@gmail.com>
References: <20261001-pvr-fixes-a-v2-0-f58254e5dfb8@gmail.com>
In-Reply-To: <20261001-pvr-fixes-a-v2-0-f58254e5dfb8@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

When a map overlaps part of an existing mapping, pvr_vm_gpuva_remap()
splits the mapping into prev/next parts covering what the request did
not take, instead of creating something new. It gets two things wrong.

- A GEM reference is taken for each part but it's never needed and never
  dropped, so it leaks one reference per split (remap-next-in-2m in
  tests/imagination/pvr_vm_map.c):

    CRITICAL: 33558528 bytes of shmem still held after close

- The parts still belong to the original object being split, but
  pvr_vm_gpuva_remap() links them to ctx->gpuvm_bo, the new object's
  vm_bo:

    prev_va --obj--> BO_A          BO_B <--obj-- vm_bo (ctx->gpuvm_bo)
            \___________link___________/  (mismatch: BO_A != BO_B)

  drm_gpuva_link() catches the mismatch:

    WARNING: drivers/gpu/drm/drm_gpuvm.c:2108 at drm_gpuva_link+0x2ec/0x310
      drm_WARN_ON(obj != vm_bo->obj)
    Call trace:
     drm_gpuva_link
     pvr_vm_gpuva_remap
     __drm_gpuvm_sm_map
     pvr_vm_map
     pvr_ioctl_vm_map

  Link them to op->remap.unmap->va->vm_bo instead.

The locking of the GPUVA lists of the other objects touched by a split is
not addressed here; it is handled by switching the GPUVM to immediate
mode.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
Reviewed-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 55cc999f370..cbdd15ed74f 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -418,6 +418,8 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_ctx)
 static int
 pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
 {
+	/* The split parts belong to the object of the mapping being split. */
+	struct drm_gpuvm_bo *vm_bo = op->remap.unmap->va->vm_bo;
 	struct pvr_vm_bind_op *ctx = op_ctx;
 	u64 va_start = 0, va_range = 0;
 	int err;
@@ -433,14 +435,12 @@ pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
 	drm_gpuva_remap(&ctx->prev_va->base, &ctx->next_va->base, &op->remap);
 
 	if (op->remap.prev) {
-		pvr_gem_object_get(gem_to_pvr_gem(ctx->prev_va->base.gem.obj));
-		drm_gpuva_link(&ctx->prev_va->base, ctx->gpuvm_bo);
+		drm_gpuva_link(&ctx->prev_va->base, vm_bo);
 		ctx->prev_va = NULL;
 	}
 
 	if (op->remap.next) {
-		pvr_gem_object_get(gem_to_pvr_gem(ctx->next_va->base.gem.obj));
-		drm_gpuva_link(&ctx->next_va->base, ctx->gpuvm_bo);
+		drm_gpuva_link(&ctx->next_va->base, vm_bo);
 		ctx->next_va = NULL;
 	}
 

-- 
2.43.0

