Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963731;
	b=dKBvpQCaGpYXWWoN7jpfZqRUM6KZ+n5t5P23HPcTowAkTCszVldajz+4xjqGB60QtTKO
	 BKMpHC01cdgR0AZdCFsb5B0EaV3MXO6TAdUU4H7DU2Kz/p2sN6R5ah9OQrhNcx/d9JyvB
	 upIJnC5T7xaRUjFkSjiiKhVCkBFJGHYVD4pQ1SuIodeeFwy1Khdcx1CX0hsNomTl5D7jJ
	 8jasTZBBS+uxa5j4NJOWQHYpZiSZ7oC3+rL8FIduGVqt2xcx/IJIQcsoJeUkwtBunj9qj
	 fOO15VKnkB6EpN8yWVTI3mHv90HhsvOqT12GRlW6OkDJBUdy4emS838XsXKwOSbhevA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963731;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YjpKhsFmr10PRaUzUKmTqf2dGFwnG8y5LxgJ0tEgPkA=;
	b=STlPKllVTNP7mTwe65PikF01D+H9ky566OMRA2lNnNA4BvNttElr1pkwNSFz/wemWuBJ
	 OBSbBmZ8I83JX3fEEyCHkK62PMaFeVwXpKvhDNYUsvAIdCtkQbPmVGcgQ++Yx4SsKfaJK
	 CQ2RqcHxu1qLlUupgJkAXuIgc7Sm+0KfNEaIXk4aKMdpARccT1v0rs3Vqp21TR4W05cYr
	 20/e5EVf5ygkwCJ2U5gCh8H4g6IYjRaa9LQx8pZJufT/dMtcu/M0Lg5y17xMJXf+Im+iD
	 BRIxmlwOcuLZfwy7L/i4SlALt9NHco/xLfp9oGZYlgfmdRskHMpeB+8hRdI40yhArKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=a6tU8cvv;
	arc=none smtp.remote-ip=115.124.30.100
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A16606D80E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A16606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=a6tU8cvv
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963727; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=YjpKhsFmr10PRaUzUKmTqf2dGFwnG8y5LxgJ0tEgPkA=;
	b=a6tU8cvvgRnN9UbQxZUWWgwsOkspI8z4ldSxAHg9XHCghQjTxxUu/mdE4dMTovVFi2LvEyqME4JNP2LM2xFWtcLWktpGL5MAK8ypiSkzVmlcVfqBoIzQ0mF2HhwX5i98R0qbBxgQccatkGkPKa5MkZpOzsTuCAhrA5fgc6oH+f8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBVv0m_1793963726;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBVv0m_1793963726 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:15:26 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 30/31] ocfs2: check dinode refcount location in online filecheck
Date: Fri,  6 Nov 2026 19:14:57 +0800
Message-Id: <20261106111458.1467464-31-joseph.qi@linux.alibaba.com>
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

Wire the OCFS2_HAS_REFCOUNT_FL without i_refcount_loc predicate into the
filecheck validator.  A reflink-capable inode with no refcount tree
location cannot be reflinked or have its refcount tree removed cleanly.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 6865f0000e6f..ff46daf02509 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2196,6 +2196,14 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		}
 	}
 
+	if (ocfs2_dinode_has_refcount_without_loc(di)) {
+		mlog(ML_ERROR,
+		     "Filecheck: inode #%llu has refcount flag but no i_refcount_loc\n",
+		     (unsigned long long)bh->b_blocknr);
+		rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+		goto bail;
+	}
+
 bail:
 	return rc;
 }
-- 
2.39.3

