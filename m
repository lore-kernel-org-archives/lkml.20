Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEDE367B84
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791133508; cv=none; b=Rs+EY03Pt5llo354dxcN6YMNMoprfeF5LxHW1YeBR0Gl6jZxl7TxDnc4Kt8WqMyh/TB9EWIDgzOb9EatdJEFhj3HILkbdYSKJewgPRqQIhg+rsnxwteqWSiguKkIRR5Z6cZZlBAgP8io4TDeokXFY27Thc/Gt99o/MV3tmG20oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791133508; c=relaxed/simple;
	bh=ZcoT708BopTBYbaD94/jarqA1iLKs5fgAXUjYW6yIfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gdINFYHNFXBGg74JZLNEu0dFpGi+PvfRv7a7UlPEsp+KB772sbUvJvB49P4xyjOsUShr8EzV1ufoXky5pqept6MeE6CodfnhOPWZofOdnOPGo547ks4S4lSVtlkJEao2FuqXIaC1bdQuh7gTvc8K3soXn3ArVys13Nu87rrUk24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=md7lMMHc; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md7lMMHc"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso398629a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791133507; x=1791738307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQ6hfrRhV924+ySu7XC403bWMbHO9La3En6qCzc3AsI=;
        b=md7lMMHcBcBIfZwas9gjNBt4LmSPrOgT7meA+9/ovXtuR41SZGm9If2sOuMST+RyMp
         FamUC/q0aAYYsnlf+ZIvw3KU9TL77J5t6ikTTCatUnqhNGnP2jnDeLkK7MrM5C9Izhu2
         6Ou+OQBD0w1T8W4FZII5GOnch/kxNSuWXrprf/pCu482Jvsg6BV0bGoisbhD/4Uc6CTg
         hthg9tkdLqmfgbsnOgstfQ1pAA55QVVo08aNjh3iKMBu/yfRHEWx0VADXFtOGY+9W9ln
         YjogGEyG2FPs5YEYO6+PG21TMN1jOFZ849NXeohZEHV7iQx4Buw6A8C/pdSM/tF+gA8M
         9+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791133507; x=1791738307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQ6hfrRhV924+ySu7XC403bWMbHO9La3En6qCzc3AsI=;
        b=I2p8HcSCKggum9BSTGlmgYTvKsoWtfB2iinPtsVHUNHlUEzC+9mhrtelvdxIsxFB/X
         oK/NvfCONjRQjBVgCzwOkU/8XBlGnmZXtN8EFj5M7mjZVffYO5bOVfKomDpa2bHVgK5Y
         BWaeKAPQDhYGXzli4HvXnAeW6B57JP6KdPRq2Sz9k7dEXWg24HqNknLW3YIFaAlcTIjO
         iWMvOzP6dkK1ACyogFf2JHi2POF8eEuRmpDi9AM6ypKlQk0d2chdfOjSq+64a8YFXyk0
         rOVq0tw/DeTN5bU2SoaNvVMUzAST5+W7KN1Qckxw4CtYl9l+tgcOcPf5LL9FoYf2Fm8J
         mf0g==
X-Gm-Message-State: AFq9FYJWAqrgVbIsQFNE3Ld14GL1zArZV0wbpthxFvA+WziwykT+lJUB
	rCJB6zcUEQJDfiJKcuujjEEtOLSOjv8pJ2hww9DuYc+0Jucunb/wM2Yqqi5MOg==
X-Gm-Gg: AYBFou3IPuDTqUVI1fivQP301ZVvJWg22uMXAfbfnEkzA4vEkrqocd7cIay5m2PjJel
	SQp19BEQ1orXok+yX31wtRuDgDrbWJUQGNfGEjuG9jR+kY//PqvBwjyqnsaq7NdNvhQomOFLQA1
	3l4LI9MVb1Z1M2J9iJdB1Grl5bpx886MZHeHIHNawsV+M7z8Xv3gx5kYzqI7NdqxJZvlUVwlR33
	NKQ+G8JzKdtaydQlpI7hY490nIvX2CikrinZFMI4hUYg8wrqahnqSv48tNEWYbjaRr7gmBlI3OX
	RjxkXjtZpCgVWDS74O1g6apv6pk4nAZpTUnjtKW6oxkqaAbBEPEVdvKjaFifXm/IEWGL3zVbHCc
	9kAFWMIFLHrt/s/6pVY6n1wBulT0xqQLjvlEjiw8RkbV5pUVhLvdWi5mXB/n11lWGYWg6YMLxlj
	sxzM5YsZ2dycNpher28vOyqa4kmZODdn2vpzdLxiseRybUpRotK4aKC+DcBMV7hNuYbObivCasm
	rCqVz8OAL110rImyVxbpSZAJnNz9cn8OODZDc1gDm0D68iiO1nydjARzjkf+QjwEimuE0Xn+Aoe
	sZs9JizVOdRSJR0=
