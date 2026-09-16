Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E00A4A8FD3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551132; cv=none; b=DDEM5dgRCCL/ZIBkCzZ2PP+B5+e+X1SA/qGjiK4Hx2M1tp/QpEOhtxJmSifGrOwA8DNc7n3OWOGahq1qk4F3+FwN3i4LzZpDFP+LpAF0zy7Twa9Xd5qgZvIDgVVkbNTcwc/UbVT32xxrtHr8gNNvV3I08S03/cEf/eyT5gRA/vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551132; c=relaxed/simple;
	bh=oZSNA87hap+8LZsY08iTLDC7668XQYqV9pSMcwVgaSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4MblTEeUXPpC4KDDsm2y+ifvxP2DH6XichfI27kflzIPg3U9jw4+ZBjU3zmW7s6atjLZ9YZYPRvef2XaD+etAdIE4Ka9Qq9iFX5n7tm2G0lMJaeSZ+0CeSP5kXi/hgF2xsNJYE/zPwc42RsEQ+FOSNqTF1KD4lNeSUmnQW0t9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=H9elMPvj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TunGcNhJ; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="H9elMPvj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TunGcNhJ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 875557A008D;
	Wed, 16 Sep 2026 05:31:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 16 Sep 2026 05:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789551114; x=
	1789637514; bh=8kffjeZ0BbAQk8WNkrJMcG1UR27PMTOcUlnehRZ4hss=; b=H
	9elMPvjJgiSJuYKab+0Y5yu987oSGjYEACb2aiWsREPZcMO/L24u339TXnzLy0sY
	BrwD8LAymA8MsPdbmyyGF2d3C1gsfNk963ky5/znSRAEQhTQTYaNp9CNg3YinTXk
	yu8XZPPYDeltgWfUTkXgpznVTVcGZxZiAUb7IPMCWTbs8/JBWuOSVed2TvyQjSXl
	N+njdR33I24+71rdDzxL9GLJ2gDbczy7xW5uvhXYz5JW22EwbFWR0Q+9F0TgucX9
	/Dfz6yUPGbyyGPn2yQq+qsKPcTa5416T5tdjS4z3PuDf+39UjjWPMi/UFHCpblMn
	SQVqpxDaA/tcWp1erBM9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789551114; x=1789637514; bh=8
	kffjeZ0BbAQk8WNkrJMcG1UR27PMTOcUlnehRZ4hss=; b=TunGcNhJR4yEJp/xS
	6RdkSwFK2RxkFqK0H3jeo0GIGoLEj6v/AmRXZJ0KKKfAW27OEsKMq/zz+SSqTog/
	WUGhQbro6FWdR/IVZxmm+wnRhsOd8cCcA+PBgtHXwBHm01Gt6oGu6x/JGdUgYmdk
	vykveAJ72Q5DxTnuj5wIr4PQeL+TE2/UJsGJ7OIig17YuA+TkBHtLfGp1xdqgu7z
	CPyEtt3aWoM4RmPmXMq88lvAB5DzuB4E5c49FFMmD8KE5UeQO+NzD8qBCIYuiK+3
	AOJ5LCW1j4UM59S8ZC3bXSyubN8fLKGarEyExOYe/eb+rjO5VPE4ijtCas3BcrqR
	CdzNg==
X-ME-Sender: <xms:CmKqakJ_T-9lGR53O7s53BmxPBZCn8euYug0fweUNKry0hLknti4uw>
    <xme:CmKqagE6SyesxqJS12WKfxqSZnW6nJhDvVrTNcR64GUhjDhKP5qb9cQAWy4wUmNrJ
    fPu-QNX8bHMEkITzyHLI5C2hbEXuzvKIRjvfyVaWNpNL2fLVjQaFcXP>
X-ME-Received: <xmr:CmKqaq008mpXIwXUuNFU-BYkGbNfGUIlq0oBgAGqS89ky3NGKWW7wsoGy5A>
X-ME-Proxy-Cause: dmFkZTEOpyDQEfQMjLyldXBPAs1OiAaYjuycA/zprc2XA0sZE/gLY53LzRl6wisjmJsNcj
    shXh7L3amtO3W7Dj4gJ1brhV8efHSvbbvvisq8qNCVrU/hVVqWW2fJ8EDoeL9EfJt8J4fa
    r63UA+S0A+UN3c16swmwWrTj5sK0gOy7RYH1CN+xe4D6TTQ1ncSXBFkweWqSBfk0S52Say
    Dntsl8DI3TlZwS0igZd1iO+ltDo9n3qHIbwcYcvcbVUlu6Rxag/XK6s48+7ZTTYlI2aJe4
    hkL/jN/KxntOAh39VLdXeraBW39brB+PkStvfnz0wMlwqVlAhF3nsCCzTv21LQWeSF/ipH
    aSMoXw7Yrzq75z55RCiNMGl8Zjz1OaWOivnaPIGs8vL43WJY+7nhtZqGYOHlPycNBy82DP
    8yITUE0MSeu1TrcwigSUkhmilfFGG6a8h46LQ/DEOfydYCycrcQ6fVhus7GOg+CfLPs/gZ
    SVT0jtv4TBzMKs8Vnlas4qXYQdYYkPaLGWkFHKpFPQ8hjyhbQZdQvMxvs76toKTR60zQFq
    c9HC++mznhIBchm9YPND7TW+Gt5T2VRACZnh6SClCmaY7wc9WPa4Ycgp3A+M5swF6nr/0E
    ouHUVqUa7HdcMJiCcGWJTSTBoeMKxCeXXw7GaXguOym/AcnT1kp2xzykiKUg
X-ME-Proxy: <xmx:CmKqany0ldwpuWbIMrAOfuA6xMYhl_6ErGtGNW9lKdJHBZtBiJTYkQ>
    <xmx:CmKqapjz9GJ1iUbZ6_MIWCV2f0IZNax-0bsMS4X_j4XxPoIvKd6otg>
    <xmx:CmKqamzjbjLD4KSo0zghpBxhJ6EtrIwMpa6awB3K5r3nZYcax5SYaQ>
    <xmx:CmKqanz8uLOV4G1zrptcEEmKkURETOwZ2499qkrFbCQw1rjBzWSgvQ>
    <xmx:CmKqauJKRPOBurD-so1TYvWrx3RuTGnoE8Hf3Kfiv4oy4oYlgXdiebs6>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Sep 2026 05:31:53 -0400 (EDT)
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
Subject: [PATCH v3 02/12] mm/khugepaged: count collapses where khugepaged makes them
Date: Wed, 16 Sep 2026 10:31:29 +0100
Message-ID: <20260916093145.4022188-3-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916093145.4022188-1-kirill@shutemov.name>
References: <20260916093145.4022188-1-kirill@shutemov.name>
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

