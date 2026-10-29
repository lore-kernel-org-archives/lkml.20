Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259689;
	b=kwEzYmf5tUdR+OHC2dr4sqo9KZzNSIUN4HEhEAaK0nsh1Jq3XvObWMJNkZ7chls/q+pA
	 HPu7R747Zy8dBzjGoQJPbYR6BGF1+rozDgyNLZQYOIWZZnDN9ZM/8bVU4wvz7a4S184RD
	 TKwyiuTd3SlVa7yVQp7lRTJm78+w7B03YavJHEB12LQn/dVGqpQifUE4iDS46n8ZPZauV
	 J6Wxa8M3Y/MXiElznGGQUJx1uVeC60sLVZmhmxbJdX088vpLgNRznNZZ1oUDihWhchzmn
	 SRHF5A2jvsZUzTCMNXWb0ph89+/BWPdinGchlGeKc8LXiOC8GDLnu6WMLuhzhEKrrnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259689;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=55b5s+R9twQxElwt/hmg6vi8POgmGGaNVzc+dDZF88s=;
	b=kO0XHSIJby2WqWvfCanfyO2rjgrfRFP6D0K4Fumkug+ugP1AEH8h3u1umdnQX2qfOxJv
	 oxYOYGLEQ4kA8vs1eILbLe/eN51gu2hcQ8ukCMyDVG+V1h1DsMWB+rv16KFsvnMdKezox
	 T4UyJ6um7YqzxR7nEpzy0/h2one+PBy8Co9I18UFi1knWq4ykH71VYORykIwhooVQIibW
	 Kgq+SZoMduTmYdE1X3fKZ+OWG3sikqxPe5E7XgRmgr4zjzqrh5UEQQBaXzVJjhpRwYLMM
	 6vDpWZeGYoCzFGxLu4FyB7j+yf/2ekulGmuAYsEZWrX5DD+wKMRhFw9eeIYyPbun5iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gcTtyRVM;
	arc=none smtp.remote-ip=91.218.175.177
Received: from mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C886E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C886E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gcTtyRVM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kqXkXah7tJyY7/8XgkA0XpkEeCII2v4IbMiHYj6hQ9o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793259686; v=1; x=1793864486;
 b=gcTtyRVM6pdvEsNQWrKhRkJzdWMLLeOlqbc7qyRtEG6LQ6/2dJoz7jS4tooOBi3iZ1BJSjNo
 uNq4NU2/rrnQ7NbbwiLch45wDTmAygvq2KOX9+YtqvvD2Oliq62FyI++T2b3G9SAamLTiKZR5pW
 Q9Mhv2Rh4E+3nqMuGcXJ4jew=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 34ecf73c26048443;
	Thu, 29 Oct 2026 07:41:26 +0000
X-Mizu-Trace-ID: 34ecf73c26048443
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Thu, 29 Oct 2026 15:41:02 +0800
Subject: [PATCH] mm/huge_memory: use READ_ONCE() when cloning folio flags
 during split
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-data_race_huge_mem-v1-1-112e331291c1@linux.dev>
X-B4-Tracking: v=1; b=H4sIAI344moC/x3MQQqDMBBG4avIrBuI0QrtVUoJY/w1WSQtM7YI4
 t1Nu/wW7+2kkASle7OT4Js0vUpFe2koRC4LTJqqyVk3tNbdzMQre+EAHz8LfEY2vZs7Hqy9hr6
 jGr4Fc9r+08ezemSFGYVLiL9VZl0hdBwnD1VtJn0AAAA=
X-Change-ID: 20261029-data_race_huge_mem-42f3a6005c43
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

From: Ye Liu <liuye@kylinos.cn>

The head folio's flags are read as a whole word to clone specific bits
into tail folios during a THP split.  This plain read can race with
concurrent atomic flag modifications such as folio_set_waiters()
(PG_waiters), as reported by KCSAN:

  BUG: KCSAN: data-race in __split_huge_page_tail / migration_entry_wait_on_locked

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/huge_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index bd44d58e8684..aac91c972ced 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3731,7 +3731,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 		 * PG_anon_exclusive (-> PG_mappedtodisk) for these here.
 		 */
 		new_folio->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
-		new_folio->flags.f |= (folio->flags.f &
+		new_folio->flags.f |= (READ_ONCE(folio->flags.f) &
 				((1L << PG_referenced) |
 				 (1L << PG_swapbacked) |
 				 (1L << PG_swapcache) |

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-data_race_huge_mem-42f3a6005c43

Best regards,
-- 
Ye Liu <ye.liu@linux.dev>

