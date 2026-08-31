Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D923B42CB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157743; cv=none; b=BZyGAzpAd3PFwS4l0tpxcWWYOWAfK57NNnrpKqVquvOv7eo1TlKRxUiyntONQdB7y1if6GiOtPyWWrnVaVnKYlDFDwjthOgoKmF0CM5pYbD8qCyCTyrS+6TpaH8QjgV7wo0rNtMiizl0qgVS6oH3q0S2SKZWXLLKdWK7DQrR6RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157743; c=relaxed/simple;
	bh=V7FvtSugKhjNT2ZmWlU7OmLNr1hyuaMhvDtV1+/b48s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KBJx4zSaV0Gi3+6Zi787R6PDaD18wySdHFJxAlUSDrckCH5KcdgzTgmpJNc8mJ4yPVWUiI9/5h2yzKJtS8Tv+TNnP+Q6hrWzfZAsbxgTi4Iq2Qt43ylZXvrsq/9HwhlaP+6A8p7TQsmiUeyp8OGlhB3xy8ZXveUHvtyydyXtxeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rVYnNnuD; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rVYnNnuD"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788157731; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Y9iAOgav5Xi3RArqDRUmlMz4FJeOv/RfbeIABxvvgig=;
	b=rVYnNnuDTEYxEfCuD0EEAfNO0+fTWUPD5AE0hMTT11AwDRE0KAcIPOCiG6gWtPshxlQbXMi9hfsc0k38MzxZT5njh8xj/vMT7ACpi47O6ngNrvNrEuuThOGp6oW5RFwjpz+/BRpOiUupxh+9DLWT2iVPJlRktAXmuQmpZ396stQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R271e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X9tzGou_1788157730;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0X9tzGou_1788157730 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Aug 2026 14:28:50 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ocfs2: restrict OCFS2_INVALID_SLOT suballoc slot to system inodes
Date: Mon, 31 Aug 2026 14:28:45 +0800
Message-Id: <20260831062848.2743436-2-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260831062848.2743436-1-joseph.qi@linux.alibaba.com>
References: <20260831062848.2743436-1-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ocfs2_validate_inode_block() currently permits i_suballoc_slot to be
OCFS2_INVALID_SLOT for any dinode.  Only system inodes created by
mkfs.ocfs2 are allocated from the global allocator and thus
legitimately carry this value; regular inodes are always allocated
from a per-slot suballocator and hence must have a valid slot.

If a corrupted regular inode with OCFS2_INVALID_SLOT is accepted,
ocfs2_remove_inode() will pass the slot to ocfs2_get_system_file_inode()
and get_local_system_inode() will hit BUG_ON(slot == OCFS2_INVALID_SLOT)
when the inode is deleted.  This can be triggered by an unprivileged
user unlinking such a corrupted file.

Reject OCFS2_INVALID_SLOT for non-system dinodes during validation,
while still accepting it for system inodes.

Fixes: fe7a283b3916 ("ocfs2: add suballoc slot check in ocfs2_validate_inode_block()")
Cc: stable@vger.kernel.org
Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 180107a11046..eda50f13ffb5 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -1520,8 +1520,23 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if (le16_to_cpu(di->i_suballoc_slot) != (u16)OCFS2_INVALID_SLOT &&
-	    (u32)le16_to_cpu(di->i_suballoc_slot) > OCFS2_SB(sb)->max_slots - 1) {
+	/*
+	 * Only system inodes created by mkfs.ocfs2 are allocated from the
+	 * global allocator and thus legitimately carry OCFS2_INVALID_SLOT.
+	 * Regular inodes are always allocated from a per-slot suballocator.
+	 * If a regular inode with OCFS2_INVALID_SLOT was accepted here,
+	 * deleting it would pass the slot to get_local_system_inode() via
+	 * ocfs2_remove_inode() and trigger BUG_ON(slot == OCFS2_INVALID_SLOT).
+	 */
+	if (le16_to_cpu(di->i_suballoc_slot) == (u16)OCFS2_INVALID_SLOT) {
+		if (!(le32_to_cpu(di->i_flags) & OCFS2_SYSTEM_FL)) {
+			rc = ocfs2_error(sb,
+					 "Invalid dinode %llu: suballoc slot %u for non-system inode\n",
+					 (unsigned long long)bh->b_blocknr,
+					 le16_to_cpu(di->i_suballoc_slot));
+			goto bail;
+		}
+	} else if ((u32)le16_to_cpu(di->i_suballoc_slot) > OCFS2_SB(sb)->max_slots - 1) {
 		rc = ocfs2_error(sb, "Invalid dinode %llu: suballoc slot %u\n",
 				 (unsigned long long)bh->b_blocknr,
 				 le16_to_cpu(di->i_suballoc_slot));
-- 
2.39.3

