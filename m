Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865749;
	b=R+/zLzE3LgdUBKEn6sxqiINSIGrs1WCVvQdIHC9pyakz+OoeEg402iocHCqgnV0Z1A8H
	 DOAhFVO5l3jLkgUxiCO4r7d1hK2fwMg+8+9BbAu9ho4dVJzOyVgcKwMwS6CukEeEt3LwV
	 JfF6pFE6M+p5AtMhDcAnom2YmoZsFWl2E9pmAIbxpJMMJxzb7lZDPyx2HR3rTq0IuYyt2
	 OVGX1ioyAdu9JVP7Y4AOm5BojmBh97jXWsWTL/EwjxJdo6kIwGmR6WYp0j647WNMR3UGs
	 N2/BIHi/Kvl7q2PZlFw/MkGOJ42vvPse9zAe2QAyTV/y6rgzHEcNmQXBjbqU9DzSM3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865749;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DIr4alMJwbCTc5F0ZtfHQta9OEDwuGDlcSYgoMpOMGE=;
	b=DxEys5IRcM8OjZArjFDu6T4xUzkoT3J7is4cDyl/cCd8C6q+K8CKrhaU2djaGMYAiLh9
	 /zikORSntgEKoKzWfKF5OK+lBvsWdmv+Sz+l2GQ7HDx7xlBeKTgHna0StW1af/e+jS10Y
	 jCPql6leBN6ncGbXpNa/QvC2/e+Scock+fBpGA/zKTKqGbk+rKGIsmCWcPiEuJHUbbcYu
	 XVKeoe8luYn8lE76lnohYgCSiDzk97GhYVhs9zC0cX7RpUZFvem0lykbiKAmax/4NemcU
	 sq0tHJDj+RiOfIhC9oeCnrlCBOgIo4jOgb77t4friH/2cVfQ+JCrAG66kDuexS4xzYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YPZN9+4+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB275606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YPZN9+4+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B7A1F000C1;
	Thu,  5 Nov 2026 08:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793865748;
	bh=DIr4alMJwbCTc5F0ZtfHQta9OEDwuGDlcSYgoMpOMGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YPZN9+4+QaSqB4nhCcZSMQFpKZAnZ/PsWyoNoIOi0FfJwpb8mPYXaLtS735LYU4nQ
	 KOvPb1AY0aBBU/yqmmg+2mNrwpdTtfrTR4rdgciSOs2239zShUtklUtl4GM0/MaglJ
	 0XnC242gfBtznYbhCm/HymQr6eMfQIatjRaU8fxViYYp66t48TJzNenlKyfRdsfBfF
	 1bWCI1HcYo0db7r1+OyN+VwE6Fi0Whf+N8AtV0z0JdnJv8jZYF/TZtd/4W5/x1b7mv
	 RYLOBYtbgA+QtHefWrD0uy5LBiuMBH0yXqxUEqJ0qUJJkvQwcGAheVARxXCR9dhuQz
	 9jwsPnnxpHn7Q==
Message-ID: <76431b4e-27b4-4922-bc59-bf97516b40fc@kernel.org>
Date: Thu, 5 Nov 2026 09:02:21 +0100
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
Subject: Re: [PATCH] mm, vmscan: make kswapd unreserve highatomic pageblocks
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, JP Kobryn
 <jp.kobryn@linux.dev>, Frank van der Linden <fvdl@google.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261104-kswapd-highatomic-unreserve-v1-1-38be5106adf5@kernel.org>
 <75540cfc-0577-4d91-9369-d1c4fe9c3096@gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <75540cfc-0577-4d91-9369-d1c4fe9c3096@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 22:56, Jose A. Perez de Azpillaga wrote:
> On 11/4/26 7:38 PM, Vlastimil Babka (SUSE) wrote:
>> Hook this highatomic unreserve to the moment we are increasing kswapd
>> reclaim priority, as that is when kswapd is struggling to make progress
>> and it should roughly match the case of direct reclaim failure.
>> 
> 
> isn't raise_priority true after almost every pass at DEF_PRIORITY, stuck
> or not?

Can you elaborate why? At least at first glance, kswapd_shrink_node() should
return true if it scans the requested amount of pages. So I would assume
that although balance_pgdat() will do multiple iterations to reach high
watermarks (because every round of kswapd_shrink_node() will limit itself to
SWAP_CLUSTER_MAX per zone for sc->nr_to_reclaim) this should not be raising
priority if the rounds are successful?

> [snip]
> 
>> +		if (raise_priority || !nr_reclaimed) {
>> +			/*
>> +			 * Similarly to when direct reclaim is retrying, try to
>> +			 * unreserve highatomic pageblocks on the node. Convert
>> +			 * them to movable ones as kswapd doesn't have a target
>> +			 * migratetype, and passing unmovable should lead to
>> +			 * least permanent fragmentation.
>> +			 */
>> +			for (int i = 0; i <= highest_zoneidx; i++) {
>> +				struct zone *zone = pgdat->node_zones + i;
>> +
>> +				unreserve_highatomic_pageblock_zone(zone,
>> +						MIGRATE_UNMOVABLE, false);
>> +			}
> s/movable/unmovable/ in the comment?
> 

