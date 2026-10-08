Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354993A5431
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486519; cv=none; b=MvO3ZhEJPl1Ukt7aOMjZOQFYjdx/Bl8RWJdpTzQRwEOPaQ5MyNowcJlpkCnM+RMT/I6C26G13yLFKfornY4/kHjegwzPxSPpvnzgnOYnxHTx3CPze5ToJ3aE2pP0GlNhs2OPRkgqhXpmg+vD07ov5MscYKnvnkST8itNOyZULPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486519; c=relaxed/simple;
	bh=Zir4Ph3FKLRzBTHiYIba+VfmJzMS/v9zNFVDu0Pjrt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2GahfVQZCdmpnz6AmJ7gF7++G7KXavnqJbyP9HdoRNB/pqsjAOPjWc1tjRkpV8qPIu9RxRjnCWLmbBVSaQ3CuIWTAWBUGERT9jv8yZNWBJhnfVyrTyVH4UV6O+rVzDgeJgh/Mv8YOgYjwy6xnEQKlHlUSiZtDo7Fu1UydJuV6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=RWK9bvoY; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="RWK9bvoY"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-351f7a0b13bso602073eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486515; x=1792091315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5apqDPTTuz0tcu66C6sdhKkioJqFGVwtFVltYn4up0I=;
        b=RWK9bvoYyMwJ15/n+Wg75puZ6CXOUL5gIKCyPgZYt+MJ4Tp2vEnxh1iYc8EMg9aoBn
         63pB5BTLWEkNRqHJFdd/Rx3MPA+5DAw9cIETtIKF1QJeF7GRXlLLIguYO7/w96MRRVRz
         GidVgi0l4STuK1b65FHY7pircJZvi1aqHhVpD39ahHm+nkVmgsxx9jiCCehY3/Klmt9x
         oE/OvjXYa7qjbhq+JwKvZ1SMP+Dd5fw8C5nLoNC67bJuieZM/eJdfzvh6gGsRDC+75ws
         FY8vfNv9Lz6QE/1qSGnVjdeSkW/O12IsEJRWh8cyfv2Sl4Uj5FRtekkM42148V3H98CD
         Qf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486515; x=1792091315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5apqDPTTuz0tcu66C6sdhKkioJqFGVwtFVltYn4up0I=;
        b=MkGQpdmJOsYVHGF5oba6D5G6Bz0pu+2muMHiUXGaJfLtaIIkhyupORQmigWvDhuQ6D
         xX/g+ATh6h+vBbc/m9sD5HpzQZR7Rjt07B04zGYYgMu6brwbH360/opY55siaYomth3Q
         gcjpLZIdP3i1D6nBt19AEvvvdU0g479/WjhfAYAzQIFYKdBMaQx7LKdFRgaXEsu0Dy5E
         IlQJKxS8cQsAEeVsALr1fY64+F48S6Xf8PfFOUWFRogderV2xlPv5JXBEvb012w0jN+7
         nHzxp5W89QUWj3zotkKV62PkPW8xFJ14X3Qp5WaTZmvVNucKgWfp6AIxb/83VokNY6gW
         SmvA==
X-Forwarded-Encrypted: i=1; AKwUvBymhJr/d0CAetfXmmH2+o3i/p0FOlBINA4xBhws+E1Pe2YNvvncSB72gzOMNBXsc3qjXJjfQTm9bYnUD0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXFLFnbwS2sbyHOT3sLBwIgZa3gKYyZe+rKOvVgWuvWm3yi7If
	ACynqEW1KakJ8Utf761MqnRN845jDVBEbNNI3DzDKadqRhaD+L9CFFABKYkHtBzAt3Y=
X-Gm-Gg: AYBFou2NrO0dRaaOeX5kIfc+HrX7sERm1LpN8fVBouldH/RZb4JqHliggeGibhJJxQo
	yBdyUvO9vRwC71zPWJEiEPzzy/ZF8hKq2bAADv+9Jr7yCUsgGUzIcnPrOWZzxIoGxcUh44MnAOq
	maI0GlcXME49x0CwjnL+2Mge6nXlPZQjC6RxEJrHq7YWlw0PEcLLcFTNWcse4GxXmnj+yAmhiaB
	zDc28aSqyPF3AwZ7NcyrlDP9B7V6NEkb1cAbf86FLzf07TtZmSc4fwq0/hDdQi4YVRQlVaSYbGV
	Z8p1GR8Xeb9f989N0lqBs3N99ToLi/mrrqtIIwaFsIyYAxR1Ljdkt4QtisaQAHwu+oXkP1SS5f/
	eTfo2CvMQRz8XLL4c+hkFEzH1j+Hmvu7Oq0v7p89NX97CfBmkbtyGYFZuyRuQR+A+3nZ0u+Eavw
	BM7k1XdXigI1ngeflkNX2ikQymJ85ZLgmLwKq8kqp/CWpwDmdrFP9aVBMyK3/8Wo+vqUqjmUnYy
	/Hpqv4ktWY0YB7pW1dMS4YB1SVnWbhsU6A9BJIEI3uPHtDrOq10n18tdyRQ//Y7IGywnow=
