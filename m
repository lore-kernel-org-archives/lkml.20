Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA23391851
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477109; cv=none; b=ktIkrccgLd4wDrCUbTXSqiCq6YK2xpDXnc6UVD0l0KGI9+llXpw/KDjI+JZ0Hr2FxwUWksC9uIIKGZepfsSbXNP/dZVeTNB35aRX97Vc8tyeuOg6sGo70qDmyjzBQcJxloNDwGOkJzGTZtG9m+f9Np+W/j5SAdHr4H9TwgpS7t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477109; c=relaxed/simple;
	bh=D7/NB1OzGiwGaGwPTBw/kMOE48E3kA++wwBufFlRjjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7TEzPDKmUmCS0dbu0KPh+7Uh2qkZdsqJR7XrMo/IVb2jYCjdQ8jvVF7hKP8n+Dpg9zH1hCE451x4NYlL7jg35fZMXDbMA/eLTKFFJ6pUMpVMqDoTlhb5OYJmlNXLeyglST+xw5q7HbgqtcMxkVJ8kppdz8uTPnNZf4qKumoci0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViakyZnh; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViakyZnh"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-855d2bfae95so1885741b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788477106; x=1789081906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqZO6Brwcf00/mVxYFXz26sDFJ0VWrxYomoCtks7rio=;
        b=ViakyZnhIdlvESjK7+7sg26vDJqu34djvlADoy/TV6qkkTmC1YB5RbEWFDwXlxgH39
         XAsogVE7UJnx5P/GgbqBtCx1O3S/MaFJuAbD3tG3ZinXlpoEQM2DVcyj470CaUk0drWf
         5fTQn1oFzEIhSESXln1pEiNMb5jLCm+fLEja40ZNuJdS55QM9YL3hDpxGwruLYGJK7Vz
         JKDdozul9X43+HtY/6aLfzNQzhvoYadrap32KMvN4i6jyFGi/N5UKhm8B9HK1w083fJS
         NQFPWtd3PuLWt1LkRMv+l4bePD3IIFKoWSaDUlZ1C57yAWbGNDxn2BxjCp1auJo6TLe8
         cToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788477106; x=1789081906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uqZO6Brwcf00/mVxYFXz26sDFJ0VWrxYomoCtks7rio=;
        b=ckd/CdJAZ/AeGBqMCwRlXIxU6teSBvvDXvSXu5ZxTD4t7vS0ZWI79jZqyNnI5d2Hcd
         OGveaCbMruXyvAu22JT928n3t1wlDaXDo9dRTZOSYRC9b+e3uobOomFlnwAjZHiaaFob
         +9w1uIfzyxfAinDcXA9KTtJbj+CcTXpRxV4zPT2KoEf9TGMESiL7bKZHqo9PIEg0eavm
         wYVUwaNup3A3jmImn28084PQtu/pzVy96kKOuHG+3CC3WlkJ6ZlVjH+qMLfUyA6mp5Nq
         hzKSuPcgo/H6Bi78z6SLIuYi2opWBGdMcPCAJ0hZMx052EUdAXeQGWPuDHjNrULTyn4h
         Rq3g==
X-Forwarded-Encrypted: i=1; AKwUvBz/E5ou3FNHzJvMg+ktuEUfk8Mtb/pRGdIIrrBTldTjJqjWvSMP8UxlP0Pke9weXNW0t4crWaGEVqD/wr0=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Fs/5AmeWUb1zjQv176DehmhcA6X+q22E8CagtPmcx1pF40PO
	IElzTbvYPUc/17EKzns3lmahBEl5Vvc6suO95REQK+noc3BRrpVWyJis
