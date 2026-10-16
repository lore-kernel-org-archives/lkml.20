Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BE13B95F0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125909; cv=none; b=AGnJRT+dxLtDEV6/asxOmI9O8yE6AkxQ4RdExtAn3xGE7jhUuofZh4xRr8iOigJjwwJg9NwGDMOkSbRxan/YOawvfOQmSLYobA9rdc1GlHzZhW/okMaGnJ7dXr3X17wnFXZuOfbqws/UwtAE+WQcTPCVErDsJ+VbV2zlkCAIeRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125909; c=relaxed/simple;
	bh=KTJLB1gNMlWPnZfArYCxvaD8EyGYvzyRPXF3u3IU63k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kq8TnK3wnS5oEgr3JFeB3M1hbz5flh1ADzfzFyI2Y9XDYsVY5kKfot45J1vKsDXHcj3yZMO5YAXMEueRYArNwBszuBUtLcWKMxn6bWEauqS+5KoXqFH+w9UWA3LJfuDEVT+bYEjYLeNs6PxCYGh8VUv2Sf57z3crIH+WmFAYFtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DBW7+0tG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DBW7+0tG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e6038cebefso45417585ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792125904; x=1792730704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjViqRwAMEG7zJkwnYC4UEqQagXFhLBQpmZRnR3MJEU=;
        b=DBW7+0tGC099vcsw8tvtwqCJ2kuRZ3P8pCuXIEaYNuhhz+lane1hH6kgyF04vx8wwi
         JqDDg1uKrBOasprUOQXgu0C+7NChLYxxA1b9n08VaiB7wEMkwnWxQo4wbkwnetm5ICZF
         Toexpmc3zOL67tDiOpQLJ35Vn5a43dNMqlLiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792125904; x=1792730704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjViqRwAMEG7zJkwnYC4UEqQagXFhLBQpmZRnR3MJEU=;
        b=iEycQr0+cgPspcGHbLvAT5C1rTOOkdqaRfx+mrtz9WwYtI5NkC/Oo11SYyw37Mm/zF
         xv6fAxAsb7HAoWi6JSk6j7pOdRrdJ5euKvhQYaekTFEcprv362DK+2LY/5NZPg3+LWUv
         fFAKAN4tqdb5GyWt8uQ17gfbC0XIn8Zm/+b7QsqGhsViODTTZQsrYFu1I56s9YcOWr8S
         Yd7Dx+NeW2gAZ5zxPS3zQQqV5uHj4rh9KhK/skCY8KtPyNUwKYmcIVW0O/DshIw0sSNl
         vJY4mcQRxGm8qF/vrjwStKJADOsdq1FaqxCYkTRcyU4ywqnLRIIgvpehIi45NBuokgqJ
         EBFA==
X-Forwarded-Encrypted: i=1; AKwUvBxGkcWPw7CQHbJW/Rl5+oEQXfw7Tt5/leNzhM944xZV9zQgWqYRZ94f/1omw5/A7hEOX1DOWkTSPXF6JC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGzFWI5kbnlJLlo88HM5/ohgNJQHxrpd3YGOUdLv+WHnvOzxdH
	Cw9KsHktF8gaf0hEEnlIphRgEmuIXXMvRK5UlJs7HaXuLdMDnJt53PbgMxyxf6HJqg==
X-Gm-Gg: AYBFou2RuQJYaOODDRhp3S9Z10641AzmNSGJbGPbp4m028u/4wUrpV4s89eDeHqFo48
	N4W47FOYL1p8ypgKy1cy1t7Ac6TCY8i3uJtl9O77ZepadQzL6bxcEYTKnwLAne84Nlug1FQjRN8
	h3z/NhhzazV+AGTp8+NfoS1fS5Du3NpttxPWZ2AVGm4T3OCNytdxRoUfhnLdUDbCBxo9iNCkYey
	jL3nuzmFzYtQ2hCIL2Lglkrr35q9HKgGJfOW5Qj4lJAKFlyGWAYOv/MCFIe3yLvhT1dz1ATSnpB
	CmDfICJoNd3b0OaINA6TG0eU8wfDC2V+Tgsh5xW6Lpz9f0VVvNOFE3Vf0SbVTCMnmH64P2rxcJd
	4sPR8QTPf+J7NggzDl26ZQ6XP1DuIJSPO/PIZLA8aKc9qjJjoiSYD79i2ZR/8MuGGFJwrEacKIp
	BHEkarEmCLUB+NPPyZxTqH8CvDYuSArqs3JOMOgjdcriLAsb9nBvR0kENqsBLXIVUNYuHAGBWL9
	2pusty38n9PYPbf/DPU0LCATASOwpeyiK3VlNIkOTOPTQ6uSPd9fgExV+Eh1se1sytm2MaMzzrW
	pUDkAruNToH5QBhhBTM6o/qRa0dPVzTWn2EDWljSjIgb
