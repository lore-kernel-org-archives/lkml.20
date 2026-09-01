Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528AD43E09D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 03:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232420; cv=none; b=YPvIfe7+DuhDjugEPwZXckqrTvt7wSeu+XmwqJO+etM9cQiluLVHlFSxDzHTILTrOAS06WbA/f2Nr6DArrtDr/IFVuVGUSEDi3+A0e5lilHHMyEedJVcfTMQTO/bR1SfQrSc3x83qPGOre7Ly+Edgi3NlYPOSTgyrCd7MagZTlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232420; c=relaxed/simple;
	bh=+bd2H53wRi6FQqvBoWH4vwhxT8wG1AQb/PQyQULszOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOigNE+JL3VCXHcAHjLWsJ8uGqK73cePkKAafT9GEDiYZXZVcCdDw7hmPu7VloDrGQ2hCu7gd7ZYjqNK4bWhM/3PHJoAc/f0McRvyLrGf2H9CC4s66SvaRXZKQtO8tpCV/4Bn1ZTfqiwOH8UmVgjpwL4djBM5jokSjd/mRoPgH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ifWJ76o6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ifWJ76o6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788232418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfgDDE8CEmW1Q+z8UseKVnUMAM5pqEP/DOHTfkRU7Ug=;
	b=ifWJ76o6kK2ZpC6YgqJb7r+zxm0NGrk4oXQyke23mK/WJqKAxr485ieMoBvfaYmYUxOBVP
	P7+woRaIPGG1DdIumiGKvlnUqY3pNhieJI6YLNj5G/B3rvJoyZDgLa0doyU86+9PbhNLnT
	UUCz276Rkt9PnTYEpi/Ygwm5mp41iAo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-241-6imlDJqgPaWD4O50xf4G0g-1; Mon,
 31 Aug 2026 23:13:36 -0400
X-MC-Unique: 6imlDJqgPaWD4O50xf4G0g-1
X-Mimecast-MFC-AGG-ID: 6imlDJqgPaWD4O50xf4G0g_1788232412
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 75CD218345AD;
	Tue,  1 Sep 2026 03:13:32 +0000 (UTC)
Received: from fedora.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF52518005B8;
	Tue,  1 Sep 2026 03:13:28 +0000 (UTC)
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
Subject: [PATCH v7 13/14] mm: replace thp_disabled_by_hw() with pgtable_has_pmd_leaves()
Date: Mon, 31 Aug 2026 23:12:17 -0400
Message-ID: <aff69c99f6679c4933103b86c0e3dbe19dc6ce05.1788232334.git.luizcap@redhat.com>
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

Despite its name, thp_disabled_by_hw() just checks whether the
architecture supports PMD-sized pages. It returns true when
TRANSPARENT_HUGEPAGE_UNSUPPORTED is set in transparent_hugepage_flags,
this only occurs if the architecture implements arch_has_pmd_leaves()
and that function returns false.

Since pgtable_has_pmd_leaves() provides the same semantics, use it
instead.

Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 include/linux/huge_mm.h | 7 -------
 mm/huge_memory.c        | 6 ++----
 mm/memory.c             | 2 +-
 mm/shmem.c              | 2 +-
 4 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index c745f7ad2298..525acea2eb59 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -47,7 +47,6 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
 				bool write);
 
 enum transparent_hugepage_flag {
-	TRANSPARENT_HUGEPAGE_UNSUPPORTED,
 	TRANSPARENT_HUGEPAGE_FLAG,
 	TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
 	TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG,
@@ -383,12 +382,6 @@ static inline bool vma_thp_disabled(struct vm_area_struct *vma,
 	return mm_flags_test(MMF_DISABLE_THP_EXCEPT_ADVISED, vma->vm_mm);
 }
 
-static inline bool thp_disabled_by_hw(void)
-{
-	/* If the hardware/firmware marked hugepage support disabled. */
-	return transparent_hugepage_flags & (1 << TRANSPARENT_HUGEPAGE_UNSUPPORTED);
-}
-
 unsigned long thp_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags);
 unsigned long thp_get_unmapped_area_vmaflags(struct file *filp, unsigned long addr,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 469d98e01b5f..d5e65cac6a16 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -204,7 +204,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 	if (!vma->vm_mm)		/* vdso */
 		return 0;
 
-	if (thp_disabled_by_hw() || vma_thp_disabled(vma, vm_flags, forced_collapse))
+	if (!pgtable_has_pmd_leaves() || vma_thp_disabled(vma, vm_flags, forced_collapse))
 		return 0;
 
 	/* khugepaged doesn't collapse DAX vma, but page fault is fine. */
@@ -1095,10 +1095,8 @@ static int __init hugepage_init(void)
 	int err;
 	struct kobject *hugepage_kobj;
 
-	if (!arch_has_pmd_leaves()) {
-		transparent_hugepage_flags = 1 << TRANSPARENT_HUGEPAGE_UNSUPPORTED;
+	if (!pgtable_has_pmd_leaves())
 		return -EINVAL;
-	}
 
 	/*
 	 * hugepages can't be allocated by the buddy allocator
diff --git a/mm/memory.c b/mm/memory.c
index ed5029745dfb..6be55fc39383 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5611,7 +5611,7 @@ vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio, struct page *pa
 	 * PMD mappings if THPs are disabled. As we already have a THP,
 	 * behave as if we are forcing a collapse.
 	 */
-	if (thp_disabled_by_hw() || vma_thp_disabled(vma, vma->vm_flags,
+	if (!pgtable_has_pmd_leaves() || vma_thp_disabled(vma, vma->vm_flags,
 						     /* forced_collapse=*/ true))
 		return ret;
 
diff --git a/mm/shmem.c b/mm/shmem.c
index c285cb7fd32e..73281fa060ed 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2047,7 +2047,7 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
 	vm_flags_t vm_flags = vma ? vma->vm_flags : 0;
 	unsigned int global_orders;
 
-	if (thp_disabled_by_hw() || (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force)))
+	if (!pgtable_has_pmd_leaves() || (vma && vma_thp_disabled(vma, vm_flags, shmem_huge_force)))
 		return 0;
 
 	global_orders = shmem_huge_global_enabled(inode, index, write_end,
-- 
2.55.0

