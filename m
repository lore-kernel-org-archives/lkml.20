Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511018;
	b=cfZ+ucs2pKBHm8FpxdQmiXfMcMHBNf86qPxw8uqSw1TzrgoWvbirpE97CVpFYOVqi9Cl
	 Ma4Bg+pWx0ddl0dCabTeq9Sw1DlEVf1X08p5OHu187EZctFPJVMPXTufOUalu+X/GI3NI
	 8ikg6s8swpHFGlOKuDfWn4izhIobIOGkdBB5OqQTnFE2o6s5n7Cuv+soUawkAjbKz7/XD
	 Hvh9bDO1v8qtV2LCjTVi8oHh+08l/YEMg5eUJIakwFywg7OTrx1qIzF458ywVxdmGBPE/
	 5cVyvF2fukLQgEz4GENmDIc/JJz+eP4qkgd6uEA9Dmr4r1IMuMOSwCZWrHwG0cGmqRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QifT63FLPlBaRBfMwdlPD9GRxtpIvQpF5WAaBnQtQ4E=;
	b=ax9C6EsSL4xY9W9MaJ51+FOyjn2cW4cJxNLRMYmCxW1RUcxzlfcgyxG7qhMdglJ8NkDn
	 b4rJkfWljoXDZL2DGvwPzlVVHNIrX24luObJ1CxqOZfwi53Tm279iPZugpp3mToEqVdDg
	 zydllwwNXExvxDqn0UbHrn38IctNKAmz7278SUy3r7JDRnNsoys2g3A3TshufyXAywIWp
	 DGssyWRMo0gxOhHLZJak5yYEIVO2Ovi1q96XfuNwRZDyOb5MiHFRQiAcZnGlO6tX06AS3
	 6d9big1kBBm4FfEWc+4mMDxIEPTioDIRUD7py/3CaGr2vyplR+3hEKPkNNYqBl6bvfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6izSXpD;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E67606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E67606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6izSXpD
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so1772885e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511016; x=1795115816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QifT63FLPlBaRBfMwdlPD9GRxtpIvQpF5WAaBnQtQ4E=;
        b=f6izSXpDRyh3kiKQZeMzK0o3Gql7daLptZvL/v5DX5yMW0HUOn3k09Fr2S0QkhZDey
         ObUBUELIZrpKUdd00lcmjH0dhhaDuuMwRFGrApC3lrNdVH6fvCzX79qBjj2lCEVUuuos
         H6G8Odw82ODNw3z/D135vixZtxZhXj2CV8mwGdUiyJVOY7cwzwEUBpS/JK4kKR7Hr0Mp
         aiZTjianHYond80JJtPSorJ5c3ySawtyljcRNKCbuvu6gZ1uwf3TxEy8eO71UYMde/ri
         K/iY6ZN61U5MhkMOURtAEffpXKpAiU0ZoJf1qyz63hbs2QX/XWnLg93Ek6xGa7xw3XGh
         h/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511016; x=1795115816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QifT63FLPlBaRBfMwdlPD9GRxtpIvQpF5WAaBnQtQ4E=;
        b=eeC5bni8rm2WOGWFL8W0M5MwVO85dmPgtISNCNUrjJR/AFDbSeLdLlo3/QkytIYdy6
         djP5+A9XUCmWhYvxG3YIByoAAcJe7znM+DL6DC1B7FDYIxumM+9diEvcjCT4bpFdEsts
         HeM3TUIN+YTY11hV/rZ5VDKO55LCji+QQts45s9fTp0i4ETHknqt8SJ5N0fm+JComoMf
         QjpuRL005bBQq7NrNLkUJ/YBHGON72hlJrxFwuUfgL/0cqV8b8B24OQp0I/++8Cywr6G
         bFPDgnhuUQjCb6AlZhVmRFUHg9GzrU/YI9jAkiDavkNWWOEaydLVfVywYayb/Y1kkMP8
         v8dw==
X-Forwarded-Encrypted: i=1; AL+hErE7Ia+DQlpalMxK4SsKXn237CO1oyh2I9EAjmWvuGf1suCqdUzTDqxc/gBN0uPr/sDiZm3quL0YAI8PcDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z90KoG32e78ufNcV9PEScL/B8t4mVYRTfcY6UskrWp8r8UKMau3
	H/qWr3vgrXrLFM2V7/cr7t+l67qAv5/jDye8keKe8gsfXtGQgR13oy+g
X-Gm-Gg: AYBFou1va2ErAuPuNO6i48n9q8UOPelx7C2Vt4GnigOBDC7h2IR78ilJLATNHy6Pff0
	bkO5e7t88uXor+zRcbk4k0VFsH/qZfY78aq+B0Gf+1aa6DTbFPDdUGrkpPUHsXxoXMMrusfDCj6
	qpSDmmzZRoetvjjcvY1nw3T0DXBrGJ5x7hdn+JquBOuprJG1AkqRPjPEai98lelR9gtfbw4TrCZ
	8PzysRGBolNdkacFuY2CDXweiPVxNAuSwswMbLNFwPyDU9LFVmuvgwEMNKMFtfvHgJHKPsdsWxD
	qefWwQjMXrdCkJGgWNuc3IxnDxHxNQPQ7ylgBXmpn0kBVnyI1kUUFT4rzlbg7owVYYrxn5W6rO9
	RGPZj5ZlfHEt8xwc7wEzH6Onwge+zCEQfU8aaeuw/FC7aY9AGygqU6MmFHtiC4ITMl1OCxQKtUc
	8pQOw7zVJ+OnawUmffMNWpM22m9SQa5qh8XpiMKM9zoCo+HsiV9oE+4ly7MN+zUwdOaoOZVdIUa
	yHsZkC1WUxwIqEQGyC+yA/zDeDxJUF+9/dfglvxc9x27LRUSV9Y1zMsthb4Kfj25WTnCTSueYk2
	zXwALW3TMxVgLl/83jKE1vhddzP9YDFUGoZ3+/OssZmonRmStpsGd77trHNrcdI=
