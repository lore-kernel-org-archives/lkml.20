Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506361;
	b=uBl+vSpbSDh6Tz1PPn8lnaJ2XBgSvBiPF25VUYJUiqMaAuttsVmkiy2xR4FBqBR0QpVI
	 YiHIAKvyFeMblJyqSURhnfKKvSTBf9VUi9Pi8VEo4Xlg/aQiswdU7buUqoyT3FKyC0Wp5
	 DrpjhvYX/zSbOl1nqD+PKWJiWO9SdniY8L35fKvDqYDKWUtR12dZv5zw6oNDeqrfSbgTk
	 YRVEYexkDpvyj475Hw1Bl8nLz0NNaLBtqxwJIOB27Y3vqK+abwxFF/Mv58/8fynY/W/Hm
	 M1k7Y0u0GDJrZyOzyyHYrKUJdv/hJaEChBJjnz7e6yiCDsek0/Slq9b3V9QNCPYyIQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7RWczmxZUd2zIPBf7cDOEeEN988E+Le0eDxxMs8/MXs=;
	b=iIRZanBvP3C2RqguZGeIHsjiuDiOpa7fPQ23rCF9JYdcx4wVEYZQ7TfYUP8hpnd+GwI4
	 L6bYz0vw3A6kwzSFcWF2dv+a/RF9XicrbAaQIzGns8u3iqVC37Gpb/5ElReLM0LZO46zw
	 uJJBrnf922FdqlHrcruCyVQAl5BFm10Hs6FPvX4MYb/qFNN2scR07HUyraySsXFyACXre
	 pEvBkJ3k0GhE5s60Q68/ms5Mut0nice/vTegxgLjg0DW4oL9Dq0Nmr9mKyAT6G6uA4qxy
	 GBIEC3l2tsbyaiW6fya1fcKBSTUkuA14EeqZxWTfwVzmjfFSoDObCVHF0VO1r8zMWUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eJK8g8Me;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4510606A321
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4510606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eJK8g8Me
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2005251a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506360; x=1793111160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RWczmxZUd2zIPBf7cDOEeEN988E+Le0eDxxMs8/MXs=;
        b=eJK8g8MejqV9x2Hu41kHWeJSeWzsbxg0bL526SOb0HgS+1naaZXq9tqMgKbN2+W2ST
         nCZQ7BusvRl4wWKV/FeDKnCi1JG0MuOeG5/BDhy/U+0Pu+DWZdRPPP8nCgwcdX8CUBVh
         QyZx4zVe1fUcfFDOYyriNtrraHAvgDHNdk8QMY8eaofXwoV7lM8GrwvDO7Cmw4NxrWWR
         knxajiEm5Kal81rC7XB9qjwVqqYnZEi5CEMxzj6o5WqHcbp+mo7LtEnWvK7ZTPBjf4P1
         HrSCN5IBBXaI2+V7iqPW9Ury/tos/G6hAhOeNgvnmvQbZFo0Csf4SMaaq/jQXLV0PAQJ
         XzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506360; x=1793111160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RWczmxZUd2zIPBf7cDOEeEN988E+Le0eDxxMs8/MXs=;
        b=n5oJdSovCmTTOG+8Xt+oz1dmWwxa3riodIOdYODn1F8iWeUhipkaoI2J4zI18iZq3v
         GJSs8e7nkgg2hwf0qVHn3sdC3YGEukEqw3Cv+Ss1PWL674UStSt52AHzNAY7VSbbzIFK
         M7vdrRe90Ro2dI5rYCbzd3hX6iDUxxyuu88jc20AwZEnv4pOLWkP+NQwGmekKFTsQHUl
         qHHNBxYkmVUMjWIeLIPpB4H4dqBc2FG2sepfMIzFR14RmvFYERfSsXUvtFrzC3/Laypz
         aRHZxtG0gTIkHWVQd77ret+dxIu+eQMpG01jAYnGdF08jpcNG8VlZc/oaDew00YCWf/R
         nGPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7mNcmu601GRysfWAW1oM7UoxgCfEN3LbHzqrmk0XVuJsJgdINdPSrFEEP3iCBAh/6a6QwjHXAMqdRu3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjpdvVZXeRjslaL0GuxgM6UFkhRfOSwvbaRTvTABNd38yK7ddR
	dlyGjbMn2LTi84RV3riEnAtA90PBLQSaALmQpkBOAGmLtTnX+YHRGSkZ
