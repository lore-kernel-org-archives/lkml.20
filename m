Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5061DC198
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131886; cv=none; b=YhUL4qatP4omIGBi/ulfpu/jyOZku5VXej2MNnZda2trzkF6z3QxsXY5vrmtK6CdkUL5Rp8oOXLTbebdK7/73uvAA+cS0J8Zf1fCp6KkipvwkazW9S0UNsyzVrk5TxRKtzGgZSt2e5L9DtGZd836YbUd787tdrnJChPcWsY4huA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131886; c=relaxed/simple;
	bh=dPIyDC4kmXx0bgJsrS71snyyRANApqdcqIvEx5YbC1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AczjQF3FJthTuWjCEE+bYV3Uqqqx4Cpb5YJp2pkRyupx/nDZjwUZxu3WJpaxSypri/flq5esukbcN1MeAoFH2lQv70vCyqsFadHXs5hrjJsNja3nH5eU0E2fdgG3avAbcc8HACv86Xl22dMEVSMsDf4/yHdy5QPRuHdhx4K18hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=QFAw8cE3; arc=none smtp.client-ip=220.197.31.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="QFAw8cE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Hq
	A+80dRJCagJodpppCE+xKvVH7PzCWMIz5FXbwN7wg=; b=QFAw8cE3cpbQSRKDUp
	BAfNB99heb+l8gZF4GkikZKi/vEr/ArxJjjUQKhlX2uF9jBhmtLsq5QVGPUyHXaK
	FoEXWb4Cws8pH7cO94UM6MHRlegbBL79XtjerCQe9zqwI/r53jtIwBsWGcTKRrRm
	XTk2G25n+dt5akjC+YrIcq23c=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3P4R9PrNqIedMAA--.36282S2;
	Wed, 23 Sep 2026 10:50:37 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH v2 10/14] f2fs: handle partial truncate of large folio dirty subpages
Date: Wed, 23 Sep 2026 10:50:35 +0800
Message-ID: <20260923025035.2202070-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c4e0c6d3-ad28-4e5e-a938-08b7658e9931@kernel.org>
References: <c4e0c6d3-ad28-4e5e-a938-08b7658e9931@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P4R9PrNqIedMAA--.36282S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw4fAw1rCw1UWw15Zr17trb_yoW5ZFW7pF
	WUKF1DGr4DJ3WUurn7XFn0vw1Sk3srX3y7CFWxG34ft3WYq3s3KFn5t34FyF1fKryxAFs3
	AF4jkay8XF4UGFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRCzuZUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBox42BmqzPn4o6gAA3W

On Thu, 17 Sep 2026 16:30:59 +0800, Chao Yu wrote:
> Since gcing flag is per-folio, so if block #0 is on gcing, but block #1 is
> truncated, it will drop on gcing flag of folio, result in triggering IPU on
> such dirtied block of large folio? also it will affect f2fs_is_cp_guaranteed()?

Hi Chao,

Thanks for the review. I think I may should change like this?

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f5421334ecf3..a94153be0533 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -351,6 +351,27 @@ static void f2fs_read_end_io(struct bio *bio)
 	f2fs_verify_and_finish_bio(bio, intask);
 }
 
+static bool f2fs_ffs_has_dirty_subpage(struct folio *folio)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned long flags;
+	unsigned int nr_subpages;
+	bool dirty;
+
+	if (!f2fs_folio_has_ffs(folio))
+		return false;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	nr_subpages = folio_nr_pages(folio);
+
+	spin_lock_irqsave(&ffs->state_lock, flags);
+	dirty = find_next_bit(ffs->state, 2 * nr_subpages,
+				nr_subpages) < 2 * nr_subpages;
+	spin_unlock_irqrestore(&ffs->state_lock, flags);
+
+	return dirty;
+}
+
 static void f2fs_write_end_bio(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = bio->bi_private;
@@ -410,7 +431,8 @@ static void f2fs_write_end_bio(struct bio *bio)
 			wake_up(&sbi->cp_wait);
 
 		if (finished) {
-			folio_clear_f2fs_gcing(folio);
+			if (!f2fs_ffs_has_dirty_subpage(folio))
+				folio_clear_f2fs_gcing(folio);
 			folio_end_writeback(folio);
 		}
 	}
@@ -3575,11 +3597,10 @@ static int f2fs_write_single_data_folio(struct folio *folio, int *submitted,
 
 		fio.old_blkaddr = dn.data_blkaddr;
 
 		/* This page is already truncated */
 		if (fio.old_blkaddr == NULL_ADDR) {
 			ffs_clear_subrange_uptodate(folio,
 					i << PAGE_SHIFT, PAGE_SIZE);
-			folio_clear_f2fs_gcing(folio);
 			goto block_done;
 		}
 
@@ -4122,6 +4143,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		bool verity_in_progress;
 		int folio_submitted = 0;
 		bool bias_added = false;
+		bool dirty;
 
 		submitted = 0;
 		next = true;
@@ -4224,15 +4246,19 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		 * partially written back), the folio must stay dirty so that
 		 * the remaining subranges are written back later.
 		 */
-		if (f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
-					(err ? pos : end_pos) - folio_pos(folio)))
+		dirty = f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
+					(err ? pos : end_pos) - folio_pos(folio));
+		if (dirty)
 			folio_redirty_for_writepage(wbc, folio);
 		else
 			inode_dec_dirty_pages(inode);
 
 		if (bias_added) {
-			if (atomic_dec_and_test(&ffs->write_pages_pending))
+			if (atomic_dec_and_test(&ffs->write_pages_pending)) {
+				if (!dirty)
+					folio_clear_f2fs_gcing(folio);
 				folio_end_writeback(folio);
+			}
 		} else if (!folio_submitted && folio_test_writeback(folio)) {
 			folio_end_writeback(folio);
 		}
@@ -5054,6 +5080,8 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 			f2fs_remove_dirty_inode(inode);
 			folio_cancel_dirty(folio);
 		}
+		if (!dirty && !folio_test_writeback(folio))
+			folio_clear_f2fs_gcing(folio);
 		return;
 	}
 
-- 
Nanzhe Zhao

