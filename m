Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7188C4F4CE8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417806; cv=none; b=d4+CI5cWJFE0wQYmv57WaHq7HWaWUtGKzp+Vs2+RO6hrwigp7SGA7S7NXoKxi6qaOhO3+xT+HJY0JquDW+k+oGmcs0RNLEYxwJYBSuU3k96h9Ost7eLJPKJeyVTtNQq132nAVfTF+Eoni4zRXmuRJHLCZOYmRWbjN6VAcy/tDSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417806; c=relaxed/simple;
	bh=mrAS8F2+28qGCNLp50PxVrDYefFqK+LB1R+oI6CY7E4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uY5OGxiBTlXpc48Lx00/ac7DQPNiHXQ+utMjIL4Qcx0NTLFZnz8lirpthxhEIuVMug+KX9dhlLYM43pPnW1u988eciTqfyB2e22o9GPQPNEidRZPDNU0D39FSeIxv41qFcP2kLuIoACnoXHTg8Am04fx9dS+5G8yIEQ7adDahnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGpCfEDY; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGpCfEDY"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1704637a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792417804; x=1793022604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDmQIm+N7Da6j83Yqrg/UI5yb0CX5Q6JMZKoKt0rve4=;
        b=YGpCfEDYNhIUevLk5n7+LoPAfGsmUxKeAjHq0sSn0lSRq5CPc62cqsyV1E3eF4skmJ
         kuG9ccS6WwIu8WTvrG/gdocucmiE2kR1IuWghZMpoykqbGSNspGBWWC+0JaNFUW++F0Q
         zRs0+IxRSwvN0LSdBb0tVCPajt78Qi3+lUVacFOQQ4Nenyuy08nHPgk5o0UG4RbQ+NZW
         43+EzUAb+vdTAPFN9FWgRQYaCdtcll6OUm3sTG+KWPhsg4pSMMibNS4lpqhnNORhJjQr
         nKNACHGy+FRNjJyLPphc5O8U2vVETC54D8LSSc6Epj1H/YxWcU8X7Vb17Y/KURpTq9RB
         xIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417804; x=1793022604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDmQIm+N7Da6j83Yqrg/UI5yb0CX5Q6JMZKoKt0rve4=;
        b=adRYB5MXKG4dsYlVSt+sG/PHSEBqtV+O4ISlYMPg8kp7jxxyV6c1bc/NtDo+t06dps
         1fJU8OcR5yXeT+wRZBDcMKZivCW6eVxbL0EMP6rlbExWqyJfL5ndExPTQVBZ4E5s9LhB
         ANv9UE5VtSocse/rvTQWXlsIVglnFUWZN3mT2f16LYtIEjznprFDEsK5uBZbeuwvEsb4
         jkzVeJPPBHqZPfj8ZIreK0rTBPQCihmbptm4HxMdCIzLO5EL2q+MkUxGRKCwJNZnZRbB
         6nv+h4uNB29a86UcyaNRQEF0nv9SVNAbZns6a9YaWf2VRRz1y9XncujH1Vw1Pss0FANQ
         sHAA==
X-Forwarded-Encrypted: i=1; AKwUvBziLldyWaisU80JX4As1F+U+Su/Stm2Q5gqK7Bef4VvgmmtxjZdWm+oUClzA00hSw6pE2PBo1uHJUXilnk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJah8/ab/pPHSmxalSioiXbcLbit+yo4n9b6QdEr0AOvevSgLjl
	KKlva2ZowhUPz9bhLdO1H/gVI13eEW9lVALQcAaOMJZKjYmZ6IGXZBY1
X-Gm-Gg: AYBFou1sXXzpz1CnjWkrAzlIaDifWzpbar2G9InLgz8bdyaJ1zgCsgJ3bKMK79ErYb/
	P3UAMl+ErtiN0Ui1yQJOkR0fH8baPzgBWG8LgX72DaftFidhjI6SmIegTLjbUtD40JsZFjbIJ31
	3nrD285ca33lt8UQ6JaFWqEnln5DXU/ln8JWcmmuDTARWh+yKfArthVIuMC/LalLuZge3TgTCfh
	6ViouyfKr5STEwEIxHrZO0YWQdqNiGyze9eP64TfMZwHZKYLS8txJViV2Hk/z73QiOgJXor5ffI
	icgCk4L1avgvfhu9zL4lUmIPf/dnCBlfs2firf/DcVryNPBPuXdaBfW4Llweo5G93RrotvPc1z+
	rzB82QL5lCutbSKxDksjP/+ZAkutatBwWNNVhUU/W/ElLWIaYBdq6ogs+ToHRyOcHdOXs16qyST
	3bFY7qlt5Cx8s5C6SjgVa78eQa5SZmRPCYpa3th4JJl2O9nLON0485TxcD+PlMs3/pEw==
