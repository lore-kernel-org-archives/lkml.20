Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03D33C1D5C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791329588; cv=none; b=m036ddLqdRoJ1tjHYeutHVbIMHMe+nwxEG9II3KlxHhDUNgC7OYfwS0Ax7/0gPraqHRAxnP5afH2mFIumjWWsjpiy47yYxm0nSZY73GxXPzw0hbcA7Y3cBo9AaAJ8r96sH50vzrOcP1Za4D14tUUz1JYEeZCYrM8Y9k6Beqjc0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791329588; c=relaxed/simple;
	bh=sO4V+mmMkoqTrK6MLwAhaqkX0oKHVcQnX7+V9fGm6nY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XSn4OED5wd4A7v79n9ecL/j0zuii791V0Jk1NIb9i1Ed93YQJmhskiH3DDqAaFflEMNJnGhTTXPfFlM2Md9G2tzO78EsigcRPu3n0d9vq8zK1R10QRZo1+5Figo5DL1zLxPNdLa2IOK6m8wX1iZDbS1vm+Aa8VdOdgBWIwnXdSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mpwqp7Ku; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mpwqp7Ku"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4057348a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791329586; x=1791934386; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyP5xcuYu0NQ5k80I+kpxgtI7BT6olGWju1QlyYfpFs=;
        b=Mpwqp7KukfMikiS+swA8wjfHyUcIFZjm9xjm3Bo1KThdlK/xdbZEg+I7REmSWM9pPN
         UjWNPq+KtADBetqoygnzCW4FkpeszE67WmywgyXso6a24jCpLsIhciaxMIOpygjAiVQT
         BsepKDs0Ma7cBFflvMg7RrSwxVXQulQa79Aljqswqd+7QbTRoj/uWbA7bLUFscAHYIH7
         BCYwa+CCS2vFXKaGdrwOqKqtA4qxrlwTr5KAl4uANS0rwzlIUG2TqyCxJPg7wPEpO3Yl
         hFZLuXsTiaBFGhCcuofMt/j327NtJs0Axje56vYkM9Zhsd4WLVaFM5RcJm/M8/+J4EO3
         Z7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791329586; x=1791934386;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyP5xcuYu0NQ5k80I+kpxgtI7BT6olGWju1QlyYfpFs=;
        b=LwX6zcX6uDJt30tZ1K+yFAiWP5xbZe2mYH9QAyX55MslIhSTnxM/1GPsP/xgpsqAPV
         YRRgZIAorUwvcykdwUqNJjEZFTkjZfzO+6DXpNeFb8iTLblU2ZkGulv/R82n10GEWsRQ
         sUFm/Q5O/TNx+RsPUbHThjm7QN78fLF4GXuK/DtwB0EEQQ8Hms5WQkbTdQhGqLJ0nowS
         ewBmYk3Nq3ozAb5jXtPQt+CTiJ7JzEjAqLRmEdrptqLu468NkMeAzLEV6QXt1ZbuxGox
         YRCODWy3BPkGojWpOOWl4zqgPm6zFOXMQSbBG4HOg7GRIprkrYHG7ytsga4nYBHtKzj2
         7anQ==
X-Forwarded-Encrypted: i=1; AKwUvBx20kOtg5pw9OEET9lf28yqSTVog4Zyr3dCmn/Wdb9T13T7jtftGZ0GwSshSSls/d9tBUVuzn979DipSYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdsDjKr98TQHys4Ggi7I8zNEAlgyoRUoECb8tsYRwyO8rlcoCu
	BtxZjHB4vrMBax5eu7sUtKSgF0jrWNdnZ6jXJAK2+rf5wg17vaFkl+V5jraujl9s0teiWS9Lqo2
	31w==
X-Received: from pgbj19-n2.prod.google.com ([2002:a05:6a02:61d3:20b0:cca:d6f4:95b5])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d445:b0:3a4:bbb9:e912
 with SMTP id 98e67ed59e1d1-3a8a192992dmr481876a91.23.1791329585866; Tue, 06
 Oct 2026 16:33:05 -0700 (PDT)
Date: Tue,  6 Oct 2026 23:32:44 +0000
In-Reply-To: <20261006233248.705086-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261006233248.705086-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261006233248.705086-5-praan@google.com>
Subject: [RFC PATCH v1 4/8] xprtrdma: return -EREMOTEIO on P2PDMA map failure
From: Pranjal Shrivastava <praan@google.com>
To: linux-nfs@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>
Cc: Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, Logan Gunthorpe <logang@deltatee.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-pci@vger.kernel.org, linux-rdma@vger.kernel.org, 
	Shivaji Kant <shivajikant@google.com>, Tom Talpey <tom@talpey.com>, 
	Leon Romanovsky <leon@kernel.org>, Unnati Sachan <unnatisachan@google.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

ib_dma_map_sg() returns 0 on any failure, so frwr_map() cannot tell
why a mapping failed and reports -EIO. Use ib_dma_map_sgtable_attrs()
instead, which returns the reason. Pass up -EREMOTEIO, which means
the device cannot reach the P2PDMA memory, so the RPC fails with the
same error as other P2PDMA refusals. Every other mapping failure
still returns -EIO.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 net/sunrpc/xprtrdma/frwr_ops.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/net/sunrpc/xprtrdma/frwr_ops.c b/net/sunrpc/xprtrdma/frwr_ops.c
index e83cef19e656..a55d5e11c0e2 100644
--- a/net/sunrpc/xprtrdma/frwr_ops.c
+++ b/net/sunrpc/xprtrdma/frwr_ops.c
@@ -293,7 +293,8 @@ int frwr_map(struct rpcrdma_xprt *r_xprt,
 	bool sg_gaps = ep->re_mrtype == IB_MR_TYPE_SG_GAPS;
 	unsigned int max_depth = ep->re_max_fr_depth;
 	struct ib_reg_wr *reg_wr;
-	int i, n, dma_nents;
+	struct sg_table sgt;
+	int i, n, dma_nents, ret;
 	struct ib_mr *ibmr;
 	u8 key;
 
@@ -381,10 +382,13 @@ int frwr_map(struct rpcrdma_xprt *r_xprt,
 	mr->mr_dir = rpcrdma_data_dir(writing);
 	mr->mr_nents = i;
 
-	dma_nents = ib_dma_map_sg(ep->re_id->device, mr->mr_sg, mr->mr_nents,
-				  mr->mr_dir);
-	if (!dma_nents)
+	/* Unlike ib_dma_map_sg(), this reports why a mapping failed */
+	sgt.sgl = mr->mr_sg;
+	sgt.orig_nents = mr->mr_nents;
+	ret = ib_dma_map_sgtable_attrs(ep->re_id->device, &sgt, mr->mr_dir, 0);
+	if (ret || !sgt.nents)
 		goto out_dmamap_err;
+	dma_nents = sgt.nents;
 	mr->mr_device = ep->re_id->device;
 
 	ibmr = mr->mr_ibmr;
@@ -413,7 +417,8 @@ int frwr_map(struct rpcrdma_xprt *r_xprt,
 
 out_dmamap_err:
 	trace_xprtrdma_frwr_sgerr(mr, i);
-	return -EIO;
+	/* Return -EREMOTEIO if the device cannot reach the P2PDMA memory */
+	return ret == -EREMOTEIO ? ret : -EIO;
 
 out_mapmr_err:
 	trace_xprtrdma_frwr_maperr(mr, n);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

