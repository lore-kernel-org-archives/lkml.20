Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904014;
	b=C+Ee2HJzEXV4OcERRgAXMUc1WJn+ssHKTmoVYBKpt5OXFNfUBXTyxAGfdWh2akTMnvV0
	 CcGIuE1w406vmA+p/D+LSiq+mhWSkP1ErC58vFvtNbNRc/3rF1xEccCqB9vBQfBjT9Era
	 mvP82ypeT7c0cfRhk9Lw/ClKSk03m15Wu6/uRLO7jjyMnPp4GKDek9E3Wc5d4g0bUkjaC
	 h75YgD070OrG4mTy+lqRF5mW66f9xPWw0wrhPyEByRZ5X5S+edVmyK5+nJYvLKpPHPZbW
	 o12FeY1LmKUW7julySpVmk6UwMXnIuUyEmS4Matvb6yG4OmdmD/+LWWN6OZ7R2TPpNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904014;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S1LeOnb9CDFOnmMEzFnVdGeJ3OTcUQn2u1YwjX7C1y8=;
	b=ahPNYUUVmIl2dCHp6PKR/kowHdH3cP8GGwJzRDui+vv1no+tHRvAXcHTeozQBuaVyju0
	 aOpTC4EeieBbtEi04/EBh9o/sdO2TP1gFJ2G+FRgdXIUxaWCy1UGvdXZ55yrXxBiPNbvt
	 ZwUiT/bZeNGbE+s/GgB1hDM8DGNulCIrJjr39DKQqYukY0l/1FNCbYYyE5QHUgXb5Md26
	 y2PohaMRbxpMlYlu8tfjmRgXdb7aNExip0Je2jNpz30Ebh1o9lQIhFqw+tcUUnooaPZzg
	 2bNwWy2CxccPM5QWNm61DKzW7/lVKxPsLuTlP8x958Ikg3hNR+H3cGwzGgCN6QUSmTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="t4Pwump/";
	arc=none smtp.remote-ip=95.215.58.239
Received: from mta1.migadu.com (out-239.mta1.migadu.com [95.215.58.239])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D59D606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D59D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t4Pwump/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XHwomVe1Ix4OLLbQmSLS20ZMN+cx9WZ34HyiAIQySOU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904011; v=1; x=1794508811;
 b=t4Pwump/cphIDvjtOKlwfiseLctg38XebVr1o/EN9AqEuGMVBalgpJGh+/0zqpoeLuqj4KRq
 vLzvzprJFBL774kUUQzR4HkhW79o1O5vTLHaNbkI/NWFD/WLtJprCpCwYmoqq/esRWgYGjwrGac
 7bmG52kwCnqXKcM1sMNTua0M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id e0c6df93f7b2e87a;
	Thu, 05 Nov 2026 18:40:09 +0000
X-Mizu-Trace-ID: e0c6df93f7b2e87a
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: chenhuacai@kernel.org,
	ying.huang@linux.alibaba.com,
	Baoquan He <baoquan.he@linux.dev>,
	willy@infradead.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	alex@ghiti.fr,
	kas@kernel.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	baolin.wang@linux.alibaba.com,
	Nico Pache <nico.pache@linux.dev>,
	Liam R. Howlett <liam@infradead.org>,
	ryan.roberts@arm.com,
	Vlastimil Babka <vbabka@kernel.org>,
	lance.yang@linux.dev,
	linux-kernel@vger.kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	yosry@kernel.org,
	qi.zheng@linux.dev,
	luizcap@redhat.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 04/32] powerpc: mm: add PMD swap-exclusive helpers
Date: Thu,  5 Nov 2026 10:38:48 -0800
Message-ID: <20261105183940.2236717-5-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105183940.2236717-1-usama.arif@linux.dev>
References: <20261105183940.2236717-1-usama.arif@linux.dev>
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

Prepare for keeping a PMD-mapped anonymous THP mapped by a PMD across the
swap round-trip, which makes PG_anon_exclusive have to survive in a swap
PMD and not just in a swap PTE.

book3s64 builds a swap PMD by running the PTE encoding over pmd_pte(), so
the PMD helpers wrap the PTE ones and reuse _PAGE_SWP_EXCLUSIVE, exactly
as the soft-dirty PMD helpers next to them do. It is also the only powerpc
variant that selects ARCH_HAS_PMD_SOFTLEAVES, via PPC_THP.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index dff8790a047db..458c85cebfa65 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1060,6 +1060,12 @@ static inline pte_t *pmdp_ptep(pmd_t *pmd)
 #endif
 #endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
 
+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+#define pmd_swp_mkexclusive(pmd)	pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)))
+#define pmd_swp_exclusive(pmd)		pte_swp_exclusive(pmd_pte(pmd))
+#define pmd_swp_clear_exclusive(pmd)	pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)))
+#endif
+
 #ifdef CONFIG_ARCH_HAS_PTE_PROTNONE
 static inline int pmd_protnone(pmd_t pmd)
 {
-- 
2.53.0-Meta

