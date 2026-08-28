Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B08B3C870E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901637; cv=none; b=OiryQMbEN7Srw61g/PCm1dtTvIMQ1p7L70OVNDERlKqVlbOjuBP+WNcehrERKK9u4cOT3Fhy7sGX0C/uLPOoOZ2RsUWuEOJX66/BbruofO9ZPh6xXjkZztfP+bZNwC7lqXece69k3W1eKkff8yh1a4hW6bfHIP/TdPAhOxZ+jsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901637; c=relaxed/simple;
	bh=CHyqnlH1pmwI+TbPQ39eQEuRDQk6wn3kbJqO5j1d4gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YtwUVBOAwSBmbA5DeU+50hyp6045PrfjT+zU6ul7o/1R6qfnSGjlsZ4p13UoYWPVb0tXzBHDUTiwnaV8vGmvhunoLAnl3BbJ0Opze42atY9rWy9QvC+QfWjx585eCjCNMftIL0/OMnnUd0R8wjuZ1giOmgtBWxEklO7DSDWmFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaSwbyJc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaSwbyJc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e58034d05so756109a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787901635; x=1788506435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6Ag/tYf1DhNwpo/YB9MI3UoakQSnyJqri54EN1XefQ=;
        b=jaSwbyJcWfcpOmAS7WBaloLbUBBBua22yw/VgWLxl2QNW16driyL1ynNBS3mxsre5n
         xt7QigEg0zKUmDd7B3RW7fnBtNLoRFRIfkVB5zb56e3OPeT94OM+Hlg8k02XYImvyGS3
         wZN5GAo3PHENLYzM4dzlFM7PG4MYNHHPvEas++tZxHW3d0eUmqk0YYVRbJIXNYM7S7Y1
         UrGdmNoPYrLVQX834Aq+fomPxtEbNLS8ixDXbib9eas/PVNiUBcagdjlaTUGn1QaaTZu
         ELvbVY7DuSkuNHEyUbyAE9igLF0LdPQRkd0Ah18HzvG6eChA+F0rIxZIzon/c0PQB3gk
         maqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901635; x=1788506435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6Ag/tYf1DhNwpo/YB9MI3UoakQSnyJqri54EN1XefQ=;
        b=JMuJQgAz+qlgYJk77Ur0q7SPQryGyKbgdHMNT9SikXf4Bc4cjF4BMLkAP/iI51OPFP
         iHgROuoBXPEHiXlsOzh9CSd/ekT44YX8vkRK9M1MNGs5iI/94F8uHe+0Ouy9STrK9UC5
         xP2ZYH3F/uZcCVgSUe64Eh526d6E8x+EjJfIE/ogAit8FlIDOfkKevJh1tAu2C7+3CRu
         +uiBSQzH/5Nj+8WAiCf/z5w2rgFZnNk5b5ePbxPsYy7FfkQzO6d43NlG6He/V1TW2f35
         hLFzfB/XbiR4ntcUJlToVzeRkwbyAa7eEqgTOzedWztaOn1Ys+RkxuMjn7yOaeHAqAzL
         LuLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVPP+KfFfuqEbOwheV/ko44qCyF3AhBNdLKk5kbBVsBIwnhxfLFdK2pzkszftSosvA+M0/kXkIGIwyNbw=@vger.kernel.org
X-Gm-Message-State: AFuF++ku2B0p6gQAS4KJa0nDY1ILdvZZow7ml18sNAuAaEoXp2cPJ1u7
	SiYyMIcvboJVacc3u/P6+vvHnRwMuLer/o6hLMx2+vAjazyu6pbkK5oH
X-Gm-Gg: AR+sD12beDK5rxIWPF00fobaQwpS/6Xh+Glhu6OIT2inyydqRHMyHIgDKgbtat6lTkn
	JlR4eNQH8Zl0k+JjR7WUuQlETNaHwxoMutStSNidrgGZgS9aMIRlvkiJ8WD8Kqxu8rXzsYdB4sy
	2PWMSaUwZqRXzliuenTQaUJQ2mIPH+VxmrGOhh4FKNR2QN/L4PZZso1DKFLdwZgprtuRy/XUrdy
	tUS6MOXEvhNyg5j7jAUSXw7e4043aOLgCUA5WZWqKXCtWtUCX/QBdYZEHPQ+zIPtKPbS+ONYjK0
	RpLhm0jNTw4ifUeVl7MFvhR8qrRpIRj1ucsuyO97J/WkeKPg4t3Kjjn9N0G3cCcVgWInUc6yVqm
	jJ1Qg6TbnSUNb3JWdChi5XEg1h7HohEpKZ6vAxJn3kIzLTBsZrpm6kzjsXIMKik/Ru+HLbsTsuM
	2Wf2pwTizXxqfdUS5wzzVbmaakHcphR/0K4A5gZEz2ll4LOfMHh5v3Mf3Ukl3t41tI63A=
X-Received: by 2002:a17:90b:2d82:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-396d0f6f8bfmr10437037a91.10.1787901635511;
        Fri, 28 Aug 2026 00:20:35 -0700 (PDT)
Received: from jeuk-MS-7D42.. ([211.226.54.223])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea7fa9sm6123731a91.4.2026.08.28.00.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:20:35 -0700 (PDT)
From: Jeuk Kim <jeuk20.kim@gmail.com>
X-Google-Original-From: Jeuk Kim <jeuk20.kim@samsung.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Yohan Joung <jyh429@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	j-young.choi@samsung.com,
	yunjae00.jo@samsung.com,
	keosung.park@samsung.com,
	Jeuk Kim <jeuk20.kim@samsung.com>
