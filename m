Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904002;
	b=aR4tHYolANU+uUX+DRZGeSxsG9Ev2rl7bxZGLAhtZe0/UDJ1kmK7gxIYO9Ikn1FxkI1G
	 cvbQL63ErMZ81DUTQapU7CQS98kPkePeRCApYxzy0QrPJbhcjDdWwOA6mg/CVVQqcXBYE
	 E5jO/A2z1+C/ClbXSD5hJ3X4K8E34V6tzDeKWnz8hrfW3sQ0g9BWyDxPxq2YFTb/F5wuY
	 sfYkB5ZcCNe6vtNGmRKgxTvvhMI/KJZTqYJs7kq5RcIPMZKVegeiq+/tuXNvLph3Z03C6
	 trAhHkIKxtVeQMV44BJX9S0bsRnFlLRgRUsY20quMrFi0qXLGEV86WPmJ1bYoXv9nOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904002;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lYBFuxLfjxEha3Zx3xH+M3FFSL5fyPFntbBy1o8Jggo=;
	b=A40MhPHLscXP3Wsk+D1Q8o9QIKHuPe1Wfl0Bd6Bkucw/o4yLNIUaRUMk/1DOmfaLF8YA
	 SLT0dy//1XCcPmztl4fn1cvPDn3RfnYJUpUZMF7EqRfyxieu7U1uJ6XNgSA1gdgd80l5P
	 vJPsePEeiFNEOxMPCjWaNDBQGf/ZPRYi//r8ib3Y1tGtmqqZOovpxZ8JAuZThIhxPOEaA
	 XyspM+0pkF7seiW90EuNSqi2XdPzdJeq35Am+gI9J4+A7RWCE70lvUY7PWakmssQFNRQM
	 53ToMpyOylYCDSoxLVSrBHrJVYvc8nT0TffMTjJMn1eKpdJpEawpTnPrjuQvOPQdENg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AQ3Ee0zm;
	arc=none smtp.remote-ip=95.215.58.203
Received: from mta1.migadu.com (out-203.mta1.migadu.com [95.215.58.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE35606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE35606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AQ3Ee0zm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XRcso4PQ7v/i8n+ltndwCCW38yTYyFOtjhZRQfQOu3s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793903999; v=1; x=1794508799;
 b=AQ3Ee0zmoGLIrzFiqbNwH2X6z4iaE4E+ceCi77tS0EPnX4dETtsMFXi2XkALaPbkF5CBGMMy
 Kdn7kPwMRZDlQSnK7ZZE3U30X8kBunbwyKCdhgzdzRqW1CENcx+pkRvpuoHq84DRccjbVL7mVny
 VBCbRoF4lj6cxAjAaJn3j8cQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 2158ee7e6f7dbbd2;
	Thu, 05 Nov 2026 18:39:59 +0000
X-Mizu-Trace-ID: 2158ee7e6f7dbbd2
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 02/32] arm64: mm: add PMD swap-exclusive helpers
Date: Thu,  5 Nov 2026 10:38:46 -0800
Message-ID: <20261105183940.2236717-3-usama.arif@linux.dev>
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

arm64 encodes a swap PMD exactly like a swap PTE, so the new helpers wrap
the PTE ones and reuse PTE_SWP_EXCLUSIVE.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/arm64/include/asm/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a474c9fb485ad..dfcb4b9e66f39 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -560,6 +560,12 @@ static inline int pmd_protnone(pmd_t pmd)
 #define pmd_swp_clear_uffd(pmd) \
 				pte_pmd(pte_swp_clear_uffd(pmd_pte(pmd)))
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+#define pmd_swp_exclusive(pmd)	pte_swp_exclusive(pmd_pte(pmd))
+#define pmd_swp_mkexclusive(pmd)	pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)))
+#define pmd_swp_clear_exclusive(pmd) \
+				pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)))
+#endif
 
 #define pmd_write(pmd)		pte_write(pmd_pte(pmd))
 
-- 
2.53.0-Meta

