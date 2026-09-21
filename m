Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB2146EC84
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993902; cv=none; b=rKYkiOHtZoXFazDAFIrOcVI6gQO3E2EJFslocrHaGYUxe5oMtyWgreXrRVMGrzimYTQqZUec/vnrWguAH3aAG7dIgl31arBqG8PaYMgroxR988JdmTln9rNMRqkmYsiCBgx2z+eoSf1781OdWkWE+rEPWuGI65NDPhO07hcHmvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993902; c=relaxed/simple;
	bh=HJ5nwvE4BGwjNEPPGJ48wKJt/yd7AFzI93B8qcnsppg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SlovxdhRnDW9idvGw3cvvHW2AEIELaOwjF0DRsCvx2jsvwnJTTlh3C6ctro0qQhr3XWs8iiIHW7PqTcuomerIeG95b1lyP8KtuzujwEmpwCY7DvX9DKR+fjlbPToAFhxvDRLIqQ0aET9jRWY3Ql4MUSP7WOUqdQtP57rExBVwTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=hC26Q4qe; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="hC26Q4qe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=4hgW/FJkW3mwJCGKwE/mUcy/xjFFdmovY7N91WUWEFM=; b=hC26Q4qecCQvJ0tcjkj2v/tsuX
	qVcXeyp2OjNQ0RE6QFiHeSNjmbFHucskq0RJNSlO4a/tXIf4OIpDe2EOn5vKxmEFs0sbB4CKy5Z3Z
	R5FbZCYK7t6bfvrSzRG3lZkzqWdH2iV04tpFZ/gD/YScfwm74ZgMas5eXSOajgSJ95j81yjK7dAKY
	2VUrv+Fh74RgpvQigb6EMxSNZ5FcA36+AVx3vWFX+QIg/9QBgOq20dPr44rK7bfqEdS+YvM22r9gY
	wH6GqGpg+suQbdImjSp9YEw20Y2A7gVjdK8G+mvV7UNJGGqmssbvSjEh2rqTB8QEdUz+hUIR7Asxu
	6zOFJ2Tg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x8dBH-002CbZ-1W;
	Mon, 21 Sep 2026 12:31:35 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 21 Sep 2026 05:30:27 -0700
Subject: [PATCH 2/2] mm: kmemleak: scan the struct page array in
 MAX_SCAN_SIZE batches
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-kmemleak-page-scan-v1-2-fb97d4801b3a@debian.org>
References: <20260921-b4-kmemleak-page-scan-v1-0-fb97d4801b3a@debian.org>
In-Reply-To: <20260921-b4-kmemleak-page-scan-v1-0-fb97d4801b3a@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2932; i=leitao@debian.org;
 h=from:subject:message-id; bh=HJ5nwvE4BGwjNEPPGJ48wKJt/yd7AFzI93B8qcnsppg=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqsSOdriwWS76lw2mmVu50YCXUKoW/8idyboDiJ
 HUO7c2CQZOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCarEjnQAKCRA1o5Of/Hh3
 bfwSEACgjjlP64qqLp9HIM9XrwDJpwy21iR+rcS8/Zaa2PBasil6vpvB4qpzQ+0NoUGhUTtTW8L
 CAH/mHe5ZAXEEYWEO5rsrGQuQ907IrNckn0dO8rRpq/hQihiughnGexmWju2jv5QB8Viksw3ELT
 1k5bPp6wQICRp67FYXFljlmVkpkA6dE13CMgFZ4zEfIK9r4C5h7zj6QEVrOrTOPUdpV8LUPwli9
 0L+vEiEQyHJq9Z0qEwx4QT//hld93MdLWv72TFhhJXJp9wFKlOEn/PkqXhr7qBRMqu6CT3MmuEX
 wyR/WQXwPe+JW/oYYep6vCJKiHLQVIRg4ZeFem8acP44UKKaX7U8q0dgYbo/i1aok4s45TPysHT
 M2V99jOwUdnBZclMOg87JYjGkz3BgeUs7EX3Car4YeMC7Zq3P7gJ8DJ21fJxAalKxbu2ghFH8OA
 XtPLnJeA77+JqE/MrfzBphMAiPWrG2at/SGHKzwOcyU+F1I50FrxhSDSgMqpyGDKazKrQoAuWdq
 0N2TBAPZKABDU4zeUEXt8WZ361DSbCZMkRYYbOmDeGT9zvAf+GcVH3xDz2byU7k4CclpPtab8p1
 ypNLqooJr9TP+NYbopVSWlBP/hz/QIxvvE4GjHUHymeCW52WfDB0mfbQVITHExZG2docK57XUPD
 uTYKxgRns17Tm7w==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

scan_zone_pages() scans the struct page array one page per scan_block()
call:

	if (scan_block(page, page + 1, NULL))

scan_block() takes kmemleak_lock with interrupts disabled for the
duration of the call, so this acquires the lock once per online PFN to
scan a single struct page.

Gather runs of adjacent eligible struct pages and pass each run to
scan_block() in one call, capped at MAX_SCAN_SIZE.

The longest kmemleak_lock is now held is MAX_SCAN_SIZE worth of words,
the same bound scan_large_block() already applies to the data sections
and the per-CPU areas.

This can make the scan faster. On an arm64 VM with 24 GiB and ~17 GiB
in use, the struct page phase goes from 4390k scan_block() calls down
to 69k for the same 4390k pages scanned, and the whole scan about 20%
faster (on debug kernel). The win is in the per-acquisition cost, so on
a kernel built without the lock debugging options the scan time is
unchanged. I don't think it will be a problem doing more on
scan_block(), given we have the scan_should_stop() protection.

Coverage is unchanged: a temporary assertion comparing the number of
eligible pages against the number actually passed to scan_block()
matched on every zone of every scan, including while memory was being
freed underneath the scan.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/kmemleak.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 4040547a0af84..cb953df3b414a 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1862,8 +1862,11 @@ static void dedup_flush(struct xarray *dedup)
  */
 static int scan_zone_pages(struct zone *zone)
 {
+	const unsigned int max_batch = MAX_SCAN_SIZE / sizeof(struct page);
 	unsigned long start_pfn = zone->zone_start_pfn;
 	unsigned long end_pfn = zone_end_pfn(zone);
+	struct page *first = NULL, *last = NULL;
+	unsigned int batch = 0;
 	unsigned long pfn;
 
 	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
@@ -1872,19 +1875,29 @@ static int scan_zone_pages(struct zone *zone)
 		if (!(pfn & 63))
 			cond_resched_tasks_rcu_qs();
 
-		if (!page)
-			continue;
+		/* only scan in-use pages belonging to this zone */
+		if (page && (page_zone(page) != zone ||
+			     page_count(page) == 0))
+			page = NULL;
 
-		/* only scan pages belonging to this zone */
-		if (page_zone(page) != zone)
-			continue;
-		/* only scan if page is in use */
-		if (page_count(page) == 0)
+		if (page && first && page == last + 1 &&
+		    batch < max_batch) {
+			last = page;
+			batch++;
 			continue;
-		if (scan_block(page, page + 1, NULL))
+		}
+
+		if (first && scan_block(first, last + 1, NULL))
 			return 1;
+
+		first = page;
+		last = page;
+		batch = page ? 1 : 0;
 	}
 
+	if (first && scan_block(first, last + 1, NULL))
+		return 1;
+
 	return 0;
 }
 

-- 
2.53.0-Meta

