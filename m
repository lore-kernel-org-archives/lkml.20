Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8383932CD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562464; cv=none; b=g8hU55wSE+KHkNQMjo0nv4q1GFLL61XCIslVTiwYeijJmTTdOt8rYTtDNKqTNsP9NXC4YsyUcOjT37G0YOULe9iAH+/vsjwuTMsCx+MXBVtHN1p1Zhjn+zIRg9+DoIWcFq37Ev/WvCImt4Obw2T2LpzZUqEpvq9WQ1eRdNNKdY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562464; c=relaxed/simple;
	bh=mbq+7vqXix4LVxZHevlqGMmNqbdA7qbi6eqrmAf15IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiYww4upadnLxliapo5E3EGUMe8+WI314yUe/Li6Wt+zZaL+yfzlW82sUnZCXITL3cAcqosi4IJMqhydvnwQcn6vYdldXrUvKzQ13kflCW0GVE5/jeJiDz5cftex3wxajO9SCliBm5iECfIqarVswRcfdjahsyeciyHv0jOt4AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=CoJJIYMd; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="CoJJIYMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3k
	1ppIEuCg6VxqNzLJvicq1GS9iGcFFQBOVeJMbwpLc=; b=CoJJIYMdEZnfk+Fvbs
	riNrqrg2sMrXY+d0n3okeALJ5QSX80SGh2Su4hh2K5YwVlrXxntPULMiwOntY/ru
	cXUwq3u1A0Mz8Q2D5igr04LCdxIwFOUUXO6tSWa0LoGU4NioZQlADPBV+yyggQ3b
	WU1xL1znvde/Xh9XR97pJDUXQ=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3V46AEslqHAsZBA--.38226S9;
	Sat, 10 Oct 2026 00:13:42 +0800 (CST)
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
Subject: [PATCH v3 07/17] f2fs: remove mappedtodisk flag usage in mmap write path
Date: Sat, 10 Oct 2026 00:12:14 +0800
Message-ID: <20261009161224.4163796-8-zhaonanzhe@xiaomi.com>
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
X-CM-TRANSID:_____wD3V46AEslqHAsZBA--.38226S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryUXF4UAF15AF4xKr4UArb_yoW8Aw48pr
	yYkF1xGrZ5GryDWrn7W3Z8Zr1rt3sxC3yxuF4kCwsxZ3W7WrnY9F1fta48ZFyjqr93AF42
	qr45CryrXa1rtFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUZ2-UUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBoha+jmrJErZMBwAA3I

PG_mappedtodisk was inherited from the nobh/buffer-head era.  However,
f2fs has no buffer heads and the flag is no longer meaningful.  The only
user of the flag is the "no holes" shortcut in f2fs_vm_page_mkwrite(),
which makes mmap write faults skip:

- zeroing the post-EOF part of the faulted folio,
- marking the folio dirty (mm dirties shared file mappings after
  ->page_mkwrite() returns, so this one was not noticeable),
- APP_MAPPED_IO iostat and REQ_TIME updates.

Remove this shortcut in f2fs_vm_page_mkwrite() and stop setting it in
f2fs_read_single_page().

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 1 -
 fs/f2fs/file.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d45fbe0db161..59f065eed712 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2572,7 +2572,6 @@ static int f2fs_read_single_page(struct inode *inode, struct fsverity_info *vi,
 got_it:
 	if ((map->m_flags & F2FS_MAP_MAPPED)) {
 		block_nr = map->m_pblk + block_in_file - map->m_lblk;
-		folio_set_mappedtodisk(folio);
 
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
 						DATA_GENERIC_ENHANCE_READ)) {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index aade9a04d8f3..e7471949faf2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -218,12 +218,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	/* wait for GCed page writeback via generic cache */
 	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
 
-	/*
-	 * check to see if the page is mapped already (no holes)
-	 */
-	if (folio_test_mappedtodisk(folio))
-		goto out_sem;
-
 	/* page is wholly or partially inside EOF */
 	if (((loff_t)(folio->index + 1) << PAGE_SHIFT) >
 						i_size_read(inode)) {
-- 
2.43.0