X-Received: by 2002:a17:90b:3892:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3aceefc176fmr7701283a91.11.1792417803488;
        Mon, 19 Oct 2026 06:50:03 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad42878d72sm2792278a91.5.2026.10.19.06.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:50:03 -0700 (PDT)
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
Subject: [PATCH v2] ocfs2: Cache the mount context for dentry lock callbacks
Date: Mon, 19 Oct 2026 21:49:56 +0800
Message-Id: <pm-ocfs2-objects-candidate-0012-v6-17b58652a3505eeecb0c@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
Changes in v2:
- Preserve the existing iput-before-unlock order and cache the mount context
  in the lock resource's existing l_priv field instead.
- Recover the containing dentry lock with container_of() and remove the
  inode-dependent mount-context lookup.
- Correct the comment describing the dentry lock's inode reference.

Link to v1: https://lore.kernel.org/r/pm-ocfs2-objects-candidate-0012-v5-a0413a339b72c02fc885@gmail.com

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
index 6bc4a21cf5f0..d12635c4db95 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -57,7 +57,6 @@ struct ocfs2_mask_waiter {
 #endif
 };
 
-static struct ocfs2_super *ocfs2_get_dentry_osb(struct ocfs2_lock_res *lockres);
 static struct ocfs2_super *ocfs2_get_inode_osb(struct ocfs2_lock_res *lockres);
 static struct ocfs2_super *ocfs2_get_file_osb(struct ocfs2_lock_res *lockres);
 static struct ocfs2_super *ocfs2_get_qinfo_osb(struct ocfs2_lock_res *lockres);
@@ -257,7 +256,6 @@ static const struct ocfs2_lock_res_ops ocfs2_orphan_scan_lops = {
 };
 
 static const struct ocfs2_lock_res_ops ocfs2_dentry_lops = {
-	.get_osb	= ocfs2_get_dentry_osb,
 	.post_unlock	= ocfs2_dentry_post_unlock,
 	.downconvert_worker = ocfs2_dentry_convert_worker,
 	.flags		= 0,
@@ -308,7 +306,7 @@ static inline struct ocfs2_dentry_lock *ocfs2_lock_res_dl(struct ocfs2_lock_res
 {
 	BUG_ON(lockres->l_type != OCFS2_LOCK_TYPE_DENTRY);
 
-	return (struct ocfs2_dentry_lock *)lockres->l_priv;
+	return container_of(lockres, struct ocfs2_dentry_lock, dl_lockres);
 }
 
 static inline struct ocfs2_mem_dqinfo *ocfs2_lock_res_qinfo(struct ocfs2_lock_res *lockres)
@@ -609,13 +607,6 @@ static __u64 ocfs2_get_dentry_lock_ino(struct ocfs2_lock_res *lockres)
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
@@ -623,6 +614,7 @@ void ocfs2_dentry_lock_res_init(struct ocfs2_dentry_lock *dl,
 	u64 inode_blkno = OCFS2_I(inode)->ip_blkno;
 	__be64 inode_blkno_be = cpu_to_be64(inode_blkno);
 	struct ocfs2_lock_res *lockres = &dl->dl_lockres;
+	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
 
 	ocfs2_lock_res_init_once(lockres);
 
@@ -651,9 +643,9 @@ void ocfs2_dentry_lock_res_init(struct ocfs2_dentry_lock *dl,
 	memcpy(&lockres->l_name[OCFS2_DENTRY_LOCK_INO_START], &inode_blkno_be,
 	       sizeof(__be64));
 
-	ocfs2_lock_res_init_common(OCFS2_SB(inode->i_sb), lockres,
+	ocfs2_lock_res_init_common(osb, lockres,
 				   OCFS2_LOCK_TYPE_DENTRY, &ocfs2_dentry_lops,
-				   dl);
+				   osb);
 }
 
 static void ocfs2_super_lock_res_init(struct ocfs2_lock_res *res,
-- 
2.43.0
