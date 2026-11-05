Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872193;
	b=kjaSynsZVl3KYu6iIuKFtSEXvKrbNQ5MPijiv+JOcgTIbf7/xh5CGt6AzHobLhgmAMay
	 N0COT4mR/FnErfr7mVfM2dwufWOl3Uw330UDIL6I/ffZaYYu6p9QSOI292bKK+2aC9O2B
	 XpVR+i4AEJGnikHOBXCwfjsL0wGGLpRm+7eyr/gL/0cGBddcaa+yKlBRvZPWn2QjANXSX
	 GyEddvjIu5gtOCsa72y8zjj7kVmOysRP6iGGEHk/9ega1p5S1l0oik5zZ78mEdkNuWfvD
	 m2f1+bea/hMmu9gEJJpG8ioVp5/IXeCZdROjS0+LzdYv7MWd02g05Z6bgYtq4flCz3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872193;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=byl5MxQXhfbd4TVh3cI6SsnxKUyD+oHLNtVrLi5gjAE=;
	b=Azv+T6srxnRuiYzSTaEWEVIC5stRtclxiY/kcmUaBej8WLtq8x3cYeEhjB2Ih+Ev2xPj
	 9jzUESRRIhKkTCjd7ghep+VVTJWumbcOBKYiOUg4+OXNsAVkQzVP4PyvAoapS62i6Ilpd
	 olRzVGtz4rmkk78q0K58oMfgqcNySD3cR6sU+31Qpn/mQt6OHcVmA4olGTezBAORdVr3+
	 Nx5VuF86Fi7wAt21PKJMFw8JNpwresOVF7UE1stvhqX6gpUED+8AIviOGg2c6dSp/C8vN
	 Dy64LugAtCg1HW+5SxJY9pR4PbkkQwe2nl8xYe7d8LTv+yH/hoTF1eE4qokBiqXR/Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ODilHX0J;
	arc=none smtp.remote-ip=115.124.30.101
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0335A606D83F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0335A606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ODilHX0J
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872190; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=byl5MxQXhfbd4TVh3cI6SsnxKUyD+oHLNtVrLi5gjAE=;
	b=ODilHX0J7abN5NhWYi85vjLY0L7ITa6KKDBPAHIVhf6zQewZQIfAnulvgV/6lF5x53MPUwYd6McVJfV+UXOLO+SZJabt0Re0B6a+kq/znNAh1cjrkV7D2EIgUPkRkY+YDtLx3+/3ax6+rWJ20ppvTTYK3SKsePPGWBHPTo31D3Y=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8K76e_1793872188;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8K76e_1793872188 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:49 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 23/30] ocfs2: check dinode suballoc slot in online filecheck
Date: Thu,  5 Nov 2026 17:49:19 +0800
Message-Id: <20261105094926.3203416-24-joseph.qi@linux.alibaba.com>
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

Wire both suballoc slot predicates into the filecheck validator.  An
OCFS2_INVALID_SLOT on a non-system inode and an out-of-range slot keep
their separate messages, so the log still distinguishes the two.

The range predicate excludes OCFS2_INVALID_SLOT, so system inodes
created by mkfs.ocfs2 from the global allocator are still accepted.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 07b9445bb538..7cde33f0f616 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2018,6 +2018,24 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
+	if (ocfs2_dinode_has_invalid_suballoc_slot(di)) {
+		mlog(ML_ERROR,
+		     "Filecheck: invalid dinode #%llu: suballoc slot %u for non-system inode\n",
+		     (unsigned long long)bh->b_blocknr,
+		     le16_to_cpu(di->i_suballoc_slot));
+		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+		goto bail;
+	}
+
+	if (ocfs2_dinode_has_out_of_range_suballoc_slot(sb, di)) {
+		mlog(ML_ERROR,
+		     "Filecheck: invalid dinode #%llu: suballoc slot %u\n",
+		     (unsigned long long)bh->b_blocknr,
+		     le16_to_cpu(di->i_suballoc_slot));
+		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+		goto bail;
+	}
+
 	if (!ocfs2_valid_inode_mode(le16_to_cpu(di->i_mode))) {
 		mlog(ML_ERROR,
 		     "Filecheck: invalid dinode #%llu: mode 0%o has unknown file type\n",
-- 
2.39.3

