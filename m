Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CF9336883
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789446039; cv=none; b=qibYyKy2kSD5drCeFDm2JPVEwSTLfZxzNiSVyE/jOzFwY26ztMF6qc7LN8O/reZ/M6h8j6ofDH08HID3KMZR+nHBbv7OzGct3HGmWwFlbFLRc1TEBLn1Pb9r5dtFvLyUURnMD8Fed82032hcOP00/dMRSvld/QlDKe1lmAB8yyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789446039; c=relaxed/simple;
	bh=Z9DN6YJ/BsepswIpAuuiNFz21ILM9xadLwZgJpGmrs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9gGLHumHzffiYPT+9MD973i/7nOtCOa17JxJ3u3Od/eHBXOaEDaDYMWi0uKFD0lnPSPeBJBzFlLJaSjx/2h3W5MsXvFuGu60AtYfoD92HrdNIU7IaqZcN9I7U/gY4w+In1CwcGdGityTGlelOgzSOmzbM7trtIMmvqrU68dJQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=cv+Vlzm+; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="cv+Vlzm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=x9
	ZlzP7KpSO+gqVQvXv2VHlI3hj+Jnhl/T+yZmtX9aA=; b=cv+Vlzm+6vFH8TIKpU
	+jCaq6/IFUgwG6Tbq7jIdyH98NikcwLI7CkLITFjHHWvXJ7qydLpLNo/ide14Hfp
	nXxG+XDRVBCEBXo8oVTJ8psGGryxtLk6cH+KVj2/ZuLUBaf5KploI9IstmBi0pEr
	h+z/lZ0nqtQjqKQcqPtplD4Tk=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDXreo9x6hq3jBvHw--.36918S12;
	Tue, 15 Sep 2026 12:19:19 +0800 (CST)
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
Subject: [PATCH v2 10/14] f2fs: handle partial truncate of large folio dirty subpages
Date: Tue, 15 Sep 2026 12:19:05 +0800
Message-ID: <20260915041909.2903887-11-zhaonanzhe@xiaomi.com>
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
X-CM-TRANSID:PikvCgDXreo9x6hq3jBvHw--.36918S12
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4fuFyUXr4Utw15Xw4Dtwb_yoW5KF1fpF
	WDCr98JFs8J3Zruw1fXFn8Xr1fK3s7Wr4xCa97Gwn3J3WYq3sxKF1kt34FgFs8Jry8AF1f
	Xr1UtFW5WFyUKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjbyZUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsQfHl2qox0cWjwAA39

A large folio can be partial truncated and stays in folio mapping, we
need to clear the subrange dirty bits and uptodate bits that the partial
truncate covers. If this partial truncate happens to clear the last
subrange dirty bits, then cancel the whole folio dirty state.

Also add a guard in f2fs_write_single_data_folio() so a large folio
subpage whose disk block was already truncated (NULL_ADDR) is skipped

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d9e3a5c370d7..bf9b9c9b722f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2679,6 +2679,34 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
 		folio_mark_uptodate(folio);
 }
 
+static void ffs_clear_subrange_uptodate(struct folio *folio,
+					size_t offset, size_t len)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int nr_subpages, start, end;
+	unsigned long flags;
+
+	f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
+
+	if (!f2fs_folio_has_ffs(folio)) {
+		if (folio_test_uptodate(folio))
+			folio_clear_uptodate(folio);
+		return;
+	}
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	nr_subpages = folio_nr_pages(folio);
+	start = offset >> PAGE_SHIFT;
+	end = (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
+	end = min(end, nr_subpages);
+
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	bitmap_clear(ffs->state, start, end - start);
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+	if (folio_test_uptodate(folio))
+		folio_clear_uptodate(folio);
+}
+
 bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
 {
 	struct f2fs_folio_state *ffs;
@@ -3545,6 +3573,14 @@ static int f2fs_write_single_data_folio(struct folio *folio, int *submitted,
 
 		fio.old_blkaddr = dn.data_blkaddr;
 
+		/* This page is already truncated */
+		if (fio.old_blkaddr == NULL_ADDR) {
+			ffs_clear_subrange_uptodate(folio,
+					i << PAGE_SHIFT, PAGE_SIZE);
+			folio_clear_f2fs_gcing(folio);
+			goto block_done;
+		}
+
 got_it:
 		if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
 		    !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
@@ -4987,8 +5023,36 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 
 	if (inode->i_ino >= F2FS_ROOT_INO(sbi) &&
-				(offset || length != folio_size(folio)))
+				(offset || length != folio_size(folio))) {
+		size_t clear_start = round_up(offset, PAGE_SIZE);
+		size_t clear_end = round_down(offset + length, PAGE_SIZE);
+		size_t clear_length;
+		bool dirty;
+
+		/*
+		 * If the truncated range falls within a single subpage, no
+		 * subpage state needs to be cleared.
+		 */
+		if (clear_start >= clear_end || !f2fs_folio_has_ffs(folio))
+			return;
+
+		clear_length = clear_end - clear_start;
+		dirty = f2fs_ffs_clear_subrange_dirty_and_test(folio,
+						clear_start, clear_length);
+		ffs_clear_subrange_uptodate(folio, clear_start, clear_length);
+
+		/*
+		 * If the truncated subrange happens to clear the remaining
+		 * dirty bitmap of the whole folio, cancel the folio-level
+		 * dirty state.
+		 */
+		if (!dirty && folio_test_dirty(folio)) {
+			inode_dec_dirty_pages(inode);
+			f2fs_remove_dirty_inode(inode);
+			folio_cancel_dirty(folio);
+		}
 		return;
+	}
 
 	if (folio_test_dirty(folio)) {
 		if (inode->i_ino == F2FS_META_INO(sbi)) {
-- 
2.43.0

