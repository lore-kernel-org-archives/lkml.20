Received: from mta1.migadu.com (out-49.mta1.migadu.com [95.215.58.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DBE47C0E6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934953; cv=none; b=rCyQ77An+BiqrDEU4E1UmOkN0roQT/ohDAAKNVkLPSbMKwqqxfb1/OeS7CPUQKPL73bhzGdSQTwajpr17MWBN1DxSHHth4qgPDxOWvmLF9zvpYhRonqMeUeUI06V7iufeSLAiTDubUKK+EZbgdv3waSyyFTYefVDM3IIgYLF7sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934953; c=relaxed/simple;
	bh=yLbeu8NRgqnSY1gRBUCVHYrl5OSNM+m0QrzlFEGTHE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHQd52mKzaUUeOdcPhpL++4WrfZ81UbJi9cIKRgI6pAXkaOHQHKcCbWfqyFayhQmpGhpPjb/3cANR2KqJVmlr7SJIGmaLU2DKXUaXr+f9r+yGHNxFAmWJoZ9J2YWtdOK4RG1UEUTi5OINvGd4+Gu/3rtr685muF3LW7Oszv1eMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Rz9HdD+R; arc=none smtp.client-ip=95.215.58.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Rz9HdD+R"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yLbeu8NRgqnSY1gRBUCVHYrl5OSNM+m0QrzlFEGTHE0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790934949; v=1; x=1791539749;
 b=Rz9HdD+RWadtzDC2IkH9AjmZ5Gx11BOiorSc7yPj/xrZaPFLoM61kVC9dcptaifgBtVN9cHN
 K0gRYlqOiBohaNhc67fGyQCLUxZNuNoC/88wbDbCe4AHdzaLPOuD3m3gf1EENRtuBfm+8tvxNXF
 uxFCa+BCeNO2ot7fYusvXGzE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 6ad150664b81311e;
	Fri, 02 Oct 2026 09:55:18 +0000
X-Mizu-Trace-ID: 6ad150664b81311e
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
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v8 01/30] mm: rename pmd_to_softleaf_folio() to pmd_softleaf_to_folio()
Date: Fri,  2 Oct 2026 02:52:15 -0700
Message-ID: <20261002095503.3585565-2-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002095503.3585565-1-usama.arif@linux.dev>
References: <20261002095503.3585565-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmd_to_softleaf_folio() reads as if it converted a PMD into a folio. What
it does is decode the softleaf entry stored in the PMD and return the
folio that entry references - the direction softleaf_to_folio() already
spells out.

No functional change intended.

Suggested-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Usama Arif <usama.arif@linux.dev>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Baoquan He <baoquan.he@linux.dev>
Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
---
 include/linux/leafops.h | 4 ++--
 mm/huge_memory.c        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 4c1476ae32343..7c13c58a5e218 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -657,7 +657,7 @@ static inline bool pmd_is_valid_softleaf(pmd_t pmd)
 }
 
 /**
- * pmd_to_softleaf_folio() - Convert the PMD entry to a folio.
+ * pmd_softleaf_to_folio() - Convert the PMD softleaf entry to a folio.
  * @pmd: PMD entry.
  *
  * The PMD entry is expected to be a valid PMD softleaf entry.
@@ -665,7 +665,7 @@ static inline bool pmd_is_valid_softleaf(pmd_t pmd)
  * Returns: the folio the softleaf entry references if this is a valid softleaf
  * entry, otherwise NULL.
  */
-static inline struct folio *pmd_to_softleaf_folio(pmd_t pmd)
+static inline struct folio *pmd_softleaf_to_folio(pmd_t pmd)
 {
 	const softleaf_t entry = softleaf_from_pmd(pmd);
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 7140a1031fb2e..ee8d46827ffdc 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2518,7 +2518,7 @@ static struct folio *normal_or_softleaf_folio_pmd(struct vm_area_struct *vma,
 
 	if (!thp_migration_supported())
 		WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
-	return pmd_to_softleaf_folio(pmdval);
+	return pmd_softleaf_to_folio(pmdval);
 }
 
 static bool has_deposited_pgtable(struct vm_area_struct *vma, pmd_t pmdval,
-- 
2.53.0-Meta

