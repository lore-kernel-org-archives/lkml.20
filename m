Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0650B3C2BA4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749805; cv=none; b=GLNpcCh70wAHuw4psDyHHu+oPU3zjX7J3pExPw2LIrZZ9CsGn2gtEmtDMXamf3IiOatICyLD11p7OeGgrWd8Tef3FoJgdeGosxHdwyXV2quKNNb0VvxkoS4aqjgowzP91LHDJZrR7ybGHqhDS9Z90OAIuDhrw9yrLfx9qfwlVZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749805; c=relaxed/simple;
	bh=LQq2bbrpK3S5Agc2rjRfvdEQJmcm17YwgmSXKWGHcdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQRU+LD3Ko9bMo2mkocNETdKDRFsbsdD2RT2Uy4OBfxEYB7fJOKEY+Mstl6AMk2uaPCF8xC4L2gxJ6JXaXYUC9BkP6iB5yndyrnmkcB+u7/zBIusJt1ZWwkz/lDGjP14AwijivdaTbEMBqzm6+hVDXR5MVQzHXIZnXaVp4F+8Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=PWbAbtyF; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="PWbAbtyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=6v
	N/j7vfxBIgKWR2Ht5PrFZDmAgFaU/24vLDpliFyBE=; b=PWbAbtyFNE3RE+mBP0
	TrCRuCrH0fI387IjXxD8Y/KvYAnQnlAxNF/uNbCFLjVPvGaFt0YzAo3MlLIUKiSm
	+CIsqtH+xPOXSHSZXgFMG6do1883xEoTs6StL8XJa7Wl+lkbt6FNQa2sdgM43BD7
	3OvIha1Z9FKfI5nL3bfDN2exw=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3P5N85Y5qx4G3Gg--.15517S3;
	Wed, 26 Aug 2026 21:09:18 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <nzzhao@126.com>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Pengfei Li <lipengfei28@xiaomi.com>
Subject: [PATCH 12/14] f2fs: handle block cloning within the same large folio
Date: Wed, 26 Aug 2026 21:09:13 +0800
Message-ID: <20260826130916.2231342-2-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3P5N85Y5qx4G3Gg--.15517S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4UWFyUAry7AF4UtFW5Wrg_yoW5tFWkpF
	y5GrZ8Z3ykCFyxXr1ftF47ZryrKrZ7Ww4UJFs7u3s3C3W5X3Z3Kw4Iqw4j9F1F9rWUA3y8
	XryUJFy8uF1UXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjmhwUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsB7WpmqO5X5UMQAA3E

With large folios, the source and destination block in __clone_blkaddrs()
can belong to the same folio during same-inode operations such as
collapse range and insert range.

In that case, locking the source folio and then looking up the
destination folio can try to lock the same folio again.  It also copies
from and to offset 0, which is only correct for order-0 folios.

Detect the same-inode, same-folio case before looking up the destination
folio.  Then in this case,we reserve the destination block explicitly.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/file.c | 76 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 64 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4272013dbe38..b82acbc3240f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1581,25 +1581,77 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 			f2fs_put_dnode(&dn);
 		} else {
 			struct folio *fsrc, *fdst;
+			size_t src_off, dst_off;
 
 			fsrc = f2fs_get_lock_data_folio(src_inode,
 							src + i, true);
 			if (IS_ERR(fsrc))
 				return PTR_ERR(fsrc);
-			fdst = f2fs_get_new_data_folio(dst_inode, NULL, dst + i,
-								true);
-			if (IS_ERR(fdst)) {
-				f2fs_folio_put(fsrc, true);
-				return PTR_ERR(fdst);
-			}
 
-			f2fs_folio_wait_writeback(fdst, DATA, true, true);
+			src_off = offset_in_folio(fsrc,
+						(loff_t)(src + i) << PAGE_SHIFT);
+
+			/*
+			 * For same-inode operations (collapse/insert), src and
+			 * dst may fall within the same large folio. Detect this
+			 * to avoid self-deadlock on folio lock.
+			 */
+			if (src_inode == dst_inode &&
+			    folio_contains(fsrc, dst + i)) {
+				struct dnode_of_data dn;
+
+				/* Reserve block for dst before copying */
+				set_new_dnode(&dn, dst_inode, NULL, NULL, 0);
+				ret = f2fs_reserve_block(&dn, dst + i);
+				if (ret) {
+					f2fs_folio_put(fsrc, true);
+					return ret;
+				}
+
+				dst_off = offset_in_folio(fsrc,
+						(loff_t)(dst + i) << PAGE_SHIFT);
+				f2fs_folio_wait_writeback(fsrc, DATA, true, true);
+				memcpy_folio(fsrc, dst_off, fsrc, src_off,
+					    PAGE_SIZE);
+				if (folio_test_large(fsrc)) {
+					f2fs_ffs_find_or_alloc(fsrc);
+					f2fs_ffs_mark_subrange_uptodate(fsrc,
+								dst_off, PAGE_SIZE);
+					f2fs_ffs_mark_subrange_dirty(fsrc, dst_off,
+								    PAGE_SIZE);
+				}
+				folio_mark_dirty(fsrc);
+				if (i_size_read(dst_inode) <
+				    ((loff_t)(dst + i + 1) << PAGE_SHIFT))
+					f2fs_i_size_write(dst_inode,
+						((loff_t)(dst + i + 1) << PAGE_SHIFT));
+				folio_set_f2fs_gcing(fsrc);
+				f2fs_folio_put(fsrc, true);
+			} else {
+				fdst = f2fs_get_new_data_folio(dst_inode, NULL,
+							      dst + i, true);
+				if (IS_ERR(fdst)) {
+					f2fs_folio_put(fsrc, true);
+					return PTR_ERR(fdst);
+				}
 
-			memcpy_folio(fdst, 0, fsrc, 0, PAGE_SIZE);
-			folio_mark_dirty(fdst);
-			folio_set_f2fs_gcing(fdst);
-			f2fs_folio_put(fdst, true);
-			f2fs_folio_put(fsrc, true);
+				dst_off = offset_in_folio(fdst,
+						(loff_t)(dst + i) << PAGE_SHIFT);
+				f2fs_folio_wait_writeback(fdst, DATA, true, true);
+				memcpy_folio(fdst, dst_off, fsrc, src_off,
+					    PAGE_SIZE);
+				if (folio_test_large(fdst)) {
+					f2fs_ffs_find_or_alloc(fdst);
+					f2fs_ffs_mark_subrange_uptodate(fdst,
+								dst_off, PAGE_SIZE);
+					f2fs_ffs_mark_subrange_dirty(fdst, dst_off,
+								    PAGE_SIZE);
+				}
+				folio_mark_dirty(fdst);
+				folio_set_f2fs_gcing(fdst);
+				f2fs_folio_put(fdst, true);
+				f2fs_folio_put(fsrc, true);
+			}
 
 			ret = f2fs_truncate_hole(src_inode,
 						src + i, src + i + 1);
-- 
2.43.0

