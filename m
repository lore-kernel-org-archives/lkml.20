Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEC53BBFC5
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791329599; cv=none; b=j9j5nWAjMzmKM0bLeSd0/gpXdS+lsmHo+3/XIJ/INFJhigIlY3VoUQ1cfvuCpoKTnIc2nSamPSVjha+NdMOvJZWHy7Ah4Sl74vGet0rK9c8JBTZNfmyhrsMghZM4Cchb49BWGVfjqSWv1Y42gNRniksz1r7xylj5kEWaYhM1j5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791329599; c=relaxed/simple;
	bh=cmAVV5Tebt0KiKcFh+louzfAxig5TzIduxgkDUtTwzE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bxl6p129/chZxKmSHhk1eljDhcmz5+GjC6ZKc3kvRfaa6roiGmB9nk0bj6SufCYKF3B/+3Z6h3S9QD9JOisCHtPYk9xZLSOuYjXbNFVh0p3UlYhYBtvbOV05toW403QoiXdX8Db0aOznxk4gagBlkl9WfRR6Si8bmcH7L8H0fSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bhx3fQ+a; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bhx3fQ+a"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so50688545ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791329596; x=1791934396; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXfVAUbw2uFyka/hBHAtN/UFycLnfdN6bRNMp+GlmjI=;
        b=bhx3fQ+aNiyNqBd2k/5JX0P84iK/QOJY5ydyydqPmluL43niR3NIhot+aFHthnDDi7
         FrJijqWNDnc0lES1VL+rxqE4+YSq2UAWphKvaGF9K9uS9C64pdqtEqeGMof2yaYXNIlC
         9nojeQ+/RV6nMlLqzdvZCFlQhMO4cL1aJx9EY+wnJeu8i6XYF07SD8NwQjowQ5TZZ0+h
         neuov25Wela8s1zn5HpJRZYOBSCGmazqKp9tTuLPMFAPdXB9hzrxGwcnYd0aUp6c68Nf
         ZKk/rc1aWmv3HTvVxKW3Gi4EYI2ILs71dYPs6a3GcWJmEYLt1fOJIfIsaEHi44gAFY1U
         eQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791329596; x=1791934396;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXfVAUbw2uFyka/hBHAtN/UFycLnfdN6bRNMp+GlmjI=;
        b=aTm5nX8o1yi56gTvnw7xg4YOhKLkKej3xsPh4OWAQ4LIGfnZOedkemQuBgORPuWr9B
         5pMzbyNXJLtfEB0wRCcYm2grfOUZruFZNAl8MjAk3XSa5l0DD9T8K+c2ov2Q9XWTjQjD
         dZbr+zhYXrHFbY7uTal/ehnYIrkdRYvDYcqkTExr0MJmaHi2Nrrus7Vy1QM3EGIgBgxr
         uc2M/nZRLDW3Lnb3aYC0SNl5RJV6ML5rGPB+Nglk5d6gd+dgxQencH6v7wXjEaV7EvYh
         3KU7b5VcpBuKxdoEuH1bbb9UyD+vnyJs6D0wCtC+OgkbnBlCVBpzlrqfi8cak4TUi39m
         4fWQ==
X-Forwarded-Encrypted: i=1; AKwUvByJlp6qVtqIcrGe9tzfyFv7XeDqJ/4kFW+508zaDv0DKEKiel8Wbct3SK+buxdeGbPcTTzO++865guquS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeXvZleIlyGByaQq36KOzAzshKrBXQH1ha8+3chHSZ/Isacoam
	Z+pX8/6LgLl1ZZchSvs3UjQGbeUCFCrhVCTsee6GJKXI4Xq6JVXgEyk/ZvR3tDVR2ney1drp4G3
	E1A==
X-Received: from plhb7.prod.google.com ([2002:a17:903:2287:b0:2e5:9453:2404])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e885:b0:2dd:7646:35cd
 with SMTP id d9443c01a7336-2e5ff85264dmr7379155ad.0.1791329595650; Tue, 06
 Oct 2026 16:33:15 -0700 (PDT)
Date: Tue,  6 Oct 2026 23:32:48 +0000
In-Reply-To: <20261006233248.705086-1-praan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261006233248.705086-1-praan@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261006233248.705086-9-praan@google.com>
Subject: [RFC PATCH v1 8/8] nfs: allow P2PDMA pages for O_DIRECT on RDMA mounts
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

Pass ITER_ALLOW_P2PDMA when extracting O_DIRECT pages on mounts that
use the RDMA transport and not pNFS. The RDMA transport moves such pages
only by DMA, and fails the RPC with -EREMOTEIO if the device cannot
reach them.

On other mounts, extracting P2PDMA pages still fails with -EREMOTEIO.

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 fs/nfs/direct.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/direct.c b/fs/nfs/direct.c
index a3c6e8f4ea06..dbeb4f8274e3 100644
--- a/fs/nfs/direct.c
+++ b/fs/nfs/direct.c
@@ -157,14 +157,22 @@ static ssize_t nfs_direct_extract_pages(struct nfs_direct_req *dreq,
 					size_t size, loff_t *pos,
 					struct list_head *list)
 {
+	struct nfs_server *server = NFS_SERVER(dreq->inode);
 	bool pinned = iov_iter_extract_will_pin(iter);
+	iov_iter_extraction_t flags = 0;
 	struct page **pagevec = NULL;
 	ssize_t result, bytes = 0;
 	int err = 0;
 	unsigned int npages, i;
 	size_t pgbase;
 
-	result = iov_iter_extract_pages(iter, &pagevec, size, ~0U, 0, &pgbase);
+	/* Allow P2PDMA pages only on RDMA mounts that do not use pNFS */
+	if (server->nfs_client->cl_proto == XPRT_TRANSPORT_RDMA &&
+	    !pnfs_enabled_sb(server))
+		flags = ITER_ALLOW_P2PDMA;
+
+	result = iov_iter_extract_pages(iter, &pagevec, size, ~0U, flags,
+					&pgbase);
 	if (result <= 0)
 		return result;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