X-Gm-Gg: AYBFou25guTsWQKUbvbXGbPzrd8DIrN0r/PpCbpyrw4MluHg3SiLGqIEauF+Zx9Ah/v
	rMeZzv3WkQOlsq04SeTS6bJ2iYjzI/gp8Z4KRRFa04YHUusUcG+8fjYUHmV1cdjTY8AFNLPr6oS
	0VUf1pwW3U7h/nf9b3J55NmgbaY0v0X0NZsInV4Ds/imzpf35Wi0zs+O7JLJhoartzq0Ku/UDn/
	lWrdlYyceBe18Mz2lseytj/h/dl3gnmlq/lGWYpW4Sc2vWKho+oGXC++x7rDKbPPa222egQ5FCt
	Paz59TWdGIQCS7uOUV4KuDbBkljr3At4e2y+cHrbUHDCaBSLzBc8XOkDenpjtJYyAIj+m10/YF9
	FY8/Le8AVjsWilEjJ2yD4czeztHtVznWTlyJjhHzNXbtVK+3oTnzpsQnQ8g83w1psNscRSXp3V0
	1BJQBacCo0Zjm7km87Ku9BuOnUV0J8YYrtMt4K2QbFj3uRYTVBj6J4Z2M3eALngHh7tb9BsuzkJ
	rkv8gaDqordCuibUgf0G0Vs21JkSyqikCLqR2vC1GAqzDIn1JC01FMnr7yZVyY7DcVfWSrN
X-Received: by 2002:a17:90b:5743:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3acef29e7c2mr9107677a91.38.1792506359913;
        Tue, 20 Oct 2026 07:25:59 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm10447319a91.4.2026.10.20.07.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:25:59 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4] ocfs2: cache the mount context for dentry lock callbacks
Date: Tue, 20 Oct 2026 22:25:53 +0800
Message-Id: <pm-ocfs2-objects-candidate-0012-v9-eeb9084fb29577971229@gmail.com>
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
Content-Transfer-Encoding: 8bit

ocfs2_drop_dentry_lock() drops the inode reference before releasing the
DENTRY lock. This lets inode eviction release the local inode and open
locks before a remote unlink can proceed past the DENTRY lock.

A DLM callback can still arrive before the DENTRY lock has been dropped.
ocfs2_get_dentry_osb() obtains the mount context through dl_inode->i_sb,
which can access a freed inode when the downconvert thread drops the
last inode reference in its post-unlock callback:

  Downconvert thread                     DLM callback thread
  ------------------                     -------------------
  ocfs2_process_blocked_lock()
    ocfs2_dentry_post_unlock()
      ocfs2_dentry_lock_put()
        ocfs2_drop_dentry_lock()
          iput(dl->dl_inode)
          [inode reclaimed after RCU]
                                         ocfs2_blocking_ast()
                                           ocfs2_get_dentry_osb()
                                             dl->dl_inode->i_sb
          ocfs2_simple_drop_lockres()

Store the mount context in the DENTRY lock resource's l_priv field and
use the default mount-context lookup. Recover the containing dentry
lock with container_of(), as already done for refcount locks, and remove
ocfs2_get_dentry_osb(). ocfs2_dismount_volume() shuts down the DLM before
freeing the mount context, so callbacks can use it without accessing the
inode. Preserve the existing iput-before-unlock order to avoid delaying
local inode and open lock release until after the DENTRY lock is released.

Fixes: 8ed6b23709b3 ("ocfs2: revert iput deferring code in ocfs2_drop_dentry_lock")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Suggested-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v4:
- Drop the convert-worker change from v3. Keep MAYBE_ORPHANED marking before
  the extra-reference check, including the dl_count == 0 path needed for
  local orphan cleanup.
- Retain the osb cache from v2 and the original iput-before-unlock order;
  remove the incorrect worker-lifetime claims from the commit message.

Changes in v3:
- Move the inode lookup and MAYBE_ORPHANED update after the existing
  FREEING/dl_count guard and successful extra-reference acquisition,
  addressing Joseph Qi's review.
- Keep the osb cache from v2 and preserve iput-before-unlock ordering.

Changes in v2:
- Preserve the existing iput-before-unlock order and cache the mount context
  in the lock resource's existing l_priv field instead.
- Recover the containing dentry lock with container_of() and remove the
  inode-dependent mount-context lookup.
