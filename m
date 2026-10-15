Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC39C4A013F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055516; cv=none; b=usOjNwOSybnR+QgjpwA56ClpZNcSguouhCfNtCvRfJL6OLN9936Yqg972UMHByeymb1JiRilKs3p+Qxn9fgCEjmZXNIsn5Hq4HEJzrQwOTdPLyzHLsJm7osdqgYhdnQBc0Vdvu0720WWChtX0fdt2u3YGmD2pdwFftx7wiyRC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055516; c=relaxed/simple;
	bh=u0gbtAzatA/QlxmkxnCg4w6r5oinqKn9k4S2CWEZq4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A8LAjQJje71XaKxhUCCJf+1IRke8FAuQG1NFtPghoQctx/eiXnqUgZWLFdt0uzfb5/uyLcFy7vfnNyfRm2rEKQzc38N+aDtgQuMd7SabbWQen9GNxqp4yYcjlEXVraVwT+dcJvVHTwKUwUj3lbCYtPGLFZtYGi/cOz1oRUobwdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UViW6RRX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UViW6RRX"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso725347a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055514; x=1792660314; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PVjmHGw5O4smXiseMBYfifX+jfasJS0dPUWrUM1BnS0=;
        b=UViW6RRXcTSO0Is6flBP4dZYKoB3G3NtVOANxERlXIXM9GhUe3/vyyrQnKfsLvrXP7
         FtgUWp8TVXlOx7JVHdZwVmc5uGzK/unkYN2koxW4rsFQICX4QwKBEXzUtRuIAPKS8JVP
         LhPAGJ9t2v1Y/xH/XcA47s48RwQwW4QXUGere6FHjbPv+1/EHJkLXzBzaIWKBW52Iwfo
         1y1EpTqWbpXRpd2FDiWz5lI2fq9I3JYYrX2fd8aGZ9e5yepdC0ECwQYd6NReGg90h4SL
         A8sQEXR7eLT/Dtcx49RFCEmdEpG9hJIqtbmZX+bvBwfkH04pwZGRV9r0ntvlDE5TGu6u
         5oHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055514; x=1792660314;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PVjmHGw5O4smXiseMBYfifX+jfasJS0dPUWrUM1BnS0=;
        b=H+E9f0yyDUQNRXxJCrfgLAIxxrYmKTHelvKteE4nq5JFPYIo+MEhl/619WafKJIHO+
         0bePcpVEp5r9OmxfWvI4o0yEp7iqAmYreJJau1O2/6YSPHxdwKImIGM0TyvZfMt3yNmf
         jhW7nhuGuWHjV7tCa3H6gGF95praSC8H21M9ANczjOTtjdRJ5zt+4A5TLKANAqxPi4j/
         +ZJwqx4Omnw7/s72Pozx+jM1h3bPmIrnvRB+FZ6VviNTdAmbqC1sp0ABMPNlmeyZMIj4
         xAI8riORzLD+3+X6oM3GAVW+G7WuwQmPhdi2zqFY+PcfVtWn1x4NDv1yRHB078oRJim5
         V11A==
X-Gm-Message-State: AFq9FYJ9dJfcfKydSL4cmsS9TlAszdG7G7GKHGsXqddU6Tpvp3FB0IKO
	lF2bk78NtYchCFv9r9T5cAA/6AUqBW0zIexVaU2wARRzN0DMo2Ftz16c
X-Gm-Gg: AYBFou3QzpMt3kIQh1b6ppCE3mfYIeXU8x4VstUqQfUnMgf+a6rdvebB0rVHz6mVWP1
	usKxgY7nTB0ZuwFqR4xNeXUrDGahVhi3eO3r1P4iTCGb5zBS/MjAGNF1iFbgb1uKyAOY4dOz3+w
	IyvlxCll20p4F0uFUyqCkirUSvo9fa014EXPTlpcPyuWtnLka0JpQPU1jZ42d0HTxPjbCXY/osN
	DZcCTwv/OnW+qNz6mNq81oSzHYr8tyu0xO3kQFRdTh/lQAPHlWGFeU8UtRK+k1xc5ojXTJBiPBW
	vCqHAP9/xquKMuf0lsajDg8DcWbI2cWcyImdQbINjdzjHn49WVNoi9ysCpdy/u74lF+R+FQZZao
	NMKq5rxqko34qTSIfRgFztJuh+pdbGTBR72FAJ4URpvz0f5nSSzidX23tHr4buinyoTfgpMQFda
	mqSQ5IFfTFy8IMUTDy6KFTEWlYddHoBtr6fy/BG9gnyvKqtETRWZHg8S/j/ZOBqEjyysY=
