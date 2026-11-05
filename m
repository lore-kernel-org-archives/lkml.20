Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872183;
	b=NVTk8WeFuarI+Aezt9aaO00WUok/9FvRap3hDG2oXGa8mGqg0jl7Hb9Teo/2dy05NDbj
	 i3LfpwXrBRtx3c2d59zLkQ0XhxsN5coprPMqABT3MK+0oeYF4bZHVTYe/6Kmebr1YDnik
	 DT0RyekxpWzyPbsKIWQ7iw6zZJ2X2Gm/I6CKx4fZkt/wENHS5CXKfUsyJIuwhICIQa1f/
	 sfyQu8eg9O36rFyMrJ6vXAULKD+THGtvI9enZijrfBF3Y5sPPnlcFrWYp4ZLOJ2AZUtHK
	 MLqKQCbkIKnzJrXxK5FYEeajhswF+jIEGvDNjP7883r50WDgeuTqRsd4U4S1e7ar5gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872183;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uvVbT6PHtSVDy9E8Fo5PwBodk7qqogHUqDP+SooBGF0=;
	b=BKccChuHq2BQOj2oecFJuAkh2OSY2gWEqHu7JL/p1cdT/u7UDiml0HL0WDB+guj65hBt
	 taPcgY/Ina4yxwF057YwuRQLqDXtFJrQ/q9dWtFxy0nftf6Xl88d0RaBtkzbqmBLy5Qr8
	 OYsVVd0Dvh8WgnBuZ2i3UQRyHNKyS3ha36GooHeawrvJIvTbm8DFDTTVlCiblyjyDCiCv
	 IzacAfwF0PYmeHl2blvgo09Y/VykDyoZk/2XO0bn7p+wYUVSY+9blcRynIT87SuvLtybb
	 9l2PBy01tB0F+40sB5dPNQ1t54na760JEjB0nYJfB47ddI8utYTBp/8evHpvg5T5zFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iLVfDq9v;
	arc=none smtp.remote-ip=115.124.30.131
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9EE606D80F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C9EE606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iLVfDq9v
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872179; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=uvVbT6PHtSVDy9E8Fo5PwBodk7qqogHUqDP+SooBGF0=;
	b=iLVfDq9vTAMnBBsCWf742WvMV3cK7rYpYE/uzp7wJ+fgId4PoUEE27uqOh9UWpz84bv/lAdhQhH4z2ECfsrF1DYDLo0uiYxudi9NokfUQqcDLM1VSKJMJek5Tv16h2uzooA8sM5XnfONNuN4uuvCsWw6JM1tQqrTwIKGUeynauA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8RZam_1793872178;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8RZam_1793872178 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:38 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 12/30] ocfs2: abstract the fast symlink dinode guard and size check
Date: Thu,  5 Nov 2026 17:49:08 +0800
Message-Id: <20261105094926.3203416-13-joseph.qi@linux.alibaba.com>
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
index db2a67543c7d..51bfa7643ebd 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -182,6 +182,21 @@ static bool ocfs2_dinode_has_inline_size_over_count(struct ocfs2_dinode *di)
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
@@ -1773,12 +1788,11 @@ int ocfs2_validate_inode_block(struct super_block *sb,
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

