Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD54D47F2EC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862775; cv=none; b=NbaufYCvhdMpqNQSa7yES0cUANBFv1zZSn/BDHl+KuxMRVA4liWOlmBJstk8R5OsP41txJsM4R/JXq3lbOJZOC2wxsRUlhepI1m9/Lapoq/b703zLNPlbi0KHc/6KXNUsVWRHXSSIOdBW+vtUQjKeri+sHzrtDOuZs04WaBgI3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862775; c=relaxed/simple;
	bh=63yeW+BffhgSU9Q0ZRPxIYM/e/dTupxnkvEZEfIHcBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFYhF4xWdNxxn7RoOw7+n/LpkXD/D/svBTGDctR44PoFr5utdVWD6AMJ1l0KiqUOcQz5pkWtqXu+OXRtLvVH/k47d8fk0GTzyILgz+2VSLnr+tx+uCA7+Cy/VaHYyDActU0wM9nErN4m1O7s+VDZhu5ACqPM9MdNsnLSED1uFAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZKSkoND+; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZKSkoND+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ZN
	CcsDTAWpU2pVo2YwD4VVTxHANBO/PjwHLNxeqMlcI=; b=ZKSkoND+gOCenG6zZ5
	YkEOtKFbnYayHgIWNZ3S4SYSX47Gioy5e2Ias+zJtOP5UwMXBW7qGT7sCWuac16+
	XtTkD4ej2IUApuXAoVoG09s0q+XY+DztJDJHbfgbBtXK/Wtshiw8ZRW9jSKiQiuC
	KjcA/1WxC8kKnmn9UlJaU4ixs=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3fwTKp81qBFXLEQ--.23138S7;
	Tue, 13 Oct 2026 11:38:54 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 5/7] exfat: do not re-zero the valid range in exfat_page_mkwrite
Date: Tue, 13 Oct 2026 11:38:35 +0800
Message-ID: <20261013033837.2748258-6-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013033837.2748258-1-chizhiling@163.com>
References: <20261013033837.2748258-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fwTKp81qBFXLEQ--.23138S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryrurWrCry8tw1kZF43Wrg_yoW8uw47pw
	43Cw1rW3y3Z345Xr1kWr98Za45W3Z3XF48Wr98G348ZrnrJ3s8tFWxtrW8uFWUt39Yqw1Y
	van0vr48ZwnrCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2XdUUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2w4ryGrNp86OygAA38

From: Chi Zhiling <chizhiling@kylinos.cn>

valid_size is advanced before zeroed_size, and exfat_page_mkwrite() no
longer holds i_rwsem, so a fault can observe a zeroed_size that lags
valid_size.  Zeroing the gap from zeroed_size then reads back and dirties
folios below valid_size that already hold valid data.

Start from max(valid_size, zeroed_size) instead, as
exfat_extend_valid_size() already does.  The skipped range is either
already zeroed or already valid, so nothing that needs zeroing is missed.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index a8c1f4757678..6209a991a118 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -965,8 +965,9 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 {
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct exfat_inode_info *ei = EXFAT_I(inode);
+	loff_t mmap_valid_size, fault_page_start;
+	loff_t old_valid_size, new_valid_size;
 	vm_fault_t ret;
-	loff_t new_valid_size, mmap_valid_size, fault_page_start;
 	bool dirty = false;
 
 	sb_start_pagefault(inode->i_sb);
@@ -975,12 +976,14 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 
 	mmap_valid_size = ((loff_t)vmf->pgoff + 1) << PAGE_SHIFT;
 	fault_page_start = ((loff_t)vmf->pgoff) << PAGE_SHIFT;
+	old_valid_size = exfat_get_valid_size(ei);
 	new_valid_size = min(mmap_valid_size, i_size_read(inode));
 
-	if (exfat_get_valid_size(ei) < new_valid_size) {
+	if (old_valid_size < new_valid_size) {
 		loff_t zeroed_size = exfat_get_zeroed_size(ei);
 
 		if (zeroed_size < fault_page_start) {
+			loff_t gap_start = max(old_valid_size, zeroed_size);
 			int err;
 
 			/*
@@ -988,7 +991,7 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 			 * fault populated its folio and iomap_page_mkwrite()
 			 * will dirty it.
 			 */
-			err = exfat_prepare_valid_range(inode, zeroed_size,
+			err = exfat_prepare_valid_range(inode, gap_start,
 					fault_page_start);
 			if (err < 0) {
 				ret = vmf_fs_error(err);
-- 
2.53.0

