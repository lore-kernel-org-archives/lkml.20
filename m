Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5275E4A5C24
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166817; cv=none; b=elDTcbV1ZAbAYl3Ar4QLLdjXrHAgD4Zrt4Pk51xuyXG920kS8Wrt9K5dbVAx4xxId27YBWDOZuwcSw+QODVLFyZpEGWjc6SOA1asGzOoiDmIaG9LbJLBC2jfKRqRR1foAg1DoWAcYExsqPEuyDT9AS48luBhxin0FkUNT2GM+cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166817; c=relaxed/simple;
	bh=NgUdDd1JzQo0Y023VbbGxYFxCUtQ+JWNda0iLPrCCiw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r5M3v6p1wd9gtKSYDJOksRCY7hOIZGtS1BRxlNdPT0lK4nH18rtMmK9bKTZOV+51RYhbqjFOQ64+jZbY8asKeAJM+Xi6ZI6HbmJvVjywygMDBQBK2cBBz6qCW+CB7DtTTV8keUxa3kLFoY0QBbr2/6APS1IAKNVIIDZDBOMABgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7kAGXGj; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7kAGXGj"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ec6188so3636695ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166809; x=1790771609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jESetB1H5u5xF2KQ3sWXmhFOEqlKjQmaiAkNv9ckpCg=;
        b=j7kAGXGjj4D/unWfUWqDCmRIhyUojYBO60i8Fx2Orjcs4j102KAlzBrbfCE0McVxtL
         bHly9O57cxzdFadPBYjrSlwIASpwu2lgtrZqHSArn7BEGrcqyeltqjnEC4A5JzScAnhA
         2m46vYpX5KCjQnOznw5f38URTJ9tzrOhcFsiqwZgNwP1uOW8L6G/TXS8pAlZ+1+kJVTB
         KTaOvFaPB7Glz56Q7EKjNpryucyPTrLIA3vO7Ek0mEeCtz/HEP+sOeonEUYs469k+fqg
         Ad7tZ0Rdxk4+A5nxaNy6AbWzoYGjas98G/0Ux4iW9AxXbv2wRERtZ7juCvAbGwNIeT43
         83bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166809; x=1790771609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jESetB1H5u5xF2KQ3sWXmhFOEqlKjQmaiAkNv9ckpCg=;
        b=Ew+rHdcPOjW5zss4/PemensgoskOa+NZW0EFEjrMN5hDmoOSpIKFLAJnrzVe+BGe+h
         nx6gvnhwgv+BPMjcRhVy4MBTbBgnCzVTslBhGhpqlMW4G/TjAKYTPPFJdXSliUHt2M5j
         yJOj6H65J6HnB9/WUZCzIpBLRPaakZbwiyRNbzikVn8BCD60gQQPcw4nwsP/SV6MO2/w
         qCya69s7m4Y9bqHxorC6LBrL4m/6ZHc3/LXdetNjSUDhltRzk7uVNjoIgTy6moyRkKQk
         +Hvl05Ag4bKQMBila+wR19OIVE85Y72LTa/iFufn6CuaL3V4+uyehT8qqrsGFooFGs+z
         J0Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwzLXj9IYnBThSa1Q0ClJjxkZu38Jtf9JmHaEUETMhxwlzNaQiOfHwv4ZCCnf9VeXuYJy4Pu78/boHp0Ek=@vger.kernel.org
X-Gm-Message-State: AFuF++nUpI8uOE0qM6Aj2Hklv4E0FmqsavLni/bpNLKjFHc/4OJoRjwy
	ax/RGjZ8a/SmrhLaJplN4yFadfy3JD0jNZtUjI/wyMMllkQqX/NN7fF8G5dDhIQR7AA=
X-Gm-Gg: AYBFou01Yu5lm2RlAAyE45SiipjCdEPBUAoMwt+pyzgooGJDzjpUyIBR2yZnFyTi6iA
	WSGnE2uj7EAdesX2CWW2OjUnemyckUlUz7jhWbw9scc4+uUZtcJ/ZFSwV98j0p8W0N8LFKveiLR
	fMzObkwMxETwXNJtZ/nvYEnA94etOsdc0fp65KqukMr0+qOkLWrSF/tgOy3je+DBJApIZeA2BnK
	eChU7GgpcTZTFFMCIIoA3zTuMRcHHTQlRSQjHfvl/6ZCAlqVBzIpbIXtJ4wMaa0Cgug9zBkuskG
	VlpXmQ0KI+sSHHFYHRwCB0/tNlFwLjG5UXXgzB7lIGLueTk+wxFAqX8+1dSMBXM49Xr4k/ZcS24
	ZsySKXWpjqHFiSus3Xj+JsYfGu3zCs46lAZra8Ywm0qSYox1x/YGXPSGhqN0H5W573juMNX3oZ+
	bx8/xlgNYOao0ylMAkM6y4mtaSGHBJlKfyLlqVj/eKi6WpBlZUprW7J4VdNlu1Vrwu45bOxzNJv
	OQbSs5MpXP+
