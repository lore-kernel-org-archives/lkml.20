Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815634973AA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590012; cv=none; b=EylYdZxng4JVqTEJ+HrJg0UY1340UWc0nys+aMQkMpzz68/WQt5WDqlQvR0LUczNmomCTEXiKNg12BNBDfaLl8HU5XbyE2mArXy9DCdtOGpA9KktAtJv/+XWCLBk4Scs0nAS8VtycG2RLD8MfpSS/Gk88tBmlBejDNFMtxuDzGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590012; c=relaxed/simple;
	bh=IbMmbths6rpdmkEDC/qQY/1Zornjg79Jqz+9FdRyqE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCxrBIo1Qmc52vxRoi1texO4nUx6KfOrpYKljT427SYAvwLEuPT3SjFBdv+GnL2VNVKn9gZtLTYvg8axXCo+A4PjNkx3MXFoWsyq+R4jOeuB9XwGp2VBLyEI44Lj7t25yjycBAecAcVzGXKHvnmaOQBAmVnaSXfrCstWiHUXL2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=RYciL++X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l6Fc4pwt; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="RYciL++X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l6Fc4pwt"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D86FE14000D0;
	Mon, 28 Sep 2026 06:06:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 28 Sep 2026 06:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790590009; x=
	1790676409; bh=9PaQT7qTaOGvZkOpnI76MyqzTTpuh1i8/HxIO+fGPfo=; b=R
	YciL++XDUqVTAZ6TOwsr0KY0vEjR+UJnXzHC440gpqvPIKFM+sGID5F+otTHRnp8
	RmGOGuopKgcQYRjQkvR+04uF4CZb1wSJKUzBrYQa0g8O18oD5KRSaOAsl6xBQJwY
	RdPcMUSjYHY3PnoELOaasZPPA02ZdU0icBtIQKkILW3sfbxL8FRF2w9evWfI3iIW
	h0zQ/tP78ZfNQ6w9Lz3xfvrUEA7T9UnlHQTDIoalO4r5D+9DFABMzV8x5QqAIenN
	N2Y3XiGb7KgnqgpikxGfVA9JpKcZf5KtBq6nxdhNS/YuMJe8pCXSnBCEMoCOVoN4
	6NwnKf627FJ2QXs+bjP0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790590009; x=1790676409; bh=9
	PaQT7qTaOGvZkOpnI76MyqzTTpuh1i8/HxIO+fGPfo=; b=l6Fc4pwtHrHskpz1p
	DnZWg7cfnp4M+giIrESKSyU2WL2X91laMk1wu8yxfEKikFr5Drw2BNWP/qTEhETJ
	q9DIMicNDiJ4ip6+sjddQVXYyi/0xoVzPvB5cZJf19f0/TjRulpEtzq9J1deNQ/h
	pGP8fjtWYAr6tOLc6okYnTVpImdSVeW6JqoJigq+f/am2ZSkgZjdmRijQEL9Dc/3
	5ZBIko0ZT8sp3JWnx7PNWCOvq2bcpC8Bs8/AY9vw9dpWVXhO4O+Ih12ozXcL51Uf
	qMDonOh/qEWg7Iuw3akCOdj0BVAuo/rrL34QpP5M+hE25RlIkPRdW0SOdzMm7dBz
	qvUNQ==
X-ME-Sender: <xms:OTy6agn3Z8arhOlEmBe-X0m8YtV30oXSneneCvFfHE4l61re4XFqoQ>
    <xme:OTy6arwDx7VkxMvuZfmB-paHVdgYdJ34lwQY8zcJFxqg5J_l_spmmj9ZNoYkEFiFa
    4wAlEYiFH3C_BPB3dx-ypmv67lOBJlqRxkrhXMEOPVGpjGtn8o3J_g>
