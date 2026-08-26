Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54BF3BA23F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780401; cv=pass; b=pgxhrnak6wQWIIMwjM59DMrwxGjKFHzbOpOp/DVf1lWNog0FQfcX/NTBcYWuUyys3KcykXjgR85d+JrkbL6Gohn5TDVSRDeA9cAIPB32xDAUAnab5SD/vn/O/E56g/mtDPaxItD2zBf38U3QKCLXCkdQR7pxK2RSXqTrCw1pRfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780401; c=relaxed/simple;
	bh=il790Qh8ouORS9ItXr1smomGok8BB1WfSbINgiYK04c=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W36Zv8e9e7qweUz7O2LaLW7ubuCjXBCzIOpa6joIOGW/YCfEYOo476Adxyi/sAqiaxR3rHmQFFc8LGkX0APLothzXn/ck8RKf6GCA/jd/Pv8Nj/6hd4VS0e+Eu0E9sIY0NogMJUt4FaEXwThCQ5KTLjXia+xpMgrutkJmjQF4UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+DYJZhG; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+DYJZhG"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a5e329c0f2so1703180a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787780394; cv=none;
        d=google.com; s=arc-20260327;
        b=TSaWQaQbGBCXwRq4aOXEB7XKBPO+xd4rAj/sNSWLATauDCmqFORjwBYfFJOXdO7FxK
         USf4eizUf1GTjJ/Dva3p9K3eG/6JZhwOQV5WLH5JpoeCHScae1hykdyac3JY8m8UBFY/
         tFjy45Q8NsFdQ1T47vmnNSM9zkd3Ap8qUrpuJ9XSmFxKcWLprKY7fg1g7T0Y7KRMU0J5
         sOVijVNqX7HAWDwZj5RgMUsIRBvVoZLU7vfAID3Oq7whYJnAF/vHPBXmORRPsl0QJc8A
         I36tHmVq3OzJwfnp3PF69IM/29hszneb2kqyUdptJ9yE2VZK73t0L3vM0vkvjiBhpxv0
         0u6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=OdE2tE4SZovbK921ryjtFVs/TiWS2M8qf75lm4EcWdQ=;
        fh=TBZF2Qm5cebEeJ3TkvD66xd4JnbDdbvVcTqO/dJOH0A=;
        b=i53oZOTsiKLMmHl2r8xXrZHv1jWLHdpJxFDyN41IxeZsk1NtqthfqSncR6xU74JHO/
         TsBUg2ZL+nfoRIH2p1vH2hSLTq70oyuXzidzB2Q81y47xeVNu4dtVohV3RcChWtUyJuT
         zuaJWLu3MVwUe22UqtWh9B51NqrWDk43QcxJN2ERnRXY4gr62PnlKGQG2afPXY2QqfBh
         ulZm3m+GHoH+A994tbiOLWzZQ2DdV4G3Izwgf14cupIYoONIuEywSvaxnU+JMaCrwYz7
         9hcHZ9bS/dyOrr0DuBWWqxnbDdHdm8TRWnHtFhV+Nc2F5O/eMXpi37jKfPaReXCGDDA8
         FWXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787780394; x=1788385194; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OdE2tE4SZovbK921ryjtFVs/TiWS2M8qf75lm4EcWdQ=;
        b=Q+DYJZhG8R6WgRuubhPFRz1MurQVpUdlZDrN6/msUgIj8SWVIiMKKyJx99objbhVBX
         1/O6I4YRcxtQA3ylvUVOBKUCm/O9nC+WLIk5gbwfIIJ2TF8Yt+Xi9Ws+EMFe880USeiY
         J9TkgrYqUzCkuRjW9BNWSOP3IHEb6WByaWg2WIKw8FlxKdhQHqRz5Vm+ryfb/V6B8sUi
         adr+UZET5JFItH+sujzvVEB8B9vKZN4PD0FPGPsFECWR8X2JsCdZzzrkWbV3h94tr8C1
         e++q10YU94GIyJmP292f+rXF1FrzFIg7N3HQVkvKsU+ijB48qv6O/H/6YzEZn96qSqFc
         p31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780394; x=1788385194;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OdE2tE4SZovbK921ryjtFVs/TiWS2M8qf75lm4EcWdQ=;
        b=mj+TweAr/MJeGKtwDzBAZcVj973kYSgiFyWMrDFrsEp+4JBGbdzGREUCmzvn+Azize
         bUM0tOzuvHilICGLQxO5w/8z3tFI6KD2rVRztdpEKsHoNYtQGPxrPowJZBuIIvmPU+Dz
         jCzsK1tBd0P9aBM8ouBLw9dYOiyQr6Q2KpPw2gpH9d41Wuwwv+24ry2SdPRmaZCxUDUY
         7lspG7Hq6GCrOHSyEtAYsa45dyAodiF2wbiLKc82Vq5Ggz5sEEsxmBL2HmJIYrz+raG+
         xQUAQHtNnZayO2UFt2Cfj+AhKiBIo6Fkm5OUpZRss3hOAnhxaB1IA6cLOfca3G1FlmRD
         5FPA==