X-Gm-Gg: AYBFou1QJckxVc3uYucvh9NoLVvfs/d8XkVDI82ApiindVGFjGn4NFskK9dpMVAGjJC
	Va5tdczhOyT0ASDydQ5ArLbecbPT/fGviXp2pOv09OuN4Fy3FrIKohI+UQpjhFOvX12Gjzrt9mn
	+jMSXYEdwKY2bvM9xhMYQb4COh8+E666eq6fzqgcin2Y3wjnPhnWZ3d9On9KLb8TETvnWB4KyOL
	7OlB++wsSL0jJFP6+iswzaTv1mC9vu+iqKp9xWpEzsE5JpxGC82wJnYz/64YD1G2eLgO1rqlauM
	DyrJUwdJrPs7Zn6ik01Wn/egb3y2IuTmxlVTA+I/PpxAs0Qyh+YXTdzwyNnd7VRE2g7fTaFRG/A
	rnc+n8kCLEAPteKGzO+BFn0o3af8HRwcgnsa5Jubq5SRovdb01vb3dWo7Pe7oNVzVZO0iwynJBN
	/zrApvWJDdeCSEpmb4BN29hPFCIIrhovjz6LxLPoKaCBrHUMkdFX+nuz5imYJGAFF9Qw==
X-Received: by 2002:a05:6a00:138f:b0:851:80de:db56 with SMTP id d2e1a72fcca58-85ffe10a09amr7507305b3a.13.1788477106117;
        Thu, 03 Sep 2026 16:11:46 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152e39a38sm432289b3a.39.2026.09.03.16.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:11:45 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 06/11] f2fs: describe {i,d,id}node block layout dynamically
Date: Thu,  3 Sep 2026 16:11:33 -0700
Message-ID: <b8ec5198d77d758ab92b2237db4bfa82149869e9.1788476500.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788476500.git.zhangxp1998@gmail.com>
References: <cover.1788476500.git.zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An inode block ends with five i_nid entries followed by a node footer.
Data block address pointers (i_addr[]) precede them. Similarly, direct and
indirect node blocks contain data addresses or node IDs followed by a node
footer at the end of the block.

Describe struct f2fs_inode, struct direct_node, and
struct indirect_node using flexible array members. Compute the locations
of i_nid and node footers dynamically from the filesystem block size.
Introduce F2FS_INODE_NIDS() and F2FS_NODE_FOOTER() helpers to access these
tail fields.

Compute sbi->addrs_per_inode, sbi->addrs_per_block, and
sbi->nids_per_block in init_sb_info(), and update node management, file
mapping, and recovery paths accordingly.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/data.c          |  2 +-
 fs/f2fs/f2fs.h          | 42 ++++++++++++++++++++++++--------
 fs/f2fs/gc.c            |  2 +-
 fs/f2fs/inline.c        |  3 +--
 fs/f2fs/inode.c         |  5 ++--
 fs/f2fs/node.c          |  4 +---
 fs/f2fs/node.h          | 53 +++++++++++++++++++----------------------
 fs/f2fs/super.c         |  4 ++++
 fs/f2fs/xattr.h         |  2 +-
 include/linux/f2fs_fs.h | 44 +++++++++++++++++++++-------------
 10 files changed, 95 insertions(+), 66 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6ae0eb37d20f..632513b5453c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2027,7 +2027,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 
 		phys = F2FS_BLK_TO_BYTES(ni.blk_addr);
 		offset = offsetof(struct f2fs_inode, i_addr) +
