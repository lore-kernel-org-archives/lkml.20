Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963712;
	b=PDP61jNGr3BYPrFaD6mKwMv4nze+rOl8bmw2TDxfof4UViBqS9mMk+JZZwdC80/cO6oG
	 orI6i8+CSdn0x0FCrgsE3zRBeKlm0za0+QJFxK2/y+r+lIyFnGN/V8pypymBREryg6/xd
	 MZqi5MzHVud14jRFBR0HkbD89STaWjSjaIdiAJDT9gjZvvE52ooXoeZF1nsMN7xPCqpvY
	 QoM40u05KoDT5IHA9ud1JtHe0/sV0I5Aj1iIJREvMOM9N6E/nxi+TrWhSqR2WpN3yU/t+
	 ZQoEg+EYAgTBBsAyLdULfkF9YQA7+qyr0WiuGvGX9g3q9+KXjmgGcyFlDtXVNDuYt/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963712;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fMu03X4wbz04Z9kIe0M1Zt3sPWaYbThV3APfzRBOM2g=;
	b=x0/9Hhl1h7au+B9Z1R3ppSmui6iOZcBhyA2ZSCWP/w4q415qyNVPGXxv+qgEomezvmdk
	 jxyzzUNrzDMQ/y0h+aMrLC4INS0/y3KMpepLutSfU4FjImmgqbKkgWugm1WqdPfTExl1Y
	 NJQnANjvtAu5T7hy5Yh4mRhCebymE2ye2icBGlTdNUEgccelsc5N0mBFryn5+drsj3yyF
	 IlKOcuvt+nINsVJpvWPCDgqNP2/Z7Pop1pb3KhexUPOlhVjvV8KYwi8iXgMovmfYWRaXl
	 jasRxtoqLcbNGrWZo3Wl7420eliwspNykKsa3XyTy4RBj3OEm8/78+bDm0b2ki+RPXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=gJLomZnq;
	arc=none smtp.remote-ip=115.124.30.101
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BEE606D81A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9BEE606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=gJLomZnq
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963709; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=fMu03X4wbz04Z9kIe0M1Zt3sPWaYbThV3APfzRBOM2g=;
	b=gJLomZnqozeX7eZ/aiD+2TYhydpKaY/Vz+R86TSal0YC/F5s68k0iczAmwzF3SDQ+u6+7l+rX/9RJ6GBgm07jrcYTWMKIEBmlAhiTShrCWGJ5xlEYOoeuEHKVRXI4enGCMtIivrZKhwgsQ5GZRlVea32SNAg6MhH7tlpzpOHUGc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBSvPH_1793963708;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBSvPH_1793963708 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:09 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 11/31] ocfs2: abstract the inline data id_count bound check
Date: Fri,  6 Nov 2026 19:14:38 +0800
Message-Id: <20261106111458.1467464-12-joseph.qi@linux.alibaba.com>
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

Fold the id_count against ocfs2_max_inline_data_with_xattr() test into a
predicate.

The comparison stays signed.  ocfs2_max_inline_data_with_xattr() returns
int and subtracts the unvalidated on-disk i_xattr_inline_size from the
space available in the inode block, so it can go negative on small block
sizes.  Caching it in an unsigned local would turn a negative maximum
into a huge bound and silently accept the oversized id_count.  The
message keeps its %d for the same reason.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 2aac1918562a..259f44661f37 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -174,6 +174,19 @@ static bool ocfs2_dinode_has_inline_clusters(struct ocfs2_dinode *di)
 	return le32_to_cpu(di->i_clusters) != 0;
 }
 
+static bool ocfs2_dinode_has_oversized_inline_data(struct super_block *sb,
+						   struct ocfs2_dinode *di)
+{
+	/*
+	 * The maximum is a signed int and can go negative, because
+	 * i_xattr_inline_size is itself unvalidated.  Keep the comparison
+	 * signed: an unsigned bound would turn a negative maximum into a
+	 * huge one and let the oversized id_count through.
+	 */
+	return le16_to_cpu(di->id2.i_data.id_count) >
+		ocfs2_max_inline_data_with_xattr(sb, di);
+}
+
 void ocfs2_set_inode_flags(struct inode *inode)
 {
 	unsigned int flags = OCFS2_I(inode)->ip_attr;
@@ -1747,8 +1760,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 			goto bail;
 		}
 
-		if (le16_to_cpu(data->id_count) >
-		    ocfs2_max_inline_data_with_xattr(sb, di)) {
+		if (ocfs2_dinode_has_oversized_inline_data(sb, di)) {
 			rc = ocfs2_error(sb,
 					 "Invalid dinode #%llu: inline data id_count %u exceeds max %d\n",
 					 (unsigned long long)bh->b_blocknr,
-- 
2.39.3