X-Forwarded-Encrypted: i=1; AHgh+RpaPlKVfzDpj/bisO7cHrVIkhD+7wMxVBxOVioN8jVlR4lvmLUBGGtHn/ySfajGVRifMHD+lODrPDql5NA=@vger.kernel.org
X-Gm-Message-State: AFuF++nkC6c6sEhNyubXiqmGLC4UFDMPWt63V6UpFQ1hCC2aOgHNkr+A
	7lmlP3bNFKl6SDg6VtlrVYMjXR5Wxodgr+Y6I5+M5PCo8aNcnVkFT7OyjgpY27LCCRPEjsCLk3g
	Y819pRNWkyVCY9l7yy9iZlMOxwhJe5m3lKfJmfoA=
X-Gm-Gg: AR+sD13QHarykN2mEY+2rWX1jbhPaHXxquyafo9LLtdTdB8YIzwnrsn5tAgGQB2Igtf
	N2cBGTRjy+ZKBg5dyILBAoq7L/u5bTf3AmF5vXFDCE9zhdwfY+F5NkceuEhuOwg6BNrBZPbL1DO
	AKJ7jZjgM6piwktNmoltnFQiLP79zHmjPaIpun+9PXqqyV4JIIRG7oCajIUURSuuwozGPqVH4FA
	gJaqYCUztem8ZuSpxiSRVOc+L2uWHe6G1WqpR72mprwvrJ/njQ0wFQlbwYaAwYYwe2ILL032bnZ
	gnX2Zo+X3KKpB/xk+JoXgStJGckTNKDA1Y0g33VIxDlUjcVuPDF3rQ9Z7Oovqdqg3osoZ0l72O9
	1
X-Received: by 2002:a05:6402:504d:b0:6a5:d6b5:cf80 with SMTP id
 4fb4d7f45d1cf-6a5df62099amr12557395a12.11.1787780393640; Wed, 26 Aug 2026
 14:39:53 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:52 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Aug 2026 16:39:52 -0500
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
References: <CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com>
Date: Wed, 26 Aug 2026 16:39:52 -0500
X-Gm-Features: AcwNN1UjKRqo2AqQlvvf01g0D71uwgUFZX0PGdW4Pee1BMpqjid7-3LsLlmYLs4
Message-ID: <CAH=xXfHJvJ+GCgBDa33DpTXcanSW+DFwYh3NWq6EvfvH=fPEoA@mail.gmail.com>
Subject: [PATCH 5/5] f2fs: describe inode node layout dynamically
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

An inode node block ends with its five i_nid entries followed by the node
footer. Because the i_addr array spans all preceding space, the offset of
i_nid depends on the filesystem block size.

Describe f2fs_inode and the direct and indirect node types with
maximum-size arrays, then calculate the locations of i_nid and the node
footer from the actual filesystem block size. Replace all direct accesses
to those tail fields with F2FS_INODE_NIDS() and F2FS_NODE_FOOTER().

Keep the former i_nid and footer declarations as comments documenting the
exact on-disk layout. This is a layout-only cleanup while the filesystem
block size is still fixed; the following change makes the helpers use the
runtime geometry.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/data.c          |  2 +-
 fs/f2fs/f2fs.h          | 30 ++++++++++++++++-------
 fs/f2fs/gc.c            |  2 +-
 fs/f2fs/inline.c        |  3 +--
 fs/f2fs/inode.c         |  5 ++--
 fs/f2fs/node.c          |  4 +---
 fs/f2fs/node.h          | 53 +++++++++++++++++++----------------------
 fs/f2fs/super.c         |  2 ++
 include/linux/f2fs_fs.h | 26 +++++++++++++++-----
 9 files changed, 74 insertions(+), 53 deletions(-)

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
index 026419aed2e9..1413aa7acc09 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1851,6 +1851,7 @@ struct f2fs_sb_info {
 	unsigned int log_sectors_per_block;	/* log2 sectors per block */
 	unsigned int log_blocksize;		/* log2 block size */
 	unsigned int blocksize;			/* block size */
+	unsigned int addrs_per_inode;		/* addresses in an inode block */
 	unsigned int sit_entries_per_block;	/* SIT entries in a block */
 	unsigned int orphans_per_block;	/* orphan inodes in a block */
 	unsigned int dentries_per_block;	/* dentries in a block */
@@ -2244,6 +2245,7 @@ static inline struct f2fs_sb_info
*F2FS_F_SB(const struct folio *folio)
 }

 #define SIT_ENTRY_PER_BLOCK(sbi)	((sbi)->sit_entries_per_block)
