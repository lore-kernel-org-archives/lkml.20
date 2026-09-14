Received: from mta0.migadu.com (out-53.mta0.migadu.com [91.218.175.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484E9472533
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386226; cv=none; b=NFv6ra/Q99SEGDMDAXKNJy5339Tw983mahI/KdWxU7dwVsbvkdDvavbea5nHnxTgurZNGQBIOJfC/rsIbhXXjjrL3H69zYY21qiv+EJxCMktlQY04d02q9nHjsbARSn6thdC5hOxw0FmsqNUsUkk8ZKSDP9zKssgcCcn6uNZbNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386226; c=relaxed/simple;
	bh=QiAy/7wN1ydZlsQx7DI1Vjrn3FeWZdoFpSxlDD4vX6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WeaazJ3zIEuF23qEwth8zJzhZptXSy5Rj46397RJ+CsmG289wfRErl9euJCXug+k/ySIIWajwaWhjuH8sLM3xZ9MaCfYxUYG4OyNuGPDiPV1QP/ETYiVbyOps68S42mdS8l73SYjgozTvnTNMETKCsdrc37zY1Y+LfuAVW06YHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hcBSm4jP; arc=none smtp.client-ip=91.218.175.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hcBSm4jP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QiAy/7wN1ydZlsQx7DI1Vjrn3FeWZdoFpSxlDD4vX6A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789386223; v=1; x=1789991023;
 b=hcBSm4jPMBIpjvIfnCGhAFOAJKHuhj3UAXNh8mrYkUXO8thEXjh7Rjac2+h+WQBfgMpgnG0X
 wrYcoJ0aFQznK3/J2yPmOo0gysXIT7Go3yYDNqc0kDY+UDJdN0iHtd2R/qs7jX8JjznaQqHcCo6
 AfrO6WgOIPD+nlUcOCku9MQc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 44564c864b555350;
	Mon, 14 Sep 2026 11:43:40 +0000
X-Mizu-Trace-ID: 44564c864b555350
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
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v7 03/29] loongarch: mm: add PMD swap-exclusive helpers
Date: Mon, 14 Sep 2026 04:41:55 -0700
Message-ID: <20260914114320.12988-4-usama.arif@linux.dev>
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

A LoongArch swap PMD is the swap PTE value plus _PAGE_HUGE, and
_PAGE_SWP_EXCLUSIVE sits outside both the type and the offset field, so the
PMD helpers can use the same bit.

Cc: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/loongarch/include/asm/pgtable.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index cf29a4c8ac593..87fecc3a51001 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -351,6 +351,25 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return pte;
 }
 
+#ifdef CONFIG_ARCH_HAS_PMD_SOFTLEAVES
+static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
+{
+	pmd_val(pmd) |= _PAGE_SWP_EXCLUSIVE;
+	return pmd;
+}
+
+static inline bool pmd_swp_exclusive(pmd_t pmd)
+{
+	return pmd_val(pmd) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
+{
+	pmd_val(pmd) &= ~_PAGE_SWP_EXCLUSIVE;
+	return pmd;
+}
+#endif
+
 #define pte_none(pte)		(!(pte_val(pte) & ~_PAGE_GLOBAL))
 #define pte_present(pte)	(pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROTNONE))
 #define pte_no_exec(pte)	(pte_val(pte) & _PAGE_NO_EXEC)
-- 
2.53.0-Meta