X-Received: by 2002:a05:600c:1d03:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb55a58e1amr4456295e9.20.1794511016325;
        Thu, 12 Nov 2026 11:16:56 -0800 (PST)
Received: from osama ([2a02:908:186:df80:da60:20d5:2c9a:fdcd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55afb6absm2821045e9.15.2026.11.12.11.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:16:55 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Akash Goel <akash.goel@arm.com>,
	Karunika Choo <karunika.choo@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/panthor: Fix race when retrieving the new chunk in panthor_heap_grow()
Date: Thu, 12 Nov 2026 20:16:50 +0100
Message-ID: <20261112191650.735850-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.53.0
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

panthor_heap_grow() allocates a new chunk with panthor_alloc_heap_chunk(),
which adds the chunk at the head of heap->chunks under heap->lock, and
then drops the lock. panthor_heap_grow() then assumes the head of the
list is the chunk it just added, and reads its GPU VA through
list_first_entry() without holding heap->lock.

panthor_heap_grow() and panthor_heap_return_chunk() only take pool->lock
in read mode, and tiler OOM events of different groups are processed in
parallel on the unbound heap_alloc_wq. If two groups use the same heap
context, they can modify the chunk list concurrently:

  group A OOM work                     group B OOM work
  alloc C_A, list_add()
                                       alloc C_B, list_add()
  list_first_entry() -> C_B
                                       group scheduled out:
                                       panthor_heap_return_chunk(C_B)
                                         list_del(), destroy BO, kfree()
  C_B->bo                              <- use-after-free

Even without the free, both groups end up being handed the same chunk,
and the chunk allocated by group A is never linked to the heap context.

Fix this by having panthor_alloc_heap_chunk() return the GPU VA of the
chunk it allocated, retrieved before the chunk is published in the list,
instead of looking it up afterwards.

Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_heap.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 99311abdf1e9..d80f514366fd 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -139,7 +139,8 @@ static void panthor_free_heap_chunk(struct panthor_heap_pool *pool,
 
 static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
 				    struct panthor_heap *heap,
-				    bool initial_chunk)
+				    bool initial_chunk,
+				    u64 *chunk_gpu_va)
 {
 	struct panthor_heap_chunk *chunk;
 	struct panthor_heap_chunk_header *hdr;
@@ -181,6 +182,15 @@ static int panthor_alloc_heap_chunk(struct panthor_heap_pool *pool,
 
 	panthor_kernel_bo_vunmap(chunk->bo);
 
+	/*
+	 * Retrieve the GPU VA before the chunk becomes visible in the heap
+	 * chunk list: once heap->lock is released, a concurrent grow or
+	 * return_chunk on the same heap can modify the list, and the chunk
+	 * can be freed.
+	 */
+	if (chunk_gpu_va)
+		*chunk_gpu_va = panthor_kernel_bo_gpuva(chunk->bo);
+
 	mutex_lock(&heap->lock);
 	list_add(&chunk->node, &heap->chunks);
 	heap->chunk_count++;
@@ -216,7 +226,7 @@ static int panthor_alloc_heap_chunks(struct panthor_heap_pool *pool,
 	u32 i;
 
 	for (i = 0; i < chunk_count; i++) {
-		ret = panthor_alloc_heap_chunk(pool, heap, true);
+		ret = panthor_alloc_heap_chunk(pool, heap, true, NULL);
 		if (ret)
 			return ret;
 	}
@@ -437,8 +447,8 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 {
 	u64 offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
 	u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
-	struct panthor_heap_chunk *chunk;
 	struct panthor_heap *heap;
+	u64 chunk_gpu_va;
 	int ret;
 
 	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
@@ -473,14 +483,11 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
 	 * further jobs in this queue fail immediately instead of having to
 	 * wait for the job timeout.
 	 */
-	ret = panthor_alloc_heap_chunk(pool, heap, false);
+	ret = panthor_alloc_heap_chunk(pool, heap, false, &chunk_gpu_va);
 	if (ret)
 		goto out_unlock;
 
-	chunk = list_first_entry(&heap->chunks,
-				 struct panthor_heap_chunk,
-				 node);
-	*new_chunk_gpu_va = (panthor_kernel_bo_gpuva(chunk->bo) & GENMASK_ULL(63, 12)) |
+	*new_chunk_gpu_va = (chunk_gpu_va & GENMASK_ULL(63, 12)) |
 			    (heap->chunk_size >> 12);
 	ret = 0;
 
-- 
2.53.0

