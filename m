Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872188;
	b=DewR1Fetg73gpQrh9F8eBHdJUnBgYMrO1XrTxTzgGSRzOLcZqKQtbEMKrRk1OnRXntYY
	 srZuuwtZ1vxGHusn5D4Uu4NzGblc/QY0/ELtjRHnvIhRBQ4b1LfyxiulhOVQb7UKiL0sw
	 9A6lhDo7Fy1o20Tdgbs3rNaSwcsMyVENLd7F5wiFzfHV+PmGAvVNJA0zYGT3TSVsq0qbv
	 I/mO7gDh70uaS717CD4DTNAsgoMpa7e8HxQT9sKB9e5WqygaywG0XNkPITsD9BGC8yoUe
	 iZ0KGltsZVEZ6qpfv/DxAVfocd4f+nfBZ6m8A+skDX/JMVmllXxrKRsNchGzULDQS5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872188;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NtkLsGvH5J9msPiK5onX7fisA7OOyCYlZih9oYWb7cM=;
	b=se/h/wAQQPtnwgK+GfIpOEpwNrMT/RnVPCqUa9A43YCOxi3xIorResNmua/7IsNmSJb2
	 A5xRNZRMyeCwFGgAhyWdIFm+Do5duoZMIje9XJS39wA/9YAKDpYqrnJCx6LfRPGtHwi4A
	 1njy8mo0VhDv/RXbMxFx/6OSRJACCEYve/5MZxQTKPuBoApS1XaVNyU8xahqtLOCZwO9S
	 uslBTE/E1nZNhQc2jsvE2vvHwf25xsrr9yKzH4a8ZU2Xq1E+sGOdO4QZ+3Zo+T9eObYRv
	 PPs76bg5yo89RAPlL/t43NBreLAuhTSFItNO2icKE6hby+1hiL8SHY/4HzgZUuQaBSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HzMOAkx+;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E776083626
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E776083626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=HzMOAkx+
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872180; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=NtkLsGvH5J9msPiK5onX7fisA7OOyCYlZih9oYWb7cM=;
	b=HzMOAkx+GauJhCAviO8eeBzUnK0UfycAmtdX59LU31M/BIwsB+ixCNTBbWXjEHKWe1WPShfPuOn9rsQbJl+z2ATr/vIrTjGk8LzvgVtmBxYAII2nK217Q5wwZN/uPGtHYPYFQ39hot58ZrF7CuJBQRlK2cDPYBZ8vXIfbweJTHc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8K72k_1793872179;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8K72k_1793872179 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:39 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 13/30] ocfs2: abstract the fast symlink NUL-termination check
Date: Thu,  5 Nov 2026 17:49:09 +0800
Message-Id: <20261105094926.3203416-14-joseph.qi@linux.alibaba.com>
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

Fold the strnlen() test into a predicate that bounds the read itself
against ocfs2_fast_symlink_chars(), which is exactly the space available
for id2.i_symlink in the inode block.

The open-coded version was only safe because the preceding i_size check
had already bailed: i_size comes from disk, so an unbounded strnlen() on
i_size + 1 bytes can run past the end of the buffer.  Keeping that
ordering dependency implicit in a helper would be fragile, especially
once the filecheck variant starts calling it, so the predicate returns
false for an oversized i_size and leaves that case to
ocfs2_dinode_has_oversized_fast_symlink().

At the existing call site the size check still runs first, so behaviour
is unchanged.

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 51bfa7643ebd..9cf2541b82ba 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -197,6 +197,25 @@ static bool ocfs2_dinode_has_oversized_fast_symlink(struct super_block *sb,
 	return le64_to_cpu(di->i_size) >= ocfs2_fast_symlink_chars(sb);
 }
 
+static bool ocfs2_dinode_has_unterminated_fast_symlink(struct super_block *sb,
+						       struct ocfs2_dinode *di)
+{
+	u64 i_size = le64_to_cpu(di->i_size);
+
+	/*
+	 * Bound the strnlen() here rather than relying on the caller having
+	 * rejected an oversized i_size first.  i_size comes from disk, and
+	 * ocfs2_fast_symlink_chars() is exactly the space available in the
+	 * inode block, so without this bound the read can run past it.
+	 * An oversized i_size is reported by
+	 * ocfs2_dinode_has_oversized_fast_symlink() instead.
+	 */
+	if (i_size >= ocfs2_fast_symlink_chars(sb))
+		return false;
+
+	return strnlen((char *)di->id2.i_symlink, i_size + 1) != i_size;
+}
+
 void ocfs2_set_inode_flags(struct inode *inode)
 {
 	unsigned int flags = OCFS2_I(inode)->ip_attr;
@@ -1801,7 +1820,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 			goto bail;
 		}
 
-		if (strnlen((char *)di->id2.i_symlink, i_size + 1) != i_size) {
+		if (ocfs2_dinode_has_unterminated_fast_symlink(sb, di)) {
 			rc = ocfs2_error(sb,
 					 "Invalid dinode #%llu: fast symlink is not NUL-terminated at i_size %llu\n",
 					 (unsigned long long)bh->b_blocknr,
-- 
2.39.3

