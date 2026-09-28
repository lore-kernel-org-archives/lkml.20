Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401A948592B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590000; cv=none; b=lfM/IAfbPjhLeoOlNfouV7Zkagt+U7tQJwCgb69b1hhKSX8543msvtsPUKqOg+toFBDcTCzJNqpqbrFMAI2dc4nsf5hP1NO3J8AQnZCk9UDXyzh4gE62EeUrQHCaCafr4cnw4gMZMEaafQiWn2nhGDa7ytaRU0cIshA1JLhfjcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590000; c=relaxed/simple;
	bh=oxEnjd2dyKuhhTGjfk6BKBCExMN4qtwFCYoytDhXk3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GgUOFZLYwuRxJOaUjhhrkJBFIlJkrPwQ04dzVKKuy6XLn0iyzzaREv4bhcmrxhbFCOgXe3LR8H/5Y60sxCgTPeZTJT/SDZUNnHIHYvNfcvbw2IfDBMNNDGQPsOOkwuv6iw+kDOM8PVQqv3Kq81ijIf2o5DroEPuyVGXgHj9DdLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=eIfj1EE2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FX2uFex6; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="eIfj1EE2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FX2uFex6"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3A02214000D7;
	Mon, 28 Sep 2026 06:06:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 28 Sep 2026 06:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790589998; x=
	1790676398; bh=SFcgFP6X9Bowp3MiNUNc4KNfT83IPzT+sj2xQ4bfpio=; b=e
	Ifj1EE26xJ+1Xkyt3thiOcfnSrjZZK8f5/2hknmmweH+hV/fl42jMJT1G4i/NaQs
	RkqVhR+sGXfOlhoDX8/YJlXdXZlo0l43wk5YryBpPrL1cK04mfYTYuU1s+7tUXN8
	V8t4cXhwneajfU5ye1GfpPzH+ULh3XAwUS8rEG5mRpLxdTHjzZWkQR9Rv6PhYLAa
	0xv0GjxjyEhW9wgXxttMDECdJRILXSNONBP4Hzj5QKG70lqowpwio39wnR6m8I0a
	8UJlmezLWLVcLIi2ZvbAq1sAqEaK3F62L8/Occ/u8GEp/bSNu3xsckgy1BmlGlFN
	g/8kT4dsbYmkAlG0nLtuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790589998; x=1790676398; bh=S
	FcgFP6X9Bowp3MiNUNc4KNfT83IPzT+sj2xQ4bfpio=; b=FX2uFex6PcbUMdT7B
	NhnVgIlcbDDKupjahE3eghemK3uZGdSXP7OYbYvH7A/c4clpWD7dceNSebtpS5ht
	AMENMzAb/shItcBVe/ga4/GShu6ef4eguSb7RsVqmviiRFUBzw+4X5kVMNwXTSVc
	swAwRyURrmcrOIy4B1mRU/viYp9H7kUWFIil5xpjMLAJouT2fom6GNGcknCXejPw
	bgLiQO535uxFpMIDyt108m9B0xqKYG+g71G5xPhLK6fDWTXsjo6JpzrT/AO8JO1D
	wS7ZdywTmYP0kyT13/yuEwPBVbUfmYGkwrItJfzVZ1qtt1LZJpIU2HC09HjPDWQ7
	kR1QA==
X-ME-Sender: <xms:Ljy6au1GJl6Z2lHxkqu_0g5yWx4qNw_ng7Y3xmuDlPBfIKIJ8e9f8w>
    <xme:Ljy6atDfxatNvCPBTwWUEPMRBTWFjwA-nDyC0I1kH9TWtGuiDS6TgH4cxLztDMdqA
    V68bBA00-1mAYK3kjaNGbnf3dfsKmxDP1i9g9XfmT5pz26tiNe88Bs>
