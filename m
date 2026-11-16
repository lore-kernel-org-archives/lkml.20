Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802144;
	b=B/IQaDCNRYJtLBFWFUEIXcqBbFQ809w+89dlFZudmP56peJUOOZ/hY724Z9X9G/auZTO
	 HooFBdZyZm2bwN3VmZZ4iY3TyLf7HILct8DmLPtKyZw4I7QfQuHrGsrwY2ibMqLg+s1bt
	 cpy8HvQIGShtnaYMwnVh9CWFgTPWVT0eZCbYJ8lE25mfTB28pf3P4cawLUQvZETGIaxpi
	 3XlygCqacGxfIg0hmT20YDUKdbINhRr+vScF+m1hfhZMPvN+0W6TqEDvBphad54YZ7u9X
	 C3H//QTPH1CzTSi2Aam7ATlV9iAPlLSLWoTWV3Tw7xR7XGb1kcfqarpsU5wQZPgFfyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ni4OGtBntQFfDiHFAh2+umVCtkXEiVh2XmKbvv86p/c=;
	b=5EK7HRH4kbNccqoZ1Bum1q/Y9+bgZjjyzCFOXdeVguFuFbmfh7FCBvG3KKUA7zUzUFNE
	 3ru92ij23P9lSrURxeaHSKpPAs7tT08AD0IebAPlMi4x6S8yLYlCDg1OGfQn/nNLxLezi
	 h4sbNO6CUAsrkhpBw/5LHLhdJwv8Xz9mLEN1N7cFtsKMI4oyPzRXcbiYwDTa++KZJb+/l
	 IJQlekbqSAI31+E6DEy5T9SZYkGVKxRQFEiH+EqVHVIYu9RCsSOKAa5W49V1WaEntX8wy
	 bY/XFw/+saSnLiVBP95OMam2nwX4Ocol3LAlB2oDHvRZHDkfeACB09/9rvDwDylXBfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+0xaKLo;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF1D606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF1D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+0xaKLo
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so2455507a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802143; x=1795406943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ni4OGtBntQFfDiHFAh2+umVCtkXEiVh2XmKbvv86p/c=;
        b=S+0xaKLoURX/7R4jBiDE9C/R+ANsNZ+uaqSxaFWlT4XkEj7W/mQVfz4eaViK4fCd9R
         iDXDxCpScjLTILf6YV1Fh05KwbnYo0PBrQ4qCzoQHP7RgLYibeeAF/33v4WX9orajaZB
         M2C8VYKOPhyXPHSC2W/rOS9Jzi5r7o6ULumZhck1sr0glL72g2gNPPpGQiKOxy1pBBQc
         YfiIyjVubsMKaP6GY1OEY1d72UFnq2wTwV4DE+kK/jJaaSrrYE3qxdvmv8iyQUeNPNHz
         SrzV1TEQ9YaOnJi/CP9WrOHVgqN9j42ibEVV/+HsJSfA/DeX9RJpJ8LwdeE4zqbSdQrX
         Pv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802143; x=1795406943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ni4OGtBntQFfDiHFAh2+umVCtkXEiVh2XmKbvv86p/c=;
        b=gMQJ22C33/vlnvWh6ZC+1/tamti7s5ZfcSIaHxyyHrroxyJzDucq92s6Aa1CnWtHEp
         2mut8UVJ0pd/rMWCILU41g8g0lv0+4imS2Zvz7Y7+Y8/K/JdCUEff79bL4PF1gH68leq
         /BX0d3MAacuO3l253ez8t3SHXT+WeOXMF0DkIi1edP5slNiqxnYth+gQmVoBLe5IgEsf
         NinhcZqYAqhK8rQJC12bZwxJTMvMuhobp/7HkjurvqppBjqbLC0MT5E0vM9jJuGbtVzf
         CR6mMaja5v0YtrF0vtXz/h53eNd+HVDKls8HA+DODZ6YiBDDJtdqYBS8+2SMQ+0++E/P
         1I6Q==
X-Gm-Message-State: APuU4Z/qdDVT3aPxdDIhbhG79OklAKVQSXymICQoAQbLTzdTM/ovn73B
	5ca0xqQSTUQ32NGfZ3vu8YXO9x2kJ2OJIMiM8vn/oMY/esoO2cLdkmE4nW4A8Q==
