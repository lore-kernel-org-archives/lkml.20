Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D41399013
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789309437; cv=none; b=IDOmkYDSasjnZ5LRz6YlzzfT+SGuTQj1kIH+Z7m2Tpq1M3NTaZeSLYW8D1tjrMaWE6YRdG6YqV+7XKCyvaN4tHU3GV3AvvKCSZ6z/+uUHMn5apYZc5Qeialu03sVfMKzBOzYOrOeyxKUTNSL5hN2fKg5NkZFDd1BWCyFAUYdZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789309437; c=relaxed/simple;
	bh=vdnxUDzAMzKxj1Sl6XAuhDSq9GQuOcAfHPdObwwi9lg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DdZZF131nNQuNb51zh0nGVHKlVJS9FNu9zuSvdBeWEQmYuvda18IbrkLz/uHlwnoOsv2sF3D7ALqEy90ZyZfoARHDaYfcXPK9xskskQ7g4fm1Hox8tfbc8w6XPRBA1ejm1KscK6+ylF498NxTTcB5FTJ0+fKizqHyhta1ii1dFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/POmg8o; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/POmg8o"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2694951a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789309436; x=1789914236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKUQ99wuylFJvuvslMRQYoPvh++T8GD2C+XNyd/ppOc=;
        b=D/POmg8oaD07yw5B3u0kFqdaOU+B+oaf3QDgUTcRjavuRYCi+MTBtdu2EJRJfvFPku
         EWs4uymcJMtVHMvXhPYyZXxDTuE9ZNEupI8K6tnH2fcnUfecfNkIOpJwBhj/dqKtKMjO
         KK5ff2eHiXvMjmWjGNZnhALHxlnvWWUsWNtlXlkrl7wqo0P1VRDoeeO3SEjTwueesoyI
         wMMIa68BiLwQelEZnF+G3eDX9VL1cLkGGeb1wBS5ZvSf79MQoFS9Y4nkL5ZQDqr4w4an
         3i4rGxcx458GuDkaNELCPx3mMwoI37MklSDtmp92JlgjAAnpkeAEOiST3yp8S6MwQl4B
         xpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789309436; x=1789914236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKUQ99wuylFJvuvslMRQYoPvh++T8GD2C+XNyd/ppOc=;
        b=r8xQMyf9Ad3AfGft5sy7wioTfqj7bMDMK7dIkWabOBVML5Dd8/Oixtopohwa0w/sTo
         Ef5gx1QyId+oFZnOmEwAOjaOo/m3j4X8LTI/dZywZMuF3RVCQe1USOTcFFBMsJ5a5RCX
         UELxZgP2CGqjRFnDlNNOw6BiMCqrXtrSqxUWUKRlq+IiyQx7FSuSz+9/y+nMyomODHwb
         4iEKjDGMs6urIZuy/6UWGPe5Afo6N/bqBL3bqJYjq+t1uSzIDlW8PNW+mWJ0/f0aRTM9
         UENrgZoe3zgKZNsbv/0UovRQfr8jArngQZTAanSiaWQzzz7mXF9FyduINljQdQixUbiO
         9UlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjWOwZ87vtcAWUllCgFKxjzzfL0vQ6JYlXKLwYUJYYeE3xLywZBYF75bnB9OGRCUAUaUg7EyVKtHL9O2k=@vger.kernel.org
X-Gm-Message-State: AFuF++lhHzIlYUv+UaUqOE72cbdQ4wCEL5A5H7+UyXaaAwEB/CshDf/L
	BD/R7Sw4SQzuIepLNU/UB/7LB402BOv7Y0chYBs9b4po2pRUg7VM5Sjw
X-Gm-Gg: AYBFou0e2m7MNTleSucKkRy1gyNO51TFt/VSspCQiGtVoSgewAL0MtHSqpPqssJxCYw
	Q6aAJcWgcmhK75B9WZSapQVXTpuL+N95ac8qFlPLZd8PjIFx3l5mfoylbnjL6KZlwZ7p6vrtjKF
	lffqigiyahWkhzmAkDBhUB9W3MZxANSJqxkw7FwYgYbXxm9zx4P+jg8I1nm/IG6vw6d3eYwBBaS
	Ef0ysCb6t0xCjDkvZGlKErktitGqSoaynyXqb2ctFKkkKDm4gxf2tEQgRE1i1FlwTmOc39pMFvc
	MUz16bkXb36dHMV+vHr6ABLsdd3LLP2pN39rf5K/Vv9+UvFutDpXhNv011ArUg+I5dorI+AIyLT
	OXISA1pgp5VJJrccC8nUzC6bvpdCxRR7klVyDIcy09iarz7W20zMJv67echDDPpSzgM8g78l4Bp
	kcQrl2cwkARLqQ6hYrhMRni2bRjEAwTUFHT9f52NYjuzipY26k5I9n0VnDr6BrCPPogGeTTWc9Z
	CIaavkJY49lNQ==
X-Received: by 2002:a17:90b:1d49:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39d9c1fc96emr22312542a91.18.1789309435452;
        Sun, 13 Sep 2026 07:23:55 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dbca4c9a5sm2900843a91.0.2026.09.13.07.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:23:55 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v4 1/3] exfat: add a Bloom filter for negative name lookups
