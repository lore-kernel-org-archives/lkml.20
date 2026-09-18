Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6123B95EC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696056; cv=none; b=tT/jpQH9OlU23i2OylX+LDtK5XkDLJcqYqYwonOoUUL4JalbvgQIyJyqAgRbqsvnTJHk5js26ugTeD1dam2TRCpyBpAU/ssnnZegBubcc9bBdnPs048lkS83D90iTWDpzaHhBVY2Bl3zefj2MJiv3FWIa+X58Nd1TQe2lpdVSKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696056; c=relaxed/simple;
	bh=jH9ShoSZX0rAxFQGNEuxIH4YWfhH0wY9gnTRKR71iP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FWIFlUI5zvwXyDT9MfP8y/emj2ctnoNcO9jFiMM5xS9stoKzDNvZ3X+10l6V66+sOjzH6Dn/Mn4Oa/ULEE4qk4dQegC0pYF0V5EjnfqIe6JIdjC3Ve7vPpAjgR06mGWsd8aqY8aogQed7E8AQVGb+1cLet+oSXjKWdm3qAWGa4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OnhIaxhJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OnhIaxhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789696029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ovPTbvLEJJOqEFcDDpslczGlymPsHZBK7w/POdlYcQ=;
	b=OnhIaxhJ98ReFQnAdFW/xNkFIJ1j+IAzxGjORZ+48XZKITH7qZPcZbp7ydUcC+K9ImIePe
	0YhUrZwwAi3yVrj0ovXyysFtRgX61BIEEUEwfbZNb9CBe/cwMPOL7pHKEixMulMklrU8Hk
	b6rgrprMt/5kWSY+XxYAxTvVznqoaik=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-458-ngUFKrJONAmcmwzqvcMYeA-1; Thu,
 17 Sep 2026 21:47:04 -0400
X-MC-Unique: ngUFKrJONAmcmwzqvcMYeA-1
X-Mimecast-MFC-AGG-ID: ngUFKrJONAmcmwzqvcMYeA_1789696021
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A7F61954229;
	Fri, 18 Sep 2026 01:47:01 +0000 (UTC)
Received: from lcapitul-thinkpadt14gen3.rmtcaqc.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E4B9718002A6;
	Fri, 18 Sep 2026 01:46:57 +0000 (UTC)
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
Subject: [PATCH v8 14/14] mm: thp: always enable mTHP support
Date: Thu, 17 Sep 2026 21:45:35 -0400
Message-ID: <752f528f0fed5cdc9de12b54260b0495d4e5a6cb.1789695931.git.luizcap@redhat.com>
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

If PMD-sized pages are not supported on an architecture (ie. the
arch implements arch_has_pmd_leaves() and it returns false) then the
current code disables all THP, including mTHP.

This commit fixes this by allowing mTHP to be always enabled for all
archs. When PMD-sized pages are not supported, its sysfs entry won't be
created and their mapping will be disallowed at page-fault time.

Similarly, this commit implements the following changes for shmem in
shmem_allowable_huge_orders():

 - Drop the pgtable_has_pmd_leaves() check so that mTHP sizes are
   considered
 - Filter out PMD and PUD orders from allowable orders when
   PMD-sized pages are not supported by the CPU

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 mm/huge_memory.c | 25 ++++++++++++++++++++-----
 mm/shmem.c       | 14 +++++++++-----
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a06025b87e7c..a2d6de3ea988 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -189,6 +189,15 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 	else
 		supported_orders = THP_ORDERS_ALL_FILE_DEFAULT;
 
+	if (!pgtable_has_pmd_leaves()) {
+		/*
+		 * If the CPU does not support PMD leaves, assume for
+		 * now that it does not support PUD leaves and disable
+		 * both folio orders.
+		 */
+		supported_orders &= ~(BIT(PMD_ORDER) | BIT(PUD_ORDER));
+	}
+
 	orders &= supported_orders;
 	if (!orders)
 		return 0;
@@ -196,7 +205,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 	if (!vma->vm_mm)		/* vdso */
 		return 0;
 