-					sizeof(__le32) * (DEF_ADDRS_PER_INODE -
+					sizeof(__le32) * (DEF_ADDRS_PER_INODE(sbi) -
 					get_inline_xattr_addrs(inode));
 
 		phys += offset;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d2e54573ed34..84f2d0cabda4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -602,8 +602,9 @@ static inline int update_sits_in_cursum(struct f2fs_journal *journal, int i)
 #define DEF_INLINE_RESERVED_SIZE	1
 static inline int get_extra_isize(struct inode *inode);
 static inline int get_inline_xattr_addrs(struct inode *inode);
+static inline unsigned int cur_addrs_per_inode(struct inode *inode);
 #define MAX_INLINE_DATA(inode)	(sizeof(__le32) *			\
-				(CUR_ADDRS_PER_INODE(inode) -		\
+				(cur_addrs_per_inode(inode) -		\
 				get_inline_xattr_addrs(inode) -	\
 				DEF_INLINE_RESERVED_SIZE))
 
@@ -1853,6 +1854,9 @@ struct f2fs_sb_info {
 	unsigned int log_blocksize;		/* log2 block size */
 	unsigned int blocksize;			/* block size */
 	unsigned int nat_entries_per_block;	/* NAT entries in a block */
+	unsigned int addrs_per_inode;		/* addresses in an inode block */
+	unsigned int addrs_per_block;		/* addresses in a direct node block */
+	unsigned int nids_per_block;		/* node IDs in an indirect node block */
 	unsigned int sit_entries_per_block;	/* SIT entries in a block */
 	unsigned int orphans_per_block;	/* orphan inodes in a block */
 	unsigned int dentries_per_block;	/* dentries in a block */
@@ -2248,6 +2252,7 @@ static inline struct f2fs_sb_info *F2FS_F_SB(const struct folio *folio)
 
 #define SIT_ENTRY_PER_BLOCK(sbi)	((sbi)->sit_entries_per_block)
 #define NAT_ENTRY_PER_BLOCK(sbi)	((sbi)->nat_entries_per_block)
+#define DEF_ADDRS_PER_INODE(sbi)	((sbi)->addrs_per_inode)
 #define F2FS_ORPHANS_PER_BLOCK(sbi)	((sbi)->orphans_per_block)
 #define GET_ORPHAN_BLOCKS(sbi, n)	DIV_ROUND_UP((n), \
 					F2FS_ORPHANS_PER_BLOCK(sbi))
@@ -2297,6 +2302,12 @@ static inline struct f2fs_checkpoint *F2FS_CKPT(struct f2fs_sb_info *sbi)
 	return (struct f2fs_checkpoint *)(sbi->ckpt);
 }
 
+static inline struct node_footer *F2FS_NODE_FOOTER(const struct folio *folio)
+{
+	return folio_address(folio) + F2FS_BLKSIZE -
+		sizeof(struct node_footer);
+}
+
 static inline struct f2fs_node *F2FS_NODE(const struct folio *folio)
 {
 	return (struct f2fs_node *)folio_address(folio);
@@ -2307,6 +2318,12 @@ static inline struct f2fs_inode *F2FS_INODE(const struct folio *folio)
 	return &((struct f2fs_node *)folio_address(folio))->i;
 }
 
+static inline __le32 *F2FS_INODE_NIDS(const struct folio *folio)
+{
+	return folio_address(folio) + F2FS_BLKSIZE - sizeof(struct node_footer) -
+		SIZE_OF_I_NID;
+}
+
 static inline struct f2fs_nm_info *NM_I(struct f2fs_sb_info *sbi)
 {
 	return (struct f2fs_nm_info *)(sbi->nm_info);
@@ -3277,13 +3294,11 @@ static inline void f2fs_radix_tree_insert(struct radix_tree_root *root,
 		cond_resched();
 }
 
-#define RAW_IS_INODE(p)	((p)->footer.nid == (p)->footer.ino)
-
 static inline bool IS_INODE(const struct folio *folio)
 {
-	struct f2fs_node *p = F2FS_NODE(folio);
+	struct node_footer *footer = F2FS_NODE_FOOTER(folio);
 
-	return RAW_IS_INODE(p);
+	return footer->nid == footer->ino;
 }
 
 static inline int offset_in_addr(struct f2fs_inode *i)
@@ -3292,9 +3307,11 @@ static inline int offset_in_addr(struct f2fs_inode *i)
 			(le16_to_cpu(i->i_extra_isize) / sizeof(__le32)) : 0;
 }
 
-static inline __le32 *blkaddr_in_node(struct f2fs_node *node)
+static inline __le32 *blkaddr_in_node(const struct folio *folio)
 {
-	return RAW_IS_INODE(node) ? node->i.i_addr : node->dn.addr;
+	struct f2fs_node *node = F2FS_NODE(folio);
+
+	return IS_INODE(folio) ? node->i.i_addr : node->dn.addr;
 }
 
 static inline int f2fs_has_extra_attr(struct inode *inode);
