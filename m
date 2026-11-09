Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226928;
	b=V9XXLpPHu+oXtz5MX1H/TMY88Kti/hN+PHbegJV2+0kGc1b2PgisF13CS4WJVN3ruHoH
	 ZGuX79WpO456FEt5xivANBd8IbMzmNaP6Brex+9F6PVIz+HWDBFm0m+HRaffBDYLnHqFH
	 GcKsiM8QN7b5RdVuraqy6jOIpJbVqRyn0QdNgZTc5C3gwduu+W768yNPIY6MsRxWr3PUX
	 VqWdAZexYowtObTbXAEw6HeUrfbKO95gbJ7vZYMJRY6uVQtlYol+Ke/86jnPKN+9fOGPK
	 BfFDHMjc7JwSmWFmAH1SCdfpyUUj0STtJ7/acMW66JtdRzj0xjpvvoPiXXHpuDBGTZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226928;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ht3jRqYuLjrDEVEoazEJ37O5hdHUFkQk2/v/rACxvps=;
	b=IXhZVcZuw6tJ/kUGK9xlgAQENRFo+GIExHS1GFRKK6Zc9q8zyKSubQbqjn2StLT+c3Hr
	 OLmJ1L3Wc39dQabCCsKqkIiXXzOSwnQ2Z3UIH0DELTHgH+EYHjXuv1AEuy6tfp7fBu1/b
	 ABHipOW8W4P9iNek/JLYpV5FOqIdzgB4A1hfsv62fawgv01cn1n6ALfGmUtDBYHmqwSdy
	 Hobc1sFgKYraI2ut1rCt5bFImQ+Wa74rgnT2YMphZXCA1LqgyM7UE31cQGzNxSX8XCDw6
	 nFRG0VmrfnNemxbCN3NtuivPgtPYdPWUb2VO7kIYtc1MxqZLJtNfW1uMj5ggbBWfOiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=YzT19rIi;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708D6606D82E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 708D6606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=YzT19rIi
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226920; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Ht3jRqYuLjrDEVEoazEJ37O5hdHUFkQk2/v/rACxvps=;
	b=YzT19rIiGQVNY/zR6Wl3FvwT+siiR6Ih6gyLZGN1HIhLu5GIS34u69wlej82q+Sy9M6xMvejggEGnYJoLq73p0uIL2zONDZ15hQnYqimbvWq9jHRVfgqNfMic3ilFjEqSr0PP+wPrfhs/Pp2rMFuMc7fFRCGbPQFasj5Rm7Xzkc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEOjdqC_1794226919;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEOjdqC_1794226919 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:21:59 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v3 13/31] ocfs2: abstract the fast symlink dinode guard and size check
Date: Mon,  9 Nov 2026 20:21:03 +0800
Message-Id: <20261109122121.21473-14-joseph.qi@linux.alibaba.com>
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

Introduce ocfs2_dinode_is_fast_symlink() for the S_ISLNK with no
allocated clusters test that selects the id2.i_symlink union arm, and
ocfs2_dinode_has_oversized_fast_symlink() for the i_size bound.

The guard is deliberately not shared with the similar test inside
ocfs2_dinode_has_extents(), which additionally requires a non-zero
i_size.  A zero-length, zero-cluster symlink currently falls through to
the extent list checks, and reusing one predicate for both would change
that.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 8e867f6f394a..bf27925dd5c8 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -192,6 +192,21 @@ static bool ocfs2_dinode_has_inline_size_over_count(struct ocfs2_dinode *di)
 	return le64_to_cpu(di->i_size) > le16_to_cpu(di->id2.i_data.id_count);
 }
 
+/*
+ * Unlike the similar test in ocfs2_dinode_has_extents(), this does not require
+ * a non-zero i_size: a zero-length fast symlink is still validated here.
+ */
+static bool ocfs2_dinode_is_fast_symlink(struct ocfs2_dinode *di)
+{
+	return S_ISLNK(le16_to_cpu(di->i_mode)) && !le32_to_cpu(di->i_clusters);
+}
+
+static bool ocfs2_dinode_has_oversized_fast_symlink(struct super_block *sb,
+						    struct ocfs2_dinode *di)
+{
+	return le64_to_cpu(di->i_size) >= ocfs2_fast_symlink_chars(sb);
+}
+
 void ocfs2_set_inode_flags(struct inode *inode)
 {
 	unsigned int flags = OCFS2_I(inode)->ip_attr;
@@ -1784,12 +1799,11 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		}
 	}
 
-	if (S_ISLNK(le16_to_cpu(di->i_mode)) &&
-	    !le32_to_cpu(di->i_clusters)) {
+	if (ocfs2_dinode_is_fast_symlink(di)) {
 		int max_inline = ocfs2_fast_symlink_chars(sb);
 		u64 i_size = le64_to_cpu(di->i_size);
 
-		if (i_size >= max_inline) {
+		if (ocfs2_dinode_has_oversized_fast_symlink(sb, di)) {
 			rc = ocfs2_error(sb,
 					 "Invalid dinode #%llu: fast symlink i_size %llu exceeds max %d\n",
 					 (unsigned long long)bh->b_blocknr,
-- 
2.39.3

