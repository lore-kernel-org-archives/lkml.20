Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AB33CCFAC
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790497643; cv=none; b=nH9wZ13Q6mwFu4s3Zo8//KoOZ2sVD2XCTHFZ/NA+1Eek3+dqVTtAq4OwiaABM0jrdR4T9qXwQQELrdep9oyNQXMfmbd/3CR/zPb5OkFMbMOQM+BZhgBhk+nIF0+t/0o3+NxDCCwZl7gima6p5Mxs+euiGbVKAYepNZh7HLbTbnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790497643; c=relaxed/simple;
	bh=GCWjnwWA9xL20xT8L9ZdKBcEsKxEmzrwDiOG7anSkwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0b+N11VZqfJT1St55kSZwry77HCNepBkwnH0VZlcb34w4WzMUp/8Z9xBJeR7Sr7HPvGmHy0fM+P56wmRCHicfiTDHfWdmf1KFuKc2E1oCg0RSevQSLj3eAacElpqwLXz12xMHrD/xkOCh4dMzPK/bytFsxxqtjRjJK9pGB8/0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=En97sSv5; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="En97sSv5"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bcdf41a3so1019466a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790497641; x=1791102441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAVR3NA1IwToQtg3Yc1aurKDu9RYUd4Cc7CFtZPZAIs=;
        b=En97sSv5m8W/iB5rQjrp3rct3rfIJvYOiLajtWo/teCDv7wZdglrY+lIhJHz9vxvCi
         a+0lMYuF+KfEIXavfSjpG+B3i0FiFLUZzoB8/QFenAQRWM6ttZE+RRYT3e1A4QQMkqPJ
         cWk+AO61DKpW+7QD82dOU6DanpzJj633yebzvP9XVV0s1Mkj5SMVmvITTVDKy7uJBcbf
         tq0Vm/qLX+BtXnFKbm8WRQyYO17dLNJSuXP27aXiQazxnA1fOp0Go9qeQVZwLPjCGx/a
         qO4EDK+tElfFr0MPwRA3jO5QihhDNUXlsy2m6VGy7Kw2wNU+rv7fhA1Hmp4LgdIN/9cF
         v4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790497641; x=1791102441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QAVR3NA1IwToQtg3Yc1aurKDu9RYUd4Cc7CFtZPZAIs=;
        b=WAxmeoGFJcArfM5uTrpHkwePBCKvq62RwHC7vWBGcCAiGKcLBNKzXbMqCCW4SG+bEG
         VAUImL0zbKO4RHVB687LhpuLhQjBd3iO7vLGOFxd+LxUKl3Hmi+IRvgRwO0M/MbWxG3g
         WgtsmSLQad8zgbzguyqjcEikG7+EkW2AC498rAok2vkvd0EZ0eqEZJvd/qqdwwdrH41e
         C3N0ErUI69faYxx+IVsTMWrd4AWHnIaf0j0EWTuLouBShv28f8Wy6sAHUymD2+ik8YpH
         kozLnRfAeATCQxOoRPH9bSNk5auRz4IyyO8e4N+8CD+mf4yS3iCjyWUllNmhrjoS5QE5
         pJ1A==
X-Forwarded-Encrypted: i=1; AKwUvBxSUI0GdpAYcYd9N+XY2jQJuzEhi0FIE8LG6cA5QW9xKrMv2cXsvoNg0GqTVr+ClboK3+lekVxiFhdfzLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKk7fz6yMubv57Ut2arkdnH2OlUiM1XgzMC2W/u6KPpiiMU5W0u
	pRfC9q/3Bt/0mJTnvI4AJPrSqt9H2/uIKx6BkvjOF8BYNFqkIHDXszjb
X-Gm-Gg: AYBFou07/SiMNfzF78kOQeHShl77wFx0+rXHTcLaeZywQ9yjXFh9QCloPolteX0tZCx
	rccSVDccxwsicS0Sk5phIkHoO7jiZHdeAZMCd0bMxaYWml0TNWQpRj8T/7bh03oQCPzUZechhJ/
	3b8HRLL/PQ8yS1oooXeuMXUQ7afum1VRuh9XL60nf8nltZuMLbQPejO0h4HRYAgdA149HNVWWvT
	i2ns1sD2/TJTVJWSPck6x6IjnhneM6euvGLsjM/PH7NJ03A9z71MVmbPUiU+6I+XdtTHPiTPiA/
	sTUTpUdd7GlJl8THIGH8JtLXvi9HQeNdc3R+UQZUcUjer5RAxS0AyoPJ/JvXH1X97toIZXxAckk
	a4j/eiEbzzO5PyvVzH3u75+h+fpqVPAJXaAYJMa0EZDf1vei0vU+yzk5wpr0aounQCsek5v9t3Y
	1OH5+WmceX0rW/IGiSTbOoYh4QLZPBxlDESC1HbWcgs4ypC75lAzJCA7cn/WGcSj7NxVRrPquSE
	g==
X-Received: by 2002:a17:90b:3888:b0:3a0:cc33:2287 with SMTP id 98e67ed59e1d1-3a0cc3324ccmr4525187a91.6.1790497641483;
        Sun, 27 Sep 2026 01:27:21 -0700 (PDT)
Received: from [127.0.1.1] ([1.243.227.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a2b1e4d5basm1921496a91.9.2026.09.27.01.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:27:21 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 27 Sep 2026 17:25:53 +0900
Subject: [PATCH 1/3] drm/imagination: Fix reference and vm_bo handling in
 remap()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-pvr-fixes-a-v1-1-7f5b18ab989a@gmail.com>
References: <20260927-pvr-fixes-a-v1-0-7f5b18ab989a@gmail.com>
In-Reply-To: <20260927-pvr-fixes-a-v1-0-7f5b18ab989a@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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
---
 drivers/gpu/drm/imagination/pvr_vm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index ceb78694cd9..c5ae0b79fe6 100644
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