@@ -3311,7 +3328,7 @@ static inline unsigned int get_dnode_base(struct inode *inode,
 static inline __le32 *get_dnode_addr(struct inode *inode,
 					struct folio *node_folio)
 {
-	return blkaddr_in_node(F2FS_NODE(node_folio)) +
+	return blkaddr_in_node(node_folio) +
 			get_dnode_base(inode, node_folio);
 }
 
@@ -3626,7 +3643,7 @@ static inline bool f2fs_need_compress_data(struct inode *inode)
 static inline unsigned int addrs_per_page(struct inode *inode,
 							bool is_inode)
 {
-	unsigned int addrs = is_inode ? (CUR_ADDRS_PER_INODE(inode) -
+	unsigned int addrs = is_inode ? (cur_addrs_per_inode(inode) -
 			get_inline_xattr_addrs(inode)) : DEF_ADDRS_PER_BLOCK;
 
 	if (f2fs_compressed_file(inode))
@@ -3634,12 +3651,17 @@ static inline unsigned int addrs_per_page(struct inode *inode,
 	return addrs;
 }
 
+static inline unsigned int cur_addrs_per_inode(struct inode *inode)
+{
+	return DEF_ADDRS_PER_INODE(F2FS_I_SB(inode)) - get_extra_isize(inode);
+}
+
 static inline
 void *inline_xattr_addr(struct inode *inode, const struct folio *folio)
 {
 	struct f2fs_inode *ri = F2FS_INODE(folio);
 
-	return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE -
+	return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE(F2FS_I_SB(inode)) -
 					get_inline_xattr_addrs(inode)]);
 }
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index c15c6ba91597..164612dbe2c6 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1176,7 +1176,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 	if (IS_INODE(node_folio)) {
 		base = offset_in_addr(F2FS_INODE(node_folio));
-		max_addrs = DEF_ADDRS_PER_INODE;
+		max_addrs = DEF_ADDRS_PER_INODE(sbi);
 	} else {
 		base = 0;
 		max_addrs = DEF_ADDRS_PER_BLOCK;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 718dd785865a..73cd9b6ddcc5 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -36,14 +36,13 @@ bool f2fs_may_inline_data(struct inode *inode)
 
 static bool inode_has_blocks(struct inode *inode, struct folio *ifolio)
 {
-	struct f2fs_inode *ri = F2FS_INODE(ifolio);
 	int i;
 
 	if (F2FS_HAS_BLOCKS(inode))
 		return true;
 
 	for (i = 0; i < DEF_NIDS_PER_INODE; i++) {
-		if (ri->i_nid[i])
+		if (F2FS_INODE_NIDS(ifolio)[i])
 			return true;
 	}
 	return false;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 96cc0e777567..fda9ee3bfc61 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -150,9 +150,8 @@ bool f2fs_enable_inode_chksum(struct f2fs_sb_info *sbi, struct folio *folio)
 
 static __u32 f2fs_inode_chksum(struct f2fs_sb_info *sbi, struct folio *folio)
 {
-	struct f2fs_node *node = F2FS_NODE(folio);
-	struct f2fs_inode *ri = &node->i;
-	__le32 ino = node->footer.ino;
+	struct f2fs_inode *ri = F2FS_INODE(folio);
+	__le32 ino = F2FS_NODE_FOOTER(folio)->ino;
 	__le32 gen = ri->i_generation;
 	__u32 chksum, chksum_seed;
 	__u32 dummy_cs = 0;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 960c6657d0d6..e3f594f7bcce 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -3001,7 +3001,6 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct folio *folio)
 int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
 			unsigned int segno, struct f2fs_summary_block *sum)
 {
-	struct f2fs_node *rn;
 	struct f2fs_summary *sum_entry;
 	block_t addr;
 	int i, idx, last_offset, nrpages;
@@ -3023,8 +3022,7 @@ int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
 			if (IS_ERR(folio))
 				return PTR_ERR(folio);
 
-			rn = F2FS_NODE(folio);
-			sum_entry->nid = rn->footer.nid;
+			sum_entry->nid = F2FS_NODE_FOOTER(folio)->nid;
 			sum_entry->version = 0;
 			sum_entry->ofs_in_node = 0;
 			sum_entry++;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index d4a20d48432c..911c3d336533 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -250,73 +250,68 @@ static inline void set_to_next_nat(struct f2fs_sb_info *sbi,
 
 static inline nid_t ino_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(node_folio);
-	return le32_to_cpu(rn->footer.ino);
+	return le32_to_cpu(F2FS_NODE_FOOTER(node_folio)->ino);
 }
 
 static inline nid_t nid_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(node_folio);
-	return le32_to_cpu(rn->footer.nid);
+	return le32_to_cpu(F2FS_NODE_FOOTER(node_folio)->nid);
 }
 
 static inline unsigned int ofs_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(node_folio);
-	unsigned flag = le32_to_cpu(rn->footer.flag);
+	unsigned int flag = le32_to_cpu(F2FS_NODE_FOOTER(node_folio)->flag);
 	return flag >> OFFSET_BIT_SHIFT;
 }
 
 static inline __u64 cpver_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(node_folio);
-	return le64_to_cpu(rn->footer.cp_ver);
+	return le64_to_cpu(F2FS_NODE_FOOTER(node_folio)->cp_ver);
 }
 
 static inline block_t next_blkaddr_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(node_folio);