X-Gm-Gg: AYBFou0Y1Kis7Nvhm2/C1gE9fQBo+kSj+HKMT5QoswsQqxAlEU8JxDRiYOmPhlAeKIJ
	9y0Cg9dl2Jr313P1EjbXqq5IdWK/MvpEUJzqQNA20ZgkF4+XIwPTkOKyJr6M+mDvtS+Qxc9PN+V
	R7yzlUZikikucTe1VnqgFyXosZGMg0ET+cPKcM1OURzzZLfJNss8xPLmwDv1RTQWbE1teb3M2T/
	pZKpWX03WEhAzcgPE7R5vK5kzP2PpDkXLGDqlJKWox6SXIvY91UiVXt7QGN6aPOcL8k3v5dCGqO
	1yGBOFiL/fEEeZxPJ4UWY1vqrO9rDWD1FJ30IsQ22/+t4zKuQwO/x3cdIjxGC8yVSdAWShRygQG
	NBAict1cHDgUqts74LU9cXogkBvjx0KG7btJOvrn4GVW9eKZklUJSS76LIZJcyB/5ap4Q56oCch
	Pgl2965rRHH/2KV4KaWrkC0FYfg4cwUYuSmS34oiOhokkCiIoHQWtoLYfZInpw5CHZAVj3tuuXC
	gneOGjhaqzNrFL4zDhTp36dmswt6/OsDYMthB/9tOcyGAtKlYQFlf4Suooy5hztUdcKQ137OSU7
	QmwwW4FFHMeqCJmYteR7aUoZazfR432xvzi8RllEXXnycNx8tkcPCXqvnjTxIdXam+sTGdH2QXb
	HxOJ4w9QdwRhIb5GBHhTA4fNY2bEcuvJLpXxyewCjKWFxkhLfm1iAcd9lw5WEw20fL+qu
X-Received: by 2002:a17:90b:5105:b0:3ac:a5ff:2cc3 with SMTP id 98e67ed59e1d1-3b1b081ad46mr9077275a91.8.1794802143010;
        Sun, 15 Nov 2026 20:09:03 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:00 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 02/20] f2fs: support subpage block size superblock and mount
Date: Sun, 15 Nov 2026 20:08:33 -0800
Message-ID: <20261116040851.2849696-3-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Add the infrastructure to mount F2FS with a block size smaller than
PAGE_SIZE, e.g. 4KB blocks on a 16KB page kernel.

- Add helpers to convert between block indices, folio indices and
  offsets within a folio.
- Take the block size from the 1st superblock, which is at the same
  offset for every block size. If it is invalid, probe the 2nd
  superblock with each supported block size from the smallest, and
  stop at the first one found, even if it is invalid, so that a stale
  superblock of a larger block size is not picked.
- Allow log_blocksize up to PAGE_SHIFT, and write back only the target
  superblock block instead of the whole folio.
- Bound log_sectorsize by log_blocksize, so that
  log_sectors_per_block + log_sectorsize cannot wrap around, and remove
  F2FS_MAX_LOG_SECTOR_SIZE, which has no user left.
- Check the requested inline_xattr_size, not the current one,
  against the block size in f2fs_check_opt_consistency().
- Keep rejecting subpage block sizes, and return -EOPNOTSUPP for the
  features that do not support them yet. Later patches add the support
  and lift these restrictions.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/compress.c      |   2 +
 fs/f2fs/f2fs.h          |  61 +++++++++++---
 fs/f2fs/file.c          |  42 ++++++++++
 fs/f2fs/super.c         | 178 +++++++++++++++++++++++++++++-----------
 fs/f2fs/verity.c        |   3 +
 include/linux/f2fs_fs.h |   2 +-
 6 files changed, 226 insertions(+), 62 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c7910688c318..0b0f31af6626 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -550,6 +550,8 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
 {
 	if (!f2fs_compressed_file(inode))
 		return true;
+	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode)))
+		return false;
 	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 50a5f845176d..3f83d01489d4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1372,11 +1372,11 @@ struct f2fs_io_info {
 };
 
 #define F2FS_FIO_LBLK(fio)						\
-	(((fio)->folio)->index + (fio)->folio_offset)
+	(f2fs_folio_lblk((fio)->sbi, (fio)->folio) + (fio)->folio_offset)
 #define F2FS_FIO_BLKCNT(fio)						\
 	((fio)->folio_blkcnt)
 #define F2FS_FIO_BIO_OFFSET(fio)					\
