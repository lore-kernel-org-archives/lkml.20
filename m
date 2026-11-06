Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963710;
	b=pgt/CuQuWHXxFd64GBfrsC9xwGKyTE966CHgk7BpBBEOmqZQ6rd/JL0X5nUhP69H8uyF
	 W/G04aISGgVZgRzq+LMcn8c1zeBKYAizkY4bGn5+r8yUhhEBsqUXPgrXXFiaOS8lHiRIz
	 gDtUF4eCFXZGgPpbrTrTWbRUuCa85Em5gZRzscQdPdNoUR0Wz8j/IMMAjFXDtDerEAs7Y
	 7GAbTico0Q5kEr8iCUn6jQalE6c76CstViCa4cstNX+0IsCpJajVkHjUVB2dLWF3h8F6e
	 pWI8WbVgwbs9TCS2pRVBQMcXilhPcyEbiYlhQYcYgk5cqxd2JrLlRte0gTM2kM2XKEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963710;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RyTmqKAAkQSpBOmMf3RfK602p4rkc0GPWb4Y2ozi3eE=;
	b=Zlg7HqwGSmpYEGNz3oeC/qqMbTTwhrS9tDc9+oqOHXutXZb5vEXAiaaYKdVG80C37+Ht
	 clFBb+SuruK83/wgSHdkWr67PyIXs7oFoaz4T8aOgP5ieTI2covkg2MifUn9Ms4W4ojNN
	 l6mYHDRNQzWuqBIVQjoXBr5Uxf3zAok+h4GeJ5NScrQs9JWXT3IXuKuYXdLyyuSXL4TWo
	 ChNJFBAZjXxC2egmbyYliHOIavZ3A5wQhTFT8/dK7w70XGyFftT/0ZqVvJMzvAq/93235
	 hzZYkmA2dEkrbqgKbt4txVt9hkzgg0mFdX1TcxaDXqDwdFPNqYJTroqgwi61UobYP+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=u0GGJfmH;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C91E606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C91E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=u0GGJfmH
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963707; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=RyTmqKAAkQSpBOmMf3RfK602p4rkc0GPWb4Y2ozi3eE=;
	b=u0GGJfmHhiX2BUaFJGPxBf4mCBNljmC811EstNhANivMKWZV0RSJZoUzlW4gazIE1wTmleVDxkfTwJ8VjmOsJiBz1N1JUnMpEjtXbSdOt/nkbsBeCvZutc4DhULVFo0lQylYKbtt5B/j7I+RE1JHdX+uKgTqc2NcqaOWZCgZRMg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBSvOM_1793963706;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBSvOM_1793963706 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:06 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 08/31] ocfs2: abstract the dinode orphaned slot check
Date: Fri,  6 Nov 2026 19:14:35 +0800
Message-Id: <20261106111458.1467464-9-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261106111458.1467464-1-joseph.qi@linux.alibaba.com>
References: <20261106111458.1467464-1-joseph.qi@linux.alibaba.com>
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
index 3be98328925d..fd9613a95802 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -117,6 +117,13 @@ static bool ocfs2_dinode_has_bad_suballoc_bit(struct super_block *sb,
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
@@ -1614,8 +1621,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
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

