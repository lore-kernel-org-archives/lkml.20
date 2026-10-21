Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550596;
	b=ZISsr9XtmaVsMhZsro9sGqpYFyDOuzhgwZAsaXfCC19VnMBrX2EGapfuG+g4C174JTA6
	 6hxrqAmuChbegw4//eAmZJAEMuEluBdhUOdB7CYfTwBjGOYh37vhcFFvaegPk0ixYHHCo
	 4BC+BKoY2cEbO0afDlbKZpadNI8sC9qjSjP08jt9l9TGYQRS6GYYMWB+7b/2dATAt3WZe
	 Y4UUBMwHvBZY3CMKOuDoGHjr1kGnzydz1Z753BYp26U45avcCQ7raysBMalnX57H6Pb1F
	 gWqxhG8tpDwTMybUcmBxkdUDJbYHt1NkVy+sh+EpFsm8I7zfSurPtXcXKmUFncZopSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N8IV0Vqz5Q6I5nTn4QvolcrjBnOVRJOSSIVFXSYU6fk=;
	b=XvTi2gLbdQ3z0uIJtTRjY4IA97m21M/xAVgNAEUF6ofC+mt/9A/iJESHK9N3f66adRlA
	 KuiolJb8AJ9MiHzkqgirXv/zdo8Emb8qcrOktFLrm8KOnktO6IyyOWfaTwGbzvOWdkXeb
	 9H9lRGsJnKsa4HEP7U2+Nlm1Fa+HnY0SEMxqdfrUlKoFWY+blVx4rLntNxG/4RYZSYCt5
	 bOZy2vT6cicJsMCyqY4ue7WgyzQKrZE+HGzShfDUtbNxtfOM3T2k2CP3XXqE3V+J1Jf4l
	 SQeszi5TEZCoTNOkFQrKhgUA3rP9Es7BwomS4vJeynyntNQHXZToi0gG+hCjqrHu/bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GBSL3GmL;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA6160A2622
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA6160A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GBSL3GmL
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-156cbe59524so72448c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792550595; x=1793155395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8IV0Vqz5Q6I5nTn4QvolcrjBnOVRJOSSIVFXSYU6fk=;
        b=GBSL3GmL9jUNdU1EMw79025n1wXW1Ha7pbhDzaRCaxDdXzlx59rNTsrriIV+exVatk
         AVF4Zb2+WKcDudj7lnLiv7NZJtzjmKLjstGUQKBZJXtBtF1cqNuJi2glaHhNalGRkBuV
         pXpyWap+5g8n0OEhXISAj3UkFOwERpMRMRRTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550595; x=1793155395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8IV0Vqz5Q6I5nTn4QvolcrjBnOVRJOSSIVFXSYU6fk=;
        b=jBRt/pCcUaSoLbDY91gzBSICyniU187ybOm5TyeK+kIbggCFkbW/U659+HgHJf3D0P
         diFoYinNmv7IekzbFQQEijG4GdgwYOyK13z0MpYeUW4sUO98U/yjquADZ6WWmhZvitT7
         7oXeVsKU7FrlDuuN5U4+qN/vrYx0V3cWh0qhD5GvYlltomlHClz6rktbwoTMvI2RXxfp
         f5k/3HO0IUAbwdIS2zVTPQPMHbU48mHgM2DPQWYgQL9dcBiDtjWwcM4pOLRYWayf/Ywv
         D6Rp5nQ7rkd+NrcS6obZjRGxTuJBynYKDLc2YZGC5m19D/11fISdpxiRUVOU98w1Cx+2
         AhQA==
X-Forwarded-Encrypted: i=1; AKwUvBwF1LLIjc/271A79cN635M72rUfB6iDxWzEGqY9m7qeKqjAv0S00mEh9VpMFIJ6eRHWyuQsp/3UuIqxqLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc8Y0BO0EuWxU1Ng6EG5ahxY7EJQewIyCsJWZFT/EXiZDvticl
	piQrsrJK8J+kpglrZA+s29Bun4pLLgclASD8mXThC6NVkKLT9AhNPfc0RRWjClpsvw==