X-Received: by 2002:a17:902:fc85:b0:2dd:c053:ec74 with SMTP id d9443c01a7336-2df69dc7525mr21266475ad.39.1790166808848;
        Wed, 23 Sep 2026 05:33:28 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm9510475ad.19.2026.09.23.05.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:33:28 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v6 1/3] exfat: add a Bloom filter for negative name lookups
Date: Wed, 23 Sep 2026 20:32:58 +0800
Message-Id: <20260923123300.1626723-2-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923123300.1626723-1-anmuxixixi@gmail.com>
References: <20260923123300.1626723-1-anmuxixixi@gmail.com>
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

Invalidate the filter if a new entry set cannot be committed. Do the same
when writing a renamed or moved entry reports an error, because the entry
may already have reached disk.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 140 ++++++++++++++++++++++++++++++++++++++++++++
 fs/exfat/exfat_fs.h |  13 ++++
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |   9 ++-
 fs/exfat/super.c    |   1 +
 5 files changed, 161 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 46514b13bebd..0c5648e23e20 100644
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
@@ -1035,6 +1171,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 
 	if (num_entries < 0)
 		return num_entries;
+	if (!exfat_name_filter_maybe_contains(&ei->vfs_inode, p_uniname))
+		return -ENOENT;
 
 	dentries_per_clu = sbi->dentries_per_clu;
 
@@ -1196,6 +1334,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 		ei->hint_femp.count = 0;
 	}
 
+	exfat_build_name_filter(sb, ei, p_dir);
+
 	/* initialized hint_stat */
 	hint_stat->clu = p_dir->dir;
 	hint_stat->eidx = 0;
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 41a2c7dfc479..899b276f105b 100644
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
 
@@ -285,6 +290,8 @@ struct exfat_inode_info {
 	struct exfat_hint hint_stat;
 	/* hint for first empty entry */
 	struct exfat_hint_femp hint_femp;
+	/* Complete, in-memory Bloom filter of directory names */
+	unsigned long *name_filter;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -620,6 +627,12 @@ int exfat_read_volume_label(struct super_block *sb,
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
index 3c5746fc57d9..84045b704303 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -512,6 +512,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	if (ret) {
 		int cleanup_ret;
 
+		exfat_name_filter_free(inode);
 		cleanup_ret = exfat_get_dentry_set(&es, sb, &info->dir,
 						   dentry, ES_ALL_ENTRIES);
 		if (!cleanup_ret) {
@@ -526,6 +527,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	}
 
 	info->entry = dentry;
+	exfat_name_filter_add(inode, &uniname);
 	info->flags = ALLOC_NO_FAT_CHAIN;
 	info->type = type;
 
@@ -803,7 +805,6 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 
 	/* update the directory entry */
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
-
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
 	if (err)
 		goto unlock;
@@ -958,7 +959,6 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	exfat_set_volume_dirty(sb);
 
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
-
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(dir));
 	if (err)
 		goto unlock;
@@ -1216,6 +1216,10 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	if (!ret)
+		exfat_name_filter_add(new_parent_inode, &uni_name);
+	else
+		exfat_name_filter_free(new_parent_inode);
 
 	if (!ret && new_inode) {
 		struct exfat_entry_set_cache es;
@@ -1228,7 +1232,6 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		}
 
 		exfat_remove_entries(new_inode, &es, ES_IDX_FILE, true);
-
 		ret = exfat_put_dentry_set(&es, IS_DIRSYNC(new_inode));
 		if (ret)
 			goto del_out;
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 4943cef97741..4924f0fad836 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -209,6 +209,7 @@ static struct inode *exfat_alloc_inode(struct super_block *sb)
 	if (!ei)
 		return NULL;
 
+	ei->name_filter = NULL;
 	return &ei->vfs_inode;
 }
 
-- 
2.34.1