Date: Sun, 13 Sep 2026 22:23:12 +0800
Message-Id: <20260913142314.1400062-2-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260913142314.1400062-1-anmuxixixi@gmail.com>
References: <20260913142314.1400062-1-anmuxixixi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Negative name lookups scan a directory from the beginning. Repeating this
scan before creating each file makes bulk creation approach O(N^2).

Add a 64 KiB per-directory Bloom filter. Build it lazily after a directory
reaches 1024 on-disk entries. A definite miss skips the directory scan,
while a possible match follows the normal lookup path so hash collisions
cannot affect correctness.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 140 ++++++++++++++++++++++++++++++++++++++++++++
 fs/exfat/exfat_fs.h |  13 ++++
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |   6 +-
 fs/exfat/super.c    |   1 +
 5 files changed, 158 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index fe73b1380c5d..5145f09bcee6 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -8,6 +8,8 @@
 #include <linux/bio.h>
 #include <linux/buffer_head.h>
 #include <linux/filelock.h>
+#include <linux/hash.h>
+#include <linux/stringhash.h>
 
 #include "exfat_raw.h"
 #include "exfat_fs.h"
@@ -65,6 +67,140 @@ static int exfat_get_uniname_from_ext_entry(struct super_block *sb,
 	return 0;
 }
 
+static u32 exfat_name_filter_hash(struct super_block *sb,
+				  const struct exfat_uni_name *name)
+{
+	unsigned long hash = init_name_hash(NULL);
+	int i;
+
+	for (i = 0; i < name->name_len; i++)
+		hash = partial_name_hash(exfat_toupper(sb, name->name[i]), hash);
+
+	return end_name_hash(hash);
+}
+
+static void exfat_name_filter_indexes(struct super_block *sb,
+				      const struct exfat_uni_name *name,
+				      unsigned int indexes[3])
+{
+	u32 hash = exfat_name_filter_hash(sb, name);
+
+	indexes[0] = hash_32(hash, EXFAT_NAME_FILTER_ORDER);
+	indexes[1] = hash_32(hash ^ 0x9e3779b9U, EXFAT_NAME_FILTER_ORDER);
+	indexes[2] = hash_32(rol32(hash, 16) ^ 0x85ebca6bU,
+			     EXFAT_NAME_FILTER_ORDER);
+}
+
+void exfat_name_filter_free(struct inode *inode)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	kvfree(ei->name_filter);
+	ei->name_filter = NULL;
+}
+
+bool exfat_name_filter_maybe_contains(struct inode *inode,
+				      const struct exfat_uni_name *name)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+	unsigned int indexes[3];
+
+	if (!ei->name_filter)
+		return true;
+
+	exfat_name_filter_indexes(inode->i_sb, name, indexes);
+	return test_bit(indexes[0], ei->name_filter) &&
+	       test_bit(indexes[1], ei->name_filter) &&
+	       test_bit(indexes[2], ei->name_filter);
+}
+
+void exfat_name_filter_add(struct inode *inode,
+			   const struct exfat_uni_name *name)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+	unsigned int indexes[3];
+
+	if (!ei->name_filter)
+		return;
+
+	exfat_name_filter_indexes(inode->i_sb, name, indexes);
+	__set_bit(indexes[0], ei->name_filter);
+	__set_bit(indexes[1], ei->name_filter);
+	__set_bit(indexes[2], ei->name_filter);
+}
+
+/*
+ * Build a complete filter only after a directory becomes large enough for
+ * repeated negative linear lookups to matter. A filter hit is never trusted:
+ * it only allows definite misses to skip the on-disk scan.
+ */
+static void exfat_build_name_filter(struct super_block *sb,
+				    struct exfat_inode_info *ei,
+				    struct exfat_chain *p_dir)
+{
+	unsigned long *filter;
+	struct exfat_chain clu;
+	unsigned int clu_count = 0;
+	struct inode *inode = &ei->vfs_inode;
+	struct exfat_sb_info *sbi = EXFAT_SB(sb);
+	int i;
+
+	if (ei->name_filter ||
+	    exfat_bytes_to_dentries(i_size_read(inode)) <
+					EXFAT_NAME_FILTER_MIN_DENTRIES)
+		return;
+
+	filter = kvzalloc(EXFAT_NAME_FILTER_BYTES, GFP_NOFS);
+	if (!filter)
+		return;
+
+	exfat_chain_dup(&clu, p_dir);
+	while (clu.dir != EXFAT_EOF_CLUSTER) {
+		for (i = 0; i < sbi->dentries_per_clu; i++) {
+			struct exfat_uni_name name = { };
+			struct exfat_dentry *ep;
+			struct buffer_head *bh;
+			unsigned int type;
+			unsigned int indexes[3];
+			int len;
+
+			ep = exfat_get_dentry(sb, &clu, i, &bh);
+			if (!ep)
+				goto abort;
+
+			type = exfat_get_entry_type(ep);
+			brelse(bh);
+			if (type == TYPE_UNUSED)
+				goto complete;
+			if (type != TYPE_FILE && type != TYPE_DIR)
+				continue;
+
+			if (exfat_get_uniname_from_ext_entry(sb, &clu, i, name.name))
+				goto abort;
+			for (len = 0; len <= MAX_NAME_LENGTH && name.name[len]; len++)
+				;
+			if (!len || len > MAX_NAME_LENGTH)
+				goto abort;
+			name.name_len = len;
+			exfat_name_filter_indexes(sb, &name, indexes);
+			__set_bit(indexes[0], filter);
+			__set_bit(indexes[1], filter);
+			__set_bit(indexes[2], filter);
+		}
+
+		if (exfat_chain_advance(sb, &clu, 1))
+			goto abort;
+		if (unlikely(++clu_count > EXFAT_DATA_CLUSTER_COUNT(sbi)))
+			goto abort;
+	}
+
+complete:
+	ei->name_filter = filter;
+	return;
+abort:
+	kvfree(filter);
+}
+
 /* read a directory entry from the opened directory */
 static int exfat_readdir(struct inode *inode, loff_t *cpos, struct exfat_dir_entry *dir_entry)
 {
@@ -992,6 +1128,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 
 	if (num_entries < 0)
 		return num_entries;
+	if (!exfat_name_filter_maybe_contains(&ei->vfs_inode, p_uniname))
+		return -ENOENT;
 
 	dentries_per_clu = sbi->dentries_per_clu;
 
@@ -1153,6 +1291,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 		ei->hint_femp.count = 0;
 	}
 
