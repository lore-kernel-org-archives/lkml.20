Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894754;
	b=UWUFF3LYYb54J8INm9x1cmGQpw7yrzlpWYqRcSIhnOJZOdE+CIMEXaNmAQ/EZHS3GBzn
	 9RrRrkGetHPh5TNCfhSNOtrh9eW5obTIJiIrAyz+1Tx+nLR62BMPXzXI8jhR4AKcn6vyX
	 dQFnByYhdO7hh+BOACBphZkdmKVd5bcKhJUsqN7OeBxX5vX/Y/sDhshAAi0QGUwnvNMTX
	 pskijJKsl3KdXCPYJB/ReYPFBn3jNa8g+Ob8W14ox0RNh7g5CSem8L2wrk01dcevlyUee
	 yeMsqF8VxMq+oScVsj3kwZQR6F6fNF48dVI8zI5ziPjtwtrpUqJnyetNk2NWhTWFlRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eh0HnUlw9pDgMjno+anNWxERFVowk6iHp/gOhy/GxfU=;
	b=h9cCIhIopCyxCmjJyFztIOa6jVcIve7eZ80loYwCu8g7/TfZ21i67sMqnTPy1rgx0OJr
	 8J3Ou6P6WLyDvNgMkP3Q3dTpRKjiqwYc8zhcTJF0d3c6JJ2B/toeE6Ya7BnGc3qKZJUnh
	 dIUNCgHtZsAfbEika8ByWqdhmRHC8MO5+E8QTpuJinxdaS+umUMoVMwpohq2M0JlMZ/lT
	 SOclKBJl/WIFDGMNkIHRN/v3/wInXAAxBa00ss1E4odIvCHZsupJZHB/IvveS1GCHU5lz
	 UXHLEteX9/sn6j4d9a+jOIbo6fFlYJ8nBVFiGHEW9y7MPFBUe6b+u/hT56cAYnS8Ycg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AvqslIJ0;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E365B606A334
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E365B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AvqslIJ0
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2324027c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894753; x=1793499553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eh0HnUlw9pDgMjno+anNWxERFVowk6iHp/gOhy/GxfU=;
        b=AvqslIJ0aNThVO3QVdavWcQ4OZoPYsRMvoe2MZ4HCQD9BRzxbZwiRi29BICS6c5GeD
         QZBbLWiFODYpRV7s7xfDHhOlL+dA6Lcp4xiRofaamtNfzMOc0a0OkmId3HjOJ+Ocuv8V
         Xb9lIdmrh71vxrZeFOc1c+kZu12m26uQuM9kU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894753; x=1793499553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eh0HnUlw9pDgMjno+anNWxERFVowk6iHp/gOhy/GxfU=;
        b=bG8SYreT6PDTP54qOyZi3xnZh3Av0wmDTMAN6sT9FUEAfhjdwc8fflnVr70hlFdgI7
         lFKCBFuCoITFW3qVS0LIw4TM6sHA6QWB5CPqV1IAsOGApsF2W8sGYvvd7P9FGThfb+z3
         FxWftEIv+Nwgo3Z8CEEp9TYIvStTRuq6mBKvnw0ExyOA4zFid7epPP0Kvf75vDp1rvZk
         UecBGJ4PfjQ2xpbQn4QkOFfNn6oZ3K7AYp3ki9EU+kPKHYjNyTGEiayQ1dqJo9baFqRx
         nYkNHjrtm2dkhE1o3hRVkDNypOi0FtiP7SGu1sO3LbLGJD4MDK4CQcWQcsWLO4YQ4rjT
         QvXw==
X-Forwarded-Encrypted: i=1; AKwUvBz9uHBdoaxh5GGK4rgOfvxSat+5nH0OdWH3L6KM0I3pNhjJhaf5hgpDTCJ/1hWT4OLXW1exJJ+ZvAH3lPw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4UUQJ4xigZO6jzjickfXYZ1P7Cjxz4oULba2Xkhb9ytdUwNJa
	DqYno4IqxrqoH1T0IihCm0ukg1ITSH8XWfHJ5YJuGbMSDlR1JzB7U5HIOZfRC56l4LVWETZX0nW
	pZks=
