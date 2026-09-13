Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E1399013
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789309446; cv=none; b=XdROmQKpxO0BYDx3+kUPiEhqsWPNtrjAu0hHL3MJDilMowjx+eTfzurxfwfkWm91F9gTyhuTxnUv7lVtKBCOtzFIh3gdazwFm70lQvRoTR9vANlr97UGR1VEEgw7I5LL7y8yWz1bTXfcowF2xkIhs9D0QyCWH23QVaXqh9HgM0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789309446; c=relaxed/simple;
	bh=WzaP/fVzJRFz0Ecj+OFRn/cqqxN/4TzrdIiNzd+bTRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TNYOHXNF0clGW+ACM+faXXSsW0bLxR3i2iWnGGdxGsTVBpPJb//iIShSVQ//CwJup/2uZY29HhjAqtCguJjwkNwlo3bovNMzTmVgxSoKxj5iG7CxEF6qHjNiuUnr8bdj8yUhgo+S6uirV+CLx3SK94dt8F90EQcxC9zdzNVq9Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qH5JtLLP; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qH5JtLLP"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2db3305f94fso37487835ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789309444; x=1789914244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4hl6jVU5+Urk48+wGpjKB6N/ZVjmeCOgPgBF60SLtM=;
        b=qH5JtLLPhk4Z3gIotkUqVwhpni01chjkTOBHO3ySPNbBfxo/ZZP9NKGvgJ29aBdwiX
         H2AosDbaHv8sT6So4a5eMz6ttJcRpHFYGbwwQXbxniEmDQqJSPpyPPEVTg2l+k1otajY
         4zdEPDQy9lh65AL9fQ2y+7jePkZBwcGx4Hsdi0IrHMjZfChT6+yns1bQTV9E+nvU30yK
         yz/XmABd6eUNB11mHL+uNgOirMg52cpUwHbambnQMZHf7CandOX0EfEODIz3L04Ne6AL
         xHT0I68IUPznPstRHegCzvUhM8yz/Go+Ifuee1AgYaby87VpcQE6C6L8S9ZlUqX96fQ4
         SAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789309444; x=1789914244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4hl6jVU5+Urk48+wGpjKB6N/ZVjmeCOgPgBF60SLtM=;
        b=ENXk1zb6lSq293xOTMCfyJjAeSGpBHuC5pBsVLb5A65SfmgT6Um7++Qrdixe4GEltm
         l/KzsYFK/9iPnghXESjfV/McYB3SwXFrXHErfkwBiYuwyOX1PboTkK38vpmaPNyl5AvB
         CrU1kFbRZJRwbg7IkMYnCZ5ttkxTr6uYBSiS8KqUlbtpFVsSX8DbYRpMSAQ1a/S2ytbp
         G37qQxTAna0WJHOJa1egN3IrWRLMZOmf3hrAbehJQNYSF9qAguwB3YuL69PSgyzkjFFy
         NFV8+P1q/T9/ensBtgobhknS0mHC6f8Vy6R7pSguWoy1L5zir5Na1N6wi+Rl62HPSn7i
         JsQg==
X-Forwarded-Encrypted: i=1; AKwUvBw8Ua0rApferSdnFTNh6a3tcT4aydDynhx7Xq3cwbzF5IRsKhJhBJBplSQfIHGezVpWwz5xZeFGpXvatrw=@vger.kernel.org
X-Gm-Message-State: AFuF++mr2GlQ0Tm4J5FhFKHlYfYWdw227+yrCpXvf4lJnqXPCfkd0oCB
	8c2nnzjwvrtd8xpLw4UPWcfBLLxz+ALdrsNfyueBRGr78DFtjmbdWQEK