X-Gm-Gg: AYBFou07dAuoFzdauW5VZff4Om+ue6576Rm4M/vT8OlG5OhiUH7o06ecWBNOkXCpWnq
	ws6Kel9gM4RuRxTHVkfQlha4h7FKUogMHg1tnx/kzKhimsZpUTUuo3uQ9lWxxscVDW2ohRrgYFO
	BVrye7f+jb9+oVQHfeXRLWRejICPtkhXNj1sduyVVMxX3eG9hOnkoxmoO34McgWplI2LbNkULwt
	Kgv3Y3dZD4lM70TbzDvX5x2OL9wo9EIpdQSm2+ayEditkG3ZzXKdKP/yLZvpjrmGalgK9w0aHn2
	bJFHguDOljpGicFN7zvMsog5+w9TKFzgussAe7UQ5fq8eXmVC7a+NC5AYsjJ70XCOgN3x+EJk4S
	Xlw+VnJ+u1HWphYskj6BnuN3AKknZGDvwEFv671Q8WD/fTlkv4DXuvAhggu0yjKjEXZ3RISoSwA
	eQXYlcvNSoLgZt6oLo1J9psEExT7CqYtAss0DFqCq651TCHPdfDASJArzqPLDvMQ3J9DdjhqgMC
	j4BJG6Mx+zvgvjwEhqy16AkqPfdHUu3prBMjg6KgeH3P+UqP6qc0wj3wzYu2+KkApxJbX5e9yJt
	QuemdQdkyAGr8DfzORd+9JGitR8gEOYGDivUJauhGRc7
X-Received: by 2002:a05:701b:4584:b0:163:c5eb:d42f with SMTP id a92af1059eb24-190a0428eedmr769830c88.5.1792550595143;
        Tue, 20 Oct 2026 19:43:15 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm2392047c88.3.2026.10.20.19.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:43:14 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 11/13] zram: allocate bounce buffer for spanning objects
Date: Wed, 21 Oct 2026 11:42:21 +0900
Message-ID: <20261021024236.1787884-12-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021024236.1787884-1-senozhatsky@chromium.org>
References: <20261021024236.1787884-1-senozhatsky@chromium.org>
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

zsmalloc objects that span two physical pages need to be linearized
before decompression, which zcomp does using stream's ->local_copy
buffer.  That buffer cannot be used concurrently, so such reads take
the stream in exclusive mode, even when the backend has stateless
decompression.  And spanning objects are not rare: Bo Zhang measured
23.3% of reads on lzo-rle going through the exclusive path, causing
contention on ->excl_lock of up to 72-96 ms [1].

Allocate a temporary bounce buffer for spanning objects instead, so
that backends with stateless decompression can always use shared mode.
If the allocation fails we fall back to ->local_copy under ->excl_lock.

Per-request bounce buffer fixes the remaining tail latency, as was
measured by Bo Zhang [2]:

  Metric          Base      kmalloc bounce
  ----------------------------------------
  read contended  ~1,959    0
  shared          76.7%     100%

A quick synthetic fio test for Reader vs Reader inversion on 24 CPUs
(lz4, 48 low priority (nice 19) readers, 24 normal priority CPU hogs
 and 24 high priority readers), average of 3 runs:

  Metric           Base               Patched
  ----------------------------------------------------------
  Read IOPS        1,452k             1,466k        (+1.0%)
  Read clat avg    3.46 us            3.30 us       (-4.9%)
  Read clat stdev  165.37 us          15.69 us      (-10.5x)
  Read clat max    306,679 us         7,060 us      (-43.4x)

An alternative approach is to vm_map_ram() scattered objects
(two pages), which fixes the tail latency in the same way,
but deferred TLB flushes add more cost, so it was rejected.

[1] https://lore.kernel.org/linux-kernel/20261014153603.1365617-1-zhangbo56@xiaomi.com
[2] https://lore.kernel.org/linux-kernel/20261015112440.1491168-1-zhangbo56@xiaomi.com
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c    | 47 +++++++++++++++++++++++++----------
 drivers/block/zram/zcomp.h    |  2 +-
 drivers/block/zram/zram_drv.c |  2 +-
 3 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index da122bf4dd15..4fda13aac896 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -176,14 +176,13 @@ void zcomp_cstrm_put(struct zcomp_cstrm *zstrm)
 	mutex_unlock(&zstrm->lock);
 }
 
