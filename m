Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226937;
	b=Bu9zDxulZpb2vHI4faqQgDH34zgtBJaghLFWXKqc8Oe77C9MwCXfdB3ETJcjysh/oRYT
	 PUR4NGthPQkA9KGavNujzjXjzomTM2xmXYdWe7beEc1KVTLJFRUCk0Hwx81Gq2OASGMDy
	 A2eTmdaC13XIawMtujokQDMkTPjpa2FDqAYCnUHkfEUomvErys0wSUUDi40b0PBXAmkM9
	 A/ctcd2Zw8YmE5t+JB6V2XwhPmcNAA+ppYp1Qw96s/5bvpy5RI1MSLT+ZScavxLXNyg7/
	 D+M1amJmARWuN7urStfnVSeYZs1I0Tqg05PEi5c/KDI8zt8uncYj5mh4ZpfubnZvv3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226937;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gCw0QLDVy6qOvZHnnCGs9bwGAYTtGDNXvuId7QF2hlM=;
	b=RSRZYXSybj4Ljnyw72Ug8raq1SFF9tEjoPACsntsDgT9H/I9kZyN57VKLl8FE+PWJFG+
	 wXhKUDxHg2vzT/3b0iA1Ah12PaEi7B1QUo3EJmEjAjsQ2cniPykqPvqTB303MtR1ALmy6
	 WBD3ucV2S6JrAkp2LUU96puWdEi7iZXPmbx/QELVxH+wBA0GTsY8RIXgS7KMFm1oQQpSK
	 tzgeXqE0lJmA/T80GrhSIzH5zBc/UCIkydKpqbeKhM2+PBJNUneii5UAClb2tlCCcCJSw
	 Oabxn8T8qBvmr96Y6CwYatfHz7jqIlrfKN+588tIVB8y+9zxG7ODLq4qIIyGZ+/stdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=j3ubuMp5;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C206083616
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C206083616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=j3ubuMp5
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226930; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=gCw0QLDVy6qOvZHnnCGs9bwGAYTtGDNXvuId7QF2hlM=;
	b=j3ubuMp5tm66lBQK8YdTAI7RWfXqKPJR/MM61PnQKLNi37YWVTf1BxKGiyAHKmkDsUyoLSjTJe+QV6JK46RBAu8wRMB6bvjIJA1JEKGrhHtV+sJJ0HunYqgChEXJBG3cvtJST8hVBx3XwVhm9j9FPQjoWrABI0GTmGyI3n1Y9gQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R971e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEP8avB_1794226928;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEP8avB_1794226928 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:22:09 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v3 23/31] ocfs2: check dinode nlink and mode in online filecheck
Date: Mon,  9 Nov 2026 20:21:13 +0800
Message-Id: <20261109122121.21473-24-joseph.qi@linux.alibaba.com>
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
index ad40cd6baaa0..6d2fb46e6c38 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2020,6 +2020,15 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
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

