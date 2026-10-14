Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDFE1A6839
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947214; cv=none; b=sHXRrm9igO4LyJL7EIreI41kH5gNuh2VR7fDlM9TiVDH1DQvVpj2im0NOo0M3vedIeM6CnjQdynlHjQpOMaBTLvwIfrR751d1nfvUqsKjvpFw9dYlTzcVsG0HQXqhmwmFs24UmULo9VLaZWCAk8iOvb9kj4+F1CMPUSeOLkoLq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947214; c=relaxed/simple;
	bh=GC1rMDpuJp1g2HZIOokkpC4pPzkxXMK463WUte3cUYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tByRoe2KbYnOXfxzlJH6eJVoReNTk5AYjnJU3S1eZOx638sayPnkoZVVf/my4axLcHgVOhHQCtj2er+Yrt5wAbp6NCDIbz0HaxOQjIK6tzizJUcDiYyiViYedoeT5BtCXSnGoRKohexvkhtAdVHaKEGnqQMMbZqGwVa588v2JDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJA86wkm; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJA86wkm"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so1963338a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791947213; x=1792552013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kuk32lWpMV6ZwKFcz9qRaaCn7MtYw/EVPpC7v5/C/V0=;
        b=QJA86wkmAD/XTNd3G4P9cyhghaliFj1jQQWevdH8c6w3E9UdSdkdvct4ygOOVEsidv
         wVQ08zmtK9FIhx/lZbAjmn7kFHNQMr1pCFbTN2Cf4yRXV4fcf4frne3yhTiDxZ2q47cf
         v4bST8QCJ/BFSMBNXp2LUfPT3cQXNhQdQw8sUa9goxvh3txBHp3pcoVDQdehUVD8vGB9
         bLvnpQwwH2YzaXlnMIgVgmVw3PDEcmzOtd5tmW/UwwrLp7qCNt3eOGtFaGLKi9tY2USW
         2AxUY4M8SPS0ZDfR4UXjFHZXqzObMpjX/xMLsZtgGc49/GUfYjPJXt4t/vuITWoAyazy
         CYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791947213; x=1792552013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuk32lWpMV6ZwKFcz9qRaaCn7MtYw/EVPpC7v5/C/V0=;
        b=CTnVIc9Fh/pF/vpxMW269QOmWozhRqJwsSw223uKaU19JvT8x1xt8wd0HqPrqf5kGx
         0hEPTL0j+PyNwI19S0DYGpys5+686DxRzJ5IXhIjnGmWJuAWwI0nlmNBNsX123CGRVvW
         OGWWieqL2/7rymoiRQdADMMTsKpudj1qF8AZLfdWjIxNCR8+NWTnHeFenN0Mxa6KgeVK
         HGvZAq8lahog2K0L2cVj2exe1FOoGGYf+K3IRHmwED2SR19Clh1R3JoJfVPpHb9uQTDj
         vLCr1zO1ZVpPXNUVegAvwD9DdW0WxHH/xIkzANYL2s39lMD1BswN5V3PL0jVhZc2K+dg
         WDrg==
X-Gm-Message-State: AFq9FYKPSImWYiA4QLATtg1+pL5OwXNEdf8gd1YHE9NnIWPLlKAMZJCF
	Vl9zTxr8Mpu5c61Aaowzcm+kYqsdSPKYwCgrNdG4ePtXbXbtwVuInXrhq6FUjA==
X-Gm-Gg: AYBFou2Q5sZBsGtI5raHYHAg7jHA2l5Cq+gAhzM7bBg3lJ1SmppOtAEyeRCNi+DRmJO
	0d2A1Am/B4HUjZC2eyxw1n36FI9rnPNkGNAtxf8Dr43Sm5t7mUChJxB8KsBtUZLzyhDkQscf1c/
	inJyGZ1YGy/t0oGMer3e1k+6x2DQ2KYkaFxqO0zxAKRTJgc8A/LSwfxbhJu+1dJ2SwiO3kdR93J
	L3B+bDnzeDqZooWR2vEpNWkR46VmDGaIzaq2IAkD7VpSl5HgyzMZErHbo1TyBNDqW0W6hT9mlhj
	j000YWZZJbNkW0DxklE1kcjEaZ6FpM3Aol3G5NQTWdgQQ7PnvmRNtUDl5LXUxp6VB2Uiv4t4XSe
	yO9626Ok2Af9odJE5SIbnTXhE9nU3Ox7CWqcIRVgf7RQYdIS6NGS4yeXNUnBqa5Y8PhWTvxGVR7
	Ls/FY10Moyc76n5exb0QleU/l/LAoNu4NkKIgct9v/jJxDjYDO4jgeEV2ac2imgNZnkD2lpZm7r
	Q6BwVqh0hoOf+2FcFkZdARqzkwuG71awnLCM9jS+dpT8rsU7Dqb8PsMOu1TXbmqePDgE+L27fs0
	NrXjihmiGwNo1cYZ
X-Received: by 2002:a17:90b:258f:b0:3a6:dc51:cce9 with SMTP id 98e67ed59e1d1-3ab3a96634dmr11835182a91.57.1791947212597;
        Tue, 13 Oct 2026 20:06:52 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm2112139a91.17.2026.10.13.20.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:06:51 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: reserve space to be shrunk during resize_fs
Date: Wed, 14 Oct 2026 03:06:46 +0000
Message-ID: <20261014030646.662661-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

