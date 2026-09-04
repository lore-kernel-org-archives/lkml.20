Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3274EE876
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534646; cv=none; b=Ig6tl5x0yYQs/0a/rawi5M5RbcDf1OC+j+P26TlaEq9bTD90dw4O6Pg+nzQ3DhfEDK/LTPyRfl2+syiHG1YUm/JyNGiR4QTcceuP4d+ByOUSmmHQE5YhUpOujQ1t3XTiUSSFrz5fne7d01CG3E9yjbxzcFPjFabCQD+i4+X9ZTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534646; c=relaxed/simple;
	bh=5ZEuPx9Q3vDmn9iVMcqwHHzUpAZcyMrU3Y6gQyuzihA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptxZJu4nHOY9pABw2DiEnYrw2mpbM2AP8XQTPk4xjEPoyGCujSPQEVnhhIOCdRIpNRi1Xy+sr4zT5HnrRnpRe/zBow29VMMDVbCOpx65hRqGFlVJcJL1hlSY6cXwSlWrlwjL7Zii1mPMHb/x9GVxyl0rAc3xESJg7f5ZOpPGmxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=aiNRlLY0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iZKeYrJv; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="aiNRlLY0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iZKeYrJv"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4ED2F1400122;
	Fri,  4 Sep 2026 11:10:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 04 Sep 2026 11:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788534643; x=
	1788621043; bh=DqDmzPS8A0heXGsnD3SSNRWbRweyoQUnesWHCHkvF4Y=; b=a
	iNRlLY0yFkRuNBNoMOTbkSBg1NEQpfcBCqEzNvxZ35G8wJh8ENf5lzdLKFY5qew3
	ecSkTJS8YSzk9BF9e/xqXFOSW7We+/WvuO4qYCj2AoIuR+dh+jr/czK199UXzRmc
	FEO+dJ2Cb1QgDKLHsT4aibC+HGfUvqjoIMz64fC9vA0rEfDvuQYHd+Jx9Q7WzYoD
	EqAw62HLDm0esEgxpS+t1ghUMey/kzKjRNBvgH2z2fgX5aLDt3C+iVVnARV37AbQ
	4BceyOe6EyHyHWxcT+9AtiwmdiCo/C+JoaMRJX9cpBQhzZ96AKTZ4bSwKWRJQ1dX
	cdmaIQgPBRlhFTYEvpiEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788534643; x=1788621043; bh=D
	qDmzPS8A0heXGsnD3SSNRWbRweyoQUnesWHCHkvF4Y=; b=iZKeYrJvpGiY/Nr47
	wz76ETjHnIlha350S2w8hadghwZQBPIe8uQpDqpCQiA/sGnFZjhyTvUuiXlhVhuA
	vEkKcRk6EvY5Q8FezNEu/h65F1nmO0IcWZOyM7ifgmeyFUHUEwH+zy9d5A2zQ2O5
	EPwjHoM06+cGOrDhOe7XmbMSM/VkYZGg170wG/MVOl0UDoQepb5MDY2v196Z4K/n
	GQc2zHWlSquhNKXpgcMBpeJMTzvWxHCy5WTAuiZfo8MSgJgbSrS7ISzjN1uwfGva
	aj60SUzvEf73AsP3T2xlge9SO2eBd5xmjCIezKe1leJFqZ536kM6yIzXqjSeMSd2
	Od4gw==
X-ME-Sender: <xms:c9-aahALs0SsFLMW-iUtuWCG3pO4nNBN-49gc2e1M7V8orKYh8xW2A>
    <xme:c9-aarfUMHhl9FPhyNcznwCuXURoomBNhBzvbJ8cvIcNsry2K97U-UeYW5W20GA5b
    IuDRZMBQ90qgn_ts4NRUvzXQ8b3K-1V_v1uVWZMB2bS-aAfv0qoKZQ0>