-	((fio)->folio_offset << PAGE_SHIFT)
+	F2FS_BLK_TO_BYTES((fio)->sbi, (fio)->folio_offset)
 #define F2FS_FIO_BIO_SIZE(fio)					\
 	F2FS_BLK_TO_BYTES((fio)->sbi, F2FS_FIO_BLKCNT(fio))
 
@@ -2326,19 +2326,59 @@ static inline void make_dentry_ptr_block(struct inode *inode,
 					SIZE_OF_DIR_ENTRY * entries;
 }
 
+static inline unsigned int f2fs_blocks_per_folio(struct f2fs_sb_info *sbi,
+						 const struct folio *folio)
+{
+	return F2FS_BYTES_TO_BLK(sbi, folio_size(folio));
+}
+
+static inline bool f2fs_has_subpage_blocks(struct f2fs_sb_info *sbi)
+{
+	return F2FS_BLKSIZE(sbi) < PAGE_SIZE;
+}
+
+static inline pgoff_t f2fs_folio_lblk(struct f2fs_sb_info *sbi,
+				      const struct folio *folio)
+{
+	return F2FS_BYTES_TO_BLK(sbi, folio_pos(folio));
+}
+
+static inline pgoff_t f2fs_lblk_to_folio_index(struct f2fs_sb_info *sbi,
+					       pgoff_t index)
+{
+	return F2FS_BLK_TO_BYTES(sbi, index) >> PAGE_SHIFT;
+}
+
+static inline pgoff_t f2fs_folio_blk_offset(struct f2fs_sb_info *sbi,
+					     const struct folio *folio,
+					     pgoff_t index)
+{
+	return index - f2fs_folio_lblk(sbi, folio);
+}
+
+static inline size_t f2fs_folio_byte_offset(struct f2fs_sb_info *sbi,
+					     const struct folio *folio,
+					     pgoff_t index)
+{
+	return F2FS_BLK_TO_BYTES(sbi, f2fs_folio_blk_offset(sbi, folio, index));
+}
+
+static inline void *f2fs_folio_lblk_address(struct f2fs_sb_info *sbi,
+					    struct folio *folio, pgoff_t index)
+{
+	return folio_address(folio) + f2fs_folio_byte_offset(sbi, folio, index);
+}
+
 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
 {
 	return (struct f2fs_super_block *)(sbi->raw_super);
 }
 
-static inline struct f2fs_super_block *F2FS_SUPER_BLOCK(struct folio *folio,
-								pgoff_t index)
+static inline struct f2fs_super_block *
+F2FS_SUPER_BLOCK(struct f2fs_sb_info *sbi, struct folio *folio, pgoff_t index)
 {
-	pgoff_t idx_in_folio = index % folio_nr_pages(folio);
-
 	return (struct f2fs_super_block *)
-		(page_address(folio_page(folio, idx_in_folio)) +
-						F2FS_SUPER_OFFSET);
+		(f2fs_folio_lblk_address(sbi, folio, index) + F2FS_SUPER_OFFSET);
 }
 
 static inline struct f2fs_checkpoint *F2FS_CKPT(struct f2fs_sb_info *sbi)
@@ -3905,11 +3945,10 @@ static inline bool f2fs_is_time_consistent(struct inode *inode)
 
 static inline bool f2fs_skip_inode_update(struct inode *inode, int dsync)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	bool ret;
 
 	if (dsync) {
-		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-
 		spin_lock(&sbi->inode_lock[DIRTY_META]);
 		ret = list_empty(&F2FS_I(inode)->gdirty_list);
 		spin_unlock(&sbi->inode_lock[DIRTY_META]);
@@ -3917,7 +3956,7 @@ static inline bool f2fs_skip_inode_update(struct inode *inode, int dsync)
 	}
 	if (!is_inode_flag_set(inode, FI_AUTO_RECOVER) ||
 			file_keep_isize(inode) ||
-			i_size_read(inode) & ~PAGE_MASK)
+			i_size_read(inode) & F2FS_BLKSIZE_MASK(sbi))
 		return false;
 
 	if (!f2fs_is_time_consistent(inode))
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f8a444064ec8..5a6f0ff9f377 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2207,6 +2207,15 @@ static long f2fs_fallocate(struct file *file, int mode,
 		goto out;
 	}
 
