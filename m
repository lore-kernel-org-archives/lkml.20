Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EC53DEAC6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295543; cv=none; b=lJFnFss3gD42aTnUf+B19301CtynThpkrLwZBBT+87BHeDWIuIG9zIHjuwigIy7ncrIH+WmLArgj8ooXvXYQHdnYavednejxlQyQunAcoqfZioRFIIDB/snC/SghLNhBIgBTsnpoJgwHqHYAZGqsEzOEfNFMCmTeZq0+OmAsl2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295543; c=relaxed/simple;
	bh=iBNwoAxMxbIJ6OBU/XG7VEyg/7v37Hv9waX2rOOwnB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Us4TDgzypYsOJF9A2NMIOZBvqGZIUjyKgiPekOHL3HGBkoKVvyjZG1ytDLV38TG2gseENUOgy+Ycu1Bq725FwHUFdYREYkrvsiWNHM8tS1XU+RC+kx2uDchn8Hjl72bpyS1QTLwowt5EVoQmjuw6DMsQ6NpQ7l0SI2nVi11sFIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ynb3uL4M; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ynb3uL4M"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so607960a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792295540; x=1792900340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ms0vFHNtZ2MX59YDGljIlqxn+FYjKSeTHfEf/QNa6k=;
        b=Ynb3uL4MdB8sJq8KcZGjf9KHBDeaefRoPIIsfv1qBTCmFykQ+uzJnj409YYRUUTBL8
         vF4XWUMQJQhnn32I5qIHprktXEa0EFtXk83xEpxNwVIIWa6yj6BqAx+RLin/wGKrOhFG
         pwyolwAoAFbFd1PNNUjKtiAAjeYQL6F8eed00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295540; x=1792900340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ms0vFHNtZ2MX59YDGljIlqxn+FYjKSeTHfEf/QNa6k=;
        b=j+kLL+msD7hTRG0U/MnsdKaklmcgpMmdNx+nYZ/aV2vt4Yyb0OVtuWOTDrtFBnb6fY
         D+2ZJ/kci0b81wg9cKcjUwinC3WjYBmY/nnO8IaAKQM8arka+tzQvAB/QSwLvbGLWnke
         9B+G8DAxDTmHItc2vHDuAVzA0GIApJOFBSq99NMPsWU3CzB9uBiF5KS26FS1NCO7SLsi
         Vq/C8fV/higgzYZcLWlozyt9Kw5mO2JuqbKCvmgI0/YEi7OWkcr69SYgV8xcky0PFFiy
         8mRF8UmZY9zvlsMln+P+U0wynR0bbrc5rnzUW0D6JBlEH54uxuARAxrtcb1wW5yH7/iE
         8aJw==
X-Forwarded-Encrypted: i=1; AKwUvBwCjNIvrIp+qswVg8aT/iJEmX1RDUKf/KHREHFSryNYCpDhq4bcRyP62t5r8j30ikfjOosyjkX6vgD4Bd0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpwVxXJpl7WRCWLaxbeQcHeAKNhjqWOeimpiWgnDVCF3rs2yLq
	Ha1F9LiSitU9FPJ28tZVMGi1D6i42NQxU0Zps1kqevCpnHrzOK4ZncaWh2QfgCmqwQ==
X-Gm-Gg: AYBFou0g0JK0nZEIRsT4mni5/9iUJtmDVUSS34wL4LFb2Qj2W02Uic4mNey8r0B1qhZ
	ckyO+59cwwzjJ4slsL3enna4AmEas4V9TX6CesSGuJXcKzMek1iVmdriBU/TUwUgmiu2efmCfBo
	hdNlpmPnqs7UL/ZmxyjYUOag4lPQcrRcI9zep4Y4cV3m53NPilRd7W4E5wc0KM/ImVeZg60mzvk
	RmB0SiMflORE9D4KLOzySbzUZ9z2kc1Vp/bBuRD8v/fazlqQNhUh5lLNiudwWzCvDefavzTTrCE
	Zc8BPph5W7upyo4EbUQ/hztaTYYt9zWMt8C/au3cG6dI1taCZQq4G9nbNdmBqLhieWRa/GkIGZX
	KKZ1dY6H4UT+lLuSXs16BTyeRzTlmtwjKLvNJaulx3xfcDJ1i0xvfyo98vDxs9PJCvZ1X+WkPNZ
	D/zwMt8IFzlkRJkUkL8brpP9AuJLwI0Svfw2VsAw5cMPEpupzQtln+ffvQ8D/KKEN1ZeBYhoLxz
	axkSbmHGffqZNTB/4rwKys8owJ4V29EXWm318R5zGmyNpxVO0qSqOp/b0Rld2R4Xqc00wtcTzxB
	n7f+Lpxffm4WaSeEHlKjq/Pkk6AqlKvmw+gh3HR++tO/
X-Received: by 2002:a17:90b:390f:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3aceec24c11mr3420976a91.21.1792295540531;
        Sat, 17 Oct 2026 20:52:20 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:4569:b311:f3ea:5f8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad25d5d1b4sm253024a91.16.2026.10.17.20.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:52:19 -0700 (PDT)
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
Subject: [PATCH v5 12/13] zram: borrow idle decompression streams in exclusive mode
Date: Sun, 18 Oct 2026 12:51:14 +0900
Message-ID: <20261018035125.3120704-13-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261018035125.3120704-1-senozhatsky@chromium.org>
References: <20261018035125.3120704-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
index 4fda13aac896..c6d2fd23c6f6 100644
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
+	struct zcomp_dstrm *zstrm;
+	unsigned int cpu;
+
+	/* Best-effort start CPU hint; migration during the scan is fine */
+	for_each_online_cpu_wrap(cpu, raw_smp_processor_id()) {
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
2.56.0.176.g3575e65682-goog

