Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644359;
	b=4BllhNZZX4f8t7KY4E/qItx5y2ffUmumTQOX1GZVk1GrQd37//w1Zk05vnNUVZQYCCWt
	 1e/JzNl3nKtp+yIz4qcU2d8p38co3YUkB6yjYGqrXPoCzn5rrdol6k79aZ8MlWsi7S5l7
	 Vw8vvphnzfnQCP5lRHo6FB2RJmwsn+95eyC5e/2Y+Q0zzHc91MyTRBvNWreoidT8I5MwR
	 IlX+u3xSDz1okLogDhXqb8ch4G3cNGf6g2NLpY7263CWXO/rrg4YuetSGlZVbL0fQZs08
	 sRgRDSoUg+mm6Q1B4nPxoF8OfpGWJKGi8dvbCiCu1E9g/reCJRu46p2ivjtgyR6LpzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F88s34t6HgwaWc7KrjRKtNSJ/J1MLEeihPOI9axIS0Y=;
	b=YUH7adFA5Jm70/tsbSh3tqhwn/V6ZLAjrDHv4wnozcwZYc3yOt7E6qelYjCenLio1ZJ3
	 rjwTfoenhDmg4bKKjvxXEx2zjMY6uz8NltQrJNyaj2T2Mykh3m/oxKAFP4/Wke1HyXgeE
	 p4+qY86uzakjqRnMJ5XM5CaoitnW/XqkUTZMeePub8kZgoi5IMA9Ab0X1kPreS08VkHW+
	 B38b/s0mQk+eGzWCZfmpy3i/3u183kYRPAK9zr5oD0oJYKm3ZtAWaD/q8W6ImKTFsc/nS
	 J767ilaGCOIKnVeQ6IvNxGUv6Ewq2QiNcP3uwGMSJywCTyTjD78EQctWfHvFCYZgWGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFNz83mT;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD988606A889
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD988606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFNz83mT
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36ecc11bd26so225902eec.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794644358; x=1795249158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F88s34t6HgwaWc7KrjRKtNSJ/J1MLEeihPOI9axIS0Y=;
        b=SFNz83mTcOPA3L7JSEyJ8LE8yDR/LmyRE4ocGf+ufqZMrtJYjCOsx7Eiq6jc1sq11P
         BtM4cpYHk3vO1Nrs3lziT0EVlW+N59TOsGut+vCLDEFCyYmekQsJD9xGI/c+pVbuX14M
         GIDoB6wGo1SoPXoYgNG2jvSxfL4l83t34FE7t7CLlQ5OpSQ8Sg6hYdMc+yQsf5AL9sir
         FkaA9K66OUMpCzXIjcPmb/ns751UeJukzieZ5gZjo1l3nv4uEFclv1U/iceveItZhhuh
         kbkl91Rb7uU9tbT6y/U2weZwvb6CpTdbuNfgAjpizMYppqHMYY8PDYd81sRXLBPTCXLf
         V6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644358; x=1795249158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F88s34t6HgwaWc7KrjRKtNSJ/J1MLEeihPOI9axIS0Y=;
        b=bwi4HxlTL5dWDinZU5NM3pqPq2J/NKKmiTlnQZiHxEDChNhtpsPNM7ZWuekVsXPyp8
         0ybG4hnVyHQeyE2/82mScjm7nGBTEDor0JuKwz4FOLBfilJnhKtdLDULC8MilXeZ+o4B
         C7jSHZHb89hbIJe7ym3rIxSbbn5+VoPvMma5XmAgdo9Vi6x779bfYfcWvS+kHpkKbgAA
         i99NLlxcQEMzNAqJdKppTz52M7b7RrtQcLT1nx5FxwKNUlRuOzT3rK8Hp7uQVmL01YNe
         +bY+crBdrgJQh76Bkv0DH+os9d9o15JEmP77t0Bi9xd4BegNcEHkodhLYegECf49R0GI
         6EDg==
X-Forwarded-Encrypted: i=1; AL+hErF9cLkpBNykFqG3eS+ai568q9pShoyTAcRNF/d8yltZpRgTKS/nT1vo+gB5xUSbkj/z6bWg51MrlZuyxnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6GWsmRbIiQycC82ET2BsLzIDTtRVJBB9VQPoFjRKJmZeNoNl2
	RbA/s2d3NuRjdpo/bPtxfFgY8xS1fszLGlkIxbSXibHiOGz/Fx56pCU1
