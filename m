Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26AF57C9F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720865; cv=none; b=hCmTSO5X7c123J8lqTKfKn0tbRRRxpXi+pY6dw3nYDZDlq2+iWykdfLr15O9tAELr4FzE3zGHRGFF40JorJhpM8MA5LBfFygMcpaxJM4t7vzTmCJ4efhHxrOQ0bK+dXLTUaJY4kmdwSSu8lBZBvAWbkXyzCmHtEaSE3Vo9wIfMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720865; c=relaxed/simple;
	bh=jJn91aodMj/ywR9F01grlpxLPS/rpmD2XwxYG0rDeLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cmu+2cwvM+IS/LaxoFFOZsaac2sDMgKqsBC/jbM3UeSgdDTca2qLAxoiw9a3RlYV/cKpoUzHLP+isSqTndpTMDMlY0cBUE0OOQ7qQKsen/4DgGpwtk6TCvkOuo3RYKHFnsi72rPgIdYO4Uu1XRkqJdRDcICiV5RNmI6+esm2tDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfrzn4e0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfrzn4e0"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso441227a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789720863; x=1790325663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wsXVXVuJdv5wBUtq2F3KswaK2ghGLUk+j2BrYbmK/Jk=;
        b=kfrzn4e06o9bj2BbFFWT3BqtoukuhnXY8mo6uO4AbgBZ0MKj8TRkM+RRs4KUoUn4+j
         X4FyXCKHpXFp7UCuIPmDVSioK9Q0WI/81ehknPSdjG5ticPrItPmJn5rXPMOAoOMh10T
         PNO6FldisybWW7VKb3PHd5CAktyGwqJs7tj8JYkRppQgrYsBrkRIQyM4uJqrkxnoMZIo
         aA/T0fdcFnEcIxekz3JNgq6lVL/1OIzAaPS1JRGu3aiu9lQSD3I1FAtLkbiOmjG2jWAS
         9urckif3GsHiRmzxlIT53k3PcVg3pIAu+tlzJVxLUrZFbXjqjuUCXNVoimTIbE8ekQmz
         g3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720863; x=1790325663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wsXVXVuJdv5wBUtq2F3KswaK2ghGLUk+j2BrYbmK/Jk=;
        b=FrieqB/hg8wqbWg0qUo2ypvkHl5u9yEdMxDeNFoypyEwqU7BLP+1VskvCHHPdHbUOw
         wI3O07IDxD4WeKusF5fVEUiS2zweDeg/NGTmhW5I0GbU6AgXFmhOqyr5AvHYvDzsLUFj
         29YSemmUfHAR0C9kmPoDdMSJZoRV98r+02ZZRTsKvy3rhP7npY/wMKRY3ewAUHRDkfN8
         pkmp44dY4Azlnvo7JK6uIpSi3CLJaJLw7OOjD8LKuTgmyHX7dIq8aBM090ZWCsk5PqRk
         gc3lDoAeCpaOM28mKtS5VonF8mav2SY675KdF/d6O+OVcaKAkeLHc+D0Py+yDSgixS1A
         ckrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGGlHjvWqjowbAXdFOzajSJB9ccjv6SMwFrWbq7grbys8e+CSR016kcMo6sDLyhkstRxu2BWRFFI2FYrs=@vger.kernel.org
X-Gm-Message-State: AFuF++nz434E3eIOCLIM1CTPLaiginavyuuY71VTeNL5OAZUv8JQuaq7
	A2j9QlmEYf8E6NzCKjHRC5Ja+aMwrcg1rnTrXONoL5ysYh8W61Q7BZtH
