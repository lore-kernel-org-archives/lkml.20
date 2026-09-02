Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7C74A5C57
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362750; cv=none; b=MbAkx6dDMRT8g7QcX72pvopEO4SOhMUHcrVCi2b+/ma7NKMAM0bGslmNLtpykeskzGBun5kXp7h2inG/PPSedzwbUdVJbKH864ozda4Utl3I8m3NwJi4Kx7Ei6Yb1dFOq+a7w8XfvStnbWhWLsHZb5S0msKD6Q4SrC/Xeq+MCzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362750; c=relaxed/simple;
	bh=eV++YHSYLH97mvqang/bv+b6/cf5SSX/9cfvxcjxKQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jR01HbexFEVL7fIEpPJqiIhwXdjWjNEjY1Eo5Th0lfH+Ni0Khi92BPHAsgEJfdWi2dKDFQPWgsaJdFRKIBJbFxqbRMQRNJb/oPVSy23KBB6/CA9sGKRCQXZGGVygLoDvh9G76J1nxDUMpjGcuaROjhx0wbJMw/ZfDqkd2pX47Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYoJ5BFP; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYoJ5BFP"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1215108a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362746; x=1788967546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWFKIedgYv9yHKxOFWuvh3g0Aa0J3QdCQirkmfefCog=;
        b=DYoJ5BFPZNbLztujD7f8ssqYhdNEZUTI8eB9ixNOJZc92MQXOhkSgOc+sS30CnrNT1
         iBdAqyjtvNsYDLN+xC/lf0beFWoFvq6OLW8ct9iBqB1HeIJfj99Hg0QdI9zBR/lhhkNU
         MomBt0jLWor3RSRlsYd74GVfn233WOQhHAHmTIMqXKKzt1ChpcVA4peOZ4cEpD5Bh5Jo
         nIG+SYTnIQL7wplM8nHBZh/AUwlfBEygZgtslLtm2WTrQCg7zWasDGilB6Ec13UpmSG4
         4TnmGshX00mM8G+gRlfZUXoZNM1/3Ker/aTGpMtIJG3sLfXyHxrB/5sGLd3K51vwFxTP
         6SZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362746; x=1788967546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dWFKIedgYv9yHKxOFWuvh3g0Aa0J3QdCQirkmfefCog=;
        b=edXReWYgUzUT7ZTyQs8VWwleY54OLqpMei1LYfdgBjDktpKyOUSmHkIMOrSi0Q/pG2
         7VEcLM9kX+4bkX9NNx+ujnwSmylDvR9FOrMkFYXIDxcAQM6uMYpqvMr4CyjQ/osT9mhj
         SGUtbnomNaj+8GXPjk8EKkFZwWiZnr8P5yYeFy32n6xniexHQRO4OK0JzMnnya1nZoMu
         uCmUbQKPDEAjGxpboBH6FaZC4VDAK+VqpXY1Gm4WuqvQ6iV7QM9jvvxgsyhr4HhGeC2F
         VAiDNUYHI8rTJQjm8pdcyUCNa+zCuLfN+7qYQm3RN3tnUNAdyh3edeig8kmxgN7i9Y9R
         /n0g==
X-Forwarded-Encrypted: i=1; AKwUvBxkPZeOVwMwDO2ghyc+Zk2/ql2t03guSJ/JLFdPjNnHIooW6sR0ATxk+zwVxt4AAQxnQZuxTyxAphfXpyc=@vger.kernel.org
X-Gm-Message-State: AFuF++nj52PtfHgJ9rCV8ZdRyLvu830P4lTdAJHSHJwNXdc46mwTX2LV
	cCReSw9CR8DJlZv0BbkWpbY6R+0TsmgSw9Fn0B+/9yPjabBlEGeXA1ES
X-Gm-Gg: AYBFou0/wmdUi+DRt1S53UshQyOo62gm5WYoX+B8i1GhNFxnQSyHLlokKOvL91C7bk1
	d/0r0Gbq0Xzc7T2GBOyt+WLF9Qxm9YQZSBLvMT0tFXGKMmzJtOy1WOi1HZqvRtt64opv7JRVpaV
	XoWdNqHY0C+nIAigcNrCfcBGyx/4mkPqdl3+C5C/fCgJxhEAExFDCcYjXcw9RkpR1rQqk3shCb6
	dK0Juk+sc7qZoC62xICGXqRPvFgry3bLL415ngG4b8HW/n35sBJyRoMB3OgRYd8ZOWhHWn3MkmK
	YV+Grh3v5kvgVuR9bVTLQ+scyiQMCo0Ue//fo4whJCQlDTRVSVJJmpg5W3zWh9PoTPztp3Soepv
	dqp18ttpGwZykxUx8/qtMSEx3gR49O3IzmejefT6Isu0+OK9y/25sPMWCsrhXZOMVfsIH28dZA1
	QOAAs/eYYf54xOFy6/gzS0bi/DjrOfOwwwqSEqa17OqRCRcSiOg6iKFzzholjT3hVqa1+4U2Ldl
	A==
