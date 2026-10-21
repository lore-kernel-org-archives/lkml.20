Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550600;
	b=wuMh0oEZ1SQ8gP9ta0oAQdrtFGg+LMUr7hnhvBw4+52RcfDtXCG1BYADr7C4ykStOnUN
	 VrCpZTA0XSZWtoh8MZAODJJClby4rmAP9cBDKR+dpQgpKAe8r6zkPYaILjkQ8YYgVm41B
	 ahnCOM/ystMNU12jKA4jfVtI6sOs2mYJl6NmcKfeIDqrUIT9a9gzFUNrCX2OQ3sHQNp6T
	 0/hHBxnr+ypTjq7S5ryBOW4AezT2r7nA+1B/01896k5Cva0VTiOAFBXsIMCe1AtWsYMiR
	 xLmUYctvx+cLKneQMoOzzvWAbyiJBZ4/+harvzZWZddcE5yhW4ih6y6/3MHldRtFa4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xD8kSU/9QToLj3D/xT0dXUhUgFwrafcIQWn78ImkF5s=;
	b=dLKAoweJaQoacv1KBMSpnF0pNQ+5FOLgIc9J90CR5i3AYW+eOJYLswpeiPOF9heE+jKa
	 GH0JQLfC5ghKlZu6FEh4bY6wJCe6eph33fOG7m5J1qGTaKeLZwFlVJXw/lTYupTTBK76V
	 gXuy9ESxqk7+RWodWvWhglLdPHDOo58yadocX5/CH0FKLLSW5JEBeHIt0BMc27L++k1nq
	 UaQSPQ8oH2YSeFv9lKSSFfkSoo5tgNiu4OzSgTcMwZNJXdVcezWIPtRewKgj+iZu0M2vg
	 Yvhl0Y/43ItLZ2wFYDdksL+R3pta5KHQuYF6x1zzOCjXa8Ipn48g9QZbxEYdJCqzelA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BC9jC3xO;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D60F60A2610
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D60F60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BC9jC3xO
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso763882eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792550599; x=1793155399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD8kSU/9QToLj3D/xT0dXUhUgFwrafcIQWn78ImkF5s=;
        b=BC9jC3xOl40GfP7l4jAhYAa1tjLsuDpdnbEuaYPoafu/pmc4iVpAc2U6A9OKfeSzAO
         /z9oB3+W38Lp7mcv4FlxepIsGfGZwVKFeV9MsoFldKN/oZrwNzmo+kV9ZePLn4WqeiqS
         kZWmSn2vk0tApce5UyV4ZK2S6D11Py4FVE4vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550599; x=1793155399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xD8kSU/9QToLj3D/xT0dXUhUgFwrafcIQWn78ImkF5s=;
        b=bSQuH+bug+vFjnBNN9apqO0oeEDGUG2FfBj1yUh+w6DDgMHbj5PromXRKskyy16dnz
         /1cOd5PNu0QrnJNeN9YJld+XTHY1W/+bi90z4HCM6A/cRaBcgp3ZP6O09UfAKGufHLhY
         LCwcKVc92x/UHhJs53fKN7+o2NRGAQFBUy5wR6BpS7uQM5lsh5g8u8c0ID08ql3GFLnD
         FRdm+CqXuj1ovCzWNOl2Wv8x4anI4G7wkjCV7b2Q4t3ByVJRaBVROdWVGgvYr3X8LI8I
         C4xPhA5E9KQF++ZqiRe0t4OoKfx7FF/H1pPmSh4HEUT04/YgNvCFuxgM8XQe14sefv6T
         v5TA==
X-Forwarded-Encrypted: i=1; AKwUvBxBvML/oqSsVCxGdfj/G66RVqMlbD4IU7SKcN8JkUCVG6p2Ui2zWOzQThzKbfRkDUklw58o4gEMqFVmbfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL5A1CY0wE8Lbq49sS1rxGgjpV+3ZZ/iRVx5B+jK/mWHFbhWld
	CBS5Yz4uBKVqOWKSnblZDwA+hPkaxh41+IsiMIRuXzksf+X6bN8gtwyFrgQ2ugRJ6A==
