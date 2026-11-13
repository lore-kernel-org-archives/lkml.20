Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589948;
	b=MLOzSCbxsaDVp3bsV5hFiIzPooyEVhtD8d+Wl7v7Zef0Zdit7tOjSM8rCO914pItQGqB
	 ZS2BZd1sg/mFque6nOs+Ws5+gkxFyLu0D4Dls35rjUJjq/k8F8reqvMZS8OJvPJ1yzsGX
	 CYd++rSpmjQydaGQXO2DN5kdmhN6v25UvbKJe1Bet6CUMI5tktwDSEXBmKmiTyGHs8vPy
	 Y9MOm2Xo5A4hzZRrmiFphxkKJ5qmuW3jh6M7tU1PC9y1GAvX5mZJey4kEFLQiuauWCybF
	 9hqAO/lbeepxci9U5iS//u/+47LYibSPxxnMI9uzGrM3CVttr2twHIfpPZ5MfHyPFeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xv91mbpY6CHl9oZ10SuH7nK8AHihJpvpXeevDfWrpHA=;
	b=Nx/1B/9WWai/v6tP+OKdAFLnpQDZ8dCRkLeZp+zr8fFHJT0WDb1ChXtW9tjYmGfRKKz7
	 P2OOmmVgqIZ2o1DDNsRubasikuUpR+pPiBv4Af56kOBYyEksZRX8PPMmZMzJHNzvg7tsm
	 xGQlaiSfARl6wIreir5PLU38laf9/YYKMxzSuYnl4AoKpWKzxGSnlGWC2RdnN8jb2h7PF
	 pd6CvyvU1vOJxDrbUv0VD+mPfUQui956grqPguyKmYlQJHu7RWDSUjfj1JcjqvrZW1Zfk
	 MROrOdqpS5WZgh+sWr4IOkZtDi9Bq9+sTAXQJ5RrDazpZmvR4g4rNBBRZrT+3ItX9lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dk1vCWfG;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0592606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0592606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dk1vCWfG
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36ecc11bd26so160684eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794589947; x=1795194747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xv91mbpY6CHl9oZ10SuH7nK8AHihJpvpXeevDfWrpHA=;
        b=Dk1vCWfGcdr5xZdt9dq2I9ypVf/Dr1nhuoKzF69Fy3aGZpE7zPiJYOeUBh4Omt7n6B
         aha6kKwmE7MYPtoRs9WpJ0jd7pv8BR/34CxoeYQgC3Z8qubWhIeYmeHQfXC040+WhEcE
         w4hu2GvDTiFZRumOJPSaERTQdIppzXJ0ePkV617MhpUtwVEg970NAV/BOk747yVlDtp1
         S4G7kJwVnnYp/6OqqzmYFaFW314xB7DGfBmd31sphRPXFTKJqRYn95xEqQZ8jvr1Lq3D
         9mRp+dNr1qR5gqjAKzng6ikGgxkxoxeY6PkimoEiYnpNJ754F5ZjsVwFj9jEufHxaVUE
         RLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589947; x=1795194747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xv91mbpY6CHl9oZ10SuH7nK8AHihJpvpXeevDfWrpHA=;
        b=jhs7FIeOzqdfPLIL94HVc/yIHX+UqV6PWdlHw1V75TpYOLeNowlX4eZXXhYN7u3UaY
         YJPrzeU5oA7Qp8NPzMjWLCpHmXE74Q89RKazuOgg3mad8Q9fdFjRE5ZHivuD+cMmUmsk
         7kGaG0gl1ig/yVAK7QvlkvJgabs6Hq6OlolEmGlPZeuyo9xmEehzv8PZVTvnu4Gzhqmp
         nUgnZtJSEaeT3dIxz8kXdFFFbH612Iux32CqYFs9sAVSIlacGOLp9uAvtqaanuBQalHT
         fq1ZnH5pMPK/yFHXWqMwTSz75aPihpPFfBLZL98DjzzCOrO0moxfHfJKIRIonU5OSC+V
         zA/g==
X-Forwarded-Encrypted: i=1; AL+hErHzV5x7vtihwKGfGlR4JGOUDzEducTfCMt8uhb6rFkJQO7dlgQJiM7chCKTaU7rcoTN0NV1MCFVi5/e/mM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cctMVlFwRWNJQ+UOfATETXOFNY8/8RwI5YHZetbjYSGAhyw4d
	p/VYzL/myMyOXipq0db0z77v41XSQ1UiQm4Dvm9pKntgUx2sDPU6p2D0
X-Gm-Gg: AYBFou39Mclyp18wEzHXg57fO8IoPJdEaYnge6WhId45hqslZdm9adlOVWMSJlrf0nB
	omY7fBfAeF/x9NG6z/PsVdoVF5mVgvT+iT87riUz/dl/6WgEgM8Ae+5miEZTPCq9Gwcv39qR9QC
	GXO26dTaBAdilpI1Y7NdAedk8bbOyUrK7YhtPeDzBIsGEb4Y4bOHqn+7+8gEYaVJ0Ze86CcxF+Z
	SM0GAZXL01WgbdVF5uSJeBXmzlByGfObqb0rk+8rh9iTpoEuUdVghEo5c18+TsAsIbtC/akgkXg
	VPHKyxNP0pJUhrs+87BT8D1/OFYywY8eMFYnqG9Fpj3+gSqe/7+O8BHHm6gAl0AIkCidPYMhyEQ
	2AX+MG+kEAhHrcEr+otGxke2fd/WrxSMXGtrJRfG6g0iTBFaSM4vph8ElugN4pPijtyD120yUqx
	8wo0II0rzLCy6C0XtVN0nRkC4kHpXvQu+KdOxd8oLJT/uIJPSFEPIztRdQSLsKT7NYn5l8aaJte
	pw+KnRL27NdQ3DPCnLnDUGk4J9xm/ASHOG2Vs4csYdCh1rTCYygkADt35//OtqVVLNVUQHeSD6p
	ZTn7R55jgqzIGOQQIzSF8kyT9/9XzA3TauSzxhCB92IXgSDnN6wH4DTlGGlizCc1SJwy9ZujkWx
	Q6t0=
