Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5021DF98F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790986905; cv=none; b=QSP4CIOjkE3EXdwfxeSC0vWu8OJnRgX6PJxtfI6Xiq5Zai3KfgWHROjlFw4cQhfvqONRm7vGNDJOu5EY//S1E1gUIP453/C5qo8kDBJYVTN4BqEeyfz3FwApHmpKWQe0/OQC+OkwpLQ+QqkJ0bpP/v1YD+xf4xM+8Fo/xruQBQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790986905; c=relaxed/simple;
	bh=VxJoLyHg8KTZvwB5zmlPofpY9L8wL0hy+/Q+WavjJFo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LSe13Z4LAvtECESxKaICRfgOBCCYZW2WMRAufe5/m5LaC2cjg+UMxELn4T6qJIFDL4IRRssqrCWXmJElKYEUSpl20u6BgilYlYvHDLhQfvoIbxTgokIubzs6TtPSAB+ojE2csu+KYE0cO6k3i6Yf8ZIF93/tYx+ojRQrX22sOYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GCg7DwSz; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GCg7DwSz"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso361988a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986902; x=1791591702; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDpWehmyXZTuwNLpOmNryZ2PSD85lfcY7+uhsZatBYE=;
        b=GCg7DwSzxlpGNK5Mtt3PILMahz+eUzG9BWv7MmNrA2rTAmINJEzVADe2cqO5ENEaxp
         NFYUjtMFphM3cZNPzgpMbV0bhWdzgTnnecMDQWHNqSEMJhBNapB1fqDpUIofGS6Czy5m
         VxLfM+cjOH6Eo83S9bo3t5pyOtYg3ZPaXMsmH6d+K1dsOSTQqYPhWdFcQp9qz/kvbJ2A
         whQFlqMTxHVpRUxAr+NpMatjcrmEQ7MDgdfh+2pUj6Stndcat3Ul4trRv3Hu/cQpDv8v
         AYj5uSGAsNqHi9/M5hqABUw3JyAlLVmn6aoBuFHp/JvRcD7lgc2e6KAeGrN8EbqoiZL4
         DkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986902; x=1791591702;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDpWehmyXZTuwNLpOmNryZ2PSD85lfcY7+uhsZatBYE=;
        b=pIAvgoQoDDw3Dpw/R/+oXoUKombtAgOr5aAscm+vQY4tvULno/vew7WDPjN9uhiLDd
         RHGSRJ7+8w3dv7AZ25iyJVu2hOqBnfVFVcZ6vyJQLaAdED/8YaXw0Vh/4p1n5V+eQLJy
         gXt5pn7GfWJIUEyPeNa2G6sxsPUQ7dbDuujzNkhDtEgwx4X4KNhXxa1u0F71PQWMnrFo
         tmUOUX/PEI2On+uWCCg9H9KdvtpWx9NggCQviXGPXpZokC/tlYGwRS9zbx2gBi3pFhkY
         i2L0tesjBG8cRcrDSC9oKSvueLtYwLC8eSqF69RzLXByD7IQxV3MfS5a4ObNX0pO/XUg
         h2zA==
X-Forwarded-Encrypted: i=1; AKwUvBxyeSGY0cyshpuxoAeUhGEajlHAhM6BDySmAMDdAnVm0Eb9OViT/SoHj9t0RHqYzrAjra0mSmtFWpW0be4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCQxVRfjlZ1uFIQuKGKQzGUeODkqYOMjVBaorbaipYVZPVgIiD
	f8ptEFphxXDzApgGOBbpexZ/kJQHO2JKEhjsmOFzRuS9GGitiAfC/vxHZEjbRDzs43FZcY+vQtG
	pv375N17IBx5ypnSrmjPM4Q==
