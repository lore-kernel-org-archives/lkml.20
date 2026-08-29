Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40B3F9F28
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025778; cv=pass; b=ZOZqDqv/sJXmD+UrbiUOKK72hUycNkNvYpVvgh3uBz+qfa2FYoliuZgkmXQXF0UwNOGUxBNnALjuw2oCSEjJi7TS2SmfIZlnEXC8DB7X3b3dnFwBkllU+DTT7CNngofRGv2U6Hqx/2fv1rhhwAx6vFe0C4for5LGNRQHjAXgoYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025778; c=relaxed/simple;
	bh=+aGc1KA0K5wi8chGACL8NUCmh6wES3I+uQtDCZ/nCls=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOqFJKSvLudQz6EpA18GERc5zLHTdQ93Pim8KgoPduoqHboVUjaLpagQaIXgB0mun50Ibjyb62YTvVjr49S409+Qp3yTcvI+iFJoP8ImKZsj1y/RuZu6xVXq2xQkokAx7G+1CSZoH31x4c64ealXKQONvVRvljK6fDk0PAsCcLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbdBjWBE; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbdBjWBE"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso3402121a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788025773; cv=none;
        d=google.com; s=arc-20260327;
        b=eFrVhsAJQ0j1RXdbLg6Ddv892WGE8nrfZ+K8S/KiLIRaiEmET0Rt8zFfMdiD875dwb
         oaVyRoBk/4of84Su+np1myGM7VUN864YCXfixVZkUrSJE6syDF2QALD/wBAwx+OGLXCW
         Ttc1QJ5WlJtnZcmIUTdD0msdd6mLbE9gDXqK5CbpAUlDp7Rq9V5Ma/kGQk+bAAeTOZ5Q
         SkyxRN67ujMucbFLbBqABRdIq3YOWre1Qq37T2WSBKtppNPRh7QycG7Qe8NRk21jsGzB
         0tzjZoefqHmpXs+T5ClMyyS/irGTWOYhvknuNdH8uAV6YvypLGQ91Ad+IH+dh5lS7qO/
         uLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=a3vUnhoZ0DDWhQkZH/JXhh0SaXXrmqevnGvD80vVTLY=;
        fh=eDX40yQVbzfivdk4A3Ws+eoz2rysdbRZeM+NFezln0s=;
        b=LJKU1zJMd5KNVsfwgfJXDU/6gD5iTKBHzeeW1sHueWIQ11k+n3u2O8e2GCkPZwxvSX
         tZhJLas2IEJyC5wdRWX1nyW7phSeVDsaRvmIy4ZQfnFoer41nbS9Tzt7gwbni5fntyGN
         a6zVPWXwCB1+X9je9DBqY/oNDRvYIo/8QdLAXaFcWRs3dHc11uf1RGR5/ZSERyCOaucI
         69tjWo44vV45Ng7DJK6UpFq7Rx/gk5gU8MYt590pJJk2KnE2OObkUnYF0/oGmmCbtZ3H
         awYUJq2SKp5dLGP+SSZNjoyWlt8TIoGGwHx83+xeAbQubuBxOZD+nE/NRThjh14/1rRP
         jLRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788025773; x=1788630573; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3vUnhoZ0DDWhQkZH/JXhh0SaXXrmqevnGvD80vVTLY=;
        b=rbdBjWBEOYjTVAhGnW+bgjq9vv31L2b/++Ga3komZeDDkF89MvxkhO6JvsxIgScUX/
         NbJ4vGL6Q+euBEmmRbFJDfTMdTfm5q22KWejSp3PGJElgOqk8LJvlSuKZZOGPNy9LWa+
         enWYQUCK7hcBhVAaYrNzL1ESh5cEW+wNkhsWJNvRefQGvbpylBq+xDlhHFiue/cVnCgd
         aBB8ahxdQPFw5/PsK+dZBF0+yUlsNjaQxSRJ/Bnv1oQU3FqQXLwzheMb3jGzbPs/mZrw
         Cl1DBC8oenPXfWS3IgeyRLmpSGu7K5OfntwjroddEpChasoLiJujcpMdoZbu4Afegujd
         ur7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025773; x=1788630573;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a3vUnhoZ0DDWhQkZH/JXhh0SaXXrmqevnGvD80vVTLY=;
        b=fO2ZtHawMs4e52qs68+4+eim1Yjg/sZbSWAdvmOegjx1hVxyaYG6/ESet+TRbAmRnS
         cVgwes4FTTR2B5doc+f2gAQi4LXh7aCXTqM8Qnov7i9JR1gdVbNe0BtBSh0weA8EG4x1
         00t/2H36s1dibXbZ0T13OwCXqzZpJmMo5nRXHceE5f2CAvvArTkht1LIvMinSGasQPCj
         bV+WVxg810B5KqiEj3w/qYLQ+HZ5uCSwAIJh4za36NdfkYBxEJUM7JCA8CGKTBOW7tze
         p/dJBRBALbkYCcBnR1XfccLf4pINE2bkaTu2Pk8fuKbq3Z/5HKzt8uEl6MdbDcifayZN
         3XAg==
