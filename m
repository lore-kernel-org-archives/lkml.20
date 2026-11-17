Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912814;
	b=nUrSjPWgKNs6PnuNbmkMQ14f97fPpotMuRwA1JeH5lD0WBMpJIaaOrvH0vwUP3iSDYK3
	 1ND7s50iz4AhC14pp9Dp1WW56L1g8iHuxr7Fp//2K4m1ul+RHtvWbqUVzHzEAead0aduY
	 t+0nPgNwHLCb9EVRLawF5OEvexRJDp2a+TEG7ROOKzoAiAlFUnB9SBKTEH5dajtQiDx+M
	 gKOwcYdNOd3n5aOzHWOxp60At/gBL5XZdxewOGFW0UCy0gqHYJCB6MKSK3uwc8l5Due23
	 m7HGZRJNKlw+8KOjORpT4PvKj5DmWMMa6QjcRpidY2WG+2tyxBTLadpOd6jEkV+vi0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912814;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CsXhM9ytjFEN37udrZ3Xji2sYLgVWqA0tFv8jS/Jkp4=;
	b=pHf8N7NHbiZkEq88C7pwZPSfCpVphEl03xP9qA5E+w3eeU+CuxzwUJqdxCn+93/5rkhe
	 DrIvun32jiXTRKdUdbh0ZNMmaHwTC1YYojO2EWHnXichomI+qep+GhIGVuzAsfebUtRrp
	 PHrjpVFjuDNYmn9aTGtLnjRxslJI8MPCNoTF9MJMaekjc92kSg3dzKD7k6UFa3mef9AMD
	 jiEWepveE5RwXVrfLYkQFEg1tBLtPMLMMzDSF4IQWaNVJE/AWKKEmnkBK0oxISUcsq2jb
	 xTJewX0wdz9huYG9yrtyPdelyieuRFuFsmk6vsbYJWIkgT7vPakO0ZgtAvdJoqhc4hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=knLIey08;
	arc=none smtp.remote-ip=91.218.175.81
Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4364606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4364606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=knLIey08
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wBzKicx0cQWljDK6M/ai40hT3cChWMPzAJb7JvpDisk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794912811; v=1; x=1795517611;
 b=knLIey08JCH0xmq+hHEMWSJNnk+1xTrGzeL7VXwZpuFG7hPQbN8ohOHQuzmkUQbmx0UmM02w
 eMIuWCT8tQlwfUFoHKMbsjpLw7vqWvTdHuWzPl9/pmt+23PHItX3aRZR8WXPHJp0bJAae427XCq
 zvP481Cb7r+vT8ckporExq+o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bdf8bbebe49c3e29;
	Tue, 17 Nov 2026 10:53:31 +0000
X-Mizu-Trace-ID: bdf8bbebe49c3e29
X-Migadu-Flow: FLOW_OUT
From: Hongfu Li <hongfu.li@linux.dev>
Date: Tue, 17 Nov 2026 18:53:11 +0800
Subject: [PATCH 1/2] mm/memfd: drop redundant hugetlb allocation mask
 narrowing
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
Message-Id: <20261117-for-memfd-v1-1-fa68f433171e@kylinos.cn>
References: <20261117-for-memfd-v1-0-fa68f433171e@kylinos.cn>
In-Reply-To: <20261117-for-memfd-v1-0-fa68f433171e@kylinos.cn>
To: Hugh Dickins <hughd@google.com>, David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: hongfu.li@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Hongfu Li <lihongfu@kylinos.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794912797; l=1716;
 i=lihongfu@kylinos.cn; s=20260915; h=from:subject:message-id;
 bh=6lBD4a5aUEw2qNRL4yfUHQwl9S1KTGlkZCmy8GxlQ6s=;
 b=OVCcqACbYB014S2W/DctNpGn9u9W675ly7lfiMNVYl+BCRAl7R93T9GGbmay4sgOzMvoKUMtz
 zGKvIz3MIqVBYFcJrHAy2KatehTjcTkX5Q/+UC1eYQXUwURz3gpCA1M
X-Developer-Key: i=lihongfu@kylinos.cn; a=ed25519;
 pk=rUpDSpB3neoNZRlGG6dHlFb3RepiJakcev+ucyqaZzw=

From: Hongfu Li <lihongfu@kylinos.cn>

memfd_alloc_folio() derives its allocation mask from htlb_alloc_mask()
and then clears __GFP_HIGHMEM and __GFP_MOVABLE. This mask handling was
introduced by commit 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios()
for pinning memfd folios"), when the fallback path in
alloc_hugetlb_folio_nodemask() could still call
alloc_migrate_hugetlb_folio() and reach the buddy allocator, so the mask
decided the zone and migratetype of freshly allocated pages.

Since commit 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios
resv_huge_pages leak"), this call site uses alloc_hugetlb_folio_reserve(),
which only dequeues folios from the existing hugetlb pool and never falls
back to the buddy allocator. The mask therefore no longer decides where
any page comes from.

Long-term pinning safety no longer depends on the mask either:
memfd_pin_folios() obtains its folios (dequeued from the pool, or freshly
allocated) under memalloc_pin_save(), so PF_MEMALLOC_PIN makes
dequeue_hugetlb_folio_node_exact() skip any folio that fails
folio_is_longterm_pinnable(), and current_gfp_context() already clears
__GFP_MOVABLE from any page allocator request made under PF_MEMALLOC_PIN.

Drop the narrowing, which has had no effect since 26a8ea80929c.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 mm/memfd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/memfd.c b/mm/memfd.c
index 0e3ff3eebfa8..8905e3e9efc8 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -85,7 +85,6 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 		u32 hash;
 
 		gfp_mask = htlb_alloc_mask(h);
-		gfp_mask &= ~(__GFP_HIGHMEM | __GFP_MOVABLE);
 		idx >>= huge_page_order(h);
 
 		/*

-- 
2.54.0

