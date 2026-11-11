Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406042;
	b=D15aqjqN0IIlRPcCEKXYtl39mbW8t5j06cmcLj4COepwe2B1qT5Kvtj65QeYVU/oQcs0
	 Ll+wmUEbBcyYsKFzOLrwAT56ri23NbT63V3N27aFPmAp+M2EQud2ILYggY2dVqQph5dCm
	 LEcCN7J7FqxNfE0+pvaah5RzbM6HHxIMeLE7uDkcRikBi3FX5r+MW75hTH2g7rhOC9FYi
	 8M2reFz9AP5jPOZWnigGlXmIoyGSduK9IOssw18MN63cSYs8y0qESTFRKIRK49ptq4C4M
	 M1CHOL45RCBfD9ZyoZwR+adE2UG+YkHSRCeWqz+d0H9yAEOeoxlHk2lFRJd8cz8TyFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406042;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=lVZxSALvPLQtQckREU8FaHhYXclhVaj+hUxcL54vQWM=;
	b=1MPVxEMzxm99UnXEbrNSBEECaDMX2l96CWkv7bQoXlpxdYXBGoaZjdxfQL4/BYsgyJfH
	 1PYexUTjzY047ZVO4aaJlOvXFCIPMobDsUOrWU8rfiF2v8PWx8e8BjJ7VXo+h6svz+aOz
	 8TXEo08NBnkBr7RTPn9pP6o4JQsHSzbPEop0pxOgVNJnHLkumBKHfg3Wck2inaGzkiqYx
	 v6x4+tC2o6qdOxdflHP/1vAi+Gf1xbIe9dTiBvb8p29hZnZFWfyFfIxjmJ0Pqi2BuJYgQ
	 0aMge+arWTwVzh84gQ0Yr5mQCGPXZ51Dvr63lmFH1MXMN++czI+sVAULCIV0+VxD+Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=YKkvP8hW;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF01F606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF01F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=YKkvP8hW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794406041; x=1825942041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lVZxSALvPLQtQckREU8FaHhYXclhVaj+hUxcL54vQWM=;
  b=YKkvP8hW51zAnDFH3IQhQOoqLRgfl7O3JDu0Uz+urb7aLM5V0oJySJ0W
   cEYI90WfAPKsVlRIjsdw/0EXXxUuVnAqcIwTyMnkI8GxWby4xpc44lmqB
   XbaUVBUH5lD9sIj3uPOsvkxbfB7sgxbbz/TcKvaKJiJdlQD9YO9/NFbCJ
   Ms1UoM9XYOoFu+bjUroOzzmPt8plW96xBVUCe5tkY7LLtTBYf8r5Qd23h
   zWrYBsdWlsOrOLZ2R+SBh5yS/GnLDfJ9za+KJCfwV9NJFZpCR5gIp8GM9
   aAdk/zzkM9m1YBcoiwNHAykBgktpz7xiWIHFs+3PgFjCmy8Dm9kiP68+z
   w==;
X-CSE-ConnectionGUID: NNXseI6hQE+s2IU6JgsNtg==
X-CSE-MsgGUID: f9zBXLSRSSC0WZyTNPcImA==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33633315"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 14:07:21 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:24048]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.255:2525] with esmtp (Farcaster)
 id e6d02c34-35ef-4d4c-b7a9-eec495468fd7; Wed, 11 Nov 2026 14:07:21 +0000 (UTC)
X-Farcaster-Flow-ID: e6d02c34-35ef-4d4c-b7a9-eec495468fd7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 14:07:20 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 11 Nov 2026
 14:07:16 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
	<baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, <x86@kernel.org>, William Kucharski
	<william.kucharski@linux.dev>, Vishal Moola <vishal.moola@gmail.com>, "Alex
 Williamson" <alex@shazbot.org>, Peter Xu <peterx@redhat.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Eliav Farber
	<farbere@amazon.com>
