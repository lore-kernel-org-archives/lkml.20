Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.42.203.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406032;
	b=VWQ2Od2bjy5QIInMcYRwnhNuhtkHVFi4EeVMnq531WrgHz5K4qNRXXzHLWOHgBA+Xc6s
	 O+wq6mEhO02YC9P8jOGeZjBlvWpfNCbY6O7/P1RxnNOjZH/obnD36ocTO+Zkc9BiOp027
	 bTLNXIA+V6qnTtJe8gKUgbZPkV+QJXIfndEciNCznF6XuzuYQnSj3om40YHFbf2k7LW26
	 ogmUKQHFhVkvF5/rRphvvvAkMwdstWhIEyX2zWZfUAkpRDpSWOPi25YdLIV/0KpqW0GPf
	 SS1TtkZq4/Fnku6elONuya81kY6c7basQ9qX2YX5QdKNZUrR5+DjlAAsPuM/KebAl5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406032;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=lNsmVLumwuxsRxdUtkzWmrN8JhUX0gR0pEJL5hni08w=;
	b=hKGQdmjF4ASIJEAicacEkiqYv1AyukMNDbRsts0bNz5x26er5l329uRBkEffncrgP4LJ
	 FsqeonMj0vPYo6pYXAl41LjnXCflJPjWddh8dWZx1B9Hd386438CMSXzC1ch6zKQ47e8P
	 kjnAsL5euUmNDM74KbUL+HrpGJBTJsvy0hqvUvgDZnMnTUqBK2TadPGOumMDTJGYwjtVx
	 ajEa2kVv+G6vTmYvhYW+3lekTmx4Z7QBqukZDeMrDg1fXTgmOz4YEV1S+BbgdbjfEHkID
	 Rgw5XnLex7WU5pp9xwTlP29jd9YAb+IdC5pKISaOCVJRgIcCiiUqIEywQ3AI+KHPGgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=OQe5sorW;
	arc=none smtp.remote-ip=52.42.203.116
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463B3606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 463B3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=OQe5sorW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794406032; x=1825942032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lNsmVLumwuxsRxdUtkzWmrN8JhUX0gR0pEJL5hni08w=;
  b=OQe5sorWGNB7Pz99Wz6Fx0cqw3juNPIioomfUcRcmNoKwjTe32jgsBXG
   YRDj2A/B3viZJk2AMXZKhMJNg5GH2VmysOifObKSmETB+t2uHrrHZuwNC
   H7VbXl4648s5aLyzJmrCDbojym1dlbUgRnmC/27199SsNPKP+km3JQflM
   R0j5M3sSxgoESV3d6/kgDCZePM+KJulmcdOzY5acvfxAQAAZMsxdokGTp
   HuawBKpkdUNWFtoDLA1kdkqSUa/tTp8QsxijzScGFu8mO+p/kRx2zQgvD
   XxMXhk10EjlIEiCi89iEKdgqglRo6nqwVEf5i50mJrAmMQrf51gKxrd1O
   Q==;
X-CSE-ConnectionGUID: s7rBCfALT0qsy+rJMuzW9Q==
X-CSE-MsgGUID: Qg955fbHQp2UbEVkoLD+Mw==
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="33751585"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 14:07:09 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:31323]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.127:2525] with esmtp (Farcaster)
 id c170e4e6-a4d9-4391-83cf-d1cbdfa528a3; Wed, 11 Nov 2026 14:07:08 +0000 (UTC)
X-Farcaster-Flow-ID: c170e4e6-a4d9-4391-83cf-d1cbdfa528a3
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 11 Nov 2026 14:07:08 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 11 Nov 2026
 14:07:04 +0000
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
Subject: [PATCH 1/4] mm: drop the huge PMD assertion from walk_to_pmd()
Date: Wed, 11 Nov 2026 14:06:52 +0000
Message-ID: <20261111140655.34281-2-farbere@amazon.com>
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

walk_to_pmd() asserts that the PMD it returns is not a huge entry. That
held when commit c2febafc6773 ("mm: convert generic code to 5-level
paging") added the assertion: nothing installed a huge PMD over the
mappings its callers walk.

ARCH_SUPPORTS_HUGE_PFNMAP changed that. A VM_PFNMAP mapping whose driver
provides both ->fault and ->huge_fault can have a PMD leaf installed by a
concurrent huge fault over the same address, so a caller can observe one
and BUG on CONFIG_DEBUG_VM=y.

The walk does not need the invariant. pmd_alloc() only allocates when the
PUD is empty and otherwise returns pmd_offset(), so a leaf is returned
rather than overwritten. Every caller already copes with one, because
they all reach pte_offset_map_lock(), which refuses to walk a leaf and
returns NULL: insert_pages() turns that into -EFAULT, get_locked_pte()
passes the NULL to its callers, and insert_pfn() returns a fault code.

Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 mm/memory.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index ec3d9d99ccee..0f54ee0a6d88 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2384,7 +2384,6 @@ static pmd_t *walk_to_pmd(struct mm_struct *mm, unsigned long addr)
 	if (!pmd)
 		return NULL;
 
-	VM_BUG_ON(pmd_trans_huge(*pmd));
 	return pmd;
 }
 
-- 
2.47.3