-bool zcomp_shared_decomp(struct zcomp *comp, struct scatterlist *sg)
+bool zcomp_shared_decomp(struct zcomp *comp)
 {
 	/*
 	 * Shared decompression is only safe when the backend has no
-	 * mutable per-stream decompression context and the object is
-	 * contained within a single page (no ->local_copy bounce needed).
+	 * mutable per-stream decompression context.
 	 */
-	return !comp->ops->create_dctx && sg_is_last(sg);
+	return !comp->ops->create_dctx;
 }
 
 struct zcomp_dstrm *zcomp_dstrm_get(struct zcomp *comp,
@@ -239,6 +238,15 @@ int zcomp_compress(struct zcomp *comp, struct zcomp_cstrm *zstrm,
 	return ret;
 }
 
+static int zcomp_decompress_buf(struct zcomp *comp, struct zcomp_dstrm *zstrm,
+				struct scatterlist *sg, void *buf,
+				struct zcomp_req *req)
+{
+	sg_copy_to_buffer(sg, 2, buf, req->src_len);
+	req->src = buf;
+	return comp->ops->decompress(comp->params, &zstrm->ctx, req);
+}
+
 int zcomp_decompress(struct zcomp *comp, struct zcomp_dstrm *zstrm,
 		     struct scatterlist *sg, unsigned int src_len, void *dst)
 {
@@ -247,27 +255,40 @@ int zcomp_decompress(struct zcomp *comp, struct zcomp_dstrm *zstrm,
 		.src_len = src_len,
 		.dst_len = PAGE_SIZE,
 	};
-	void *src = NULL;
+	void *src;
 	int ret;
 
 	might_sleep();
 	lockdep_assert_held(&zstrm->lock);
-	if (!zcomp_shared_decomp(comp, sg))
+	if (!zcomp_shared_decomp(comp))
 		lockdep_assert_held(&zstrm->excl_lock);
 
 	if (sg_is_last(sg)) {
 		/* the object is contained within one page, read it in-place */
 		src = kmap_local_page(sg_page(sg));
 		req.src = src + sg->offset;
-	} else {
-		/* the object spans two pages, linearize it into local copy */
-		sg_copy_to_buffer(sg, 2, zstrm->local_copy, src_len);
-		req.src = zstrm->local_copy;
+		ret = comp->ops->decompress(comp->params, &zstrm->ctx, &req);
+		kunmap_local(src);
+		return ret;
 	}
 
-	ret = comp->ops->decompress(comp->params, &zstrm->ctx, &req);
-	if (src)
-		kunmap_local(src);
+	/* exclusive mode already holds ->excl_lock */
+	if (!zcomp_shared_decomp(comp))
+		return zcomp_decompress_buf(comp, zstrm, sg, zstrm->local_copy,
+					    &req);
+
+	/* shared mode: try a per-request bounce buffer first */
+	src = kmalloc(src_len, GFP_NOWAIT | __GFP_NOWARN);
+	if (src) {
+		ret = zcomp_decompress_buf(comp, zstrm, sg, src, &req);
+		kfree(src);
+		return ret;
+	}
+
+	/* fall back to ->local_copy serialized by ->excl_lock */
+	mutex_lock(&zstrm->excl_lock);
+	ret = zcomp_decompress_buf(comp, zstrm, sg, zstrm->local_copy, &req);
+	mutex_unlock(&zstrm->excl_lock);
 	return ret;
 }
 
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index bf41b27958c4..362a6da014aa 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -112,7 +112,7 @@ void zcomp_destroy(struct zcomp *comp);
 struct zcomp_cstrm *zcomp_cstrm_get(struct zcomp *comp);
 void zcomp_cstrm_put(struct zcomp_cstrm *zstrm);
 
-bool zcomp_shared_decomp(struct zcomp *comp, struct scatterlist *sg);
+bool zcomp_shared_decomp(struct zcomp *comp);
 struct zcomp_dstrm *zcomp_dstrm_get(struct zcomp *comp,
 				    enum zcomp_dstrm_mode mode);
 void zcomp_dstrm_put(struct zcomp_dstrm *zstrm, enum zcomp_dstrm_mode mode);
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index a34859ff0461..b429c52cb37d 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2128,7 +2128,7 @@ static int read_compressed_page(struct zram *zram, struct page *page,
 	prio = get_slot_comp_priority(zram, index);
 
 	zs_obj_read_sg_begin(zram->mem_pool, handle, sg, size);
-	if (zcomp_shared_decomp(zram->comps[prio], sg))
+	if (zcomp_shared_decomp(zram->comps[prio]))
 		mode = ZCOMP_DSTRM_SHARED;
 
 	zstrm = zcomp_dstrm_get(zram->comps[prio], mode);
-- 
2.56.0.212.g129ede20d9-goog