Subject: [PATCH 2/3] f2fs: fix in-place direct I/O overwrites in LFS mode
Date: Fri, 28 Aug 2026 16:20:16 +0900
Message-ID: <20260828072017.44569-3-jeuk20.kim@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828072017.44569-1-jeuk20.kim@samsung.com>
References: <20260828072017.44569-1-jeuk20.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 351bc761338d ("f2fs: optimize f2fs DIO overwrites") stopped
setting m_may_create for direct I/O overwrites of allocated blocks. In
LFS mode, this causes the existing physical blocks to be reused instead
of allocating new ones.

The physical block address of logical block 0 after each overwrite was:

                         initial   buffered   O_DIRECT
  mode=lfs      pre-fix  6596096      88066      88066
                post-fix 6596096      88066    6596352
  mode=adaptive pre-fix  6596096    6596096    6596096
                post-fix 6596096    6596096    6596096

Set m_may_create when a direct I/O write must use OPU. Since allocation
may sleep, reject NOWAIT writes with -EAGAIN. Keep pinned files on the
IPU path because their block addresses must not change.

Add f2fs_should_opu() to keep these decisions consistent.

Fixes: 351bc761338d ("f2fs: optimize f2fs DIO overwrites")
Signed-off-by: Jeuk Kim <jeuk20.kim@samsung.com>
---
 fs/f2fs/data.c | 17 ++++++++++-------
 fs/f2fs/f2fs.h |  9 +++++++++
 fs/f2fs/file.c | 11 +++--------
 3 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index dad5c2bd5888..618e6fc2da0c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1644,7 +1644,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	if (!maxblocks)
 		return 0;
 
-	lfs_dio_write = (flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi) &&
+	lfs_dio_write = (flag == F2FS_GET_BLOCK_DIO && f2fs_should_opu(inode) &&
 				map->m_may_create);
 
 	if (!map->m_may_create && f2fs_map_blocks_cached(inode, map, flag)) {
@@ -1717,8 +1717,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 
 	/* use out-place-update for direct IO under LFS mode */
 	if (map->m_may_create && (is_hole ||
-		(flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi) &&
-		!f2fs_is_pinned_file(inode) && map->m_last_pblk != blkaddr))) {
+		(flag == F2FS_GET_BLOCK_DIO && f2fs_should_opu(inode) &&
+		map->m_last_pblk != blkaddr))) {
 		if (unlikely(f2fs_cp_error(sbi))) {
 			err = -EIO;
 			goto sync_out;
@@ -1810,7 +1810,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		ofs++;
 		map->m_len++;
 	} else {
-		if (lfs_dio_write && !f2fs_is_pinned_file(inode))
+		if (lfs_dio_write)
 			map->m_last_pblk = blkaddr;
 		goto sync_out;
 	}
@@ -4513,11 +4513,14 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	}
 
 	/*
-	 * If the blocks being overwritten are already allocated,
-	 * f2fs_map_lock and f2fs_balance_fs are not necessary.
+	 * Out-place-update must not reuse the existing block, so ask for an
+	 * allocation even when the range is already mapped.  Otherwise, if the
+	 * blocks being overwritten are already allocated, f2fs_map_lock and
+	 * f2fs_balance_fs are not necessary.
 	 */
 	if ((flags & IOMAP_WRITE) &&
-		!__f2fs_overwrite_io(inode, offset, length, true))
+		(f2fs_should_opu(inode) ||
+		 !__f2fs_overwrite_io(inode, offset, length, true)))
 		map.m_may_create = true;
 
 	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DIO);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8376bbe58ee3..e85d4db3a401 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4938,6 +4938,15 @@ static inline bool f2fs_lfs_mode(struct f2fs_sb_info *sbi)
 	return F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS;
 }
 
+static inline bool f2fs_should_opu(struct inode *inode)
+{
+	/* pinned files must keep their block addresses */
+	if (f2fs_is_pinned_file(inode))
+		return false;
+
+	return f2fs_lfs_mode(F2FS_I_SB(inode));
+}
+
 static inline bool f2fs_is_sequential_zone_area(struct f2fs_sb_info *sbi,
 					  block_t blkaddr)
 {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 51518caee460..37d4e5c8dbcb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5022,7 +5022,7 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 	int ret;
 
 	/* If it will be an out-of-place direct write, don't bother. */
-	if (dio && f2fs_lfs_mode(sbi))
+	if (dio && f2fs_should_opu(inode))
 		return 0;
 	/*
 	 * Don't preallocate holes aligned to DIO_SKIP_HOLES which turns into
@@ -5166,7 +5166,7 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 	struct inode *inode = file_inode(file);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	const bool do_opu = f2fs_lfs_mode(sbi) && !f2fs_is_pinned_file(inode);
+	const bool do_opu = f2fs_should_opu(inode);
 	const loff_t pos = iocb->ki_pos;
 	const ssize_t count = iov_iter_count(from);
 	unsigned int dio_flags;
@@ -5182,7 +5182,7 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 
 	if (iocb->ki_flags & IOCB_NOWAIT) {
 		/* f2fs_convert_inline_inode() and block allocation can block */
-		if (f2fs_has_inline_data(inode) ||
+		if (do_opu || f2fs_has_inline_data(inode) ||
 		    !f2fs_overwrite_io(inode, pos, count)) {
 			ret = -EAGAIN;
 			goto out;
@@ -5192,11 +5192,6 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 			ret = -EAGAIN;
 			goto out;
 		}
-		if (do_opu && !f2fs_down_read_trylock(&fi->i_gc_rwsem[READ])) {
-			f2fs_up_read(&fi->i_gc_rwsem[WRITE]);
-			ret = -EAGAIN;
-			goto out;
-		}
 	} else {
 		ret = f2fs_convert_inline_inode(inode);
 		if (ret)
-- 
2.43.0

