Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809484EC66A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534644; cv=none; b=WmFuF5hlm/nghWnk+6HCjFSWAaix1ATyNVgVd4F/pUcao+Qx/yUTmL7jCxzKW6RecSBDiPGqF5WXr64oQTOBcp5mV2EnVk4pg7ipNMberXFRGh7HzcBFOFStLGn3T8OBH1rpaKtwb3eCG8bOTDgyVnJ7QG+PopOd3gQRrluZH8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534644; c=relaxed/simple;
	bh=4SwiAWgnMxZCM7ZH+Jm7F+4dNIvxguffe8DUPkPElq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rn3J2h7PA7bMhdGNcnof23cfsrHGHInrkqRuYDlmeUW2hlOhL0WqmmrE45myfrefgKp5DN2GsbGpquYrXHOs4VViD1+DGDkvgtuZOT+QdfUCOSDFQL2TVycEq9gkd+pTs8VkZyF0vTj0mBswOdEbnEruFodkRbDgWe2YHfANQuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=XwaYnG5j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DX+ujuqC; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="XwaYnG5j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DX+ujuqC"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8DED61400106;
	Fri,  4 Sep 2026 11:10:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 04 Sep 2026 11:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788534641; x=
	1788621041; bh=csaSFAKtS72MfKNk/auWa3JqV7XZUOIFQz4rsLI1NhI=; b=X
	waYnG5j1sSW2fwEzdyndDYCRRtS4ErnAiqu+9/6bftCwiKT6VUiCZJ1AdCV6cZqv
	FpAdvxcgEnOXmuigqNFSCvGhGxnk/WJ71//t2I+jw2Lhm1v1zQ4PwefHaKZhpFEv
	5365GptykMY+ws5agze1/r5HJmw1RPftgMBbJ9GMI3NjjAMwP6eWjb+pmxmBn6OZ
	36BqbGhu/f9ifoK0sU33hHsGlm7Wu1UksKLt8r2dU6MH++9hin4zN33/zIt4i8T7
	NsNds6UrQF+LxguJcPRqdTzvAkHf5somE3LPmdV6XtqMzxuzxTgkBj44etoqjE/b
	ocYQFy0RPos87gZANUWuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788534641; x=1788621041; bh=c
	saSFAKtS72MfKNk/auWa3JqV7XZUOIFQz4rsLI1NhI=; b=DX+ujuqCNxKmXGTWG
	rrJ0ev8RZB/VwCcBAgnB2OSN1Yzjzjw9iUp3LJodqP5FJ+7fkh6eUGtyajP1x45N
	AxBEpGkwhHGRjREV99cTB3wFwcJesYGu/PtcX92vlNPK4EjweIjL94lULMS4v3FQ
	X8Shq0T2jhRnEVNwaDR+8Ri+wNkPhoUOuEnvdhDSNc6Ze0ioUA99is0TjyqknHgE
	KIvMor/UZdd5BZdQhVjyvAX5rxBl6VVz4F3W3qC2BKH1PvpbdvRNFsmtJPd6lrwd
	q7tkhc6FOTE+eNHv5cck+e6xMnNpnNXP0oGmngJmatSdSnZXhzYDO4pKfiAexanA
	msRWg==
X-ME-Sender: <xms:cd-aauSu_FVyReBtVERC8V_XlC6GKDcSMxwoo06h3TQfJuhDbMTQPQ>
    <xme:cd-aavsNLN1DtOpjRAohmNQ0wPpAweCEvJHkz72rSezX-rLlGrpxY4Io5W7o2aPUM
    YBFuIYCgD5jZ1C9E3vPLef0xcrC-QrDRKeyNoh4VVquZkAIgT_ZaA1->
