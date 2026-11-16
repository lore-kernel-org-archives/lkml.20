Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809724;
	b=kye4Mbb9RH4K0juIFkbC1uKsUrPfYsFIZm5DdXDCMitan07qZBCTpacpCNYgUA4JVJw/
	 1XTZhiWuuBrmcS5czl6URRD8fXfBcUIhtemRxyMSyblbVizUOze8OkiE9IHYcSStPNPsr
	 O0ZpETVTD1AMLJCjAzEwvwZ07JpxBc9ZyfRngIsJgGDWTpxJAsyMvdWSL7UJHAfDlNqQU
	 DuX2hgG1EJWN0jeA9+UOEXX6m4jEeTpV3cPuWg8VIv78ICovoCHgFWBIcZ7GHNuJnZ3Kc
	 2udXFrSmK72Gb9baX9+d+oKngDE7toQfXxe2vYnG5Bq6+21QZGWhCdWr3JH5DADYEIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZKs8AYk2ncyKZCHDH0zdBH97wh5SQAhH9BYRDgLCL+U=;
	b=skVNJPTTv0lFD57GaRbGISGS1/gqF6XVHe1QnszfRczi2LRpIDnWIEo8r8N9vJghPUTO
	 kG+ZozPvnil75PkmufSkyGPHvyPthqugxOSi++qHiq+zwFSAwefHNdPc0d6ma7J9rWJ3c
	 ahn8OqY4FKcssiR6gb5U7DztuGMQn+NA6RznDEYoYxsHjTdGh8ZYLzZSwyXLK7ZKg/9nh
	 2o7lu1fV9LanhD5G9dxi+/PXzXufOrvOncy0LVc5L+zsqsQmVqPJ4W+LwJy/6ajuV7Ms2
	 XbmyeGhJzG49qDIyJLxYBAw7oLbU476W7TuV5NcVasOT7Q2UgW5YBA0qkRrlh/IsB1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3yXXuag;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDD0606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACDD0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3yXXuag
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so2881121eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794809723; x=1795414523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZKs8AYk2ncyKZCHDH0zdBH97wh5SQAhH9BYRDgLCL+U=;
        b=S3yXXuagMj6jEH5ZKvtjSUvjgVweC7YQStIf6hraBxJqb33PLJSAQL4qG67G9gw3su
         ET28LlWxi2FaBWcwrkRF32Ga44FVlKjFxsyKim3k5PrfYb00R0DdhrpHMwt50QM5oUY0
         me1KrXWZLjMQ2SDOT8+o1IGByNNPgL+zKLTdT0YmvBjgJ9Z0OJDQk9hpEhiBKxhSM1QR
         Wwm9IXRWXTCWmNUeSd0PRYZC6sx9gP4rhKBXLSCU+xzQKgAPccderjYOnggzULl5jr80
         +HFiRrSEPJs7ACLlgHm+oXAWfPBIGUkGASG6zy5QuZ9f8ljpxke5tu6NyBD7F2vVLQtj
         fTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809723; x=1795414523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKs8AYk2ncyKZCHDH0zdBH97wh5SQAhH9BYRDgLCL+U=;
        b=OIFL+lpRIylr3ybsBz2VfTD/X2O2b8yC0RODaleYVhIfeHIClLYfcgQCt6H5A618e2
         wrpafD9zA5YyRifGjr+45MNwyApRPXUC19u1UOJXSaCh8oGmchbZ/S1NKhPODgLqoSa7
         UDGn3DmNrMCGdv950APu0qDXjkLyrK+ljNDYqdhZ3VyqvJppHS0CHtSWM3Arnyuk6Axp
         McSmKZavL3sbvMgRXHmYwWIMOoTchMZ4/X5lmoTmbeVZMD1IZFYqNaOSk1FKhJ5F8acN
         oPZ4ZMgjT2B1L5h0SM3WXQrSheyJ+8/ajpHPXRU29MJZuO5lBH13laoOLE2/VTdcwK1f
         FVxA==
