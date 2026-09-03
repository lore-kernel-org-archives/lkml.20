Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482EC37E5FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788479801; cv=none; b=iC7eRNzObDedInGBpOnI8n48/JLMbDgvv8x3ScvQi/Wyd8OvwGHk1mRU8OavWrCKmO+dT4vPQdoDCsa6eHqDYwOXI72IVr41v0zbnM9eZJyfUMdvtFdEPUMhq2u/1ibcY0Ahu28lmRQg7JmWp5VNJeWRRnQr3nvW3v3aD2vWJ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788479801; c=relaxed/simple;
	bh=0mrUii/MaSLsi6bq8LVuYjaXkLlnNieJ4YYAgdAG4Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p523iNwC1mg+R9IcXtJolbksprJD8vXuBGHh6eGXBdJsH+DO8l8l3N5O0ji+bEULe5j8z+d/eGuimJ4ko6Bnom9v9famcY4bKrV0MIVrIYpfS4vshbX8jrNdHfsMnVXSO1nSrKsZ6lH1sb7mWgtWh75FDSKa0e60A3WnAWn2zK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQ2kU4Up; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQ2kU4Up"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso448083a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788479798; x=1789084598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhID0HeDATlzbNd87PMdvslGko3QPJeYrmg+eaXmErU=;
        b=aQ2kU4UpskDi3SfQqAtpem8VUSAeQaw8ZZkQdo6PdBilKoGlu0uNHS7Cz14oOwxrkY
         LsgcfutbGscOU58JrZC0Gov7UV1wXGVuT25NPmoBCuEiThvmop71AT5c4/QqUcr4niU4
         s140GAf8BJFhnHzqPJ3ID9GLrIY7z57TaVh6XwWn0y5Ec4yLqXKM25/Ccrly3cBLJw6N
         mqOcrIR1XI+b5Gp5CcFX+Y9nGZyLl9F1AMWhM6jfPFpgK64MkJPcKMsyEtlH8rfYu8aK
         mntxUISkdCt9NbhIMJauGjOGwzBHDy1FTRN0ed3pXunDXex4E2tEIQYXnNeyWuM5o7oC
         12pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788479798; x=1789084598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhID0HeDATlzbNd87PMdvslGko3QPJeYrmg+eaXmErU=;
        b=Q7kbub9Fsm2l2iDPLtAsEZhY0h7Tk1LeSJR81fFzgZuvj4Mrzc5Rz0LNTxlqacFCht
         ZNeTMIbUwO9qnfpE3oEC45llzpfGRSegT/URO/tWebc7ERHPt0NdXiTqQTOSSTayV3+G
         io2lnkQaznEqcKy/RWsjE1f3xSj5jhAPmpwrMtSAd85hlHi3bZhHpRlUmdCZKLixqWg8
         hZab8FMhbNZifTdHabL1IGgD5THO2RJvK523186bRaNFI0yN4PtFrokNgmt4jsL7yKuy
         Vd3bGZbWpOOhaitvkBMVI6pFSXbTCZsEZM7ZgygpFDyYevGCWkV3WWYTTf0AtMIKbyeD
         Z0TA==
X-Forwarded-Encrypted: i=1; AKwUvBzKrdJ3uwVrGKq0nFGZ8VaSdwqZGO2deWUMXnHyLxuyykhtTk71ru1X7X6wso2/klkkxDynluiCQM9jNA8=@vger.kernel.org
X-Gm-Message-State: AFuF++kSYxv1FRlIe+6tFV67dpo554ZurWT9Kyj5LVM45XTRJrhlEijt
	AglYFczj+M6yzgTkuulV8zUmeiM+ivjDYOwT193wK0PP34MqES4/j7em
X-Gm-Gg: AYBFou3KFxdbIWAthtQtfxgXVtSg4zIfDz9auZp10rqikqDR+qHwx4yJM0BBqfOVK4N
	ThyMpBXJOAVR/CCZArekxOt1n8JiS2ExPQXe2HM5RoaFceZ4n5GezwoFFVsq1+YlhbAM340ZwzZ
	ryxm/fqk0fJGktt0namy1rriEZStASRe8yaCGCnUAcbmedm/s0lghJ1iVOz5pi26XcD5VgsjJVJ
	BQLiMxUgPDpMQ/YIRalRYcPyM/wT6JOVuPsNp+tYTmPbwo54v79vmLL5U4yijGaRKMg5EPuVlAL
	SwIoajDLmvNq/Pngz1Ppu5j+dHFjjYD/YVZhkPJnfIzJK1k84UDK0WMv/s7jLELxCbE37wx6hT1
	jpCk7aruUOGcyEFuamL5dKHQaw0GMYzpufF9FmHUUaM7ak2NZS4P6JS2Tz+ifVYLRImvjvz18Rs
	j1Ai+Qke6n1B0UekGpYvL9fWPHAoOK4gPQdE3Rf6GuxUBwTtSfvPObWJ/Ra9qhP/I/Yg==