X-Received: by 2002:a05:7022:7f04:b0:1a1:9106:cfff with SMTP id a92af1059eb24-1b503097baamr4481535c88.2.1794589946743;
        Fri, 13 Nov 2026 09:12:26 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm5975999c88.10.2026.11.13.09.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:12:26 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Akash Goel <akash.goel@arm.com>,
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
Subject: [PATCH] drm/panthor: Fix unlocked pool->vm access in panthor_heap_create()
Date: Sat, 14 Nov 2026 02:12:14 +0900
Message-ID: <20261113171211.836427578-1-arpe1618@gmail.com>
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

panthor_heap_create() takes a reference on pool->vm under pool->lock,
because the pool can be destroyed concurrently, and the initial heap
chunks used to be allocated in that VM. Since commit c63c3bfdde26
("drm/panthor: Avoid sleep locking in the internal BO size path"),
panthor_alloc_heap_chunk() takes the pool instead and reads pool->vm
itself. panthor_heap_grow() calls it with pool->lock held, but
panthor_heap_create() does not, so pool->vm is read without the lock
for every initial chunk.

If TILER_HEAP_CREATE races with VM_DESTROY on the same VM,
panthor_vm_destroy() calls panthor_heap_pool_destroy(), which sets
pool->vm to NULL, and panthor_kernel_bo_create() can then be called
with a NULL VM, which hits its drm_WARN_ON(!vm) and fails with
-EINVAL.

Pass the VM to panthor_alloc_heap_chunk() and
panthor_alloc_heap_chunks() again: panthor_heap_create() passes the VM
it holds a reference on, and panthor_heap_grow() passes pool->vm, which
it reads under pool->lock. In the race above, the initial chunks are
then created in the destroyed but still referenced VM, and
panthor_heap_create() frees them and fails with -EINVAL when it finds
the pool destroyed under pool->lock, as it did before that commit.

The problem was found through AI-assisted source code review. The fix
is compile-tested only and there is no reproducer, as I don't have
Mali CSF hardware.

Fixes: c63c3bfdde26 ("drm/panthor: Avoid sleep locking in the internal BO size path")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---

Notes:
    This is the follow-up mentioned in "[PATCH] drm/panthor: Don't access
    gpu_contexts of a destroyed heap pool":
    https://lore.kernel.org/all/20261113162648.110226253-1-arpe1618@gmail.com/
    The two patches are independent and apply in either order.
    
    It conflicts with Osama Abdelkader's pending "drm/panthor: Fix race
    when retrieving the new chunk in panthor_heap_grow()", which also
    changes the panthor_alloc_heap_chunk() arguments. I can rebase on top
    of it if it lands first.

 drivers/gpu/drm/panthor/panthor_heap.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 99311abdf1..46f53699a2 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -137,7 +137,12 @@ static void panthor_free_heap_chunk(struct panthor_heap_pool *pool,
 	kfree(chunk);
 }
 
+/*
+ * @vm must be pool->vm read under pool->lock, or a reference taken from it
+ * under that lock: panthor_heap_pool_destroy() clears pool->vm.
+ */
 static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
+				    struct panthor_vm *vm,
 				    struct panthor_heap *heap,
 				    bool initial_chunk)
 {
@@ -149,7 +154,7 @@ static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
 	if (!chunk)
 		return -ENOMEM;
 
-	chunk->bo = panthor_kernel_bo_create(pool->ptdev, pool->vm, heap->chunk_size,
+	chunk->bo = panthor_kernel_bo_create(pool->ptdev, vm, heap->chunk_size,
 					     DRM_PANTHOR_BO_NO_MMAP,
 					     DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
 					     PANTHOR_VM_KERNEL_AUTO_VA,
@@ -209,6 +214,7 @@ static void panthor_free_heap_chunks(struct panthor_heap_pool *pool,
 }
 
 static int panthor_alloc_heap_chunks(struct panthor_heap_pool *pool,
+				     struct panthor_vm *vm,
 				     struct panthor_heap *heap,
 				     u32 chunk_count)
 {
@@ -216,7 +222,7 @@ static int panthor_alloc_heap_chunks(struct panthor_heap_pool *pool,
 	u32 i;
 
 	for (i = 0; i < chunk_count; i++) {
-		ret = panthor_alloc_heap_chunk(pool, heap, true);
+		ret = panthor_alloc_heap_chunk(pool, vm, heap, true);
 		if (ret)
 			return ret;
 	}
@@ -315,7 +321,7 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
 	heap->max_chunks = max_chunks;
 	heap->target_in_flight = target_in_flight;
 
-	ret = panthor_alloc_heap_chunks(pool, heap, initial_chunk_count);
+	ret = panthor_alloc_heap_chunks(pool, vm, heap, initial_chunk_count);
 	if (ret)
 		goto err_free_heap;
 
@@ -473,7 +479,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 	 * further jobs in this queue fail immediately instead of having to
 	 * wait for the job timeout.
 	 */
-	ret = panthor_alloc_heap_chunk(pool, heap, false);
+	ret = panthor_alloc_heap_chunk(pool, pool->vm, heap, false);
 	if (ret)
 		goto out_unlock;
 

base-commit: bafda823590ddf7031ecb765d673572fae7ab44a
-- 
2.43.0

