Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574334D6C4A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957159; cv=none; b=AIr/O6ZzHCgUdPbVCrmkzVDgb2e0nQcVVRbeLI09OZuBqzdawl3vMGFSA0bX3M0Z4JvAHV1NRjgK3pSGyt1ML7F1Imhd2z9CAhGG6sz4YQLIUL9HoiHzsGOOkYO0V51dwTG9OEur+51p6/6a3pIssUce0kiC2SUSvgqEv/Ju+Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957159; c=relaxed/simple;
	bh=I1y1TYBrGFAZkPhkH3xdRNzsXp/B6zAtvFN/DO/6NW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fknYvZxZVzXobh6ACCiXN4xhrJN2u4Wvsb6N5qsJHDoT2YjyrB4vz221ElJ4/K9y24H/TQOszTwlu6Z2p5Hzjm4CuMafEWB9e/WIyAQc5lxXEk+0hGwBUr0EhKcN5sNDc3MeYS5u5AcB1JyZhuPWoRVvYU/CquCgXifOPfJNWT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfV7FTyK; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfV7FTyK"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24afso56854a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790957157; x=1791561957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lG3PpTqvVPLXojPqrH3nBXhf48twgkVhGAKUdsEB68=;
        b=GfV7FTyKCjfP/OP8hhZtI/c1E5IQA+U/mXUBOSY3T2uIaZM2MFylln4H+U+uMzIZLO
         3PkriiXVTwuexHfx6MjyUhXAKJyLnSV8E+FdkWrNMnWvAp8Z/QdfJTzTxhCRNiM/hinC
         NR3V18anUESf0dHT6rv+MZyKMDRPqSGHunU1lc+zK9CUIZgOUNsAL+yi07ogdXJmNL74
         fhZZSOxsKSOm8ByrxFaqn/3viRg6gHmwcQ0HPFqVgHlZ3PH+0vfiH2We37oUfhTfeRQq
         xLxv6XlqAXOtSKJ17gZRmJ5SSKIV7Q3Z6P6B/mg3f2FqQo5kpA4Cn5eCiY69hnWHIjTG
         J0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957157; x=1791561957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+lG3PpTqvVPLXojPqrH3nBXhf48twgkVhGAKUdsEB68=;
        b=w0XCcvSymGVUDXN/s5rDLEHnT8qdyR5cA2QPt2sxFlBYXxcSGouhMCJ/tOYLygw1bn
         auFKA9iv5rSYGN3qLMLcpQKpIOZmiLmnewRBr41TZyhyqvlZNuLquIADjzKk6V00M7yY
         tkWrpBJikeV1qrXIGCXfZKC+b/p1PGNyktPAYG4v3HYR7d8HXHsPZWE8Io/rokQPJXVd
         1dytDoSOHAHOBM3E9XI1cvDVNQuqImdgiX88q2mz/+h6LtmAN0jKuWU5ksUyZ0sTEFzb
         X0KG/esJl4ZznQKAJN0qehgi6Xt2hWHAYiVi+l0X67yqxbz3fR/LXlf17McmpvoZogQ2
         RVVg==
X-Forwarded-Encrypted: i=1; AKwUvBz2rov/tM1fvkzalhiZEh8cHxwMtVko399frZnQ6JWz19Vz8FmqY9vt103ann7I44dTKmt4fznJ7IVtvd8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwosfVLFoy1eQRukiR5H1K5xEifLjIZ+/Wi8tPBrFVHY7fAp13
	sPEVDR3qhuU/WH8ODGcArblUlnHLqkH38U5ggkOYDFrdbv3TyUJJaHSd
X-Gm-Gg: AYBFou0F7u0yUkyauTm14xing/S6GBxjFsS39LoCr+hk+FfCjNTSZXyAC4PYN6s3JHk
	yVxp7BuxUb+CROTF8JGXGZ5IiyVM3KWeJhctipCc0HA0hsECi0rWX8Jm5ZMx4zNap8GPHFc5drB
	gtFJm9JGHywSuoUkmmZiOluep5Gl/jENAcXIhQg9DszyHQn+mmhkKZBa5LxmuL1eFwuhsCNoeaF
	uRt+Ree2d4B0A8k8gELcY91BXXDEhy9kiYLO/X/P2xnl9z5TI7hz7UIWSONaOxFdppofcXwkQqe
	AC72ILvGKBQIzK/OrAxCFqcqFIIlQO6Ve2xk0BxLuYZ1EAcQnZ1pQKyeilb51d/79jPGy40WZwG
	IIlFhp5NU8Y7e7SUHzsxMOnhrDfZZpPeILXu1Y4hn/Hlt/osYvaztcYWR+wevxjPS33ppsYVi3p
	V3zYxtJEdHfvB4Yn+SAGWKT1fFMDns+sjZcUyfMMqGw/YbLKeS9yDrB28pOLYZszsH+fXuwqmTr
	Ptm8nIy02rhoEm2JnRbvwM7
X-Received: by 2002:a17:90b:3e86:b0:3a1:66fd:94af with SMTP id 98e67ed59e1d1-3a6ce7f67b5mr1330919a91.37.1790957157521;
        Fri, 02 Oct 2026 09:05:57 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cb357sm9375672a91.17.2026.10.02.09.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:05:57 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	"Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [PATCH v2 2/3] mm/memory: remove the mkwrite argument from __vm_insert_mixed()
