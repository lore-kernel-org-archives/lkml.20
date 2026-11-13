Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587234;
	b=4JblMK8Ly7qBYEb0ownzsy2cMy17loZ6iln2nmPKoTYkNiWK+nXAl7i1qNkyAnNL30Ay
	 tnGRleeUJDh25qk1yrpsWGNuR5AvAq4QTQgKKRUSt5uWIGt58zuryx7zaiSbNqGpmspMJ
	 D6+6wFk86iuVcDtg4u753nubFnaWO09hofr/USAuJ9t7uum1b4myEPaM38sJ4r+2f2zZO
	 vQXkqpnhF1WWJyWNr3snoVul6eZ8QBTikXiLZ8P1NlitrQTvzvO6wvYqo6kh/GUc/hj3/
	 6lsmwasBH98Trgw8kd/WJ2Ym/KxwonNQ3K+cN/dxWMlSOJM0QBbzklrOxHyPTlGOZ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nH+4fuf6JFUHnT4EFq7h99rEDt8N7Ykz0lHqkyH7S6o=;
	b=S9ZXiHJizn5BE4QP2/nwjiePED7sMyU5vHpev611zK0lyw5/IpwOSEKpik5C/eGIlTbt
	 NlMdv8iY/ACSLvJ1xOGiSL8MuQ/3AU2QGYo1UqHznmMVcja5OddhRm39xu5XVdKZTotww
	 ND8TvsjRn63cqy5Y3koBE11VxQbZQmcG3YLSeh7b1H714uBrJlu15StpaX1Ono98UH00P
	 nhIbLxO3AN8dL1L0RgeC6XEry66J8sxaO+tECRx3B/h4y4Dkuwx13FdjG+yPFRfwWMJuO
	 vvtdWFCo9nox6pCaF3/zM6gvUlsqY7/Vhzec/PUK99KL2GNEqkCuqMS/7N3cT9qFqqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLRd3oUp;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD19D606B2ED
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD19D606B2ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLRd3oUp
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b094fb376cso167280a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794587233; x=1795192033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nH+4fuf6JFUHnT4EFq7h99rEDt8N7Ykz0lHqkyH7S6o=;
        b=ZLRd3oUpIuGnrFvB1x4yFiEVgk9qDw5/LfvhoJ3PGm1P9Ouo11Rmm9fmcH+9GHtSRS
         611Lyem4MLdavVvPctHeySkJ0AiG0BiABkntSKJP1Q98ooL64h0KvnJVuJABy2NZ5Hj/
         mAUHCdVhTc82gaBIy4aKKnvQ+ergQNABycoTCgMK/LGiFCaOsW3fjwM02edekw22SkU9
         MNY77CFgrkVHXwhnZ56qomkYz1qnlm9MFH49IXlK4QR0K7t5bObUKq7gDAwqafHCCE6Q
         Lz/FkqbaRFKg9tXHmB7rgjmeEi4owFaDpXxf18QUUhAlaEFRwFp0tOoMMjfrJod2y414
         SE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587233; x=1795192033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nH+4fuf6JFUHnT4EFq7h99rEDt8N7Ykz0lHqkyH7S6o=;
        b=RCR8V6yE3cI++dMyQnFlpqnxm7I31Qy04+2WP6YwK4Y5bXN/ydS7LT9s613EBxBldZ
         fn6t82RYCZRym8ubYsOKe9UakA41LX+JiQSsV6orJfmFUYY+hk7aE2xUfV1Yek4AWoHn
         LF12TAzHK6z6/x9JMoLQxhap2/P42cgI/qdHjg40/J1CWnvRW5iTazOqunsqum67ksBe
         DaHWzSLPGwdOYEBlt4XyFMKTSdnLoyQwkPFZ2kr0VlNt7Zt99GFnBknvwxaSToL3Ny6S
         qJleb9jh2tEjQb5Je30qQXUmvSRx9LgPatQqF9wQRdlgEahq9Oj26B9LfGFe1ff/3oUz
         f5TQ==
X-Forwarded-Encrypted: i=1; AL+hErFFcPLh5sebNsV+7nLZpH3Ws0XLnmsK5GPPE3k4zHbpXyBdHMhQFfDB9s7byc/cKJVLEK64WKEY+X93dtI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YlcdEqBR7nkycObWSOO3VAP4URzchK0qC/j4unA4maaq6wcZv
	FZxYd+Iz+QjTT0nXKcAUHf4lqFbZ8ij+pB6pjG/4bmHYqGDRnVP0v4nh