-	return le32_to_cpu(rn->footer.next_blkaddr);
+	return le32_to_cpu(F2FS_NODE_FOOTER(node_folio)->next_blkaddr);
 }
 
 static inline void fill_node_footer(const struct folio *folio, nid_t nid,
 				nid_t ino, unsigned int ofs, bool reset)
 {
 	struct f2fs_node *rn = F2FS_NODE(folio);
+	struct node_footer *footer = F2FS_NODE_FOOTER(folio);
 	unsigned int old_flag = 0;
 
 	if (reset)
-		memset(rn, 0, sizeof(*rn));
+		memset(rn, 0, F2FS_BLKSIZE);
 	else
-		old_flag = le32_to_cpu(rn->footer.flag);
+		old_flag = le32_to_cpu(footer->flag);
 
-	rn->footer.nid = cpu_to_le32(nid);
-	rn->footer.ino = cpu_to_le32(ino);
+	footer->nid = cpu_to_le32(nid);
+	footer->ino = cpu_to_le32(ino);
 
 	/* should remain old flag bits such as COLD_BIT_SHIFT */
-	rn->footer.flag = cpu_to_le32((ofs << OFFSET_BIT_SHIFT) |
+	footer->flag = cpu_to_le32((ofs << OFFSET_BIT_SHIFT) |
 					(old_flag & OFFSET_BIT_MASK));
 }
 
 static inline void copy_node_footer(const struct folio *dst,
 		const struct folio *src)
 {
-	struct f2fs_node *src_rn = F2FS_NODE(src);
-	struct f2fs_node *dst_rn = F2FS_NODE(dst);
-	memcpy(&dst_rn->footer, &src_rn->footer, sizeof(struct node_footer));
+	memcpy(F2FS_NODE_FOOTER(dst), F2FS_NODE_FOOTER(src),
+	       sizeof(struct node_footer));
 }
 
 static inline void fill_node_footer_blkaddr(struct folio *folio, block_t blkaddr)
 {
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(F2FS_F_SB(folio));
-	struct f2fs_node *rn = F2FS_NODE(folio);
+	struct node_footer *footer = F2FS_NODE_FOOTER(folio);
 	__u64 cp_ver = cur_cp_version(ckpt);
 
 	if (__is_set_ckpt_flags(ckpt, CP_CRC_RECOVERY_FLAG))
 		cp_ver |= (cur_cp_crc(ckpt) << 32);
 
-	rn->footer.cp_ver = cpu_to_le64(cp_ver);
-	rn->footer.next_blkaddr = cpu_to_le32(blkaddr);
+	footer->cp_ver = cpu_to_le64(cp_ver);
+	footer->next_blkaddr = cpu_to_le32(blkaddr);
 }
 
 static inline bool is_recoverable_dnode(const struct folio *folio)
@@ -376,11 +371,12 @@ static inline bool IS_DNODE(const struct folio *node_folio)
 static inline int set_nid(struct folio *folio, int off, nid_t nid, bool i)
 {
 	struct f2fs_node *rn = F2FS_NODE(folio);
+	__le32 *inode_nids = F2FS_INODE_NIDS(folio);
 
 	f2fs_folio_wait_writeback(folio, NODE, true, true);
 
 	if (i)
-		rn->i.i_nid[off - NODE_DIR1_BLOCK] = cpu_to_le32(nid);
+		inode_nids[off - NODE_DIR1_BLOCK] = cpu_to_le32(nid);
 	else
 		rn->in.nid[off] = cpu_to_le32(nid);
 	return folio_mark_dirty(folio);
@@ -389,9 +385,10 @@ static inline int set_nid(struct folio *folio, int off, nid_t nid, bool i)
 static inline nid_t get_nid(const struct folio *folio, int off, bool i)
 {
 	struct f2fs_node *rn = F2FS_NODE(folio);
+	const __le32 *inode_nids = F2FS_INODE_NIDS(folio);
 
 	if (i)
-		return le32_to_cpu(rn->i.i_nid[off - NODE_DIR1_BLOCK]);
+		return le32_to_cpu(inode_nids[off - NODE_DIR1_BLOCK]);
 	return le32_to_cpu(rn->in.nid[off]);
 }
 
@@ -404,8 +401,7 @@ static inline nid_t get_nid(const struct folio *folio, int off, bool i)
 
 static inline int is_node(const struct folio *folio, int type)
 {
-	struct f2fs_node *rn = F2FS_NODE(folio);
-	return le32_to_cpu(rn->footer.flag) & BIT(type);
+	return le32_to_cpu(F2FS_NODE_FOOTER(folio)->flag) & BIT(type);
 }
 
 #define is_cold_node(folio)	is_node(folio, COLD_BIT_SHIFT)
@@ -414,14 +410,13 @@ static inline int is_node(const struct folio *folio, int type)
 
 static inline void __set_mark(const struct folio *folio, bool mark, int type)
 {
-	struct f2fs_node *rn = F2FS_NODE(folio);
-	unsigned int flag = le32_to_cpu(rn->footer.flag);
-
+	struct node_footer *footer = F2FS_NODE_FOOTER(folio);
+	unsigned int flag = le32_to_cpu(footer->flag);
 	if (mark)
 		flag |= BIT(type);
 	else
 		flag &= ~BIT(type);
-	rn->footer.flag = cpu_to_le32(flag);
+	footer->flag = cpu_to_le32(flag);
 }
 
 static inline void set_cold_node(const struct folio *folio, bool is_dir)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5ca4f54e794c..87fc0a8ec246 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4384,6 +4384,10 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->blocksize = BIT(sbi->log_blocksize);
 	sbi->nat_entries_per_block = sbi->blocksize /
 		sizeof(struct f2fs_nat_entry);
+	sbi->addrs_per_inode = F2FS_DEF_ADDRS_PER_INODE(sbi->blocksize);
+	sbi->addrs_per_block = (sbi->blocksize -
+		sizeof(struct node_footer)) / sizeof(__le32);
+	sbi->nids_per_block = sbi->addrs_per_block;
 	sbi->sit_entries_per_block = sbi->blocksize /
 		sizeof(struct f2fs_sit_entry);
 	sbi->orphans_per_block = (sbi->blocksize -
diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index bce3d93e4755..7cd7ce58334b 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -85,7 +85,7 @@ struct f2fs_xattr_entry {
 
 #define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) / sizeof(__le32))
 #define MAX_INLINE_XATTR_SIZE						\
-			(DEF_ADDRS_PER_INODE -				\
+			(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) -	\
 			F2FS_TOTAL_EXTRA_ATTR_SIZE / sizeof(__le32) -	\
 			DEF_INLINE_RESERVED_SIZE -			\
 			MIN_INLINE_DENTRY_SIZE / sizeof(__le32))
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 2370af742c8f..bec31591b398 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -268,11 +268,9 @@ struct node_footer {
 } __packed;
 
 /* Address Pointers in an Inode */
-#define DEF_ADDRS_PER_INODE	((F2FS_BLKSIZE - OFFSET_OF_END_OF_I_EXT	\
-					- SIZE_OF_I_NID	\
-					- sizeof(struct node_footer)) / sizeof(__le32))
-#define CUR_ADDRS_PER_INODE(inode)	(DEF_ADDRS_PER_INODE - \
-					get_extra_isize(inode))
+#define F2FS_DEF_ADDRS_PER_INODE(blocksize)				\
+	(((blocksize) - OFFSET_OF_END_OF_I_EXT - SIZE_OF_I_NID -	\
+	  sizeof(struct node_footer)) / sizeof(__le32))
 #define DEF_NIDS_PER_INODE	5	/* Node IDs in an Inode */
 #define ADDRS_PER_INODE(inode)	addrs_per_page(inode, true)
 /* Address Pointers in a Direct Block */
@@ -283,11 +281,11 @@ struct node_footer {
 
 #define ADDRS_PER_PAGE(folio, inode)	(addrs_per_page(inode, IS_INODE(folio)))
 
-#define	NODE_DIR1_BLOCK		(DEF_ADDRS_PER_INODE + 1)
-#define	NODE_DIR2_BLOCK		(DEF_ADDRS_PER_INODE + 2)
-#define	NODE_IND1_BLOCK		(DEF_ADDRS_PER_INODE + 3)
-#define	NODE_IND2_BLOCK		(DEF_ADDRS_PER_INODE + 4)
-#define	NODE_DIND_BLOCK		(DEF_ADDRS_PER_INODE + 5)
+#define	NODE_DIR1_BLOCK		(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) + 1)
+#define	NODE_DIR2_BLOCK		(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) + 2)
+#define	NODE_IND1_BLOCK		(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) + 3)
+#define	NODE_IND2_BLOCK		(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) + 4)
+#define	NODE_DIND_BLOCK		(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) + 5)
 
 #define F2FS_INLINE_XATTR	0x01	/* file inline xattr flag */
 #define F2FS_INLINE_DATA	0x02	/* file inline data flag */
@@ -347,18 +345,26 @@ struct f2fs_inode {
 						 */
 			__le32 i_extra_end[0];	/* for attribute size calculation */
 		} __packed;
-		__le32 i_addr[DEF_ADDRS_PER_INODE];	/* Pointers to data blocks */
+		DECLARE_FLEX_ARRAY(__le32, i_addr); /* data block pointers */
 	};
-	__le32 i_nid[DEF_NIDS_PER_INODE];	/* direct(2), indirect(2),
-						double_indirect(1) node id */
+	/*
+	 * __le32 i_nid[DEF_NIDS_PER_INODE];
+	 * direct(2), indirect(2), double_indirect(1) node IDs
+	 *
+	 * It is stored immediately before the node footer at the end of the
+	 * filesystem block. Its offset depends on the filesystem block size, so
+	 * locate it dynamically with F2FS_INODE_NIDS().
+	 */
 } __packed;
 
 struct direct_node {
-	__le32 addr[DEF_ADDRS_PER_BLOCK];	/* array of data block address */
+	/* The address count depends on the filesystem block size. */
+	DECLARE_FLEX_ARRAY(__le32, addr); /* array of data block address */
 } __packed;
 
 struct indirect_node {
-	__le32 nid[NIDS_PER_BLOCK];	/* array of data block address */
+	/* The node ID count depends on the filesystem block size. */
+	DECLARE_FLEX_ARRAY(__le32, nid); /* array of data block address */
 } __packed;
 
 enum {
@@ -377,7 +383,13 @@ struct f2fs_node {
 		struct direct_node dn;
 		struct indirect_node in;
 	};
-	struct node_footer footer;
+	/*
+	 * struct node_footer footer;
+	 *
+	 * It is stored at the end of the filesystem block, after the inode or
+	 * direct/indirect node data. Its offset depends on the filesystem block
+	 * size, so locate it dynamically with F2FS_NODE_FOOTER().
+	 */
 } __packed;
 
 /*
-- 
2.53.0

