Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434594;
	b=GFmZEAw5srusa64ugN7bBxQysSjIIFnCrZcG4anCdGD+lWDvu8Mzw+eruYTHfihHAarJ
	 f2GrL4I4JGkNbvsTCLzkyIjACgwvIJvoIfzQwdYU3e5QA4lhcGQkp3zmCBtU8qJI5yqXl
	 8cX3/dD/8b2SacSx8cUUruVZVSaQhu4O3b1nOA22f/BqJFiGxtn78WMwV6ODIDI87JCGS
	 4nA5IJUIi0P4Y2c/bb//9HHsWtr/uiXNy8Q+AVUVLKbG7NZ9pHhGgMv24oG+IgPPlvj5K
	 +wz1nQ01DAGQIOw1LBkwEliSL3xIoCwOKhv87NNy6rq+R04WFFySwajSamnYFLDFy+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3g+BccTDEealwkmBxSpdb2ok2Aut8o5SAuCxyC7nSnQ=;
	b=eR9O4IA7A0QcdnvzEecl4nXyWv1bgXnVetx3Ty7qE40yiJKc/nlPZPNwIjA80l9V41kT
	 2b+rc7aVlmsbgwsXBT9PsJ6ug9u2/B5I8SzWkWZQiIWKnkLL2HNCb+vXY74Ui7+gLw3E0
	 BgI1VLglxaFkQkg+XA0vEPQqJlxSNbl3rJlLrnqyoQi6EWlew8wqMpFBj+rFt7nFxfhAZ
	 xwsT/Jv7DGD7ce6VtaGsu/6Q7LZYO7Ldt90kEAxc4cMwPh3UUALGThwe4NtAwbJoeUMc2
	 LlUHXsAm3UkbDnoJMXl0n9vON6ddx8KfbUWA4JnziWpO2Z1AUY4r8xw3NZmdAKT+kpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j8H4YLj4;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2537606A339
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2537606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j8H4YLj4
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5962189eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434593; x=1793039393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3g+BccTDEealwkmBxSpdb2ok2Aut8o5SAuCxyC7nSnQ=;
        b=j8H4YLj4ar2KWE3APtxYzP/sTBYFzVhLpOPazVAqxrGyNW0ZNBvq1BGU4v+zczjksI
         HhBBAW0Boi9byrfB4Ey2jwurlvvR7uzA/m1E4aMCnfuvOa+vxJbR464w7hRlTBaFjHPg
         IyrpsIKe2xy12hjkWJRwaL3+h+4aSEUBTG0B7dO8YDCkFPI9pe9aLsw2mIm2zFMVc6pA
         IsKuCjwzZRauqy/pIkUMZfL7mlwC2hnwEJ8qcvA5mN1YWdTC2N5w+MlmEmsK3jdhgRvE
         t846ZE8GZuBYeQ6LZbiHgjpUDcgfGaUB6Xx1qpYBizs5pdxorfHnq2xbfZWAUIthU6lr
         z1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434593; x=1793039393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3g+BccTDEealwkmBxSpdb2ok2Aut8o5SAuCxyC7nSnQ=;
        b=AwVaI17oGZHBiLXQ0U9Iba3DQ9cIcae08SEx/XIZh92fK0HK761U6NLal38JXumNLp
         x8pWyXtxj6X/NJQd3QqM5OBgiCrAYf6VZQidYco/XRXhDlHhXG+Jr0a3TnpkwuISYuLX
         oaibyNWPIUrGmglu8OoATAYbVWZQ9su5F2OSRih/ImMxCJzFcFax22fY0cL9WosS3h/Q
         0cGblCrB14q69nxX5tWlAOKkx7sOhfwJ0W0eh+wTtZSb2WO4g4+aMYT/3CYv66sY5jRK
         YZpvZFswWKHqMYpSapxdyMTubnM8GpNvaUNk3GI6qpwXNHooR+Mip6ZCeMj8YtP4FEqD
         OFgw==
X-Forwarded-Encrypted: i=1; AKwUvBxoXq1XXq+OIV/gE4HaTuva/rZ/QWAiHW2wFAQ8rbN/ByiWNfUqOktLXDZd4pkgWwMnR1DBOqPZ1xSk7ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM4nXskmHHtP8QTgWWpP2u9svocRmzT00Xx8ZnuoNqkMhNnold
	7zHYJta85loigf8sRDzo9J7rdZegdQdEp2z3MjyX2qyPEwePSaY8SL64
