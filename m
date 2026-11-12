Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.162.73.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460506;
	b=a2/9enDC/hKhjgMuaXmcDNfh4WT3VtLU4O9dhUHwBuwHMcgZV1Jfn55IJMRn65Hhv2YO
	 i4pqt2leJDf3aDCfdkPwHfs3z6+QWbRmxaaqYyRnbzaktNCuzqbkUSMaDxr48HiK1/Ke4
	 P4Phth4Dglxc22kKslkODdThBgnSbYmUN1PYMF20eUzYWJ+3JPYQquCY5Ws9D02AaNS1L
	 30zhICQy7SSybvy8sSQK++C68rSBlW5/l7YtyudvXZsHpRgm4jl92VaFp17ZrZ1+73pGK
	 V9w6fTatD90nqoyBDjN0RAOA8R9JZG8E6HbZoRh6t6MwAZLAypeJ5RuCED8v8BG/jHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460506;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=k8j/OBe89YYV4DfbOTa44RgiIx6OZueLRbrVytuzecA=;
	b=OHOSO8x0Yw0oQ0ShcMj+D94pBoKuUhQCk7srR76xrTXgD9I6YehK3kxLEmhlnQ7i6vQq
	 /7ej58N88NpgnjQYQ16tPXOwNnn2AooQiiD6jd+ijS1v9dUbVAmS2xDyKII2krCvqW+d5
	 Kwy7NWJpQw0LrcXfdIJFl4tAeHu54JmjiU1eWxn4dxe2pJqHyTqu2VMI37DgigC2b5cZy
	 TW6nu9o5FetmjVUGzvc4fwJaEj8QbPZ2k5u2O9rXpN9C69YwS9xj2Q3OybvtStAQ6dq5k
	 36zBgeo0kIW2n5/UIL7+1fYUtYvCWuFFnnT/bVmzfHTPL8RvJT/Ml2qACH0B5G0mzPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jeJAjjB3;
	arc=none smtp.remote-ip=35.162.73.231
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34159606A339
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34159606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jeJAjjB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794460506; x=1825996506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k8j/OBe89YYV4DfbOTa44RgiIx6OZueLRbrVytuzecA=;
  b=jeJAjjB3I06OuLu/gI9uPHPSJT3YB7Gn4E45vdGt0quRR8b38J7OT5xQ
   crXPvmuaS/AOKRg0r2mkXIxQ6bjl4i3zuH8X1Vuw+YN6XfjbWx77WBORp
   K3zMHlG8i8TIrn153MKpKOhZJg5DGzr56Ik2IZKABl50vTjVwmRfiS0Lo
   RDTVc7Xcvovmv2rHaT0awt05o0bSOjvJk8junnw/DW4qF3zdbkmTEGQ8G
   SBDVrfIh2pLNRruGRB6y4oc6ozzJnk6IFlsSFAScqQH25wbnPwpsIJRn/
   JL+uPARXsQjWsyXA5QeRMbc3LYHpTfWs9nIvVfrmsnMNsyLmOaRlmZJ3X
   g==;
X-CSE-ConnectionGUID: Xs8mvpSKSvuwGfCiYAVX1g==
X-CSE-MsgGUID: wwsc9zVVQE+bwyXN4Eqfmg==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="33593800"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:15:03 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:5388]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.141:2525] with esmtp (Farcaster)
 id cd8d8c80-8c0e-49f7-a2f8-97ee32f9de81; Thu, 12 Nov 2026 05:15:02 +0000 (UTC)
X-Farcaster-Flow-ID: cd8d8c80-8c0e-49f7-a2f8-97ee32f9de81
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 05:15:02 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 05:14:57 +0000
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
Subject: [PATCH v2 3/4] mm/huge_memory: don't warn when a page table blocks a huge pfn insert
Date: Thu, 12 Nov 2026 05:14:39 +0000
Message-ID: <20261112051440.16140-4-farbere@amazon.com>
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

insert_pmd() and insert_pud() treat a non-empty entry at their own level
as a leaf and compare its PFN against the one being inserted. A page
table installed by a concurrent order-0 fault also makes the entry
non-empty, and pmd_pfn()/pud_pfn() then report the PFN of that table,
which never matches. insert_pmd() warns unless the entry is the huge
zero PMD, and insert_pud() warns on any mismatch.

A VM_PFNMAP mapping with both ->fault and ->huge_fault can produce the
mixed orders: an order-0 fault installs a page table over an address
while a concurrent huge fault on the same address reaches insert_pmd().
Changing an mm's THP policy while another thread faults the same PMD,
for example with prctl(PR_SET_THP_DISABLE), is enough to do it.

Compare the PFN only for a leaf entry. A page table is not an error, so
take the existing out_unlock path, which returns VM_FAULT_NOPAGE and
lets the access refault onto the smaller entry.

Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
Signed-off-by: Eliav Farber <farbere@amazon.com>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/huge_memory.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index eb913acb03b7..052c50dadc48 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1643,6 +1643,14 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
 					  fop.pfn;
 
+		/*
+		 * A concurrent order-0 fault may have installed a PTE table
+		 * here, which pmd_pfn() would report as the PFN of the table
+		 * itself. Only a leaf entry can be compared.
+		 */
+		if (!pmd_leaf(*pmd))
+			goto out_unlock;
+
 		if (write) {
 			if (pmd_pfn(*pmd) != pfn) {
 				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
@@ -1770,6 +1778,14 @@ static vm_fault_t insert_pud(struct vm_area_struct *vma, unsigned long addr,
 		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
 					  fop.pfn;
 
+		/*
+		 * A concurrent order-0 fault may have installed a PMD table
+		 * here, which pud_pfn() would report as the PFN of the table
+		 * itself. Only a leaf entry can be compared.
+		 */
+		if (!pud_leaf(*pud))
+			goto out_unlock;
+
 		if (write) {
 			if (WARN_ON_ONCE(pud_pfn(*pud) != pfn))
 				goto out_unlock;
-- 
2.47.3

