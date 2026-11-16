Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.235
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813236;
	b=eIIFmdtEwJ4DbpoUIMQ8OhQfAEpJbK2oTXUXzZ+BjUJogUmM+A3epoxYUrDbfa+L42vz
	 PIGFGOHvt16vXUxDZypy7NosA8zh0KkY/R1Qh4gPsYl8Gk1evAI2UlzI/QX4ZrOWvNYzn
	 6oaI953GipcaWxppFy1K8fwBvvQ49lhxtcMw0R4av19Tu5JEooO+LDYsp7rztYcRJXcas
	 2E2fF4mp2TCWe+0aBAxYKBZmSj14Bt99zPcnF02EwCrlrF5yAcqXvOs/i71bSbe278slR
	 ET1vW/7iz1h+/bok8+Pbog17HoEwZpoDR+wnHpuz1TCksbmbDFlPJ13sSKThCK6uBZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813236;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a1hTeOe7yP6jJ4PJLUPdhDcND7K7E4e0M1zKxRQII6E=;
	b=hmjCa7Njslofv9L6tLGcO7+39exeKQQcpFDdawGyr8iGJAZdM2NfDSSm1Yi5EFNqQxs4
	 dOYyCMfKT59cOlwHiHeV2yI3LDG5s70DSnKSXvvzLWDQVs8hKuzideruD/e/TVAglmu7I
	 KvsZ5FjO0IF3oCRaMvzRfJULhypNehOzAwi7PDgvxj5x9TqO2ZqtF4E2BOrDOuwbVNaHb
	 N4sOHW7GZfP833v3+jbi+pCV6g3snqydOW2YmyrEruKzqMmvaCyV7mmSOT8PJOAm4fw/u
	 8aqHgoWaITw8KSBjbLLrXFU8JgANEIOF8D92Z7Iec6Ot1skAoY90AZi7A4piN8cks/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="i/0E5FgU";
	arc=none smtp.remote-ip=95.215.58.235
Received: from mta1.migadu.com (out-235.mta1.migadu.com [95.215.58.235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2CA606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=i/0E5FgU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=spy9jeLw8YXOaQ6MOBiv5dZBFpPS/G4lwKbebeo0RPU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813233; v=1; x=1795418033;
 b=i/0E5FgUNV+jOZ5pAFPftQqcUwHhD3A40dD55ehtlhiYJn2OW+ZbERWOnxZKt96wnVPKHhb7
 bvhdN8tsL/POP+SPdS+WdUQs7X5YcsUo+qyyLOH4aAHuMpHhZB7xaGFqhJhKX7NCQApD+YMpl4e
 nCEOYI1nqx0i2hHBH7YdTUdE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d04e7e5a4f33519f;
	Mon, 16 Nov 2026 07:13:53 +0000
X-Mizu-Trace-ID: d04e7e5a4f33519f
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>
Subject: [PATCH v5 03/11] mm/vmalloc: reject an unaligned range in vmap_page_range()
Date: Mon, 16 Nov 2026 15:13:17 +0800
Message-Id: <20261116071325.263682-4-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116071325.263682-1-hao.ge@linux.dev>
References: <20261116071325.263682-1-hao.ge@linux.dev>
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

commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
PAGE_SIZE aligned") put the check in vmap_pte_range(), which is too
late, because the upper levels may already have installed page tables
for a range that is rejected anyway.

The pte loop maps whole pages and stops only when addr lands exactly
on end. An unaligned end lets addr jump over it and the loop keeps
mapping past the range. An unaligned start maps the page below the
range and usually misses end too. Such a range is never a legitimate
request.

vmap_range_noflush() has a single caller, vmap_page_range(). Warn on
addr and end there and bail out with -EINVAL before any page table is
installed, and drop the check from vmap_pte_range().

Suggested-by: Suren Baghdasaryan <surenb@google.com>
Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3c0d9e69b886..a168f6f20f4f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -125,9 +125,6 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	unsigned long size;
 	unsigned int nr_pages;
 
-	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
-		return -EINVAL;
-
 	pfn = phys_addr >> PAGE_SHIFT;
 	pte = pte_alloc_kernel_track(pmd, addr, mask);
 	if (!pte)
@@ -369,6 +366,9 @@ int vmap_page_range(unsigned long addr, unsigned long end,
 {
 	int err;
 
+	if (WARN_ON_ONCE(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end)))
+		return -EINVAL;
+
 	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
 				 ioremap_max_page_shift);
 	flush_cache_vmap(addr, end);
-- 
2.25.1