X-Received: by 2002:a17:90b:3b88:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39b261da746mr2521725a91.20.1788479798277;
        Thu, 03 Sep 2026 16:56:38 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm1861230eec.18.2026.09.03.16.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:56:37 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 10/11] f2fs: describe node tree geometry dynamically
Date: Thu,  3 Sep 2026 16:56:22 -0700
Message-ID: <04bf8eb2c833d8fbb767558c49b53c715f6698b8.1788479509.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788479509.git.zhangxp1998@gmail.com>
References: <cover.1788479509.git.zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file indexing tree boundaries separating direct, indirect, and
double-indirect node blocks depend on the number of data block addresses
and node IDs contained in each node block.

Parameterize index boundary macros (NODE_DIR1_BLOCK,
NODE_DIR2_BLOCK, NODE_IND1_BLOCK, NODE_IND2_BLOCK, and NODE_DIND_BLOCK) and
address capacity helpers (DEF_ADDRS_PER_BLOCK, NIDS_PER_BLOCK,
cur_addrs_per_inode, addrs_per_page, and addrs_per_folio) with
struct f2fs_sb_info *sbi.

Update file mapping, block allocation, truncate, garbage collection,
and recovery paths to compute indexing tree offsets from the runtime
geometry.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/f2fs.h          | 11 +++++-
 fs/f2fs/gc.c            | 10 +++---
 fs/f2fs/node.c          | 74 +++++++++++++++++++++--------------------
 fs/f2fs/node.h          | 18 ++++++----
 fs/f2fs/super.c         |  8 ++---
 include/linux/f2fs_fs.h | 10 ------
 6 files changed, 69 insertions(+), 62 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c0bccc763e70..df8d1bfef34c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2252,10 +2252,18 @@ static inline struct f2fs_sb_info *F2FS_F_SB(const struct folio *folio)
 #define SIT_ENTRY_PER_BLOCK(sbi)	((sbi)->sit_entries_per_block)
 #define NAT_ENTRY_PER_BLOCK(sbi)	((sbi)->nat_entries_per_block)
 #define DEF_ADDRS_PER_INODE(sbi)	((sbi)->addrs_per_inode)
+#define DEF_ADDRS_PER_BLOCK(sbi)	((sbi)->addrs_per_block)
+#define NIDS_PER_BLOCK(sbi)		((sbi)->nids_per_block)
 #define F2FS_ORPHANS_PER_BLOCK(sbi)	((sbi)->orphans_per_block)
 #define GET_ORPHAN_BLOCKS(sbi, n)	DIV_ROUND_UP((n), \
 					F2FS_ORPHANS_PER_BLOCK(sbi))
 
+#define NODE_DIR1_BLOCK(sbi)		(DEF_ADDRS_PER_INODE(sbi) + 1)
+#define NODE_DIR2_BLOCK(sbi)		(DEF_ADDRS_PER_INODE(sbi) + 2)
+#define NODE_IND1_BLOCK(sbi)		(DEF_ADDRS_PER_INODE(sbi) + 3)
+#define NODE_IND2_BLOCK(sbi)		(DEF_ADDRS_PER_INODE(sbi) + 4)
+#define NODE_DIND_BLOCK(sbi)		(DEF_ADDRS_PER_INODE(sbi) + 5)
+
 static inline struct f2fs_orphan_footer *
 f2fs_orphan_footer(void *orphan_block, struct f2fs_sb_info *sbi)
 {
@@ -3644,7 +3652,8 @@ static inline unsigned int addrs_per_page(struct inode *inode,
 							bool is_inode)
 {
 	unsigned int addrs = is_inode ? (cur_addrs_per_inode(inode) -
-			get_inline_xattr_addrs(inode)) : DEF_ADDRS_PER_BLOCK;
+			get_inline_xattr_addrs(inode)) :
+			DEF_ADDRS_PER_BLOCK(F2FS_I_SB(inode));
 
 	if (f2fs_compressed_file(inode))
 		return ALIGN_DOWN(addrs, F2FS_I(inode)->i_cluster_size);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 164612dbe2c6..39fa4776404e 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1123,7 +1123,8 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
  */
 block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode)
 {
-	unsigned int indirect_blks = 2 * NIDS_PER_BLOCK + 4;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int indirect_blks = 2 * NIDS_PER_BLOCK(sbi) + 4;
 	unsigned int bidx;
 
 	if (node_ofs == 0)
@@ -1132,11 +1133,12 @@ block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode)
 	if (node_ofs <= 2) {
 		bidx = node_ofs - 1;
 	} else if (node_ofs <= indirect_blks) {
-		int dec = (node_ofs - 4) / (NIDS_PER_BLOCK + 1);
+		int dec = (node_ofs - 4) / (NIDS_PER_BLOCK(sbi) + 1);
 
 		bidx = node_ofs - 2 - dec;
 	} else {
-		int dec = (node_ofs - indirect_blks - 3) / (NIDS_PER_BLOCK + 1);
+		int dec = (node_ofs - indirect_blks - 3) /
+			(NIDS_PER_BLOCK(sbi) + 1);
 
 		bidx = node_ofs - 5 - dec;
 	}
