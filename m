Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872199;
	b=B1FE4iGkOiUH4UT7E/CLSYYiE9lY5MHpwx2OkIxlPkag2FjjcjiAL1IciL5yZj1xz/BG
	 +3zHRrD0tZIg9+wbZqhqJxDR6YWl5DWX88KygkXwrxX1u/KZdpcAB4gAydMkx63U46Dph
	 /W7hw7/Iwn1khlppH/EsR/7djBNcyYfqFGg5So70emdZz7GoU91s6wpjAtrcgIAA9EvjR
	 08l2IQoQ6AXPgZ/X71A8WJCCede7waio+qlvjtWmjnM/Jz8cBuPYTuQ0zRl2emTpX+f8D
	 iek5+Xm1URKEoSMbOl4lhU+Mn6XaY8ZLyvn6nEfLEGs7M7cDry1BqXikRAa8wlnxIwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872199;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SX2iWgwwTTnfuBkVYLRjLx6wOTnegLABFMy8vXMq74M=;
	b=iVcLdKAhkJj+CQAfiOd4i2y3klhfBhKeZirEv0or17pGl5++H3ERqExLBmtcoEtVUEC5
	 1I0e1QG6bysa8GdQTgKOJ7uC7Lt2UJfRzfa71Oa6jfGHoBsFly0vQiDNqgaoHk+Af4q4C
	 MDqy+VcBVByKF6zXKaLDZ3eeHEP7G1T+mnzSaTNf8h2BoSxBe3xhNMfe/VzkAyTB6tyML
	 E+E2H763TJo8dMGq8kebJIw/8orwiUNUU+Fxri1blJrxxnpEezH53yeIW3wWxHWOnWUhq
	 KsXucPnU513QJGUbSS/ohLpQ63RuF/uEubXeZPOVnO6UiF9e/gGOPpCgzpgBDLyawUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=p8xzellJ;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2B7606EE94
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2B7606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=p8xzellJ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872195; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=SX2iWgwwTTnfuBkVYLRjLx6wOTnegLABFMy8vXMq74M=;
	b=p8xzellJ3Vln4GU5eh9uRy6v9tQ46VoLSGXhPCbSkx7h2oFnG42ubhPsLBuV0TE5jdEmbbL6m9HgC/yD2LZwCqLNddplfiAGqEJ5Ax8lm5s7QAXuEzi0tc4SP1D++tmLEHJPrHjM9xEmhLclXZZaYp/bhQevuNBnXkFepDkw+w0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R481e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8RZh4_1793872194;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8RZh4_1793872194 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:49:54 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 29/30] ocfs2: check dinode refcount location in online filecheck
Date: Thu,  5 Nov 2026 17:49:25 +0800
Message-Id: <20261105094926.3203416-30-joseph.qi@linux.alibaba.com>
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

Wire the OCFS2_HAS_REFCOUNT_FL without i_refcount_loc predicate into the
filecheck validator.  A reflink-capable inode with no refcount tree
location cannot be reflinked or have its refcount tree removed cleanly.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index e0fc68ff997a..0f7391c9f30b 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2185,6 +2185,14 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
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