+	exfat_build_name_filter(sb, ei, p_dir);
+
 	/* initialized hint_stat */
 	hint_stat->clu = p_dir->dir;
 	hint_stat->eidx = 0;
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index a9131fe03302..5187dee47cf1 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -120,6 +120,11 @@ enum {
 #define DIR_CACHE_SIZE		\
 	(DIV_ROUND_UP(ES_MAX_ENTRY_NUM << DENTRY_SIZE_BITS, SECTOR_SIZE) + 1)
 
+#define EXFAT_NAME_FILTER_ORDER		19
+#define EXFAT_NAME_FILTER_BITS		BIT(EXFAT_NAME_FILTER_ORDER)
+#define EXFAT_NAME_FILTER_BYTES		(EXFAT_NAME_FILTER_BITS >> 3)
+#define EXFAT_NAME_FILTER_MIN_DENTRIES	1024
+
 /* Superblock flags */
 #define EXFAT_FLAGS_SHUTDOWN	1
 
@@ -284,6 +289,8 @@ struct exfat_inode_info {
 	struct exfat_hint hint_stat;
 	/* hint for first empty entry */
 	struct exfat_hint_femp hint_femp;
+	/* Complete, in-memory Bloom filter of directory names */
+	unsigned long *name_filter;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -619,6 +626,12 @@ int exfat_read_volume_label(struct super_block *sb,
 int exfat_write_volume_label(struct super_block *sb,
 			     struct exfat_uni_name *label);
 
+bool exfat_name_filter_maybe_contains(struct inode *inode,
+				      const struct exfat_uni_name *name);
+void exfat_name_filter_add(struct inode *inode,
+			   const struct exfat_uni_name *name);
+void exfat_name_filter_free(struct inode *inode);
+
 static inline int exfat_chain_advance(struct super_block *sb,
 		struct exfat_chain *chain, unsigned int step)
 {
diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
index ccd13630187e..0d0c6f817775 100644
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@ -445,6 +445,7 @@ struct inode *exfat_build_inode(struct super_block *sb,
 void exfat_evict_inode(struct inode *inode)
 {
 	truncate_inode_pages_final(&inode->i_data);
+	exfat_name_filter_free(inode);
 
 	if (!inode->i_nlink) {
 		i_size_write(inode, 0);
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index a4dc83b5949c..96f33226f2c0 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -526,6 +526,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	}
 
 	info->entry = dentry;
+	exfat_name_filter_add(inode, &uniname);
 	info->flags = ALLOC_NO_FAT_CHAIN;
 	info->type = type;
 
@@ -802,7 +803,6 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 
 	/* update the directory entry */
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
-
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
 	if (err)
 		goto unlock;
@@ -957,7 +957,6 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	exfat_set_volume_dirty(sb);
 
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
-
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(dir));
 	if (err)
 		goto unlock;
@@ -1215,6 +1214,8 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	if (!ret)
+		exfat_name_filter_add(new_parent_inode, &uni_name);
 
 	if (!ret && new_inode) {
 		struct exfat_entry_set_cache es;
@@ -1227,7 +1228,6 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		}
 
 		exfat_remove_entries(new_inode, &es, ES_IDX_FILE, true);
-
 		ret = exfat_put_dentry_set(&es, IS_DIRSYNC(new_inode));
 		if (ret)
 			goto del_out;
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index a9ea36ba2693..f73cf2d02365 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -195,6 +195,7 @@ static struct inode *exfat_alloc_inode(struct super_block *sb)
 	if (!ei)
 		return NULL;
 
+	ei->name_filter = NULL;
 	return &ei->vfs_inode;
 }
 
-- 
2.34.1

