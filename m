Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288816;
	b=0rxF0+ESyTFjetXKFl4PjdSk4hWqVm6o6pMRzR4KoBtGdlWzIp67aK9HxNDFX501KXqM
	 /KHTrMdL/+ZyejJueFq66SQxmnkR0okwqGGJmfKNPj5LUDchfYihfpjBI0b4ug/9x9+wl
	 a8yOg0Hd15PXx8EZxP8mxmJtMRrdl6lP4BKSHGfOgkl9bnSIIWgydIyRf1jq7peSOAwIX
	 E7Vkhdt4THFHXUHqU41TptiAj/qZM4LKMzTI2w3cbWBjhTvd9ejCsnoIc0KWS3h3v+9qk
	 3SHAaSunIauWDgh3vVABMoEpHwJxmGuQ6aUhQbXhV0H8mvc+/BL8JidrejXPmasUGfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2aTCuC7RxULyLFaQmhjTRJuy/HHzKYm+TG7fBCWbd50=;
	b=xKjKGoEo3PtXhvMdihouJtcU4NArt2fQ+3A8LmW02tiyd3TsTcSC2dvYwGZxdkZQuGPD
	 Wud+I9UosnExR4XJagB2HmrwqxAIXS+MKWaNsyHsa6awlucDtblqnWEZAdxFtJ0RGxyje
	 AglZ7KlA4Awer9hJv+NsXC09ITdFswZOIa6dfDD404jUK4pztrOr/W+5u/EyNqwoX9Otj
	 3A3zKYUYVUisOVjF1QGZgf/00lksG+bu8/E72VoVCgSKgqWBnoRya5H+l6UHUu4kRNv2x
	 g4EkgyVlm//rcBffUH/DaPFIhb35cpOK8FMGSp3HDrxCvDJkAtkrEWVuOqcoQP3IbkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g0oC1M5q;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE6160A2633
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE6160A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g0oC1M5q
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb86c39250so851075a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794288816; x=1794893616; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2aTCuC7RxULyLFaQmhjTRJuy/HHzKYm+TG7fBCWbd50=;
        b=g0oC1M5qd3aaIoLFIqPgqtdfdy5b3FQcw8yRLxPrGnUh0JYyB0UeJi5E/NmE06VJCI
         dV30KL6Y0ek91sYWHp9hjzObHPUm8BjsdYzHEuhBb6120V5ADSgYNoKP4lkTo5ir7ybD
         1D4XPCIeRZHAN7q3rmvbWg3pVEVT1mJKGvYl45igBYBV1jkhUgdyikeIJk8cMkGkq4ji
         VVuBUPpQw6pjs/nopgw2ndREo18Jbf8Bx1BKme9+M/+PEBkDkTqo7oyEZquX/SaZiDeX
         51oehTOhl8+ZQ5N5yBG0qWQtzyFX6X2IQVzA22ZiqKTwif8EEQ5N/vPeKDPFyYWb5Gg1
         KDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794288816; x=1794893616;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2aTCuC7RxULyLFaQmhjTRJuy/HHzKYm+TG7fBCWbd50=;
        b=Qw6nGsC6a8TMi98c2w4fmETZm1ygKIdRDZ65FQUkUIeqX4CVzKH/DQoUPBjMdWa+7E
         qEmFcYxSqJhA/mjCdNbp0NM04GmsUMzy8WheBHEcnUqKVz/vpaMhh8QqX0ezHeNtp7pV
         jCrnpx3yEasi4KKMEVmrDoh6A5AQsbNhfAEqdmTNICl12oIi2K1zk9Ld6OxKo54ienBA
         IvxaU71gPocFUwGKjiSjRFiXwOdbM/stTkJEc6qi/2pppgWY5N0mtMhs8A1mDeANnjgS
         Ay6tpQyLcZ6Wsy+Y5wbxMRRXsKe0a+1AcNaSzssBHvOO6f0Wvdt8izAMyZb0Ugi/KqX1
         Rfjg==