X-Forwarded-Encrypted: i=1; AL+hErGdrJ9lZE9XH8JEaXi2sHYiwXHHIAlLdxAIMUJDFl36poF2ayaSarN4MiFlPUf7rKFUPeD4vlNO3jFbVdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rRiI1JztzKHQIMPY0nEU3AQCuUG6/J34tba6maxnL+q+a5Mvj
	wJ2Gqfuk2gAAvMP/yUpAxAyfVQBPU/O1/Jzl3A9Z7fY3oW5nPKRbuJNu
X-Gm-Gg: AYBFou2gykFpNpV1TS4ye0IYbQDNeQ78gNJroVNds1po2trF7hYwtvPRdfe+A5PXCH3
	eeFex6EYNyw8oKKRW0d/QzUwsEHumzGg+lVzy9IhrHZmom0+Xw/sewQpDwZWO8fNFonWY/5IkP2
	2MnDOWx/k31NovhoNrie0eqUv5B/tIcwgZE3rs5fGcDH3jYV7qo++/GyNyc0Oe/F4hoKZD6xww8
	7wz/DcE7pVjDcE6MM+Ay6vUTBBTTCpXzXQ30DJiRecztEJMvPZ58YWAJ+vPqMul61GCyWIm+GUk
	3xE1/ChTh5e3wwsDd6kxY3eCxPQNAU1KS+qSTtQVaYjf5PZZ8XKuw1mURcV6+GuuAvj57QzNL/6
	3V9gif3+TWQlrO0xybwFPVEc+/tAXVnrgJdK2JZONvbd4syPMyZF8Fh3cZxfSnX+bsS6GA0QYfP
	lj3TxsR1lfR0Xa6VlxYgEW37aWeF/6vj98s/MHksM4YkmfRzmbw5bGZln/dNvenYkXnrvttat+B
	qYBzNBh63wPUMe/eLfT7GNKXCufZECsG7uxWDQE9TOYGVwrn8u38nLFV3ijrWPLQo/a3MjjQeCn
	eOIG0Ivg21GzVauo5YD8akt1SZMI/roW8el7TnQezWwRIi0ylMINppccPTsuuSCL2+Pf3kA8n6U
	WN18bWpw2f054YRzIe4U3HMtZERp0zL5EcejyuAk=
X-Received: by 2002:a05:7301:4604:b0:376:703c:8819 with SMTP id 5a478bee46e88-379681c6998mr11095176eec.38.1794809722597;
        Sun, 15 Nov 2026 22:15:22 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm32767289eec.28.2026.11.15.22.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:15:22 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jlayton@kernel.org
Cc: cel@kernel.org,
	alex.aring@gmail.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	dai.ngo@oracle.com,
	mjguzik@gmail.com,
	zhaogongyi@bytedance.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] filelock: don't hand out a delegation that is being recalled
Date: Mon, 16 Nov 2026 06:15:02 +0000
Message-ID: <20261116061502.44674-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

An operation that finds a conflicting delegation gets -EWOULDBLOCK from
try_break_deleg(), drops its locks, waits in break_deleg_wait() and then
retries. Nothing stops a new delegation from being set on the inode in
the meantime.

With F_SETDELEG the owner of a file can do that from userspace: remove
the delegation when it is recalled and request it again right away. The
waiter in __break_lease() then finds a delegation that was never asked
to be returned. It has no break time, so it never times out and its
holder is not signalled again, and the waiter keeps waiting for it.

As a result unlink(), rename(), chmod() and chown() of the file hang
until they are interrupted, no matter who calls them and what
lease-break-time is set to. A delegation on a directory does the same
to a create in that directory.

Record in the lock context that a delegation is being recalled and
refuse to hand out a new userland delegation with -EAGAIN while that is
the case. The block is lifted as soon as an operation gets past its
delegation check with nothing left to break, so a delegation can be
requested again once the conflicting operation went through. If the
breaker gives up instead, the block expires after twice the lease break
time. nfsd already keeps track of recalled delegations by itself and is
left alone.

Fixes: 1602bad16d7d ("vfs: expose delegation support to userland")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/locks.c               | 24 +++++++++++++++++++++++-
 include/linux/filelock.h |  5 +++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/fs/locks.c b/fs/locks.c
