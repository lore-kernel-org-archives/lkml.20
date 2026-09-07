Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C0646A611
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778686; cv=none; b=Ff8zk0q4hRL8UopMirD3QeALU9CM19MUD4zLRoSiF0SXEBqWLuDkkzI4osQpdic9/7JdrhdtRHW4DenC1DFRIegkTb83T66C0mLO9W0WYee7Bn8ewcm2RI2iSDlW3htuByEEVViNPca9WFejNlyZx4abl8MtFQOgZ+izWYG8xE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778686; c=relaxed/simple;
	bh=m2rcYK+BTakjJNcINhugxAWmEoCjJRF8nvtwJOYlq9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byEZlyE6xLqIkrRW+uwZ+UrwLKcVU/9QipsJYU3LR7owsp1+vmIEFA59nDYUn4vkDDJ9mEuRktp+/c+IQP4mMMucRDwytyqnAEJwyqvyJlbFfdNKYHSv/a/64rID6liezLUdI2tGrvPWPRG22qQdW9WCmESZLvv2a7wTXL39C3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d0n5NkQr; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d0n5NkQr"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2707958a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788778684; x=1789383484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaUctYgsKexv76T3vPQS88gPu5aYrdy0F+NCE/op3Bo=;
        b=d0n5NkQrzVm3sMYNTR7mCHlL8EJjO3fG+KXcSeDHIMhXCqnNu6yGARbQrFiDgijlik
         lXbQNIVHsM8jpXQwiA2/a6PDVrknUGVSLUphAtNvWwKJ2ZeZWqCH107w4U859UtY6IxF
         UA6PPq84hzR0a7z/mSKs8WT4PtZpcn8S4wCzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778684; x=1789383484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QaUctYgsKexv76T3vPQS88gPu5aYrdy0F+NCE/op3Bo=;
        b=ikBvaAkWK62FlCPK5unQ98Fhi3G76x38BnvUT6K8wRJNmuWalLi7f2OdPcf7zOIfqb
         aCkdkCCkyexUXrn8gU7aD2VSOZgL70rn93spGOsnlTW5SX68IuacbmnnSMkhFZBNJOJv
         Yu/Z97oSLd5UvStsBgvhMhsVAl7KIX8ti41skdx5mK5HkWduDClcnYtvTyEiLL2CPLsl
         EQGK2lghkvPuVvsbcwc0NDlUDReCWHUP0aYf9rzwgxPxBXjfxKoTyTwL+suw5+efcpim
         s348KT5Jq24nJAs/atwjTGzm3painlBFnBY7Ys1ZMd9BKN6LAPuh4aOgDzNc1QCmihXa
         gQ5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzT5ffS83uPLT2GjdrG+S+TAhwzZHiuf7xY0yoKnNhSCE9pxu+aQ6LsgEHiXwppex0zWdZ4zjSCPnvU/80=@vger.kernel.org
X-Gm-Message-State: AFuF++moszK4fA0s/TGnZtpck+sbcrR1HKxRexbSLRwcsVO1cXL0tcK1
	vy6+sdpRm0DRehZvdX9KPlPaYOYsiAOobCN2v0PHJoXBJZFSP82cGRj1VKxBUoWf5Q==
X-Gm-Gg: AYBFou0Xv8ndjFEQk0VpahNSwyWdBdGObWv90ligHuBdKUJEqcaH30CpLLDHBgf0qZs
	lMSvK5jQ/FU89CxOlPZBfMFjOfGV6IVA9kn+hWQcbt/exoLyTHVi2NUMiJIYRBNK/87eOCC/bAz
	MYWfM4WbbgNxWkBsdPdqj+YaDUGqWSGrJzx3P8Vw+Ubyl7KT6cQCfBPOIRqUCRsefJ9Uhk2CADl
	ewFl6XWaB830MP7V3Nn14dnHWaj95lehLPrSj9BtQcmbnXn7Nv46UnkRvGu/jHRpWZanytbFDim
	L3qrmII8addQ8jxJO0eHD6XXhD1sElr0c1JM4yYhiODEWVaN8f0qydEB6pUfPBDaYW926nXYUPP
	m8BgR7kgcOoRVZ5HE/OjdlBnmOLi1iCgKPXzqcp+lzJmDBBvNYUSUudxf3yPAvC231rCqdGzlfm
	Psrntb/mXtHZ0FT+ntM3Upn4u0OfdOD8zZ86yjVz6X9Ad9SqkjR2Ard6gA17bXI+W3Uu29rJOca
	4fpG+k9A2f5llbJNtYBKqMtjn/JNmVPzgvphdMhSnqCpsosuPWc
