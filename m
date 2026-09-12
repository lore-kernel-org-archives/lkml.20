Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D3447CA6E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216116; cv=none; b=gWRhX/Ux0jvOMnuPHbp8wSxpt6+l5iCmz0ILFB7bznvC3TGAE4A2Mv7906rv8cGcCbiMF5HrjtxyBPkp9S8KsaDr4/MVIUDNZiaNhGcUDisVvZ8HM4rpYlFXhAjh2gpZSkrSwDDUV4cZenW5lqFITUrDAe9iRFmjMDYzjJHjkg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216116; c=relaxed/simple;
	bh=UEfjtaP+OjZfpUGS2B7a5BTw/P5s5UMLg0m29u/MkCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nVitQglPs8rf/L/8mJCff8wAalhRqTB2uy4NE13huxmFr5QeyLMEyrPWzIkfy5gxQQ/xxId81AlbVol2iBh/sKt3DrtRPtu017PfaaZiNGw7YUdwmUHOqOrib0VqBx6Iu14P+YR5WUCI9Ygkp/ifYx8mrSP9PXCkJdl8A/xvM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=PzY1BsZe; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="PzY1BsZe"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb7692a57so5440501cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789216114; x=1789820914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJXH9rrJbZbgym50NMM/+P+67cMUDF3IUxD6O+4ZOuc=;
        b=PzY1BsZeB34yYpF6aAkHGcZER2wdBN+Q0+slK07ZNp4fmrDxqF1enSV618spjWCcAn
         ssCputSccsXGMHyvZJxeWHNBewFM95YapJJvGTmS38DYNNPcUMaFwucyTPKSEm4vb4u2
         cSSTZ/QOD6wkzOAxC64TcIRXzMJPPkmf+RyWjp+/LdqjZTgRvvnEWnyi6z4RQohZBu93
         sHZZH5wU+AD7W1BxPjb8WC7MCcymf8w9knqxISx9kfvCIFbZ0vaP94hr1OA1F1L0XYHx
         GF/ECDIt+U86egjq0XUBVOwxR/YUrkdj/azpCeXfUgsQaNY3d7T12FoJerj+fdoRHj3J
         hrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216114; x=1789820914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJXH9rrJbZbgym50NMM/+P+67cMUDF3IUxD6O+4ZOuc=;
        b=aRdl5DaJLVcgszRipIR+wEZtmiyFxU//n7cRmloI6bpMVP9suj9yQTNpdhLd06b1CJ
         UVpuy1o8s9u02g4HUS38XBjljwL56bWVIz4d5cOy+5DGaP45W+lTOTW8Rxr2cOdN0iMT
         OnLSmMfx1t0XT/hu+nnUMAUyqTVBIBPSCXFlLJvz7quaokM1Q5Av2zr+77yowSH1e95V
         9kLvhX0HsfmGXhthL9dKbwOOtEzYGQqKPtGPPzAnSyMqaP67UCEEZDAgvMehhbuett95
         58//QLR3m1fcENEBK1uaTDOvZD73FkRaID4onWkH8hMRT5zqg5OUb3KN6UOovQh+WcWn
         efBw==
X-Forwarded-Encrypted: i=1; AKwUvByodfTZBGpkJfP8m54Lz+Uq8s/W4xz7Do0Pdx6baf8+zLiMgFgLZb3EYNqHcNpwGQ/D8KKWdFq7HveA+fc=@vger.kernel.org
X-Gm-Message-State: AFuF++kUWuELHpy+m3/LH4NdmY4PSZVAoQuIXJeGLgrPZnZt9OfXgY3s
	3AWOE2e5QUwvaTJmGfH7hrBmDZrqE08pmS2zcVVor+TV3thbr9eCl+n/SnXgHE/FOvE=
X-Gm-Gg: AYBFou0sarqFI5CyuE7/QHOX4gvnf2i3XsOylArJfWHPlyK5g5UMZARY5nkOrUq2kZi
	isWz0qNS9m+DRuznpTy9N9Lay+JGpGaKaQ8uu+9Wo+zqHQypL2zX05YCuZ+ygpdJymYZlkVaV3M
	BTN/YWgGgPpg4FNaN1RqvvJpIlklb/N/Ddm3lM2WOgPubXU2h4LmhDNMkMHIRwnuq34/OsWnVSI
	LjJqqDzf8JotuYH5o8SrAJvoV99t3cXpKfdcyP0PcOc2nmoMsuDqJmpJvzppbXc7OgTB0etUpgX
	a3TN4FvkHf58xUTXmIi65ckFTEc3qoYzgvjPaPR532KA/qb/NoP23knpbdjo4zS0KzjodyeRcKE
	JTODYtpvAda+CcelTgi6bhD7sSKxNGIFtUUYnnXn4hJ+Sp47eVsDU9pivnFR3cvqLX7z0Q81fg7
	0e86Ax7heJx7M7JJcElZXsMRLbvGhDEM3yRdrplVJRcdcxY63UEQOmtfYP4/oQaQsDOgMk0Dqm1
	pkfyFRcadr9b2lZZqyElDXi0C4GdjSwGN3d4Y+HVgocSmoOXz1K7/1Q2Rc7