X-Forwarded-Encrypted: i=1; AKwUvBw9sTjKlOeDpygJ4yRHMmyUutcS4IDCkM1MFQCbVb1MEUoi3dEbhEU2kemBdQGz9n4ugASYhJ8JNIioyNU=@vger.kernel.org
X-Gm-Message-State: AFuF++mcBDQH8nSTu0uiAf7mARoYLokpoDGqIQN5xon98u9Oruk4+/3o
	JnonArObr/CmHcl7Ksos2WiDHRM/ptKlyv+YpX1iKQfvtSHFT3entLjFvXTYUxAOxfhs/asKcTA
	tI0dewB/7Tlme4X4tpcrrS7HsTinJIdI=
X-Gm-Gg: AYBFou1bPLfSy/edRdwz/DXt4vyGbDQqQ7lMbIrtHfGdXIdNCQzRV/9MVXseXFMYWAS
	tF9nyjfplgqQ7a6cL6M/fFNgupc5EdCAreNItKkSMa2hUxwpZw39fFnuwLurTqDmHpn/dNU+ZZ3
	v97ntRl84a3P4ytsRCJTw7nDdNrrp4QgFtgr3DqHMnKhtx0D9akh4jzW8t6r+qmIZB4JwoaUisU
	UcYadtcEHWFtl6MIGWNY4MWtlxw3DrE77EQ3oXUiYf94xFB3FYaNtohA74Ii9eOt86hHhJWK/kv
	Y206KbJgsa/hXahsj2q01eRqBye5Hq/qFu3A5rbVXdNsBE91lBVd+M9Qb+a8QRpBORv/0HYpJj5
	jKw==
X-Received: by 2002:a05:6402:a0d2:b0:6a5:d6b5:cf80 with SMTP id
 4fb4d7f45d1cf-6a60d3933b6mr8655807a12.11.1788025772325; Sat, 29 Aug 2026
 10:49:32 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:31 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:31 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
References: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
Date: Sat, 29 Aug 2026 10:49:31 -0700
X-Gm-Features: AcwNN1WYntt6bHzdxzV2qW1yi22J731-ms4zmWjzx4Jb6zsBISTPIORQUtNU4Lg
Message-ID: <CAH=xXfGM-AsgPQFJjP29QGwuxoPH_O5VR6_308+KaSyDrFLYrw@mail.gmail.com>
Subject: [PATCH v2 06/11] f2fs: describe {i,d,id}node block layout dynamically
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
 fs/f2fs/f2fs.h          | 32 ++++++++++++++++++-------
 fs/f2fs/gc.c            |  2 +-
 fs/f2fs/inline.c        |  3 +--
 fs/f2fs/inode.c         |  5 ++--
 fs/f2fs/node.c          |  4 +---
 fs/f2fs/node.h          | 53 +++++++++++++++++++----------------------
 fs/f2fs/super.c         |  5 ++++
 include/linux/f2fs_fs.h | 26 +++++++++++++++-----
 9 files changed, 79 insertions(+), 53 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6ae0eb37d20f..751b7a457d9a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2027,7 +2027,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,

 		phys = F2FS_BLK_TO_BYTES(ni.blk_addr);
 		offset = offsetof(struct f2fs_inode, i_addr) +
