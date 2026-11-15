Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763941;
	b=E/e4cRGDqQagY9vLpwEr5ICke7eIHO+NeqHNd9ccXFKvIwH0b9xy/k9M4sToHtw9IOx8
	 Sxm4HpE7nIqxRjGAZQwzC2Jv3lCZmejtjxz0tRVUXaSVaFHmzpgmMAS0sjqRLC7L7aQnf
	 HHLBia73KXiKir160CgJTwAGeUiLKwNoi3Hy0WSObhi+UZPhDb2VBU8oNRkwVHeKex/+o
	 KA6b3WS83Ga5+6/p3E78hFJikSNPed5knYwEoFZRPdoilC05kNJ+kGa4rSnkYHwPqeu6r
	 Jm826qlpSc4sByhVT2OtsfRyKGW+bK/1wvVXuRD6etiWaITdu62ovXqzYFuXHJLYNTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763941;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jqEVXWdaDYy2iAwkzt+easl1YaYbtwylCIe+qCtSDRA=;
	b=bLCVCyttZeCYVO/A5oulnsFDT8uggGpXpxGra4S4g1aaHZi48kRjBfumJbkvIcfO0dVA
	 1GjjMj3w7ZzSrPlaVLx97vgdg1ODD9uzoNFXQMS7LG8luYh7IG0c80KFoFMZyZnuL8ayG
	 h/nlrE7H8ILI8j/1+AEdfhqLwixys9Q1Tq+mso+IE8TKNICyE54YrLbvwlzlLM+DKMfvq
	 euxImJ3BURMZEbq49Hm4LuTYIDaliR7asZxMa1mMdMLR/ow5MGx4qD2ghqmie719+66HC
	 IEq4WKG7Ru0po3ykVEhcsTCAGwfI7j7qFD325dUgsr6fHNYhMm+Vch4B2xqcGpncD1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hkLB5ySA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AAF606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hkLB5ySA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E759C1F000C4;
	Sun, 15 Nov 2026 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794763940;
	bh=jqEVXWdaDYy2iAwkzt+easl1YaYbtwylCIe+qCtSDRA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hkLB5ySA63uJy/oKlRFoLkV12uImhhP8T8+p3m8feeKxGPiq3DNfzOzYhilQMBfsh
	 E3W1f4LmGd2CaxEnu5JRsvre2AXq/Fi10BhYw0/5mP/kycAxfvC9E5jCnHFZZgxVQ0
	 DCGeZaw9gEmWG3l00yW7cz7h7Kc0m/9+TbW+D+Ugi2uAggTxs4l+hkD1a67dSyMs93
	 QUVYsUz54GnIJstYxlTV4O62VxXb4DLrM9aSxkYb510V/v4TgmRbfEZyNES8GSeR+k
	 kTfVCsN46ZWbA89WtiV17yXSH6SkQYdQfzOnygoObX+1hntbhhQQY6KxNCPbm4K8Sa
	 k9194hCfkVzPw==
Message-ID: <72dc7b45-ad20-450b-8ec7-3e86be8a41f8@kernel.org>
Date: Sun, 15 Nov 2026 18:32:12 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/util: fix off-by-one when checking folio index in
 snapshot_page()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, shao.mingyin@zte.com.cn
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, liam@infradead.org,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-kernel@vger.kernel.org
References: <20261115004657890Pz8ERDf5nCtE-B6M7KFzu@zte.com.cn>
 <avibe0HG4ssUUuBX@gremlin>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <avibe0HG4ssUUuBX@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/26 18:33, Lorenzo Stoakes (ARM) wrote:
> On Sun, Nov 15, 2026 at 12:46:57AM +0800, shao.mingyin@zte.com.cn wrote:
>> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>>
>> mm/util: fix off-by-one when checking folio index in snapshot_page()
>>
>> snapshot_page() computes the page index before copying the folio state.
>> If the folio changes between those reads, the index can equal the copied
>> folio's page count. Valid indices are strictly less than that count,
>> but the current check accepts equality and marks the snapshot faithful.
>>
>> Use >= so that this inconsistent snapshot is retried, or falls back to
>> the unfaithful single-page representation. This also avoids reporting an
>> out-of-range folio index without the corresponding dump_page() warning.
>>
>> Fixes: d863a12108f2 ("mm/util: introduce snapshot_page()")
>> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> NAK.

Let's do the following:. Thoughts?

From c7d1a79926e3b3448bb5e84f901c185234f43b52 Mon Sep 17 00:00:00 2001
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Sun, 15 Nov 2026 18:11:08 +0100
Subject: [PATCH] mm/util: fix retry detection and handling in snapshot_page()

snapshot_page() detects races with concurrent folio split+construction by
checking whether the given page still falls into the folio. Unfortunately,
we have an off-by-one error in there, and we should be checking for
"ps->idx >= nr_pages", because idx 0 is valid.

For example, we might currently report a tail page at idx 1 as faithful,
although the snapshotted folio is now a small folio.

However, there is one complication: As we don't hold a folio reference,
folio_nr_pages() can return 0 on races (or when called from page freeing
code). Handle that by just setting it to 1 in that case, so we don't
wrongly report a head page as "page does not match folio".

In addition, we should reset ps->flags when retrying, by just resetting
it to PAGE_SNAPSHOT_FAITHFUL. Otherwise, PAGE_SNAPSHOT_PG_BUDDY and
PAGE_SNAPSHOT_PG_IDLE from a failed attempt could stick around.

These races are fairly rare, so this is not really critical, we simply
report something slightly wrong. No need to CC stable.

Fixes: d863a12108f2 ("mm/util: introduce snapshot_page()")
Reported-by: Shao Mingyin <shao.mingyin@zte.com.cn>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/util.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index 80f6c714844f2..3b10d4c2a4fd9 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1406,9 +1406,9 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 	int loops = 5;
 
 	ps->pfn = page_to_pfn(page);
-	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
 
 again:
+	ps->flags = PAGE_SNAPSHOT_FAITHFUL;
 	memset(&ps->folio_snapshot, 0, sizeof(struct folio));
 	memcpy(&ps->page_snapshot, page, sizeof(*page));
 	info = ps->page_snapshot.compound_info;
@@ -1438,13 +1438,16 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
 	if (ps->idx < MAX_FOLIO_NR_PAGES) {
 		memcpy(&ps->folio_snapshot, foliop, 2 * sizeof(struct page));
 		nr_pages = folio_nr_pages(&ps->folio_snapshot);
+		/* On races, or when freeing pages, we can read 0. */
+		if (nr_pages == 0)
+			nr_pages = 1;
 		if (nr_pages > 2)
 			memcpy(&ps->folio_snapshot.__page_2, &foliop->__page_2,
 			       sizeof(struct page));
 		set_ps_flags(ps, foliop, page);
 	}
 
-	if (ps->idx > nr_pages) {
+	if (ps->idx >= nr_pages) {
 		if (loops-- > 0)
 			goto again;
 		clear_compound_head(&ps->page_snapshot);
-- 
2.56.1


-- 
Cheers,

David
