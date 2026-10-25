Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894756;
	b=4BoYTU/5KNnjlvRB1PqbG327z2h2NnR4p1y78GEz1KIIflsd5NG/ynLRWfbT+ExxU9By
	 R7bOdUB5stb+XzzSkhN/vPHsz7zUI7y9LlZMbbw32a0wcLbW9PJgqzH133HyyuasI3OET
	 U7oDDaP0K2qCCgZPKIUcMwmI4sKhwp6GQx2rCcZUw4eTYIBPeicjK2EqCKLXMf2PI5QEu
	 ufKOFpR/Nmr5SYlM7r9XSR0kjAKOVUioihcazPR01eNDc7JWSRZwD6DBoiKYRw6yvEKL5
	 4WCZ8jvQdPZJ8DEtIIXZMK9WqKQJ92guC3Pv87fkQ7ZBibekhM+0Lbxv35VWQWuVXow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YDh1xSMVK7zZ4d6sP80ijQWBEa0qBw5fh14J44qEXMo=;
	b=FSeVYKhMLo4G0PSU+U1lXeOlHFHZp/51OjvHPYcNb7jTECelFBcNM3+eppKZkS78myCM
	 FjHBH6LrJS6ZCQPaRrPCLc+q0SBgkeozqkGroj5t2iuBe+f3JQattIMbvUMuJPrJUqZAq
	 lFnU/AAnFMNqSbZYcgctQu8tvYzbhaRnAHD8xgi0mWuHDslGfBJeBt9HJcNVTk6NKE8J6
	 HrNq+I3mToHQQM2S06a8nfrTXBaVb0D3O/C1nyKeaAoRjafSvfBTd4L7dEeIiY8Kae9zb
	 38keg+I+GNrHuoQwgMwbnW0/YvmTyJ2pp2dWYjL4/9xrZ4g6Zub3+/l0csJcvdaGBFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Il/sNB/d";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1828060A2614
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1828060A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Il/sNB/d
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-16079d54c17so1054435c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894755; x=1793499555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDh1xSMVK7zZ4d6sP80ijQWBEa0qBw5fh14J44qEXMo=;
        b=Il/sNB/dUCkGU//Evc1Tu/Phd3gskD4MFJz46HT8PLVLG74PVE5SEksOzICGeU0as0
         POO7ilM7WSK/Dq6hzpxhAYrJECeJuXrff7D0q2snOhhx4tDaTYDN+K4+JykCu1df3wUe
         HqsO7T2iaZ3c1iuMMRAHUvaVz8RtGBG/0GOJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894755; x=1793499555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDh1xSMVK7zZ4d6sP80ijQWBEa0qBw5fh14J44qEXMo=;
        b=BThvWVdhpIIMua3PG5ccIH04w9Mn5AZSEF5I09B8stcr3PwhWgxilK4s1jKQFQ/LsZ
         MLPDAnortkhz7GysCWRhdtmeBMSefsQj2gWQ9RV0DX2NNc1DAkUxj8R9yn+javsV5i2x
         OYDzwQ1tR7sxcx830gVyfDqibTCUHkkvIpuoxS/gLX+VtkVz7XFY9jQyzz0Cs9Oh/laS
         9xGEWz7yGmRmUyd/BKfpXf4WziFdLiwNesKVr13/JwLtPMOT4anJAGv910t+V5sdyAGd
         KnmoKOeeBmznXdF8JZcfRFIxNJw98Dzk5nAnu4eAYzzIE6JEh2jaxVLRZfPlvqtfJUro
         nvFA==
X-Forwarded-Encrypted: i=1; AKwUvBwtviv/4ih97yIz5hfVVrliF1OYr+dYwphmxxBbgS6Wm9ii1JuU1SDN/8Pq2tpr1Ij4xMUQSN8UhCTQtcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN6BAtIK4Y3OgIKHpMR0jTf3XLdzPR9Jk4xHnEovNa2ovVqwgP
	jPXuJbXK3H0pquJSYdeAiJ7GMrnOSOEJ6NpDeAmkgdJw0nKLGko8uzwE7TPmR10eGw==
X-Gm-Gg: AYBFou3Tz6kUg8fgvrLd7g8nB+h0i+yZOldSO4WJ3buMslXmOfT6qMxgFbcDY+6LTtC
	45Fefw+wh5ClOfrgA0tzdt4NMJQ0VJKurkzQtvKEPZhs3RgYhiPkqhDWsR7UIxsWnVkX1ezd9Cn
	HUyNIn4ORb82yJVJedFPrQXfD4Yj4TbvG/SUCUefBx6xeDSVfeZbMNuHAeU5MDEC2c+ub0S3T8h
	9MlGMeUoZRw7CooqWQHVvtCoP0sWHWvHJVI0sHdXJqWXsfsdJxeSQRh9Hyc0GitQU16ywDc2F6a
	e8opgS/Y6LB1QNhE+pGzXrHnJRFP48hW8eWXE3/aa0K7C0NKa3Exh178unGESGUDq0ZXvokhjhW
	R0FqvwBuFOLR25edRTbHgukYwVp9YQkce3sluqB6n581ggT4uh9tPjiTKphLfDuusMArw+L+9pS
	bYkJV6tifPjRGhk3yrI5hu6hoNXt4WNmn/omHo9rbWEztunKEsZ9GrJelVNbLFd3uXuqmq8Y4YZ
	4I/syVB7u3ipqyFHWnOLQRy1Yt8SQYjLrhinvq/nxw7HfhN+YAHwcx0DUgZKcwrTxnT7rVhB5mi
	BkpfUG6DmShYHpF+7a+bareOLZ9/Awjz6b3DiFuTBB25
X-Received: by 2002:a05:701b:271b:b0:186:4a57:94e5 with SMTP id a92af1059eb24-199377d902amr4696620c88.34.1792894755143;
        Sat, 24 Oct 2026 19:19:15 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:19:14 -0700 (PDT)
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
Subject: [PATCH v7 13/15] zram: allocate bounce buffer for spanning objects
Date: Sun, 25 Oct 2026 11:18:29 +0900
Message-ID: <20261025021839.1542805-14-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261025021839.1542805-1-senozhatsky@chromium.org>
References: <20261025021839.1542805-1-senozhatsky@chromium.org>
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
and 24 high priority readers), average of 3 runs.  Base is the
previous patch (shared streams without bounce buffer):

  Metric           Base               Patched
  ----------------------------------------------------------
  Read IOPS        1,452k             1,466k        (+1.0%)
  Read clat avg    3.46 us            3.30 us       (-4.9%)
  Read clat stdev  165 us             15.69 us      (-10.5x)
  Read clat max    306,679 us         7,060 us      (-43.4x)

An alternative approach is to vm_map_ram() scattered objects
(two pages), which fixes the tail latency in the same way,
but deferred TLB flushes add more cost, so it was rejected.

[1] https://lore.kernel.org/linux-kernel/20261014153603.1365617-1-zhangbo56@xiaomi.com
[2] https://lore.kernel.org/linux-kernel/20261016134847.1620103-1-zhangbo0325@gmail.com

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
index 768c9a6d81e5..8c0fe34b7a28 100644
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
2.56.0.257.gf7497c7d27-goog