-	if (!pgtable_has_pmd_leaves() || vma_thp_disabled(vma, vm_flags, forced_collapse))
+	if (vma_thp_disabled(vma, vm_flags, forced_collapse))
 		return 0;
 
 	/* khugepaged doesn't collapse DAX vma, but page fault is fine. */
@@ -979,7 +988,7 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
 	 * disable all other sizes. powerpc's PMD_ORDER isn't a compile-time
 	 * constant so we have to do this here.
 	 */
-	if (!anon_orders_configured)
+	if (!anon_orders_configured && pgtable_has_pmd_leaves())
 		huge_anon_orders_inherit = BIT(PMD_ORDER);
 
 	*hugepage_kobj = kobject_create_and_add("transparent_hugepage", mm_kobj);
@@ -1001,6 +1010,15 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
 	}
 
 	orders = THP_ORDERS_ALL_ANON | THP_ORDERS_ALL_FILE_DEFAULT;
+	if (!pgtable_has_pmd_leaves()) {
+		/*
+		 * If the CPU does not support PMD leaves, assume for
+		 * now that it does not support PUD leaves and disable
+		 * both folio orders.
+		 */
+		orders &= ~(BIT(PMD_ORDER) | BIT(PUD_ORDER));
+	}
+
 	order = highest_order(orders);
 	while (orders) {
 		thpsize = thpsize_create(order, *hugepage_kobj);
@@ -1091,9 +1109,6 @@ static int __init hugepage_init(void)
 	int err;
 	struct kobject *hugepage_kobj;
 
-	if (!pgtable_has_pmd_leaves())
-		return -EINVAL;
-
 	/*
 	 * hugepages can't be allocated by the buddy allocator
 	 */
diff --git a/mm/shmem.c b/mm/shmem.c
index bc2de3a7c1ea..8c0f7e3efeeb 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2046,11 +2046,14 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
 	unsigned long mask = READ_ONCE(huge_shmem_orders_always);
 	unsigned long within_size_orders = READ_ONCE(huge_shmem_orders_within_size);
 	vm_flags_t vm_flags = vma ? vma->vm_flags : 0;
-	unsigned int global_orders;
+	unsigned int global_orders, disabled_orders = 0;
 
-	if (!pgtable_has_pmd_leaves() || (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force)))
+	if (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force))
 		return 0;
 
+	if (!pgtable_has_pmd_leaves())
+		disabled_orders = BIT(PMD_ORDER);
+
 	global_orders = shmem_huge_global_enabled(inode, index, write_end,
 						  shmem_huge_force, vma, vm_flags);
 	/*
@@ -2058,7 +2061,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
 	 * sysfs configs.
 	 */
 	if (!vma || !vma_is_anon_shmem(vma) || shmem_huge_force)
-		return global_orders;
+		return global_orders & ~disabled_orders;
 
 	/*
 	 * Following the 'deny' semantics of the top level, force the huge
@@ -2072,7 +2075,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
 	 * means non-PMD sized THP can not override 'huge' mount option now.
 	 */
 	if (shmem_huge == SHMEM_HUGE_FORCE)
-		return READ_ONCE(huge_shmem_orders_inherit);
+		return READ_ONCE(huge_shmem_orders_inherit) & ~disabled_orders;
 
 	/* Allow mTHP that will be fully within i_size. */
 	mask |= shmem_get_orders_within_size(inode, within_size_orders, index, 0);
@@ -2083,6 +2086,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
 	if (global_orders > 0)
 		mask |= READ_ONCE(huge_shmem_orders_inherit);
 
+	mask &= ~disabled_orders;
 	return THP_ORDERS_ALL_FILE_DEFAULT & mask;
 }
 
@@ -5630,7 +5634,7 @@ void __init shmem_init(void)
 	 * Default to setting PMD-sized THP to inherit the global setting and
 	 * disable all other multi-size THPs.
 	 */
-	if (!shmem_orders_configured)
+	if (!shmem_orders_configured && pgtable_has_pmd_leaves())
 		huge_shmem_orders_inherit = BIT(HPAGE_PMD_ORDER);
 #endif
 	return;
-- 
2.55.0