f2fs_resize_fs() checks whether there is enough free space for the
shrink, runs a dry-run GC to migrate blocks out of the target range,
and then drops gc_lock and the cp lock before freeze_super(). During
that window, other processes, including root ones that are allowed to
use root reserved blocks, can still allocate the free space, so the
second check after freeze_super() fails with -ENOSPC even though the
first check passed. This is easy to hit when the shrink is triggered
on a live, busy filesystem, e.g. by an updater at OTA install time.

Fix this by reserving the space to be shrunk once the first check
passes. Add resize_reserved_blocks and deduct it in
__get_available_block_count() for all callers, like
alias_reserved_blocks, so that no one can allocate the reserved space
until the shrink is done. The reservation is released together with
the user_block_count update on success, or on any error.

Also factor out __get_available_block_count() and use it in
f2fs_resize_fs() to share the available block calculation, which takes
alias_reserved_blocks into account as well.

Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h  | 18 ++++++++++++++----
 fs/f2fs/gc.c    | 41 +++++++++++++++++++++++++++++------------
 fs/f2fs/super.c |  1 +
 3 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 089a62c054e..6b9e1d0e71c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1897,6 +1897,7 @@ struct f2fs_sb_info {
 	block_t reserved_blocks;		/* configurable reserved blocks */
 	block_t current_reserved_blocks;	/* current reserved blocks */
 	block_t alias_reserved_blocks;		/* reserved blocks for device alias */
+	block_t resize_reserved_blocks;		/* reserved blocks for resize_fs */
 
 	/* Additional tracking for no checkpoint mode */
 	block_t unusable_block_count;		/* # of blocks saved by last cp */
@@ -2666,16 +2667,18 @@ static inline bool __allow_reserved_root(struct f2fs_sb_info *sbi,
 	return false;
 }
 
-static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
-						struct inode *inode, bool cap)
+static inline unsigned int __get_available_block_count(
+					struct f2fs_sb_info *sbi,
+					bool allow_root)
 {
 	block_t avail_user_block_count;
 
 	avail_user_block_count = sbi->user_block_count -
 					sbi->current_reserved_blocks -
-					sbi->alias_reserved_blocks;
+					sbi->alias_reserved_blocks -
+					sbi->resize_reserved_blocks;
 
-	if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, inode, cap))
+	if (test_opt(sbi, RESERVE_ROOT) && !allow_root)
 		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
@@ -2688,6 +2691,13 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
 	return avail_user_block_count;
 }
 
+static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
+						struct inode *inode, bool cap)
+{
+	return __get_available_block_count(sbi,
+				__allow_reserved_root(sbi, inode, cap));
+}
+
 static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
 static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 				 struct inode *inode, blkcnt_t *count,
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 926e6976bc2..5bfdaeae794 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2374,6 +2374,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	struct f2fs_lock_context glc;
 	struct f2fs_lock_context clc;
 	unsigned int secs;
+	bool reserved = false;
 	int err = 0;
 	__u32 rem;
 
@@ -2425,10 +2426,17 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	f2fs_lock_op(sbi, &lc);
 
 	spin_lock(&sbi->stat_lock);
-	if (shrunk_blocks + valid_user_blocks(sbi) +
-		sbi->current_reserved_blocks + sbi->unusable_block_count +
-		F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_count)
+	if (shrunk_blocks + valid_user_blocks(sbi) >
+			__get_available_block_count(sbi, false)) {
 		err = -ENOSPC;
+	} else {
+		/*
+		 * Reserve the space to be shrunk so that no one, including
+		 * root, can allocate it until the shrink is done.
+		 */
+		sbi->resize_reserved_blocks += shrunk_blocks;
+		reserved = true;
+	}
 	spin_unlock(&sbi->stat_lock);
 
 	if (err)
@@ -2442,29 +2450,32 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 out_drop_write:
 	mnt_drop_write_file(filp);
 	if (err)
-		return err;
+		goto out_release;
 
 	err = freeze_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
 	if (err)
-		return err;
+		goto out_release;
 
 	if (f2fs_readonly(sbi->sb)) {
 		err = thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
-		if (err)
-			return err;
-		return -EROFS;
+		if (!err)
+			err = -EROFS;
+		goto out_release;
 	}
 
 	f2fs_down_write_trace(&sbi->gc_lock, &glc);
 	f2fs_down_write_trace(&sbi->cp_global_sem, &clc);
 
 	spin_lock(&sbi->stat_lock);
-	if (shrunk_blocks + valid_user_blocks(sbi) +
-		sbi->current_reserved_blocks + sbi->unusable_block_count +
-		F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_count)
+	/* shrunk_blocks is already accounted in resize_reserved_blocks */
+	if (valid_user_blocks(sbi) >
+			__get_available_block_count(sbi, false)) {
 		err = -ENOSPC;
-	else
+	} else {
 		sbi->user_block_count -= shrunk_blocks;
+		sbi->resize_reserved_blocks -= shrunk_blocks;
+		reserved = false;
+	}
 	spin_unlock(&sbi->stat_lock);
 	if (err)
 		goto out_err;
@@ -2510,5 +2521,11 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
 	f2fs_up_write_trace(&sbi->gc_lock, &glc);
 	thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
+out_release:
+	if (reserved) {
+		spin_lock(&sbi->stat_lock);
+		sbi->resize_reserved_blocks -= shrunk_blocks;
+		spin_unlock(&sbi->stat_lock);
+	}
 	return err;
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d683240040f..28e49e8d71e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5345,6 +5345,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->reserved_blocks = 0;
 	sbi->current_reserved_blocks = 0;
 	sbi->alias_reserved_blocks = 0;
+	sbi->resize_reserved_blocks = 0;
 	limit_reserve_root(sbi);
 	adjust_unusable_cap_perc(sbi);
 
-- 
2.56.0.385.gd3acb90ef8-goog

