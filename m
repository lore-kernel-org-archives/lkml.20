Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C46374A0B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791711964; cv=none; b=CPTyjsdInHyBa9hCP32PnZK7lsgHKrIMXPfk4OZCSF/UgpZ2aZQFFYzAcHlAYX76QWowp46sL5wzIc5EXk6ixt5oROnqNUCGvChYYthAuIsCzl6R38GIEAMLJKlYuoVCOT0NRLsENu3P1zZXQOPGA/iKIXm4EG2vuX+TZfybgXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791711964; c=relaxed/simple;
	bh=+jYY9sBonYmr5GTARWZAfrrVH+Chj/Nd+KP8dbVuPDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBD8v3nyeJV+KOvoP04s0AL1lRZz7llwPIEfgD6hGRDOFc9iggZsYxRGlbu/ZnF/MQ+xKH7zhhYe59B3ljKB/zwh/mVamoDxacQxT7qE0BFCeeA63+Y/CMD33JMsqPoaT1sGmp+f3UgcwombTYC3EtAVPKT6EC7iXYTKVvMzOxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSqeWJvB; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSqeWJvB"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso559384a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791711962; x=1792316762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZP+nJjW1ldXPLrJ2aA+g+89NLmL7+5znNakFjQ9T0o=;
        b=OSqeWJvBsGnHSbBYSbLp/tZKtjFXyyeSCLuwLo2JVVyE/e/jnoaP/8GxSKYfYGerCC
         uky99CzJzrdlf1x1soGHOroeOLU6ffJUUtrqJZtA1RIPKneGXCQnXoL5v69pSmFlzsot
         1rjkvKwQBDfJ4bePMOzgTSPT9S1xYeQ6hSieurxH93NC5pfPn6VisdD8xAW6rGYjAOdH
         4dD7cyC9dvAiB1KaHmoY9EhkjDQor/HpkUkk1f0QHdbM+8Yy59Ilpec+jwsQw2jJsPpi
         r/h8Q2jhMOPTQs8ppY5KCI3OOmNA6vzqSRuU4CdSm5PW9ilkmOoI6HNuh0wVuu/VpoEd
         92Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791711962; x=1792316762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZP+nJjW1ldXPLrJ2aA+g+89NLmL7+5znNakFjQ9T0o=;
        b=mF0h2OiWvd6CBOy0c3ScCRPLfjHuCUm3azGVcFm826CkxqZswCE3ldSrK1x0eUJRkW
         T8Jc23zI4URXBShSJotOmjnVn3M70SY8yGBV0vznsBx0oTa2RolD8HHI/Tnkbw0RT6d1
         7WcPp2ZzzBtvJvGbuMlbUL07MG7F8V/QKoMWYwkiQMns87zk8q9Aoyj1yAdCucZw/JXB
         DuKIKPZdGLk1BijfT1tfiTCzkXVReKImP+SdqO32FN0q4joMSfoRTew1mZi1SsdZH+xS
         phwxAIDOBEUn3227oh0J6LZ8MBsezBDtOdCZX8ZhrkU1/eMgJfrrZfqekQCRFicTIANl
         3C6A==
X-Forwarded-Encrypted: i=1; AKwUvBwDxkHVgunsAewunnOAeANlrhFW8uC2isi4rRUbonjinei1g7dz649HTemEC3fCK4Il3qH027pFKLb+FGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvPPRsMNin81bp5jaNc5WhJqEpkXZ0fWJCi5EFhvuF74SQxUpT
	1H9RuXeYz6bJZq6E0X4v2a1Eu3TWFnDQSKZL3Ck+7V/msn8PVn9ei/kcnZ7B3g==
X-Gm-Gg: AYBFou0NoZxE1xiuWD6Vq7/aVgd85o1XIW3Y/hrKBdg1wwqmnX7MW5+lQ6oTUPhz4Ki
	4au1CSgINlDku3R9Uli80uU2lMteQpBR2XO8bFFlG4SND4a4lmQ2Z5OzfDHF87/wZPQ4jre6Qy4
	m0ZOMTgMzWa1wu+WfCKRYlLGs/JdrGvJ2WLP9L7GTp9gBBUNNOGtv+Wd6twZsjFeX2SA+FdFgwq
	1yPjjp2I4Bd2Kck3afQQgb/GwHIEXw+asNjcJRsKfQ3/fK2s4jm0+hIMp+QMwT2ez5fI8zyBPGL
	WSt+4K7d6+hdGq+AUEaks72+jdXiEr0vBhWrzZ9AJHFImS8RTqtd8O6xaR5FteKr1Cg0q0whS9z
	0cGrHBdNVubszWhFy39BGEDw18CWAsMrtZBhK4povYUTr7xtVSGt7PHxNX5ng0JBXWpmrLe3Vt9
	o/dNaojRbBUahdFvxXAwRd03yHAuh5lmvJiM05Dl3Xwakvc0ZElx2C4FCoOioC824i0Ls=
X-Received: by 2002:a17:902:cec2:b0:2e6:1715:e48d with SMTP id d9443c01a7336-2e842ac8863mr65438955ad.35.1791711962471;
        Sun, 11 Oct 2026 02:46:02 -0700 (PDT)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422ba80asm31067695ad.63.2026.10.11.02.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:46:02 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 11 Oct 2026 18:45:33 +0900
Subject: [PATCH v2 2/2] drm/imagination: Stop locking reservations around
 map and unmap
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-pvr-gpuvm-immediate-v2-2-744ddc6644c3@gmail.com>
References: <20261011-pvr-gpuvm-immediate-v2-0-744ddc6644c3@gmail.com>
In-Reply-To: <20261011-pvr-gpuvm-immediate-v2-0-744ddc6644c3@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexandru Dadu <alexandru.dadu@imgtec.com>, 
 Brajesh Gupta <brajesh.gupta@imgtec.com>, 
 Frank Binns <frank.binns@imgtec.com>, imagination@lists.freedesktop.org, 
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
index 807a01aab1d..08ce6542550 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -704,16 +704,6 @@ void pvr_destroy_vm_contexts_for_file(struct pvr_file *pvr_file)
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
@@ -741,15 +731,6 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
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
@@ -761,15 +742,7 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
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
@@ -802,15 +775,6 @@ pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
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
@@ -819,15 +783,8 @@ pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
 
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