X-Gm-Gg: AYBFou02TB4Kp1ZCNFAroakjHoZBXzrcQsY+XkU1GnkRMSKLG4z5/9rkns0jb5gTgt+
	qOa491irDFlyk5h/PRd05GDM/lXPN+qexASx9rs1w2jqwEWOCP94K/aA2ZTo+5GtlE1gN5YYEla
	G2Sth2wKBoAXM7evaI1zTiBqSOuniw5b8t5fw4qs4z0nQHcT1qKvhp+4q+xyK9Wb10X7Tt5B7MJ
	q3lt9mAgTXNsXfs13xoXs5v06KdIBhsxyqyCrk2ja4x2+V53X8pF4CjsfvuUJ75rRlbqONiiGHx
	w1WV79ddBrLRk8eHTteG3TmJUssPHs1fIZ+HsTCtIlAVWB2lS6Eyu8zIzo5kWTJM5SoY6+Jb9xz
	WSdDpO8xeIQgpc/zrdOjy049qgGUMSHE8wDYcLHBQqU6SvNNOl8q32gUhYMVkuyxiy2cTmqxqNn
	uzP82mDoDf0LILZQieyvQeKiWJ726OlzrO6kW+7H1n9AjwmORv2uOGegZkiIR01cmb1+sbEn0so
	R+NXLgeCELx
X-Received: by 2002:a17:90a:e710:b0:398:d843:cad9 with SMTP id 98e67ed59e1d1-39d9c202f33mr25479288a91.19.1789309443662;
        Sun, 13 Sep 2026 07:24:03 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dbca4c9a5sm2900843a91.0.2026.09.13.07.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:24:03 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v4 2/3] exfat: retain the next empty directory entry hint
Date: Sun, 13 Sep 2026 22:23:13 +0800
Message-Id: <20260913142314.1400062-3-anmuxixixi@gmail.com>
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

After a Bloom filter miss skips the name scan, finding an empty entry
can still rescan the directory from the beginning.

Calculate the next empty-entry hint when a free entry set is found, but
publish it only after the entry set is committed. This prevents failed
create, rename, move, and volume-label operations from advancing the hint
past an unused slot.

Retain the hint while the name filter is active and invalidate it whenever
create rollback, unlink, rmdir, rename, or move can free entries. Also
invalidate the destination name filter on rename or move errors because the
new entry may already exist on disk.

This preserves the fast append path during bulk creation without allowing
stale hints or filters to hide directory entries.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      |  9 +++++-
 fs/exfat/exfat_fs.h |  3 +-
 fs/exfat/namei.c    | 78 ++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 83 insertions(+), 7 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 5145f09bcee6..aa79954375e0 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -1474,7 +1474,9 @@ int exfat_write_volume_label(struct super_block *sb,
 	struct inode *root_inode = sb->s_root->d_inode;
 	struct exfat_entry_set_cache es;
 	struct exfat_chain clu;
+	struct exfat_hint_femp next_hint;
 	struct exfat_dentry *ep;
+	bool entry_allocated = false;
 
 	if (label->name_len > EXFAT_VOLUME_LABEL_LEN)
 		return -EINVAL;
@@ -1489,7 +1491,10 @@ int exfat_write_volume_label(struct super_block *sb,
 			goto unlock;
 		}
 
-		ret = exfat_find_empty_entry(root_inode, &clu, 1, &es);
+		ret = exfat_find_empty_entry(root_inode, &clu, 1, &es,
+					     &next_hint);
+		if (!ret)
+			entry_allocated = true;
 	}
 
 	if (ret < 0)
@@ -1514,6 +1519,8 @@ int exfat_write_volume_label(struct super_block *sb,
 	es.modified = true;
 
 	ret = exfat_put_dentry_set(&es, IS_DIRSYNC(root_inode));
+	if (!ret && entry_allocated)
+		EXFAT_I(root_inode)->hint_femp = next_hint;
 
 unlock:
 	mutex_unlock(&sbi->s_lock);
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 5187dee47cf1..5d4d59da26a0 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -580,7 +580,8 @@ extern const struct dentry_operations exfat_dentry_ops;
 extern const struct dentry_operations exfat_utf8_dentry_ops;
 int exfat_find_empty_entry(struct inode *inode,
 		struct exfat_chain *p_dir, int num_entries,
-			   struct exfat_entry_set_cache *es);
+			   struct exfat_entry_set_cache *es,
+			   struct exfat_hint_femp *next_hint);
 
 /* cache.c */
 int exfat_cache_init(void);
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 96f33226f2c0..73682fe82235 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -199,6 +199,51 @@ const struct dentry_operations exfat_utf8_dentry_ops = {
 	.d_compare	= exfat_utf8_d_cmp,
 };
 
