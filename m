Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971227;
	b=wOvPO7+VWkxcABHk1b0DSKzsEn6JBUqkwH101aUaJN4oQOOTvKlo2LDpX6oTp5f1wdtJ
	 ha4+oaQUsQYRmrLF61iAbhF96bpOq2b/Zg/KRisNLsw64lIobiCJpy2QuVzUhoC7nesBU
	 OlP8rTRheD0l4lxVDpvDENpx3zDH89aEeSq/+XeKY7FC9tZihbBcBcYHp8g2s664mKuYP
	 C4X7oLuq0EKM8arXseLFF37tbLsEaiJDVLJO4CxvzvRMXwPBUK3OaHrpF/bc5HxlDP2pA
	 FMJ8SedcbWYxgFHLxo6u0lCM7H6SeyzDPzRm40Svs912RccB1xZr6CEdRAQ1N/OffDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971227;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q5STX0i0nZe9qBiCwKpYPE22fAldGg2mVbLAiRStB5A=;
	b=1bMRStHxfv2cVfA60SvDSkF+e19Zhyn7+NDk/r4r68XrOudtwnntYa7fLWC7crlFpfKx
	 woG+dgEJkBGhxLd7md02kOmknlVuMO6BNk/5g6hr+Jc7Q+hM5nhnqXjHbiiW/1kafrxE/
	 4H2yxBQFTNmzZAjlHqpC7lioRoRcwJ+9n82E+h1MoOljUZJcb9e3ccxZkMJt4q+6wqNV/
	 g4mLJSmf2k5TfDyT4hyxwl+1o6Rv/3W6bj1Wq6hY9eGh/S/s/oy5nPW2cLa6GAXLcGs5m
	 k/i2cBWJRquVNCd7LRkbGdeH8HkEjlXmZTWNVGoWBrxD98HXIbT6aLvgVCB7dYE71XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tTWcvoJF;
	arc=none smtp.remote-ip=95.215.58.162
Received: from mta1.migadu.com (out-162.mta1.migadu.com [95.215.58.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DD9606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0DD9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tTWcvoJF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lnwy3IIIUITEEW39wV2rv1u7rm4YP9o1MSolIsKb45g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793971225; v=1; x=1794576025;
 b=tTWcvoJFhREnEQce4WCZ3iyBtwJ88lVb41kXcUU14zTdACClX1UBA8ST/5W8aC4OORpFSjok
 PY/QxaUVCsJk0mtuUJL2rIBltOH9TqnhodbbNfQQ2yywMsYC8BQceK2fsDaSr5fzvkr+B7tzBhe
 WHMLhXhd7qR6ADqpzdTXVBgg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 42ebb214afb95bc7;
	Fri, 06 Nov 2026 13:20:17 +0000
X-Mizu-Trace-ID: 42ebb214afb95bc7
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: akpm@linux-foundation.org,
	dgilbert@interlog.com,
	mkp@kernel.org,
	loberman@redhat.com,
	jmeneghi@redhat.com,
	kraxel@redhat.com,
	vivek.kasireddy@intel.com,
	mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	stefanha@redhat.com,
	sgarzare@redhat.com,
	rostedt@goodmis.org,
	vdonnefort@google.com,
	mhiramat@kernel.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	axboe@kernel.dk
Cc: linux-mm@kvack.org,
	James.Bottomley@HansenPartnership.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	linux-scsi@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bobbyeshleman@meta.com,
	mathieu.desnoyers@efficios.com,
	robin.murphy@arm.com,
	mason@kernel.org,
	aesteve@redhat.com,
	tjmercier@google.com,
	harry@kernel.org,
	vbabka@suse.cz,
	cui.tao@linux.dev,
	cuitao@kylinos.cn
Subject: [PATCH 5/7] iommufd: account the hw_queue page array to memcg
Date: Fri,  6 Nov 2026 21:18:27 +0800
Message-ID: <20261106131829.3228926-6-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106131829.3228926-1-cui.tao@linux.dev>
References: <20261106131829.3228926-1-cui.tao@linux.dev>
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

From: Tao Cui <cuitao@kylinos.cn>

IOMMUFD_CMD_HW_QUEUE_ALLOC pins up to max_npages pages just to check
that a user supplied queue region is physically contiguous, and the
page array for that check is plain GFP_KERNEL.  The size comes from
cmd->length, a u64 that is only overflow checked, and the array is
freed again as soon as the contiguity check fails, so the allocation
can be repeated concurrently: a 1GB region costs about 2MB of
uncharged memory per attempt.

Every other iommufd allocation that scales with user input is already
charged, and the pinned pages charge the mapper at map time.  Charge
this array like the rest.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 drivers/iommu/iommufd/viommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index f7951057a1e5..ab17e190da49 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -330,7 +330,8 @@ iommufd_hw_queue_alloc_phys(struct iommu_hw_queue_alloc *cmd,
 	 * Use kvcalloc() to avoid memory fragmentation for a large page array.
 	 * Set __GFP_NOWARN to avoid syzkaller blowups
 	 */
-	pages = kvzalloc_objs(*pages, max_npages, GFP_KERNEL | __GFP_NOWARN);
+	pages = kvzalloc_objs(*pages, max_npages,
+			      GFP_KERNEL | __GFP_NOWARN | __GFP_ACCOUNT);
 	if (!pages)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.43.0

