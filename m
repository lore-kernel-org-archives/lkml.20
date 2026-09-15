Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B943EEAF8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789446007; cv=none; b=HPhy6lRJMuLWOsCV3imhQwWUOSX4d8pQ8EOV/bVEnlxuwyUtvWvYXfcQHNQNSNRCoPzQ9ChhrwNi+9lgsyQt0KLmIg/EjMklg0M3k6yYC9IBXflMXKdMIq2W6BUoFqsabqSlzaq6vAKi+ZAi5CVAZOTpdgGB0r1fFsrr+PeYZCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789446007; c=relaxed/simple;
	bh=S9F8vTTC1klBp+6TZHVJOCvZubzyU7a0EA3aGnGKR0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvGI8pJXB/gkw7owzZmpNJrpIWCUYYhLD8XQ59l8puW3ZkRb6DXBLWonf7NfKY3v1PuW0dBXitsXaRL30b9nShICht/D6uy0C12aQGiBkQrYtp+60ckiqPBdTJF4fhWjfSDu+y35M+zBbC/PMiM4iePC3xzEIVAt2e1CeyNoN1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=KbRSCNM9; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="KbRSCNM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=oi
	agiE9hFnek0JhwqrKr3HLWo3wKjcwb53js2X7yX1U=; b=KbRSCNM9QcphAVB1hB
	T/lNSKjzk5d330PDJuLy48zvyXqQa+3NV9yBrYRFPeHcbXY1Zm6qXxS0GLB8ONIo
	27q/0xvK15Mm+46fJeDdzYLdvI7t/poahyuY3Dj8cd+yWuw96qJDsp4OfptbKpxe
	8TvHd0p16p5VOku9uid5qn9/c=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDXreo9x6hq3jBvHw--.36918S10;
	Tue, 15 Sep 2026 12:19:17 +0800 (CST)
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
Subject: [PATCH v2 08/14] f2fs: optimize small block size large folio read
Date: Tue, 15 Sep 2026 12:19:03 +0800
Message-ID: <20260915041909.2903887-9-zhaonanzhe@xiaomi.com>
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
X-CM-TRANSID:PikvCgDXreo9x6hq3jBvHw--.36918S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFW7urWUGF4UAryxXF18Zrb_yoWrKr1rpF
	W5Krn5KrZ5WFWxWr4IqF1DZr1ft348Wa1UGFZ3Gw1fX3Wjq34S9F1vy34YgF4rtrykCFna
	qF4rKryDWF1jqF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUZ2-UUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBowbHl2qox0ZomwAA3F

The original f2fs_read_data_large_folio() implementation has limited
benefit with a 4KB block size, mainly because updating
read_pages_pending greatly increases the number of spinlock
operations.

Use len_blks to batch read_pages_pending and iostat updates for
contiguous mapped blocks. If the contiguous mapping covers the whole
folio, skip f2fs_folio_state allocation for that folio.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 65 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 287d83debf95..09ad5cf0d9aa 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -173,8 +173,9 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			continue;
 		}
 
-		if (folio_test_large(folio)) {
-			struct f2fs_folio_state *ffs = folio->private;
+		if (f2fs_folio_has_ffs(folio)) {
+			struct f2fs_folio_state *ffs =
+				(struct f2fs_folio_state *)folio->private;
 
 			spin_lock_irqsave(&ffs->state_lock, flags);
 			ffs->read_pages_pending -= nr_pages;
@@ -2844,8 +2845,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	pgoff_t index, offset, next_pgofs = 0;
 	unsigned max_nr_pages = rac ? readahead_count(rac) :
 				folio_nr_pages(folio);
-	unsigned int nrpages;
-	struct f2fs_folio_state *ffs;
+	unsigned int nrpages, len_blks;
 	int ret = 0;
 	bool folio_in_bio = false;
 
@@ -2868,11 +2868,17 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	folio_in_bio = false;
 	index = folio->index;
 	offset = 0;
-	ffs = NULL;
 	nrpages = folio_nr_pages(folio);
 
-	for (; nrpages; nrpages--, max_nr_pages--, index++, offset++) {
+	for (; nrpages;
+	     nrpages -= len_blks, max_nr_pages -= len_blks,
+	     index += len_blks, offset += len_blks) {
 		sector_t block_nr;
+		bool whole_folio_in_bio;
+		unsigned int i;
+
+		len_blks = 1;
+
 		/*
 		 * Map blocks using the previous result first.
 		 */
@@ -2901,13 +2907,31 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 got_it:
 		if ((map.m_flags & F2FS_MAP_MAPPED)) {
 			block_nr = map.m_pblk + index - map.m_lblk;
-			if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
+
+			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
+			len_blks = min_t(unsigned int, len_blks,
+					(unsigned int)(map.m_lblk + map.m_len - index));
+
+			for (i = 0; i < len_blks; i++) {
+				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
+						block_nr + i,
 						DATA_GENERIC_ENHANCE_READ)) {
-				ret = -EFSCORRUPTED;
-				goto err_out;
+					ret = -EFSCORRUPTED;
+					goto err_out;
+				}
 			}
+
+			/*
+			 * If an entire folio is added to one bio,
+			 * folio_end_read() can complete the folio read status
+			 * without relying on f2fs_folio_state.
+			 */
+			whole_folio_in_bio = offset == 0 &&
+					len_blks == folio_nr_pages(folio);
+
 		} else {
 			size_t page_offset = offset << PAGE_SHIFT;
+
 			folio_zero_range(folio, page_offset, PAGE_SIZE);
 			if (vi && !fsverity_verify_blocks(vi, folio, PAGE_SIZE, page_offset)) {
 				ret = -EIO;
@@ -2917,15 +2941,13 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		}
 
 		/* We must increment read_pages_pending before possible BIOs submitting
-		 * to prevent from premature folio_end_read() call on folio
+		 * to prevent from premature folio_end_read() call on folio.
 		 */
-		if (folio_test_large(folio)) {
-			ffs = f2fs_ffs_find_or_alloc(folio);
+		if (folio_test_large(folio) && !whole_folio_in_bio) {
+			f2fs_ffs_find_or_alloc(folio);
 
 			/* set the bitmap to wait */
-			spin_lock_irq(&ffs->state_lock);
-			ffs->read_pages_pending++;
-			spin_unlock_irq(&ffs->state_lock);
+			f2fs_update_read_folio_pending(folio, len_blks);
 		}
 
 		/*
@@ -2949,17 +2971,20 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		 * If the page is under writeback, we need to wait for
 		 * its completion to see the correct decrypted data.
 		 */
-		f2fs_wait_on_block_writeback(inode, block_nr);
+		for (i = 0; i < len_blks; i++)
+			f2fs_wait_on_block_writeback(inode, block_nr + i);
 
-		if (!bio_add_folio(bio, folio, F2FS_BLKSIZE(F2FS_I_SB(inode)),
+		if (!bio_add_folio(bio, folio,
+				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)),
 				offset << PAGE_SHIFT))
 			goto submit_and_realloc;
 
 		folio_in_bio = true;
-		inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
+		for (i = 0; i < len_blks; i++)
+			inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
-				F2FS_BLKSIZE(F2FS_I_SB(inode)));
-		last_block_in_bio = block_nr;
+				len_blks * F2FS_BLKSIZE(F2FS_I_SB(inode)));
+		last_block_in_bio = block_nr + len_blks - 1;
 	}
 	trace_f2fs_read_folio(folio, DATA);
 err_out:
-- 
2.43.0

