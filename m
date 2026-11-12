Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484761;
	b=vNeofAVSEC7CnElDCA0HXYGBku9trfGwbNbhNr2Uum4oXaD+Dw2gNgN+ZL4gNKX+ZHKz
	 wIzNsQJcNe7XxnOi5yvl/x7OddX09CKLsiaqWZ3Rs/SldyrUtxUKPZE3Fuo3r0ojoOl2U
	 i4F47QZWTnGBkiItQAQWsoJyIKucSa+npfUSsnIMtjBL6D9DmAOmbMI3/NUfbuBpfjine
	 rWFtOmeAw7gMiLIrSk0l2X/iPeVVLmJcUoTA3jJbWgBbi4X+dv4wuY62Cr4rxs3LfEzbC
	 eMlVWbzjcNBw53r4wOTQ2Zee1Hc5LoI5KcS0TiTdpF3W94Mu+QBFHo9KpsjHPydKYcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XGkQWQUPPqTVyUnHum1hbkxRtjJRRu5gjrKtGjsWYE8=;
	b=VeEiE9oCTFIzFD6dzM5NdK9jkiP1zU+kN5Imy3OJ+E4SDO9OlG7bqmenME1WHdFX0zWo
	 qlWlTzFfm9Poeev9n3z3dXiHYTAtIHK0lnisgQQ7qNL6vYbDymhjp9zHNBWqg9NRYVQm9
	 wtEWhx03POrK0bwCsctieatzflw1zN/FbRYEDl/J2f7qrGzw70evadMb3yxELCs6vYs01
	 kipI9BDKJ8AOw7RlBaN/BnxRIQaRY9kS9wVuotEd+AQ/L86ccbWiKh2KHMfWQ1CHbtrOS
	 +nOa2DslfY4ty3hvfRHqyKHRLQQF8uiTQKY1BXjSzlJpy1CFkZXdWuPpubDC5a4aFNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ab3UbyWb;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FE7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00FE7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ab3UbyWb
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b904d10882so1870619b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484760; x=1795089560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XGkQWQUPPqTVyUnHum1hbkxRtjJRRu5gjrKtGjsWYE8=;
        b=ab3UbyWbcgXwXJW3Ybl0YOl9lqd2Wue1dbPeC3wp4y53+xf9O7K02ZVoQAGGzqwoii
         MaHT+DWpmWyUlWpJq2WkNqXcMPtHC20N3e714izzYuTo27REFUSIJ8/Re2qCw+l80a96
         w2ObMf2FUcY3pwhoNIhZt+7t7cjXzTvb3dYDWADEg0v3gkCBt7ZYkuj5ZbK9Yvl/zbgW
         mMvF/YtecJOCNjuhX913UrYDbPiVrVu82vMxf95y1azHkZmPf68GBnU+W9IK/ojcM2uo
         CSlezRDKwVZVT7eUYnKUX+urB/WhFHkaC0We0K9Nllo84ni57NNNDcLd/b317lkUj0N0
         OjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484760; x=1795089560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGkQWQUPPqTVyUnHum1hbkxRtjJRRu5gjrKtGjsWYE8=;
        b=pgQl4IlEX1U+sqMlM3jxM96wOS7qS2xwcouJjboGpYDV3sr4nc6dwPBVd/yjKIBSd2
         MrFuvNtGE0xm2Ree8wp6oZY52VHOT88YJCJ8rL9AGOEYB7VpwN3RTbF3sEdShZsrwsyv
         8Vu/Liqa8wMz7Ht8Zu2cd24IfYUiTH7pz+bHjH4NOMfT0F8+01SlDq3fSI+Ax7r8CrFd
         K05MN8mD4ScEWu6Fiqfvx6LQpR+tUFbrQsp8QedPxBT72+fB/oZrtyzRAQNUi/L3D8wy
         crhwvJ3dqOsR3aLVjmvv2qw/7B9aHpI+zH888p5XF2lBJ8SBwjp/YfMpF5ZcA9VzxFsf
         ECPw==
X-Forwarded-Encrypted: i=1; AL+hErFRhbA1GaGBSa4rcbmlTIQ6YeeXCixL+Rq+6sWRun/zzK3bZgPYR9qCkhUw7XhLRir6/ZlOKQ+AAwTFyec=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LKeMNjHdZUqEhMsvDNQ9TkNm2/RyxpZByDQ/A7Ygs6r4GnF2x
	8bZ4gxDfF738WwEtQ3EPegybr8O6TytRaCJUZaG7s5E7r+Y4j+ydZJY9