X-Gm-Gg: AYBFou0BN/Bm9RNX3eZZGMlB0nKxZKZDaB4V2DcrwTJm7jZqdcWfbeRf0WVux/5Q9j/
	tWU94cc1DjF7wca0QmnKuixPSuXeNzFnvvtOa6tb95kn33obHa/4fUqOVw4QXNylYdaLowI0LO7
	Hkvgahwq7QGh4IoKoyP4CpGBIwmYlTfJfu8q5r3lQxJB+ZOP9M1kkXaqeiP0bpJb4WG5DP9HZv2
	tM8jFo7CrQMkmU64hxc6Cq3/R2moV/gT7Ox+1WXxrbinl907PT5UbjP8zPO2Ebib3GWcCMIvaeY
	zywGyclzkVnguapCzLPvbsJEH4GApf+n+Oj7iVzIOPGVlTBN/17v4bVv8Jwq4dvxtdjomwC6oml
	nnO8JHC5iqIRafHKvaVMxE6MPaY4m7zWDNY8n12sYibCdyY0CoNg1Ry2H9RWAypcvxDl0b3AyDt
	TLwiRLO6CpnVynBax2HBZ79pF5rGXjQWg5ZmOTcmpYFn6JAMGkn5UVuNGCh7b+RV0+UUH2XDx3I
	VoLXlYLFV5s1C45usoN516L96MHEofkmJ72mJA04IQx0yeh2R2AaP0rmDAC8BPGgYmhKlJjztWu
	sCSFzcv4l5jjnSW3e2Q9TIAlVyzYMLFK/yBjz7wkmVeP
X-Received: by 2002:a05:701b:42cf:20b0:150:6c0e:2ce2 with SMTP id a92af1059eb24-190a87a48bemr939881c88.31.1792550597905;
        Tue, 20 Oct 2026 19:43:17 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm2392047c88.3.2026.10.20.19.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:43:17 -0700 (PDT)
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
Subject: [PATCH v6 12/13] zram: borrow idle decompression streams in exclusive mode
Date: Wed, 21 Oct 2026 11:42:22 +0900
Message-ID: <20261021024236.1787884-13-senozhatsky@chromium.org>
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

Shared decompression streams eliminate Reader vs Reader priority
inversion for backends with stateless decompression.  However,
backends with stateful decompression contexts (zstd, deflate)
still require exclusive access to the stream [1].

When a low priority exclusive stream Reader is preempted by a high
priority exclusive Reader, instead of unconditionally blocking on
the local CPU's ->excl_lock, we can scan online CPUs starting from
the current and try to borrow first free stream.  Only when all
online streams are busy, sleep on a per-zcomp waitqueue until any
CPU releases an exclusive stream, which significantly drops
contention and wait time, per Bo Zhang's measurements [2]:

  Metric              Base      cross-CPU borrow
  ----------------------------------------------
  dexcl_contended     15,919    1,447
  dexcl_wait_ns_total 109.6 s   3.66 s
  dexcl_wait_ns_max   145 ms    26.6 ms
  dexcl_avg_wait      6.88 ms   2.53 ms
  dexcl_acquire       2.21M     2.94M

A quick synthetic fio test for Reader vs Reader inversion on 24 CPUs
(preempt=full, zstd, 48 low priority (nice 19) bg readers, 24 normal
priority (nice 0) CPU hogs and 24 high priority (nice -19) fg readers),
fg reader results (average of 3 runs):

  Metric           Base               Patched
  ----------------------------------------------------------
  Read IOPS        396k               1,064k        (+2.7x)
  Read clat avg    48.32 us           9.66 us       (-5.0x)
  Read clat stdev  7,571.00 us        31.92 us      (-237x)
  Read clat p99.99 5,707.10 us        2,233.68 us   (-2.6x)
  Read clat max    3,555,300 us       6,287.57 us   (-565x)