X-Received: by 2002:a17:903:230c:b0:2df:4876:50d9 with SMTP id d9443c01a7336-2e8429a58b9mr205540725ad.18.1792125904178;
        Thu, 15 Oct 2026 21:45:04 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:a579:8b87:8304:7ac2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8b1b5esm4137235ad.67.2026.10.15.21.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:45:03 -0700 (PDT)
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
Subject: [PATCH v4 10/12] zram: introduce shared decompression streams
Date: Fri, 16 Oct 2026 13:44:15 +0900
Message-ID: <20261016044429.1304561-11-senozhatsky@chromium.org>
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

Currently, per-CPU decompression streams use a mutex, so there is
a chance for Reader vs Reader priority inversion - a low priority
Reader can get preempted by a higher priority Reader, which simply
will get blocked on the stream mutex.

Switch zcomp_dstrm to permit parallel usage.  However, things are not
completely straightforward.  Many backends have stateless decompression
and don't modify decompression context, so those can be used
concurrently.  But then there are backends that do modify decompression
context.  We also can have compressed object span across physical pages,
which zcomp linearises using stream's ->local_copy buffer before
decompression.  That buffer, clearly, cannot be used concurrently.

Give zcomp_dstrm two locks:
- ->lock (rw_semaphore) pins the stream against CPU hotplug teardown.
  Every decompression request takes it in read mode, and only
  zcomp_cpu_dead() takes it in write mode.
- ->excl_lock (mutex) serializes access to mutable stream state
  (->local_copy and ->ctx).

When the backend has no per-stream decompression context (stateless)
and zsmalloc object fits in a single page (zcomp_shared_decomp()),
the request touches neither ->local_copy nor ->ctx, so it only takes
->lock in read mode (ZCOMP_DSTRM_SHARED).  Otherwise, when ->local_copy
is needed or the backend has a decompression context (zstd, deflate),
additionally take ->excl_lock (ZCOMP_DSTRM_EXCLUSIVE) so exclusive
requests serialize only against each other without blocking shared
readers.

A quick synthetic fio test for Reader vs Reader inversion on 24 CPUs
(preempt=full, lz4, 48 low priority (nice 19) readers, 24 normal
priority (nice 0) CPU hogs and 24 high priority (nice -19) readers):

  Metric           Base               Patched
  ----------------------------------------------------------
  Read IOPS        857k               1,382k        (+61.3%)
  Read clat avg    14.40 us           4.07 us       (-3.5x)
  Read clat stdev  3,270.31 us        671.46 us     (-4.9x)
  Read clat p99.99 1,500 us           24.64 us      (-60.9x)
  Read clat max    2,430,200 us       1,022,758 us  (-2.4x)

Suggested-by: Brian Geffon <bgeffon@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c    | 56 ++++++++++++++++++++++++++++-------
 drivers/block/zram/zcomp.h    | 21 +++++++++++--
 drivers/block/zram/zram_drv.c | 12 +++++---
 3 files changed, 71 insertions(+), 18 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index 1c9f6d5c8cd1..da122bf4dd15 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -165,7 +165,7 @@ struct zcomp_cstrm *zcomp_cstrm_get(struct zcomp *comp)
 		 * so then unlock and re-try on the current CPU.
 		 */
 		mutex_lock(&zstrm->lock);
-		if (likely(zstrm->buffer))
+		if (zstrm->buffer)
 			return zstrm;
 		mutex_unlock(&zstrm->lock);
 	}