X-Gm-Gg: AYBFou3xQZx34RmoCJV1Jug8BlYpzjJUPa0WR20bRqCsJUWFvO2wZ7hZUkSa2a9u7tF
	TR9p4NBSQykOViAEaLM8Pc7kpV0DSXovwVf8EoKjK+kWRntgKADFAJepLEeqno7FsJcHXOc528s
	HZFVFckdrq3a3gxMKgmsP6utcG9RbXeAhyuNNNypfqH6Pk8yMpOM6eVKgopAO4Nfo0TJJ9VXSHn
	Qnyk4KlO/snI5uZhF9g0Bf+jkJpbPEhdk33mSb6p1o4zrnRaHd9M2j8tyMHw3oT1/GowNR0Ffyo
	U8lC4NoX5oNeEDlMLPntmhjp9uclAAPsBfyee6O99zPEx7qRqpWSFhX51mDZQ1TcgRLdlZGOlP5
	Uk2mRUELeE6STbxDPw00KgqGOl9oi1yKwd/JQfU1gcYzJmC56jCZEEHBPa8k2natIi1bii0K9bO
	0vM1OPSHvLlOSvVoJLSvAlSM8T6PYafSB299xpwW2+MIEE/7XPPxjqX6I6nKxw3OIJSSJGwgspX
	9AKlwKVQYUkOtg0SW4WfuASPGp+1vD1dCJPIksESaD58zHfz2MQZV3xaJjecd5EIKupmFvcRbT7
	YEbNWgaeFOJ17KHGUh7z1OQL8K8Tiz8f7tDThRU8G8/zMQekIQ2pgdOLIEGJZ1pPRw==
X-Received: by 2002:a05:701b:2501:b0:15a:4155:3d9d with SMTP id a92af1059eb24-19936e34e29mr4661614c88.31.1792894752899;
        Sat, 24 Oct 2026 19:19:12 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:19:12 -0700 (PDT)
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
Subject: [PATCH v7 12/15] zram: introduce shared decompression streams
Date: Sun, 25 Oct 2026 11:18:28 +0900
Message-ID: <20261025021839.1542805-13-senozhatsky@chromium.org>
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

Currently, per-CPU decompression streams use a mutex, but most of the
time there is nothing to protect.  Many backends have stateless
decompression and don't modify decompression context, so those can be
used concurrently.  The mutex is only needed for backends that do
modify decompression context (zstd, deflate) and for compressed
objects that span across physical pages, which zcomp linearises using
stream's ->local_copy buffer before decompression.  That buffer,
clearly, cannot be used concurrently.

Serializing all Readers because of that also creates Reader vs Reader
priority inversion - a low priority Reader that holds the stream mutex
can get preempted, and a higher priority Reader that then needs the
same per-CPU stream sleeps on that mutex until the scheduler runs the
low priority Reader again.

Switch zcomp_dstrm to permit parallel usage.  Give zcomp_dstrm two
locks:
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
priority (nice 0) CPU hogs and 24 high priority (nice -19) readers),
fg reader results, average of 3 runs:

  Metric           Base               Patched
  ----------------------------------------------------------
  Read IOPS        972k               1,466k        (+1.5x)
  Read clat avg    11.56 us           3.29 us       (-3.5x)
  Read clat stdev  2,739 us           16.6 us       (-165x)
  Read clat max    2,204,467 us       6,442 us      (-342x)

Reader vs Reader with CONFIG_SCHED_PROXY_EXEC=y in both kernels,
21 runs each:

                          Base                    Patched
  ------------------------------------------------------------------
  lz4      Read IOPS      1,456k (+-22k)          1,472k (+-4k)
           Read clat p50  3.3 us                  3.3 us
           Read clat p99  6.0 us                  5.9 us
           Read clat max  2.8 ms - 951 ms         2.8 - 7.4 ms

  Welch's t-test on IOPS, 21 runs each (patched vs base):
                          diff        95% CI              p
  ------------------------------------------------------------------
  lz4                     +1.1%       [+7k, +26k]         0.004

  Runs with max read latency over 100 ms / over 1 s:
                          Base                    Patched
  ------------------------------------------------------------------
  lz4                     15 of 21 / 0 of 21      0 / 0

Proxy execution closes the throughput gap, but shared streams don't
block in the first place, so the worst case is still much better.

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
index 0f8764c7a942..768c9a6d81e5 100644
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
2.56.0.257.gf7497c7d27-goog

