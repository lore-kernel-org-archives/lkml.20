Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963729;
	b=32sR30C17JR4KLbf8j0QgDSxZlyo5AtcMwK48GxblZ5FC3EZ1mMpH2P9gqaGfHrLNV9i
	 OPu+SRjE2tkG63QXDdT4vcGWm1VVQxm6Ky1zqycTMK73ACUljl4EGpPKCte9txYbeVDkz
	 9Au60VB43kjRa1lS8Q+i2lX2gc3RJtF7poVCTFq6EfzNFX+TefjWmoMNSr0qgQ1o6sAW6
	 GNe0Gs5+eeDyuIZ/36l5nrmJMRTwOzY4XScVRt/8SX3vdtXO5+CvIp3pFqXt8gpahRNlD
	 +Ihu1ZODmJiNJA4dGSVNqTCsIwn+4VZ6uj15d4iOZ99UefkFBEzPJO+fapzV+6UZmRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963729;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X8/tG7p3Z/1CMBGJfdq7rhmdOPizUsyvuQ5IiSE2iUQ=;
	b=MCv7qiv+IvvUWJncB8akqs0mNk5lwd4JFOXckI02qjE07+o85tS5aJQ8DQ06nSaq1j6y
	 dzUg683zUNnoyS+NaXmrgUhRNP5MBRWXnR/ZoFMcRcd+Ly/BOvZq2Y2WqkqEp2e8hj6AD
	 LFMwujpj8WZo1ULQLZKUo8SAjTBZ5QjM0K+vomNp/3teRHmpFJ1nfvYWLn0Ueg2kOKvxy
	 28aaqj6peAJrz6VG/zfs9NeMa2K1MHThPmRv0uYw4/8ixSx9NAQjF0dGD8qcmsIS+JOm+
	 8qg5aQl2F4NJwd1nFLTf0qMTbUSGdgD+sfci60iutFrixEgju0JqOoFKIDmEtuJ7XOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="k85i/bx9";
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DBD60A263E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55DBD60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=k85i/bx9
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963725; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=X8/tG7p3Z/1CMBGJfdq7rhmdOPizUsyvuQ5IiSE2iUQ=;
	b=k85i/bx9Nvh1K6a2exQTqLqnN/Cl1c3bree+eYm/9uAFmSp7l5yhcY43m4Cm2su7cFbr+HLKhb/2jap9jeeusTT3OH1MA8Iz2oaUBsvuKwrudLkqXhmGUvnqmSVbCKd00mgpGe0pKzUOlctleoOOsJFyGIQmffwqENTw/amySXg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBa-93_1793963724;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBa-93_1793963724 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:25 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 28/31] ocfs2: check fast symlink dinodes in online filecheck
Date: Fri,  6 Nov 2026 19:14:55 +0800
Message-Id: <20261106111458.1467464-29-joseph.qi@linux.alibaba.com>
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

Wire the fast symlink guard and its two sub-checks into the filecheck
validator: an i_size beyond the space available for id2.i_symlink, and a
target that is not NUL-terminated at i_size.

ocfs2_dinode_has_unterminated_fast_symlink() bounds its own strnlen()
against ocfs2_fast_symlink_chars(), so this caller does not have to rely
on the size check having run first to stay inside the inode block.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 2ded2ee9d32c..1679ed7d09db 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2141,6 +2141,30 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		}
 	}
 
+	if (ocfs2_dinode_is_fast_symlink(di)) {
+		int max_inline = ocfs2_fast_symlink_chars(sb);
+		u64 i_size = le64_to_cpu(di->i_size);
+
+		if (ocfs2_dinode_has_oversized_fast_symlink(sb, di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: fast symlink i_size %llu exceeds max %d\n",
+			     (unsigned long long)bh->b_blocknr,
+			     (unsigned long long)i_size,
+			     max_inline - 1);
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
+
+		if (ocfs2_dinode_has_unterminated_fast_symlink(sb, di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: fast symlink is not NUL-terminated at i_size %llu\n",
+			     (unsigned long long)bh->b_blocknr,
+			     (unsigned long long)i_size);
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
+	}
+
 bail:
 	return rc;
 }
-- 
2.39.3

