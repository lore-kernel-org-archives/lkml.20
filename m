Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92596466AE1
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761280; cv=none; b=fz0NvI4n6zkPc6EFTt/y9hNbKZwfzoB9q8Lp4KbHI5YBiIA4LUwToZSRNS6otCwY+XDgYo1x6aY2ZJ2MasfklMcof6qrmiHi5EwJavm1TVzVfayTUZjhh90Ya0Qz0eFMp/9HpuKeCgCttWo/YByRquSB0y9O2RgBcN4J35Xz364=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761280; c=relaxed/simple;
	bh=aAKaYoxGYzSGqNBHvJ3crn2OekC+cZ2GVuoy5Ya3xxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8PoP9LWu8n+Hs9JAFqEGFwSFPMjAnGZ+8PNYYaWDr0/WAm/tfviwRR8r9koxOEyk7jcjbv3w/sofzXFrXBCaSenxOpgs7wI2KUVHRz+9pOf1/Hk70vgxY6MXPW/iG+xLX2wULG1aunoPn+cMAfDmE1mV22fUEv02EmBljycpGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=BmeRnk7i; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ejWpx6J7; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="BmeRnk7i";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ejWpx6J7"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 285D6EC0187;
	Wed, 26 Aug 2026 12:21:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 26 Aug 2026 12:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787761275; x=
	1787847675; bh=cmrzZhAHwmnHLQBSELYH9/LSX3qgrbPWDwY3dINu6j4=; b=B
	meRnk7i4/XI6KegV4BZEImI59VLKXw56YnzEOvGO60CiHc/uZ0nK3d0FeV+gneIS
	AsCJEzxlGtqIIcTRb7JtFZr3lVwMHVVBia1aKLipF8rLPxtE/BZJ2llc+Di39fjH
	0SHDWJAUpha2tPTqv2kzT+fjhHmituWvXa/WGvus10su3zy5A4tbPrlJg88NJM4+
	Tet64WCgoSq6V/Hj3p7D3TLaFQGCcGB4rNTYR5mu2gfklqjI8llvcxyC1VCs2Fwq
	KFD8cACcyFcUN6y2XeOv5owWiG99hFtFx0hPhHUYrZ8wkUQEo+WgX3zBWSbEj/ZH
	Ico32Q6IDdm34t7qqqw9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787761275; x=1787847675; bh=c
	mrzZhAHwmnHLQBSELYH9/LSX3qgrbPWDwY3dINu6j4=; b=ejWpx6J74tHAufMpj
	7XLoWM3bhhjP5VDG2DonuLOvsVTDCUfHiM/TQELLPmrRCauui2mq5meecCjvHMh7
	pBdBOJxVQ8TdgZtvg9CXHL3uGyAx5X3YFtfPvfYP0S/BfP9LgBOSuAen6ofCvKrn
	xuAHMDxyrqQ2/EItGd2LQmeUC+VfGj/aDMlu0IDpiBnsilATuA43TbgfFV4smQgi
	nGToQ+RhfUXiUafrBnjp1leXQc1PSnSLF4+5t0QLzdMdGeo5G91GbmShShb0V/hx
	koLzVpMyxIHh4e+RzgelFvN5aBnyjfv0aPFBapbKyQ1+7ystv/k4f9pzuygnn+bh
	cF+bg==
X-ME-Sender: <xms:ehKParUrAi6KUwnPQuxZ3-i89pzC_se5A4PwMOiLm6gqObP5SAIMVQ>
    <xme:ehKPavj4URSQjRjD9KfzlEUh1IEmvQQxlbMoKO4gJNdAXiJtVh1aUWDmvY0XmyFZ2
    Ed5yQ8kJr4h-y2hQg4ScuNbQ9NQtsNM8em-8bSxMI7SzfGP-nQpiQ>