X-Gm-Gg: AYBFou2io6/uORVhYmdTfh9Qtn9IldHIwZnlfNdIoPKUhOOI1xnoglC0s+io/KSARGO
	c1OWlk8UoKiqDhbQWHjYxnxC8J8BBP3ZPcBKF/Fvz6wiW7WUiryehPPrH/nn+3Yw8IOMRORBKJb
	okeDTzXrURbemQjmmc+jN1LG3qHCh/wXy0WETVHB6+fUoV3pKi10GYVLZmxG64MgBvn0dV39J2I
	019YFs3HmbuVQTENtq+allusFplEN577RyP0CFdu6JQ+A0dwja5cwy/+G7lpwvWUycH1YCFOP3E
	K/ViW2GH0Fnavm6viu7fse6VTHehFa0iZ0gsPYlYB3O3rj6QE2UmmzlA/HWrCsu8E3RWXd5ofMT
	2OSE2rINyI0kiNxWGlatolXUhs8zIXsZW29RVOxks+QWbsrVDiDXtAcay/hIAmHnCCrICA7NNJ3
	xhTbfyhV6CUtJ91xscVfep5fOFYDJqviBBgIBCrwyCl6ja78x8Q1euYHKAGbwB+ZqmoSQ/Qdql0
	R4T85B94ahUyaYQ3FlLY/tfkdtHYpsAe7xI5zW8mULkYSY7BK7LGsOsYIdFktovVC+u6jDjo+3g
	pcM0lKGGGTRu3VnXVBa1rfrOYIJ9bpYITdjDccuvHTu4P1Kr63j7/F6HwiF/wSfVXjIYiQzing=
	=
X-Received: by 2002:a05:6a21:3a87:b0:3e2:6ee4:a758 with SMTP id adf61e73a8af0-3f2fead83demr5830011637.54.1794484760038;
        Thu, 12 Nov 2026 03:59:20 -0800 (PST)
Received: from localhost.localdomain ([152.136.45.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baabad405fsm3234798b3a.57.2026.11.12.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:59:19 -0800 (PST)
From: diasyzhangqing@gmail.com
To: tytso@mit.edu,
	adilger.kernel@dilger.ca
Cc: libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qing Zhang <diasyzhang@tencent.com>,
	syzbot+f111db4cb2acd44eb2f4@syzkaller.appspotmail.com
Subject: [PATCH] ext4: wait for tail page commit before truncating a failed write
Date: Thu, 12 Nov 2026 19:59:06 +0800
Message-ID: <20261112115906.17915-1-diasyzhangqing@gmail.com>
X-Mailer: git-send-email 2.43.7
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

From: Qing Zhang <diasyzhang@tencent.com>

In data=journal mode, a failed extending write can leave buffers beyond
i_size attached to the committing transaction. When blocksize < PAGE_SIZE,
invalidating these buffers in the partial tail folio returns -EBUSY,
triggering a warning in ext4_journalled_invalidate_folio() and leaving
invalidation incomplete.

Call ext4_wait_for_tail_page_commit() before truncating the page cache
in ext4_truncate_failed_write(), as is already done when shrinking a file
via ext4_setattr(). The helper releases the folio lock before waiting
for the commit to finish, then retries invalidation.

Fixes: 53e872681fed ("ext4: fix deadlock in journal_unmap_buffer()")
Reported-by: syzbot+f111db4cb2acd44eb2f4@syzkaller.appspotmail.com
Closes: https://syzbot.appspot.com/bug?extid=f111db4cb2acd44eb2f4
Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
---
#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

 fs/ext4/ext4.h    | 1 +
 fs/ext4/inode.c   | 2 +-
 fs/ext4/truncate.h |  2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index f38fec3167fb..505ec38fa508 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3214,6 +3214,7 @@ int ext4_get_fc_inode_loc(struct super_block *sb, unsigned int ino,
 extern int ext4_inode_attach_jinode(struct inode *inode);
 extern int ext4_can_truncate(struct inode *inode);
 extern int ext4_truncate(struct inode *);
+extern void ext4_wait_for_tail_page_commit(struct inode *inode);
 extern int ext4_break_layouts(struct inode *);
 extern int ext4_truncate_page_cache_block_range(struct inode *inode,
 						loff_t start, loff_t end);
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 10cd85d4c721..f59c4a5b7561 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -6845,7 +6845,7 @@ int ext4_sync_inode_metadata(struct inode *inode, struct writeback_control *wbc)
  * buffers that are attached to a folio straddling i_size and are undergoing
  * commit. In that case we have to wait for commit to finish and try again.
  */
-static void ext4_wait_for_tail_page_commit(struct inode *inode)
+void ext4_wait_for_tail_page_commit(struct inode *inode)
 {
 	unsigned offset;
 	journal_t *journal = EXT4_SB(inode->i_sb)->s_journal;
diff --git a/fs/ext4/truncate.h b/fs/ext4/truncate.h
index ce84aa2786c7..c10e4ab4242e 100644
--- a/fs/ext4/truncate.h
+++ b/fs/ext4/truncate.h
@@ -17,6 +17,8 @@ static inline void ext4_truncate_failed_write(struct inode *inode)
 	 * We don't need to call ext4_break_layouts() because the blocks we
 	 * are truncating were never visible to userspace.
 	 */
 	filemap_invalidate_lock(mapping);
+	if (ext4_should_journal_data(inode))
+		ext4_wait_for_tail_page_commit(inode);
 	truncate_inode_pages(mapping, inode->i_size);
 	ext4_truncate(inode);
 	filemap_invalidate_unlock(mapping);
-- 
2.43.0