X-Gm-Gg: AYBFou2DcY+efZkhH+UDgodN+RV9Q5YXeGMTw7bS+AZQlCVa7qBSE9K91yraf+Sspn+
	1zABgWr7Eohg04i++Ht0yjb5EMEb+vxtT+c+bRELzGFZwvjSyjW61Mqtb1vBcm9EgCOs4j4Dk6c
	SM3C6mVywyNnjsLoXVPMG/E2S6TbapRZO+PHZ7EA+ltSN49IQ5maFGgWEd+GBXWQVyoUzboGdaZ
	rx1a+tXMR82f/mdXGV+y5AumQqP4xHEKq9M9tdK8de1fmmf6HJO2s4QtiRBXtr6vJOId+DK9qo6
	gbqRorrt9wKtMA2UPEPRpapnkA/F8OvLb7NOB740EzU7dD+B6KVtgA7bIzzt9+C45OluRi5+/lh
	ZvNvP4pxv3rgIKr1uuBAA0b9yl6tHFSdDv25pQWqgg245ZHfDpcQlVzY5ZuniLt3miEMqsSlMHS
	H36cnpQ0Xsm2KPGhBEEC6TKZt8pfu1XzPd+rvZHFprb/wVb1um5pPxxk4oPt9syyukK71VSV4aC
	lVoTppYv0uv2xIRNRpXHUdBq9Zw2g0nscEGQOI943gZDo1VryLPbfyCD8G/G/Lzw0ceUAz6Y9js
	M/Ukv7ly1Rn55I9DPOdIlr+kOMhYTERWi2zfdjltaKNFJUN1aqjZnKlic/LCNCF1Bz+qpWhGHxU
	WjEE=
X-Received: by 2002:a05:7301:a0a:b0:36c:a1bc:6114 with SMTP id 5a478bee46e88-3796038259fmr6915918eec.0.1794644357643;
        Sat, 14 Nov 2026 00:19:17 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm14008333eec.3.2026.11.14.00.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:19:17 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] drm/msm: Release the pins and ops of a VM_BIND job that never ran
Date: Sat, 14 Nov 2026 17:19:00 +0900
Message-ID: <20261114081902.1669-2-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114081902.1669-1-arpe1618@gmail.com>
References: <20261114081902.1669-1-arpe1618@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msm_vma_job_run() applies the pgtable updates that vm_bind_job_prepare()
queued for a VM_BIND job, drops the GEM object references that
vm_op_enqueue() took for them, and unpins the BOs of the job. A job can
also be freed without having run: when its entity is killed, e.g. on
SIGKILL while the process exits, and when msm_ioctl_vm_bind() fails
part-way through vm_bind_job_prepare() or after it. msm_vma_job_free()
then frees the queued ops without applying them and without dropping
their references, and a killed job also keeps its BOs pinned. Besides
the leaks, the VM no longer matches its pgtables: for example, the
pages of a VMA that was unmapped from the VM are still mapped.

In msm_vma_job_free(), apply the queued updates the way
msm_vma_job_run() does on error: skip the maps, but apply the unmaps,
so that their references can be dropped without freeing pages that are
still mapped, and mark the VM unusable. Move that part of
msm_vma_job_run() into a helper for this. Also clear bos_pinned once
msm_vma_job_run() has unpinned the BOs, as msm_job_run() does for
submits, and unpin the BOs of a job that still has them pinned. The
job's fence does not keep them busy anymore at that point, so take the
object lock to unpin them.

This also marks the VM unusable when msm_ioctl_vm_bind() fails after
vm_bind_job_prepare() has queued updates, i.e. when the first op fails
part-way or when sync_file_create() fails. The VM is then left
partially updated, as when a later op fails.

The patch and its changelog were drafted with an AI coding assistant.
The issue has not been reproduced, and the change has only been
compile-tested.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-214234@kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
At commit 2e6a8a1fe2b2, msm_vma_job_run() still unpinned the BOs under
the object lock, and msm_gem_vm_unusable() did not exist yet, so older
stable trees need an adapted backport.

 drivers/gpu/drm/msm/msm_gem_vma.c | 65 +++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 8b702422030a..a6f106d0cdef 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -700,16 +700,16 @@ static const struct drm_gpuvm_ops msm_gpuvm_ops = {
 	.sm_step_unmap = msm_gem_vm_sm_step_unmap,
 };
 
