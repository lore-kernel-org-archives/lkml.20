Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0783EFFA6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960368; cv=none; b=G0kIxKfLCuZy8tsxW/AWrf9hNNyBJQsGDhSH+rxhW94OPFIIcW0oZ7PR+2GbniDIZQRb4zDCGz2oTV/6s+Y8TVsp0hJ4EeF9+7BycHb96s5zKgpBJF95W3pXRaVvU39H/XlqEbN93Q2vxdNgiAmrWjPK0PFx+/Orcpu7quhJYzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960368; c=relaxed/simple;
	bh=bBT7ZsVLTPiCejve9YUaVioZn4iPc6ef7MPyWAEiiOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=md/95tkCbeIyJdlDV7mRYmeaNzxnZPffeeGyIU4Qjlv29bC9Ot/MmW7J1NSvPkK1YsM81CZ5sdx6snS02UTwOgoa+apuzf29hSXUhzF3tsyUYaBAesTPhFBm3DLAOaKZuEm7GupHtjK7F90neykKQmK37nZsPh+iZniIpGkwO/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xh+jWs0h; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xh+jWs0h"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3a8c118e711so2122475a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960363; x=1792565163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zxVvhouO+69qAuqiJO0qt6uWBvP+OPPrVLEtUsWLTS4=;
        b=Xh+jWs0hckIzFfDabqbzKP51nik+GG28CCdeJp4nR6fInJX5jmqpS7+je9ylilrN2Y
         sNo5cvUfDLgIPNrSa/EOQOgXi9SIeHtjstbM0ZayW8EpaF70htNlRbqFtm+5y2kQoNJ3
         XRzd1fHBpdcrxjc/IHQr8Z9D94WlPsumMZ5xbZpVTtYxsJi3sLcdiVfCQBCBkAnxyC2L
         iPyT5p4DIMsumMdlXyGtfOMuuPhqsA8aOoQFhZHdxhuoo/vvI4ps05AqP/tmbALo4MJ3
         pAQAODjEoG6lRn+ohyBcuIgeg8HfDdENdrajkvV79mQPSg1/OmzSmUfCrYXB4qFZgD/K
         X1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960363; x=1792565163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zxVvhouO+69qAuqiJO0qt6uWBvP+OPPrVLEtUsWLTS4=;
        b=V4iO2cE5CfMn4X4uHwPYtXp+PqW4XZKFp7GlBDshSzqH6wqLqPa3oxS3kdnZHnD1d/
         12zMDG3Ac1oYXX4UrINs9c31TqLqVw4IlGuiGxLAtX65Dfm5H7XQKEdOzE5uyNCt6d/m
         k5HvB1UL0N0mLh0jukaTkK+e0pt/nvMDd41uJ7m6eg2lRNN7AKs3HzcHQXMGsNO0qt97
         WJxDoGXC+YuomoJWtCfwYJUF4RFoK3raJ2RhG+P+5BFxY2v7rbnr9K+5FVOWWRe90S7w
         0vM+eMWzevQUKfK4x/CXrXQ6Ct5GbZFdtlTeLeLjhfHpwYmqvBW3Ec+UneW80VK+X7j4
         BvgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvf43hhOpMjLy5HMhm046Xo7JC5K80ZLHyl57qggFPz3F2Z4XdZ6rDE10utCWMsm9d5l0nM0OApnXDZec=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTlhgEGNCiAW/suiTZhKU19EQrH6CNbWnwNyb7WRr31oyJMgTh
	lEXl0c+upJzlhwPvk0IAsqAImpXcUJS6cL0qgaJ3jIGuM9FDEQP7aLjG
X-Gm-Gg: AYBFou1/4W7bILa4moe/IGcVgp6vNg9b3oQsEbeKqFOrGyxlSmK6pW7neg1sOhDhWMX
	7aUUe0vzoeZwwhJCvZbZu95Kf2J8l/KPNTwCxacS7sVD46HrnowRwQDoWCDrWZxc0QmVGbKPSX8
	wyiMDyHmz3AEBsEWMqtJ23RRrigJIfpqBX9Y6KKOgYp6pO7wlXGdwlErTOu6dnilbR2+L9FIIdC
	3QeCn4G93pZiq5baw9aNxbAHKmHcU3MhVnFcJJ5LDFfIc0mTpNUg69IJphpatzh7zSMX16J0eBD
	trm8S5XBDYboiAEZaJfjgPwmjcwFCpsbHZDNGz4bkZxD/DwSQ0Sxy+qzRIiJkI0ei8S2ubcXkqq
	ET3WBlCQl1H+NdPjfZu3CGNB1UUaoorQQPM985KNbVt2rwsZgxMo0nA72E/kuFXB7g3bTvG4bHF
	DXtn/4FZZnN2QgMV2dNPkNC1F36/7gaYgJSfz1+Te0HCglvIAejdAHUj87CLv5hXk5WlpkOmWty
	ocboXvkMIJLvpAwpbSXvgFlXeypA64A1Hmi
X-Received: by 2002:a17:90b:1dc1:b0:3aa:f4af:1e14 with SMTP id 98e67ed59e1d1-3ab3ac7eeb8mr13207845a91.51.1791960362956;
        Tue, 13 Oct 2026 23:46:02 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:46:02 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v5 11/16] f2fs: handle partial truncate of large folio dirty subpages
