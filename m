Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950F149739A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590008; cv=none; b=N9XRbo7IIP0xrH1ImdN9ESLyUlKzVAkW8LlQvLK50MsxVUPL7IhkztQR5mMM5uEn2gqtMZqIQPKEyYkVcBd48L8b/LJuaVIUsH8MBy2yKdyzkO6Owq3N3P6hiFM0sTCuIa+zifNI+d//e3fA8aRtUwL0f5CDvn2D2ZvKfJqu3W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590008; c=relaxed/simple;
	bh=AvTanL9c1kOCwxEzITWihMZzHVTIoMs1FfVLzKsGdH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qjsris+M8hzMJJf+iA+bn0Kk+dvdcOzAzcnBlbES/q4L3ZcvpgvS9zS4Yt29JcxIoxKV4B+XT1HZndxkvBeb+8ujdBFKkt+ec3VxEfleiYzQbN1K+OYIX2tyENkvG07od88hFRSMHbBhovv+lXJ6XBcKNkKWsX/Q1mJDqbS7NBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=sTTGQT63; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SVnqndZ+; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="sTTGQT63";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SVnqndZ+"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B997214000DF;
	Mon, 28 Sep 2026 06:06:45 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 28 Sep 2026 06:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790590005; x=
	1790676405; bh=JtRYOCEnMOR95o5EOlNDKC9VUn5wRBd2gubmY5dv2n0=; b=s
	TTGQT63Pntq2LjwZvtXgxR/xDhXIYeK0+4FYAt44PykRKNm0DBNfPJ7HITIWZmHw
	cX+MzMFq24p1ymeQx+RQCf1YsH/ckM+Qi8/nLS0IdMpDBwJl2mxdDQbyna7+ySj6
	o589TBE7mC3yOCCcMW7qNpYg/iMDnAsccTcqkdGYDwySytPVx2/vhkexkeT0GDbD
	YsUGY3+6fVGnbqGMXPb5VAqKQ8yf5BxdJaakhi9Whlvf7oaVCGIHg7P/TYzXuUeX
	fKVfaFhFBZRDHmpsx3/MsokTd+Tf/uTSL/ziHIsOR7GQj1jnJl7o9czi666rP9cY
	sms+uMGy+e+jKmWEOpBnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790590005; x=1790676405; bh=J
	tRYOCEnMOR95o5EOlNDKC9VUn5wRBd2gubmY5dv2n0=; b=SVnqndZ+hQl9iKX29
	8yko6F1vCw2fNVoXNX19aFHB0mKr6f9tSHPlLpT7X+R08A0tGv4wnSDsWC5CpL7a
	Ym8Tp9FREHYC3XKKFa/pXcS3+LdATSZ9tXVi7P+U+hfM6qTHJTIZAPP9WEmd2MjS
	/ZpwyoHmPvT/QUZpNKTvSaGQXSh5e29E0qyyIhqLQYXo0DYlxwchsg2f0I59b6KP
	CeblV/+XW0zzt5ie2lA/RPrT2qNu9rYFkxwHoJsGr8Af3mxkWJc25R56iqOxMkMh
	ZupRuKVLZURa8bKuog8fQYpCbYsoqZuUQCal953x0u5lTe5HXM1R5cNiitXhh/h3
	qs+VQ==
X-ME-Sender: <xms:NTy6ahPhNi5hUpaeytRCxtbUB2LcDJwhty4uxsPdHDFobl4dYw_uXw>
    <xme:NTy6av6lXTy2AbMqs9NWUfqZgTeoozv6pi7ZeJNSkai_JS8QNPEJATxKZ7wPsU-AW
    cMhPpL2G2H5C6X12SUKNpH1dpsdy24vcWiHqTOYHFvYnxsb04-L29I>
