Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C6D353A70
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652964; cv=none; b=aeuuuyzF5cRrjRl3ZpWQB4y0OCph9WM21CXWLiA0H+xcg4pAS7iCK1cZRO2o6b0B6KIb7iJSEJ1dlEyf/ZUKKcXYUoLH2nt6PhlMahiqQ6Bl1d3hEE5waRSWD6gZptumvw1O3pGFXooDiPYETievhA0NBI7vtVinV7hsKLk8Fb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652964; c=relaxed/simple;
	bh=Lc7OBaS5FkgCwjcjXRee5cb6Mz0YkPnXOcv8Z+nnYBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DgsTMJv4rBGOFzFoKqRrlW+bq3McEac19F8pjiCEpVJ9nKRZG8PX4Zq7xBGqcWKHJths1EbwnU+9lyrMtqu78LSxUFfSAMc5BU4Sfj7JMDgO51xX6JZ9e8L7m9YSA/hCThVjFAZ6X0k9fOS9ILm1vZknoMZ0UGiaK3MGxKA6Qjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCWnT8zb; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCWnT8zb"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-88bd2b44f3aso267301b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652963; x=1792257763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kF+TnaMTCyaX+72q/YGqtBO7N1GkJDdibqP7n7gt2pE=;
        b=DCWnT8zbkMg769YXc0AtYCjcVvSQVZZcw/D0fAdBB9mDgZ/r61xNR3VyQPaav+3PDu
         DU+7dCgSajk3Lv9osPEUk2ErOZ3VCPrzBSgHY3Xjd3lWpqy4fenRJGncfS9dt3Hf5x0a
         wVh8RVzGvN7s1E4ExngmlrQFojJEntTAFJYxBCifUGRIS1kYy30X9bH0zJRVmIiYdsPV
         No/VtTkSHhjaE1Wc6iskoXWImnKRMxcK+MQh5rKD1ICQOZPohqn4Bl7kecrOyDfelfHO
         I02F5yS16poZvtM0/JTdUKJRvZz4iYJFQ1ueCX8gBrkplH9CulkkKw4gkGOFw6Zd0KV8
         FhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652963; x=1792257763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kF+TnaMTCyaX+72q/YGqtBO7N1GkJDdibqP7n7gt2pE=;
        b=vWDw1UfW+1goqyDwd69twavrlQ/lzczTUZWjmnJDRLr+PiI454gyWBPcB8nuWl1Dgk
         C3UrWqkbA2QdvpcnBOvy/cjdWzSELXQPDt34qBLv3dViHyzTHdzNz0ZwA10IYVnYrAYA
         fI5fOK0f3rUDrj19MPAloqt6nqN5uHqcDHFYWl0XSXOjuI33pDMuHw2vaOSViK1vULM/
         473EarygbkphnspqZwMKM4C/O3HObJYsgIk7eW5pGPv4/mZ2lvOMdj1rPQyAtGaMnrVO
         9obvmM5V4Ur+HtcG1FDXUpRYUS5V7evvHNjXf0Fj39rOG+n+smtOW7nKbqs1mXxL5fRJ
         M7oQ==
X-Forwarded-Encrypted: i=1; AKwUvBy44A96vwZ1oONwkuPmJGrpWI9fYcvCHbZeICFKrmkYlXt5ojDOQoXq3aCnr0w5eqBN9/rzHrXRHEERrSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAZw57QTibYffhSO0ChLwKU1aRYldSQFo3q2eYyX8HpqQzXx1o
	+XruMM2p/KronDNi14YDvVIBjL1Ly8mo9njQY77Dw+1PbBjZiVXaOz7h/ik9GQ==
X-Gm-Gg: AYBFou2hWuIIxC9g2wKXZZg0dFfSOk2uBdUUrGW6down3LDN0L7OGcLgvEDB8zz0PLi
	uU7YYu0FVXfXGtoEc1ox/gbPnDPpk6OgwNbiCUVa94a0E03wNB839FqsiV/pivTGwjSkh0pFymy
	6hEKIOgkRUrv+I3JxliZX6fNACTj3gkZQECp5/SfX5/cRl22eF8u2JKL/88LINIqeT9rDwp0CwT
	EHx+MT2QyYyybSnjmzuCH1wrIb1uTcHLjT5dL4vKkuBK5Wbr4tomKtEz0usr9H1dLbBItdAlkQ5
	ORlIXSRo/CvnxrZm8GfaTje8jYgKABNjC6O2nmLUgp9rqp6FhT7lCGEPi0Wc8/ClEK4ZalU/dal
	Bc93HlatCEfDgDSedZjA4Oo//Mk/OAXHyJ3JgNr444Miz4FFBwZ+uLMF0IfSoKMz1e4U1HtoIEp
	+aoJH6yudqsITeY+9hTlAcCYyrGawSgXspK78+cQ2rLcgJwdIrU7jy9W6Vo9fWOQ3T5Z8=