- Correct the comment describing the dentry lock's inode reference.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0012-v5-a0413a339b72c02fc885@gmail.com
Link to v2: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0012-v6-17b58652a3505eeecb0c@gmail.com
Link to v3: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0012-v8-d01e30cb3f465e294c0a@gmail.com

 fs/ocfs2/dcache.h  |  5 ++---
 fs/ocfs2/dlmglue.c | 16 ++++------------
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/fs/ocfs2/dcache.h b/fs/ocfs2/dcache.h
index 7f246c5692d8..046ab9a80769 100644
--- a/fs/ocfs2/dcache.h
+++ b/fs/ocfs2/dcache.h
@@ -17,9 +17,8 @@ struct ocfs2_dentry_lock {
 	u64			dl_parent_blkno;
 
 	/*
-	 * The ocfs2_dentry_lock keeps an inode reference until
-	 * dl_lockres has been destroyed. This is usually done in
-	 * ->d_iput() anyway, so there should be minimal impact.
+	 * The inode reference is dropped before dl_lockres is unlocked.
+	 * Callbacks must not use it to find the mount context during teardown.
 	 */
 	struct inode		*dl_inode;
 	struct ocfs2_lock_res	dl_lockres;
diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index 88d946466083..437a726834c8 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -58,7 +58,6 @@ struct ocfs2_mask_waiter {
 #endif
 };
 
-static struct ocfs2_super *ocfs2_get_dentry_osb(struct ocfs2_lock_res *lockres);
 static struct ocfs2_super *ocfs2_get_inode_osb(struct ocfs2_lock_res *lockres);
 static struct ocfs2_super *ocfs2_get_file_osb(struct ocfs2_lock_res *lockres);
 static struct ocfs2_super *ocfs2_get_qinfo_osb(struct ocfs2_lock_res *lockres);
@@ -258,7 +257,6 @@ static const struct ocfs2_lock_res_ops ocfs2_orphan_scan_lops = {
 };
 
 static const struct ocfs2_lock_res_ops ocfs2_dentry_lops = {
-	.get_osb	= ocfs2_get_dentry_osb,
 	.post_unlock	= ocfs2_dentry_post_unlock,
 	.downconvert_worker = ocfs2_dentry_convert_worker,
 	.flags		= 0,
@@ -309,7 +307,7 @@ static inline struct ocfs2_dentry_lock *ocfs2_lock_res_dl(struct ocfs2_lock_res
 {
 	BUG_ON(lockres->l_type != OCFS2_LOCK_TYPE_DENTRY);
 
-	return (struct ocfs2_dentry_lock *)lockres->l_priv;
+	return container_of(lockres, struct ocfs2_dentry_lock, dl_lockres);
 }
 
 static inline struct ocfs2_mem_dqinfo *ocfs2_lock_res_qinfo(struct ocfs2_lock_res *lockres)
@@ -610,13 +608,6 @@ static __u64 ocfs2_get_dentry_lock_ino(struct ocfs2_lock_res *lockres)
 	return be64_to_cpu(inode_blkno_be);
 }
 
-static struct ocfs2_super *ocfs2_get_dentry_osb(struct ocfs2_lock_res *lockres)
-{
-	struct ocfs2_dentry_lock *dl = lockres->l_priv;
-
-	return OCFS2_SB(dl->dl_inode->i_sb);
-}
-
 void ocfs2_dentry_lock_res_init(struct ocfs2_dentry_lock *dl,
 				u64 parent, struct inode *inode)
 {
@@ -624,6 +615,7 @@ void ocfs2_dentry_lock_res_init(struct ocfs2_dentry_lock *dl,
 	u64 inode_blkno = OCFS2_I(inode)->ip_blkno;
 	__be64 inode_blkno_be = cpu_to_be64(inode_blkno);
 	struct ocfs2_lock_res *lockres = &dl->dl_lockres;
+	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
 
 	ocfs2_lock_res_init_once(lockres);
 
@@ -652,9 +644,9 @@ void ocfs2_dentry_lock_res_init(struct ocfs2_dentry_lock *dl,
 	memcpy(&lockres->l_name[OCFS2_DENTRY_LOCK_INO_START], &inode_blkno_be,
 	       sizeof(__be64));
 
-	ocfs2_lock_res_init_common(OCFS2_SB(inode->i_sb), lockres,
+	ocfs2_lock_res_init_common(osb, lockres,
 				   OCFS2_LOCK_TYPE_DENTRY, &ocfs2_dentry_lops,
-				   dl);
+				   osb);
 }
 
 static void ocfs2_super_lock_res_init(struct ocfs2_lock_res *res,