Date: Wed, 14 Oct 2026 14:44:40 +0800
Message-ID: <20261014064445.2835813-12-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A large folio can be partial truncated and stays in folio mapping, we
need to clear the subrange dirty bits and uptodate bits that the partial
truncate covers. If this partial truncate happens to clear the last
subrange dirty bits, then cancel the whole folio dirty state.

Also add a guard in f2fs_write_folio_dirty_range() so a large folio
subpage whose disk block was already truncated (NULL_ADDR) is skipped

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 122 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b9f2054f514f..4228c26bee0d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -362,6 +362,27 @@ static void f2fs_cache_write_end_bio(struct bio *bio)
 	bio_put(bio);
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
@@ -418,7 +439,8 @@ static void f2fs_write_end_bio(struct bio *bio)
 			wake_up(&sbi->cp_wait);
 
 		if (finished) {
-			folio_clear_f2fs_gcing(folio);
+			if (!f2fs_ffs_has_dirty_subpage(folio))
+				folio_clear_f2fs_gcing(folio);
 			folio_end_writeback(folio);
 		}
 	}
@@ -2909,6 +2931,40 @@ static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_t offset,
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
+	if (!f2fs_folio_has_ffs(folio))
+		return;
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
+}
+
+static void f2fs_clear_truncated_page_state(struct folio *folio, pgoff_t i)
+{
+	if (f2fs_folio_has_ffs(folio)) {
+		ffs_clear_subrange_uptodate(folio,
+				(loff_t)i << PAGE_SHIFT, PAGE_SIZE);
+	} else {
+		folio_clear_uptodate(folio);
+		folio_clear_f2fs_gcing(folio);
+	}
+}
+
 bool f2fs_ffs_test_blk_dirty(const struct folio *folio, pgoff_t index)
 {
 	struct f2fs_folio_state *ffs;
@@ -3811,12 +3867,31 @@ static int f2fs_write_folio_dirty_range(struct folio *folio, int *submitted,
 		}
 
 		err = f2fs_get_dnode_of_data(&dn, data_idx, LOOKUP_NODE);
-		if (err)
+		/*
+		 * If a subpage of folio for a cow file is dirtied but not
+		 * reserve a cow block, fallback to original inode to lookup
+		 * block address
+		 */
+		if (atomic_commit && (err == -ENOENT ||
+		    (!err && dn.data_blkaddr == NULL_ADDR))) {
+			f2fs_put_dnode(&dn);
+			set_new_dnode(&dn, inode, NULL, NULL, 0);
+			err = f2fs_get_dnode_of_data(&dn, data_idx,
+						     LOOKUP_NODE);
+		}
+		if (err && err != -ENOENT)
 			goto block_done;
 		dn_held = true;
 
 		fio.old_blkaddr = dn.data_blkaddr;
 
+		/* This page is already truncated */
+		if (err == -ENOENT || fio.old_blkaddr == NULL_ADDR) {
+			f2fs_clear_truncated_page_state(folio, i);
+			err = 0;
+			goto block_done;
+		}
+
 got_it:
 		if (__is_valid_data_blkaddr(fio.old_blkaddr) &&
 		    !f2fs_is_valid_blkaddr(sbi, fio.old_blkaddr,
@@ -4366,6 +4441,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		bool verity_in_progress;
 		int folio_submitted = 0;
 		bool bias_added = false;
+		bool dirty;
 
 		submitted = 0;
 		retry = false;
@@ -4514,9 +4590,9 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		 * Redirty the folio if dirty subranges remain in a large
 		 * folio, or if order-0 writeback fails due to an error.
 		 */
-		if (f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
-					(err ? pos : end_pos) - folio_pos(folio)) ||
-					err)
+		dirty = f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
+					(err ? pos : end_pos) - folio_pos(folio));
+		if (dirty || err)
 			folio_redirty_for_writepage(wbc, folio);
 		else if (!f2fs_folio_has_ffs(folio))
 			inode_dec_dirty_block(inode);
@@ -4527,6 +4603,14 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		 */
 		if (bias_added &&
 		    atomic_dec_and_test(&ffs->write_pages_pending)) {
+			/*
+			 * For a large folio we clear PAGE_PRIVATE_GCING only
+			 * when the last dirty bit is cleared, otherwise the
+			 * remaining subpages are no longer written back as
+			 * checkpoint-guaranteed data (f2fs_is_cp_guaranteed()).
+			 */
+			if (!dirty)
+				folio_clear_f2fs_gcing(folio);
 			folio_end_writeback(folio);
 		} else if (!folio_submitted && folio_test_writeback(folio)) {
 			/*
@@ -5354,10 +5438,41 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
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
+		folio_clear_uptodate(folio);
+
+		/*
+		 * If the truncated subrange happens to clear the remaining
+		 * dirty bitmap of the whole folio, cancel the folio-level
+		 * dirty state.
+		 */
+		if (!dirty && folio_test_dirty(folio))
+			folio_cancel_dirty(folio);
+		if (!dirty && !folio_test_writeback(folio))
+			folio_clear_f2fs_gcing(folio);
 		return;
+	}
 
-	if (folio_test_dirty(folio)) {
+	if (f2fs_folio_has_ffs(folio)) {
+		f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
+							folio_size(folio));
+	} else if (folio_test_dirty(folio)) {
 		inode_dec_dirty_block(inode);
 		f2fs_remove_dirty_inode(inode);
 	}
-- 
2.43.0

