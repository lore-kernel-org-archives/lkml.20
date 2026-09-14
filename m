Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE1D45FFD0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386222; cv=none; b=ZrJclXu0jvact8mwPg+wg4pgtl70BXbu6AurcvctB++O1qNqtSqgXEw4Ig1rITLKNcHq3qLzAOcWC/uAejIzGQqHnisa5eoZOobwAzHmcfRL8qkqfjl5XykGGihj6qud9ugG093tnXfiMBreq/eOmKZkSnM3hs2vwtapnMZQq7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386222; c=relaxed/simple;
	bh=owEO/GVV8kpSqjtX6z75OJu1GLQvZh0Qa08KVOaicH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S3i+rJ4AbAIqOtkGqkBAwpcNApGpB8sw5S/0vm1yF8AeXJ8Kw1PCxNUxelHIoHCiDcs3bpE2rusvVdvVOdpKB5pc9axzkgVruHkXTGGb9Iv/1LjUTaN/I8QIeZNqaUg0HVYIpqYJWgprQtgnly7pTsk7Qvlie7VPttqDvBhMVbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R7+cVWz7; arc=none smtp.client-ip=91.218.175.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R7+cVWz7"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=owEO/GVV8kpSqjtX6z75OJu1GLQvZh0Qa08KVOaicH4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789386218; v=1; x=1789991018;
 b=R7+cVWz7w3fo5U3skIscCbLfFhg6IwQ3Py8M1Ez7nf03JK7E5Murg4rq/g5XMjrJcYlXQyrM
 F+VpZeKQJR/vmOacl3OIs0mZj28/HS06kWZkT/yxPuzTDMtFnxZeHtdJMyroE9m6Xe8N/veKm0I
 EZOEy23EuN8FPxrzdkNYyB/M=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id e21318cd8487db57;
	Mon, 14 Sep 2026 11:43:37 +0000
X-Mizu-Trace-ID: e21318cd8487db57
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	ljs@kernel.org,
	ziy@nvidia.com,
	linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com,
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
	Will Deacon <will@kernel.org>
Subject: [PATCH v7 02/29] arm64: mm: add PMD swap-exclusive helpers
Date: Mon, 14 Sep 2026 04:41:54 -0700
Message-ID: <20260914114320.12988-3-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914114320.12988-1-usama.arif@linux.dev>
References: <20260914114320.12988-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A later patch keeps a PMD-mapped anonymous THP mapped by a PMD across the
swap round-trip, so PG_anon_exclusive now has to survive in a swap PMD and
not just in a swap PTE.

arm64 encodes a swap PMD exactly like a swap PTE, so the new helpers wrap
the PTE ones and reuse PTE_SWP_EXCLUSIVE.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/arm64/include/asm/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e89ec5f4787b4..d3f53a601aed3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -599,6 +599,12 @@ static inline int pmd_protnone(pmd_t pmd)
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