+#define DEF_ADDRS_PER_INODE_SBI(sbi)	((sbi)->addrs_per_inode)
 #define F2FS_ORPHANS_PER_BLOCK(sbi)	((sbi)->orphans_per_block)
 #define GET_ORPHAN_BLOCKS(sbi, n)	DIV_ROUND_UP((n), \
 					F2FS_ORPHANS_PER_BLOCK(sbi))
@@ -2293,6 +2295,12 @@ static inline struct f2fs_checkpoint
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
@@ -2303,6 +2311,12 @@ static inline struct f2fs_inode
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
@@ -3273,13 +3287,11 @@ static inline void
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
@@ -3288,9 +3300,11 @@ static inline int offset_in_addr(struct f2fs_inode *i)
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
@@ -3307,7 +3321,7 @@ static inline unsigned int get_dnode_base(struct
inode *inode,
 static inline __le32 *get_dnode_addr(struct inode *inode,
 					struct folio *node_folio)
 {
-	return blkaddr_in_node(F2FS_NODE(node_folio)) +
+	return blkaddr_in_node(node_folio) +
 			get_dnode_base(inode, node_folio);
 }

@@ -3635,7 +3649,7 @@ void *inline_xattr_addr(struct inode *inode,
const struct folio *folio)
 {
 	struct f2fs_inode *ri = F2FS_INODE(folio);

-	return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE -
+	return (void *)&(ri->i_addr[DEF_ADDRS_PER_INODE_SBI(F2FS_I_SB(inode)) -
 					get_inline_xattr_addrs(inode)]);
 }

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 0c17038fcfd7..666acf9d528a 100644
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
index bac1e360d966..046cc21547eb 100644
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
index 968e5ed38816..3c8bb24e68b6 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2993,7 +2993,6 @@ int f2fs_recover_inode_page(struct f2fs_sb_info
*sbi, struct folio *folio)
 int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
 			unsigned int segno, struct f2fs_summary_block *sum)
 {
-	struct f2fs_node *rn;
 	struct f2fs_summary *sum_entry;
 	block_t addr;
 	int i, idx, last_offset, nrpages;
@@ -3015,8 +3014,7 @@ int f2fs_restore_node_summary(struct f2fs_sb_info *sbi,
 			if (IS_ERR(folio))
 				return PTR_ERR(folio);

-			rn = F2FS_NODE(folio);
-			sum_entry->nid = rn->footer.nid;
+			sum_entry->nid = F2FS_NODE_FOOTER(folio)->nid;
 			sum_entry->version = 0;
 			sum_entry->ofs_in_node = 0;
 			sum_entry++;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 5e114f352099..6e0097486e9b 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -242,73 +242,68 @@ static inline void set_to_next_nat(struct
f2fs_nm_info *nm_i, nid_t start_nid)

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
@@ -368,11 +363,12 @@ static inline bool IS_DNODE(const struct folio
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
@@ -381,9 +377,10 @@ static inline int set_nid(struct folio *folio,
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

@@ -396,8 +393,7 @@ static inline nid_t get_nid(const struct folio
*folio, int off, bool i)

 static inline int is_node(const struct folio *folio, int type)
 {
-	struct f2fs_node *rn = F2FS_NODE(folio);
-	return le32_to_cpu(rn->footer.flag) & BIT(type);
+	return le32_to_cpu(F2FS_NODE_FOOTER(folio)->flag) & BIT(type);
 }

 #define is_cold_node(folio)	is_node(folio, COLD_BIT_SHIFT)
@@ -406,14 +402,13 @@ static inline int is_node(const struct folio
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
index 133c279b9931..1f6dcb890eab 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4348,6 +4348,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 		le32_to_cpu(raw_super->log_sectors_per_block);
 	sbi->log_blocksize = le32_to_cpu(raw_super->log_blocksize);
 	sbi->blocksize = BIT(sbi->log_blocksize);
+	sbi->addrs_per_inode = (sbi->blocksize - OFFSET_OF_END_OF_I_EXT -
+		SIZE_OF_I_NID - sizeof(struct node_footer)) / sizeof(__le32);
 	sbi->sit_entries_per_block = sbi->blocksize /
 		sizeof(struct f2fs_sit_entry);
 	sbi->orphans_per_block = (sbi->blocksize -
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index b4bb4e2f99b3..34c19bcd50e3 100644
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
+	__le32 addr[(F2FS_MAX_BLKSIZE - sizeof(struct node_footer)) /
+			sizeof(__le32)];	/* array of data block address */
 } __packed;

 struct indirect_node {
-	__le32 nid[NIDS_PER_BLOCK];	/* array of data block address */
+	__le32 nid[(F2FS_MAX_BLKSIZE - sizeof(struct node_footer)) /
+			sizeof(__le32)];	/* array of data block address */
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
