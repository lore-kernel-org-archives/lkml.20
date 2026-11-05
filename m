Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872179;
	b=uPl66v7OG+gQfLWPbTyWglG0ZpvkZSe0Wmprn++6x0pEcOeDiKKZPpX0Qf91BDi8SjLG
	 yYgSqpIlgAxqU0T9YfoQ2YqLKXm9AjAAYI5thd8H6va1kjgcG++Q3F99gNmXJe3X8zgl5
	 BMNSpo72otbwvcjxwysy8DtftpwxrtuGIxz6uTfJk5azNlfRdqHLYWYdmBAgTNpFFo0qg
	 uTdefN7+20lS0JfXazFXBnPsLHGW7lfPWochEOejpHUuftnBC9facp3CCeoQqy1TZDJJE
	 bznP2k6EmyLAuAcTNmEH+nTI/KEDXNJrl3oO8Mf3FReOp0MEx6ZrRDPknmwhzkmphmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872179;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ufdNPwLudyf2sLsCMjFPaB3Adk3xxkzUT/kSYdmHeBU=;
	b=Yst462sXyKxoXFInEtLbuWen9O8tFIj2Jb/OyImkDRB5Y4sPuflfy5mbAhLoXABfntFG
	 zn6oDtdREmgWOSmPlbxPe4aKRQafNQMSi5i/qdQ/duRqeyEm9pQ1SYCPo0YnkrSuIXLnm
	 9ZHVjcrRzx9ZnDZfHFZxmTn7SMRp7424bMBo3iYyBPEGB48ypiFQPYMMGMyQQB54hURPf
	 CLCH/YZlbSDCc/zyNP+J/cFals7RaZR93KFwjH1R1P04h7tpH6+aID+qf3YutFKFbesH+
	 hlhv+MgJzRXUCwgwU6AH+kFBQO6BAeBKkhAzcop06owcNRJ8Z62lslP47nI5BXLz4JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=MyL0uy1N;
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2627606EE98
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2627606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=MyL0uy1N
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872175; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ufdNPwLudyf2sLsCMjFPaB3Adk3xxkzUT/kSYdmHeBU=;
	b=MyL0uy1N7SJnnp6NtLjLKhYsd7yQbuj23oO1Zjoy5W/HDJdCcTpL3OHqzMEb6PF3mjNUxROhVst5PpTMbJmWcnY0r8oyWffgUG8DwpQ+5UanAfbeNaF7BSedsDp3reQaWfobVCUz9zpMfgwAOXWsjJTTrRRr8U+S2uQL2qQ2w/U=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8K70t_1793872174;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8K70t_1793872174 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:35 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 08/30] ocfs2: abstract the dinode DIO orphaned slot check
Date: Thu,  5 Nov 2026 17:49:04 +0800
Message-Id: <20261105094926.3203416-9-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261105094926.3203416-1-joseph.qi@linux.alibaba.com>
References: <20261105094926.3203416-1-joseph.qi@linux.alibaba.com>
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

Fold the OCFS2_DIO_ORPHANED_FL guarded i_dio_orphaned_slot range test
into a predicate, mirroring the orphaned slot one.  The flag test stays
inside it for the same reason: the slot field is only meaningful while
the inode is DIO orphaned.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 33572a91324d..8c23170bb595 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -114,6 +114,13 @@ static bool ocfs2_dinode_has_bad_orphaned_slot(struct super_block *sb,
 		le16_to_cpu(di->i_orphaned_slot) >= OCFS2_SB(sb)->max_slots;
 }
 
+static bool ocfs2_dinode_has_bad_dio_orphaned_slot(struct super_block *sb,
+						   struct ocfs2_dinode *di)
+{
+	return (le32_to_cpu(di->i_flags) & OCFS2_DIO_ORPHANED_FL) &&
+		le16_to_cpu(di->i_dio_orphaned_slot) >= OCFS2_SB(sb)->max_slots;
+}
+
 static bool ocfs2_valid_inode_mode(umode_t mode)
 {
 	return fs_umode_to_ftype(mode) != FT_UNKNOWN;
@@ -1617,8 +1624,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if ((le32_to_cpu(di->i_flags) & OCFS2_DIO_ORPHANED_FL) &&
-	    le16_to_cpu(di->i_dio_orphaned_slot) >= OCFS2_SB(sb)->max_slots) {
+	if (ocfs2_dinode_has_bad_dio_orphaned_slot(sb, di)) {
 		rc = ocfs2_error(sb, "Invalid dinode %llu: DIO orphaned slot %u\n",
 				 (unsigned long long)bh->b_blocknr,
 				 le16_to_cpu(di->i_dio_orphaned_slot));
-- 
2.39.3

