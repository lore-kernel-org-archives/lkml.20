Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309885;
	b=F+j7YcB4xAT1ZRgJBW4JQKWuSGAFaZrbzIeJ3T4ryU+W3kk93MBoTxoq5kJb6u7c4kqs
	 nPc1Szp+SDioToHAOgYGUSYFE0Zvrick9s6+lNM/yAwe0rfMuOWPT/0AT1Zq5iBXkgGUi
	 oA7oMqE05+eSNj5YwpkozDIfzZmYfe7+DP8ETQYEMAqgbqA59eLZfQqCQNoOPBPtE80sm
	 kasJbtV9W8bIsunF12ynxO7wa3okjG0KFHYTjINh7emLC1bpj+vlbl6tMhvgQL0yCH+uN
	 l2c8mTm6W0ZwqQvMEBuIG1Ij26O4bLFZ2HrYikjTL+C5p6CymWaslsHRm5wjHWBTnqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309885;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xc/2Ec+isrnw7gxi44tzolJqOLCV74Dq//tFYw2pc30=;
	b=mik3wQHMlycTBvmMCacpQZ7HzPh0ZCyywfYYW5bLdhPkvU+LUxcVoeAuLpt4B4kMEf2i
	 fZkJPZJBTBXP0lwi9nEUo8qvNgB9hcUhSv6ZtlhtUBauPI0QBYOO/XdXin0zqqaM6LNme
	 DBE3cGuB/Wdej4pwLpdoSo0W15NwiwRT8GFZfw9pkpbYh6fyL3hvteDF1PZJbstnJamzi
	 34wbIjYtVSDVfqumOk5YjRnpkXgJz//RjaNB9qymRqw41Twt6TlmBtIBdMY7aqaXJenTd
	 JRbt4T+vOMi8Mc17G6zX6G0o1FT7HuFnUjhbtbD9EE9bIdL/imzE5o/VZ6PhULAcZLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HRA702GZ;
	arc=none smtp.remote-ip=91.218.175.176
Received: from mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E313C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E313C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HRA702GZ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kYvyfDK0ROE4CNDauI9kgGxJwtog7X2zxAx8KX+EfBM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309883; v=1; x=1794914683;
 b=HRA702GZnLe6rctJhDQuM+ozDS99Y6I83jb7m2Te53GS/hs2+bFIZ2s+2cVGJMwAK/Owan6N
 20o+OdmwXDveZmtlleLBldslCBbxqEGAILLWaDa9vd4MwMVxUAOiLKuGQOVdjKeCgfTjK8eDDjO
 cJ9wglN3lckVV9nThG0g6dh8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6c351c2373b5f8e3;
	Tue, 10 Nov 2026 11:24:42 +0000
X-Mizu-Trace-ID: 6c351c2373b5f8e3
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
Subject: [PATCH v4 3/9] mm/vmalloc: BUG_ON() on an unaligned range in vmap_range_noflush()
Date: Tue, 10 Nov 2026 19:25:40 +0800
Message-Id: <20261110112546.261415-4-hao.ge@linux.dev>
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

commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
PAGE_SIZE aligned") put the check in vmap_pte_range(), which is too
late, because the upper levels may already have installed page
tables for a range that is rejected anyway.

The pte loop maps whole pages and stops only when addr lands
exactly on end.  An unaligned end lets addr jump over it and the
loop keeps mapping past the range.  An unaligned start maps the
page below the range and usually misses end too.  Such a range is
never a legitimate request, and the corruption it leaves behind is
hard to attribute to the caller afterwards, so bug out on addr and
end at the entry of vmap_range_noflush() and drop the check from
vmap_pte_range().

Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/vmalloc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 093b8d5f7b0e..27f2674a5556 100644
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
@@ -347,6 +344,7 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
 	 */
 	might_sleep();
 	BUG_ON(addr >= end);
+	BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));
 
 	start = addr;
 	pgd = pgd_offset_k(addr);
-- 
2.25.1