X-Received: by 2002:a17:90b:2884:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39b262ab44emr32170153a91.20.1788778684370;
        Mon, 07 Sep 2026 03:58:04 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:7fc7:d8d5:4877:bc3f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b51eb40e6sm10343714a91.16.2026.09.07.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:58:03 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 1/2] zram: convert to SG-list zsmalloc object read API
Date: Mon,  7 Sep 2026 19:57:28 +0900
Message-ID: <20260907105739.1793316-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260907105739.1793316-1-senozhatsky@chromium.org>
References: <20260907105739.1793316-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zram remains the last user of old zsmalloc object read
API, that performed linearisation on the zsmalloc side.
There is a new SG-list API, that has a bunch of benefits.
Switch zram to SG-list zsmalloc object read API.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c    | 23 ++++++++++++--
 drivers/block/zram/zcomp.h    |  4 ++-
 drivers/block/zram/zram_drv.c | 56 ++++++++++++++++++++---------------
 3 files changed, 55 insertions(+), 28 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index 974c4691887e..028e2f0f587e 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -7,6 +7,8 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/cpuhotplug.h>
+#include <linux/highmem.h>
+#include <linux/scatterlist.h>
 #include <linux/vmalloc.h>
 #include <linux/sysfs.h>
 
@@ -158,17 +160,32 @@ int zcomp_compress(struct zcomp *comp, struct zcomp_strm *zstrm,
 }
 
 int zcomp_decompress(struct zcomp *comp, struct zcomp_strm *zstrm,
-		     const void *src, unsigned int src_len, void *dst)
+		     struct scatterlist *sg, unsigned int src_len, void *dst)
 {
 	struct zcomp_req req = {
-		.src = src,
 		.dst = dst,
 		.src_len = src_len,
 		.dst_len = PAGE_SIZE,
 	};
+	void *src = NULL;
+	int ret;
 
 	might_sleep();
-	return comp->ops->decompress(comp->params, &zstrm->ctx, &req);
+
+	if (sg_is_last(sg)) {
+		/* the object is contained within one page, read it in-place */
+		src = kmap_local_page(sg_page(sg));
+		req.src = src + sg->offset;
+	} else {
+		/* the object spans two pages, linearize it into local copy */
+		sg_copy_to_buffer(sg, 2, zstrm->local_copy, src_len);
+		req.src = zstrm->local_copy;
+	}
+
+	ret = comp->ops->decompress(comp->params, &zstrm->ctx, &req);
+	if (src)
+		kunmap_local(src);
+	return ret;
 }
 
 int zcomp_cpu_up_prepare(unsigned int cpu, struct hlist_node *node)
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index 81a0f3f6ff48..f38fd31f9e4e 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -5,6 +5,8 @@
 
 #include <linux/mutex.h>
 
+struct scatterlist;
+
 #define ZCOMP_PARAM_NOT_SET	INT_MIN
 
 struct deflate_params {
@@ -91,6 +93,6 @@ void zcomp_stream_put(struct zcomp_strm *zstrm);
 int zcomp_compress(struct zcomp *comp, struct zcomp_strm *zstrm,
 		   const void *src, unsigned int *dst_len);
 int zcomp_decompress(struct zcomp *comp, struct zcomp_strm *zstrm,
-		     const void *src, unsigned int src_len, void *dst);
+		     struct scatterlist *sg, unsigned int src_len, void *dst);
 
 #endif /* _ZCOMP_H_ */
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index a9b3bb1d3bef..5431b16f2f45 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -32,6 +32,7 @@
 #include <linux/debugfs.h>
 #include <linux/cpuhotplug.h>
 #include <linux/part_stat.h>
+#include <linux/scatterlist.h>
 #include <linux/kernel_read_file.h>
 #include <linux/rcupdate.h>
 
