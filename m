Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872191;
	b=g3QZmAPqcqsgWtJHDKtBvEFKpifKK4YAd5lNtcO+FdF26zCDuFGaPKeo3AIqt7B/yXFB
	 JCRHLkVBQd9p6lA19mnF4GP6mYkO73Ba8RlbqRcArXit6TSqA52ie3xAEc48zvZC7tEGO
	 M35AsCPlyTlKKfOJLqziteLyOY0FdFlFvshUUbn7+qOHcJylkJuq2w1GvPcF8HwlqYfFM
	 0Qg1jUj+00ijhS/UCl1viN/Rp5KzPsq3trdUR2372rho5KDEyRS2gzHsAKMJ9Bb4mMYrC
	 C8izNFhTztRkRSORbxzNy6Kyca0ufREOhjBAToNljLzZZ7uZqhpAhiEu5Ad4XS+blRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872191;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7QGekZKeU5NIbSkQMt4Oy3eQXlB5HoLpBgq2tkOxVKU=;
	b=26Cq0ZefdQ46b3Xq2kCuVd5YfwZ84U9mdvxX4bbNbbXT7Z+1LsdBFYlxnEjj0i+sH14W
	 Ylmk8wjZgQdmML874WutMt97PJVjV8+3MkTK7Cs3b0WmSitFU418gHyEnYsot37Yp798q
	 rWL/3BYLQL6dZuV2ciOJCAuLI/pZ98u3lP5Ik6uLD5Q+6RRpQquo+Jk23I0XpH2Z6q+Xv
	 R+lnR3Xg7uNUvP+Qz2J/JxCpeGxop96UQBqVZMsU1IcEZFZox7TUt816y12qrnj11g+xN
	 zGh/ExI4Ul8YtyvrnS1RHS4//fTl7gguZdYrsj7vDP/B8ag8YNhnHneuBM986gSeVDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JaxB5vlp;
	arc=none smtp.remote-ip=115.124.30.113
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF93606D832
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BF93606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JaxB5vlp
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872188; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=7QGekZKeU5NIbSkQMt4Oy3eQXlB5HoLpBgq2tkOxVKU=;
	b=JaxB5vlpu1CXGKVhDllEiZsse/p59I2EDNcjT08WqlQPWUBTtnfPOwGx5IeR2jAgBrcMUlbTz4jW2AQbp1F1o6ZgDpddrCmY+VAQgOV1fIxRmQccqpgvKiKD6TA4toaHNYCWiFEiV0Sn+7h3GsCiqODAFYayoWf6ykaoRkfw50k=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8RZeX_1793872186;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8RZeX_1793872186 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:47 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 21/30] ocfs2: report unrepairable corruption from online filecheck fix
Date: Thu,  5 Nov 2026 17:49:17 +0800
Message-Id: <20261105094926.3203416-22-joseph.qi@linux.alibaba.com>
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

ocfs2_filecheck_repair_inode_block() starts with

	if (!ocfs2_filecheck_validate_inode_block(sb, bh))
		return 0;

so it proceeds when validation fails, but then returns 0 unconditionally
after repairing only i_blkno, fs_generation and l_next_free_rec.  An
inode that fails any other check passes the signature and OCFS2_VALID_FL
gates, leaves changed at 0, and since its ecc was valid the final
recompute is skipped too.  Nothing is written and userspace is told
SUCCESS for an inode that is still corrupt.

This already happens for the mode, i_rdev and size-without-clusters
checks.  Re-validate after the repairs and return the residual code, so
the fix interface reports what it could not fix.
Documentation/filesystems/ocfs2-online-filecheck.rst already describes
this: "the inode must first be checked for errors before performing a
final fix".

Three consequences worth noting:

 - Inodes failing those three existing checks now report INVALIDINO
   instead of SUCCESS.  No new error code is introduced, so the
   ocfs2_filecheck_errs[] table and its userspace-visible names are
   unchanged.

 - A partial repair still marks the buffer dirty and is written back even
   when an error is returned.  The fields that were fixed are real
   improvements and are not rolled back.

 - The revalidation runs ocfs2_validate_meta_ecc() a second time, which
   increments osb_ecc_stats again and emits a second
   ocfs2_filecheck_validate_inode_block trace event per fix request.

Fixes: d56a8f32e4c6 ("ocfs2: check/fix inode block for online file check")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 115aad1b8926..cfa545981310 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2122,7 +2122,11 @@ static int ocfs2_filecheck_repair_inode_block(struct super_block *sb,
 		     (unsigned long long)bh->b_blocknr);
 	}
 
-	return 0;
+	/*
+	 * Only i_blkno, fs_generation and l_next_free_rec are repairable here,
+	 * so report whatever is still wrong instead of claiming success.
+	 */
+	return ocfs2_filecheck_validate_inode_block(sb, bh);
 }
 
 static int
-- 
2.39.3