-					sizeof(__le32) * (DEF_ADDRS_PER_INODE -
+					sizeof(__le32) * (DEF_ADDRS_PER_INODE_SBI(sbi) -
 					get_inline_xattr_addrs(inode));

 		phys += offset;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d2e54573ed34..247e56522441 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1853,6 +1853,9 @@ struct f2fs_sb_info {
 	unsigned int log_blocksize;		/* log2 block size */
 	unsigned int blocksize;			/* block size */
 	unsigned int nat_entries_per_block;	/* NAT entries in a block */
+	unsigned int addrs_per_inode;		/* addresses in an inode block */
+	unsigned int addrs_per_block;		/* addresses in a direct node block */
+	unsigned int nids_per_block;		/* node IDs in an indirect node block */
 	unsigned int sit_entries_per_block;	/* SIT entries in a block */
 	unsigned int orphans_per_block;	/* orphan inodes in a block */
 	unsigned int dentries_per_block;	/* dentries in a block */
@@ -2248,6 +2251,7 @@ static inline struct f2fs_sb_info
*F2FS_F_SB(const struct folio *folio)

 #define SIT_ENTRY_PER_BLOCK(sbi)	((sbi)->sit_entries_per_block)
 #define NAT_ENTRY_PER_BLOCK(sbi)	((sbi)->nat_entries_per_block)
+#define DEF_ADDRS_PER_INODE_SBI(sbi)	((sbi)->addrs_per_inode)
 #define F2FS_ORPHANS_PER_BLOCK(sbi)	((sbi)->orphans_per_block)
 #define GET_ORPHAN_BLOCKS(sbi, n)	DIV_ROUND_UP((n), \
 					F2FS_ORPHANS_PER_BLOCK(sbi))
@@ -2297,6 +2301,12 @@ static inline struct f2fs_checkpoint
*F2FS_CKPT(struct f2fs_sb_info *sbi)
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
@@ -2307,6 +2317,12 @@ static inline struct f2fs_inode
*F2FS_INODE(const struct folio *folio)
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
@@ -3277,13 +3293,11 @@ static inline void
f2fs_radix_tree_insert(struct radix_tree_root *root,
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
@@ -3292,9 +3306,11 @@ static inline int offset_in_addr(struct f2fs_inode *i)
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
@@ -3311,7 +3327,7 @@ static inline unsigned int get_dnode_base(struct
inode *inode,
 static inline __le32 *get_dnode_addr(struct inode *inode,
 					struct folio *node_folio)
 {
-	return blkaddr_in_node(F2FS_NODE(node_folio)) +
+	return blkaddr_in_node(node_folio) +
 			get_dnode_base(inode, node_folio);
 }

@@ -3639,7 +3655,7 @@ void *inline_xattr_addr(struct inode *inode,
const struct folio *folio)
 {
 	struct f2fs_inode *ri = F2FS_INODE(folio);

-	return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE -
+	return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE_SBI(F2FS_I_SB(inode)) -
 					get_inline_xattr_addrs(inode)]);
 }

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index c15c6ba91597..f15ab07a7347 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1176,7 +1176,7 @@ static bool is_alive(struct f2fs_sb_info *sbi,
struct f2fs_summary *sum,

 	if (IS_INODE(node_folio)) {
 		base = offset_in_addr(F2FS_INODE(node_folio));
-		max_addrs = DEF_ADDRS_PER_INODE;
+		max_addrs = DEF_ADDRS_PER_INODE_SBI(sbi);
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
@@ -150,9 +150,8 @@ bool f2fs_enable_inode_chksum(struct f2fs_sb_info
*sbi, struct folio *folio)

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
@@ -3001,7 +3001,6 @@ int f2fs_recover_inode_page(struct f2fs_sb_info
*sbi, struct folio *folio)
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
index 0dce97aac5fc..6a2b7c63f4a3 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -252,73 +252,68 @@ static inline void set_to_next_nat(struct
f2fs_sb_info *sbi,

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

 static inline void fill_node_footer_blkaddr(struct folio *folio,
block_t blkaddr)
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
@@ -378,11 +373,12 @@ static inline bool IS_DNODE(const struct folio
*node_folio)
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
@@ -391,9 +387,10 @@ static inline int set_nid(struct folio *folio,
int off, nid_t nid, bool i)
 static inline nid_t get_nid(const struct folio *folio, int off, bool i)
 {
 	struct f2fs_node *rn = F2FS_NODE(folio);
+	const __le32 *inode_nids = F2FS_INODE_NIDS(folio);

 	if (i)
-		return le32_to_cpu(rn->i.i_nid[off - NODE_DIR1_BLOCK]);
+		return le32_to_cpu(inode_nids[off - NODE_DIR1_BLOCK]);
 	return le32_to_cpu(rn->in.nid[off]);
 }

@@ -406,8 +403,7 @@ static inline nid_t get_nid(const struct folio
*folio, int off, bool i)

 static inline int is_node(const struct folio *folio, int type)
 {
-	struct f2fs_node *rn = F2FS_NODE(folio);
-	return le32_to_cpu(rn->footer.flag) & BIT(type);
+	return le32_to_cpu(F2FS_NODE_FOOTER(folio)->flag) & BIT(type);
 }

 #define is_cold_node(folio)	is_node(folio, COLD_BIT_SHIFT)
@@ -416,14 +412,13 @@ static inline int is_node(const struct folio
*folio, int type)

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
index 8d2224e585d3..fcaeaacaab33 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4384,6 +4384,11 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->blocksize = BIT(sbi->log_blocksize);
 	sbi->nat_entries_per_block = sbi->blocksize /
 		sizeof(struct f2fs_nat_entry);
+	sbi->addrs_per_inode = (sbi->blocksize - OFFSET_OF_END_OF_I_EXT -
+		SIZE_OF_I_NID - sizeof(struct node_footer)) / sizeof(__le32);
+	sbi->addrs_per_block = (sbi->blocksize -
+		sizeof(struct node_footer)) / sizeof(__le32);
+	sbi->nids_per_block = sbi->addrs_per_block;
 	sbi->sit_entries_per_block = sbi->blocksize /
 		sizeof(struct f2fs_sit_entry);
 	sbi->orphans_per_block = (sbi->blocksize -
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 23ca80fc4997..f339f83220f2 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -16,6 +16,7 @@
 #define F2FS_MAX_LOG_SECTOR_SIZE	PAGE_SHIFT	/* Max is Block Size */
 #define F2FS_LOG_SECTORS_PER_BLOCK	(PAGE_SHIFT - 9) /* log number for
sector/blk */
 #define F2FS_BLKSIZE			PAGE_SIZE /* support only block == page */
+#define F2FS_MAX_BLKSIZE		PAGE_SIZE
 #define F2FS_BLKSIZE_BITS		PAGE_SHIFT /* bits for F2FS_BLKSIZE */
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
 #define F2FS_EXTENSION_LEN		8	/* max size of extension */
@@ -343,18 +344,25 @@ struct f2fs_inode {
 						 */
 			__le32 i_extra_end[0];	/* for attribute size calculation */
 		} __packed;
-		__le32 i_addr[DEF_ADDRS_PER_INODE];	/* Pointers to data blocks */
+		__le32 i_addr[];		/* data block pointers */
 	};
-	__le32 i_nid[DEF_NIDS_PER_INODE];	/* direct(2), indirect(2),
-						double_indirect(1) node id */
+	/*
+	 * __le32 i_nid[DEF_NIDS_PER_INODE];
+	 *
+	 * It is stored immediately before the node footer at the end of the
+	 * filesystem block. Its offset depends on the filesystem block size, so
+	 * locate it dynamically with F2FS_INODE_NIDS().
+	 */
 } __packed;

 struct direct_node {
-	__le32 addr[DEF_ADDRS_PER_BLOCK];	/* array of data block address */
+	/* The address count depends on the filesystem block size. */
+	__le32 addr[];			/* array of data block address */
 } __packed;

 struct indirect_node {
-	__le32 nid[NIDS_PER_BLOCK];	/* array of data block address */
+	/* The node ID count depends on the filesystem block size. */
+	__le32 nid[];			/* array of data block address */
 } __packed;

 enum {
@@ -373,7 +381,13 @@ struct f2fs_node {
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