X-ME-Received: <xmr:Ljy6atDH9mBKOl035VkHBkOlEbuVu1R-oBgFnW_mLN4h8zr1XiSU65oSFZY>
X-ME-Proxy-Cause: dmFkZTF8+FzWl2kPFFw+2+MUnNndpG3Es29zlM3W8MqBD0QW9993JqL27RjsdWHL5iQTuv
    8LHkef+10EFcRNyu6aMfBJblGtUMhigK1wvWUg5pa/T2F4HZOycwBRl+2S+z7tqw2cJfHU
    gdsF/P6BOMqpKS9LZRm0d8oBtyKEEqCXwj8zji6pXjSixGW9yMDmevXCSXRhMug+RBOuj6
    H/TPGEbj0UBxBpkklI8Q2dk1KPN1FfxQ05T6kAzB+fcPQyWzSSafNh6004OlOqdREfhbRG
    BHI+j7BDMASDclZuapGmxVrXolh8JlQnm8Hn+THchpsYHB/1yAmWKg/yew9Ltzw86nEqq8
    bKqUp8rATYVqUxwOYXBNR4CEdpEbrfQOYE8EwOaHhGp7YREpWnoaBA8ADGJ8u+aBo4/oJb
    pYWh3128Y249eByWZEu53WcW7ixM7wfQMglI6GR2s+KUExcTGzBiWTpGcG2lFDLMZ8Xsju
    o0f4vqrm8zA3Bm8+rrSDrR/E+EpCeRM4NfSakgxM/M8CRmvWOaEJ/DhAEY9QBGzaumAqoN
    OD3MK9D94t5dhMQHDo0E6DTgWmoMcY3wvM10Zd1NOhX3xhLSKX9SXzSUIpn1itlA4R7zFx
    xUQrEloP/qeTmILi4+b1YjK8Ula9PEPVy7nz8iI3JEdja6yyJWU5ySKa502g
X-ME-Proxy: <xmx:Ljy6amPM_bYsm2VpJ1A0_48NL4z4JCPlAjmi_eRu_BwLlQ-oZ3Hsxg>
    <xmx:Ljy6avOqtEE1yD5HJL-5lVLGMyUld6xHBSwUMxX6lkISEOAU05kTUg>
    <xmx:Ljy6aiu3rzojY025sMXoD_4etdmDenqo2ieu7uxyiYakcV7kxnTasg>
    <xmx:Ljy6as--pEvoAR2DLTr_nT7XSOixEVkCD36XZw2bHUNgiqFWmmPEyA>
    <xmx:Ljy6apUlb3mAj2z7R-mfPQ8gExVBjSL7PwOTQ844Hl97oL6_jhcg83Dm>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 06:06:37 -0400 (EDT)
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
Subject: [PATCH v4 02/13] mm/khugepaged: count collapses where khugepaged makes them
Date: Mon, 28 Sep 2026 11:06:16 +0100
Message-ID: <20260928100630.21870-3-kirill@shutemov.name>
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

collapse_single_pmd() bumps khugepaged_pages_collapsed for its caller, and
tests cc->is_khugepaged to know whether it should: the counter belongs to
the daemon, and MADV_COLLAPSE must not touch it.

The daemon sees every result of every collapse it asks for, so it can keep
its own counter without the shared path testing who called.

Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 75c876acf527..4979a93e3648 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2815,10 +2815,8 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 
 	mmap_assert_locked(mm);
 
-	if (vma_is_anonymous(vma)) {
-		result = collapse_scan_pmd(mm, vma, addr, lock_dropped, cc);
-		goto end;
-	}
+	if (vma_is_anonymous(vma))
+		return collapse_scan_pmd(mm, vma, addr, lock_dropped, cc);
 
 	file = get_file(vma->vm_file);
 	pgoff = linear_page_index(vma, addr);
@@ -2854,9 +2852,6 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
 			result = SCAN_SUCCEED;
 		mmap_read_unlock(mm);
 	}
-end:
-	if (cc->is_khugepaged && result == SCAN_SUCCEED)
-		++khugepaged_pages_collapsed;
 	return result;
 }
 
@@ -2933,6 +2928,8 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 
 			*result = collapse_single_pmd(khugepaged_scan.address,
 						      vma, &lock_dropped, cc);
+			if (*result == SCAN_SUCCEED)
+				khugepaged_pages_collapsed++;
 			/* move to next address */
 			khugepaged_scan.address += HPAGE_PMD_SIZE;
 			if (lock_dropped)
-- 
2.54.0