X-Gm-Gg: AYBFou1CzVs8338na/0E8j9DuaXAbf60VzzYMJSTuqU6dmlhkowaS6CpWU0Z22Ldx3+
	8QJ0sLbgeOAZLp2M4t35G9x29QIdPCb84+L1zUjQy4wEEKQq+1ciAlrpsQZgrYoaMt9ONrueDFI
	+5mVzuZT0neZWJIf3VjSZTBlq9eZvjB7rv1f5ZZecMQoITxgaVycXRCOzkhmWxXOFmv3unNfk0O
	YjSPZMSuI1Q5aHeHIeJf/xN2QD8m14wKUnlKKImmdzyr27xqcZce6VXC6S0Yn35xf6TCbYauWNw
	u1cZ4r0Y856ZCv+92J/vjSZenAxZ3KJIZLV2e9ZxtuVgF6XSq/K/+OREN5IfP888MUn5ZerzJKt
	XxzgQd9Z3KPi4Ib/aNhHEhJsrPJgAMKxF9kx1XcBIqnlrHWabXilVIQNUhtCWI5XD7J8kQHB/m0
	OcxjZcUgVJdEG9znZNXC4cRToOShQcV9F7ec3LU1iVGFi/vajM/rnMRVwZ0l+jkGBCZKs1fEr0u
	rspkNf6LgKqwB2U8oU3cdWwW2XCIOX/4BM4skNB5LiFhbuVA559cX75KioPtCECVWD/prhJjLkl
	bO4Gga4UoBqO8EcS
X-Received: by 2002:a05:693c:83c4:10b0:353:8103:ecae with SMTP id 5a478bee46e88-361a23502dcmr14176933eec.23.1792434592957;
        Mon, 19 Oct 2026 11:29:52 -0700 (PDT)