X-Forwarded-Encrypted: i=1; AL+hErFexcB6vP1CNwKazeyeAp5EYi5W97XwhOaj2sDcpVrF4EV7E212P8g6mg1kJlRS0WoVT57rq0XOBR3u7W8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cIx6A8tSb9AaHa43YkZkv3nCLqL/9wWuGJTU+YjQM9J2bfuuE
	ZmVri4i1WA2cyXkzlqsMlNZSSwTGYfsRZlLKF5OyTx7WD5/KP1MhPfBb2XoDEx11Ov29MV355xk
	inlG7I2TX8Ontdg==
X-Received: from pjvd7.prod.google.com ([2002:a17:90a:d987:b0:3b0:9c59:c0e2])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4cce:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3b166ca2897mr1546981a91.9.1794288815526;
 Mon, 09 Nov 2026 21:33:35 -0800 (PST)
Date: Tue, 10 Nov 2026 05:33:29 +0000
In-Reply-To: <20261110053331.2708996-1-jiaqiyan@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110053331.2708996-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110053331.2708996-2-jiaqiyan@google.com>
Subject: [PATCH v7 1/3] mm/page_alloc: free_prepared_contig_range() takes fpi_t
From: Jiaqi Yan <jiaqiyan@google.com>
To: linmiaohe@huawei.com, vbabka@kernel.org
Cc: osalvador@kernel.org, ljs@kernel.org, ziy@nvidia.com, harry.yoo@oracle.com, 
	willy@infradead.org, osalvador@suse.de, jackmanb@google.com, 
	hannes@cmpxchg.org, nao.horiguchi@gmail.com, david@kernel.org, 
	william.roche@oracle.com, tony.luck@intel.com, wangkefeng.wang@huawei.com, 
	jane.chu@oracle.com, akpm@linux-foundation.org, muchun.song@linux.dev, 
	liam@infradead.org, rientjes@google.com, duenwen@google.com, 
	jthoughton@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	vbabka@suse.cz, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	mhocko@suse.com, boudewijn@delta-utec.com, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

A future commit introducing free_has_hwpoisoned() to be called within
__free_pages_prepare() will need to pass specific fpi_t flags when
freeing a contiguous range of pages. Currently,
free_prepared_contig_range() hardcodes the FPI_PREPARED flag and
does not accept any caller-provided flags.

Refactor free_prepared_contig_range() to accept an fpi_t argument.
It bitwise ORs the new argument with FPI_PREPARED when calling
into __free_frozen_pages(). Update all current invocation sites
in __free_contig_range_common() to pass FPI_NONE.

This is a preparatory commit with no functional changes.

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 mm/page_alloc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 15ff5c1feef4..93dc29480ba1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7043,7 +7043,7 @@ void __init page_alloc_sysctl_init(void)
 }
 
 static void free_prepared_contig_range(struct page *page,
-		unsigned long nr_pages)
+		unsigned long nr_pages, fpi_t fpi_flags)
 {
 	unsigned long pfn = page_to_pfn(page);
 
@@ -7060,7 +7060,7 @@ static void free_prepared_contig_range(struct page *page,
 		 * Free the chunk as a single block. Our caller has already
 		 * called free_pages_prepare() for each order-0 page.
 		 */
-		__free_frozen_pages(page, order, FPI_PREPARED);
+		__free_frozen_pages(page, order, fpi_flags | FPI_PREPARED);
 
 		pfn += 1UL << order;
 		page += 1UL << order;
@@ -7097,14 +7097,14 @@ static void __free_contig_range_common(unsigned long pfn, unsigned long nr_pages
 
 		if (!can_free) {
 			if (start) {
-				free_prepared_contig_range(start, i - nr_start);
+				free_prepared_contig_range(start, i - nr_start, FPI_NONE);
 				start = NULL;
 			}
 			continue;
 		}
 
 		if (start && memdesc_section(&page->flags) != start_sec) {
-			free_prepared_contig_range(start, i - nr_start);
+			free_prepared_contig_range(start, i - nr_start, FPI_NONE);
 			start = page;
 			nr_start = i;
 			start_sec = memdesc_section(&page->flags);
@@ -7116,7 +7116,7 @@ static void __free_contig_range_common(unsigned long pfn, unsigned long nr_pages
 	}
 
 	if (start)
-		free_prepared_contig_range(start, nr_pages - nr_start);
+		free_prepared_contig_range(start, nr_pages - nr_start, FPI_NONE);
 }
 
 /**
-- 
2.56.0.506.g506a7eabc5-goog