X-Received: from pgbdn12.prod.google.com ([2002:a05:6a02:e0c:b0:cca:68cf:6f65])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4ac5:b0:3a0:ddef:3da3 with SMTP id 98e67ed59e1d1-3a4f32d94a2mr5433773a91.15.1790986901434;
 Fri, 02 Oct 2026 17:21:41 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:11 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-9-jthoughton@google.com>
Subject: [PATCH v2 08/20] hugetlb: Fully initialize tail struct pages of
 non-pre-HVOed bootmem folios
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

alloc_bootmem() marks all but the head struct page of a bootmem gigantic
folio as noinit, and gather_bootmem_prealloc_node() then only
initializes the first HUGETLB_VMEMMAP_RESERVE_PAGES struct pages. The
remaining tail struct pages are initialized only if the folio ends up
not being HVOed.

This assumes that a bootmem folio is either pre-HVOed, or will not be
HVOed at all. However, hugetlb_vmemmap_optimize_bootmem_page() may skip
pre-HVO because arch_hugetlb_vmemmap_optimization_supported() does not
yet return true that early in boot (e.g. on arm64, where support depends
on a system-wide CPU capability), while it does return true by the time
hugetlb_vmemmap_optimize_bootmem_folios() runs. Such folios are then
HVOed through the regular remap path with uninitialized tail struct
pages, which trips the PageTail() WARN in vmemmap_remap_pte().

Avoid this by initializing all tail struct pages up front in
gather_bootmem_prealloc_node() for folios that were not pre-HVOed. This
makes the HVO-failure fallback in prep_and_add_bootmem_folios()
unnecessary, as pre-HVOed folios are never passed through the regular
remap path, and all other folios now already have initialized tail
struct pages. A failed optimization either leaves the original vmemmap
in place or restores the tail struct pages from the shared tail page.
Remove the fallback.

For folios that are not HVOed at all, this does not change the amount
of initialization work, only where it is done.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4dac7ed1df57..e971e2362412 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3303,17 +3303,6 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	hugetlb_vmemmap_optimize_bootmem_folios(h, folio_list);
 
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
-		if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
-			/*
-			 * If HVO fails, initialize all tail struct pages
-			 * We do not worry about potential long lock hold
-			 * time as this is early in boot and there should
-			 * be no contention.
-			 */
-			hugetlb_folio_init_tail_vmemmap(folio, h,
-					HUGETLB_VMEMMAP_RESERVE_PAGES,
-					pages_per_huge_page(h));
-		}
 		hugetlb_bootmem_init_migratetype(folio, h);
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
@@ -3337,6 +3326,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		struct page *page = virt_to_page(m);
 		struct folio *folio = (void *)page;
 		const unsigned long pfn = folio_pfn(folio);
+		bool pre_hvo;
 
 		h = m->hstate;
 		/*
@@ -3350,11 +3340,23 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		VM_BUG_ON(!hstate_is_gigantic(h));
 		WARN_ON(folio_ref_count(folio) != 1);
 
+		pre_hvo = vmemmap_optimizable_order(pfn_to_section_compound_order(pfn));
+
+		/*
+		 * Pre-HVOed folios have their tail struct pages mirrored from
+		 * the shared tail page, so only the first vmemmap page needs
+		 * initializing. Otherwise, the tail struct pages (marked noinit
+		 * in alloc_bootmem()) must all be initialized now: the folio
+		 * may still be HVOed via the regular remap path (e.g. if the
+		 * architecture could not determine HVO support at bootmem
+		 * allocation time), which expects valid tail pages.
+		 */
 		hugetlb_folio_init_vmemmap(folio, h,
-					   HUGETLB_VMEMMAP_RESERVE_PAGES);
+					   pre_hvo ? HUGETLB_VMEMMAP_RESERVE_PAGES :
+						     pages_per_huge_page(h));
 		init_new_hugetlb_folio(folio);
 
-		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
+		if (pre_hvo)
 			folio_set_hugetlb_vmemmap_optimized(folio);
 		section_set_compound_order_range(pfn, folio_nr_pages(folio), 0);
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

