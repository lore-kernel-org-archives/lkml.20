Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460494;
	b=4qQfm4lGzfxZzgquGfd/tEYOjFZQHS9QKWLkCK/ZrUBJF/mwy8PCyVTZLjP5dtni+YPC
	 4jZt7qLSK6evIqiahe4wZdJceAiGdI2JUmb+PtGiWYAUUdaw9LAwloff61oaRSwJQ9AaE
	 c4R63BnhRngmzzIGwQKzVunr5pFFk5FqL5TaTCmllycwL8+wIjYRpLDorYJB28wrglfdB
	 E5mDYWy7yGqDy8hZQ/mppDCtgGqev2LpSN7JxyRAmb4M1qqkK7nBKa3m23JC4zmEYj5jo
	 aizH/gUSfadyi/dh/c0zg8+RFxwoWZc3TOlq1PXCS+2MKXSm3exACP0GQ4dlS/dEUIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460494;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=M4/2JvgJOG5HlY3nX1goOy1ausz+pub3HY5HFXA2L+4=;
	b=VwoeOyfjT2+BYcifk0ayN8cg8McGdiMOLZ6g/tJ7jdes6m/wn3cPrcHGJZCC26cUcqbb
	 ShV4NhKUXN+MOrPvJIq8jQlPrg7CGIfj4DWkQjtkWwuu1Bg9Vq1JRiXSUwznJ2VN8t99J
	 9uxY8WGDWYdivmb1V12LsEpt7KZrKkNmbiaPmJZ9VGczvP+P4yz04p3Y+2lLKu3iYqKfw
	 oTSc34QpriQVoNdf6j8m8GLEFht22cN00GHiuC+j809qkActWcdrRosOAJ0t0hXUpaflE
	 fXxZye0CMIrl8heQ1y9/riYHEGISuU4f289g39iaxP20TlS81Z1TBo1UJwOqs1cnOAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Xn+qcdYw;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DF0606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42DF0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Xn+qcdYw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794460494; x=1825996494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M4/2JvgJOG5HlY3nX1goOy1ausz+pub3HY5HFXA2L+4=;
  b=Xn+qcdYwwfDB24/ezDMw3SsbkE5Me4/KcRUEeLdL/KSW8rd8M2VxxMow
   3QUyZhxSvy4TZIe8alco6zoc+iIwtxnrhS7feRXvl7yj5vNWh7sMVmj1a
   LBUt3j1sXkI+YOODP67+uMzkpLWZkVP/t41qZ/OwU21sGtTgrN+UBHmJO
   UUNzW7inhR48XIR9Fu4liK0d9DYVTmpZb/icPvox80JR0hd/0yPFfZijO
   c4mygWhlWaktFyV7ddNFESV6yqP62fsK5MC+KPuyiR4t2Vj1XFcLOqU4c
   RZXs0wSUvmwvKsqujA6lirKzNysDEEsuwL0CM4VddMLvbILtJlp5Z1D7G
   Q==;
X-CSE-ConnectionGUID: WnvE7toySZ69JPTZ+ZyMFw==
X-CSE-MsgGUID: Xlb5CAEcQrKeT6sdCXy/2g==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="33759945"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:14:54 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:12731]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.212:2525] with esmtp (Farcaster)
 id d97f51c0-ccc4-46f3-b7a8-86dc99864a2b; Thu, 12 Nov 2026 05:14:53 +0000 (UTC)
X-Farcaster-Flow-ID: d97f51c0-ccc4-46f3-b7a8-86dc99864a2b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 05:14:53 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Thu, 12 Nov 2026
 05:14:49 +0000
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
Subject: [PATCH v2 1/4] mm: drop the huge PMD assertion from walk_to_pmd()
Date: Thu, 12 Nov 2026 05:14:37 +0000
Message-ID: <20261112051440.16140-2-farbere@amazon.com>
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
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
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

