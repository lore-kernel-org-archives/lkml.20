Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872197;
	b=tsdmL8Cl4MLG7P8S+YfwXrn/wUBcWJuCd7a+ypeLoU/l3YVEQ0ED/bOmQ+dQtC+GL/2A
	 EuFXsmZBnpI9DR4cJkUlebJkJdhDhB84wmiFOHAkx43qRaNbra9HSgUUPUwyGtBxOtgSd
	 cT/1S9pgERJZ8XDQK9cyEh4ntUkpDaEYX+zdWbYJNtwTHq6tEW2mlFY6SK+VwqCQzY8nb
	 5XUYyz7RHdlGqOq7Vl6rQWzO9ZXjnFpOvIDM7jv+FyGRXkBfRwzWIsbwMVUNJTkJK3ZW9
	 OWYOLHVME+/cn5OXlMdKPMf+Wt1scRvU/IIMerg8NcA5EjwkFR55Csu2Zlsk/fAZ0vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872197;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SplViluHtNabdYi7GNkh4r4QWU5PmI0UdQhp7JsYbZI=;
	b=BLqBs/D3oZHCKFf2aRWov657aY2WOSbSTTQL4h0e3TEgOGXE6xDF59X/HP+SlYmbbLFW
	 sff9g30GlfLhw9sxtxkm7gFY0b2d+mvDFndG2OFOltd+28pZpPk1k1wV241AFBetW7njJ
	 S7gTce99tmcCiw+8siCLl+24xbiZsE+tvCGrk1VSUpoBaPm3BF+ZycvjiwF8hUccNbbF0
	 reDYG+3z7vtzKnbYx/V21tMIZdb4Mytd+NyNSxJ8TUlJ9WNVlLwOh00QwgsV3FzeIV6eA
	 bEivI2rrXwWpBfQbdsPFsD32imXkKHPFEuxSUC8BxGOg+MLSyGE/FdlgF6/jn6QWkXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=RU+nghgp;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98E060A2608
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B98E060A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=RU+nghgp
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872189; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=SplViluHtNabdYi7GNkh4r4QWU5PmI0UdQhp7JsYbZI=;
	b=RU+nghgp7QO66bboXqg8RVU1fENIxnqvpyR34tDGnv/5+Ph3DR2IW1mYXRWjbZ2ZT57V9aNd6FHHkSf8rZK3Hr8hhpYLmO3YNPmctnQD5SfIAL58hOepoqxi5qKVuB2A4G2G6cLhQk2lcBxZbrBgl1BclnMZRhnIhazbosvNmoA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8K764_1793872187;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8K764_1793872187 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:48 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 22/30] ocfs2: check dinode nlink and mode in online filecheck
Date: Thu,  5 Nov 2026 17:49:18 +0800
Message-Id: <20261105094926.3203416-23-joseph.qi@linux.alibaba.com>
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

The filecheck validator shares most of its conditions with
ocfs2_validate_inode_block(), but skips the zero nlink or mode check.
Wire it in using the predicate the two now share.

Filecheck reports OCFS2_FILECHECK_ERR_INVALIDINO and logs with the
Filecheck prefix rather than calling ocfs2_error(), which would escalate
to ocfs2_handle_error() and could force the filesystem read-only while
an administrator is only asking for a diagnosis.

The check is placed after the ecc and signature gate so that the
existing coupling is preserved: a bad signature still overrides a
checksum failure with INVALIDINO, and every later check still runs only
on an ecc-clean block.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index cfa545981310..07b9445bb538 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2009,6 +2009,15 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
+	if (ocfs2_dinode_has_zero_nlink_or_mode(di)) {
+		mlog(ML_ERROR,
+		     "Filecheck: invalid dinode #%llu: nlink = %u or mode = %u\n",
+		     (unsigned long long)bh->b_blocknr,
+		     ocfs2_read_links_count(di), le16_to_cpu(di->i_mode));
+		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+		goto bail;
+	}
+
 	if (!ocfs2_valid_inode_mode(le16_to_cpu(di->i_mode))) {
 		mlog(ML_ERROR,
 		     "Filecheck: invalid dinode #%llu: mode 0%o has unknown file type\n",
-- 
2.39.3