+static void exfat_set_next_empty_hint(struct inode *inode,
+				      struct exfat_chain *p_dir, int dentry,
+				      int num_entries,
+				      struct exfat_entry_set_cache *es,
+				      struct exfat_hint_femp *hint_femp)
+{
+	struct exfat_sb_info *sbi = EXFAT_SB(inode->i_sb);
+	unsigned int next = dentry + num_entries;
+	unsigned int total = exfat_cluster_to_dentries(sbi, p_dir->size);
+	struct exfat_chain cur;
+
+	if (next >= total) {
+		exfat_chain_set(&hint_femp->cur, EXFAT_EOF_CLUSTER, 0,
+				p_dir->flags);
+		hint_femp->eidx = total;
+		hint_femp->count = 0;
+		return;
+	}
+
+	cur.dir = exfat_sector_to_cluster(sbi,
+					  es->bh[es->num_bh - 1]->b_blocknr);
+	cur.flags = p_dir->flags;
+	cur.size = p_dir->size - exfat_dentries_to_cluster(sbi, next);
+	if (!(next & (sbi->dentries_per_clu - 1))) {
+		cur.size++;
+		if (exfat_chain_advance(inode->i_sb, &cur, 1)) {
+			hint_femp->eidx = EXFAT_HINT_NONE;
+			hint_femp->count = 0;
+			return;
+		}
+	}
+
+	hint_femp->cur = cur;
+	hint_femp->eidx = next;
+	hint_femp->count = 0;
+}
+
+static void exfat_invalidate_empty_hint(struct inode *inode)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	ei->hint_femp.eidx = EXFAT_HINT_NONE;
+	ei->hint_femp.count = 0;
+}
+
 /* search EMPTY CONTINUOUS "num_entries" entries */
 static int exfat_search_empty_slot(struct super_block *sb,
 		struct exfat_hint_femp *hint_femp, struct exfat_chain *p_dir,
@@ -295,7 +340,8 @@ static int exfat_check_max_dentries(struct inode *inode)
  */
 int exfat_find_empty_entry(struct inode *inode,
 		struct exfat_chain *p_dir, int num_entries,
-		struct exfat_entry_set_cache *es)
+		struct exfat_entry_set_cache *es,
+		struct exfat_hint_femp *next_hint)
 {
 	int dentry, ret;
 	unsigned int last_clu;
@@ -385,6 +431,9 @@ int exfat_find_empty_entry(struct inode *inode,
 		inode->i_blocks += sbi->cluster_size >> 9;
 	}
 
+	exfat_set_next_empty_hint(inode, p_dir, dentry, num_entries, es,
+				  next_hint);
+
 	p_dir->dir = exfat_sector_to_cluster(sbi, es->bh[0]->b_blocknr);
 	p_dir->size -= dentry / sbi->dentries_per_clu;
 
@@ -469,6 +518,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	struct exfat_chain clu;
 	struct timespec64 ts = current_time(inode);
 	struct exfat_entry_set_cache es;
+	struct exfat_hint_femp next_hint;
 	int clu_size = 0;
 	unsigned int start_clu = EXFAT_FREE_CLUSTER;
 	bool dir_allocated = false;
@@ -484,7 +534,8 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	}
 
 	/* exfat_find_empty_entry must be called before alloc_cluster() */
-	dentry = exfat_find_empty_entry(inode, &info->dir, num_entries, &es);
+	dentry = exfat_find_empty_entry(inode, &info->dir, num_entries, &es,
+					&next_hint);
 	if (dentry < 0) {
 		ret = dentry; /* -EIO or -ENOSPC */
 		goto out;
@@ -516,6 +567,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 						   dentry, ES_ALL_ENTRIES);
 		if (!cleanup_ret) {
 			exfat_remove_entries(inode, &es, ES_IDX_FILE, false);
+			exfat_invalidate_empty_hint(inode);
 			cleanup_ret = exfat_put_dentry_set(&es,
 							   IS_DIRSYNC(inode));
 		}
