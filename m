Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.12.53.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460501;
	b=2TSwmBfTfOmJzMWh+H3nbVr4Co5tMBxPcsbc2mfm/IrLiFLAOtzE4GhET7CtY1pyMVAG
	 nwCctfaHaUuua0WpE3follN1VTnSwfcROva9XxsAJe/w9FezYB/vivqV2HgbWun5pNdCs
	 VMO/mo7LWk2DQW1McQgUVwaE7uXVVZTKELcbaQj5HmNMe/nCFyyuV9jIeZI4Jk3TXs0Bs
	 1N1CqtNo8hQ0ViEz65nzSIjcBnnrJFkMmWmpSPunn29F6Y08pJ7DMUjqR9Sh8Dr/ePs3E
	 9bOHVB07ANRr61E44ph6RlcD4l7etW+GQNpOqTaJKHRA+Y1/G85Sst8mF88CbGoY5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460501;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=8rfSGSkxIfkOmnWsHXfluOeh5Z9UW/hnjrCjmA9e3OM=;
	b=IWR1XDSuxslY1SMooJilFIBAyO7tE5egOczkqaKixEAQcuXYqiMlhOf/J1BlDP+INKW3
	 jeChxIBEqqU38tWeSfa7Fq8MEc3Hwa6Ug1K9s9yGoUkZfXFZ2RGQOLkfC+ems5ziyB2BI
	 8fkTzYI/Hy/iJAG0yoCIPFAyQ/HVIurT5JcLIaLPRpjeBKJQXYRvrGQdDCUdYmZbe8iTX
	 9tQnXBosQJELRptSKm7PdmXMyKPcc7a/FP1MkxKZfSc2XvquwZbKUMpoHTaItgZvzfIXK
	 1ywF5ZtQo3O9XUtHDVMe/qRxBw34W0BscLQSEaJ84bnagUxjru0vkoonrw4mcISBVHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=mqpPtVRO;
	arc=none smtp.remote-ip=52.12.53.23
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A82606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A82606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=mqpPtVRO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794460501; x=1825996501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8rfSGSkxIfkOmnWsHXfluOeh5Z9UW/hnjrCjmA9e3OM=;
  b=mqpPtVROdbLRhQxrNajlk57mU3SLwOiChBpahW0sN/tSUHvxwJ1QOETW
   fbVt5mjE+w3ArsCTsUPLiTJU/EgjNZVUTv/IJfWCMJ0Oyt7PU7ELTyDZG
   HwEOLHf9teh6zVzVioGFNJCOc0ltkChHsBPJISvAW9RMXfd5tq67w32Mk
   t0uA9iZTkIrHgSqFVSPAGXmjeJ3MPfBWVJ5to5KN3A8QexwP/QJSeNVkq
   SoGdvpv5PYq9MRN/grw1lTxVdVXvPo+f3+94Q33Gryoc0yQgJc3RwQOOR
   2UhkoaPc+6S/+nZ8yuslbpFXy+hIz+zqWNB3EufzVjSEts0Tqds/ElFNu
   w==;
X-CSE-ConnectionGUID: GF1K5NqyRTKIENaSMqBImQ==
X-CSE-MsgGUID: TOsHFUtKRaOsUsJWXgndgQ==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="33650572"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:14:58 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:2589]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.127:2525] with esmtp (Farcaster)
 id a305790e-e190-4555-8e59-2a4cbae2ff0f; Thu, 12 Nov 2026 05:14:58 +0000 (UTC)
X-Farcaster-Flow-ID: a305790e-e190-4555-8e59-2a4cbae2ff0f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 05:14:58 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 05:14:53 +0000
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
Subject: [PATCH v2 2/4] mm: don't report OOM when a huge PMD race blocks a pfn insert
Date: Thu, 12 Nov 2026 05:14:38 +0000
Message-ID: <20261112051440.16140-3-farbere@amazon.com>
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

insert_pfn() maps the PTE with get_locked_pte() and treats a NULL return
as an allocation failure. pte_offset_map_lock() also returns NULL when
the PMD is a leaf, which a VM_PFNMAP mapping with both ->fault and
->huge_fault can hit: an order-0 fault that passed handle_pte_fault()'s
pmd_none() check can reach insert_pfn() after a concurrent huge fault
installed a PMD leaf over the same address. The task then takes a
VM_FAULT_OOM for a mapping that is perfectly healthy. Changing an mm's
THP policy while another thread faults the same PMD, for example with
prctl(PR_SET_THP_DISABLE), is enough to produce the mixed orders.

get_locked_pte() cannot tell the two apart, because pte_alloc_map_lock()
folds the allocation and the map into one call. Walk to the PMD,
allocate, and map as three steps, so that only a failed allocation
returns VM_FAULT_OOM. A NULL from the map returns VM_FAULT_NOPAGE and
the access refaults, which is what a PMD leaf, a PMD that is not present
and a bad PMD that __pte_offset_map() cleared all want.

Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
Signed-off-by: Eliav Farber <farbere@amazon.com>
Suggested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
v2: Split pte_alloc_map_lock() into pte_alloc() followed by
    pte_offset_map_lock(), so that only a failed allocation returns
    VM_FAULT_OOM and a NULL from the map returns VM_FAULT_NOPAGE. v1
    called pte_alloc_map_lock() and then re-read the PMD with
    pmd_trans_huge() to tell the two apart, which left the non-present
    and bad-PMD cases reported as OOM. Suggested by Jose A. Perez de
    Azpillaga.

 mm/memory.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 0f54ee0a6d88..05ae87518206 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2866,10 +2866,24 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 	struct mm_struct *mm = vma->vm_mm;
 	pte_t *pte, entry;
 	spinlock_t *ptl;
+	pmd_t *pmd;
 
-	pte = get_locked_pte(mm, addr, &ptl);
-	if (!pte)
+	pmd = walk_to_pmd(mm, addr);
+	if (!pmd)
+		return VM_FAULT_OOM;
+
+	if (pte_alloc(mm, pmd))
 		return VM_FAULT_OOM;
+
+	/*
+	 * A concurrent ->huge_fault may have installed a PMD leaf over addr,
+	 * which pte_offset_map_lock() refuses to walk. The mapping is fine, so
+	 * let the access refault instead of reporting a failed allocation.
+	 */
+	pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
+	if (!pte)
+		return VM_FAULT_NOPAGE;
+
 	entry = ptep_get(pte);
 	if (!pte_none(entry)) {
 		if (mkwrite) {
-- 
2.47.3