@@ -176,21 +176,49 @@ void zcomp_cstrm_put(struct zcomp_cstrm *zstrm)
 	mutex_unlock(&zstrm->lock);
 }
 
-struct zcomp_dstrm *zcomp_dstrm_get(struct zcomp *comp)
+bool zcomp_shared_decomp(struct zcomp *comp, struct scatterlist *sg)
+{
+	/*
+	 * Shared decompression is only safe when the backend has no
+	 * mutable per-stream decompression context and the object is
+	 * contained within a single page (no ->local_copy bounce needed).
+	 */
+	return !comp->ops->create_dctx && sg_is_last(sg);
+}
+
+struct zcomp_dstrm *zcomp_dstrm_get(struct zcomp *comp,
+				    enum zcomp_dstrm_mode mode)
 {
 	for (;;) {
 		struct zcomp_dstrm *zstrm = raw_cpu_ptr(comp->dstream);
 
-		mutex_lock(&zstrm->lock);
-		if (likely(zstrm->local_copy))
-			return zstrm;
-		mutex_unlock(&zstrm->lock);
+		/*
+		 * Pin the stream.  The write side of ->lock is only taken
+		 * by zcomp_cpu_dead(), so this never contends with other
+		 * decompression requests, regardless of their mode.
+		 */
+		down_read(&zstrm->lock);
+		if (!zstrm->local_copy) {
+			/* The stream has been destroyed, re-try */
+			up_read(&zstrm->lock);
+			continue;
+		}
+
+		/*
+		 * Exclusive requests additionally own ->local_copy and
+		 * ->ctx and hence can only wait for each other.
+		 */
+		if (mode == ZCOMP_DSTRM_EXCLUSIVE)
+			mutex_lock(&zstrm->excl_lock);
+		return zstrm;
 	}
 }
 