X-ME-Received: <xmr:cd-aah8SlxC0IuLw_E5Dv6SImVfsRQtrrRK5AoQfDdlMnlz3_LsFiv2lXWs>
X-ME-Proxy-Cause: dmFkZTFdOocfRN4jOpcQf0AqfSai/YCGo+xlO94MLvzn7lqitof50EENUNEgJzLPt2H+RQ
    DWgrwJL5dg2BaLkWQfjz0w8mX09EzID7A24sM1R0CcrzJ0aCsxP+pgO1accdG5RnvXKoNP
    Qi2+ranCgsFBQlrx3RUM64Xgm9l9zr2TPWbzFNtan3mUwkVlJ/gBEGXolzLuuMZ3CJ6e8L
    gmzum6oDDF3av5ecJE/wINba64+XlYa/U9oL8c0Dkr16eu3wp8w8wOsHTRTsCgO4oV0meO
    0fb7rtZliPO8XPlA3k/rGcTv+01JWMnSe6fG3OACTE4UctUjoP9cM2YnBbUckeF0hhckLt
    MMHeYhNDUPl4H+anSl0bx4O31nPweggRutuPuOSD3x0SBk0h7PGsgbLKNhVs6w0dYfOFiK
    uYRiJbsY1zG3wyIMbFQDDpgC56vqbkfDVNXSp3AcIV3y1+SR/EVO5E6n2mSmw5kgS1Faln
    KMe0a7IYL3FakTwavg3ixHmnnqMW/ll9wuw4GLGJgwQiA3X9obmCgwVf36wlnRxDap0Eki
    tDwPFPWlgUMJdvEnd+0mPBdshgAAjvK8sQxd7Y9dei+aygeLU8zgYgO4eYrnVK3AQ+JjML
    OjzR8R+srhjyw4VZMOJryhJc0YwyTEIK8RraXetOdXVeQhlZwH0f/tNpkNow
X-ME-Proxy: <xmx:cd-aagZq1IPMtXg0W2mk07KCR3zFtIaVJh4epJW78UATn2MzeapKcw>
    <xmx:cd-aalo7-vb1_gFqoZUKENxQ_v0ExsXdNpX2rTtZ87XoqN3FMfNIxg>
    <xmx:cd-aaga9_lmsJFU-iHImfckSAvrd03PjXsLKWURmzVRAOrUaw6bDYw>
    <xmx:cd-aag7_cO94Bxy2X7d59MVFZOZ2Ua_RFky1WoUN0V3N9L08VBL7Sg>
    <xmx:cd-aakXM3ypMzNY7-Kd_TLFjhIXlTod_DvpT1af_9k2AWH9cqsqfPeqy>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 11:10:40 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 06/12] mm/collapse: drop the collapse_possible() wrapper
Date: Fri,  4 Sep 2026 16:10:20 +0100
Message-ID: <e6780351a3a29fc1a9efb7d2fb2ef6d1466a50dd.1788533997.git.kas@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788533997.git.kas@kernel.org>
References: <cover.1788533997.git.kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_possible() only forwards to collapse_possible_orders() and turns
its mask into a bool.  Its three callers can test the mask themselves.

No functional change.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b2ebacfcc0be..22272cfe97e6 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -512,17 +512,11 @@ static unsigned long collapse_possible_orders(struct vm_area_struct *vma,
 	return thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
 }
 
-static bool collapse_possible(struct vm_area_struct *vma,
-		vm_flags_t vm_flags, enum tva_type tva_flags)
-{
-	return collapse_possible_orders(vma, vm_flags, tva_flags);
-}
-
 void khugepaged_enter_vma(struct vm_area_struct *vma,
 			  vm_flags_t vm_flags)
 {
-	if (!mm_flags_test(MMF_VM_HUGEPAGE, vma->vm_mm) && hugepage_enabled()
-	    && collapse_possible(vma, vm_flags, TVA_KHUGEPAGED))
+	if (!mm_flags_test(MMF_VM_HUGEPAGE, vma->vm_mm) && hugepage_enabled() &&
+	    collapse_possible_orders(vma, vm_flags, TVA_KHUGEPAGED))
 		__khugepaged_enter(vma->vm_mm);
 }
 
@@ -2864,7 +2858,8 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 			cc->progress++;
 			break;
 		}
-		if (!collapse_possible(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
+		if (!collapse_possible_orders(vma, vma->vm_flags,
+					      TVA_KHUGEPAGED)) {
 			cc->progress++;
 			continue;
 		}
@@ -3177,7 +3172,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
 
-	if (!collapse_possible(vma, vma->vm_flags, TVA_FORCED_COLLAPSE))
+	if (!collapse_possible_orders(vma, vma->vm_flags, TVA_FORCED_COLLAPSE))
 		return -EINVAL;
 
 	hstart = ALIGN(start, HPAGE_PMD_SIZE);
-- 
2.54.0

