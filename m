Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951419;
	b=e/2ABPCGr1nRtCYR5Vmp3e25dYv0p/ZuYfyIuhVznD58Gef58aCvE9qlfYPCKEIzqugE
	 MShex3evxcAEULelsIkfp1JbVPRY0NB4zPZ9fHKmpaxnXhs3BvfXAEmuadlXlEu9nHMeX
	 heD7XWKGdUKXTwD8HrxGyzrWqXcZe2Iz6x8ATFQRr/hoKX/VhWY7fE/K0Qx4KGVCxbeyk
	 P1+VQX1doVzIW3pBgwAjqqpghm7IBIuHlvZ+juFl446jWxcOHllBYoVifNh4hb7M+DXgg
	 4pxzMUepIHcIaqzA5IxXOv6L+ROhwfuR20Jhhch70FEED8muUJ5NT3FMr0eXip34D0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4n5PXgmH7bwk4++CQGTRqmBC8cH/nMa4UQLTECEFvWo=;
	b=SA/WIBd+4o+AejU1oTsoIhmbv8at8IibSbyF/zk/537/IjtbWcUL1a1WemvbBpYyRz3D
	 ZpoBuztEgaPHOwXeZSORYue3s2LHyFOqtBtdgK77uaCsCBlWLbcqVkley519Fa5M2FG4y
	 I4z/oYpvqoS6CtE/1z3t7PBRIVwwD5xW6F55fQoek/VPwXO+TzUoe1JV7mrvuF1Had7gR
	 4QPDIqIEY4bSHqx7rxuTLZiZSgeJ+Jrp1e9r3qM8YILNPAAfmexaz2G400oXm0YJxwuJm
	 4gosYTgsNKH58MPcF6WX/rcpbR7jY/ffCJ80lapusNTNQOAsJS8Op5aHQ8wutBtZJyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BwsF1H+0;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4B5606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB4B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BwsF1H+0
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so3703774eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951418; x=1793556218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4n5PXgmH7bwk4++CQGTRqmBC8cH/nMa4UQLTECEFvWo=;
        b=BwsF1H+0GSsv9+GupUkCPAZQ1x4oV1ZoZiyIn2NTua30r22D+dIFxdsnkw5QKA6hj4
         dUQmTrMr1sHn4NbgRk1EFbYnhTDL1YwLCmkpAe1sMNZzmfqa8KrzZFXIfxWD629JIOPx
         Lt3u6Xpt2YWV4jHwPZB36f49Y/9UtXOhkrMfvGcQGb7SXEwqCElt8wcsYhcc477p9Ux8
         UCGJL23BvBexlRjB3p2SbMKhzHP1Zn80c4Rv1Y5lIynNeNaDP1DPTr+6DlSM3UVgafx/
         E4yuFFcO3mI17PIqU+RiL7l7sVDEaKLSPC6tvGT4Ek47EB1grmdNFnGaqWbsHkd6FCK4
         Co3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951418; x=1793556218;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4n5PXgmH7bwk4++CQGTRqmBC8cH/nMa4UQLTECEFvWo=;
        b=fiDAQxqbHkt1q0j50GRAtkPPymCvlgjU0PWA7E5fGbiCHbXT61ZVyA9+VkxUZTd/nZ
         KaBXgkR9fVudgD8ddR0IH5N+6cfHauztLHYL5PkQAVIh+Rk0/2UN+K9ZZMSy5OSd0p77
         Jcp4vyXuyMqNpo4x8FB98IF7g7n2m6T2kke+/er3Cmi46q80U+sBRoaCkjWmdomYCN6D
         J4Usd9Ucb6B8jGOTiJ3YRxUDnfIOLG6k7Li+v+9ckPh8S9GotaLmGhHwAdRPF9y7qtq0
         Y0CC1E/ogpF26MImQcPf1ds9IF8YwpTX4LNwPcTLphHUoIL9ZK/dIiA3baxZW8JhTAoP
         SczQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoLhcmB3pM1Xr6xv4zuuszHGIXMP3Tl+4tuxb1UxXF5GiMIFMyar0Hs9PoyTtKpphpkRvgPnojZ9vIlzQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ7mkPTaqMdzd2bwguTm5R3ZGX0QPrMTYjJjkb9azjIwoYvQ42
	SlAvAXF3WqouvQ3J6h4b7X/aVMVDxAdEkb/5r+Fmh0Hu4RPEMQdnYqI7ms7GxU3v79c=
X-Gm-Gg: AYBFou3ylhU4kc2oDMaDBR5BZu38gKYxqELjCdGYYGPyi+38XRye4W2ffmKFluffMvs
	aDFUhFMNIkfQMP3TtFNWsBDN616hxMjz9VWlwfnOd0N5Tzh74izYdwkEzMA2jDYuATud+QarICg
	6H0Cw6GThHMQpIs50QNReYZh5FFUafwP8svWkC/PiWKpCvGfwYIyzH57DixkAf1pvwQ1b3Zv7is
	+D4DrqTo7k+Eue1jd+xKNu/qAuuzPJn1myxeYdsNrJR/uceOJRv1Ku95SkIL5A35jZOytzPCtr1
	eVgOrVsd5p8uJPJIgTVOdqNZOD4I6Rkt2nLEM0lzO9knsuLyqPFYw/D+5Y6dPGkmIiGVFV6Ee9E
	Xn62FyvoKCp2w3jcgesY40RZJXzSnXrn6hjUZ6JNUmSkFnhMkm998GsT5OuirOOI3LvTDvFpdVc
	kcItupyB9HX749FVbacQU3y2jQN7AOLEGozu4NjruoT2hzcVntrAhN+jrRYPJbfhQnZMs5RN1vT
	5+v+aNpWSt84Ndzgcx7AnfjsEeUL7cTuqBvzIy762ixVIsY70B6P79KSQtcC0/4mdAVY4oisy+E
	vaVH/A28BDrB3w/H94M=