-void zcomp_dstrm_put(struct zcomp_dstrm *zstrm)
+void zcomp_dstrm_put(struct zcomp_dstrm *zstrm, enum zcomp_dstrm_mode mode)
 {
-	mutex_unlock(&zstrm->lock);
+	if (mode == ZCOMP_DSTRM_EXCLUSIVE)
+		mutex_unlock(&zstrm->excl_lock);
+	up_read(&zstrm->lock);
 }
 
 int zcomp_compress(struct zcomp *comp, struct zcomp_cstrm *zstrm,
@@ -223,6 +251,9 @@ int zcomp_decompress(struct zcomp *comp, struct zcomp_dstrm *zstrm,
 	int ret;
 
 	might_sleep();
+	lockdep_assert_held(&zstrm->lock);
+	if (!zcomp_shared_decomp(comp, sg))
+		lockdep_assert_held(&zstrm->excl_lock);
 
 	if (sg_is_last(sg)) {
 		/* the object is contained within one page, read it in-place */
@@ -277,9 +308,9 @@ int zcomp_cpu_dead(unsigned int cpu, struct hlist_node *node)
 	mutex_unlock(&cstrm->lock);
 
 	dstrm = per_cpu_ptr(comp->dstream, cpu);
-	mutex_lock(&dstrm->lock);
+	down_write(&dstrm->lock);
 	zcomp_dstrm_free(comp, dstrm);
-	mutex_unlock(&dstrm->lock);
+	up_write(&dstrm->lock);
 
 	return 0;
 }
@@ -306,8 +337,11 @@ static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
 	}
 
 	for_each_possible_cpu(cpu) {
+		struct zcomp_dstrm *zstrm = per_cpu_ptr(comp->dstream, cpu);
+
 		mutex_init(&per_cpu_ptr(comp->cstream, cpu)->lock);
-		mutex_init(&per_cpu_ptr(comp->dstream, cpu)->lock);
+		init_rwsem(&zstrm->lock);
+		mutex_init(&zstrm->excl_lock);
 	}
 
 	ret = cpuhp_state_add_instance(CPUHP_ZCOMP_PREPARE, &comp->node);
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index 22be50dc51ba..bf41b27958c4 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -4,11 +4,17 @@
 #define _ZCOMP_H_
 
 #include <linux/mutex.h>
+#include <linux/rwsem.h>
 
 struct scatterlist;
 
 #define ZCOMP_PARAM_NOT_SET	INT_MIN
 
+enum zcomp_dstrm_mode {
+	ZCOMP_DSTRM_SHARED,
+	ZCOMP_DSTRM_EXCLUSIVE,
+};
+
 struct deflate_params {
 	s32 winbits;
 };
@@ -47,7 +53,14 @@ struct zcomp_cstrm {
 };
 
 struct zcomp_dstrm {
-	struct mutex lock;
+	/*
+	 * Pins the stream: held in read mode by every user, regardless
+	 * of the decompression mode, and in write mode only by
+	 * zcomp_cpu_dead().
+	 */
+	struct rw_semaphore lock;
+	/* Serializes users of the mutable stream state: ->local_copy, ->ctx */
+	struct mutex excl_lock;
 	/* local copy of handle memory */
 	void *local_copy;
 	struct zcomp_ctx ctx;
@@ -99,8 +112,10 @@ void zcomp_destroy(struct zcomp *comp);
 struct zcomp_cstrm *zcomp_cstrm_get(struct zcomp *comp);
 void zcomp_cstrm_put(struct zcomp_cstrm *zstrm);
 
-struct zcomp_dstrm *zcomp_dstrm_get(struct zcomp *comp);
-void zcomp_dstrm_put(struct zcomp_dstrm *zstrm);
+bool zcomp_shared_decomp(struct zcomp *comp, struct scatterlist *sg);
+struct zcomp_dstrm *zcomp_dstrm_get(struct zcomp *comp,
+				    enum zcomp_dstrm_mode mode);
+void zcomp_dstrm_put(struct zcomp_dstrm *zstrm, enum zcomp_dstrm_mode mode);
 
 int zcomp_compress(struct zcomp *comp, struct zcomp_cstrm *zstrm,
 		   const void *src, unsigned int *dst_len);
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index def5266679b0..a34859ff0461 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1373,7 +1373,7 @@ static int decompress_bdev_page(struct zram *zram, struct page *page,
 	sg_init_table(sg, 1);
 	sg_set_page(sg, page, size, 0);
 
-	zstrm = zcomp_dstrm_get(zram->comps[prio]);
+	zstrm = zcomp_dstrm_get(zram->comps[prio], ZCOMP_DSTRM_EXCLUSIVE);
 	ret = zcomp_decompress(zram->comps[prio], zstrm, sg, size,
 			       zstrm->local_copy);
 	if (!ret) {
@@ -1382,7 +1382,7 @@ static int decompress_bdev_page(struct zram *zram, struct page *page,
 		copy_page(dst, zstrm->local_copy);
 		kunmap_local(dst);
 	}
-	zcomp_dstrm_put(zstrm);
+	zcomp_dstrm_put(zstrm, ZCOMP_DSTRM_EXCLUSIVE);
 	slot_unlock(zram, index);
 
 	return ret;
@@ -2115,6 +2115,7 @@ static int read_incompressible_page(struct zram *zram, struct page *page,
 static int read_compressed_page(struct zram *zram, struct page *page,
 				unsigned long index)
 {
+	enum zcomp_dstrm_mode mode = ZCOMP_DSTRM_EXCLUSIVE;
 	struct zcomp_dstrm *zstrm;
 	struct scatterlist sg[2];
 	unsigned long handle;
@@ -2126,13 +2127,16 @@ static int read_compressed_page(struct zram *zram, struct page *page,
 	size = get_slot_size(zram, index);
 	prio = get_slot_comp_priority(zram, index);
 
-	zstrm = zcomp_dstrm_get(zram->comps[prio]);
 	zs_obj_read_sg_begin(zram->mem_pool, handle, sg, size);
+	if (zcomp_shared_decomp(zram->comps[prio], sg))
+		mode = ZCOMP_DSTRM_SHARED;
+
+	zstrm = zcomp_dstrm_get(zram->comps[prio], mode);
 	dst = kmap_local_page(page);
 	ret = zcomp_decompress(zram->comps[prio], zstrm, sg, size, dst);
 	kunmap_local(dst);
+	zcomp_dstrm_put(zstrm, mode);
 	zs_obj_read_sg_end(zram->mem_pool, handle);
-	zcomp_dstrm_put(zstrm);
 
 	return ret;
 }
-- 
2.56.0.176.g3575e65682-goog

