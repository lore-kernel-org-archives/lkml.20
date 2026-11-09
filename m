Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226917;
	b=MJdQr2T5qC6Z5WuQwTv3J8DjFfesJoqj69h5NZwyBXlJzFbCgsP35zUQ/m/C8edgFXaD
	 ay0C4z7IdNkaU200vTAIWvOXHM9C6bSTXAYAGDFH7tm64K/J2nUhov9mjRA3vM6yaiBbR
	 rWwRFFOcim8JazE5xmIuf0NUb3ZXWtQU+QQNxWE3s2Q07Q/s2H/+m5mo8L3bpYAkUYPMT
	 dlw2sEpId/XUXO/ULKdqttwMOEQWPm05Wp31MS83ebtfAqnFuTzFBhD7bzGnKd8T5o/yC
	 WuNwKLHX4ZHYTbfN3RVn1BNhXCE4jMF+h2KJnHulI8PFaFdY8sbZAfrxByaWG1XztHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226917;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p4vwbYYLQrtjR0iELFGwWmSzIE6lZ4pD21prPC9EqQg=;
	b=ixLQMHosB6BgwVk/5kyvdB283jazXRLX48J7oXBnB/KviPHSbauS/VHocLlADh4sxN5y
	 kQVQy5vnlzcmkNvrrhb9Tw73tx9U6b49CNOWIK+Nx6jeqG9K43XNmdvQgbqmHXgaoHrrX
	 MlHU+K4473PqVwoRkjVQdRB3ucnF1yaH3eEcOnVwk0S9DqEWe0zkqzdCHdDIKl9zWbjOP
	 aSWz3m+9IFxIlXqsuOIvuF1nk5hhXYaaz2xPrtBVbZ2BhWMq1zaGMJ2NLSGWgmBnAT/0F
	 E9vBCGMcvwNfl0RGFgvQ0m3tHvAhbojbFY5U2FEqSP/Hn/duJEz06suCaM5zSbz3Mhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tGfFOSyg;
	arc=none smtp.remote-ip=115.124.30.100
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473A606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6473A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tGfFOSyg
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226908; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=p4vwbYYLQrtjR0iELFGwWmSzIE6lZ4pD21prPC9EqQg=;
	b=tGfFOSygVuQN+iCewyY8KS7f0ZyP7p56+Iiyez2AHPwxWY0oO6XusQjlE6W5L8U24WZ2urT6nk9P1nzrPu3Wt79JGA/tQd2TJo5yaZOvsPU44FW5GQdu+xuhDPBCSJoALH4LmIKrt9TgyjUAoriBwNYAC0kgjl+DbeFIId4hXG4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEOjdmz_1794226907;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEOjdmz_1794226907 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:21:47 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v3 02/31] ocfs2: abstract the zero nlink or mode dinode check
Date: Mon,  9 Nov 2026 20:20:52 +0800
Message-Id: <20261109122121.21473-3-joseph.qi@linux.alibaba.com>
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

ocfs2_validate_inode_block() open-codes the test for a dinode that has
no links or no mode.  Fold the condition into a predicate so it reads
like the neighbouring ocfs2_dinode_has_*() helpers, and so the filecheck
variant can share it.

Reuse ocfs2_read_links_count() rather than testing i_links_count and
i_links_count_hi separately.  OCFS2_LINKS_HI_SHIFT is 16 and both fields
are 16 bits wide, so the combined count is zero exactly when both raw
fields are zero.

The OCFS2_ORPHANED_FL carve-out moves into the predicate along with the
rest of the condition, in the same early-return style as
ocfs2_dinode_has_size_without_clusters().

The return code and the log message stay at the call site: filecheck
reports the same conditions with a different code and must not call
ocfs2_error().

No functional change intended.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 371857673712..209066321932 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -67,6 +67,21 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 static int ocfs2_filecheck_repair_inode_block(struct super_block *sb,
 						      struct buffer_head *bh);
 
+static bool ocfs2_dinode_has_zero_nlink_or_mode(struct ocfs2_dinode *di)
+{
+	/*
+	 * An open-unlinked inode legitimately has a zero link count on disk:
+	 * ocfs2_unlink() drops the last link and ocfs2_orphan_add() sets
+	 * OCFS2_ORPHANED_FL, while OCFS2_VALID_FL is only cleared later by
+	 * ocfs2_remove_inode().  DIO orphans keep their link count, so they
+	 * need no exemption here.
+	 */
+	if (le32_to_cpu(di->i_flags) & OCFS2_ORPHANED_FL)
+		return false;
+
+	return !ocfs2_read_links_count(di) || !di->i_mode;
+}
+
 static bool ocfs2_valid_inode_mode(umode_t mode)
 {
 	return fs_umode_to_ftype(mode) != FT_UNKNOWN;
@@ -1482,15 +1497,7 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
-	/*
-	 * An open-unlinked inode legitimately has a zero link count on disk:
-	 * ocfs2_unlink() drops the last link and ocfs2_orphan_add() sets
-	 * OCFS2_ORPHANED_FL, while OCFS2_VALID_FL is only cleared later by
-	 * ocfs2_remove_inode().  DIO orphans keep their link count, so they
-	 * need no exemption here.
-	 */
-	if (!(le32_to_cpu(di->i_flags) & OCFS2_ORPHANED_FL) &&
-	    ((!di->i_links_count && !di->i_links_count_hi) || !di->i_mode)) {
+	if (ocfs2_dinode_has_zero_nlink_or_mode(di)) {
 		mlog(ML_ERROR, "Invalid dinode #%llu: "
 			"Corrupt state (nlink = %u or mode = %u) detected!\n",
 		        (unsigned long long)bh->b_blocknr,
-- 
2.39.3

