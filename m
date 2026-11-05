Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904033;
	b=HWK8CcBAS2aVj6IoRvTTx1KBT1d7xa0t6EczNteUCShVgNiXJnQsa0mAqiRRddHemkRO
	 ZhUYRVdtLmaYy9ZFRScedYZ186myeNId1enCptmn9YkkB+moIj/VBJjebjqyzpOWZwq0a
	 adeHY7SCjIQ7m/BwK7LmrdSIhp5uUp+YNTOtdZIMQNXiaQjWL3NrTocChIcQNYeSzo8E6
	 eZNH2doBR10GeoO3etsQVbTC7SJacVZGxOpgl/SDbDAOlJePUNyx/mOyE/D6vIu2Hx9hL
	 QfvLIIxoaV0rxTAikh742G4hoRKYl5aD4VdYes03o6TEYE6Y1LzfVdxOc10grIzRoRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904033;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oFQCr7m3VJS53WKkGLDYfsPN+SWWbvo+wFSmzZ6dt3A=;
	b=tcg1kdZS3jxPAJGqfHBfUHwVE2iFawqBAxn+iW/1NFoT5oep2p+PNS2nPiD3wWdgzDoE
	 4kjXRU+ufvt6W4UEerWhVBwlNM36rhESUynKbQSOH2yOuogjUeLSl+SxqcZNRn2TZr8Io
	 hJSvwJWnGDtRaOojxPFSfpk6VUeuNT/vlVCnBij4uLw4lyomWO7krkiaVYFBRbAtJ7Rv+
	 4GZZ08oumW735AHnrQMk13d3GsqyYrZVNihppA2+Lzhieus50qFz/9WC3gWwQGyexPRuP
	 Hh/EScDUsjhrFI9dLIi3vTJNTacVdQcB8GpWru8mMZar1mqni4HOXftMJ7gmpT3EsWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ys07SmHJ;
	arc=none smtp.remote-ip=95.215.58.11
Received: from mta1.migadu.com (out-11.mta1.migadu.com [95.215.58.11])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C592F606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C592F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ys07SmHJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pLzdrNFS5rkH0iH7ngCOM+5sJEDVQrr95NdzUO/r4P8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793904030; v=1; x=1794508830;
 b=Ys07SmHJ2H/cIoQA+Q0tN7SuPuvVLR+FtppzrUHVPEl8PTOi0RosDXZ/Bzsomf9DT900ihDI
 heprMEyH1mQBtsgkRxuMgyt0lf9tInGLxfVuO2cJcWmK6Zdf7LaJ6084VoQGmNz5kPXg7ffuouN
 fTxdXB4UKAFImREglHl+A9Xo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id ac5bc4f198cc9f78;
	Thu, 05 Nov 2026 18:40:19 +0000
X-Mizu-Trace-ID: ac5bc4f198cc9f78
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
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 05/32] riscv: mm: add PMD swap-exclusive helpers
Date: Thu,  5 Nov 2026 10:38:49 -0800
Message-ID: <20261105183940.2236717-6-usama.arif@linux.dev>
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

riscv encodes a swap PMD exactly like a swap PTE, so the new helpers wrap
the PTE ones and reuse _PAGE_SWP_EXCLUSIVE.

Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2ebd5fa5adc58..fda94dba9bb3e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1219,6 +1219,21 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 }
 
 #ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+static inline bool pmd_swp_exclusive(pmd_t pmd)
+{
+	return pte_swp_exclusive(pmd_pte(pmd));
+}
+
+static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
+{
+	return pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)));
+}
+
+static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
+{
+	return pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)));
+}
+
 #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
 #define __swp_entry_to_pmd(swp) __pmd((swp).val)
 #endif /* CONFIG_ARCH_HAS_PMD_SOFTLEAVES */
-- 
2.53.0-Meta