index 6e4ff7fcec05..f7d1a376da5c 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -190,6 +190,7 @@ locks_get_lock_context(struct inode *inode, int type)
 	INIT_LIST_HEAD(&ctx->flc_flock);
 	INIT_LIST_HEAD(&ctx->flc_posix);
 	INIT_LIST_HEAD(&ctx->flc_lease);
+	ctx->flc_deleg_blocked_until = 0;
 
 	/*
 	 * Assign the pointer if it's not already assigned. If it is, then
@@ -1705,8 +1706,11 @@ int __break_lease(struct inode *inode, unsigned int flags)
 
 	time_out_leases(inode, &dispose);
 
-	if (!first_visible_lease(inode, new_fl, flags))
+	if (!first_visible_lease(inode, new_fl, flags)) {
+		if (type == FL_DELEG && (flags & LEASE_BREAK_NONBLOCK))
+			ctx->flc_deleg_blocked_until = 0;
 		goto out;
+	}
 
 	break_time = 0;
 	if (lease_break_time > 0) {
@@ -1739,6 +1743,10 @@ int __break_lease(struct inode *inode, unsigned int flags)
 	if (!fl)
 		goto out;
 
+	if (type == FL_DELEG && lease_break_time > 0)
+		ctx->flc_deleg_blocked_until = get_jiffies_64() +
+					       2 * (u64)lease_break_time * HZ;
+
 	if (flags & LEASE_BREAK_NONBLOCK) {
 		trace_break_lease_noblock(inode, new_fl);
 		error = -EWOULDBLOCK;
@@ -1791,6 +1799,15 @@ int __break_lease(struct inode *inode, unsigned int flags)
 }
 EXPORT_SYMBOL(__break_lease);
 
+void locks_unblock_deleg(struct file_lock_context *ctx)
+{
+	spin_lock(&ctx->flc_lock);
+	if (list_empty(&ctx->flc_lease))
+		ctx->flc_deleg_blocked_until = 0;
+	spin_unlock(&ctx->flc_lock);
+}
+EXPORT_SYMBOL(locks_unblock_deleg);
+
 /**
  *	lease_get_mtime - update modified time of an inode with exclusive lease
  *	@inode: the inode
@@ -1968,6 +1985,11 @@ generic_add_lease(struct file *filp, int arg, struct file_lease **flp, void **pr
 	if (!leases_enable)
 		goto out;
 
+	error = -EAGAIN;
+	if (is_deleg && lease->fl_lmops == &lease_manager_ops &&
+	    time_before64(get_jiffies_64(), ctx->flc_deleg_blocked_until))
+		goto out;
+
 	locks_insert_lock_ctx(&lease->c, &ctx->flc_lease);
 	/*
 	 * The check in break_lease() is lockless. It's possible for another
diff --git a/include/linux/filelock.h b/include/linux/filelock.h
index e909db319067..1a48c5550fa9 100644
--- a/include/linux/filelock.h
+++ b/include/linux/filelock.h
@@ -158,6 +158,7 @@ struct file_lock_context {
 	struct list_head	flc_flock;
 	struct list_head	flc_posix;
 	struct list_head	flc_lease;
+	u64			flc_deleg_blocked_until;
 };
 
 #ifdef CONFIG_FILE_LOCKING
@@ -229,6 +230,7 @@ void locks_init_lease(struct file_lease *);
 void locks_free_lease(struct file_lease *fl);
 struct file_lease *locks_alloc_lease(void);
 int __break_lease(struct inode *inode, unsigned int flags);
+void locks_unblock_deleg(struct file_lock_context *ctx);
 void lease_get_mtime(struct inode *, struct timespec64 *time);
 int generic_setlease(struct file *, int, struct file_lease **, void **priv);
 int kernel_setlease(struct file *, int, struct file_lease **, void **);
@@ -510,6 +512,9 @@ static inline int break_deleg(struct inode *inode, unsigned int flags)
 		flags |= LEASE_BREAK_DELEG;
 		return __break_lease(inode, flags);
 	}
+	if ((flags & LEASE_BREAK_NONBLOCK) &&
+	    READ_ONCE(flctx->flc_deleg_blocked_until))
+		locks_unblock_deleg(flctx);
 	return 0;
 }
 
-- 
2.43.0
