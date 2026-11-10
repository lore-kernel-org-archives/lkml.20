Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309903;
	b=BqPYz3dvl41pCcuQK3WuinExv1SuELkG/OdjFbuDAs5zgJlVXEcgd5zHx7RKm4MP9A02
	 /eBmIue0y5RNXDyIviqLeP6EAn5rRkAU/uKxqUTxkuYBacgyMM3faxAqyYBh21YO6T7zg
	 V7R3TXbsajWOpZFnIFwhI+ktuZyRCPYtfwTh9ZtE4/Ux/rH/MuPIwiPPJjqhIRTV9Vu+p
	 4pJ1JfaJ1Q2CCIqChTNRbiym4bKJ18srUu/8iX+O5pLKfPlGfQ5aZN5riABiNEbqcYjkL
	 wPJ8IsI1Zmeej79mV4nPZrJfBjrvEZy16ewyv7vNVZCaHyejOJRu8yTrgJNCeq0+mSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309903;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a4P6LhsQ/fmPy4a5lBGBrNsm6TX2VeTBD7E46ZsyMbw=;
	b=VZGcrpTZB1htsScEXkz/BCGO4B2IFo3ol0Njx7C2S80aGSEpSH/82CwD8dkXY8cozrnj
	 ZuJPLVO2LnDJRMipXsOzc5r+PDI9VzZfVoCkp7x98SCikJzGZSugEgdU5xsFKc5ls076W
	 NmeSRp5KNLCOn/VrOD8cGL5UYesOx8yYgZatG1TYsJLdjt8NLrNjRcFFzn2ujmHvTYfYf
	 gGWMVZ3YBAMRmXTHwJ2+ETWjdYRdF4FVlPsFb3Js86vYLGHkT0mDSJ5fuDIqY6MF8NsNi
	 U0vuiN/M8UpQHv3Kn+/4V4d+iByqvLwcVfZOKu8BV+bPo44PrVQTzs0CmhmnjNMdmEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fRh9t9bq;
	arc=none smtp.remote-ip=95.215.58.136
Received: from mta1.migadu.com (out-136.mta1.migadu.com [95.215.58.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B384606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B384606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fRh9t9bq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+BC/knlX3zAYieQSABgTL8lI4HMkwqXZ9TtJrVcUkfo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309901; v=1; x=1794914701;
 b=fRh9t9bqwuJwWnU5UKDpMM1ujVrKmiPY9fh0jBO+sR1zq4FW8d5SgsPHoCP/gMNOhQlCcLwg
 J9S+IpH0VFjgqCIWS/eTEMybOgf2yRlUsgxZ0djPrsYmhhFWgvbK3sl21688xRHP/8HKV5QOh8u
 tevumLT1KzR8IPOyN5eoSu6g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6399328dcb90171d;
	Tue, 10 Nov 2026 11:25:01 +0000
X-Mizu-Trace-ID: 6399328dcb90171d
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
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
Subject: [PATCH v4 5/9] mm/vmalloc: BUG_ON() on an unaligned range in __vunmap_range_noflush()
Date: Tue, 10 Nov 2026 19:25:42 +0800
Message-Id: <20261110112546.261415-6-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261110112546.261415-1-hao.ge@linux.dev>
References: <20261110112546.261415-1-hao.ge@linux.dev>
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

The PTE loop of the unmap path stops only at addr == end.  With an
unaligned end addr never lands on end, so the loop walks past the
range and keeps clearing.  With an unaligned start the loop begins
in the page containing start, which extends below the range.  Either
way the unmap clears the mappings adjacent to the range, and that is
nearly impossible to debug afterwards.

vmap only installs page-aligned, page-granular mappings, so an
unaligned unmap request is never a legitimate teardown, and there is
no way to tell which pages the caller meant.  Check addr and end at
the entry of __vunmap_range_noflush() and bug out before any PTE is
cleared.

Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 86fbb1d2b27a..0565cbfe325c 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -518,6 +518,8 @@ void __vunmap_range_noflush(unsigned long start, unsigned long end)
 	pgtbl_mod_mask mask = 0;
 
 	BUG_ON(addr >= end);
+	BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));
+
 	pgd = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
-- 
2.25.1

