Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127E14963B3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993902; cv=none; b=Xjxd8cmavV45Wc+vDKk+onVw0dyGZ5eQE2MUdFCA/ZmtDb5vdhvB4zu1QMOoKdvZo1eOjTbu9t5Upw+Ods9vJWAGw9q4Ch8iBdR1HyYtAnz6x37Gma33MhJYzU1cRP5103VkA0HQ5AElvT2tiGdaLnaGENeRJvyV9+qjPNe3nbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993902; c=relaxed/simple;
	bh=yc/Zs6xPgQccUGSBvUxKF4tBdDWNVRPWwVRuT71kyJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PCbS1NTiwdHFOYAdwTxueRpqGWKg+kV7C38QLaiQJQXaEZ76swfPsnDAecnfa5/QIwGfJUmNMbx/oOd09A8OM0lyrw6Fh5zY9P9bfP9i5x79sPV3pi851QT2lSBfl6ibSKD51GWUwDtzjPxYXzE3GCjxTJit/ax4Xc2nIvN6++Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ibPXFwr2; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ibPXFwr2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=RJyhK/H/cx9UDbk1fQ3qzOg9bJhZWQMaDj6VPrkWrC4=; b=ibPXFwr2uzqV+04gSCXcVxns3G
	0N6SGj4ckD/GEGj+9xBvm5gc2lUWYpXaO9EGoQeAmTcgwnwUCfKPFP94fpIcoVjB5HywRUgzUF/hR
	P/iU7uXfEp0qRmAKS3eAQ6aObaPREGzcQo9tI0SmP6YEnP+iGJXDv7Q1hknLVeR9C6XLs6hfQgBLE
	+3mx/rYlCOm9+wYr2sw8HXCWia72DJTqwWByVSSY1xcnV/ApUoEcvbM7mhcs7kazjHAaJdOOw8Jp0
	B//KozZRjdxVbA7qQVKd7fWlnpmim48rsTfkOoF+QAkRMVIRN8wB5pDFCjIJ3qV+bNrrolsTKfBUN
	MjyV2gsg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x8dBE-002CbX-27;
	Mon, 21 Sep 2026 12:31:32 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 21 Sep 2026 05:30:26 -0700
Subject: [PATCH 1/2] mm: kmemleak: move the struct page scan into a helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-kmemleak-page-scan-v1-1-fb97d4801b3a@debian.org>
References: <20260921-b4-kmemleak-page-scan-v1-0-fb97d4801b3a@debian.org>
In-Reply-To: <20260921-b4-kmemleak-page-scan-v1-0-fb97d4801b3a@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2538; i=leitao@debian.org;
 h=from:subject:message-id; bh=yc/Zs6xPgQccUGSBvUxKF4tBdDWNVRPWwVRuT71kyJY=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqsSOdoIsG5nmdHaB1wUgSXy9i1JwH500pnNE3N
 rKnFnTXCkqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCarEjnQAKCRA1o5Of/Hh3
 bRmPD/43icZSLUGLZ74SsnNFAMz6NWdw+tbqTD/eGO2VlOk2wSFuDubLQq39MsAJzdVK0/DREfb
 LPlqtsuWSvFjBEriJP3QiK+lkfkvsFHaFzK0L6sVRBBN78wBHyBqmE5rznQR8Lqf2B7xlKY9Mul
 HYYi+fdPlKPdsT4A/U2lrniCNziKKwip0EKsnIaJsSSH/7sO4eb9UmDxzXUw1zdYV7ECKjbIlZK
 gSRaXh/kfXQvUFBTnNqNCgLPwOWHnsbQo+N3BYh2YMeAGC7EdsnFMj+xZ6Rcu+GYz7ABCX7kqnM
 yEehZDzKAn4WBLgvV0hFG3lGCpzSzcr8WL9LT1PdWyZGBZRXBrOVu8koVsJwkdmi2mCyWShnq8u
 hHi2LMO6717dMa0FZ9Gg7lYfgpdRowt33o1xgr9fnPko2ob900IojCDijifeCd6BB8To9KLL97J
 1oAqFyDjTQy2kjjPvTkyRdHckfWiRqekTnWUa3lwtPFIjLAsbCGQZnZ+YWWiGMdkfrQUBGSYPJX
 CUNA3HZIQ2lzOaFi3jszMfEbxJMGTM5220SpiVDCvZ4GWFFWZF+Y/DHYFfpUCcwc+/RY8W5PLIF
 8luOvbt0/zosAXojGm6bm0G9Ve5nYHnrmaL/z4ececCrm8AcFv09NDofT1MvH8U71UStfiuDHVF
 NL5ckeoawor7maQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

The struct page scanning loop sits inline in __kmemleak_scan(), nested
three levels deep and sharing the caller's "stop" variable with the
zone walk around it. Move it into scan_zone_pages(), which scans one
zone and returns 1 if scanning should stop.

No functional change; this only makes room for changing how the pages
are handed to scan_block().

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/kmemleak.c | 57 ++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 8fa409a4f9fb2..4040547a0af84 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1855,6 +1855,39 @@ static void dedup_flush(struct xarray *dedup)
 	}
 }
 
+/*
+ * Scan the struct pages of a zone, skipping memory holes, pages that belong to
+ * another zone and pages that are not in use. Returns 1 if the scan should be
+ * stopped.
+ */
+static int scan_zone_pages(struct zone *zone)
+{
+	unsigned long start_pfn = zone->zone_start_pfn;
+	unsigned long end_pfn = zone_end_pfn(zone);
+	unsigned long pfn;
+
+	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
+		struct page *page = pfn_to_online_page(pfn);
+
+		if (!(pfn & 63))
+			cond_resched_tasks_rcu_qs();
+
+		if (!page)
+			continue;
+
+		/* only scan pages belonging to this zone */
+		if (page_zone(page) != zone)
+			continue;
+		/* only scan if page is in use */
+		if (page_count(page) == 0)
+			continue;
+		if (scan_block(page, page + 1, NULL))
+			return 1;
+	}
+
+	return 0;
+}
+
 /*
  * Scan data sections and all the referenced memory blocks allocated via the
  * kernel's standard allocators. This function must be called with the
@@ -1928,29 +1961,7 @@ static int __kmemleak_scan(bool full)
 	 */
 	get_online_mems();
 	for_each_populated_zone(zone) {
-		unsigned long start_pfn = zone->zone_start_pfn;
-		unsigned long end_pfn = zone_end_pfn(zone);
-		unsigned long pfn;
-
-		for (pfn = start_pfn; pfn < end_pfn; pfn++) {
-			struct page *page = pfn_to_online_page(pfn);
-
-			if (!(pfn & 63))
-				cond_resched_tasks_rcu_qs();
-
-			if (!page)
-				continue;
-
-			/* only scan pages belonging to this zone */
-			if (page_zone(page) != zone)
-				continue;
-			/* only scan if page is in use */
-			if (page_count(page) == 0)
-				continue;
-			stop = scan_block(page, page + 1, NULL);
-			if (stop)
-				break;
-		}
+		stop = scan_zone_pages(zone);
 		if (stop)
 			break;
 	}

-- 
2.53.0-Meta