X-Received: by 2002:a17:90b:4f84:b0:3a7:ee74:e8d2 with SMTP id 98e67ed59e1d1-3a7ee74eac6mr562437a91.25.1791133506575;
        Sun, 04 Oct 2026 10:05:06 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e48dbc2sm7250750a91.10.2026.10.04.10.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:05:03 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: convert inline quota files when turning quota on
Date: Sun,  4 Oct 2026 17:04:56 +0000
Message-ID: <20261004170456.4104287-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

With a block size larger than 4KB, the inline data area is large enough
to hold a freshly created quota file (quotacheck writes 6KB), so
aquota.user/aquota.group stay inline after quotaon. f2fs does not
expect quota files to be inline, and this causes two problems:

1. Quota file corruption. f2fs_write_single_data_page() sends quota
   inodes straight to f2fs_do_write_data_page(), which sees NULL_ADDR
   for index 0, treats the folio as truncated and drops it. Updates to
   the quota file are lost once the folio is reclaimed, so the quota
   tree reads stale data: chown/chgrp fail with EIO and quota entries
   of users disappear. For example, the kernel log shows:

     find_free_dqentry: Data block full but it shouldn't
     qtree_write_dquot: Error -5 occurred while creating quota

2. Deadlock. Writing a quota file past MAX_INLINE_DATA converts it from
   f2fs_write_begin() under f2fs_lock_op(). dquot_transfer() is called
   from f2fs_setattr() with f2fs_lock_op() already held, so chown/chgrp
   take cp_rwsem for read twice and hang, together with the checkpoint
   and every other writer, once a checkpoint waits for cp_rwsem in
   between (seen with generic/232).

Quota files only grow and there are at most MAXQUOTAS of them, so there
is no point in keeping them inline. Convert them in f2fs_quota_on() and
after dquot_quota_on_mount(), which keeps every block size on the same
path as 4KB blocks, where quota files never fit inline. Quota sysfiles
are created by mkfs with real blocks and are not affected.

Fixes: d7e9a9037de2 ("f2fs: Support Block Size == Page Size")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/super.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d683240040f..bb4d22694b8 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3321,15 +3321,42 @@ static qsize_t *f2fs_get_reserved_space(struct inode *inode)
 	return &F2FS_I(inode)->i_reserved_quota;
 }
 
+/*
+ * Quota files only grow and there are at most MAXQUOTAS of them, so there is
+ * no point in keeping them inline. Writeback of quota files does not handle
+ * inline data and would drop what was written to them.
+ */
+static int f2fs_quota_convert_inline(struct inode *inode)
+{
+	int err;
+
+	if (!f2fs_has_inline_data(inode))
+		return 0;
+
+	inode_lock(inode);
+	err = f2fs_convert_inline_inode(inode);
+	inode_unlock(inode);
+	return err;
+}
+
 static int f2fs_quota_on_mount(struct f2fs_sb_info *sbi, int type)
 {
+	int err;
+
 	if (is_set_ckpt_flags(sbi, CP_QUOTA_NEED_FSCK_FLAG)) {
 		f2fs_err(sbi, "quota sysfile may be corrupted, skip loading it");
 		return 0;
 	}
 
-	return dquot_quota_on_mount(sbi->sb, F2FS_OPTION(sbi).s_qf_names[type],
+	err = dquot_quota_on_mount(sbi->sb, F2FS_OPTION(sbi).s_qf_names[type],
 					F2FS_OPTION(sbi).s_jquota_fmt, type);
+	if (err)
+		return err;
+
+	err = f2fs_quota_convert_inline(sb_dqopt(sbi->sb)->files[type]);
+	if (err)
+		dquot_quota_off(sbi->sb, type);
+	return err;
 }
 
 int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly)
@@ -3534,6 +3561,10 @@ static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
 
 	inode = d_inode(path->dentry);
 
+	err = f2fs_quota_convert_inline(inode);
+	if (err)
+		goto out;
+
 	err = filemap_fdatawrite(inode->i_mapping);
 	if (err)
 		goto out;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