@@ -524,6 +576,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 			exfat_free_cluster(inode, &clu);
 		goto out;
 	}
+	EXFAT_I(inode)->hint_femp = next_hint;
 
 	info->entry = dentry;
 	exfat_name_filter_add(inode, &uniname);
@@ -628,7 +681,8 @@ static int exfat_find(struct inode *dir, const struct qstr *qname,
 		ei->hint_stat.clu = cdir.dir;
 		ei->hint_stat.eidx = 0;
 		ei->version = (inode_peek_iversion_raw(dir) & 0xffffffff);
-		ei->hint_femp.eidx = EXFAT_HINT_NONE;
+		if (!ei->name_filter)
+			ei->hint_femp.eidx = EXFAT_HINT_NONE;
 	}
 
 	/* search the file name for directories */
@@ -803,6 +857,8 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 
 	/* update the directory entry */
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
+
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
 	if (err)
 		goto unlock;
@@ -957,6 +1013,8 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	exfat_set_volume_dirty(sb);
 
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
+
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(dir));
 	if (err)
 		goto unlock;
@@ -1031,9 +1089,10 @@ static int exfat_rename_file(struct inode *parent_inode,
 	if (old_es.num_entries < num_total_entries) {
 		int newentry;
 		struct exfat_chain dir;
+		struct exfat_hint_femp next_hint;
 
 		newentry = exfat_find_empty_entry(parent_inode, &dir,
-				num_total_entries, &new_es);
+				num_total_entries, &new_es, &next_hint);
 		if (newentry < 0) {
 			ret = newentry; /* -EIO or -ENOSPC */
 			goto put_old_es;
@@ -1065,6 +1124,7 @@ static int exfat_rename_file(struct inode *parent_inode,
 			}
 			goto put_old_es;
 		}
+		EXFAT_I(parent_inode)->hint_femp = next_hint;
 
 		exfat_remove_entries(parent_inode, &old_es, ES_IDX_FILE, false);
 		ei->dir = dir;
@@ -1092,6 +1152,7 @@ static int exfat_move_file(struct inode *parent_inode,
 	struct exfat_dentry *epmov, *epnew;
 	struct exfat_entry_set_cache mov_es, new_es;
 	struct exfat_chain newdir;
+	struct exfat_hint_femp next_hint;
 	unsigned int num_extra_entries, num_total_entries;
 
 	num_new_entries = exfat_calc_num_entries(p_uniname);
@@ -1109,7 +1170,7 @@ static int exfat_move_file(struct inode *parent_inode,
 	num_total_entries = num_new_entries + num_extra_entries;
 
 	newentry = exfat_find_empty_entry(parent_inode, &newdir,
-			num_total_entries, &new_es);
+			num_total_entries, &new_es, &next_hint);
 	if (newentry < 0) {
 		ret = newentry; /* -EIO or -ENOSPC */
 		goto put_mov_es;
@@ -1138,10 +1199,12 @@ static int exfat_move_file(struct inode *parent_inode,
 					  ES_ALL_ENTRIES)) {
 			exfat_remove_entries(parent_inode, &new_es,
 					    ES_IDX_FILE, false);
+			exfat_invalidate_empty_hint(parent_inode);
 			exfat_put_dentry_set(&new_es, false);
 		}
 		goto put_mov_es;
 	}
+	EXFAT_I(parent_inode)->hint_femp = next_hint;
 
 	exfat_remove_entries(parent_inode, &mov_es, ES_IDX_FILE, false);
 
@@ -1214,8 +1277,11 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	exfat_invalidate_empty_hint(old_parent_inode);
 	if (!ret)
 		exfat_name_filter_add(new_parent_inode, &uni_name);
+	else
+		exfat_name_filter_free(new_parent_inode);
 
 	if (!ret && new_inode) {
 		struct exfat_entry_set_cache es;
@@ -1228,6 +1294,8 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		}
 
 		exfat_remove_entries(new_inode, &es, ES_IDX_FILE, true);
+		exfat_invalidate_empty_hint(new_parent_inode);
+
 		ret = exfat_put_dentry_set(&es, IS_DIRSYNC(new_inode));
 		if (ret)
 			goto del_out;
-- 
2.34.1

