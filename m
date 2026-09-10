Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24E4825D2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041783; cv=none; b=EYPrnCKXIGsnmoyZhvrE9WWCN4iOoVaY127WrjhHGCe8WYfTul9ctx2P01WIgQ4K/sof2Bevdz5IHI4kwvYQHe3fDtgOdyDkVHsXfuuh+Qp1a4j9P+piGbYE3MQP2wiGCpKvY2z15dL+ce2eg+IMtDhS5QBEu7hModTZh3oFeMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041783; c=relaxed/simple;
	bh=n05nd2gOqrE7MnKoi71ylY2ERmggyhsXbG/A0PYB+cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hx4mQEbYK6xYaEdWxXJlRLZtkOn0tqA6gphfjWCb07n1pyQt7BesO+T0OreRxZ9CtFeH+0oHUDpgGSPq0Lgmx+L08AcocXwGbLltV25pSzz6KoUjb7CNYAk+qvHk6zRGImwVpcZhBzV0zhpgZ+RDetCW8q+083aXLCaMW5GYsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=e3XMao9J; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h6WSVLIR; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="e3XMao9J";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h6WSVLIR"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 07FD67A0041;
	Thu, 10 Sep 2026 08:03:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 10 Sep 2026 08:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789041780; x=
	1789128180; bh=i+eq01ZyefSmr6d5OlM3Mqwv3cqLqDcRLOfX9U2ttRU=; b=e
	3XMao9Jtt5cKGQR2StPFOHxjNhnlH+KM78Bk9e8qphJaAiwsiIq/tqXzAzLJcJon
	R890L+n6Z9KJfRq1GCfBsPFlg41OKgxvTSFB3LvW7h/aZDnGmfPRaRHK8R8MntoL
	JLx/gPgn1Vy3bGoVtLteJA6XG2lwchbglZ5GEKqtN/W2oqCCHQsgoOaKL0/AAkWW
	gR+MgNsdMClvl/S4AoUio0Fm6FfqY6ulrPM7DCO5Q9QrwidrmkSEdDjNpG4QQ8D0
	t5hHwbKKzyNOQSrfhUM9K05TMYNWDmYO6w3iyUbUHayG0AF17YXc4673mrbJ+5oS
	Qky2ae+BEq/UBddnqLa6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789041780; x=1789128180; bh=i
	+eq01ZyefSmr6d5OlM3Mqwv3cqLqDcRLOfX9U2ttRU=; b=h6WSVLIRkvudhqu7s
	I1uLv247vGEPvst/A5i2Q+4GDwVl6bFTMpdjvweqShRNzhVPX5c1ALy9eh3oeO/z
	j+vHCt6eRwcUquM7hxKnFaVXRmYvJ7rwl0vgoWLdvFuqn2GvlMo6obMjwh9P/CcP
	u2DFYJ7IrXP1TQ8G2xF3eU/yTV7jb2ECP/eaZY/E/NtfJrLWlHxQG59O3HyqO2M7
	EvvcC5HNsjEhOpAS55r+ZZybEz8tzeQkZGydfgUwByRe0018zNbiqP5EhtK06k+n
	mOEl7AmJG7k08qTBvpLGnilACvMnNI5Nh+olzKOYwl1MD1WdUwUWNKjx7eICY0C8
	osWcA==
X-ME-Sender: <xms:dJyiao-AK8wOl_1c_TcHuFNiiE1r_ruK_nzN8vTKBrjCGKdlvsg_2w>
    <xme:dJyiasr1HtNzgGdBVoIJgdUOi-DPqaYGqEiBWl1F_sTiTQblZ2Qc2rToecOBgJec0
    zqvoKTPqFq_B8MEkgtvNEcxwajj4taNxPL5Vv83nUmEghs-BsWSNgCW>
X-ME-Received: <xmr:dJyiakK_GzoCT-4Szo2TpqHKg8t-r4LZxpjfjTQ3B-t5mG2EHgxRdljPDZs>
X-ME-Proxy-Cause: dmFkZTGH8GFWwEUBtPxKJ67Rq2x/vdej+Q6nUCGcsDIesBFp0X3hc4jYyZuxmlnDOcFOMj
    pjMT1hhilwwz+XztIrpfsk+jOgPg51Zko9HtX5FOXtwZM/xuJUIPYajGOB/mCLABcXoBUN
    tOK7IZxc0LQBxYWwS3D6Gb3+L6Rzatr9ZhNURjEQibWJdyHQU+pHQvTtQJMa086Ym+yd6R
    IInk1eh8W3seorGmDJU/iV1zGzfJwWvedZT0VKJsUgZ7fACBrQNd9k3L4EzTZNF344phSI
    j6ov0R0Vo2eJRufAS9ocD/WtRYG80u0cUfKpHkiyow/cp96ftI+MA3MvYDL4cDgvN+YPPG
    fRRoz69BGBlITkK/LSke5bri0wWGJeuTSXrBdqgFR2AmcTn0QklmXi9hR9ckuC2cEN5St4
    ua3Gjf98LYsRIRagxKu1OvxBNeGrAncStQm1puanRFRCh5145vT6aJEB8yRYFEePWZjpFC
    2Wd2atVP/y/YgyZ1OHjajTW+iVe2fwHNhT/VTjz4FTkVYWvS6OAYE8Pkjsr1r2zZ/FP1f8
    QEMd++23RwdcOAZEcqBM8kCUcL7jhZDY3s1C6V0em9DHt9GTrEYwhZVexEuOWHMZchUEfg
    ZUZCLGM30ZvYpJLotneYsm3cxOOLa318xExILXQQQjz2+hBAu7jn5zdj105A
X-ME-Proxy: <xmx:dJyiau2TI1v9IgexJUGpt4RqCsYRPgG-lO_YnBeSdT9ARZkIMFN_ig>
    <xmx:dJyiarWcSLZHSTNBTZzfdCiY7ZamHxOAUntEpY9tyBrVIb7g6olRPw>
    <xmx:dJyiasXyueNGyRB8bn0e7-I1E4s3b_BCVo2hcHgEdpmJTBT9FMyMSw>
    <xmx:dJyiamF7hPQxTzu_v15x_L7XkJWMeCXNGYluObt0jzEJVtun2BMVNg>
    <xmx:dJyiakXdwYCQl2DMT76s5ZM7hKTwilAIQ1Dwty-NmlxRWt5noylLE4mC>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 08:02:59 -0400 (EDT)
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
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v2 06/12] mm/collapse: drop the collapse_possible() wrapper
Date: Thu, 10 Sep 2026 13:02:26 +0100
Message-ID: <20260910120238.2529819-7-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910120238.2529819-1-kirill@shutemov.name>
References: <20260910120238.2529819-1-kirill@shutemov.name>
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
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 16cb94ea3455..2a9f6d8d6695 100644
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
 
@@ -2857,7 +2851,8 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 			cc->progress++;
 			break;
 		}
-		if (!collapse_possible(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
+		if (!collapse_possible_orders(vma, vma->vm_flags,
+					      TVA_KHUGEPAGED)) {
 			cc->progress++;
 			continue;
 		}
@@ -3170,7 +3165,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
 	BUG_ON(vma->vm_start > start);
 	BUG_ON(vma->vm_end < end);
 
-	if (!collapse_possible(vma, vma->vm_flags, TVA_FORCED_COLLAPSE))
+	if (!collapse_possible_orders(vma, vma->vm_flags, TVA_FORCED_COLLAPSE))
 		return -EINVAL;
 
 	hstart = ALIGN(start, HPAGE_PMD_SIZE);
-- 
2.54.0

