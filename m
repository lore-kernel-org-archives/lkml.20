Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903996;
	b=4WWTAxJPwRbyvGkQbzLswdppdcCQQwN5lTj5okkdLtIHdPG/x3xLPHTqOJRBrDJNa3ZJ
	 j8pHl1vtUdvo8WgzGnFhDcddMwUdy8Nx38jcYARDLYpSp5snJWvSoZSz8nlHCu4vOLHkX
	 vDQeyFZIPzKX9Kkfv0zZY2Q4CwdWm+62YUc06GWD6WKYk7w0dqbMFmIrSUm+EMZqhktxk
	 yG0Jp89wNctR+g4CeU0E7yRDGOWV76J6+l+B3c56+hEL0kqQPmz3vAI/1FBAmENxZR/3y
	 8Bjmu3cEm07+VNI3dnBpAzROJo2YpRc2RX7miqja4GAf1hXmrvKOqVgm9aMP46xf1aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903996;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=31fzmOt0FaYCeiQ/tx8wUE7G9kVsrSfC5pQ2mgLEW7Y=;
	b=VxMJI777ObP31CWFvim2Tanm8oFXQ0Pb5/LWsT/APB69NRujC/xzI1rCEOJ3Y+l21jZu
	 eQy/aI+7o2lfAzYrRYkEOT33DTtlRgKL3/5BUaB2gUcWa9Yii0NiAm99UsMilju0uf1I6
	 o9Q8poHsxv6unc2ASg00hUxHn6Iz7WC5fq+9DtiwusDxYdvPuKTFY9R+btqwl6eX39vm+
	 frtjeMvufOzcWxEXfYXvCc7TM3TXDrw5Tx90D8JF8E0GCuctyLMcYAX1KKp5ymNkMu/nC
	 SkP9v+t2H15++3R2wcwTDxFAH/0QcWUSgwm0oWd/VwaNNKybD54ulPAdduu3dMssYuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hE2WxQ19;
	arc=none smtp.remote-ip=95.215.58.181
Received: from mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A736606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A736606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hE2WxQ19
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NVSvaau1XB8Yml9Wa3VUU7m/rYm6KsytcRcD12Fn9UI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793903993; v=1; x=1794508793;
 b=hE2WxQ19C/7BXi0JBo3cP2SACLOm8qPtTBDKL4qNwkfQwkIZxBkY6MetGV+H+JqVGssDtcA0
 ZXEz+wQUR7vZufy1lta9/hGgFDudbH2jhXEnkLNQRQfqQ+06dlNcNf20boTN2MuNCZEOR2QiE00
 oi21vQC6YybEDBHw8usBckMM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 64e6de2e787aa644;
	Thu, 05 Nov 2026 18:39:53 +0000
X-Mizu-Trace-ID: 64e6de2e787aa644
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
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH v9 01/32] mm: rename pmd_to_softleaf_folio() to pmd_softleaf_to_folio()
Date: Thu,  5 Nov 2026 10:38:45 -0800
Message-ID: <20261105183940.2236717-2-usama.arif@linux.dev>
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
index cda3c886ec533..e425a5b05aa2e 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2516,7 +2516,7 @@ static struct folio *normal_or_softleaf_folio_pmd(struct vm_area_struct *vma,
 
 	if (!thp_migration_supported())
 		WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
-	return pmd_to_softleaf_folio(pmdval);
+	return pmd_softleaf_to_folio(pmdval);
 }
 
 static bool vma_has_deposited_pgtable(struct vm_area_struct *vma)
-- 
2.53.0-Meta