X-Received: by 2002:a05:7300:f0c3:b0:369:f9b6:f486 with SMTP id 5a478bee46e88-369f9b70959mr2828283eec.41.1792951417578;
        Sun, 25 Oct 2026 11:03:37 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm3285126eec.14.2026.10.25.11.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:03:36 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH] NFS: defer access-cache entry and group_info free past RCU
Date: Sun, 25 Oct 2026 11:03:29 -0700
Message-Id: <20261025180329.349613-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nfs_access_free_entry() drops the group_info reference synchronously
while the nfs_access_entry itself is only freed after an RCU grace
period.  The lockless lookup path (nfs_access_get_cached_rcu() ->
access_cmp()) can still be walking group_info->ngroups/gid[] after the
entry was replaced and unlinked, so put_group_info() can reach
groups_free() -> kvfree() under a reader and free the array it is
reading: a slab-use-after-free read.

put_group_info() may end in kvfree(), so it cannot run from a plain RCU
callback.  Defer both the group_info reference drop and the entry free
to process context after a grace period with queue_rcu_work() on
nfsiod_workqueue.  The entry accounting (nfs_access_nr_entries) and all
call-site locking are unchanged; the work only drops the reference and
frees the entry.

On a 7.3 KASAN kernel, a userspace NFSv3 server plus eight readers
doing faccessat() with 2048 supplementary gids, and serialized
credential replacements that detach the previous killer's group_info
reference, reproduced:

 BUG: KASAN: use-after-free in nfs_access_get_cached+0xb8f/0xf80
 Read of size 4 at addr ... by task poc/9552
 Call Trace:
  nfs_access_get_cached
  nfs_do_access
  nfs_permission
  inode_permission
  do_faccessat
 Page last allocated by task ...:
  __kvmalloc_node_noprof
  __se_sys_setgroups
 Page last freed by task ...:
  nfs_access_free_entry
  nfs_access_add_cache
  nfs_do_access

The trigger needs CAP_SETGID in the guest for the setgroups-based
credential churn; the faulty read path is the ordinary access(2) /
faccessat(2) path used by any NFS user.  A negative control without the
credential detach ran 873 replacement rounds and 2.89M reader
iterations without a report.

With the fix, the same PoC ran 3/3 full 60-second runs (~2,863
replacement rounds and ~16.1M reader iterations total) with no KASAN,
BUG, WARN or panic, and POC_RC=0/umount 0 each time.  A regression
covering mount/stat/access(R/W), cached and uncached credentials,
supplementary gids, 20 distinct creds, the cache-size shrinker,
drop_caches and post-eviction accesses passed 19/19 with no kernel
report.  checkpatch --strict is clean.

Fixes: 6238aec83f3f ("NFS: don't store 'struct cred *' in struct nfs_access_entry")
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/nfs/dir.c           | 21 +++++++++++++++++----
 include/linux/nfs_fs.h |  3 ++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -2898,10 +2898,25 @@
 module_param(nfs_access_max_cachesize, ulong, 0644);
 MODULE_PARM_DESC(nfs_access_max_cachesize, "NFS access maximum total cache length");

-static void nfs_access_free_entry(struct nfs_access_entry *entry)
+static void nfs_access_free_entry_work(struct work_struct *work)
 {
+	struct nfs_access_entry *entry =
+		container_of(to_rcu_work(work), struct nfs_access_entry, rcu_work);
+
 	put_group_info(entry->group_info);
-	kfree_rcu(entry, rcu_head);
+	kfree(entry);
+}
+
+static void nfs_access_free_entry(struct nfs_access_entry *entry)
+{
+	/*
+	 * The entry can still be reached by RCU readers that dereference
+	 * its group_info in access_cmp().  Drop the group_info reference
+	 * only after a grace period, in process context because
+	 * put_group_info() may end in kvfree().
+	 */
+	INIT_RCU_WORK(&entry->rcu_work, nfs_access_free_entry_work);
+	queue_rcu_work(nfsiod_workqueue, &entry->rcu_work);
 	smp_mb__before_atomic();
 	atomic_long_dec(&nfs_access_nr_entries);
 	smp_mb__after_atomic();
diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
--- a/include/linux/nfs_fs.h
+++ b/include/linux/nfs_fs.h
@@ -26,6 +26,7 @@
 #include <linux/refcount.h>
 #include <linux/rwsem.h>
 #include <linux/wait.h>
+#include <linux/workqueue.h>

 #include <linux/sunrpc/debug.h>
 #include <linux/sunrpc/auth.h>
@@ -65,7 +66,7 @@
 	struct group_info	*group_info;
 	u64			timestamp;
 	__u32			mask;
-	struct rcu_head		rcu_head;
+	struct rcu_work		rcu_work;
 };

 struct nfs_lock_context {
