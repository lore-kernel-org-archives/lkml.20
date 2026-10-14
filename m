Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837435650E7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997952; cv=none; b=hBgdU4mDpwtXyN2/2Z7dzxp1hBmK47g01qkQzNzMq62G8a+6mDSn4k6qVmGNiEPjt5hQyHfcevB7/fpKspjBfsDinWS1ZjOKu6GrBmoefPpGsAoDMIegkQuoWqgpUOhOWYpnNNxITnX896rHAI2GtgmAavDRH8IHanhT5K1Skyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997952; c=relaxed/simple;
	bh=3NzkCC5O+FEDTyPbEARYLY8ygurO1NO+uvOO/hNfwpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ma0Kq6/DPEJVAZm+40bCUOeKfQjBKWM1LJ87wfTA3PejoHr7UenlFGZWpkTkrQ42amh7m/53e64Yes8jaOOH8JngBir2f1XrJl5AZWFcE5UIKMH05M6UrghXq6MhGNX6Nnla9+ZlH91Qby5bOHZ84mOT199VzubhUGoZ5lybMUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaM75o3m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaM75o3m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BAD1F000C7;
	Wed, 14 Oct 2026 17:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997937;
	bh=tE4Nouxbe18VqCAKs0hRv8AZoWoMV1442HL0oYf55VE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XaM75o3mI6pelfaHhRT1T+bhFcI6CyaObGxu7udvQRvXbDw7bIRh/7JnbA1bJOR1R
	 KQK2IkCTo0OoQMJoH87iAdkmQwq2yFcKqWR/7twPIdxVnjNMY6TtBk6el7v99BFBXO
	 v20UHUCdO8GgLx82qrAk8fC/VHILw0oJ5LoIqJLn/l6dfbfybcvPuNOKebItTgMkSW
	 tX5ycMey7upLQDWSRv+9++61k/c+WoBdWjE12ENJAU+BtRS3M9vG4DAxGgnAXfTand
	 z/jjEsl/D9XRXqDt0spTeBy90r0scFRkHVNIidDggke68/6IbhsqbHsA0Ssp8Y+TNB
	 /F9+mxvUfgZDQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id A1BC4198003A;
	Wed, 14 Oct 2026 13:12:12 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 14 Oct 2026 13:12:14 -0400
X-ME-Sender: <xms:7LfPai_gUs5IOIXCUK-7z9qedLXJppntMdsbedFi7nWLGftJCLNwOA>
    <xme:7LfPaupsTAWyyrMkhzqgwPlrji8-org4ExE61KhKIiwhkERWGWbft9faS2TTFGq54
    P_YvWLOe6yXIDBTRXJzd9kx8uF4hoQCfkUf_kgfE1YxrGtUn_lQNOg>
X-ME-Received: <xmr:7LfPauI3_gEaUg6qwhhUtSATsxSAhmh1USIrYQJcuq6tWnfvgK41s-NQvSc>
X-ME-Proxy-Cause: dmFkZTGg3k0TVKsEP7CfoR57WWB+3h574BO5vjP4iWax6f9GidZ8szHobtaOvLAEbPCZ2m
    mw+y4/PWP+fl/ZrEvowyJM606Aqux2KjdkbOrs1qTyDsxUDjHhZTWksnA7am7MGg9VukjB
    qcXL+mBtcoMF0nKIYV1Ko0CB5fx2IplfPHhSynDMYzb+URxJm2HhB9bzqvrzy4Cvkw3z4+
    1ufb70dVHftr+eFTK65fTPkzZfMFIkT+fPjngxsm3eiPLOeyYT2uqJ47ZuQsB+0l7i804Q
    fk/9VtLe5apNPJHA5iwMfFjFMaiWANNYkGgKJdhqeFkBwi3mvIJ1y0E25HLDGDGvYAjfPO
    wgKlVGgK06TLK4ylVIU/L9XTKnWUJcbcnc2+drc5n1QpsX/5627QWFoL7ReBqhtFkREkdI
    0ZC6+V7VkKZG0Ajp4ZVbry5+s0NEKfTl2Zqv4lw1iWNasW/jcNQC5hgvhBCt11ByTR4aU6
    4m9rrItXQm8A6Javh/PpVIJBqcTZvcbON86/czwQTnHiaD4aKMtYGyTf/LqjB6Scuy8md2
    ko+GGwUQ/NLnTmLmtiTs7mKdghSzBwiQ3uPhA9oub98EiDiYqXrtVa5iQCicjUGzZaSS2R
    1I2vq1oMkBeEzA5COg09mxpi4FM2I9ao0gc5bpeUZksMuGenm6t9X/6hTNWg
X-ME-Proxy: <xmx:7LfPag2wcOI5BGFPL4YWAuHaUKtwIjdyeVA900oUin4qZ233-_vCng>
    <xmx:7LfPalVW4kaDPJJgqz7sbq4f7ycEFDcP2x4BrylT00NBDy4AJyXmyA>
    <xmx:7LfPauW7c3GHXpVZHOxy7PkkLMiGR8usB7_BGkFvAov1Kw8NuuFRaQ>
    <xmx:7LfPagHe0WBHi9qTJzrXeP8ATNwnFN7NzY2lq9DW0puGE7jpAGa4xA>
    <xmx:7LfPaqsD16_Sbg9QDybvbNpihxQamfOEqvVtDgRmn-j_JAY2BZkurqfA>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 13:12:11 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
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
Subject: [PATCH v5 6/9] mm/collapse: drop the collapse_possible() wrapper
Date: Wed, 14 Oct 2026 18:11:39 +0100
Message-ID: <20261014171145.3292736-7-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014171145.3292736-1-kas@kernel.org>
References: <20261014171145.3292736-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