X-Received: by 2002:a05:6a00:9296:b0:88d:20ff:15c1 with SMTP id d2e1a72fcca58-897c65413femr4705684b3a.18.1791652963096;
        Sat, 10 Oct 2026 10:22:43 -0700 (PDT)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-898802de7d6sm1510213b3a.23.2026.10.10.10.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:22:42 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 11 Oct 2026 02:22:21 +0900
Subject: [PATCH 2/2] drm/imagination: Stop locking reservations around map
 and unmap
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-pvr-gpuvm-immediate-v1-2-5b298dfce4f8@gmail.com>
References: <20261011-pvr-gpuvm-immediate-v1-0-5b298dfce4f8@gmail.com>
In-Reply-To: <20261011-pvr-gpuvm-immediate-v1-0-5b298dfce4f8@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>, 
 Frank Binns <frank.binns@imgtec.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, imagination@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

The GPUVA lists are now protected by gpuva.lock instead of the
reservations, so map and unmap no longer need to lock the reservations.
Nothing else on that path relies on them.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 43 ------------------------------------
 1 file changed, 43 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 3921b765688..2f1bbcfdb60 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -702,16 +702,6 @@ void pvr_destroy_vm_contexts_for_file(struct pvr_file *pvr_file)
 	}
 }
 
-static int
-pvr_vm_lock_extra(struct drm_gpuvm_exec *vm_exec)
-{
-	struct pvr_vm_bind_op *bind_op = vm_exec->extra.priv;
-	struct pvr_gem_object *pvr_obj = bind_op->pvr_obj;
-
-	/* Acquire lock on the GEM object being mapped/unmapped. */
-	return drm_exec_lock_obj(&vm_exec->exec, gem_from_pvr_gem(pvr_obj));
-}
-
 /**
  * pvr_vm_map() - Map a section of physical memory into a section of
  * device-virtual memory.
@@ -739,15 +729,6 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	   u64 pvr_obj_offset, u64 device_addr, u64 size)
 {
 	struct pvr_vm_bind_op bind_op = {0};
-	struct drm_gpuvm_exec vm_exec = {
-		.vm = &vm_ctx->gpuvm_mgr,
-		.flags = DRM_EXEC_INTERRUPTIBLE_WAIT |
-			 DRM_EXEC_IGNORE_DUPLICATES,
-		.extra = {
-			.fn = pvr_vm_lock_extra,
-			.priv = &bind_op,
-		},
-	};
 
 	int err = pvr_vm_bind_op_map_init(&bind_op, vm_ctx, pvr_obj,
 					  pvr_obj_offset, device_addr,
@@ -759,15 +740,7 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	pvr_gem_object_get(pvr_obj);
 
 	mutex_lock(&vm_ctx->lock);
-	err = drm_gpuvm_exec_lock(&vm_exec);
-	if (err)
-		goto err_cleanup;
-
 	err = pvr_vm_bind_op_exec(&bind_op);
-
-	drm_gpuvm_exec_unlock(&vm_exec);
-
-err_cleanup:
 	mutex_unlock(&vm_ctx->lock);
 
 	pvr_vm_bind_op_fini(&bind_op);
@@ -800,15 +773,6 @@ pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
 			u64 device_addr, u64 size)
 {
 	struct pvr_vm_bind_op bind_op = {0};
-	struct drm_gpuvm_exec vm_exec = {
-		.vm = &vm_ctx->gpuvm_mgr,
-		.flags = DRM_EXEC_INTERRUPTIBLE_WAIT |
-			 DRM_EXEC_IGNORE_DUPLICATES,
-		.extra = {
-			.fn = pvr_vm_lock_extra,
-			.priv = &bind_op,
-		},
-	};
 
 	int err = pvr_vm_bind_op_unmap_init(&bind_op, vm_ctx, pvr_obj,
 					    device_addr, size);
@@ -817,15 +781,8 @@ pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
 
 	pvr_gem_object_get(pvr_obj);
 
-	err = drm_gpuvm_exec_lock(&vm_exec);
-	if (err)
-		goto err_cleanup;
-
 	err = pvr_vm_bind_op_exec(&bind_op);
 
-	drm_gpuvm_exec_unlock(&vm_exec);
-
-err_cleanup:
 	pvr_vm_bind_op_fini(&bind_op);
 
 	return err;

-- 
2.43.0