@@ -1342,9 +1343,9 @@ static int decompress_bdev_page(struct zram *zram, struct page *page,
 				unsigned long index)
 {
 	struct zcomp_strm *zstrm;
+	struct scatterlist sg[1];
 	unsigned int size;
 	int ret, prio;
-	void *src;
 
 	slot_lock(zram, index);
 	/* Since slot was unlocked we need to make sure it's still ZRAM_WB */
@@ -1363,13 +1364,18 @@ static int decompress_bdev_page(struct zram *zram, struct page *page,
 	size = get_slot_size(zram, index);
 	prio = get_slot_comp_priority(zram, index);
 
+	sg_init_table(sg, 1);
+	sg_set_page(sg, page, size, 0);
+
 	zstrm = zcomp_stream_get(zram->comps[prio]);
-	src = kmap_local_page(page);
-	ret = zcomp_decompress(zram->comps[prio], zstrm, src, size,
+	ret = zcomp_decompress(zram->comps[prio], zstrm, sg, size,
 			       zstrm->local_copy);
-	if (!ret)
-		copy_page(src, zstrm->local_copy);
-	kunmap_local(src);
+	if (!ret) {
+		void *dst = kmap_local_page(page);
+
+		copy_page(dst, zstrm->local_copy);
+		kunmap_local(dst);
+	}
 	zcomp_stream_put(zstrm);
 	slot_unlock(zram, index);
 
@@ -2086,15 +2092,19 @@ static int read_same_filled_page(struct zram *zram, struct page *page,
 static int read_incompressible_page(struct zram *zram, struct page *page,
 				    unsigned long index)
 {
+	struct scatterlist sg[2];
 	unsigned long handle;
 	void *src, *dst;
 
 	handle = get_slot_handle(zram, index);
-	src = zs_obj_read_begin(zram->mem_pool, handle, PAGE_SIZE, NULL);
+	zs_obj_read_sg_begin(zram->mem_pool, handle, sg, PAGE_SIZE);
+	/* an incompressible object never spans two pages */
+	src = kmap_local_page(sg_page(sg));
 	dst = kmap_local_page(page);
 	copy_page(dst, src);
 	kunmap_local(dst);
-	zs_obj_read_end(zram->mem_pool, handle, PAGE_SIZE, src);
+	kunmap_local(src);
+	zs_obj_read_sg_end(zram->mem_pool, handle);
 
 	return 0;
 }
@@ -2103,9 +2113,10 @@ static int read_compressed_page(struct zram *zram, struct page *page,
 				unsigned long index)
 {
 	struct zcomp_strm *zstrm;
+	struct scatterlist sg[2];
 	unsigned long handle;
 	unsigned int size;
-	void *src, *dst;
+	void *dst;
 	int ret, prio;
 
 	handle = get_slot_handle(zram, index);
@@ -2113,12 +2124,11 @@ static int read_compressed_page(struct zram *zram, struct page *page,
 	prio = get_slot_comp_priority(zram, index);
 
 	zstrm = zcomp_stream_get(zram->comps[prio]);
-	src = zs_obj_read_begin(zram->mem_pool, handle, size,
-				zstrm->local_copy);
+	zs_obj_read_sg_begin(zram->mem_pool, handle, sg, size);
 	dst = kmap_local_page(page);
-	ret = zcomp_decompress(zram->comps[prio], zstrm, src, size, dst);
+	ret = zcomp_decompress(zram->comps[prio], zstrm, sg, size, dst);
 	kunmap_local(dst);
-	zs_obj_read_end(zram->mem_pool, handle, size, src);
+	zs_obj_read_sg_end(zram->mem_pool, handle);
 	zcomp_stream_put(zstrm);
 
 	return ret;
@@ -2128,25 +2138,23 @@ static int read_compressed_page(struct zram *zram, struct page *page,
 static int read_from_zspool_raw(struct zram *zram, struct page *page,
 				unsigned long index)
 {
-	struct zcomp_strm *zstrm;
+	struct scatterlist sg[2];
 	unsigned long handle;
 	unsigned int size;
-	void *src;
+	void *dst;
 
 	handle = get_slot_handle(zram, index);
 	size = get_slot_size(zram, index);
 
 	/*
-	 * We need to get stream just for ->local_copy buffer, in
-	 * case if object spans two physical pages. No decompression
-	 * takes place here, as we read raw compressed data.
+	 * No decompression takes place here, we copy out raw compressed
+	 * data directly into the destination page.
 	 */
-	zstrm = zcomp_stream_get(zram->comps[ZRAM_PRIMARY_COMP]);
-	src = zs_obj_read_begin(zram->mem_pool, handle, size,
-				zstrm->local_copy);
-	memcpy_to_page(page, 0, src, size);
-	zs_obj_read_end(zram->mem_pool, handle, size, src);
-	zcomp_stream_put(zstrm);
+	zs_obj_read_sg_begin(zram->mem_pool, handle, sg, size);
+	dst = kmap_local_page(page);
+	sg_copy_to_buffer(sg, sg_nents(sg), dst, size);
+	kunmap_local(dst);
+	zs_obj_read_sg_end(zram->mem_pool, handle);
 
 	memzero_page(page, size, PAGE_SIZE - size);
 
-- 
2.55.0.979.g7e5102b832-goog

