Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D564145D19F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761283; cv=none; b=ZFIOwIdSvqmzgcYex3d+NJcIzQ23x/ftMaa9/N1Q7FQ6cTxRF2sKXbuyLPvql9DNO1eIfoi5IXGkDWRWPWmsFQHVIH+fPik/ef7dKwI+5fgToWXLbCVBthSb9bs6ZIQ+henE9hZJ/o68OuSwDP0dRYyw0LDfCXDFRhzpQ0FkXGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761283; c=relaxed/simple;
	bh=8zCsW+61D8x1V2jS30iFv0IIshOjw1HA3xm/0E5TtDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sl1ox6D1d2HeX3LbjlAP5uNzUEDbwCMZlw/ekG8W9faPGVY4eXVeDA0IUL99cuckPXd3TsVHs/wXfus24FTsN7pGDK3IpBBR5SZCMKlGuat29ENRXrNJWChwcfJM6P5F5uxfqYSeKKcwJ4uoXdQpvzhl6yFjDL22qP4RgYISC9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=BP8PYztG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OZkFPany; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="BP8PYztG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OZkFPany"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 1949CEC01B8;
	Wed, 26 Aug 2026 12:21:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 26 Aug 2026 12:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787761277; x=
	1787847677; bh=5mSjV0I5LbWvQ9sczjJL6C6KyVdbqTRz8cyjnim/Edo=; b=B
	P8PYztGw2WCo+TvJSt+P6YuyWjwWc6g3OnhflMvlOKY73JNJqQZAS8rWpIkxa7jS
	5sy6kSLTNR6ZXg7Ye3++lUvIyDTBwJxL30+fyxiy8aWJ9Qs29R9VAsAP51Fq+dVi
	TORC/TNINXsILdoMIPh1jA/L6ujS/OddMjvAzebYyDDz9x6F5iEW/t9ulpIAamRl
	E+9VniKxIojwVi9x1hzFV8j2bVbrmhe3a3oytIexxkiCjpAM9t1z5tVm9uEicNF+
	TdMVh97zYqfBKWb8qK/G7fO9UKHp+DJg2/O9wTVyX60e0vx55u4hiwMd9gOfrHq4
	WFmzBNonn6CLm/ONCxPbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787761277; x=1787847677; bh=5
	mSjV0I5LbWvQ9sczjJL6C6KyVdbqTRz8cyjnim/Edo=; b=OZkFPanygMXeDszE7
	n2A4Y4veWU+G9z5j3qcLApIpDZxDsfy/clS/lf3LKvFGzEQpIhjq0CLjDJ/LY4iU
	wJXNO/TFbHOHNsVa6hVWL9BI8vGauPInF2P44IMTVQji1L7XvJ2KMJpUJMTWAyf2
	4iSVkSvGu7Ri/5EWzwtjPZCNSPMEV9jqn8z4vIDbqqdPu4MTYtWBplRcSLQS14zj
	tIk5ZcFrKYMRWOa0bxyLEjqOuGIkHp7nasSHI5yGXrW5GTUI0vuOF/zN2VWFMCuw
	3Q5ZwLeKtXZbMBBmzhx7boygrk7vUcVle72ejnI4G5A/XG6RxL1WEzSeYpFOdkK5
	Cstgg==
X-ME-Sender: <xms:fBKPahdMo_r-egmMubW0YSx4uVn2zMI4o5rv9VFZ_FBOKC53_aKwUQ>
    <xme:fBKParLOXM5IfIbKlCkKNJqm5GBFtOJgZ5z_I11Tf8L9oBZ5WjBU2kBwm4oWwpVHX
    Zfj18SGQSjDuVKfim38cl_O2VlTbQI6sKZEILdF4BU5jCwc7HXCJP0>
