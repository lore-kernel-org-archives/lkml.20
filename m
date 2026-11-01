Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564273;
	b=ROOXUvkgWwRu9OR8pc0cCto/ZsLIXQYDKVojEPDw8AZDSEkJP/dbkt4poeeD7cKhNayA
	 3aHms6aVad3E+2e7Sn3G8KugTh/8MUS55dV+UXaU7HVjdi/CCpTw4RBLnfXx0itdPcphb
	 D+/rUOi80M5hWhxHOb4HhRC/mm1ucwBn/jGYpuPTVuyL4p9njC0XNQ09W/x/ER4yL+Kb/
	 RfBbPNYd1Vfa7mmKOa5Qu3hRw5L/IKPl3nlGFEy/IPtT2eyQM8QUo46tgj4qPQukJrQkJ
	 OrjeIRiJyNIBZhPJiOuYeLd3Db+feUailQHOLwoqxbrh0TIAB7lVlQ6mU378sxHlRtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DlNOls3+ymUZqV5h5Jh29N78SK+Yqf9KWPuhfSGW0t0=;
	b=KjCar6yKFRwo78KQUBnMy3RIU1ArYOYSmrvlq9yfvRPCwnD9Yfdkj+n6UYtYSTiew5/W
	 SO15gZHGFxzGbZLat5X29v4D+2c5z/FfkDOzpKiIhvmnhPJH1kpvwjPiKnfUtS0NkfAvp
	 Sj3fikuohaH2TDQbQBOxG+xCR3U01UF5oaBpRxdx8RmE7ZKXtXbmDblqoYgA9Hl/5oJJX
	 GLCJKfi4WNZp+kTT5YcJu1nS2JjkIXc1iZhBntCbrr2d0LZcko2g9CHno0hqZxodU7fuO
	 zDoJdDY3zanfsTa2K9bg85+seLM+OZMJl4eoOp/xCG10DwwLeFQ2XksV5XG3Y+ENekg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iazur+L/";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487AF606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 487AF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iazur+L/
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so4032990c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793564272; x=1794169072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlNOls3+ymUZqV5h5Jh29N78SK+Yqf9KWPuhfSGW0t0=;
        b=iazur+L/vt9idNwzNPJUK33YrHqb8KdNZAxNRWDAwq3dCpes3G9Th6Y6hfKYfFxu55
         Taa0QeCfLmXsFiIFB13awhI6YsePIp2NxiJ3bwMML3ufy8bPGFx3SBuiG/0rwdWZRoCq
         v5krcuT/PE3ft7zBNJQFFa+hp9smZzfmnWR+/SUVAms+t22l/2ODjR3zUFZl32ZuxmCg
         qF+hQ/BJ5sCmI6y402tewgozdFwOF3phzMfQu8RZRwQBYS7qANtXh+rFVNAVITr6PgE4
         0prTOG1nu7YfveO8JImXv6OtCjyTZBoo7KhO+nLccx/PXqJwhzHsauF6yNxnF+4DiXzn
         c7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564272; x=1794169072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlNOls3+ymUZqV5h5Jh29N78SK+Yqf9KWPuhfSGW0t0=;
        b=AsQXQHO/wvA2m04/yf73LGOpUPlaEA7d5ucih/zZZLB2iv9aAE9iDNDyIkmtQnk7gB
         R0bfWZlb6rDVsBVM78xBGdQYsl8CWWTeCXmvgbTtpgDFpLWoxDecxjVMatJJg/Xf2TSx
         uQks/JjhI3Mh57quqmHLNwWtc+8j1RmbZjm0YMVqxinCwzZv/SpDFhpGjZHnK16vZKgC
         7+V0TNHizni2HzIG0NYyf2tg4GlircLJold3h9PPQ8ENBjTbeXteSD2uahxIp5lnxmLD
         fn63dea5sP4wVtuO0X8eGakeL/9qX73gSXJxpfPIX4N0PxkMk6qxLCmpocuoOS/PeGTV
         QEug==
X-Forwarded-Encrypted: i=1; AKwUvBxR9N6PKI9PASGjkH5k5sjkrKYI9Nocv3/3k9IinmUfhVvxY7cFmVu76XVJA4HBjajwdzCGJ3wql4A5J24=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnoDJWEn/BccqKVlV6QNdkfJoR3wvCHSHICxFyHECi4Meicgs4
	Bt56l5kPt4Set5KQdC2wbf1TvdQ11aEJxLzgiFWm9znqu9m1lZ4rhXnr
X-Gm-Gg: AYBFou3jltNDvgMs95WU64VenZn41RIIkRTJ7SBMB554W0o/jqMlkifewaAeShsDGxD
	PlU+UmRcgsBz38kX8Nt4rt5t2oMALLVQyxbTx2Gec8bEDqVNSbpFaHRtSUtGcVscXLRrbTK1emQ
	0EXzcD6HZ0AARlJvKeJ3ouZU1q5lWf8DNzP5XKSMUxKYyxPfs6AF0pn4u3mPKhXUGBjPdbSJai5
	//GsZif+3CLZLRhn8G7zlpAgkroCFCubXRHsyLZYojfPVdXidvu2Rt6NwdJi1Lqba7jaXYoRPo2
	ZlGQmYJm+985sFrcd4FEgNsvH9fPLTCcqHH5HLgg1AU+05nNZ3qSeNGzWUNiU57Ga686qkKR2MR
	56d3foqQlRtrUDQpSy8eIpKwN2rG2QFg0v9YopaiyX7qMkJIJTGszU6a3z9tsOYCrK2Ta7apBk4
	FCiBFdEKpgZo2WBfmKB8H9iP53GxhX61wB9EnDAAe+PJmLPBSUHJQlqLmWSmYoDb4ck/OfkHCRh
	Y4Sthg0IeGpfXDw2isfk73LPCm6kevnIapGpLyIph4rOZf39KQaPiRQzzwIMPTLhjspaJYVyuvp
	KmJEb/Qc0FXOIoq63YYmz3++DeS7+G6WlhpEyqMW3ooIxLUXjtE3ltM/pZx1QZtrww==
X-Received: by 2002:a05:701b:230e:b0:14a:8cff:fbb8 with SMTP id a92af1059eb24-1ac5bbb5053mr11935043c88.28.1793564272099;
        Sun, 01 Nov 2026 12:17:52 -0800 (PST)
Received: from pranith.org (c-67-164-4-239.hsd1.ca.comcast.net. [67.164.4.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm26752101eec.10.2026.11.01.12.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:17:51 -0800 (PST)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pranith Kumar <bobby.prani@gmail.com>
Subject: [RESEND PATCH 1/2] eventpoll: parallelize independent nested leaf additions
Date: Sun,  1 Nov 2026 12:17:30 -0800
Message-ID: <739fceb0a9fe1bb057ec3ffc05c9401d0fc06a52.1792432666.git.bobby.prani@gmail.com>
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

Signed-off-by: Pranith Kumar<bobby.prani@gmail.com>
---
 fs/eventpoll.c | 114 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 89 insertions(+), 25 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index f48b829a710f..635db25e7e93 100644
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
+/* Local experiment: hash collisions only reduce concurrency. */
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