X-ME-Received: <xmr:OTy6akwbSW8LEq2KS23az2j9PSwBRPci-W-g7WmOAafrDRtdgu9VmQkuMwU>
X-ME-Proxy-Cause: dmFkZTG4PJbO3UAUv73kvgZEv1qLl5z3Oxsi3Ojn/Cc1gjyQPAY4pttCRQI27MH3dZhDE1
    QOPy+mv452PPCSDsPFoXsadZBBemUC7OEPjfBcMnl1HRY+YTKUqrnPjkqBcWGUry80H8PC
    /K6WQA/dTtmOEop/aiwEwk7y/N5mXgzmzQwcpgiHqOtfdhP6k3WxKdxsMyJsyB6Hvye7b7
    y8KqhRd53u+yghVVISP0UmiTClCERv2XAI4oMribMzYWNytre02a5omAhHuTKchvkb64ds
    QZyxNlGi6Daf2p9KIHOOPKsvpCSjo6Or9ZEQkSNGQE8W6NOQ2qvEeUYlVLLdnIfc4Nbbrx
    qa6eMGDCQsoULDqrTHT7PP8YjZPMt+Vo3DQ32XOFXFb0YpZfPoyitxknwsVy16MO/DCA3b
    Y72oaSlYevlgIO/FPuvj57Nr6uoYW4OANasY6P/iwD/NGMPe6ehDKNZbX8JR7xb1o0kaPb
    iuvql9OLGqTdQpWAch37J1iXE/NceJgb0h4NnEKVpDTSF8feeoGsWB6RzvjAvJiASkJiBh
    MuQ1R0F9hUnpFeXybgT3YKePLrIwo4THgsIyT8bwgvOtT7afk3HgN/9bkx27cWsQWqIo04
    dbqazUl/0S1K/A2F/AxcEcdVuE96oFfzxj50xcTUYY1ufni03uNZ/85SS0hQ
X-ME-Proxy: <xmx:OTy6ai_AXEVEX89-Wb5c7mKl6O9XePKlPt318d9dGmOqyZoLMZVB2w>
    <xmx:OTy6as_AO9fjvECMEpTC89rWZP9QWhGyWttEYwgLBA0iflWVbJ8GZg>
    <xmx:OTy6atetpzHkrNokP67v4Ga7PSUehbq1iYwAknbAQa3GdBjJtp-5oA>
    <xmx:OTy6agtOZ8m44HA2sOkitjXhM_m7a8Xufdxnali6TSfX8tXXtGTTPA>
    <xmx:OTy6alE09_rVSYimzoxAuap9i79t6vH2pHV58BeQTFNIkL4nHhP64ZBG>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 06:06:49 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v4 08/13] mm/collapse: call collapse_file() from collapse_single_pmd()
Date: Mon, 28 Sep 2026 11:06:22 +0100
Message-ID: <20260928100630.21870-9-kirill@shutemov.name>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928100630.21870-1-kirill@shutemov.name>
References: <20260928100630.21870-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

collapse_scan_file() reads the page cache to decide whether a table is
worth collapsing and, when it is, calls collapse_file() itself.  The
caller cannot get between the decision and the collapse.

Move the collapse_file() call up into collapse_single_pmd(), so the scan
stops at the decision.

Two things change with it.  The writeback retry re-runs collapse_file()
alone instead of rescanning first; collapse_file() repeats the scan's
checks under the page cache lock anyway.  And mm_khugepaged_scan_file
fires before the collapse, so for an accepted table its status reads
SCAN_SUCCEED; what the collapse made of the table is for
mm_khugepaged_collapse_file to report.

Preparation for splitting a collapse into a scan under mmap_lock and a
run without it.  The file scan has to stop where the anonymous one will.

Assisted-by: LLM
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 60ec7e80d554..89a4c3f5a91c 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2737,13 +2737,9 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 	else
 		cc->progress += HPAGE_PMD_NR;
 
-	if (result == SCAN_SUCCEED) {
-		if (present < HPAGE_PMD_NR - max_ptes_none) {
-			result = SCAN_EXCEED_NONE_PTE;
-			count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
-		} else {
-			result = collapse_file(mm, addr, file, start, cc);
-		}
+	if (result == SCAN_SUCCEED && present < HPAGE_PMD_NR - max_ptes_none) {
+		result = SCAN_EXCEED_NONE_PTE;
+		count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
 	}
 
 	trace_mm_khugepaged_scan_file(mm, failed_pfn, file, present, swap, result);
@@ -2774,8 +2770,16 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 
 	mmap_read_unlock(mm);
 	*lock_dropped = true;
-retry:
+
+	/*
+	 * SCAN_PTE_MAPPED_HUGEPAGE is work too: the page cache already holds
+	 * the PMD folio, and only the PTE table is left to retract.
+	 */
 	result = collapse_scan_file(mm, addr, file, pgoff, cc);
+	if (result != SCAN_SUCCEED)
+		goto put;
+retry:
+	result = collapse_file(mm, addr, file, pgoff, cc);
 
 	/* Dirty pages are worth a writeback and one more try, if asked for */
 	if (cc->policy.file_writeback_dirty && result == SCAN_PAGE_DIRTY_OR_WRITEBACK &&
@@ -2787,6 +2791,7 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 		triggered_wb = true;
 		goto retry;
 	}
+put:
 	fput(file);
 
 	if (result == SCAN_PTE_MAPPED_HUGEPAGE) {
-- 
2.54.0