X-Gm-Gg: AYBFou0WOUN83X2rX9RSyIWOfCmac/WM36/cbpxxfP+vvkI1sPD5HSHgNHTR81S5Hw3
	zLHP8fkjyjIZrCru5YrwA7fpjqOqrdDMuW12RrGSNF3ekrjhjQDvPXPAoIJHUW8XAmwxLiTVGfE
	caG0DVQH1VWig5peEwi0nRMOgQdM0K+aSIh3FxexuZsTyrXGs7J+V9s57LzKm6bWYH3auT8h4Ur
	TEzK5PVXNXEBCGfE++ZK8R6jg03ttrLm1brveqTZu1tHzX8KOmgvj3ZY4/Qlezo+9IDN/Re10JS
	pMcS82Gtbv/rplUkB6eEkXFD+FQUsOKQJhoupgiWd0bcRgX4yFPBcrL5GMH+6jkPSi0QYJt76ob
	X1pIkqfaBTzjwsgqYrPX3cBzTKgFUtoI0fcVf94HSU6Yll5np+5+43w3Y4r9VKgKDPZMUsV5Q7K
	0RDA9g1fcT62NHub73/l44boayA/dmP3K13kn7Xq61RMZo56HmzuCHBaEVyal+0mFCG/kYr6kpo
	p05N/aPwb1g3Ajc8pOScZqXW2kd++aL4wY/vKkGxqc7AE02XlqSWafBzj9PWeIVTxuvqHsEvWPK
	s5yAr+3/KnmF4eWLdo3RXFYiqhk47UI6qD4LIJ8V3Ksdv+nEW6hmPyiJXBvUofgXaVeZbdpNz0l
	1C58=
X-Received: by 2002:a17:90b:568f:b0:3ae:629:ca12 with SMTP id 98e67ed59e1d1-3b1b0b506dbmr4305114a91.3.1794587233028;
        Fri, 13 Nov 2026 08:27:13 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1bfb607e7sm712916a91.3.2026.11.13.08.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:27:09 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: Akash Goel <akash.goel@arm.com>,
	Karunika Choo <karunika.choo@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jiwoo Kim <arpe1618@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/panthor: Don't access gpu_contexts of a destroyed heap pool
Date: Sat, 14 Nov 2026 01:26:51 +0900
Message-ID: <20261113162648.110226253-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
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

panthor_heap_grow() and panthor_heap_return_chunk() compute the heap
context offset from pool->gpu_contexts before taking pool->lock.

The tiler OOM work holds references on the group, its VM and the heap
pool when it calls these functions, but nothing stops
panthor_vm_destroy() from destroying the pool in the meantime.
panthor_heap_pool_destroy() frees the gpu_contexts BO under pool->lock
and marks the pool as destroyed by clearing pool->vm, but leaves
pool->gpu_contexts pointing to the freed BO. VM destruction doesn't
wait for the work either: panthor_sched_prepare_for_vm_destruction()
only flushes the scheduler tick work, and only when the VM is active,
and evicting the group doesn't help, as group_unbind_locked() uses
cancel_work(), which doesn't wait for a tiler OOM work that is already
running. Such a work can then read the freed BO.

Take pool->lock before dereferencing pool->gpu_contexts, and return
-EINVAL if the pool has been destroyed, as panthor_heap_create()
already does.

The problem was found through AI-assisted source code review. The fix
is compile-tested only and there is no reproducer, as I don't have
Mali CSF hardware.

Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---

Notes:
    This conflicts trivially with Osama Abdelkader's pending "drm/panthor:
    Fix race when retrieving the new chunk in panthor_heap_grow()", as both
    change the local variables at the top of panthor_heap_grow(). I can
    rebase on top of it if it lands first.
    
    While looking at this, I also noticed that panthor_heap_create() reads
    pool->vm without pool->lock when allocating the initial chunks, in
    panthor_alloc_heap_chunk(), so a concurrent VM destroy can make
    panthor_kernel_bo_create() hit its drm_WARN_ON(!vm). That doesn't touch
    freed memory and is left for a separate patch.

 drivers/gpu/drm/panthor/panthor_heap.c | 44 +++++++++++++++++++-------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 99311abdf1..e55f7e648d 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -90,7 +90,7 @@ struct panthor_heap_pool {
 	/** @vm: VM this pool is bound to. */
 	struct panthor_vm *vm;
 
-	/** @lock: Lock protecting access to @xa. */
+	/** @lock: Lock protecting access to @xa, @vm and @gpu_contexts. */
 	struct rw_semaphore lock;
 
 	/** @xa: Array storing panthor_heap objects. */
@@ -371,16 +371,27 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
 			      u64 heap_gpu_va,
 			      u64 chunk_gpu_va)
 {
-	u64 offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
-	u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
 	struct panthor_heap_chunk *chunk, *tmp, *removed = NULL;
 	struct panthor_heap *heap;
+	u32 heap_id;
+	u64 offset;
 	int ret;
 
-	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
-		return -EINVAL;
-
 	down_read(&pool->lock);
+
+	/* The heap contexts are gone if the pool has been destroyed. */
+	if (!pool->vm) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
+	heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
+	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
 	heap = xa_load(&pool->xa, heap_id);
 	if (!heap) {
 		ret = -EINVAL;
@@ -435,16 +446,27 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 		      u32 pending_frag_count,
 		      u64 *new_chunk_gpu_va)
 {
-	u64 offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
-	u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
 	struct panthor_heap_chunk *chunk;
 	struct panthor_heap *heap;
+	u32 heap_id;
+	u64 offset;
 	int ret;
 
-	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
-		return -EINVAL;
-
 	down_read(&pool->lock);
+
+	/* The heap contexts are gone if the pool has been destroyed. */
+	if (!pool->vm) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
+	heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
+	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
 	heap = xa_load(&pool->xa, heap_id);
 	if (!heap) {
 		ret = -EINVAL;

base-commit: bafda823590ddf7031ecb765d673572fae7ab44a
-- 
2.43.0

