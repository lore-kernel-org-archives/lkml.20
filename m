Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206C03AF66E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696021; cv=none; b=neogO/CbMjw1fTAPy7+/DVnGOa1MggLX2aIV0Ytmf5RhOypZYm4UXM7F4FxFxdMldkNqVtJM2a6naVovcL0I/M40j0+g0WJcFguAdbekOGbRUSqPDmZRx0zMUYrdlP22sHIZFFGYwsstbKt7ukD/aiECWBNFcF9WM4nweKuJU2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696021; c=relaxed/simple;
	bh=5R31p9BSkoodWsD0qFM6VP1GZs0ic74wnfEkgjrpbio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIfWFQeu7OXbnG6TsRYhAXFS/LdytPVrfhssghKMugKP+XK7z8QvG8MPhOPzToWoW0MmfEV0BLpL3FIWCR5NJOHUn+P9b0wDr7KjgvgaIT2vndE0QqhMrvSCFQDCNV1UVqgwnNb4cwEmwGHdGf43/LLTbicMVR6a80rW9HI7OzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P+G9NNtp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P+G9NNtp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789696003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sn1phcmIUsqYDE7FBADv0MCd5ZBigkQob+Tfo5WLJXU=;
	b=P+G9NNtpAaMLMaNiUDnrBeANCMlICW4sFtqVq72fSlK4zqyRB5ivvtMGlHy0F9v0+e34O2
	+kjoytg8ocQ8tWi+ye5gFVrY4NJJXTabLrIa2uM9dZKp6XaZupRDqQFRnp+sZ5O3jj+prj
	ViECUB6rWvD95vTVxawUX+ri48R3UD8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-pdNvms8EOEm0xi0nlB4bTw-1; Thu,
 17 Sep 2026 21:46:37 -0400
X-MC-Unique: pdNvms8EOEm0xi0nlB4bTw-1
X-Mimecast-MFC-AGG-ID: pdNvms8EOEm0xi0nlB4bTw_1789695994
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B0501800148;
	Fri, 18 Sep 2026 01:46:34 +0000 (UTC)
Received: from lcapitul-thinkpadt14gen3.rmtcaqc.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A633B18002B1;
	Fri, 18 Sep 2026 01:46:30 +0000 (UTC)
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
Subject: [PATCH v8 07/14] mm: shmem: allow THP support determination at folio allocation time
Date: Thu, 17 Sep 2026 21:45:28 -0400
Message-ID: <f74ada750d1910f8ea7e55955eb0c330747b93d4.1789695931.git.luizcap@redhat.com>
In-Reply-To: <cover.1789695931.git.luizcap@redhat.com>
References: <cover.1789695931.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

In order to enable THP support in shmem today, besides the user
configuration required, the CPU must support PMD-sized pages. This
is the case because of the following has_transparent_hugepage()
usage:

- shmem_parse_one() and shmem_parse_huge(): Check if THP is built-in and
  if the CPU supports PMD-sized pages

- shmem_init(): Since the CONFIG_TRANSPARENT_HUGEPAGE guard is outside
  the code block calling has_transparent_hugepage(), the
  has_transparent_hugepage() call is exclusively checking if the CPU
  supports PMD-sized pages

While it's necessary to check if CONFIG_TRANSPARENT_HUGEPAGE is enabled
in all cases, shmem can determine THP size support at folio allocation
time. Therefore, drop the has_transparent_hugepage() usage listed above
while keeping the CONFIG_TRANSPARENT_HUGEPAGE checks.

Additionally, we need to check if PMD size order is supported in
shmem_getattr(). Use pgtable_has_pmd_leaves() for that.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 mm/shmem.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 776dff8a848e..930657d05375 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -690,7 +690,7 @@ static int shmem_parse_huge(const char *str)
 	else
 		return -EINVAL;
 
-	if (!has_transparent_hugepage() &&
+	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
 	    huge != SHMEM_HUGE_NEVER && huge != SHMEM_HUGE_DENY)
 		return -EINVAL;
 
@@ -1524,6 +1524,8 @@ static int shmem_getattr(struct mnt_idmap *idmap,
 	generic_fillattr(idmap, request_mask, inode, stat);
 
 	orders = shmem_huge_global_enabled(inode, 0, 0, false, NULL, 0);
+	if (!pgtable_has_pmd_leaves())
+		orders &= ~BIT(PMD_ORDER);
 	if (orders)
 		stat->blksize = PAGE_SIZE << highest_order(orders);
 
@@ -4814,8 +4816,7 @@ static int shmem_parse_one(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_huge:
 		ctx->huge = result.uint_32;
 		if (ctx->huge != SHMEM_HUGE_NEVER &&
-		    !(IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
-		      has_transparent_hugepage()))
+		    !IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
 			goto unsupported_parameter;
 		ctx->seen |= SHMEM_SEEN_HUGE;
 		break;
@@ -5620,7 +5621,7 @@ void __init shmem_init(void)
 #endif
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	if (has_transparent_hugepage() && shmem_huge > SHMEM_HUGE_DENY)
+	if (shmem_huge > SHMEM_HUGE_DENY)
 		SHMEM_SB(shm_mnt->mnt_sb)->huge = shmem_huge;
 	else
 		shmem_huge = SHMEM_HUGE_NEVER; /* just in case it was patched */
-- 
2.55.0