Subject: [PATCH 4/4] mm/huge_memory: use the large-page PAT encoding for huge pfn mappings
Date: Wed, 11 Nov 2026 14:06:55 +0000
Message-ID: <20261111140655.34281-5-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111140655.34281-1-farbere@amazon.com>
References: <20261111140655.34281-1-farbere@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

insert_pmd() and insert_pud() build the entry from the pgprot that
vmf_insert_pfn_pmd()/_pud() took from vma->vm_page_prot and passed
through pfnmap_setup_cachemode_pfn(). That pgprot carries the PTE-level
cache mode encoding, but x86 keeps the high PAT bit at bit 7 for a PTE
(_PAGE_BIT_PAT) and at bit 12 for a PMD or PUD (_PAGE_BIT_PAT_LARGE),
where bit 7 is _PAGE_PSE.

A memtype that needs that bit, write-through or write-protected, loses
it: the cache mode index of the huge entry drops from 4-7 to 0-3, so a
write-through range is mapped write-back. The other x86 paths that build
a large entry from a PTE pgprot convert it first, see populate_pmd() and
populate_pud().

Convert in the two huge pfn paths. Add a generic pgprot_4k_2_large()
that returns its argument unchanged, so that only architectures which
encode the levels differently have to define it, and x86's existing
definition is picked up.

The folio paths keep using vma->vm_page_prot as is. They map
struct-page-backed memory, which x86 maps write-back.

Fixes: 6857be5fecae ("mm: introduce ARCH_SUPPORTS_HUGE_PFNMAP and special bits to pmd/pud")
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 arch/x86/include/asm/pgtable_types.h | 2 ++
 include/linux/pgtable.h              | 9 +++++++++
 mm/huge_memory.c                     | 4 ++--
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index b1a669e775f4..b1ffd72e47ef 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -497,6 +497,8 @@ static inline pgprotval_t protval_4k_2_large(pgprotval_t val)
 	return (val & ~(_PAGE_PAT | _PAGE_PAT_LARGE)) |
 		((val & _PAGE_PAT) << (_PAGE_BIT_PAT_LARGE - _PAGE_BIT_PAT));
 }
+
+#define pgprot_4k_2_large pgprot_4k_2_large
 static inline pgprot_t pgprot_4k_2_large(pgprot_t pgprot)
 {
 	return __pgprot(protval_4k_2_large(pgprot_val(pgprot)));
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b..112814d31f0c 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1787,6 +1787,15 @@ void arch_sync_kernel_mappings(unsigned long start, unsigned long end);
 #define pgprot_mhp(prot)	(prot)
 #endif
 
+/*
+ * Convert a pgprot built for a PTE so that it can be used in a PMD or PUD
+ * entry. Only needed on architectures that encode attributes differently
+ * between the levels; elsewhere the pgprot is used as is.
+ */
+#ifndef pgprot_4k_2_large
+#define pgprot_4k_2_large(prot)	(prot)
+#endif
+
 #ifdef CONFIG_MMU
 #ifndef pgprot_modify
 #define pgprot_modify pgprot_modify
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 052c50dadc48..945d480c1512 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1675,7 +1675,7 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
 		}
 	} else {
-		entry = pmd_mkhuge(pfn_pmd(fop.pfn, prot));
+		entry = pmd_mkhuge(pfn_pmd(fop.pfn, pgprot_4k_2_large(prot)));
 		entry = pmd_mkspecial(entry);
 	}
 	if (write) {
@@ -1804,7 +1804,7 @@ static vm_fault_t insert_pud(struct vm_area_struct *vma, unsigned long addr,
 		folio_add_file_rmap_pud(fop.folio, &fop.folio->page, vma);
 		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PUD_NR);
 	} else {
-		entry = pud_mkhuge(pfn_pud(fop.pfn, prot));
+		entry = pud_mkhuge(pfn_pud(fop.pfn, pgprot_4k_2_large(prot)));
 		entry = pud_mkspecial(entry);
 	}
 	if (write) {
-- 
2.47.3

