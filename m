Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A693B3C10
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157737; cv=none; b=lZ1dkql5EO+qjk2FyVm/KC5ZbdRKppZW4MuQIMt6E4v8H8Nf4mE3eb2t56pSXMCyX9arm5imgsETwFR0DsaUw0WSOZVEi4HIXkifs4bnDjxl0EeE7N7fo0ok6tw8eEhtZJsfDzsMhIu11MgiRwX96ttgLtbvbep6Ks/FHQcMA4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157737; c=relaxed/simple;
	bh=Qc6//zvKyYbs/q4ZER4nHHDlM7Dqw4HoOprRDo9bSlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FMUN4Kw/p4TNxkt7261kS7aw5WiADixKw1XsJptwV2IkhS9doFUpp9/Ojvux8oGkrUhKScxGW7d/4a5RZ9ke8OPuqFHEz1VhMOESWVo6R/Pr8fOe9w1hIrkqAkyO4LuU95+w3z99SotAKNWaZ1j2rXT4yPRgtT9iV1NoTR5QkCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=GX5a63F0; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="GX5a63F0"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788157731; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ji+uhXnF7fLJN74nMTMZN1P6m4lN+gQDKKUil0g/KF0=;
	b=GX5a63F0wwUh3kfZyq4qGGe4FEcz6xMYCf4euv6e9KvZcAFtiF+0sbnfmsGDyvVOpjca684jbIS14zxpD5wsK6rbIcl3/ohktfJybcPwCQCov7Wl5OuPwdSIHMXbpnErWO8p36UeGJLHO/NRUCPpAFLtUl2bONwH/pbLF+HKCI0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R581e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X9tzGpB_1788157730;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0X9tzGpB_1788157730 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Aug 2026 14:28:51 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ocfs2: validate suballoc bit during inode read
Date: Mon, 31 Aug 2026 14:28:46 +0800
Message-Id: <20260831062848.2743436-3-joseph.qi@linux.alibaba.com>
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

i_suballoc_bit of a dinode is currently not validated at all.  A
corrupted dinode can carry an abnormally large i_suballoc_bit, which
bypasses ocfs2_validate_inode_block().  When the inode is deleted,
ocfs2_remove_inode() calls ocfs2_free_dinode(), which passes the
unvalidated bit to _ocfs2_free_suballoc_bits() and triggers
BUG_ON((count + start_bit) > ocfs2_bits_per_group(cl)).

Since suballocator block group bitmaps are contained in a single
block, a valid suballoc bit must be smaller than the number of bits
per block.  Reject oversized i_suballoc_bit values during dinode
validation.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index eda50f13ffb5..a982c99a9678 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -1543,6 +1543,20 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
+	/*
+	 * A suballocator block group bitmap is contained in a single block,
+	 * so a valid suballoc bit can never exceed the number of bits per
+	 * block.  Otherwise deleting the inode will pass the oversized bit
+	 * to _ocfs2_free_suballoc_bits() via ocfs2_free_dinode() and trigger
+	 * BUG_ON((count + start_bit) > ocfs2_bits_per_group(cl)).
+	 */
+	if (le16_to_cpu(di->i_suballoc_bit) >= sb->s_blocksize * 8) {
+		rc = ocfs2_error(sb, "Invalid dinode %llu: suballoc bit %u\n",
+				 (unsigned long long)bh->b_blocknr,
+				 le16_to_cpu(di->i_suballoc_bit));
+		goto bail;
+	}
+
 	if ((le32_to_cpu(di->i_flags) & OCFS2_ORPHANED_FL) &&
 	    le16_to_cpu(di->i_orphaned_slot) >= OCFS2_SB(sb)->max_slots) {
 		rc = ocfs2_error(sb, "Invalid dinode %llu: orphaned slot %u\n",
-- 
2.39.3