@@ -1179,7 +1181,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		max_addrs = DEF_ADDRS_PER_INODE(sbi);
 	} else {
 		base = 0;
-		max_addrs = DEF_ADDRS_PER_BLOCK;
+		max_addrs = DEF_ADDRS_PER_BLOCK(sbi);
 	}
 
 	if (base + ofs_in_node >= max_addrs) {
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e7aa3b790214..7bb99988833a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -691,7 +691,7 @@ static void f2fs_ra_node_pages(struct folio *parent, int start, int n)
 
 	/* Then, try readahead for siblings of the desired node */
 	end = start + n;
-	end = min(end, (int)NIDS_PER_BLOCK);
+	end = min_t(int, end, NIDS_PER_BLOCK(sbi));
 	for (i = start; i < end; i++) {
 		nid = get_nid(parent, i, false);
 		f2fs_ra_node_page(sbi, nid);
@@ -702,9 +702,11 @@ static void f2fs_ra_node_pages(struct folio *parent, int start, int n)
 
 pgoff_t f2fs_get_next_page_offset(struct dnode_of_data *dn, pgoff_t pgofs)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
 	const long direct_index = ADDRS_PER_INODE(dn->inode);
 	const long direct_blks = ADDRS_PER_BLOCK(dn->inode);
-	const long indirect_blks = ADDRS_PER_BLOCK(dn->inode) * NIDS_PER_BLOCK;
+	const long indirect_blks = ADDRS_PER_BLOCK(dn->inode) *
+		NIDS_PER_BLOCK(sbi);
 	unsigned int skipped_unit = ADDRS_PER_BLOCK(dn->inode);
 	int cur_level = dn->cur_level;
 	int max_level = dn->max_level;
@@ -714,7 +716,7 @@ pgoff_t f2fs_get_next_page_offset(struct dnode_of_data *dn, pgoff_t pgofs)
 		return pgofs + 1;
 
 	while (max_level-- > cur_level)
-		skipped_unit *= NIDS_PER_BLOCK;
+		skipped_unit *= NIDS_PER_BLOCK(sbi);
 
 	switch (dn->max_level) {
 	case 3:
@@ -740,11 +742,13 @@ pgoff_t f2fs_get_next_page_offset(struct dnode_of_data *dn, pgoff_t pgofs)
 static int get_node_path(struct inode *inode, long block,
 				int offset[4], unsigned int noffset[4])
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	const long direct_index = ADDRS_PER_INODE(inode);
 	const long direct_blks = ADDRS_PER_BLOCK(inode);
-	const long dptrs_per_blk = NIDS_PER_BLOCK;
-	const long indirect_blks = ADDRS_PER_BLOCK(inode) * NIDS_PER_BLOCK;
-	const long dindirect_blks = indirect_blks * NIDS_PER_BLOCK;
+	const long dptrs_per_blk = NIDS_PER_BLOCK(sbi);
+	const long indirect_blks = ADDRS_PER_BLOCK(inode) *
+		NIDS_PER_BLOCK(sbi);
+	const long dindirect_blks = indirect_blks * NIDS_PER_BLOCK(sbi);
 	int n = 0;
 	int level = 0;
 
@@ -756,7 +760,7 @@ static int get_node_path(struct inode *inode, long block,
 	}
 	block -= direct_index;
 	if (block < direct_blks) {
-		offset[n++] = NODE_DIR1_BLOCK;
+		offset[n++] = NODE_DIR1_BLOCK(sbi);
 		noffset[n] = 1;
 		offset[n] = block;
 		level = 1;
@@ -764,7 +768,7 @@ static int get_node_path(struct inode *inode, long block,
 	}
 	block -= direct_blks;
 	if (block < direct_blks) {
-		offset[n++] = NODE_DIR2_BLOCK;
+		offset[n++] = NODE_DIR2_BLOCK(sbi);
 		noffset[n] = 2;
 		offset[n] = block;
 		level = 1;
@@ -772,7 +776,7 @@ static int get_node_path(struct inode *inode, long block,
 	}
 	block -= direct_blks;
 	if (block < indirect_blks) {
-		offset[n++] = NODE_IND1_BLOCK;
+		offset[n++] = NODE_IND1_BLOCK(sbi);
 		noffset[n] = 3;
 		offset[n++] = block / direct_blks;
 		noffset[n] = 4 + offset[n - 1];
@@ -782,7 +786,7 @@ static int get_node_path(struct inode *inode, long block,
 	}
 	block -= indirect_blks;
 	if (block < indirect_blks) {
-		offset[n++] = NODE_IND2_BLOCK;
+		offset[n++] = NODE_IND2_BLOCK(sbi);
 		noffset[n] = 4 + dptrs_per_blk;
 		offset[n++] = block / direct_blks;
 		noffset[n] = 5 + dptrs_per_blk + offset[n - 1];
@@ -792,7 +796,7 @@ static int get_node_path(struct inode *inode, long block,
 	}
 	block -= indirect_blks;
 	if (block < dindirect_blks) {
-		offset[n++] = NODE_DIND_BLOCK;
+		offset[n++] = NODE_DIND_BLOCK(sbi);
 		noffset[n] = 5 + (dptrs_per_blk * 2);
 		offset[n++] = block / indirect_blks;
 		noffset[n] = 6 + (dptrs_per_blk * 2) +
@@ -1054,6 +1058,7 @@ static int truncate_dnode(struct dnode_of_data *dn)
 static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 						int ofs, int depth)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
 	struct dnode_of_data rdn = *dn;
 	struct folio *folio;
 	struct f2fs_node *rn;
@@ -1063,7 +1068,7 @@ static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 	int i, ret;
 
 	if (dn->nid == 0)
-		return NIDS_PER_BLOCK + 1;
+		return NIDS_PER_BLOCK(sbi) + 1;
 
 	trace_f2fs_truncate_nodes_enter(dn->inode, dn->nid, dn->data_blkaddr);
 
@@ -1074,11 +1079,11 @@ static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 		return PTR_ERR(folio);
 	}
 
-	f2fs_ra_node_pages(folio, ofs, NIDS_PER_BLOCK);
+	f2fs_ra_node_pages(folio, ofs, NIDS_PER_BLOCK(sbi));
 
 	rn = F2FS_NODE(folio);
 	if (depth < 3) {
-		for (i = ofs; i < NIDS_PER_BLOCK; i++, freed++) {
+		for (i = ofs; i < NIDS_PER_BLOCK(sbi); i++, freed++) {
 			child_nid = le32_to_cpu(rn->in.nid[i]);
 			if (child_nid == 0)
 				continue;
@@ -1090,16 +1095,16 @@ static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 				dn->node_changed = true;
 		}
 	} else {
-		child_nofs = nofs + ofs * (NIDS_PER_BLOCK + 1) + 1;
-		for (i = ofs; i < NIDS_PER_BLOCK; i++) {
+		child_nofs = nofs + ofs * (NIDS_PER_BLOCK(sbi) + 1) + 1;
+		for (i = ofs; i < NIDS_PER_BLOCK(sbi); i++) {
 			child_nid = le32_to_cpu(rn->in.nid[i]);
 			if (child_nid == 0) {
-				child_nofs += NIDS_PER_BLOCK + 1;
+				child_nofs += NIDS_PER_BLOCK(sbi) + 1;
 				continue;
 			}
 			rdn.nid = child_nid;
 			ret = truncate_nodes(&rdn, child_nofs, 0, depth - 1);
-			if (ret == (NIDS_PER_BLOCK + 1)) {
+			if (ret == (NIDS_PER_BLOCK(sbi) + 1)) {
 				if (set_nid(folio, i, 0, false))
 					dn->node_changed = true;
 				child_nofs += ret;
@@ -1156,10 +1161,12 @@ static int truncate_partial_nodes(struct dnode_of_data *dn,
 		nid[i + 1] = get_nid(folios[i], offset[i + 1], false);
 	}
 
-	f2fs_ra_node_pages(folios[idx], offset[idx + 1], NIDS_PER_BLOCK);
+	f2fs_ra_node_pages(folios[idx], offset[idx + 1],
+			   NIDS_PER_BLOCK(F2FS_I_SB(dn->inode)));
 
 	/* free direct nodes linked to a partial indirect node */
-	for (i = offset[idx + 1]; i < NIDS_PER_BLOCK; i++) {
+	for (i = offset[idx + 1];
+			i < NIDS_PER_BLOCK(F2FS_I_SB(dn->inode)); i++) {
 		child_nid = get_nid(folios[idx], i, false);
 		if (!child_nid)
 			continue;
@@ -1193,7 +1200,9 @@ static int truncate_partial_nodes(struct dnode_of_data *dn,
 }
 
 /*
- * All the block addresses of data and nodes should be nullified.
+ * All the node blocks actually belong to the inode will be released.
+ * If the level is 0, we will simply truncate the dnode,
+ * or else we should do dynamic truncate for the node pointers with the depth.
  */
 int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 {
@@ -1240,10 +1249,10 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		err = truncate_partial_nodes(&dn, offset, level);
 		if (err < 0 && err != -ENOENT)
 			goto fail;
-		nofs += 1 + NIDS_PER_BLOCK;
+		nofs += 1 + NIDS_PER_BLOCK(sbi);
 		break;
 	case 3:
-		nofs = 5 + 2 * NIDS_PER_BLOCK;
+		nofs = 5 + 2 * NIDS_PER_BLOCK(sbi);
 		if (!offset[level - 1])
 			goto skip_partial;
 		err = truncate_partial_nodes(&dn, offset, level);
@@ -1257,23 +1266,16 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 skip_partial:
 	while (cont) {
 		dn.nid = get_nid(folio, offset[0], true);
-		switch (offset[0]) {
-		case NODE_DIR1_BLOCK:
-		case NODE_DIR2_BLOCK:
+		if (offset[0] == NODE_DIR1_BLOCK(sbi) ||
+		    offset[0] == NODE_DIR2_BLOCK(sbi)) {
 			err = truncate_dnode(&dn);
-			break;
-
-		case NODE_IND1_BLOCK:
-		case NODE_IND2_BLOCK:
+		} else if (offset[0] == NODE_IND1_BLOCK(sbi) ||
+				offset[0] == NODE_IND2_BLOCK(sbi)) {
 			err = truncate_nodes(&dn, nofs, offset[1], 2);
-			break;
-
-		case NODE_DIND_BLOCK:
+		} else if (offset[0] == NODE_DIND_BLOCK(sbi)) {
 			err = truncate_nodes(&dn, nofs, offset[1], 3);
 			cont = 0;
-			break;
-
-		default:
+		} else {
 			BUG();
 		}
 		if (err == -ENOENT) {
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 911c3d336533..2766ced7bef7 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -352,17 +352,18 @@ static inline bool is_recoverable_dnode(const struct folio *folio)
  */
 static inline bool IS_DNODE(const struct folio *node_folio)
 {
+	struct f2fs_sb_info *sbi = F2FS_F_SB(node_folio);
 	unsigned int ofs = ofs_of_node(node_folio);
 
 	if (f2fs_has_xattr_block(ofs))
 		return true;
 
-	if (ofs == 3 || ofs == 4 + NIDS_PER_BLOCK ||
-			ofs == 5 + 2 * NIDS_PER_BLOCK)
+	if (ofs == 3 || ofs == 4 + NIDS_PER_BLOCK(sbi) ||
+	    ofs == 5 + 2 * NIDS_PER_BLOCK(sbi))
 		return false;
-	if (ofs >= 6 + 2 * NIDS_PER_BLOCK) {
-		ofs -= 6 + 2 * NIDS_PER_BLOCK;
-		if (!((long int)ofs % (NIDS_PER_BLOCK + 1)))
+	if (ofs >= 6 + 2 * NIDS_PER_BLOCK(sbi)) {
+		ofs -= 6 + 2 * NIDS_PER_BLOCK(sbi);
+		if (!((long)ofs % (NIDS_PER_BLOCK(sbi) + 1)))
 			return false;
 	}
 	return true;
@@ -370,13 +371,15 @@ static inline bool IS_DNODE(const struct folio *node_folio)
 
 static inline int set_nid(struct folio *folio, int off, nid_t nid, bool i)
 {
+	struct f2fs_sb_info *sbi = F2FS_F_SB(folio);
 	struct f2fs_node *rn = F2FS_NODE(folio);
 	__le32 *inode_nids = F2FS_INODE_NIDS(folio);
 
 	f2fs_folio_wait_writeback(folio, NODE, true, true);
 
 	if (i)
-		inode_nids[off - NODE_DIR1_BLOCK] = cpu_to_le32(nid);
+		inode_nids[off - NODE_DIR1_BLOCK(sbi)] =
+			cpu_to_le32(nid);
 	else
 		rn->in.nid[off] = cpu_to_le32(nid);
 	return folio_mark_dirty(folio);
@@ -386,9 +389,10 @@ static inline nid_t get_nid(const struct folio *folio, int off, bool i)
 {
 	struct f2fs_node *rn = F2FS_NODE(folio);
 	const __le32 *inode_nids = F2FS_INODE_NIDS(folio);
+	int nid_index = off - NODE_DIR1_BLOCK(F2FS_F_SB(folio));
 
 	if (i)
-		return le32_to_cpu(inode_nids[off - NODE_DIR1_BLOCK]);
+		return le32_to_cpu(inode_nids[nid_index]);
 	return le32_to_cpu(rn->in.nid[off]);
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index da97f0f38ea0..75713e639b63 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3890,7 +3890,7 @@ loff_t max_file_blocks(struct f2fs_sb_info *sbi, struct inode *inode)
 	loff_t leaf_count;
 
 	/*
-	 * note: previously, result is equal to (DEF_ADDRS_PER_INODE -
+	 * note: previously, result is equal to (DEF_ADDRS_PER_INODE(sbi) -
 	 * DEFAULT_INLINE_XATTR_ADDRS), but now f2fs try to reserve more
 	 * space in inode.i_addr, it will be more safe to reassign
 	 * result as zero.
@@ -3899,17 +3899,17 @@ loff_t max_file_blocks(struct f2fs_sb_info *sbi, struct inode *inode)
 	if (inode && f2fs_compressed_file(inode))
 		leaf_count = ADDRS_PER_BLOCK(inode);
 	else
-		leaf_count = DEF_ADDRS_PER_BLOCK;
+		leaf_count = DEF_ADDRS_PER_BLOCK(sbi);
 
 	/* two direct node blocks */
 	result += (leaf_count * 2);
 
 	/* two indirect node blocks */
-	leaf_count *= NIDS_PER_BLOCK;
+	leaf_count *= NIDS_PER_BLOCK(sbi);
 	result += (leaf_count * 2);
 
 	/* one double indirect node block */
-	leaf_count *= NIDS_PER_BLOCK;
+	leaf_count *= NIDS_PER_BLOCK(sbi);
 	result += leaf_count;
 
 	/*
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 4c9540981db4..9036cc6c2a2c 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -282,19 +282,9 @@ struct node_footer {
 #define DEF_NIDS_PER_INODE	5	/* Node IDs in an Inode */
 #define ADDRS_PER_INODE(inode)	addrs_per_page(inode, true)
 /* Address Pointers in a Direct Block */
-#define DEF_ADDRS_PER_BLOCK	((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
 #define ADDRS_PER_BLOCK(inode)	addrs_per_page(inode, false)
-/* Node IDs in an Indirect Block */
-#define NIDS_PER_BLOCK		((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
-
 #define ADDRS_PER_PAGE(folio, inode)	(addrs_per_page(inode, IS_INODE(folio)))
 
-#define	NODE_DIR1_BLOCK		(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) + 1)
-#define	NODE_DIR2_BLOCK		(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) + 2)
-#define	NODE_IND1_BLOCK		(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) + 3)
-#define	NODE_IND2_BLOCK		(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) + 4)
-#define	NODE_DIND_BLOCK		(F2FS_DEF_ADDRS_PER_INODE(F2FS_BLKSIZE) + 5)
-
 #define F2FS_INLINE_XATTR	0x01	/* file inline xattr flag */
 #define F2FS_INLINE_DATA	0x02	/* file inline data flag */
 #define F2FS_INLINE_DENTRY	0x04	/* file inline dentry flag */
-- 
2.53.0