[1] https://lore.kernel.org/linux-kernel/20261015112440.1491168-1-zhangbo56@xiaomi.com
[2] https://lore.kernel.org/linux-kernel/20261016134847.1620103-1-zhangbo0325@gmail.com
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c    | 77 +++++++++++++++++++++++++----------
 drivers/block/zram/zcomp.h    |  5 ++-
 drivers/block/zram/zram_drv.c |  4 +-
 3 files changed, 61 insertions(+), 25 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index 4fda13aac896..72683f91313f 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -185,38 +185,67 @@ bool zcomp_shared_decomp(struct zcomp *comp)
 	return !comp->ops->create_dctx;
 }
 
+static bool zcomp_dstrm_excl_trylock(struct zcomp_dstrm *zstrm)
+{
+	/* Cheap pre-check: don't touch a busy stream's cachelines */
+	if (mutex_is_locked(&zstrm->excl_lock))
+		return false;
+	/*
+	 * Pin the stream.  The write side of ->lock is only taken by
+	 * zcomp_cpu_dead(), which also sets ->local_copy to NULL.
+	 */
+	if (!down_read_trylock(&zstrm->lock))
+		return false;
+	if (zstrm->local_copy && mutex_trylock(&zstrm->excl_lock))
+		return true;
+	up_read(&zstrm->lock);
+	return false;
+}
+
+static struct zcomp_dstrm *zcomp_dstrm_excl_tryget(struct zcomp *comp)
+{
+	unsigned int cpu, start = raw_smp_processor_id();
+	struct zcomp_dstrm *zstrm;
+
+	/* Best-effort start CPU hint; migration during the scan is fine */
+	for_each_online_cpu_wrap(cpu, start) {
+		zstrm = per_cpu_ptr(comp->dstream, cpu);
+		if (zcomp_dstrm_excl_trylock(zstrm))
+			return zstrm;
+	}
+	return NULL;
+}
+
 struct zcomp_dstrm *zcomp_dstrm_get(struct zcomp *comp,
 				    enum zcomp_dstrm_mode mode)
 {
-	for (;;) {
-		struct zcomp_dstrm *zstrm = raw_cpu_ptr(comp->dstream);
-
-		/*
-		 * Pin the stream.  The write side of ->lock is only taken
-		 * by zcomp_cpu_dead(), so this never contends with other
-		 * decompression requests, regardless of their mode.
-		 */
-		down_read(&zstrm->lock);
-		if (!zstrm->local_copy) {
-			/* The stream has been destroyed, re-try */
+	struct zcomp_dstrm *zstrm;
+
+	if (mode == ZCOMP_DSTRM_SHARED) {
+		for (;;) {
+			zstrm = raw_cpu_ptr(comp->dstream);
+			down_read(&zstrm->lock);
+			if (zstrm->local_copy)
+				return zstrm;
 			up_read(&zstrm->lock);
-			continue;
 		}
-
-		/*
-		 * Exclusive requests additionally own ->local_copy and
-		 * ->ctx and hence can only wait for each other.
-		 */
-		if (mode == ZCOMP_DSTRM_EXCLUSIVE)
-			mutex_lock(&zstrm->excl_lock);
-		return zstrm;
 	}
+
+	/* Checks zcomp_dstrm_excl_tryget() before touching the waitq */
+	wait_event(comp->dstrm_waitq, (zstrm = zcomp_dstrm_excl_tryget(comp)));
+	return zstrm;
 }
 
-void zcomp_dstrm_put(struct zcomp_dstrm *zstrm, enum zcomp_dstrm_mode mode)
+void zcomp_dstrm_put(struct zcomp *comp, struct zcomp_dstrm *zstrm,
+		     enum zcomp_dstrm_mode mode)
 {
-	if (mode == ZCOMP_DSTRM_EXCLUSIVE)
+	if (mode == ZCOMP_DSTRM_EXCLUSIVE) {
 		mutex_unlock(&zstrm->excl_lock);
+		up_read(&zstrm->lock);
+		if (wq_has_sleeper(&comp->dstrm_waitq))
+			wake_up(&comp->dstrm_waitq);
+		return;
+	}
 	up_read(&zstrm->lock);
 }
 
@@ -289,6 +318,8 @@ int zcomp_decompress(struct zcomp *comp, struct zcomp_dstrm *zstrm,
 	mutex_lock(&zstrm->excl_lock);
 	ret = zcomp_decompress_buf(comp, zstrm, sg, zstrm->local_copy, &req);
 	mutex_unlock(&zstrm->excl_lock);
+	if (wq_has_sleeper(&comp->dstrm_waitq))
+		wake_up(&comp->dstrm_waitq);
 	return ret;
 }
 
@@ -357,6 +388,8 @@ static int zcomp_init(struct zcomp *comp, struct zcomp_params *params)
 		goto cleanup;
 	}
 
+	init_waitqueue_head(&comp->dstrm_waitq);
+
 	for_each_possible_cpu(cpu) {
 		struct zcomp_dstrm *zstrm = per_cpu_ptr(comp->dstream, cpu);
 
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index 362a6da014aa..ca1ebc70ad0a 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -5,6 +5,7 @@
 
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
+#include <linux/wait.h>
 
 struct scatterlist;
 
@@ -96,6 +97,7 @@ struct zcomp_ops {
 struct zcomp {
 	struct zcomp_cstrm __percpu *cstream;
 	struct zcomp_dstrm __percpu *dstream;
+	wait_queue_head_t dstrm_waitq;
 	const struct zcomp_ops *ops;
 	struct zcomp_params *params;
 	struct hlist_node node;
@@ -115,7 +117,8 @@ void zcomp_cstrm_put(struct zcomp_cstrm *zstrm);
 bool zcomp_shared_decomp(struct zcomp *comp);
 struct zcomp_dstrm *zcomp_dstrm_get(struct zcomp *comp,
 				    enum zcomp_dstrm_mode mode);
-void zcomp_dstrm_put(struct zcomp_dstrm *zstrm, enum zcomp_dstrm_mode mode);
+void zcomp_dstrm_put(struct zcomp *comp, struct zcomp_dstrm *zstrm,
+		     enum zcomp_dstrm_mode mode);
 
 int zcomp_compress(struct zcomp *comp, struct zcomp_cstrm *zstrm,
 		   const void *src, unsigned int *dst_len);
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index b429c52cb37d..52341f05da83 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1382,7 +1382,7 @@ static int decompress_bdev_page(struct zram *zram, struct page *page,
 		copy_page(dst, zstrm->local_copy);
 		kunmap_local(dst);
 	}
-	zcomp_dstrm_put(zstrm, ZCOMP_DSTRM_EXCLUSIVE);
+	zcomp_dstrm_put(zram->comps[prio], zstrm, ZCOMP_DSTRM_EXCLUSIVE);
 	slot_unlock(zram, index);
 
 	return ret;
@@ -2135,7 +2135,7 @@ static int read_compressed_page(struct zram *zram, struct page *page,
 	dst = kmap_local_page(page);
 	ret = zcomp_decompress(zram->comps[prio], zstrm, sg, size, dst);
 	kunmap_local(dst);
-	zcomp_dstrm_put(zstrm, mode);
+	zcomp_dstrm_put(zram->comps[prio], zstrm, mode);
 	zs_obj_read_sg_end(zram->mem_pool, handle);
 
 	return ret;
-- 
2.56.0.212.g129ede20d9-goog