X-ME-Received: <xmr:fBKPagqKMeqTEU-qnIAXX1h0vNCmaMRAXq0Ee0QFbd8w8KkAQ1kSuvDI0IA>
X-ME-Proxy-Cause: dmFkZTEpX8HBQysEAMlAbdyKFX4BLzWtS7+Qo1RjxAJeMJnS381384CQaxM92QA8W5J6jo
    7r0RHbsPcTs1IpTXqcOu2ofgimA8w2hMK3OeOMvPUWs2NDJNBlDL/23E29uU3eWq90a8Ny
    uayj7GqONoh0NEQ91mQ/H+TE3rTPuVZ+wfrdHbeyaEyRe40ZIUYJyXTHqnubEDskXnqfPu
    FIQsvLmT+4mxeisAsg0TmWv4Y7l9NdKef8tTMihpDmjKvNxij8lw310+ofBfGEkzSLqnuN
    AyozbfZUQr702Kz+RkXguKuGQfBCnKcQhC5EFdpLjS6L6jWqh1sGvO+4Vl+gX27JPRP8Ht
    szkLAhJPkmHmsMuK+YkYr9yTyscVe3c0bf17pnNuHqUsHycYFqkLlrF5TB5u7lUu8OB/wM
    DV5bI0v3NOIPdRF9o4laEl7rxuvns0/4qf6WByMLMYQby4xvvTzd619MkHG7vrfgrIajil
    9xrS+oFmBCtWr0VBzXNyMXnf0FwgHZ5PK75YysAf2sIgyHUj7LJL1q92xLX6X1MBq4U7uW
    lhwF/3qJ1OK36392uADRBMFSzHu8Lqs4TMnvmDfirdJRnCCZGu0TGiK789fROlpmrPHxnW
    Q4Y5yNtbL6/Q5184MpQJ3sa7GKBP7KWtEmd2SUmUnu6UiB8GFfT1xjDdsnxA
X-ME-Proxy: <xmx:fBKPahWb-khyZOPyd2mpwNTBm5DFuvm2hVRrFRXRGCoMONke2zaejA>
    <xmx:fBKPar2YJHTRWMC3O3NWgvWKqA_HdYXs-4yn96wkxcgP96sJ3pYwaw>
    <xmx:fBKPai1yM6aMG0txUqE83j0j7xPiDWqodfWHy7cDugfuT6yvGXePCQ>
    <xmx:fBKPaqkql46GyvS23W_LXsuMmZH7j7jVT6wzjhAE1n9y02NStBKAUQ>
    <xmx:fRKPasmzk5pUV6uaz6rpLCWKy1FmrQapYrUNAazabmPEbKOmUXwurJTE>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 12:21:16 -0400 (EDT)
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
Subject: [PATCH 5/5] mm/huge_memory: turn the swapcache-with-mapping error case into an assert
Date: Wed, 26 Aug 2026 17:21:01 +0100
Message-ID: <20260826162101.1314941-6-kirill@shutemov.name>
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

A folio in the swapcache has no mapping.

__folio_freeze_and_split_unmapped() tests the combination after the freeze
and returns -EINVAL. It leaves the folio frozen. It is not a real
recovery.

Assert the condition with VM_WARN_ON_ONCE_FOLIO() upfront, and do not
pretend to recover from an impossible state.

PG_swapcache is protected by the folio lock and stable from the start of
the function.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 mm/huge_memory.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 001d89c57fa2..8fc844ba67a1 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3936,6 +3936,7 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
 	int ret = 0;
 
 	VM_WARN_ON_ONCE(!mapping && end);
+	VM_WARN_ON_ONCE_FOLIO(mapping && folio_test_swapcache(folio), folio);
 
 	if (!folio_ref_freeze(folio, folio_cache_ref_count(folio) + 1))
 		return -EAGAIN;
@@ -3965,14 +3966,8 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
 			lruvec_stat_mod_folio(folio, NR_FILE_THPS, -nr);
 	}
 
-	if (folio_test_swapcache(folio)) {
-		if (mapping) {
-			VM_WARN_ON_ONCE_FOLIO(mapping, folio);
-			return -EINVAL;
-		}
-
+	if (folio_test_swapcache(folio))
 		ci = swap_cluster_get_and_lock(folio);
-	}
 
 	/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
 	if (do_lru)
-- 
2.54.0

