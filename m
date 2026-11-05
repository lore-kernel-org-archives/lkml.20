Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872178;
	b=YQdjYgd1EJSN3EvsBgKQI/DhOonDAaw7Xn4D4IiWHzaZUkjoQ0Lutvlzy+Syn/rPt8FL
	 HrF/1Rip4TBvh37yK1zS+p+AAzxGehF6svHzSc52Z2yp+ZYDGqd3tJRc3QZPgPAMqdeAo
	 s+7VEGyaEnY1mQAHdBU/7ZYYMb4VPXBa4VviFHfqom2l8vU63wY1yGk1AelfhK13wh+hv
	 44ZRbZ4UdejzORyd1VUWLr+M6SOwtAW0TbXGIfc7fJTFX6FbEP2uoCIVE/OsZUkXXxrXq
	 14eJUPI89g1lf914yE4FOmSAkIwA3DjRzOI4LS9mVJuPeL4Ic8ehNNYK/HNHVGObTnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872178;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6bFfzlP7ZuKrIAMnfGBbOPNMeNRjXchYVxyrSYP+GTQ=;
	b=tWlt+MifthjWcTRkD4Di9Sk+tWNQ+c39qQgjt6DtUnMG5b8mo8eBdRJ1gPRwdVvaqyNx
	 JbUx+bj0kMCWUDmGMep0i6PbdGJ3fRDtBTwKsXFHYD/c0xohoeQuSrPG03X1KsXG5HOKS
	 6qJsQZCWM01ChXHRZINx1tWOPSyeDL/zrDOp79WXrnMuK7Lk8bA0bwyi3UMR+hy7qQRNN
	 NQ0tB/l6AyStlTEW6Vvg288IcmYqOxo9H1B+h6PYWBYJdqn98BUzcKe4ATsllfEJHNBit
	 VDuVQcLCrUhBUMncnjEMZPXHtCfYE8DiDq3R2OSZav41Eb9f6G6hwCThq+5SApFAkBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=D4bXEeX+;
	arc=none smtp.remote-ip=115.124.30.132
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6647D606D811
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6647D606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=D4bXEeX+
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872175; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=6bFfzlP7ZuKrIAMnfGBbOPNMeNRjXchYVxyrSYP+GTQ=;
	b=D4bXEeX+lZf14fvfSysOlBVpljqDsRRAuINfba7NPjmO4vfwlRyJoUjsZgoIkqpw09Mdcgjj74aD1icN3TKpQ9sfdGbGudWxjtTaSfyzrLD67NRa3+sOj7fH6pAikfGiGjNhyOjdPUFxBTnij+rifZ8RFP7YX9xfP6tJKJXlbP0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8RZYt_1793872173;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8RZYt_1793872173 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:34 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 07/30] ocfs2: abstract the dinode orphaned slot check
Date: Thu,  5 Nov 2026 17:49:03 +0800
Message-Id: <20261105094926.3203416-8-joseph.qi@linux.alibaba.com>
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

Fold the OCFS2_ORPHANED_FL guarded i_orphaned_slot range test into a
predicate.  The flag test stays inside it: i_orphaned_slot is only
meaningful when the inode is actually orphaned, so a bare range test
would reject valid inodes whose orphaned slot field is stale.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 89970378daf4..33572a91324d 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -107,6 +107,13 @@ static bool ocfs2_dinode_has_bad_suballoc_bit(struct super_block *sb,
 	return le16_to_cpu(di->i_suballoc_bit) >= ocfs2_suballoc_bits_per_block(sb);
 }
 
+static bool ocfs2_dinode_has_bad_orphaned_slot(struct super_block *sb,
+					       struct ocfs2_dinode *di)
+{
+	return (le32_to_cpu(di->i_flags) & OCFS2_ORPHANED_FL) &&
+		le16_to_cpu(di->i_orphaned_slot) >= OCFS2_SB(sb)->max_slots;
+}
+
 static bool ocfs2_valid_inode_mode(umode_t mode)
 {
 	return fs_umode_to_ftype(mode) != FT_UNKNOWN;
@@ -1603,8 +1610,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	if ((le32_to_cpu(di->i_flags) & OCFS2_ORPHANED_FL) &&
-	    le16_to_cpu(di->i_orphaned_slot) >= OCFS2_SB(sb)->max_slots) {
+	if (ocfs2_dinode_has_bad_orphaned_slot(sb, di)) {
 		rc = ocfs2_error(sb, "Invalid dinode %llu: orphaned slot %u\n",
 				 (unsigned long long)bh->b_blocknr,
 				 le16_to_cpu(di->i_orphaned_slot));
-- 
2.39.3