+	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
+		if ((mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)) ||
+		    f2fs_is_pinned_file(inode) || f2fs_is_atomic_file(inode) ||
+		    f2fs_compressed_file(inode)) {
+			ret = -EOPNOTSUPP;
+			goto out;
+		}
+	}
+
 	ret = file_modified(file);
 	if (ret)
 		goto out;
@@ -2455,6 +2464,9 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	loff_t isize;
 	int ret;
 
+	if (f2fs_has_subpage_blocks(sbi))
+		return -EOPNOTSUPP;
+
 	if (!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
@@ -3262,6 +3274,9 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
 	struct f2fs_defragment range;
 	int err;
 
+	if (f2fs_has_subpage_blocks(sbi))
+		return -EOPNOTSUPP;
+
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
@@ -3484,6 +3499,9 @@ static int f2fs_ioc_move_range(struct file *filp, unsigned long arg)
 {
 	struct f2fs_move_range range;
 
+	if (f2fs_has_subpage_blocks(F2FS_I_SB(file_inode(filp))))
+		return -EOPNOTSUPP;
+
 	if (copy_from_user(&range, (struct f2fs_move_range __user *)arg,
 							sizeof(range)))
 		return -EFAULT;
@@ -3734,6 +3752,9 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	__u32 pin;
 	int ret = 0;
 
+	if (f2fs_has_subpage_blocks(sbi))
+		return -EOPNOTSUPP;
+
 	if (get_user(pin, (__u32 __user *)arg))
 		return -EFAULT;
 
@@ -4114,6 +4135,9 @@ static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
 	__u64 block_count;
 
+	if (f2fs_has_subpage_blocks(sbi))
+		return -EOPNOTSUPP;
+
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
@@ -4131,6 +4155,9 @@ static int f2fs_ioc_enable_verity(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 
+	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode)))
+		return -EOPNOTSUPP;
+
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
 
 	if (!f2fs_sb_has_verity(F2FS_I_SB(inode))) {
@@ -4311,6 +4338,9 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	int ret;
 	int writecount;
 
+	if (f2fs_has_subpage_blocks(sbi))
+		return -EOPNOTSUPP;
+
 	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
 
@@ -4506,6 +4536,9 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	unsigned int reserved_blocks = 0;
 	int ret;
 
+	if (f2fs_has_subpage_blocks(sbi))
+		return -EOPNOTSUPP;
+
 	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
 
@@ -4827,6 +4860,9 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	struct f2fs_comp_option option;
 	int ret = 0;
 
+	if (f2fs_has_subpage_blocks(sbi))
+		return -EOPNOTSUPP;
+
 	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
 
@@ -4965,6 +5001,9 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 	pgoff_t page_idx = 0, last_idx, cluster_idx;
 	int ret;
 
+	if (f2fs_has_subpage_blocks(sbi))
+		return -EOPNOTSUPP;
+
 	if (!f2fs_sb_has_compression(sbi) ||
 			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
 		return -EOPNOTSUPP;
@@ -5046,6 +5085,9 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	pgoff_t page_idx = 0, last_idx, cluster_idx;
 	int ret;
 
+	if (f2fs_has_subpage_blocks(sbi))
+		return -EOPNOTSUPP;
+
 	if (!f2fs_sb_has_compression(sbi) ||
 			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
 		return -EOPNOTSUPP;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78dbf1e92285..f17bae198fe5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1613,8 +1613,8 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		min_size = MIN_INLINE_XATTR_SIZE;
 		max_size = MAX_INLINE_XATTR_SIZE(F2FS_BLKSIZE(sbi));
 
-		if (F2FS_OPTION(sbi).inline_xattr_size < min_size ||
-				F2FS_OPTION(sbi).inline_xattr_size > max_size) {
+		if (F2FS_CTX_INFO(ctx).inline_xattr_size < min_size ||
+				F2FS_CTX_INFO(ctx).inline_xattr_size > max_size) {
 			f2fs_err(sbi, "inline xattr size is out of range: %d ~ %d",
 				 min_size, max_size);
 			return -EINVAL;
@@ -4000,7 +4000,7 @@ static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
 	folio_lock(folio);
 	folio_wait_writeback(folio);
 	if (update)
-		memcpy(F2FS_SUPER_BLOCK(folio, index), F2FS_RAW_SUPER(sbi),
+		memcpy(F2FS_SUPER_BLOCK(sbi, folio, index), F2FS_RAW_SUPER(sbi),
 					sizeof(struct f2fs_super_block));
 	folio_mark_dirty(folio);
 	folio_clear_dirty_for_io(folio);
@@ -4010,9 +4010,10 @@ static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
 	bio = bio_alloc(sbi->sb->s_bdev, 1, opf, GFP_NOFS);
 
 	/* it doesn't need to set crypto context for superblock update */
-	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(sbi, folio->index);
+	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(sbi, index);
 
-	if (!bio_add_folio(bio, folio, folio_size(folio), 0))
+	if (!bio_add_folio(bio, folio, F2FS_BLKSIZE(sbi),
+			   f2fs_folio_byte_offset(sbi, folio, index)))
 		f2fs_bug_on(sbi, 1);
 
 	ret = submit_bio_wait(bio);
@@ -4025,7 +4026,7 @@ static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
 static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 					struct folio *folio, pgoff_t index)
 {
-	struct f2fs_super_block *raw_super = F2FS_SUPER_BLOCK(folio, index);
+	struct f2fs_super_block *raw_super = F2FS_SUPER_BLOCK(sbi, folio, index);
 	struct super_block *sb = sbi->sb;
 	u32 segment0_blkaddr = le32_to_cpu(raw_super->segment0_blkaddr);
 	u32 cp_blkaddr = le32_to_cpu(raw_super->cp_blkaddr);
@@ -4107,11 +4108,13 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 			res = "internally";
 		} else {
 			/*
-			 * __f2fs_commit_super() will access log_blocksize
-			 * in SECTOR_FROM_BLOCK(), init it in advance.
+			 * __f2fs_commit_super() will access log_blocksize and
+			 * blocksize to locate the superblock, init them in
+			 * advance.
 			 */
 			sbi->log_blocksize =
 				le32_to_cpu(raw_super->log_blocksize);
+			sbi->blocksize = BIT(sbi->log_blocksize);
 			err = __f2fs_commit_super(sbi, folio, index, false);
 			res = err ? "failed" : "done";
 		}
@@ -4129,7 +4132,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 {
 	block_t segment_count, segs_per_sec, secs_per_zone, segment_count_main;
 	block_t total_sections, blocks_per_seg;
-	struct f2fs_super_block *raw_super = F2FS_SUPER_BLOCK(folio, index);
+	struct f2fs_super_block *raw_super = F2FS_SUPER_BLOCK(sbi, folio, index);
 	size_t crc_offset = 0;
 	__u32 crc = 0;
 
@@ -4155,14 +4158,23 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 		}
 	}
 
-	/* only support block_size equals to PAGE_SIZE */
-	if (le32_to_cpu(raw_super->log_blocksize) != PAGE_SHIFT) {
-		f2fs_info(sbi, "Invalid log_blocksize (%u), supports only %u",
+	/* Keep one or more filesystem blocks in each base-page folio. */
+	if (le32_to_cpu(raw_super->log_blocksize) <
+			F2FS_MIN_LOG_BLOCKSIZE ||
+			le32_to_cpu(raw_super->log_blocksize) > F2FS_MAX_LOG_BLOCKSIZE) {
+		f2fs_info(sbi, "Invalid log_blocksize (%u), supports %u..%u",
 			  le32_to_cpu(raw_super->log_blocksize),
-			  PAGE_SHIFT);
+			  F2FS_MIN_LOG_BLOCKSIZE, F2FS_MAX_LOG_BLOCKSIZE);
 		return -EFSCORRUPTED;
 	}
 
+	/* Subpage block size is enabled after all paths support it. */
+	if (le32_to_cpu(raw_super->log_blocksize) != PAGE_SHIFT) {
+		f2fs_info(sbi, "Subpage block size (%u) is not supported yet",
+			  le32_to_cpu(raw_super->log_blocksize));
+		return -EOPNOTSUPP;
+	}
+
 	/* check log blocks per segment */
 	if (le32_to_cpu(raw_super->log_blocks_per_seg) != 9) {
 		f2fs_info(sbi, "Invalid log blocks per segment (%u)",
@@ -4172,7 +4184,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 
 	/* Currently, support 512/1024/2048/4096/16K bytes sector size */
 	if (le32_to_cpu(raw_super->log_sectorsize) >
-				F2FS_MAX_LOG_SECTOR_SIZE ||
+				le32_to_cpu(raw_super->log_blocksize) ||
 		le32_to_cpu(raw_super->log_sectorsize) <
 				F2FS_MIN_LOG_SECTOR_SIZE) {
 		f2fs_info(sbi, "Invalid log sectorsize (%u)",
@@ -4181,7 +4193,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	}
 	if (le32_to_cpu(raw_super->log_sectors_per_block) +
 		le32_to_cpu(raw_super->log_sectorsize) !=
-			F2FS_MAX_LOG_SECTOR_SIZE) {
+			le32_to_cpu(raw_super->log_blocksize)) {
 		f2fs_info(sbi, "Invalid log sectors per block(%u) log sectorsize(%u)",
 			  le32_to_cpu(raw_super->log_sectors_per_block),
 			  le32_to_cpu(raw_super->log_sectorsize));
@@ -4697,6 +4709,61 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 }
 #endif
 
+static int check_super_block(struct f2fs_sb_info *sbi,
+			     struct f2fs_super_block *super,
+			     int block, int *valid_super_block,
+			     struct f2fs_super_block **raw_super)
+{
+	struct folio *folio;
+	int err;
+
+	folio = read_mapping_folio(sbi->sb->s_bdev->bd_mapping,
+				   f2fs_lblk_to_folio_index(sbi, block), NULL);
+	if (IS_ERR(folio)) {
+		f2fs_err(sbi, "Unable to read %dth superblock", block + 1);
+		return PTR_ERR(folio);
+	}
+
+	if (block) {
+		struct f2fs_super_block *raw =
+				F2FS_SUPER_BLOCK(sbi, folio, block);
+		bool magic_ok = le32_to_cpu(raw->magic) == F2FS_SUPER_MAGIC;
+		u32 log_bs = le32_to_cpu(raw->log_blocksize);
+
+		/* Skip unmatched magic during probing to avoid noisy logs */
+		if (!*raw_super && !magic_ok) {
+			err = -ENOENT;
+			goto out_put;
+		}
+
+		/*
+		 * The 2nd superblock was located with sbi->log_blocksize.
+		 * Check it before sanity_check_raw_super(), which may write
+		 * the superblock back with its own log_blocksize. Leave an
+		 * unmatched magic for sanity_check_raw_super() to report.
+		 */
+		if (magic_ok && log_bs != sbi->log_blocksize) {
+			f2fs_info(sbi, "Mismatched log_blocksize (%u) in 2nd superblock, expected %u",
+				  log_bs, sbi->log_blocksize);
+			err = -EFSCORRUPTED;
+			goto out_put;
+		}
+	}
+
+	err = sanity_check_raw_super(sbi, folio, block);
+	if (!err && !*raw_super) {
+		memcpy(super, F2FS_SUPER_BLOCK(sbi, folio, block),
+		       sizeof(*super));
+		*valid_super_block = block;
+		*raw_super = super;
+		sbi->log_blocksize = le32_to_cpu(super->log_blocksize);
+		sbi->blocksize = BIT(sbi->log_blocksize);
+	}
+out_put:
+	folio_put(folio);
+	return err;
+}
+
 /*
  * Read f2fs raw super block.
  * Because we have two copies of super block, so read both of them
@@ -4707,52 +4774,54 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 			struct f2fs_super_block **raw_super,
 			int *valid_super_block, int *recovery)
 {
-	struct super_block *sb = sbi->sb;
-	int block;
-	struct folio *folio;
 	struct f2fs_super_block *super;
-	int err = 0;
+	int log_bs, err, ret, err2 = -ENOENT;
 
 	super = kzalloc_obj(struct f2fs_super_block);
 	if (!super)
 		return -ENOMEM;
 
-	for (block = 0; block < 2; block++) {
-		folio = read_mapping_folio(sb->s_bdev->bd_mapping, block, NULL);
-		if (IS_ERR(folio)) {
-			f2fs_err(sbi, "Unable to read %dth superblock",
-				 block + 1);
-			err = PTR_ERR(folio);
-			*recovery = 1;
-			continue;
-		}
+	/* 1. Read 1st superblock (block 0) */
+	err = check_super_block(sbi, super, 0, valid_super_block, raw_super);
+	if (err) {
+		f2fs_err(sbi, "Can't find valid F2FS filesystem in 1st superblock");
+		*recovery = 1;
+	}
 
-		/* sanity checking of raw super */
-		err = sanity_check_raw_super(sbi, folio, block);
-		if (err) {
-			f2fs_err(sbi, "Can't find valid F2FS filesystem in %dth superblock",
-				 block + 1);
-			folio_put(folio);
+	/* 2. Read 2nd superblock (block 1) */
+	if (*raw_super) {
+		if (check_super_block(sbi, super, 1, valid_super_block, raw_super)) {
+			f2fs_err(sbi, "Can't find valid F2FS filesystem in 2nd superblock");
 			*recovery = 1;
-			continue;
 		}
-
-		if (!*raw_super) {
-			memcpy(super, F2FS_SUPER_BLOCK(folio, block),
-							sizeof(*super));
-			*valid_super_block = block;
-			*raw_super = super;
+	} else {
+		for (log_bs = F2FS_MIN_LOG_BLOCKSIZE;
+		     log_bs <= F2FS_MAX_LOG_BLOCKSIZE; log_bs++) {
+			sbi->log_blocksize = log_bs;
+			sbi->blocksize = BIT(log_bs);
+			ret = check_super_block(sbi, super, 1, valid_super_block,
+						raw_super);
+			if (!ret)
+				break;
+			/* A 2nd superblock was found: do not probe larger blocks. */
+			if (ret != -ENOENT) {
+				err2 = ret;
+				break;
+			}
 		}
-		folio_put(folio);
+		if (!*raw_super)
+			f2fs_err(sbi, "Can't find valid F2FS filesystem in 2nd superblock");
 	}
 
-	/* No valid superblock */
-	if (!*raw_super)
+	/*
+	 * No valid superblock: return the error of the 2nd superblock if one
+	 * was found, or the error of the 1st superblock otherwise.
+	 */
+	if (!*raw_super) {
 		kfree(super);
-	else
-		err = 0;
-
-	return err;
+		return err2 != -ENOENT ? err2 : err;
+	}
+	return 0;
 }
 
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
@@ -4777,7 +4846,8 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 
 	/* write back-up superblock first */
 	index = sbi->valid_super_block ? 0 : 1;
-	folio = read_mapping_folio(sbi->sb->s_bdev->bd_mapping, index, NULL);
+	folio = read_mapping_folio(sbi->sb->s_bdev->bd_mapping,
+				f2fs_lblk_to_folio_index(sbi, index), NULL);
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
 	err = __f2fs_commit_super(sbi, folio, index, true);
@@ -4789,7 +4859,8 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 
 	/* write current valid superblock */
 	index = sbi->valid_super_block;
-	folio = read_mapping_folio(sbi->sb->s_bdev->bd_mapping, index, NULL);
+	folio = read_mapping_folio(sbi->sb->s_bdev->bd_mapping,
+				f2fs_lblk_to_folio_index(sbi, index), NULL);
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
 	err = __f2fs_commit_super(sbi, folio, index, true);
@@ -5263,6 +5334,13 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	}
 	mutex_init(&sbi->flush_lock);
 
+	/*
+	 * The 1st superblock is at F2FS_SUPER_OFFSET of block 0 for every
+	 * block size, so locate it with the minimum supported block size.
+	 */
+	sbi->log_blocksize = F2FS_MIN_LOG_BLOCKSIZE;
+	sbi->blocksize = F2FS_MIN_BLKSIZE;
+
 	err = read_raw_super_block(sbi, &raw_super, &valid_super_block,
 								&recovery);
 	if (err)
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 4a2cea4288f9..af1b7f21c1d8 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -94,6 +94,9 @@ static int f2fs_begin_enable_verity(struct file *filp)
 	struct inode *inode = file_inode(filp);
 	int err;
 
+	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode)))
+		return -EOPNOTSUPP;
+
 	if (f2fs_verity_in_progress(inode))
 		return -EBUSY;
 
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 3081702b1ddb..4007f54d7db4 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -13,8 +13,8 @@
 
 #define F2FS_SUPER_OFFSET		1024	/* byte-size offset */
 #define F2FS_MIN_LOG_SECTOR_SIZE	9	/* 9 bits for 512 bytes */
-#define F2FS_MAX_LOG_SECTOR_SIZE	PAGE_SHIFT	/* Max is Block Size */
 #define F2FS_MIN_LOG_BLOCKSIZE		12
+#define F2FS_MAX_LOG_BLOCKSIZE		PAGE_SHIFT
 #define F2FS_MIN_BLKSIZE		4096UL
 #define F2FS_MAX_BLKSIZE		PAGE_SIZE
 #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
-- 
2.56.0.611.g1030f0b940-goog

