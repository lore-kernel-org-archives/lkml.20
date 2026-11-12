Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.12.53.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460508;
	b=arfntzT4uhmjrB/DCjF+lvcqAgE3RDNvwd6e6Kr+FrPv/KS+RRVwTJb+zvTsZmH0/v+K
	 /QoA+lneL7YN4X1GvnyH/bv0HnoFb7ODiGckPj7DWM+HBNBDMmf8FXubUxM0CtdJ359+v
	 I/gJ4CZfsy/afFW1AOueiYA6IorS+LWCas39x1bxDZ8oddYAsT9MRjOpA7oLt9GRpS64Q
	 w81SWxUYFpy84gSb3owYOHX/OTt/sJEOUKh15b95y6dozKqO8Bzfh2wfhEhUfdSJBMEDB
	 sWDrGnLnPMnbCPyjJN6cKMQnijZ15mnBf/EjzO6x0reAbUSYfAoWNdvAw4wsyNM5wMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460508;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=jhZg2aD8gryvvLCiESPcOzSWP2UR5KQYTO3P8Tzsy+I=;
	b=khtWerJHgV37n481sTrTuMJ9plfpiFI5aIXB1/RiMex6WqmOgkLJKCGwBRiZtZbRfFuW
	 qC3Sandksmc+xgMgiUkhEUZiKV+otKj2xLDCAq4s7AghnmnexHPZEnQRHKRak/KY3XVYL
	 mcSazrCZBrAx+sBwE2LNcQChu1HBgrqkg8utVTvilHfGbWw2EvpQWE+hBPMihDQMd9r3H
	 WCSyxGWig5dWapo84y5VpF7f1cMGrjKyDvwiwbClQ+hbF3Eu0pmz/SXsqCBRE+0gdQ5Xo
	 8OpavPK+rc42tU5sg/Nhcx+lpavgWOXugaAi15xS231yv4NRm3EUPCsr4MdD7cEMsVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b="h7bTPZW/";
	arc=none smtp.remote-ip=52.12.53.23
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAAE606A888
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADAAE606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=h7bTPZW/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794460507; x=1825996507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jhZg2aD8gryvvLCiESPcOzSWP2UR5KQYTO3P8Tzsy+I=;
  b=h7bTPZW/oWZDWAaqhP4xayWzbPGRMBP5sYRKjfTzOjyGaz8mh39hMBCU
   thigIlSkotZiI9P/z7w2AbLjoO6rYx1huJZ2e8XDdY8tcZ9nkghZk97ll
   5n+c3Ad2gW/nBb3EUJMLlnguDdmvLhG3VWxc6Jo/pYM3GHNClvSdV2+YB
   Vg1Jp9Vhw8KrQgxmmRQdaB2YElGaQivOQslk0R6/4YZGJHkKxRtnL51i6
   /mv5E53RBRd4IgZz7BjdlGltl8l9Mzsvddx/ItU9yHZPAZAJ8+Ukmccvf
   RVoRB1ckdRbxFgBBMLU2BzNUnADK/wrW5Htlq/GFa33X9PO4t3IlvMAe8
   g==;
X-CSE-ConnectionGUID: u/5EmYrITY+5rEHpcvSW9A==
X-CSE-MsgGUID: el2/zWsiT1KgeBa9Juocew==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="33650587"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:15:07 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:23490]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.141:2525] with esmtp (Farcaster)
 id d1a65dbb-a46b-46bc-bd0a-a5bc78964208; Thu, 12 Nov 2026 05:15:07 +0000 (UTC)
X-Farcaster-Flow-ID: d1a65dbb-a46b-46bc-bd0a-a5bc78964208
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 05:15:06 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 05:15:02 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Zi Yan <ziy@nvidia.com>
CC: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Baolin
 Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>,
	"Ryan Roberts" <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, <x86@kernel.org>, William Kucharski
	<william.kucharski@linux.dev>, Vishal Moola <vishal.moola@gmail.com>, "Alex
 Williamson" <alex@shazbot.org>, Matthew Wilcox <willy@infradead.org>, Peter
 Xu <peterx@redhat.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Eliav Farber
	<farbere@amazon.com>
Subject: [PATCH v2 4/4] mm/huge_memory: use the large-page PAT encoding for huge pfn mappings
Date: Thu, 12 Nov 2026 05:14:40 +0000
Message-ID: <20261112051440.16140-5-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112051440.16140-1-farbere@amazon.com>
References: <20261112051440.16140-1-farbere@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

insert_pmd() and insert_pud() build the entry from the pgprot that
vmf_insert_pfn_pmd()/_pud() took from vma->vm_page_prot and passed
through pfnmap_setup_cachemode_pfn(). That pgprot carries the PTE-level
cache mode encoding, but x86 keeps the high PAT bit at bit 7 for a PTE
(_PAGE_BIT_PAT) and at bit 12 for a PMD or PUD (_PAGE_BIT_PAT_LARGE),
where bit 7 is _PAGE_PSE.

A memtype that needs that bit, write-through or write-protect, loses it:
the cache mode index of the huge entry drops from 4-7 to 0-3. With the
PAT slots Linux programs, write-through (slot 7) becomes UC (slot 3),
and write-protect (slot 5) becomes write-combining (slot 1), which loses
the write protection. The other x86 paths that build a large entry from
a PTE pgprot convert it first, see populate_pmd() and populate_pud().

Convert in the two huge pfn paths. Add a generic pgprot_4k_2_large()
that returns its argument unchanged, so that only architectures which
encode the levels differently have to define it, and x86's existing
definition is picked up.

The folio paths keep using vma->vm_page_prot as is. They map
struct-page-backed memory, which x86 maps write-back.

Fixes: 5cad465d7fa6 ("mm: add vmf_insert_pfn_pmd()")
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
v2: Corrected the second paragraph of the commit message. It said a
    write-through range ends up write-back; with the PAT slots Linux
    programs, write-through (slot 7) ends up UC (slot 3) and
    write-protect (slot 5) ends up write-combining (slot 1).
    Changed Fixes: from 6857be5fecae to 5cad465d7fa6 ("mm: add
    vmf_insert_pfn_pmd()"), which is the commit that introduced the
    unconverted pgprot. Both pointed out by Jose A. Perez de Azpillaga.
    No code change.

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

