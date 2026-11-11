Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406040;
	b=mJxN6c/rz4vHx6P7g+pJ7CrVtH3l1bByo2QI9mauOX4boqjLuZLmj1x/bph8LWq5u6IB
	 sfLP6OBc+LZq9l/WyArzro6qajkqv/a+mIAwbh26SdkrjpR/uNljhKPeZCaUskXSw/x6x
	 dsA/O2Xzv3Zd16DTolIsBfKDuXW+SnEDugRyIxPJcWdEybPfvLs8RCKUAIBrw6lSLa/mY
	 9ncwsYZ/3fxGjqMdqVzqLWLeVHVVQNVaMlZ9DETBFoVn22tf1uo+DGkdsigb+i1br5wn1
	 uVw0fCIrGqHsoBgp+uLrocvSfB4M4qvhKbYBtrwCKBShEq4XVMKPz+gn3Zvf71gTDDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406040;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=S9c0kHmWhtbQRoNZApI47WWaUyszWbsXJ+Tgf0zaouM=;
	b=ktBRTNaafrUE1pXi8QATl9/xdEr5Cufc5tQNR7QiDzZeLkb9xeUISIEYhXVn4AOnLamP
	 mLCuzAarOq1QGxfc0ehqNt8kIVdm78f9Z9IBTtVuRMUY1zgVI7VdcT/HRPKzx/GOdRMia
	 KiAk0wux2AGA9EgUIFNP1M+mVMwsn5wBigN3Yc26+AGxbE3e1ylH4Sx9+ki2DI1Vjw54z
	 4BCYH6QncRmr+HTvQsgUDGpucJGq01gX8BvYm9EYZVUi2pg50SKVD8+cDYj1xugtX0IJ0
	 c/ORLHsYjWWG+1cNR6TxAiGlkZxXE1OQKbrlQUlShjiVvi+GBJ1dTZei2HhVayCN/cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=exdI1L10;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138D606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7138D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=exdI1L10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794406040; x=1825942040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S9c0kHmWhtbQRoNZApI47WWaUyszWbsXJ+Tgf0zaouM=;
  b=exdI1L10GF6pH+Fz7W65U4b4U5Hh2KQcSlnBDpX7oRK8G34BgT2QxdAA
   xB9HmNr1EWEWcc8ONl+vIqkffKcbERqMUfxgkFIMaA0L/H7sDZZ6Sl/CQ
   6kRxhM5KfkahGAt7IxHSz37xGTa/rueOfk1Xx+DW5Q+wGS8K4JWiKiIqK
   uefFktMpSpSPT+FAnh+gtyAGaCKM773vwMCl1I4asozZ93yv90EHaVkHk
   i986oZoJPDQA6WR1g6nNFxAe3oAeKnjR+JbPBXufi7BnGguPaWWgE+YNt
   2ZmtoYcZWq5Qk0QyezYbdsyH5TQDiHH3q1/cAWsxJFQjj7wv0JMnN607C
   w==;
X-CSE-ConnectionGUID: Rmi/CTU4SR+CRvBDzFrD9w==
X-CSE-MsgGUID: ScqG5yqcSbuqVHkEROIo6w==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33488621"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 14:07:17 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:4609]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.128:2525] with esmtp (Farcaster)
 id 511131ff-4110-43f7-bbc8-5fbf339e8155; Wed, 11 Nov 2026 14:07:17 +0000 (UTC)
X-Farcaster-Flow-ID: 511131ff-4110-43f7-bbc8-5fbf339e8155
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 14:07:16 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 11 Nov 2026
 14:07:12 +0000
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
Subject: [PATCH 3/4] mm/huge_memory: don't warn when a page table blocks a huge pfn insert
Date: Wed, 11 Nov 2026 14:06:54 +0000
Message-ID: <20261111140655.34281-4-farbere@amazon.com>
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

