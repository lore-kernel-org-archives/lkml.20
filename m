Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963730;
	b=Lg99IJJQKXHqy/3AjlQYk6dAZw2rjAHY2yYD2qcXjpb6frNatp0Zv2rghzCR82IXR3w5
	 O250J1pm0QmB7fw1JpWFoiPRS41XeU2uwdLUS2uqf90yEULDC2gg5BwjO3OdQXkF/esp5
	 IPLqNoWeT0cneURnbifgbZN4siJfFfR4h2ybPH99UsAc/kv96NoTDG1K+E0FTzfdaAQLn
	 8Os1pqgcJIFNyZ5bm0pdME2zMGa/nGNXdw2RvFVtvlxmfEWwk6rxDLg08VdGgT7DoHBr/
	 Stc/0d0uXFII6Er/QlM1OTk5mliMHzmOS2wyH3dtgTFYxbR1CvLlEYxCN+kNGvGHuAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963730;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DpFlSVnuERt0YogMMyzec7HbVfOuxNV18QsDvV9po5w=;
	b=fvEpjy5c9Ao9hbGPDX4pJ3r6S9WlDFfH7rQm2oOThmrXiv77YmmcsW68jFYi/GdEcCXa
	 JYB4ZSEcQQ4aTR4JnpSkiX5TKb4O4CByzBSsRK9jV0zFggQd9/IKegPMIwDqXQYzmR85e
	 sycxhVSOh4Qz/rG+l5RG1tgVbMpTyhR9uFl+pQJtC0Jap4hK40OGeARYCoS2f/hQwN9ZU
	 +4XfIYT8NKmCz4IxMxYvj0hKATf2GQ03QjmJLjsbdCxvPUL5KP5njgrsiVgdWmDPzZ7Zb
	 YOeNUj39ueXFWFcah2/EahFDS9uPm04MQkHM0MQTqZYHo5An9pMobpg+GYZw7W0ckOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=nA4iVs4J;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBEA60A6F6E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EBEA60A6F6E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=nA4iVs4J
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963726; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=DpFlSVnuERt0YogMMyzec7HbVfOuxNV18QsDvV9po5w=;
	b=nA4iVs4JCumksTZjsVhM4b63S6jF5+FHKDtD78EUKDBsi4YMcuRyO7vSuBqmD6V97JEJfv5FVTQVIynqHKCl3drow9XIbADJQSswgQ+iivffBZOaZGBO9T60wrBYhkjSooAVScTmM24SkT/46LIHJdyFAYQzm+E90cU7Z9o8fDE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBVv0O_1793963725;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBVv0O_1793963725 cluster:ay36)
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
Subject: [PATCH v2 29/31] ocfs2: check chain list dinodes in online filecheck
Date: Fri,  6 Nov 2026 19:14:56 +0800
Message-Id: <20261106111458.1467464-30-joseph.qi@linux.alibaba.com>
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

Wire the chain-list guard and its three sub-checks into the filecheck
validator: cl_count against ocfs2_chain_recs_per_inode(),
cl_next_free_rec against cl_count, and cl_bpc against the cluster to
block size ratio.

The bits-per-cluster predicate keeps the two bitmap_blkno conditions, so
the global bitmap inode itself remains exempt.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 1679ed7d09db..6865f0000e6f 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2165,6 +2165,37 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 		}
 	}
 
+	if (ocfs2_dinode_has_chain_list(di)) {
+		struct ocfs2_chain_list *cl = &di->id2.i_chain;
+
+		if (ocfs2_dinode_has_bad_chain_count(sb, di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: chain list count %u\n",
+			     (unsigned long long)bh->b_blocknr,
+			     le16_to_cpu(cl->cl_count));
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
+
+		if (ocfs2_dinode_has_bad_chain_next_free(di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: chain list index %u\n",
+			     (unsigned long long)bh->b_blocknr,
+			     le16_to_cpu(cl->cl_next_free_rec));
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
+
+		if (ocfs2_dinode_has_bad_chain_bpc(sb, di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: bits per cluster %u\n",
+			     (unsigned long long)bh->b_blocknr,
+			     le16_to_cpu(cl->cl_bpc));
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