X-Received: by 2002:a05:693c:87cd:20b0:353:5d7a:cabe with SMTP id 5a478bee46e88-3536c53930dmr317574eec.13.1791486515207;
        Thu, 08 Oct 2026 12:08:35 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm80561eec.3.2026.10.08.12.08.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:08:34 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Robert Morris <rtm@csail.mit.edu>,
	Hongbo Li <lihongbo22@huawei.com>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Yue Hu <zbestahu@gmail.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>
Subject: [PATCH 6.6.y 1/2] erofs: avoid infinite loops due to corrupted subpage compact indexes
Date: Thu,  8 Oct 2026 15:08:27 -0400
Message-ID: <20261008190830.97970-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008190830.97970-1-artem@trailofbits.com>
References: <20261008190830.97970-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gao Xiang <hsiangkao@linux.alibaba.com>

[ Upstream commit e13d315ae077bb7c3c6027cc292401bc0f4ec683 ]

Robert reported an infinite loop observed by two crafted images.

The root cause is that `clusterofs` can be larger than `lclustersize`
for !NONHEAD `lclusters` in corrupted subpage compact indexes, e.g.:

  blocksize = lclustersize = 512   lcn = 6   clusterofs = 515

Move the corresponding check for full compress indexes to
`z_erofs_load_lcluster_from_disk()` to also cover subpage compact
compress indexes.

It also fixes the position of `m->type >= Z_EROFS_LCLUSTER_TYPE_MAX`
check, since it should be placed right after
`z_erofs_load_{compact,full}_lcluster()`.

[ Backport to 6.6.y: preserve the switch-based full/compact loader and
  perform the type and cluster-offset validation after either loader
  using z_logical_clusterbits. ]

Fixes: 8d2517aaeea3 ("erofs: fix up compacted indexes for block size < 4096")
Fixes: 1a5223c182fd ("erofs: do sanity check on m->type in z_erofs_load_compact_lcluster()")
Reported-by: Robert Morris <rtm@csail.mit.edu>
Closes: https://lore.kernel.org/r/35167.1760645886@localhost
Reviewed-by: Hongbo Li <lihongbo22@huawei.com>
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 1 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2025-68251. 6.6 validates clusterofs only in the
full-index loader, leaving corrupted subpage compact NONHEAD records able
to drive non-progressing lookback.
This needed a target-specific adjustment; I called it out in the bracketed
backport note above.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.

 fs/erofs/zmap.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
index 76566c2cbf63..e53d5239f04d 100644
--- a/fs/erofs/zmap.c
+++ b/fs/erofs/zmap.c
@@ -67,10 +67,6 @@ static int z_erofs_load_full_lcluster(struct z_erofs_maprecorder *m,
 		if (advise & Z_EROFS_LI_PARTIAL_REF)
 			m->partialref = true;
 		m->clusterofs = le16_to_cpu(di->di_clusterofs);
-		if (m->clusterofs >= 1 << vi->z_logical_clusterbits) {
-			DBG_BUGON(1);
-			return -EFSCORRUPTED;
-		}
 		m->pblk = le32_to_cpu(di->di_u.blkaddr);
 		break;
 	default:
@@ -276,14 +272,34 @@ static int z_erofs_load_compact_lcluster(struct z_erofs_maprecorder *m,
 static int z_erofs_load_lcluster_from_disk(struct z_erofs_maprecorder *m,
 					   unsigned int lcn, bool lookahead)
 {
-	switch (EROFS_I(m->inode)->datalayout) {
+	struct erofs_inode *vi = EROFS_I(m->inode);
+	int err;
+
+	switch (vi->datalayout) {
 	case EROFS_INODE_COMPRESSED_FULL:
-		return z_erofs_load_full_lcluster(m, lcn);
+		err = z_erofs_load_full_lcluster(m, lcn);
+		break;
 	case EROFS_INODE_COMPRESSED_COMPACT:
-		return z_erofs_load_compact_lcluster(m, lcn, lookahead);
+		err = z_erofs_load_compact_lcluster(m, lcn, lookahead);
+		break;
 	default:
 		return -EINVAL;
 	}
+	if (err)
+		return err;
+
+	if (m->type >= Z_EROFS_LCLUSTER_TYPE_MAX) {
+		erofs_err(m->inode->i_sb, "unknown type %u @ lcn %u of nid %llu",
+			  m->type, lcn, vi->nid);
+		DBG_BUGON(1);
+		return -EOPNOTSUPP;
+	}
+	if (m->type != Z_EROFS_LCLUSTER_TYPE_NONHEAD &&
+	    m->clusterofs >= (1 << vi->z_logical_clusterbits)) {
+		DBG_BUGON(1);
+		return -EFSCORRUPTED;
+	}
+	return 0;
 }
 
 static int z_erofs_extent_lookback(struct z_erofs_maprecorder *m,
-- 
2.39.5