X-Received: by 2002:a05:622a:1f8b:b0:530:42e5:f3a4 with SMTP id d75a77b69052e-530e81e3f69mr37044771cf.45.1789216113681;
        Sat, 12 Sep 2026 05:28:33 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530e64da059sm17780461cf.24.2026.09.12.05.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:28:32 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	peterx@redhat.com,
	jgg@ziepe.ca,
	david@kernel.org,
	sashiko-bot <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] proc/task_mmu: handle special PMDs in clear_refs and pagemap
Date: Sat, 12 Sep 2026 08:28:22 -0400
Message-ID: <20260912122822.3348978-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mshv_vtl_low can install a special PMD from a PFN supplied in the mmap file
offset.  That PFN need not have a memmap entry.  Reading /proc/PID/pagemap
or writing /proc/PID/clear_refs for such a mapping oopses the kernel.

With a test driver mapping the PFN at the 1 TiB mark:

  echo 1 > /proc/self/clear_refs

  BUG: unable to handle page fault for address: fffffb5b80000008
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  RIP: 0010:clear_refs_pte_range+0xb1/0x1e0
  Call Trace:
   walk_pgd_range+0x50a/0xad0
   __walk_page_range+0x6a/0x1d0
   walk_page_range_mm_unsafe+0x193/0x230
   clear_refs_write+0x18e/0x3f0

  pread(pagemap_fd, buf, 512 * 8, addr / PAGE_SIZE * 8)

  BUG: unable to handle page fault for address: fffff57840000008
  RIP: 0010:pagemap_pmd_range+0x3cf/0x6b0
  Call Trace:
   walk_pgd_range+0x50a/0xad0
   __walk_page_range+0x6a/0x1d0
   walk_page_range_mm_unsafe+0x193/0x230
   pagemap_read+0x1dc/0x350

clear_refs_pte_range() passes the PMD to pmd_folio(), while
pagemap_pmd_range_thp() uses pmd_page() followed by page_folio().

Both paths assume the PFN has a struct page and dereference bad address.

Use vm_normal_folio_pmd() and vm_normal_page_pmd() so clear_refs skips
folio operations and pagemap skips folio-derived flags for special PMDs.
This matches the PTE paths, which already use vm_normal_folio() and
vm_normal_page().

User-facing notes:
 - Pagemap still reports PM_PRESENT and the PFN to a CAP_SYS_ADMIN reader.

 - For a special PMD backed by a valid memmap entry and for the huge
   zero PMD, PM_FILE changes from set to clear.

 - PM_MMAP_EXCLUSIVE is already clear in both cases.

 - The output for an anonymous THP is unchanged.

Tested in QEMU with the test driver on broken and fixed kernels.  Both proc
operations oops before the fix and return 0 after it.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260912034833.2952750-1-gourry%40gourry.net
Fixes: 3c8e44c9b369 ("mm: mark special bits for huge pfn mappings when inject")
Cc: <stable@vger.kernel.org> # v6.19+
Assisted-by: LLM
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 fs/proc/task_mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 24425e230895..501cd038b4e4 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1671,7 +1671,9 @@ static int clear_refs_pte_range(pmd_t *pmd, unsigned long addr,
 		if (!pmd_present(*pmd))
 			goto out;
 
-		folio = pmd_folio(*pmd);
+		folio = vm_normal_folio_pmd(vma, addr, *pmd);
+		if (!folio)
+			goto out;
 
 		/* Clear accessed and referenced bits. */
 		pmdp_test_and_clear_young(vma, addr, pmd);
@@ -1991,7 +1993,7 @@ static int pagemap_pmd_range_thp(pmd_t *pmdp, unsigned long addr,
 		goto populate_pagemap;
 
 	if (pmd_present(pmd)) {
-		page = pmd_page(pmd);
+		page = vm_normal_page_pmd(vma, addr, pmd);
 
 		flags |= PM_PRESENT;
 		if (pmd_soft_dirty(pmd))
-- 
2.55.0

