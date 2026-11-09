Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226940;
	b=ovZis8r7/2wfjXKlUbrArWhzjiP4TVbc5CHSqCptgHOx2S2C+TUUXG2oTisukObTqGKF
	 Bz3fJmApvIV3ZbGV7t+cfEhiMJvcaHu7jDZjFOKhhafuIqYd6XNE1OR93WAVYXvJHb0WL
	 vsHf5quIG1G31O6rThOh2FEMiZpgCiCV61zIZfgGJxuk+Az4tuhInqeg7mMyVfPKjya8n
	 PIQkpBJ8rj81iPYPtP78nHL+MC8xAUXzjI3obPcVtciCjPCVe0ksWvxiODGM9yVK5+n20
	 O72CRWAuh6Zdo/CFUCutLEPYGhJENNsOR0Y0tjPyFTaRZkp35mF45Qrnrs3BUbQGU2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226940;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E9LJzHLDFwQdiHqkguGnGxO9P/T/4XuiOFZo//+3fCo=;
	b=ard3wpKi3WxrqaDYQYqBlaZ26vHQ/g5SQz8LsEhCTRSld/xUhW0qfYDOq3kZypdCfc8X
	 3Es0p/+8/7EAarJ1QzGws73X30jqOvqrWuJ82UUA+ZUtexqDd221fEJfcbmbggt5z0DhO
	 BPaUZFFPetKZiQMQjXSTUseLasg/8sbJ8C33+f1SYSWBEZ8uwnOIJj6EXketxinmvEAmL
	 z1TpoSuspTV1GT7m/5LRR+YDev3fSJracSn/9PME5t0dn7jPE1PYv+uZohSB2Yb989kXn
	 EUwHdkAsRoYs349tjItVnO37DzRGTr7PAKRQXi+VHIYXqd3ItlSJzeSFoAIW/MF5QSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=luBUtwHe;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05056082BF7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C05056082BF7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=luBUtwHe
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794226936; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=E9LJzHLDFwQdiHqkguGnGxO9P/T/4XuiOFZo//+3fCo=;
	b=luBUtwHeVHHOsSCph57wEUGXWtaDuEZiTa4QykSj6v7HkMxu++8nLM6c+sD5eVJduFpwZtX2ZIs5Jc5QON6D8IWTzBSWfWNOeqJGHdwaAzi/hEApZFp19a21CKX162jOD1AFpTbGX/4vVpwlejyCeHD16WZea10bqmk/p0Dphd4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R371e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEOZNoW_1794226935;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEOZNoW_1794226935 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 20:22:16 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v3 31/31] ocfs2: check extent list dinodes in online filecheck
Date: Mon,  9 Nov 2026 20:21:21 +0800
Message-Id: <20261109122121.21473-32-joseph.qi@linux.alibaba.com>
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

Wire the extent list guard and its three sub-checks into the filecheck
validator: a zero l_count, an l_count beyond ocfs2_extent_recs_per_inode(),
and an l_next_free_rec beyond l_count.

This brings the filecheck validator to parity with
ocfs2_validate_inode_block() for every dinode check except the inline
xattr one.  ocfs2_validate_inode_xattr() calls ocfs2_error() through its
helpers in xattr.c, so sharing it would mean threading a reporting flag
down into that file; it is deliberately left out.

The l_next_free_rec predicate is already used by the repair path, which
fixes that field, so a repair of it now revalidates cleanly.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 6a7dff8a6a05..8e5f7a240381 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2204,6 +2204,37 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		goto bail;
 	}
 
+	if (ocfs2_dinode_has_extents(di)) {
+		struct ocfs2_extent_list *el = &di->id2.i_list;
+		u16 count = le16_to_cpu(el->l_count);
+		u16 next_free = le16_to_cpu(el->l_next_free_rec);
+
+		if (ocfs2_dinode_has_zero_extent_count(di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: extent list l_count is zero\n",
+			     (unsigned long long)bh->b_blocknr);
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
+
+		if (ocfs2_dinode_has_oversized_extent_count(sb, di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: extent list l_count %u exceeds max %u\n",
+			     (unsigned long long)bh->b_blocknr, count,
+			     ocfs2_extent_recs_per_inode(sb));
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
+
+		if (ocfs2_dinode_has_bad_extent_next_free(di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: extent list l_next_free_rec %u exceeds l_count %u\n",
+			     (unsigned long long)bh->b_blocknr, next_free, count);
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