X-Gm-Gg: AYBFou2KbyJdY0pqet/66odhO/u8Rt1L0vtWLuOxEhpQUFblB2Ik++vxsWGhUDUnjny
	+nWmYaz0ZuzU7Q6t1V0Seh40P6uUT3PlGh5WYsd2d2pCh3HeB27IiUaLB70C17/O6vqb2+AJZz6
	j3mFzxOwjz/tLW1MzBP1CVJtzMG6V6bp9YdXAzbZ6SjCvLIuRyjj0gj+7YA/c8T05BarbpQCDEd
	3utJUu8s/Zi2tY11VATWHNx/ZyNS7GwQyU3H7oITl0X4xRcBqb4Cqn2TV4Mb0MVA2Z4PdlIxpyl
	9W7P/TNxGfYBmoB27fKEYjLdwXIJp/9A5Si5ysC3lIGaujTfI1Q802lRZ/yUZ0oeoxeeWlqaPO1
	QJz1Z+jAk+ej37eXQabtGH3RjPsPvaYW8UAh+lLYHqDicAqsfru/to7rbwSsrAfjmmupd+rxZWl
	3Mopq+jeyBN6BcmAdI1qqXpAKyVzF0rQ58Dxoi2UC+hTjxkrRugwX/nuPoQEBMJojThI7yGujmi
	FqVxO16buqE75SZD8Lyqw2WMZQozTcO
X-Received: by 2002:a17:90b:518c:b0:39e:3554:4d0c with SMTP id 98e67ed59e1d1-39e54d38b01mr8032969a91.2.1789720862877;
        Fri, 18 Sep 2026 01:41:02 -0700 (PDT)
Received: from thangnn-Dell.vingroup.local ([202.60.105.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a3e3fd4sm2125644a91.6.2026.09.18.01.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:41:02 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH v6] hfsplus: validate b-tree fork extents at mount and inode read
Date: Fri, 18 Sep 2026 15:39:45 +0700
Message-ID: <20260918083945.918170-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate fork extents during inode reading and mount time to catch
on-disk corruptions early, returning appropriate errors and marking
the tree as corrupted.

v6:
 - Move fork validation logic into inode read fork function.
 - Refactor extent validation helpers, use volume_blocks, count == 0,
   and introduce HFSPLUS_EXTENT_LAST_IDX named constant.
 - Return error from hfsplus_inode_read_fork() to allow hfsplus_iget()
   to catch on-disk corruption and propagate error correctly.

Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 fs/hfsplus/extents.c | 41 ++++++++++++++++++++++++++++
 fs/hfsplus/inode.c   | 65 ++++++++++++++++++++++++++------------------
 2 files changed, 79 insertions(+), 27 deletions(-)

diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index eb7c11524d18..737cf113f215 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -16,6 +16,47 @@
 #include "hfsplus_fs.h"
 #include "hfsplus_raw.h"
 
+/* Index of the last extent in the fork */
+#define HFSPLUS_EXTENT_LAST_IDX 7
+
+static inline bool is_extents_btree(struct inode *inode)
+{
+    return inode->i_ino == HFSPLUS_EXT_CNID;
+}
+
+static bool hfsplus_extent_valid(struct hfsplus_extent *ext, u32 volume_blocks)
+{
+    u32 start = be32_to_cpu(ext->start_block);
+    u32 count = be32_to_cpu(ext->block_count);
+
+    if (count == 0)
+        return start == 0;
+
+    return start + count <= volume_blocks;
+}
+
+/*
+ * Returns 0 if fork extents are consistent, -EUCLEAN if extents
+ * past the first are corrupt, or -EIO if the first extent is corrupt.
+ */
+int hfsplus_check_fork(struct super_block *sb, struct hfsplus_extent *ext, u32 volume_blocks)
+{
+    bool non_zero_seen = false;
+    int i;
+
+    for (i = 0; i <= HFSPLUS_EXTENT_LAST_IDX; i++, ext++) {
+        u32 count = be32_to_cpu(ext->block_count);
+
+        if (!hfsplus_extent_valid(ext, volume_blocks) || (non_zero_seen && count == 0))
+            return i ? -EUCLEAN : -EIO;
+
+        if (count > 0)
+            non_zero_seen = true;
+    }
+
+    return 0;
+}
+
 /* Compare two extents keys, returns 0 on same, pos/neg for difference */
 int hfsplus_ext_cmp_key(const hfsplus_btree_key *k1,
 			const hfsplus_btree_key *k2)
diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index 2ce6de574fa6..57fedd0e80fb 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -559,34 +559,45 @@ void hfsplus_delete_inode(struct inode *inode)
 	hfsplus_mark_mdb_dirty(sb);
 }
 
