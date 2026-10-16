Received: from h3cspam01-ex.h3c.com (smtp.h3c.com [60.191.123.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05004570DC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.191.123.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142011; cv=none; b=MoWuYDZpBGt5lvjmBnjD/0f5rGNRp5GfUdvCPHgIFOCzj5+5ZFSzXkdGEUSp5fZxrygFRABIeSAtSYgg+ePRMEj1B0MH6GVG+f0R70M0+LcS2pthth+wNjIe2J+Kx0hdnxKu+GJ3QHLiwMlC0veEifL6cBdBzq5i5cF3w4EfZO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142011; c=relaxed/simple;
	bh=i9OUOy5R7JPZY55a+CqVEZcm2NGkJhLvHqBJZzxIFm0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YgstPFqXSavbTcal9Qj/mgCbCxfEn5UqIWLlHV0Fmyucsm/E3AdbhRFM28oM4muBfz7Qs0xz3lr2ZLFWzKgbUs95TZFaWrySphizGH9To0w3pLUH2407dg+Vc5MgeQXSzd/2M8z/9IzAZUrE6R3kVGtME7CWO1Kn85o/OdPsk0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com; spf=pass smtp.mailfrom=h3c.com; arc=none smtp.client-ip=60.191.123.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h3c.com
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69G9CKlJ023180;
	Fri, 16 Oct 2026 17:12:25 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id DA56A2284EA4;
	Fri, 16 Oct 2026 17:15:23 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Fri, 16 Oct 2026 17:12:25 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <lin.nan@h3c.com>, <wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>
Subject: [PATCH] ubifs: zero stale data beyond EOF before file size grows
Date: Fri, 16 Oct 2026 17:04:58 +0800
Message-ID: <20261016090458.1891272-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:h3cspam01-ex.h3c.com 69G9CKlJ023180

mmap writes can dirty the page cache beyond EOF without changing
i_size. A later extending write or ftruncate turns that region into a
hole, but UBIFS never zeroes the partial page at the old EOF, so reads
expose the stale data.

Zero the tail of the old-EOF folio in all three size-extending paths:
ubifs_write_begin() for writes starting beyond EOF, do_setattr()
before truncate_setsize() grows the size, and ubifs_vm_page_mkwrite()
so mmap writes cannot leave such a tail behind. This mirrors what
block_page_mkwrite() does for buffer_head filesystems and what ext4
does on size extension.

All zeroing takes the old-EOF folio lock without ui->ui_mutex, keeping
the folio_lock -> ui_mutex order of ->writepage() and
->page_mkwrite(); the reverse order deadlocks.

Signed-off-by: Nan Lin <lin.nan@h3c.com>
---
 fs/ubifs/file.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index e73c28b12f97..e09b17d36495 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -202,6 +202,53 @@ static void release_existing_page_budget(struct ubifs_info *c)
 	ubifs_release_budget(c, &req);
 }
 
+/**
+ * ubifs_zero_eof_hole - zero the stale tail of the old-EOF folio.
+ * @inode: inode whose size is about to grow
+ * @new_end: new end of the file, only used to bound the tail
+ *
+ * Zero the cached folio containing the old EOF for [old EOF,
+ * min(folio end, @new_end)) so a size extension does not expose stale
+ * data left beyond EOF by mmap writes.
+ *
+ * Must be called without ui->ui_mutex held: we block on the old-EOF
+ * folio lock, and ->writepage() and ->page_mkwrite() hold that folio
+ * lock while taking ui_mutex; the reverse order deadlocks.
+ */
+static void ubifs_zero_eof_hole(struct inode *inode, loff_t new_end)
+{
+	loff_t old_size = i_size_read(inode);
+	unsigned int from, to;
+	struct folio *folio;
+
+	if (new_end <= old_size)
+		return;
+
+	folio = filemap_lock_folio(inode->i_mapping, old_size >> PAGE_SHIFT);
+	if (IS_ERR(folio))
+		return;
+
+	/*
+	 * Re-read i_size under the folio lock: a concurrent truncate may
+	 * have shrunk the file, turning this folio into valid data.
+	 */
+	old_size = i_size_read(inode);
+	if (new_end <= old_size)
+		goto out;
+
+	from = old_size & (PAGE_SIZE - 1);
+	if (!from)
+		goto out;
+	to = (old_size >> PAGE_SHIFT) == (new_end >> PAGE_SHIFT) ?
+	     new_end & (PAGE_SIZE - 1) : PAGE_SIZE;
+	if (to > from)
+		folio_zero_range(folio, from, to - from);
+
+out:
+	folio_unlock(folio);
+	folio_put(folio);
+}
+
 static int write_begin_slow(struct address_space *mapping,
 			    loff_t pos, unsigned len, struct folio **foliop)
 {
@@ -423,6 +470,14 @@ static int ubifs_write_begin(const struct kiocb *iocb,
 	if (unlikely(c->ro_error))
 		return -EROFS;
 
+	/*
+	 * The write starts beyond EOF: zero the stale tail of the old-EOF
+	 * folio before budgeting takes ui->ui_mutex. do_readpage() only
+	 * sanitizes the write folio, not the old-EOF folio.
+	 */
+	if (pos > inode->i_size)
+		ubifs_zero_eof_hole(inode, pos);
+
 	/* Try out the fast-path part first */
 	folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
 			mapping_gfp_mask(mapping));
@@ -1220,6 +1275,10 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
 
 	if (attr->ia_valid & ATTR_SIZE) {
 		dbg_gen("size %lld -> %lld", inode->i_size, new_size);
+
+		/* Must run before the size change loses the old boundary. */
+		ubifs_zero_eof_hole(inode, new_size);
+
 		truncate_setsize(inode, new_size);
 	}
 
@@ -1494,6 +1553,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct timespec64 now = current_time(inode);
 	struct ubifs_budget_req req = { .new_page = 1 };
 	int err, update_time;
+	loff_t i_size;
 
 	dbg_gen("ino %llu, pg %lu, i_size %lld",	inode->i_ino, folio->index,
 		i_size_read(inode));
@@ -1553,6 +1613,19 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 		filemap_dirty_folio(folio->mapping, folio);
 	}
 
+	/*
+	 * Zero the part of the EOF folio beyond i_size so mmap writes
+	 * cannot leave a stale tail behind (see ubifs_zero_eof_hole()).
+	 * For a page-aligned i_size the mkwrite entry check has already
+	 * returned SIGBUS, so @from is always non-zero here.
+	 */
+	i_size = i_size_read(inode);
+	if (folio->index == (i_size >> PAGE_SHIFT)) {
+		unsigned int from = i_size & (PAGE_SIZE - 1);
+
+		folio_zero_range(folio, from, PAGE_SIZE - from);
+	}
+
 	if (update_time) {
 		int release;
 		struct ubifs_inode *ui = ubifs_inode(inode);
-- 
2.33.0

