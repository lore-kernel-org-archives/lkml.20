Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226919;
	b=NjDb+i9owBYfkbvhA9rHNyb5Tco01nJtnRJiR3lwTSZ2aJ98loEdbLg3pl389dQ6nxoV
	 eXbP4+8+Xh7gMQp5WV1vmuCVMyXl3lxu8XIUNMu6VspODPM0Eo1oStJcOOKV3wLWjm4xs
	 ZTOyYf4nhc56PfDpbwrz/CWoMTzpgbY1ceV1vSBjXeOcbT5Nd368cx+bW5A2SfJWXmd8D
	 eJQAM1gSttjCyc6ABynoSSsQejFGoWfyNjcQ0RqkwBVVxfKTgxezHUZOCRXVpOybJcPZM
	 O2JPknREthEgaLEEzdnDl/Sn3OKuRkLXhHPFNi3Z8QITfn7EP3nsuOnxfnCeL1ofhCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226919;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wXb0GXyopzIAevJI4IHfeJICZevtzJ1G9faTYp+IM0M=;
	b=piym8Go3f77Ay/lXHSEmQnsGE9lkjAuF6fk9Y6PNR/pW70Uv6TBJRdsdxEX4qOThc5kv
	 TnI2uNg7VldmUKPbgMCQ+qW/qOiqBAlJHxpwzgnCGx0kZJosoo4XdO/19GPmxj4bG+ryN
	 OnfyfgQ2eVxrcgdu2lK9Fjzwf9Pi74Mw5VbhfJWC0eicoNuXr6jCEUBlf1F/Ef4REP1zz
	 8B1bC6hoocWrvrnRjtd/Ivo1oIf7il58v4XKTPxwsEPUBvNIBhKlUHL4DFOmhvmE74Lc8
	 xcL1Jo3I3JKw2viOEwm9TmZXp9jVThUyzKxjEeIMZiDkxGCR2M81mSZZot8AoQsOCWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CWATIg6g;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F321E606D803
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F321E606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CWATIg6g
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226917; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=wXb0GXyopzIAevJI4IHfeJICZevtzJ1G9faTYp+IM0M=;
	b=CWATIg6gwjqkbP+quO+vMGrUTdMqqrfpFkt3PpRvvwroH5Rc42boLpIRztVDTkEKSDabd5EzGhyxAgdlPNv/dnFdOc//52wOdhkXt6Caw37IZKOjZI5rWedIZUoECBRpvp+ANVxVxBZu3kTg9UXJY47Uy1jJelBwmR99PcGqFQ4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEOZNi4_1794226915;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEOZNi4_1794226915 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:21:56 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v3 09/31] ocfs2: abstract the dinode DIO orphaned slot check
Date: Mon,  9 Nov 2026 20:20:59 +0800
Message-Id: <20261109122121.21473-10-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261109122121.21473-1-joseph.qi@linux.alibaba.com>
References: <20261109122121.21473-1-joseph.qi@linux.alibaba.com>
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
index fd9613a95802..17d546a9245d 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -124,6 +124,13 @@ static bool ocfs2_dinode_has_bad_orphaned_slot(struct super_block *sb,
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
@@ -1628,8 +1635,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
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