-void hfsplus_inode_read_fork(struct inode *inode, struct hfsplus_fork_raw *fork)
+int hfsplus_inode_read_fork(struct inode *inode, struct hfsplus_fork_raw *fork)
 {
-	struct super_block *sb = inode->i_sb;
-	struct hfsplus_sb_info *sbi = HFSPLUS_SB(sb);
-	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
-	u32 count;
-	int i;
-
-	memcpy(&hip->first_extents, &fork->extents, sizeof(hfsplus_extent_rec));
-	for (count = 0, i = 0; i < 8; i++)
-		count += be32_to_cpu(fork->extents[i].block_count);
-	hip->first_blocks = count;
-	memset(hip->cached_extents, 0, sizeof(hfsplus_extent_rec));
-	hip->cached_start = 0;
-	hip->cached_blocks = 0;
-
-	hip->alloc_blocks = be32_to_cpu(fork->total_blocks);
-	hip->phys_size = inode->i_size = be64_to_cpu(fork->total_size);
-	hip->fs_blocks =
-		(inode->i_size + sb->s_blocksize - 1) >> sb->s_blocksize_bits;
-	inode_set_bytes(inode, hip->fs_blocks << sb->s_blocksize_bits);
-	hip->clump_blocks =
-		be32_to_cpu(fork->clump_size) >> sbi->alloc_blksz_shift;
-	if (!hip->clump_blocks) {
-		hip->clump_blocks = HFSPLUS_IS_RSRC(inode) ?
-			sbi->rsrc_clump_blocks :
-			sbi->data_clump_blocks;
-	}
+    struct super_block *sb = inode->i_sb;
+    struct hfsplus_sb_info *sbi = HFSPLUS_SB(sb);
+    struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+    u32 count;
+    int i, ret;
+
+    /* Validate fork extents to catch on-disk corruption early */
+    ret = hfsplus_check_fork(sb, fork->extents, sbi->total_blocks);
+    if (ret) {
+        pr_err("hfsplus: fork check failed for inode %lu (err=%d)\n", inode->i_ino, ret);
+        set_bit(HFSPLUS_I_CORRUPT_TREE, &hip->flags);
+        sb->s_flags |= SB_RDONLY;
+        return ret; /* Return error directly to the caller */
+    }
+
+    memcpy(&hip->first_extents, &fork->extents, sizeof(hfsplus_extent_rec));
+    for (count = 0, i = 0; i <= HFSPLUS_EXTENT_LAST_IDX; i++)
+        count += be32_to_cpu(fork->extents[i].block_count);
+    hip->first_blocks = count;
+    memset(hip->cached_extents, 0, sizeof(hfsplus_extent_rec));
+    hip->cached_start = 0;
+    hip->cached_blocks = 0;
+
+    hip->alloc_blocks = be32_to_cpu(fork->total_blocks);
+    hip->phys_size = inode->i_size = be64_to_cpu(fork->total_size);
+    hip->fs_blocks =
+        (inode->i_size + sb->s_blocksize - 1) >> sb->s_blocksize_bits;
+    inode_set_bytes(inode, hip->fs_blocks << sb->s_blocksize_bits);
+    hip->clump_blocks =
+        be32_to_cpu(fork->clump_size) >> sbi->alloc_blksz_shift;
+    if (!hip->clump_blocks) {
+        hip->clump_blocks = HFSPLUS_IS_RSRC(inode) ?
+            sbi->rsrc_clump_blocks :
+            sbi->data_clump_blocks;
+    }
+
+    return 0;
 }
 
 void hfsplus_inode_write_fork(struct inode *inode,
-- 
2.43.0

