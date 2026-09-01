Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A60A392807
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232379; cv=none; b=UVpJYqylnkSXozyETX56Mvys4qMAShiBsMRW2LHF8u5ry7T92Bb6sDXsKfu/bEnHWoaSdP1PA62SDq0y2D1aCvV0Ic179k7IFxQbvfGAuYJ9gG3+f5swv1lJDehLlTdpvh1DI5yHHTWwMsAQx8Djk+vXVQfIycc252vuoTNw5H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232379; c=relaxed/simple;
	bh=/g85e5VUvc/+J8Z6oeY5QKxvevGtt3AtN7aUwC2HJ5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTXfUnUKsgJwnqunDwdAXZxdkeJJavLvUNFAzgkQ8i3wC1ud/H4yzL706ArCsVMTHP8ADBJYiyF5SFBNdvMwH+DuXj+RBEExH1rQfbhaXmC4+RBG1Ha67M4PSHazV2T7lDg4T09cv/pkPacKSYn2ez7H8mdBfoSY8ihql2TDWsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SRMVEDW8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SRMVEDW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788232377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/15VKFd0k8fjwRB+GcpY7pyNM2oKVrWq2M5AHqmwy8=;
	b=SRMVEDW8ojL3gh77J0lsEMRN1iOpCQGwvYWTURlxVj2teLzpwY8cOW1rlrsVziyqUYBTin
	7b0SjTqeRT/4dH02xwzWSsKjn62uQf/B+tzA2f4ozLM8b8XePJJnL6SdfqouBSGv/Pidti
	qh8UTnUT5LIRYE5n1FVuNRsljS9Hed8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-s-uJBlnQOgWk27tOwn31BQ-1; Mon,
 31 Aug 2026 23:12:53 -0400
X-MC-Unique: s-uJBlnQOgWk27tOwn31BQ-1
X-Mimecast-MFC-AGG-ID: s-uJBlnQOgWk27tOwn31BQ_1788232370
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C57901955F61;
	Tue,  1 Sep 2026 03:12:48 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0AE9B18005B8;
	Tue,  1 Sep 2026 03:12:43 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@kernel.org,
	baolin.wang@linux.alibaba.com,
	ziy@nvidia.com,
	lance.yang@linux.dev
Cc: corbet@lwn.net,
	tsbogend@alpha.franken.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	x86@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hughd@google.com,
	dave.hansen@linux.intel.com,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	yintirui@huawei.com,
	dev.jain@arm.com,
	usama.arif@linux.dev
Subject: [PATCH v7 02/14] mm: shmem: shmem_getattr(): set blksize to highest supported THP order
Date: Mon, 31 Aug 2026 23:12:06 -0400
Message-ID: <4d61dc5e8d6ffe957020eb34f57fb51099c2913b.1788232334.git.luizcap@redhat.com>
In-Reply-To: <cover.1788232334.git.luizcap@redhat.com>
References: <cover.1788232334.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Today, shmem_getattr() sets stat->blksize to PMD size whenever
shmem_huge_global_enabled() returns non-zero. While this works fine
for the normal THP-enabled case as explained by Baolin in [1], this
has two problems:

 1. Theoretically, when shmem is configured for within_size, this
    could set blksize to PMD size even though the allocation may
    be a smaller mTHP order

 2. A future commit will allow shmem THP support to be enabled
    even when the CPU doesn't support PMD-sized pages. We should
    not allow blksize to be set to PMD size in this case

In order to fix #1 and prepare for #2, this commit sets blksize
to the size of the highest supported order returned by
shmem_huge_global_enabled().

  [1] https://lore.kernel.org/linux-mm/6591a74c-7ef9-4614-9ae9-cb2fbed86ebf@linux.alibaba.com/

Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 mm/shmem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index eeb9a78c125a..b963f55640a8 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1506,6 +1506,7 @@ static int shmem_getattr(struct mnt_idmap *idmap,
 {
 	struct inode *inode = path->dentry->d_inode;
 	struct shmem_inode_info *info = SHMEM_I(inode);
+	unsigned int orders;
 
 	/* Fast-path hint; recalc under info->lock corrects any stale read. */
 	if (data_race(info->alloced - info->swapped != inode->i_mapping->nrpages))
@@ -1522,8 +1523,9 @@ static int shmem_getattr(struct mnt_idmap *idmap,
 			STATX_ATTR_NODUMP);
 	generic_fillattr(idmap, request_mask, inode, stat);
 
-	if (shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0))
-		stat->blksize = HPAGE_PMD_SIZE;
+	orders = shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0);
+	if (orders)
+		stat->blksize = PAGE_SIZE << highest_order(orders);
 
 	if (request_mask & STATX_BTIME) {
 		stat->result_mask |= STATX_BTIME;
-- 
2.55.0

