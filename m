Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482FC39A06A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125908; cv=none; b=MazKs1ctn+16MtLPpyNA5pXxbxOkk4CJJk8C5pWxLJ/KWCJs308wsCdZdD5vtAs//JVsT4NYOCHe8drjvugmIpj5fk/6mIz1haAfnGAspKXnPd5sPuxdr+Ap0O/LHc4P7D+pm1DWnQkaX0KVO46ZCmVVOyNi51KvZpk25g0XZA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125908; c=relaxed/simple;
	bh=hG/79XL2NC5bednR016FXnLEa+4PbsgFbKY27XArRFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRwIq/RTk2h3UWxmM9JMkw6F8fpv0af0/gbhR9XBVqTGya+zd/cJaKVR95momBcxCQGfb10DNoKGnf37RDN41RL+m8moPwdH9U2f1dqQrZ8GD+ktHgm45Movo/rNGXudE81oPvAC83TIOMYedmsPXXz4e5YINKDbssr/Iz/OTAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j97Jz6oC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j97Jz6oC"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so36091735ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792125907; x=1792730707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0i3/GM+C7HIQ+51vxL/QdBH6G/WwpNAIZ4e9TPzcXVA=;
        b=j97Jz6oCINAd0g/BXjPOhjtuZi/6qoBdnNNMh+48VPqzYoXwzt4MbBq05OYGD0QbFv
         ccMnh1Ubli6wTGA0R/xZBeU5dg6t6A6E/Tb+f12f0S3qTQjoFKGIZQ/OIBDEjJWFKWxT
         +uABnC3kU/+sRDjq0/xILIlou6NAoKqBaGHs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125907; x=1792730707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0i3/GM+C7HIQ+51vxL/QdBH6G/WwpNAIZ4e9TPzcXVA=;
        b=q9FO2iSiTRHPgziga0IxW+cootDpyJ9akVUdtvI68jWQhDNI5z4qBZ0G/v68jw+kKW
         DtjtpE7lPHp29CkOS7p9HqL7zkU6JMCcxFYkQVdmWYzW6L8TeT+Ul5BPKNv3sz/lIz5N
         BhGNSk8NseEhkavE7vGoUeSxEOA1W7KKa0UuerjqFzT8zOn9dyMz6P+DP+wXsZL/ObXj
         +vYrobX1I/WGGRCA+9hlKwyhDoWCGrE4GFN6I7KdKX67ew+ezV9cR0Hxsk0EXTD6Kh4Y
         Q4/HA46qPmgBzzlLKrNmFR/Fv5WWw9r0L6M5lorlMzAWuf6925C5p3DEgKHTPuB7gfH7
         eJLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWZbDxOie29RL0Lk5GZbnWgNQzeLk8ADTbEXbW0BzTEi1CaSAvlMXX3ibvdz2ydp15V8HZnRlYvYGAX4E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcYW9NEalwtjhIZSQgkyVBkwGbvEs49tvu2p9rImKIrtgJolNj
	Or1GWoIqolKz4Yy6MzWQ6hKBhjr7PBOzLSItWF4sDrI0hpM71FDUBqgVLQ5bSHlSxQ==
X-Gm-Gg: AYBFou2ctWmaRcv2BLqhTHIT8iOD3cqC5NQ7ecl7SRfL682+3CAs0r0tbFYsTT/Du/T
	V7wUBI1ZF99gd3WgTGXcDRU4u2BqlSpWb27q5k0vLHzmiGYu2TQ/dqcRcgQ5+aQ7vlJGZ9OKmYx
	M8bxK/RQXo6bH/DiKE8Cu3iyeej9uwrJY18Cz79GAzUqjDNciOC+O8gk+2EzKxJRpmZXwYaww+e
	NuHvNdxOBm+Nz45PqZ/z3TGW22uOOI2CdnYysaw6XHr4pPD7wlfKx+E7W8oRKtCNepFL4j7DzeQ
	md3SsSdA8Wi0PCRsNtUm4pNjMJcDJ0z/GuUx/eUm8jvFLUFWgpY5CGlqvRp7UhM9MycVOiaulva
	Fpg1ylJe5J5+4KNAjeZIXbUMRq+R0wWdgLvaU7rw69bw33H2OmfKunc/kLCbAHwPC5txZ1VWDhD
	BZsGso7WSV0WpbRhmlUe7yvrHBVxD/iRO0veL+jk2hO10CzkT4qrvkJaybvyKCTuda24cgLMgpH
	iiLFhUrBNs8h+n3bsJ3DTxp+1s3Kl7bjnSamaaE9AGIKN3819S7rMMqVDFuXtq/3ZM1S/eePRFG
	wDWssWitZlrjUoNUL5AWC7qxrF3IBgTDO7ipsIiixTrz
X-Received: by 2002:a17:902:dac1:b0:2e5:f62e:2eaa with SMTP id d9443c01a7336-2e842cd5165mr192173705ad.43.1792125906642;
        Thu, 15 Oct 2026 21:45:06 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:a579:8b87:8304:7ac2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b1b5esm4137235ad.67.2026.10.15.21.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:45:06 -0700 (PDT)
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
Subject: [PATCH v4 11/12] zram: allocate bounce buffer for spanning objects
Date: Fri, 16 Oct 2026 13:44:16 +0900
Message-ID: <20261016044429.1304561-12-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261016044429.1304561-1-senozhatsky@chromium.org>
References: <20261016044429.1304561-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zsmalloc objects that span two physical pages need to be linearized
before decompression, which zcomp does using stream's ->local_copy
buffer.  That buffer cannot be used concurrently, so such reads take
the stream in exclusive mode, even when the backend has stateless
decompression.  And spanning objects are not rare: Bo Zhang [1]
measured 23.3% of reads on lzo-rle going through the exclusive path,
causing contention on ->excl_lock of up to 72-96 ms:

                      baseline   patched w/o kmalloc bounce
  read contended      24,749     1,959
  read wait_ns total  239.8 s    ~12 s
  read wait_ns max    757 ms     72-96 ms
  read acquire        3,948,150  3,510,610

Allocate a temporary bounce buffer for spanning objects instead, so
that backends with stateless decompression can always use shared mode.
If the allocation fails we fall back to ->local_copy under ->excl_lock.

Per-request bounce buffer fixes the remaining tail latency, as was
measured by Bo Zhang [2]:

                 baseline   patched   patched w/ kmalloc bounce
  read contended 24,749     ~1,959    0
  shared         0%         76.7%     100%

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
2.56.0.176.g3575e65682-goog