Date: Sat,  3 Oct 2026 01:05:33 +0900
Message-ID: <20261002160535.661399-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002160535.661399-1-ekffu200098@gmail.com>
References: <20261002160535.661399-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__vm_insert_mixed() is only called from vmf_insert_mixed() with
mkwrite == false, so mkwrite is also always false in vm_mixed_ok()
and insert_pfn().

So remove the argument and the unreachable code in insert_pfn().

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 mm/memory.c | 57 +++++++++++++++++------------------------------------
 1 file changed, 18 insertions(+), 39 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 4b2e4be28031..6c1d38eba7b2 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2453,7 +2453,14 @@ static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
 		if (!mkwrite)
 			return -EBUSY;
 
-		/* see insert_pfn(). */
+		/*
+		 * For read faults on private mappings the PFN passed in may
+		 * not match the PFN we have mapped if the mapped PFN is a
+		 * writeable COW page.  In the mkwrite case we are creating a
+		 * writable PTE for a shared mapping and we expect the PFNs to
+		 * match. If they don't match, we are likely racing with block
+		 * allocation and mapping invalidation.
+		 */
 		if (pte_pfn(pteval) != page_to_pfn(page)) {
 			WARN_ON_ONCE(!is_zero_pfn(pte_pfn(pteval)));
 			return -EFAULT;
@@ -2858,7 +2865,7 @@ int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
 EXPORT_SYMBOL(vm_map_pages_zero);
 
 static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
-			unsigned long pfn, pgprot_t prot, bool mkwrite)
+			unsigned long pfn, pgprot_t prot)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pte_t *pte, entry;
@@ -2868,38 +2875,12 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 	if (!pte)
 		return VM_FAULT_OOM;
 	entry = ptep_get(pte);
-	if (!pte_none(entry)) {
-		if (mkwrite) {
-			/*
-			 * For read faults on private mappings the PFN passed
-			 * in may not match the PFN we have mapped if the
-			 * mapped PFN is a writeable COW page.  In the mkwrite
-			 * case we are creating a writable PTE for a shared
-			 * mapping and we expect the PFNs to match. If they
-			 * don't match, we are likely racing with block
-			 * allocation and mapping invalidation so just skip the
-			 * update.
-			 */
-			if (pte_pfn(entry) != pfn) {
-				WARN_ON_ONCE(!is_zero_pfn(pte_pfn(entry)));
-				goto out_unlock;
-			}
-			entry = pte_mkyoung(entry);
-			entry = maybe_mkwrite(pte_mkdirty(entry), vma);
-			if (ptep_set_access_flags(vma, addr, pte, entry, 1))
-				update_mmu_cache(vma, addr, pte);
-		}
+	if (!pte_none(entry))
 		goto out_unlock;
-	}
 
 	/* Ok, finally just insert the thing.. */
 	entry = pte_mkspecial(pfn_pte(pfn, prot));
 
-	if (mkwrite) {
-		entry = pte_mkyoung(entry);
-		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
-	}
-
 	set_pte_at(mm, addr, pte, entry);
 	update_mmu_cache(vma, addr, pte); /* XXX: why not for insert_page? */
 
@@ -2967,7 +2948,7 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 
 	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
 
-	return insert_pfn(vma, addr, pfn, pgprot, false);
+	return insert_pfn(vma, addr, pfn, pgprot);
 }
 EXPORT_SYMBOL(vmf_insert_pfn_prot);
 
@@ -2998,11 +2979,9 @@ vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 }
 EXPORT_SYMBOL(vmf_insert_pfn);
 
-static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn,
-			bool mkwrite)
+static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn)
 {
-	if (unlikely(is_zero_pfn(pfn)) &&
-	    (mkwrite || !vm_mixed_zeropage_allowed(vma)))
+	if (unlikely(is_zero_pfn(pfn)) && !vm_mixed_zeropage_allowed(vma))
 		return false;
 	/* these checks mirror the abort conditions in vm_normal_page */
 	if (vma->vm_flags & VM_MIXEDMAP)
@@ -3013,12 +2992,12 @@ static bool vm_mixed_ok(struct vm_area_struct *vma, unsigned long pfn,
 }
 
 static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
-		unsigned long addr, unsigned long pfn, bool mkwrite)
+		unsigned long addr, unsigned long pfn)
 {
 	pgprot_t pgprot = vma->vm_page_prot;
 	int err;
 
-	if (!vm_mixed_ok(vma, pfn, mkwrite))
+	if (!vm_mixed_ok(vma, pfn))
 		return VM_FAULT_SIGBUS;
 
 	if (addr < vma->vm_start || addr >= vma->vm_end)
@@ -3045,9 +3024,9 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
 		 * result in pfn_t_has_page() == false.
 		 */
 		page = pfn_to_page(pfn);
-		err = insert_page(vma, addr, page, pgprot, mkwrite);
+		err = insert_page(vma, addr, page, pgprot, false);
 	} else {
-		return insert_pfn(vma, addr, pfn, pgprot, mkwrite);
+		return insert_pfn(vma, addr, pfn, pgprot);
 	}
 
 	if (err == -ENOMEM)
@@ -3086,7 +3065,7 @@ EXPORT_SYMBOL_GPL(vmf_insert_page_mkwrite);
 vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
 		unsigned long pfn)
 {
-	return __vm_insert_mixed(vma, addr, pfn, false);
+	return __vm_insert_mixed(vma, addr, pfn);
 }
 EXPORT_SYMBOL(vmf_insert_mixed);
 
-- 
2.43.0

