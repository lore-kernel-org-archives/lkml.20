Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872197;
	b=R5z3RddeL4SYIBvOaJ6CVrPYiKyYGQCVF73kpfe4sjPus/1Gpy4JP4uJD74EvSS1U+v0
	 W+YRhyo4K4z+JiKDDgkQTR+CW9ztlo4KG5GlTNl2Z+MM43PDY9vhIttWpGVcaRUiTwNB9
	 Z6+2iYreW1wTJxJOkTnqjQYWpaMkbr78baXoEMviO1uPLpx9IpiV6ye30DsbIpRVDWqbW
	 hB7achfC3dHX+hLDwrZHpG1d+o9+QijbH4WpamGFzJ6hCb12nwemvMPVZphGxx85qGWnG
	 63zaVmmVNOPAMKhKixo4ZBN1GY2Ud3DzyDKPW/5pTATVOErNfCsNfqD+EOh1TwyVpqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872197;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4UXvPNsl5wrzyBCCxvw6h3vxKgxpHU15BJNpAk0jZOg=;
	b=tOE4G8vt9nH4b3RL8rZfyhU+4YZrE6GOeGtt2T9G01CkHtGsiSKB21P/9bodyre2DAWK
	 CiBvg/F9lCTn5FNnJzVJ0Pl48fkkk77co/7aAcC9VdsABEYOEGWGs86T73uR3DDIR/RFx
	 NddGRjoI5pekAaZWX0YxaMRMXyIQLairYLshCQ3l+vjS6hMQ9s9cpk6PYwQ2L2I1PsQOT
	 dSWsseicp4q61tIqJNy6N9WHsrlyFMjvgo5N7+Xi8JYfFp7gXAJfOPt2mj8Yn7mviAaoc
	 j3smlbE3m1i5v+vpO8Uk7X+0UYVgcYQT+yQmBC8uSc4k3I22qQdpgG9/jGlAWJC/rKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mv1rWlsh;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199A360A5BCA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 199A360A5BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mv1rWlsh
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872194; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=4UXvPNsl5wrzyBCCxvw6h3vxKgxpHU15BJNpAk0jZOg=;
	b=mv1rWlshBxnpd/xTF8j58nLmr2Rr5TDdEGVbt4JXfg9vxYj8TQh5nd/3V6Jn4g9f82vKgytmrCe6UkHNjLo4Ec5KnCi6uYVqBEgmdqMSrlx0dfi4Ao6A3C8lO9lfDR6nwJ4psuRc/vn1l8vctyEL2czYN+x0C8RHKSLzQ2aKalQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XE8RZgf_1793872193;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XE8RZgf_1793872193 cluster:ay36)
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
Subject: [PATCH 28/30] ocfs2: check chain list dinodes in online filecheck
Date: Thu,  5 Nov 2026 17:49:24 +0800
Message-Id: <20261105094926.3203416-29-joseph.qi@linux.alibaba.com>
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
index 81f1f511d448..e0fc68ff997a 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2154,6 +2154,37 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
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

