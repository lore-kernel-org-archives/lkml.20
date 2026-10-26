Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011963;
	b=yn8AcHBq1LZmtZj4qsT6JaXA9IY7zoBKUjvG4V6hAMv3FJz9gjO2Zt4sMY59TBK0hJIV
	 pK9KvaHR53LokK6POlYJ9aOBKGJ4L2s3VgTstSgivgFNdlfZ6EZqBQpTqMK/PYNcGRfHi
	 1PGsSxYfZictpKGRLsJRJLHLXZWaJUMazLyv5ZqfVlsOEvED/IVS9LJvH50N4sccGrKMG
	 mkbRoQUt1OfdiTH09ODuo4P1KmUMrXPN4vOoKot1XYCh634cDmDK1K6I/1mWg2qpTf5md
	 TmH+HguWhmd/qtndaOaAn8z5BPmsTkvTR5gqc6ESND/RUP0uP9S8npXYFbe+oaiRoqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3Em7THwSHsQndbMmwUsL9yOCeRU0YR5E1djj6NAjXMU=;
	b=AvsBVzbawrdVMHVMjml9QP094vCeJf4QObQn062aeSK7MkR+mGPa8zhjy4+1yiknLweS
	 LBIkiL950EKq0jk5vl7f+/1ZWYl1vlX2dymPiGrlmuiYpPf+OmsT//1JadfbZ6l4ybYGm
	 5KHfmBfCf6b0NQbRfQvzJSbO8EowyUsYO3XqNWT50sFM+kj1bLGlZGp2DJ777gVHxSLxG
	 jfmNBwC7Xr1ai6R0coAlY5s4Ks1fZcizbvmm0Q5T8hGgspTrR+EPMH+mGLw6KjxQN/NzQ
	 0JYw842fnWE0/OzIRegLQXpBLRSYrba6klOr31aw1ntx78/QIuzWZi6TXe///EGD4ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RLJySYeS;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE50F606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE50F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RLJySYeS
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35829219da8so4952361eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793011962; x=1793616762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Em7THwSHsQndbMmwUsL9yOCeRU0YR5E1djj6NAjXMU=;
        b=RLJySYeS0BQzTg9o9qO1xD/c5MAamNT+UD+2xN9Z+O05l/Av3gsWFchNwa7tQatxX+
         c7BuZqBIeWfC4XCHIypjcL12Rf9wShN/qjN8EHf5Sifu5uU5Gu65k5fhjLfDId6s2j6q
         1Bty0VjzgEDUe1SqrhnScGnTOB9bFQ6Wq2OeBeh84Bqe0r6HuhWR0aybhUZb3DrcP95w
         8ieeeWrrrXr/3oQqHJbTuy0aDB2I+E8wrDeXRbT2KsvcC5xbFpS31ds8tNlKwtVf7MFF
         Y9Inrm03hhOEaPsSo7I63KeSFeSCHw91s4Lh8A4k/KT2vApbN3rAruLE9fWZ2OttXAUK
         51sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011962; x=1793616762;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Em7THwSHsQndbMmwUsL9yOCeRU0YR5E1djj6NAjXMU=;
        b=h1NQ48kvwUK6HRCmCJsNGAb+wZHWxqPhhMAsr6dFoVAnqFhZ19aWy7Vd/CpKamRj09
         Ws9LrM1UtrGG9EZ6800LzdCAuhK85endfvB9z0KPB7lwnRMmyLlImwkKQET2w5fR5rrD
         WH7WaLc2x5XDYbtVPD8AdGOXaRf2g+vXkmtz3WlPE5RM5GEQPYhyu1fLOZW7P1IWFrLO
         BDp4qHHxho8/6tPmnWVnEF/fjNeMBVaBmqXE/l65QIpnq9N+FdomuB2Z7DIQG0eRQcTt
         BgxEBdbkQFmrEPeKUJxWL4Dwjn+xfIk1q5cKz+5j9k+UNKzUIrFqKti2otbisp1/kv/B
         DINA==
X-Forwarded-Encrypted: i=1; AKwUvBzdRNdLwOfd9kn3ZfNJUyUoV+t554kn7G7J3x8o5ZyQ5PNiYm82LUbtq6oiSjVvL06uxDX085w590e1btE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmO5vjOOfUQ8mYZuWYuEOYfGu3ZUMsafn8sMH4FgRqLs6vNQUj
	yrEEoOHivPWBXjzjOgnN5FbLL9Tz+bBRBHGwiMUZjeIQvxfFZK0fP1QH
X-Gm-Gg: AYBFou0DZtvJRBcEFkbSzWpNCxp1KDHTldWtt6G4zkY+F2AfTG9gtE+CHkHfoHFmbMZ
	PhNWgsOWBYMxrnxBCf8b7uzujK9qaUMOEbL1OtyoEw4RWrXmynmgpU9N95dbl1fhI7RXd03FCGX
	0lmbee6VAwrv2Ci4OLMTFaSZPzJzFN5mj2iDMh1khOTcmxYo7Gi/zd89uCO+t8iCPZ0t/zqoiSt
	ekOzqzzwfb7oMzfEBP4eB7wdQYxLs6Vb2FVJbcJh1wRQzw3u4t3PL++KPKpFZrupN5ndBcQbpXC
	nnQdqRdlwIgyEzXmAzRKCNmsfX8cI+osHW2fe/am2S6R2udRpGJxHqkHmadRsKBgNUfdsGP9VIN
	FzvsKlXur56kx2uiiPYlF3P7LN7F5CNbwKWmNS1TGupHjz2GStG7AVpUZrYWEzbfPniIrfT0+mY
	ojxO9qe5fVEjjpPBDKwmSqoX2JkQBcSfYei5eDMmX7frVis7R7+bdiKVtU0BwT868t6clsEpJce
	sgM8Qdq0cVVTd/rpRyXNwwCEsRecbxRq576HuU34PbvtHfKlBSs8OLXAD7gtFWS+FApW8lKA1cP
	aavVvuSEp9fFKvmCFTTkws6Oe+bmWX62GQ9doLuj
X-Received: by 2002:a05:693c:69c3:b0:35f:ab1:4792 with SMTP id 5a478bee46e88-369e8484992mr8381446eec.6.1793011961611;
        Mon, 26 Oct 2026 03:52:41 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm33875226eec.19.2026.10.26.03.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:52:40 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] NFS: defer access-cache entry and group_info free past RCU
Date: Mon, 26 Oct 2026 03:52:30 -0700
Message-Id: <20261026105230.1150218-1-teel4res@gmail.com>
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

On a 7.3 KASAN kernel, the following workload triggers the report: a
userspace NFSv3 server plus eight readers doing faccessat() with 2048
supplementary gids, and serialized credential replacements that detach
the previous killer's group_info reference.

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
faccessat(2) path used by any NFS user.

Link: https://lore.kernel.org/all/20261025180329.349613-1-teel4res@gmail.com/
Fixes: 6238aec83f3f ("NFS: don't store 'struct cred *' in struct nfs_access_entry")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
v2: add Link, Fixes and stable tags, and remove local validation details from the
commit message.

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