X-ME-Received: <xmr:NTy6amZ9C-Rmn3tjU15lZf0et0Pk6Q3ia_vx7xkXIWsGXa3aoYahLXQl0e0>
X-ME-Proxy-Cause: dmFkZTF8+FzWl2kPFFw+2+MUnNndpG3Es29zlM3W8MqBD0QW9993JqL27RjsdWHL5iQTuv
    8LHkef+10EFcRNyu6aMfBJblGtUMhigK1wvWUg5pa/T2F4HZOycwBRl+2S+z7tqw2cJfHU
    gdsF/P6BOMqpKS9LZRm0d8oBtyKEEqCXwj8zji6pXjSixGW9yMDmevXCSXRhMug+RBOuj6
    H/TPGEbj0UBxBpkklI8Q2dk1KPN1FfxQ05T6kAzB+fcPQyWzSSafNh6004OlOqdREfhbRG
    BHI+j7BDMASDclZuapGmxVrXolh8JlQnm8Hn+THchpsYHB/1yAmWKg/yew9Ltzw86nEqGg
    5CaI4vvICvPsPX0fZK03646dpkM5SROv5HPUP8HzHWCxTTJegvna8VrPPV2CmUUeRKsiYq
    AMwqMgP0CeJCuiVyMShDxnH8OI7MKJGUAbs9J1LSIi6jTukZ89VTi3NhABd0EXisMYHMZE
    jrfCbdSfZXeuniByVvV3ViP5JNxVUuVMyUo7J5elZOlOAEDl4ygxA9nRCbKtHjU+N+Gt4Q
    cGj1NUiSWqIWysHshIZluHad2T6ng7y7JqvLwrB4WyKoPztAxLZj1RrmmI7aunSFwGdT7m
    YPnGq4qdvvyekejuBi+ApTALvjKXD3KR7cpiHk5kWh1nPE8SHYW5CZ4Zk5wA
X-ME-Proxy: <xmx:NTy6akHhO5ygwfV7s7j_UNm5zPiEsg7Lx9PFoc1JURyhYakOzsyJWQ>
    <xmx:NTy6ankBi2Q9TXkef4Z3V8OnBaD9IgZMKY9VulcbpRnjeGE5FTh_vQ>
    <xmx:NTy6ajnyNpnQdqBOmHxiTlCNUk7qFRfmvclv5K4t6I_9ZLXprv0YxQ>
    <xmx:NTy6asV3L5-cx0eh-tGh3krJD8ii5_BptCDxCGu-DeXH_N-Y1mcF4w>
    <xmx:NTy6aku5uK1iRXvyVJfDx8mGGqu1qNMMgT3xrFjIAHdGEBdiUapXFiBA>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 06:06:45 -0400 (EDT)
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
Subject: [PATCH v4 06/13] mm/collapse: drop the collapse_possible() wrapper
Date: Mon, 28 Sep 2026 11:06:20 +0100
Message-ID: <20260928100630.21870-7-kirill@shutemov.name>
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

collapse_possible() only forwards to collapse_possible_orders() and turns
its mask into a bool.  Its three callers can test the mask themselves.

No functional change.

Assisted-by: LLM
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 667216ae15dd..cc69281c542f 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -494,17 +494,11 @@ static unsigned long collapse_possible_orders(struct vm_area_struct *vma,
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
 
@@ -2855,7 +2849,8 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 			cc->progress++;
 			break;
 		}
-		if (!collapse_possible(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
+		if (!collapse_possible_orders(vma, vma->vm_flags,
+					      TVA_KHUGEPAGED)) {
 			cc->progress++;
 			continue;
 		}
@@ -3167,7 +3162,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
 
-	if (!collapse_possible(vma, vma->vm_flags, TVA_FORCED_COLLAPSE))
+	if (!collapse_possible_orders(vma, vma->vm_flags, TVA_FORCED_COLLAPSE))
 		return -EINVAL;
 
 	hstart = ALIGN(start, HPAGE_PMD_SIZE);
-- 
2.54.0