-static struct dma_fence *
-msm_vma_job_run(struct drm_sched_job *_job)
+/*
+ * Apply the pgtable updates queued for a job, and drop the references that
+ * the ops hold.  If ret is an error, or one occurs, the remaining maps are
+ * skipped, but the unmaps are still applied, as the pages they unmap must
+ * not be freed while they are still mapped.
+ */
+static int
+vm_bind_job_apply_ops(struct msm_vm_bind_job *job, int ret)
 {
-	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
-	struct drm_device *dev = job->vm->drm;
 	struct msm_gem_vm *vm = to_msm_vm(job->vm);
-	struct drm_gem_object *obj;
-	int ret = vm->unusable ? -EINVAL : 0;
-
-	vm_dbg("");
 
 	mutex_lock(&vm->mmu_lock);
 	vm->mmu->prealloc = &job->prealloc;
@@ -740,6 +740,22 @@ msm_vma_job_run(struct drm_sched_job *_job)
 	vm->mmu->prealloc = NULL;
 	mutex_unlock(&vm->mmu_lock);
 
+	return ret;
+}
+
+static struct dma_fence *
+msm_vma_job_run(struct drm_sched_job *_job)
+{
+	struct msm_vm_bind_job *job = to_msm_vm_bind_job(_job);
+	struct drm_device *dev = job->vm->drm;
+	struct msm_gem_vm *vm = to_msm_vm(job->vm);
+	struct drm_gem_object *obj;
+	int ret;
+
+	vm_dbg("");
+
+	ret = vm_bind_job_apply_ops(job, vm->unusable ? -EINVAL : 0);
+
 	/*
 	 * We failed to perform at least _some_ of the pgtable updates, so
 	 * now the VM is in an undefined state.  Game over!
@@ -753,6 +769,8 @@ msm_vma_job_run(struct drm_sched_job *_job)
 		msm_gem_unpin_active(obj);
 	}
 
+	job->bos_pinned = false;
+
 	mutex_unlock(&dev->gem_lru_mutex);
 
 	/* VM_BIND ops are synchronous, so no fence to wait on: */
@@ -766,26 +784,41 @@ msm_vma_job_free(struct drm_sched_job *_job)
 	struct msm_gem_vm *vm = to_msm_vm(job->vm);
 	struct drm_gem_object *obj;
 
+	/*
+	 * In error paths, and if the job was killed before it ran, we could
+	 * have unexecuted ops.  Their changes were already made to the VM, so
+	 * apply the unmaps, and give up on the VM.
+	 */
+	if (!list_empty(&job->vm_ops)) {
+		vm_bind_job_apply_ops(job, -ECANCELED);
+		msm_gem_vm_unusable(job->vm);
+	}
+
 	vm->mmu->funcs->prealloc_cleanup(vm->mmu, &job->prealloc);
 
 	atomic_sub(job->prealloc.count, &vm->prealloc_throttle.in_flight);
 
 	drm_sched_job_cleanup(_job);
 
+	/*
+	 * A job that was killed before it ran still has its BOs pinned.  The
+	 * job's fence does not keep them busy anymore, so take the object lock
+	 * to unpin them.
+	 */
+	if (job->bos_pinned) {
+		job_foreach_bo(obj, job) {
+			msm_gem_lock(obj);
+			msm_gem_unpin_locked(obj);
+			msm_gem_unlock(obj);
+		}
+	}
+
 	job_foreach_bo (obj, job)
 		drm_gem_object_put(obj);
 
 	msm_submitqueue_put(job->queue);
 	dma_fence_put(job->fence);
 
-	/* In error paths, we could have unexecuted ops: */
-	while (!list_empty(&job->vm_ops)) {
-		struct msm_vm_op *op =
-			list_first_entry(&job->vm_ops, struct msm_vm_op, node);
-		list_del(&op->node);
-		kfree(op);
-	}
-
 	wake_up(&vm->prealloc_throttle.wait);
 
 	kfree(job);
-- 
2.43.0