Received: from pranith.org (c-67-164-4-239.hsd1.ca.comcast.net. [67.164.4.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm35009576eec.5.2026.10.19.11.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:29:52 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: target-maintainer@vger.kernel.org
Cc: Pranith Kumar <bobby.prani@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] eventpoll: parallelize independent nested leaf additions
Date: Mon, 19 Oct 2026 11:29:32 -0700
Message-ID: <344d2def66bafc4c308b7d964e33d95db86167c2.1792433364.git.bobby.prani@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792432666.git.bobby.prani@gmail.com>
References: <cover.1792432666.git.bobby.prani@gmail.com>
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

An ordinary-file add to a watched epoll takes epnested_mutex.
Independent workers therefore queue behind one global mutex even
when they modify different leaf files and epoll instances.

Freeze topology with an rwsem. These additions share its read side
and do not take epnested_mutex. A hashed mutex protects each target
file's reverse-path count, while ep->mtx still serializes operations
on one epoll. Topology changes take the rwsem's write side and the
old mutex for global cycle and path checks. Hash collisions only
reduce concurrency.

The extra read lock and its shared count update cost time, but they
allow unrelated adds to overlap instead of waiting for the global
mutex. Uncontended or topology-write-heavy workloads may see less
benefit, or a regression.

On a local four-core ARM64 setup, nested add/delete throughput
rose from 1,558,641 to 5,325,959 pairs/s (3.42x).
Flat throughput changed by +0.52%.

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 fs/eventpoll.c | 114 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 89 insertions(+), 25 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index f48b829a710f..5f7cd03107b3 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -27,6 +27,7 @@
 #include <linux/mount.h>
 #include <linux/bitops.h>
 #include <linux/mutex.h>
+#include <linux/rwsem.h>
 #include <linux/anon_inodes.h>
 #include <linux/device.h>
 #include <linux/uaccess.h>
@@ -63,12 +64,13 @@
  * Locking
  * -------
  *
- * Three levels, acquired from outer to inner:
+ * Locks are acquired from outer to inner:
  *
- *   epnested_mutex   (global; rare; taken only for EPOLL_CTL_ADD
- *                     loop / path checks)
- *     > ep->mtx     (per-eventpoll; sleepable; serializes most ops)
- *       > ep->lock  (per-eventpoll; IRQ-safe spinlock)
+ *   epnested_rwsem  (global; write for topology changes, read for
+ *                    ordinary-file adds to watched epolls)
+ *     > epnested_mutex or ep_file_mutexes[]
+ *       > ep->mtx   (per-eventpoll; sleepable; serializes most ops)
+ *         > ep->lock (per-eventpoll; IRQ-safe spinlock)
  *
  *   file->f_lock    (per-file; NOT IRQ-safe; guards f_ep hlist ops;
  *                    nested inside ep->mtx, outside ep->lock)
@@ -84,6 +86,9 @@
  *     view of the epoll topology; a per-object scheme would let two
  *     concurrent inserts (A into B, B into A) construct a cycle
  *     without either observer seeing it.
+ *   - Ordinary-file adds cannot form cycles. A read hold on the global
+ *     rwsem freezes topology while a file-specific mutex serializes
+ *     changes to that file's reverse wakeup-path count.
  *   - Per-ep ep->mtx is preferred for scalability elsewhere. Events
  *     that require epnested_mutex are rare.
  *
@@ -387,10 +392,12 @@ static long max_user_watches __read_mostly;
  *      of a given length -- reverse_path_check().
  *
  * Both need a global view of the epoll topology and must be atomic
- * with the insertion, so the check is serialized by epnested_mutex
- * and carries its scratch state on a stack-allocated struct
- * ep_ctl_ctx scoped to one do_epoll_ctl() call. Non-nested inserts
- * skip this machinery entirely and take only ep->mtx.
+ * with the insertion. Topology changes take epnested_mutex under the
+ * write side of epnested_rwsem. Ordinary-file adds to watched epolls
+ * take the read side and a hashed file mutex, since only their target
+ * file's path count changes. Scratch state is on a stack-allocated
+ * struct ep_ctl_ctx scoped to one do_epoll_ctl() call. Non-nested
+ * inserts skip this machinery entirely and take only ep->mtx.
  *
  *   epnested_mutex     Serializes the whole check.
  *   loop_check_gen     Global monotonic stamp, bumped at the start of
@@ -413,6 +420,16 @@ static long max_user_watches __read_mostly;
  * preserve both bail-outs.
  */
 static DEFINE_MUTEX(epnested_mutex);
+/* Hash collisions only reduce concurrency. */
+#define EP_FILE_LOCK_BITS 8
+static DECLARE_RWSEM(epnested_rwsem);
+static struct mutex ep_file_mutexes[1 << EP_FILE_LOCK_BITS];
+
+static struct mutex *ep_file_mutex(struct file *file)
+{
+	return &ep_file_mutexes[hash_ptr(file, EP_FILE_LOCK_BITS)];
+}
+
 static u64 loop_check_gen = 0;
 
 #define PATH_ARR_SIZE 5
@@ -421,7 +438,8 @@ static u64 loop_check_gen = 0;
  * Per-do_epoll_ctl() scratch for the loop / path checks. Allocated on
  * the caller's stack; populated by ep_ctl_lock() and the downward
  * walk; consumed by reverse_path_check(); released by ep_ctl_unlock().
- * Only valid while the caller holds epnested_mutex.
+ * Only valid while the caller holds the topology write lock or the
+ * topology read lock together with the target file's hashed mutex.
  */
 struct ep_ctl_ctx {
 	/*
@@ -1664,8 +1682,7 @@ static void ep_rbtree_insert(struct eventpoll *ep, struct epitem *epi)
  * epoll topologies without rejecting reasonable usage.
  *
  * Enforced at EPOLL_CTL_ADD; CTL_MOD and CTL_DEL cannot add paths.
- * The running tallies live in ctx->path_count[] and are protected by
- * epnested_mutex.
+ * The running tallies live in ctx->path_count[].
  */
 static const int path_limits[PATH_ARR_SIZE] = { 1000, 500, 100, 50, 10 };
 
@@ -2560,18 +2577,19 @@ static inline int epoll_mutex_lock(struct mutex *mutex, bool nonblock)
 /*
  * Acquire the locks required for do_epoll_ctl() on @ep for @op.
  *
- * Always takes ep->mtx. For EPOLL_CTL_ADD, additionally runs the
- * loop / path check under epnested_mutex when the topology can
- * change: @ep is already watched (epfile->f_ep non-NULL), @ep was
- * recently loop-checked (ep->gen == loop_check_gen), or @tfile is
- * itself an eventpoll.
+ * Always takes ep->mtx. For EPOLL_CTL_ADD, additionally checks paths
+ * under the topology read lock when @ep is watched and @tfile is an
+ * ordinary file. Adding an eventpoll or handling a recently checked
+ * @ep uses the topology write lock for the full loop/path check.
  *
  * Return value encodes both outcome and lock state:
  *
  *   0        success; ep->mtx held.
  *   1        success; ep->mtx held AND the full check ran under
- *            epnested_mutex (which is also still held). The value
- *            doubles as the @full_check argument to ep_insert().
+ *            the topology write lock and epnested_mutex.
+ *   2        success; ep->mtx held, topology read lock and target
+ *            file mutex held for a full path check. Both 1 and 2
+ *            are true as the @full_check argument to ep_insert().
  *   -errno   failure; no locks held.
  *
  * The caller releases what was taken with ep_ctl_unlock(ep, ret).
@@ -2584,6 +2602,7 @@ static int ep_ctl_lock(struct ep_ctl_ctx *ctx, struct eventpoll *ep, int op,
 		       struct file *epfile, struct file *tfile, bool nonblock)
 {
 	struct eventpoll *tep;
+	struct mutex *file_mutex;
 	int error;
 
 	error = epoll_mutex_lock(&ep->mtx, nonblock);
@@ -2596,11 +2615,41 @@ static int ep_ctl_lock(struct ep_ctl_ctx *ctx, struct eventpoll *ep, int op,
 	    !is_file_epoll(tfile))
 		return 0;
 
-	/* Full check needed: drop ep->mtx so we can take epnested_mutex. */
+	if (READ_ONCE(epfile->f_ep) && ep->gen != loop_check_gen &&
+	    !is_file_epoll(tfile)) {
+		/* Freeze topology, then serialize checks for this leaf file. */
+		mutex_unlock(&ep->mtx);
+		if (nonblock) {
+			if (!down_read_trylock(&epnested_rwsem))
+				return -EAGAIN;
+		} else {
+			down_read(&epnested_rwsem);
+		}
+		file_mutex = ep_file_mutex(tfile);
+		error = epoll_mutex_lock(file_mutex, nonblock);
+		if (error)
+			goto err_unlock_read;
+		error = epoll_mutex_lock(&ep->mtx, nonblock);
+		if (error) {
+			mutex_unlock(file_mutex);
+			goto err_unlock_read;
+		}
+		return 2;
+	}
+
+	/* Full check needed: acquire topology write lock before ep->mtx. */
 	mutex_unlock(&ep->mtx);
+	if (nonblock) {
+		if (!down_write_trylock(&epnested_rwsem))
+			return -EAGAIN;
+	} else {
+		down_write(&epnested_rwsem);
+	}
 	error = epoll_mutex_lock(&epnested_mutex, nonblock);
-	if (error)
+	if (error) {
+		up_write(&epnested_rwsem);
 		return error;
+	}
 
 	loop_check_gen++;
 
@@ -2622,17 +2671,28 @@ static int ep_ctl_lock(struct ep_ctl_ctx *ctx, struct eventpoll *ep, int op,
 	clear_tfile_check_list(ctx);
 	loop_check_gen++;
 	mutex_unlock(&epnested_mutex);
+	up_write(&epnested_rwsem);
+	return error;
+
+err_unlock_read:
+	up_read(&epnested_rwsem);
 	return error;
 }
 
 static void ep_ctl_unlock(struct ep_ctl_ctx *ctx, struct eventpoll *ep,
-			  int full_check)
+			  struct file *tfile, int full_check)
 {
 	mutex_unlock(&ep->mtx);
 	if (full_check) {
 		clear_tfile_check_list(ctx);
-		loop_check_gen++;
-		mutex_unlock(&epnested_mutex);
+		if (full_check == 2) {
+			mutex_unlock(ep_file_mutex(tfile));
+			up_read(&epnested_rwsem);
+		} else {
+			loop_check_gen++;
+			mutex_unlock(&epnested_mutex);
+			up_write(&epnested_rwsem);
+		}
 	}
 }
 
@@ -2719,7 +2779,7 @@ int do_epoll_ctl_file(struct file *f, int op, struct epoll_key *tf,
 		break;
 	}
 
-	ep_ctl_unlock(&ctx, ep, full_check);
+	ep_ctl_unlock(&ctx, ep, tf->file, full_check);
 	return error;
 }
 
@@ -2998,6 +3058,10 @@ COMPAT_SYSCALL_DEFINE6(epoll_pwait2, int, epfd,
 static int __init eventpoll_init(void)
 {
 	struct sysinfo si;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ep_file_mutexes); i++)
+		mutex_init(&ep_file_mutexes[i]);
 
 	si_meminfo(&si);
 	/*
-- 
2.47.3