X-Received: by 2002:a17:90b:4ac7:b0:3ab:f38:2b41 with SMTP id 98e67ed59e1d1-3ab3a8e5b2emr16863678a91.39.1792055514281;
        Thu, 15 Oct 2026 02:11:54 -0700 (PDT)
Received: from [127.0.1.1] ([115.88.114.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3727363a91.10.2026.10.15.02.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:11:48 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Thu, 15 Oct 2026 18:10:51 +0900
Subject: [PATCH] drm/imagination: Don't retry a failed unmap in
 pvr_vm_unmap_all()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-pvr-unmap-all-loop-v1-1-54c676d41269@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJqY0GoC/x3MQQqAIBBA0avErBtQo6KuEi2sxhowFaUIwrsnL
 d/i/xcSRaYEY/VCpJsTe1cg6wrWQ7udkLdiUEJ1UsgWwx3xcqcOqK1F633AYTCkjFp6agyUMEQ
 y/PzTac75A1wuhQRkAAAA
To: Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Ripard <mripard@kernel.org>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matt Coster <opensource@mtcoster.net>, 
 Alessio Belle <alessio.belle@imgtec.com>, 
 Brendan King <Brendan.King@imgtec.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imagination@lists.freedesktop.org
X-Mailer: b4 0.13.0

pvr_vm_unmap_all() repeatedly looks up the first VA and unmaps it. The
VA is removed from the tree at the end of this path:

  pvr_vm_unmap_all()
    pvr_vm_unmap_obj_locked()
      drm_gpuvm_sm_unmap()
        pvr_vm_gpuva_unmap()
          drm_gpuva_unmap()   <- removes the VA from the tree

If this path fails before drm_gpuva_unmap(), the same VA is found
again. If the failure persists, e.g. memory allocation failure under
memory pressure, the loop never terminates and the task hangs.

Always advance to the next VA, whether or not the unmap succeeded. A
VA that fails to unmap is left in place with a warning.

Fixes: a5c4c3ba95a5 ("drm/imagination: Hold drm_gem_gpuva lock for unmap")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-167146@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
Tested with the IGT pvr_* tests.
---
 drivers/gpu/drm/imagination/pvr_vm.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index cbdd15ed74fd..8ea6e88c8bd7 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -887,22 +887,25 @@ pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
 void
 pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
 {
+	u64 addr = vm_ctx->gpuvm_mgr.mm_start;
+	u64 end = vm_ctx->gpuvm_mgr.mm_start + vm_ctx->gpuvm_mgr.mm_range;
+	u64 va_addr, va_range;
+
 	mutex_lock(&vm_ctx->lock);
 
-	for (;;) {
+	for (; addr < end; addr = va_addr + va_range) {
 		struct pvr_gem_object *pvr_obj;
 		struct drm_gpuva *va;
 
-		va = drm_gpuva_find_first(&vm_ctx->gpuvm_mgr,
-					  vm_ctx->gpuvm_mgr.mm_start,
-					  vm_ctx->gpuvm_mgr.mm_range);
+		va = drm_gpuva_find_first(&vm_ctx->gpuvm_mgr, addr, end - addr);
 		if (!va)
 			break;
 
 		pvr_obj = gem_to_pvr_gem(va->gem.obj);
+		va_addr = va->va.addr;
+		va_range = va->va.range;
 
-		WARN_ON(pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj,
-						va->va.addr, va->va.range));
+		WARN_ON(pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj, va_addr, va_range));
 	}
 
 	mutex_unlock(&vm_ctx->lock);

---
base-commit: c347fef5f8f8927985bd67835331ce4cf7ff43a4
change-id: 20261015-pvr-unmap-all-loop-99fe2f2b7e3f

Best regards,
-- 
Gyeyoung Baek <gye976@gmail.com>