X-ME-Received: <xmr:ehKPathtF6SiQXAVa7JbMgcrxDlMytISqqaAxlHYoWXz_lLZOrrUTpr5QJY>
X-ME-Proxy-Cause: dmFkZTGQoFXZs8CLrQvTbejM+lWkhdLg/uROFwJkkdATYglJQ9SHaTyPScF7WW0mNphch1
    eVR3IrwuHAkanmpAerNXc7LEOghrHwcryVnAmLgLIPaL4GXTh6Gf9eXsnQZjwVJHef9Nrs
    XjK6EHbPUOVKLW/G8KjWjJxHy1OYo963c/G1BhHZSIx7ZY3LwB604TzNS8Xq6Jr9ckMbkE
    MjqIIDZQsE7p6THO4ictYaMIpGXnlY0dQOoSn2w6WTw6bO0i0q9IvWAu8XF2rUmKLTGyRX
    Jqh48bYKYtZOalk45de8iFcxpRok1lQ08CY/mb9f5H5y4UZckNDJztfoueevfEh2JUVUGC
    +JurL57VI/e9t8xJ+DvlYoK5+RPHFB+KTXBB0wuGkAGhVihP4/91L/lOXPnfjTfwFQZtKk
    MsQ3k23yS8R/wi8BqJXmA8KNThEVnTLIO5sly5bbA6OKBZFExvsH5Cl809fLcDFgq8Y5hA
    VMpPXlVduTMKmryDasnpsybR8RlV94zwLi/L4ZHralLZT6A1UkzqLx+2JHoOymZkSZP9dX
    Dy5HDmpa3RMiVa6+NAcO6voerLSaml4zQlx4aExKoJKq89N0u90cHlsIzTEXU+TBahhHjL
    vdHjnNji0oNR2j2D6qMRCrWNuc/ucrjf0i7EHE59Ixaksz6ruCC0AAfmS0Ow
X-ME-Proxy: <xmx:ehKPasutb6Ae41bAnzEvoxlE0bZ0eBPVLuU04crilIxVL2zsyyKVmA>
    <xmx:ehKPajsUlfNAz7JdrR8o8Q3K9Rkxtf8tlVf6zjLm5oPO5vlzLOfbGw>
    <xmx:ehKPatM6MxTHsWTDUy35vXtYhFpyL5vWytTIjO0OKw2Y1YIh-c_uWA>
    <xmx:ehKPale9zB8c4D6SZ36XO-TsdLl0ml5DqHW_qjh4-99WTSW-aB8yxw>
    <xmx:exKPahfivdXmOC-ctgYtIin5LKLPfjId8UmF03lLRUgyX5bkO0esvFIr>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 12:21:14 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hannes@cmpxchg.org,
	usama.arif@linux.dev
Cc: lance.yang@linux.dev,
	ziy@nvidia.com,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	liam@infradead.org,
	nico.pache@linux.dev,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	balbirs@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH 4/5] mm/huge_memory: fold nested ifs in __folio_freeze_and_split_unmapped()
Date: Wed, 26 Aug 2026 17:21:00 +0100
Message-ID: <20260826162101.1314941-5-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162101.1314941-1-kirill@shutemov.name>
References: <20260826162101.1314941-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The two nested conditions guard a single statistics update.

Fold them into one condition and drop the braces from the
single-statement/single-line bodies.

No functional change intended.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/huge_memory.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 36e90756e83b..001d89c57fa2 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3955,19 +3955,14 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
 			      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
 	}
 
-	if (mapping) {
+	if (mapping && folio_test_pmd_mappable(folio) &&
+	    new_order < HPAGE_PMD_ORDER) {
 		int nr = folio_nr_pages(folio);
 
-		if (folio_test_pmd_mappable(folio) &&
-		    new_order < HPAGE_PMD_ORDER) {
-			if (folio_test_swapbacked(folio)) {
-				lruvec_stat_mod_folio(folio,
-						      NR_SHMEM_THPS, -nr);
-			} else {
-				lruvec_stat_mod_folio(folio,
-						      NR_FILE_THPS, -nr);
-			}
-		}
+		if (folio_test_swapbacked(folio))
+			lruvec_stat_mod_folio(folio, NR_SHMEM_THPS, -nr);
+		else
+			lruvec_stat_mod_folio(folio, NR_FILE_THPS, -nr);
 	}
 
 	if (folio_test_swapcache(folio)) {
-- 
2.54.0

