Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406036;
	b=4kQ/AzvCnl/NEOsf80L7HAQnGxeM8ob3r5uS7y8CZd2tS03ypNXuEp4wjulsBdM0DqU0
	 MnQflUCDWOY5E3Kvoz5WvN32FIRyS1Z8wIP06am47a8t7Hy8ZPWi1EIw/xL+NxvkDeuzI
	 7T68UiQKw8UDK/F1jCPlPAPTgJVka6nW98IlaG7IhFdy/oktb0clWqGRvXYaifVk3uxt5
	 DuhAhHwOtwj59tjmLLhe7b7kYq6nduxTSDDIBavlHdXp8gCHthMyHErHeHh9eElZz3Nk9
	 lGQGDq+68pwosCCoHFWeMonlw4l+s5zOYR12VQ5nPRVMUByzSFqjyIBEpsmtOgLx6tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406036;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=2nFQxlo0WMfzc/ouZWAGOsuVuCa8LalnVe14afCjtJo=;
	b=CREURXMrvIcNZmPxV1qk6GTOVaNYlSH7bVo5ZmLMbY/0m12MWf5lK33tMCl3r921ABFn
	 vH1OzhuCpL/y66gOsCtfr0SDME+w9Fllimt4ppt7bDi2ylriikspz3/E4olgjP1dtpFk8
	 v1MxH20gH64yYaO06kTd+6zei2SQJg7pQ9ZAA+x4Q9Bft9fSzatx0RlPk0rbpQIjKzmrd
	 sd5WXmSdTJrsqfgr+Ehwc53irbqa2M9Bcyc3YJxKeAL7TMee60TfJ/K7Djjck6LR+KcgD
	 MbSpR5mWJhp8qFksqWTltzTN5F6v6xhERwYaukcL3nUJIirUlkUWSOp2F7Lkq7fq/Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=sCu6ueg3;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDEA606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BDEA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=sCu6ueg3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794406035; x=1825942035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2nFQxlo0WMfzc/ouZWAGOsuVuCa8LalnVe14afCjtJo=;
  b=sCu6ueg3y9JUDzXZh04l0+zrsyuD3kdnKnuEJA4yZy9DBPDTNeu+Zukh
   SV/oDfrgaDndFZxVZGvLLUavUYtOPqRJFUDvfLBUiwKqMaUuRXhpT+wSe
   1UPhNb/FyTgHzSMDeWMHNsXE5pwd/d0auIgKEVvZFW6BK9mxWHIBo7qwU
   gf9cdFt5NiSS2mwLoqmNxKKNew2mN4A0zbAfnxN8iFYFOwlGnEoUEJu7p
   XYZ9GRk1f23of6VnlwHNyAxQDkylV2qvJL5cvy/Qip8P5OQEahdlH+Yct
   bTuntD4z7fZHQcC6yQUclNhKN7lt5sfDj3klF/umn68DyfHZfbTigXdFp
   g==;
X-CSE-ConnectionGUID: 1rvQUTH7Qs29miH1ZlGQ+w==
X-CSE-MsgGUID: PEphMCXXQhe4miT7lqeZrQ==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33633297"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 14:07:13 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:15918]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.227:2525] with esmtp (Farcaster)
 id d9f5ddbb-985e-42d8-a21a-50778d7c1bf6; Wed, 11 Nov 2026 14:07:12 +0000 (UTC)
X-Farcaster-Flow-ID: d9f5ddbb-985e-42d8-a21a-50778d7c1bf6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 14:07:12 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 11 Nov 2026
 14:07:08 +0000
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
Subject: [PATCH 2/4] mm: don't report OOM when a huge PMD race blocks a pfn insert
Date: Wed, 11 Nov 2026 14:06:53 +0000
Message-ID: <20261111140655.34281-3-farbere@amazon.com>
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

insert_pfn() maps the PTE with get_locked_pte() and treats a NULL return
as an allocation failure. pte_offset_map_lock() also returns NULL when
the PMD is a leaf, which a VM_PFNMAP mapping with both ->fault and
->huge_fault can hit: an order-0 fault that passed handle_pte_fault()'s
pmd_none() check can reach insert_pfn() after a concurrent huge fault
installed a PMD leaf over the same address. The task then takes a
VM_FAULT_OOM for a mapping that is perfectly healthy. Changing an mm's
THP policy while another thread faults the same PMD, for example with
prctl(PR_SET_THP_DISABLE), is enough to produce the mixed orders.

Walk to the PMD first and tell the two cases apart: a failed PTE
allocation stays VM_FAULT_OOM, while a PMD leaf returns VM_FAULT_NOPAGE
so that the access refaults onto the huge entry.

Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 mm/memory.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 0f54ee0a6d88..b7b89d041f42 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2866,10 +2866,25 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
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
+	pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
+	if (!pte) {
+		/*
+		 * A concurrent ->huge_fault may have installed a PMD leaf over
+		 * addr, which pte_offset_map_lock() refuses to walk. The
+		 * mapping is fine, so let the access refault instead of
+		 * reporting a failed allocation.
+		 */
+		if (pmd_trans_huge(pmdp_get_lockless(pmd)))
+			return VM_FAULT_NOPAGE;
 		return VM_FAULT_OOM;
+	}
+
 	entry = ptep_get(pte);
 	if (!pte_none(entry)) {
 		if (mkwrite) {
-- 
2.47.3

