Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963725;
	b=yk6QdMW3WbofoubITDNQqRxMGFsO8wzLLEdfFYGsIjpUAEZla3UQRaBYbM4gkSwTvLE8
	 pPEk4nzGxveRHQLuFFXfWnZdPdPHtVW2uducrflQmhvQqKgigDUX5fAozOhvrIR6Z6ZVC
	 8nAgVlbzT01BqfoLrjonzHS4a+LaVoYdZuWV9WI8IgfD4cTMlNPO71zagseWLe60xhZ4l
	 3tJEbT2TKdlVf5BVNLTeOuuUVePRX0WPvhQBIcZ9f5AKaqoX6kcRX/oI3GmWp2wuAtOLK
	 BWkn/t9NFxiprR6iRYo2cNTX0rp6Ip3sWZMMKSJbSXK7Iidachn8f7eYKyBPsSZOVnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963725;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IOZOztXDAP1Ejv2NcsWQhL1ChUXSN/2p7n5iTj6fz2Q=;
	b=Uhr0xB4OjXWTBjDG0fks6sH2vXg0fUxnQcX9BLg2b6dFjPQX8RsoaNgIj3Jgu5o8smGQ
	 6KLjd5raAJ30jU9zwa3JeaT3b655H6RT5s8HPAjaZbiwNakqdrYktxperCFNTqdGv8TEo
	 3nKE1nppwKJs9P7DQwZOeinQvZY0LXCbJdXergwgELNcutsKS/mpJsgEwC3f1YMOO8/vE
	 PY70C6C3Ou1I8F69Tfv/+/IDVsYjU2T/eapghRi9EnUUy/jlg3iajrP/DNklfsJD2rCD7
	 leWhnEmDMVmppGqVzX35vHJl+h55MPH3Wff+yHIi38UmYH22vXTKF3S1DB1gejYrSRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=QpImdiXa;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBFC60A263E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBFC60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=QpImdiXa
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963721; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=IOZOztXDAP1Ejv2NcsWQhL1ChUXSN/2p7n5iTj6fz2Q=;
	b=QpImdiXa1TzCmgLeJtPffOSQNWCU35G+jNkPmxmjNB1lwOce4WyIIq8f09lpFqxFb/3cJnL3oNVSb2JH16xp6G6H4oLdEX+KdtYWj5PTrlQGK/WdqIWAhC1MG7DWC14Q8eSpCyU0tSHfUV8mXBCHFzvr7HGFASC2XOPyTLF/SsE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R371e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBa-82_1793963720;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBa-82_1793963720 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:20 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 23/31] ocfs2: check dinode nlink and mode in online filecheck
Date: Fri,  6 Nov 2026 19:14:50 +0800
Message-Id: <20261106111458.1467464-24-joseph.qi@linux.alibaba.com>
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
index 47b539edb764..d32be79151a8 100644
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