X-ME-Received: <xmr:c9-aaiuYfJlZuZa82g4blGgMBSF6BQ27ugmycf4m6lVBT7wlptKFqK4U_jU>
X-ME-Proxy-Cause: dmFkZTET6cjphBfz4H8Wg4Mwj3Q2fsO4rbzY0RZa6uwdK6ABZ7pEhWaf3DWE0Wh23XozXl
    YXqBYYUtwtfZ1qQ9wX2bCqZqo/yq027VrzWqESBcvph06bOS8vyiOGOCS0fh2RY7A/kSFI
    L9MElk4eZ3HddGFY9A2GQHzM4/P7C4mhUDQ1iVikEtpcmuF5W8uFTm0u0CjZbROqFnINk4
    xO1zzX/Hj74YRRcHjJyG4ygWf0Hx5RhGZptpxeuVNBh7kD8dz0lfmQnwRvV5yZ57YM54K9
    KH8vVIjAAxpTayQfOZqnAJ2Uka0rmt6zQ0IYLz8TzxO+2W2OgPHZMW2lenfH2WoNpxg3WD
    kFoVBGZvgOEe88v5nMnx07Cy+ZRyXffepGnIEKsGa7dZWyUYqFYxlmHpu/pujCOsKJzCP2
    G18G4R9ED1zc3xEMfxQd1aA5krFgZzp0SnlDTDaiszQev8U+2LtqTwJNgLFIxDCoe4a3XF
    6ju9R760FF98GTSg3YFQhFvgpzntzkCc1enEyfOroI+8l8scsQ7cXGkotwLuub8q3xzRh3
    qP/KCxPHSRHdftib7Az3yS8wv2Cec5t0zf45Weo4/GQ8LlIODtgWu+Fjgo8hyfRskTHX/T
    YZbFGnP/OYDfQs6JjgDvfI2B+wbeptAoGCnnJluV5+xLZHUd36GfWHdI3Log
X-ME-Proxy: <xmx:c9-aaiJFDf88E5BiwfO5E0D02-zlu5E1WgiVYQQJjvmpMbSpPpnPYg>
    <xmx:c9-aakau2siB0seeLVNuifDhSVu3EloVHKt5v2k43_rHmNi5W7FlRw>
    <xmx:c9-aaoKzX_dzD9tGbTU4Lqy2amciJ3dN5Bpper-sl9Gnum4Uemb7fQ>
    <xmx:c9-aatpZfdG2WlRXbDWmNUOMW6DSK_HNv5QTBECxw4Z-svml8t1SMw>
    <xmx:c9-aai5pfguVhU9zArI3gk4BNBysVBLt4FIxV2BYAMPEGv6dyqTNiiq9>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 11:10:42 -0400 (EDT)
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
Subject: [PATCH 07/12] mm/collapse: name the per-table scan reset for what it resets
Date: Fri,  4 Sep 2026 16:10:21 +0100
Message-ID: <ec3d193817dfa5d0e4fa2f31642c066ebfdd3151.1788533997.git.kas@kernel.org>
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

collapse_control_init_scan() resets what one scan accumulates: the node
load, the allocation nodemask and the eligible-PTE bitmap.  It runs before
every PTE table a scan is given, not once per control, so its name points
at the wrong thing.

Call it collapse_scan_reset().

Preparation for giving a control a real init and release, run once each
for a whole series of scans.  Two names a word apart would then stand for
two different jobs.

No functional change.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/khugepaged.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 22272cfe97e6..511ffb381fe9 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -550,7 +550,7 @@ void __khugepaged_exit(struct mm_struct *mm)
 	}
 }
 
-static void collapse_control_init_scan(struct collapse_control *cc)
+static void collapse_scan_reset(struct collapse_control *cc)
 {
 	memset(cc->node_load, 0, sizeof(cc->node_load));
 	nodes_clear(cc->alloc_nmask);
@@ -1579,7 +1579,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		goto out;
 	}
 
-	collapse_control_init_scan(cc);
+	collapse_scan_reset(cc);
 
 	enabled_orders = collapse_possible_orders(vma, vma->vm_flags, tva_flags);
 
@@ -2660,7 +2660,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 
 	present = 0;
 	swap = 0;
-	collapse_control_init_scan(cc);
+	collapse_scan_reset(cc);
 	rcu_read_lock();
 	xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
 		if (xas_retry(&xas, folio))
-- 
2.54.0