X-Received: by 2002:a17:90b:4d06:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39aedec7bd8mr7717304a91.2.1788362745721;
        Wed, 02 Sep 2026 08:25:45 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd21e9dsm12359242a91.4.2026.09.02.08.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:25:45 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v3 2/3] exfat: retain the next empty directory entry hint
Date: Wed,  2 Sep 2026 23:24:54 +0800
Message-Id: <20260902152455.1273557-3-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902152455.1273557-1-anmuxixixi@gmail.com>
References: <20260902152455.1273557-1-anmuxixixi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a Bloom filter miss skips the name scan, finding an empty entry can
still rescan the directory from the beginning.

Advance the empty-entry hint past each newly allocated entry set and retain
it while the name filter is active. Invalidate the hint whenever create
rollback, unlink, rmdir, rename, or move can free entries, so the next
allocation rediscovers earlier holes.

This preserves the fast append path during bulk creation without allowing
stale hints to cause unbounded directory growth.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/namei.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 96f33226f2c0..56772167ba5d 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -199,6 +199,50 @@ const struct dentry_operations exfat_utf8_dentry_ops = {
 	.d_compare	= exfat_utf8_d_cmp,
 };
 
+static void exfat_set_next_empty_hint(struct inode *inode,
+				      struct exfat_chain *p_dir, int dentry,
+				      int num_entries,
+				      struct exfat_entry_set_cache *es)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+	struct exfat_sb_info *sbi = EXFAT_SB(inode->i_sb);
+	unsigned int next = dentry + num_entries;
+	unsigned int total = exfat_cluster_to_dentries(sbi, p_dir->size);
+	struct exfat_chain cur;
+
+	if (next >= total) {
+		exfat_chain_set(&ei->hint_femp.cur, EXFAT_EOF_CLUSTER, 0,
+				p_dir->flags);
+		ei->hint_femp.eidx = total;
+		ei->hint_femp.count = 0;
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
+			ei->hint_femp.eidx = EXFAT_HINT_NONE;
+			return;
+		}
+	}
+
+	ei->hint_femp.cur = cur;
+	ei->hint_femp.eidx = next;
+	ei->hint_femp.count = 0;
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
@@ -385,6 +429,8 @@ int exfat_find_empty_entry(struct inode *inode,
 		inode->i_blocks += sbi->cluster_size >> 9;
 	}
 
+	exfat_set_next_empty_hint(inode, p_dir, dentry, num_entries, es);
+
 	p_dir->dir = exfat_sector_to_cluster(sbi, es->bh[0]->b_blocknr);
 	p_dir->size -= dentry / sbi->dentries_per_clu;
 
@@ -516,6 +562,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 						   dentry, ES_ALL_ENTRIES);
 		if (!cleanup_ret) {
 			exfat_remove_entries(inode, &es, ES_IDX_FILE, false);
+			exfat_invalidate_empty_hint(inode);
 			cleanup_ret = exfat_put_dentry_set(&es,
 							   IS_DIRSYNC(inode));
 		}
@@ -628,7 +675,8 @@ static int exfat_find(struct inode *dir, const struct qstr *qname,
 		ei->hint_stat.clu = cdir.dir;
 		ei->hint_stat.eidx = 0;
 		ei->version = (inode_peek_iversion_raw(dir) & 0xffffffff);
-		ei->hint_femp.eidx = EXFAT_HINT_NONE;
+		if (!ei->name_filter)
+			ei->hint_femp.eidx = EXFAT_HINT_NONE;
 	}
 
 	/* search the file name for directories */
@@ -803,6 +851,8 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 
 	/* update the directory entry */
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
+
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
 	if (err)
 		goto unlock;
@@ -957,6 +1007,8 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	exfat_set_volume_dirty(sb);
 
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
+
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(dir));
 	if (err)
 		goto unlock;
@@ -1138,6 +1190,7 @@ static int exfat_move_file(struct inode *parent_inode,
 					  ES_ALL_ENTRIES)) {
 			exfat_remove_entries(parent_inode, &new_es,
 					    ES_IDX_FILE, false);
+			exfat_invalidate_empty_hint(parent_inode);
 			exfat_put_dentry_set(&new_es, false);
 		}
 		goto put_mov_es;
@@ -1214,6 +1267,7 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	exfat_invalidate_empty_hint(old_parent_inode);
 	if (!ret)
 		exfat_name_filter_add(new_parent_inode, &uni_name);
 
@@ -1228,6 +1282,8 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		}
 
 		exfat_remove_entries(new_inode, &es, ES_IDX_FILE, true);
+		exfat_invalidate_empty_hint(new_parent_inode);
+
 		ret = exfat_put_dentry_set(&es, IS_DIRSYNC(new_inode));
 		if (ret)
 			goto del_out;
-- 
2.34.1

