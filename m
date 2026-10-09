Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48824EDCD1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563358; cv=none; b=m8UPTrKlbQ+Reev12DVZiHidYcnl1+32mac04fO13a2ztvMCCUmF4c3F0+SdNckmO+CnlhT3WOQzyMYwFrO9J2GSxDeDB0XZLXMILy+cqz7STZ8L+Xwwkmc5Me6GkC0U8L8IZDjcw8feNA1kK2xjRlfGcIQGmbHd5qBeoUp+28A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563358; c=relaxed/simple;
	bh=0N97PbakjCkx/xPmQO9ubVS5c7JdRywaIDVxQA0KvYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hovStmGhWVn2GIHdXA6sR1kT8ruSEvgyVLCQ4NZCs5wuq/JcxIDoMZievdh/0S3J6fVGHILrBvyv0XbRQtaVasH8KkNm/OME6yra7bT8o6kPixuOF8GTqDZaPNa+btX4Dj0+1dot4cBWaRU8WXtbt6aExwSLZzbzEjn6ASJPFu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=jZRMdyQU; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="jZRMdyQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Rv
	1KSkNZMlY1vboRJF14QDhuPfZHH37WBltORKq51FE=; b=jZRMdyQUqX4t3aow2p
	IAXhGFCSKN4Oxglp/W4auUbVQAVot39BJ+QSZdwS5LFVKvJ3Tw2UP2obM4unQ7lL
	5ry9ckkMrI3GiFMndQuuDg3pyaOAUFtdI31E3GUqCxvnPX2RfjyUATAdvPxRneHD
	FoMhaiO4S3XyCyu3Wm/FgpIGA=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDH3_w0FslqWTz5BA--.13078S2;
	Sat, 10 Oct 2026 00:28:37 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>,
	Barry Song <baohua@kernel.org>,
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
Subject: [PATCH v3 11/17] f2fs: support partial uptodate large folio read
Date: Sat, 10 Oct 2026 00:28:22 +0800
Message-ID: <20261009162828.4188050-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PikvCgDH3_w0FslqWTz5BA--.13078S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF4DuFyxtFWxCw4fXw13Arb_yoWrZr18pF
	W8K398Kr4UJF43WF1SqFs3Xr1SqryIqay7GFZ3G34fJ3WYqasYgFykt34YkF4rtrykCFn3
	Zr45GryUWF4jyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UCD7-UUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsRWfb2rJFjVJcAAA3t

Buffered write can have write bytes smaller than folio
size for cases when folio minimum order is not zero.
This can left partially uptodate folio in page cache.
So we skip uptodate subpage read in read_data_large_folio.
Also mark hole subpage uptodate in uptodate bitmap.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6f6f5223951d..21c43019167a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -148,6 +148,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 		struct folio *folio = fi.folio;
 		unsigned nr_pages = fi.length >> PAGE_SHIFT;
 		bool finished = true;
+		bool uptodate = bio->bi_status == BLK_STS_OK;
 
 		if (!folio_test_large(folio) &&
 		    f2fs_is_compressed_page(folio)) {
@@ -163,6 +164,9 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 				(struct f2fs_folio_state *)folio->private;
 
 			spin_lock_irqsave(&ffs->state_lock, flags);
+			if (bio->bi_status == BLK_STS_OK)
+				uptodate = __ffs_mark_subrange_uptodate(folio, ffs,
+						fi.offset, fi.length);
 			ffs->read_pages_pending -= nr_pages;
 			finished = !ffs->read_pages_pending;
 			spin_unlock_irqrestore(&ffs->state_lock, flags);
@@ -172,7 +176,8 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			dec_cache_count(F2FS_F_SB(folio), F2FS_RD_DATA);
 
 		if (finished)
-			folio_end_read(folio, bio->bi_status == BLK_STS_OK);
+			folio_end_read(folio,
+				bio->bi_status == BLK_STS_OK && uptodate);
 	}
 
 	if (ctx)
@@ -3071,6 +3076,56 @@ static bool find_next_valid_block(const struct folio *folio,
 	return false;
 }
 
+static unsigned int ffs_next_uptodate_subpage(struct f2fs_folio_state *ffs,
+			unsigned int start, unsigned int end)
+{
+	return find_next_bit(ffs->state, end + 1, start);
+}
+
+static unsigned int ffs_next_nonuptodate_subpage(struct f2fs_folio_state *ffs,
+			unsigned int start, unsigned int end)
+{
+	return find_next_zero_bit(ffs->state, end + 1, start);
+}
+
+static void f2fs_skip_fully_uptodate_front(struct folio *folio,
+			pgoff_t *index, pgoff_t *offset, unsigned int *nrpages,
+			unsigned int *max_nr_pages)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int next, skipped;
+
+	if (!f2fs_folio_has_ffs(folio) || !*nrpages)
+		return;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	next = ffs_next_nonuptodate_subpage(ffs, *offset,
+					    *offset + *nrpages - 1);
+	skipped = next - *offset;
+	if (!skipped)
+		return;
+
+	*index += skipped;
+	*offset += skipped;
+	*nrpages -= skipped;
+	*max_nr_pages -= skipped;
+}
+
+static void f2fs_truncate_read_extent(struct folio *folio, pgoff_t offset,
+				     unsigned int *len_blks)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int next, end;
+
+	if (!f2fs_folio_has_ffs(folio) || *len_blks <= 1)
+		return;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	end = offset + *len_blks - 1;
+	next = ffs_next_uptodate_subpage(ffs, offset + 1, end);
+	if (next <= end)
+		*len_blks = next - offset;
+}
 static int f2fs_read_data_large_folio(struct inode *inode,
 		struct fsverity_info *vi,
 		struct readahead_control *rac, struct folio *folio)
@@ -3115,6 +3170,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 
 		len_blks = 1;
 
+		f2fs_skip_fully_uptodate_front(folio, &index, &offset,
+					       &nrpages, &max_nr_pages);
+		if (!nrpages)
+			break;
+
 		/*
 		 * Map blocks using the previous result first.
 		 */
@@ -3147,6 +3207,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
 			len_blks = min_t(unsigned int, len_blks,
 					(unsigned int)(map.m_lblk + map.m_len - index));
+			f2fs_truncate_read_extent(folio, offset, &len_blks);
 
 			for (i = 0; i < len_blks; i++) {
 				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
@@ -3165,6 +3226,13 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 				ret = -EIO;
 				goto err_out;
 			}
+			if (folio_test_large(folio)) {
+				ffs = f2fs_ffs_find_or_alloc(folio);
+				spin_lock_irq(&ffs->state_lock);
+				__ffs_mark_subrange_uptodate(folio, ffs,
+						page_offset, PAGE_SIZE);
+				spin_unlock_irq(&ffs->state_lock);
+			}
 			continue;
 		}
 
-- 
2.43.0

