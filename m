Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A571F91F6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789445997; cv=none; b=EqeOUHjDEfKW43ePY96yitJ0gDzJ89JsIDdtil2vqqFUFZyB3WoCpYJgMjcII5VOpRELsvfS3wDvhDuwXQKUkauNFgeg9OtOFUIqHPsXOrNgsmjjczYzyPpIR2cibnNL4mTYiRW2qu3cHfPGwQQ5T+Pjwh1U0APRS3Gb6VSN/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789445997; c=relaxed/simple;
	bh=HgSsJRoK0J05KG0mwTFWrglOY9661dw2QVjfdEDKlJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfCnmUoSETjZAKa4boGzcB5YIbtvftva0J3oKOF8AFyFS7QBjzyJ7D4FFKXQ2s7l54ZrmDkOfOw6rbdIGgmZuflUxt3NonRRoGBVw+hXSwplDPJ5P20ilC5kkJD8boKtJz/en7PVyffGi0TYCfGyDu3Uty7S4QP6iymGGyScnRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=NSBWDaZ0; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="NSBWDaZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=f6
	7LGm08S9tN97M8CGib1Eur96A/KAiCF+w+dAL+Kxc=; b=NSBWDaZ0X++7JFcmOc
	/RB1DYTeczlRi5JLi/bYgvbbYUWuXOLiYRDZ5EzdV2TSz60dIThNidhgrhcMaEZZ
	qMBxKpD4wvUNQcUO28aYBHqwKT15efp1G5eRY+x3LNe7lU2xREBo9dGejG0ffXe3
	CBnXoSfVDR+OPLxnhGTnrw1iA=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDXreo9x6hq3jBvHw--.36918S6;
	Tue, 15 Sep 2026 12:19:14 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Subject: [PATCH v2 04/14] f2fs: support atomic file large folios buffered write
Date: Tue, 15 Sep 2026 12:18:59 +0800
Message-ID: <20260915041909.2903887-5-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
References: <20260915041909.2903887-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PikvCgDXreo9x6hq3jBvHw--.36918S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4UWF45Wr1DJF13tF4DXFb_yoWruw4UpF
	WUKwn5KrZ3J343uwnavF4DZr1F9a4xXw47ZayfG3WfZ3W5Jw13KF48t343ZF15trWkA3W8
	XF40yFyrW3WUJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUNVkUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBowLGlmqox0JodAAA3q

ioctl can convert an inode with large folio support into an atomic
file. Support large folio buffered writes for atomic files as well.

Add a large folio atomic write_begin helper that reserves COW mappings
for the write range. For partial head and tail subpages, read the
existing data from either the COW inode or the original inode before
marking the subpage uptodate.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 81 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a490df4f50b3..eb5fb8e52851 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4016,18 +4016,16 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 }
 
 static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
-			struct folio *folio, loff_t pos, unsigned int len,
+			struct inode *inode, pgoff_t index,
 			block_t *blk_addr, bool *node_changed)
 {
-	struct inode *inode = folio->mapping->host;
 	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
-	pgoff_t index = folio->index;
 	int err = 0;
 	block_t ori_blk_addr = NULL_ADDR;
 	bool cow_has_reserved_block = false;
 
 	/* If pos is beyond the end of file, reserve a new block in COW inode */
-	if ((pos & PAGE_MASK) >= i_size_read(inode))
+	if ((index << PAGE_SHIFT) >= i_size_read(inode))
 		goto reserve_block;
 
 	/* Look for the block in COW inode first */
@@ -4168,6 +4166,74 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 	return 0;
 }
 
+static int prepare_large_folio_atomic_write_begin(struct inode *inode,
+		struct address_space *mapping, struct folio *folio, loff_t pos,
+		unsigned int len)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	size_t ori_off = offset_in_folio(folio, pos);
+	pgoff_t start, end, index;
+	unsigned int orig_order;
+	int err = 0;
+
+	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
+
+	if (!f2fs_ffs_find_or_alloc(folio))
+		return -ENOMEM;
+
+	/* Inline data must have been converted before reaching here. */
+	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
+
+	start = folio->index + (ori_off >> PAGE_SHIFT);
+	end = folio->index + ((ori_off + len - 1) >> PAGE_SHIFT);
+
+	for (index = start; index <= end; index++) {
+		block_t blkaddr = NULL_ADDR;
+		bool node_changed = false;
+		size_t off = (index - folio->index) << PAGE_SHIFT;
+
+		err = prepare_atomic_write_begin(sbi, inode, index,
+						&blkaddr, &node_changed);
+		if (err)
+			return err;
+
+		if (f2fs_ffs_test_blk_uptodate(folio, index))
+			goto balance;
+
+		if (blkaddr == NEW_ADDR) {
+			folio_zero_segment(folio, off, off + PAGE_SIZE);
+			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+			goto balance;
+		}
+
+		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
+					   DATA_GENERIC_ENHANCE_READ))
+			return -EFSCORRUPTED;
+
+		err = f2fs_submit_page_read_sync(inode, folio, index,
+						blkaddr);
+		if (err)
+			return err;
+balance:
+		/*
+		 * Expand the 4K-page balance decision per subpage: check
+		 * right after each preallocated block.
+		 */
+		if (node_changed && !IS_NOQUOTA(inode) &&
+		    has_not_enough_free_secs(sbi, 0, 0)) {
+			orig_order = folio_order(folio);
+			folio_unlock(folio);
+			f2fs_balance_fs(sbi, true);
+			folio_lock(folio);
+			if (unlikely(folio->mapping != mapping ||
+				     folio_order(folio) != orig_order))
+				return -EAGAIN;
+		}
+	}
+
+	return 0;
+}
+
 static int f2fs_write_begin(const struct kiocb *iocb,
 			    struct address_space *mapping,
 			    loff_t pos, unsigned len, struct folio **foliop,
@@ -4245,8 +4311,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 
 	*foliop = folio;
 
-	if (f2fs_is_atomic_file(inode))
-		err = prepare_atomic_write_begin(sbi, folio, pos, len,
+	if (f2fs_is_atomic_file(inode) && !folio_test_large(folio))
+		err = prepare_atomic_write_begin(sbi, inode, folio->index,
 					&blkaddr, &need_balance);
 	else if (!folio_test_large(folio))
 		err = prepare_write_begin(sbi, folio, pos, len,
@@ -4270,10 +4336,18 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	f2fs_folio_wait_writeback(folio, DATA, false, true);
 
 	if (folio_test_large(folio)) {
-		err = prepare_large_folio_write_begin(inode,
+		if (f2fs_is_atomic_file(inode))
+			err = prepare_large_folio_atomic_write_begin(inode,
+					mapping, folio, pos, len);
+		else
+			err = prepare_large_folio_write_begin(inode,
 					folio, pos, len);
 		if (!err)
 			return 0;
+		if (err == -EAGAIN) {
+			f2fs_folio_put(folio, true);
+			goto repeat;
+		}
 		goto put_folio;
 	}
 
-- 
2.43.0

