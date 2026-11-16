Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826548;
	b=K+0DJizpopRWa70SxSFZVoq8iED6bnPnZF8eIxLCI8beTUiQQYwmJlxlFac93cn8DC+C
	 MyjCl9V1JfopeYtmeD6/4ooKuPnwP2oOJVBNGn8dYX6YM7zVUg3JPJInXB2Kz7qutXi4E
	 JlE9hDljlLF/REyy+LSFPs8/aQL7iU57rmNjsq08FDubypO8TBbnOWMUrP2/thdBQ22/J
	 /Om1hcIbk1fPNEEq0bLLqXr4aMJYx+hIs5lRgksfyAdr+nBUUJjxdFud/jtwjDrPfWSzA
	 DEQ2AFEcJFzv66fImR3GncjEBWKEjLkgrJpjZQE1ckK0rvSUnMbz4LP5mM7J4x5eRVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826548;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kmQvt1UCbjuMhtpN4OiUXlJWOrQfIZG1i7NH6rxNLIQ=;
	b=rkMSm48/fR0XulG5CCZeV40ebq+uphtbAE0SoxrlWeV7ibF0PiUYt6qxuEgWZMynB7PC
	 4zb2dkbwkxMJIvfNOAXsCr9YlUfQxQq9OjKP1feM9J9J05/3nvvwvUn77hQ7hOYv6bfnM
	 /tFXt9WjIG9nX//Cjz2KnVeZpFmzX6Lv4QTpduyS2j0m8HboVMwrEW1oA82V8ceFdCI3m
	 aB3Z4wfcZpLEiLBkLj/mLuyHDCPFz/pDYHkJXv7HVx2uykkJf0u+1LUvBJmo8AACEDAtl
	 3fR1zX/MVRnFWEKPLl5PY2nEBvRzfpJW729+qGpZVW9QsqLebIQTQEeagpyCw/3hY+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FVc++JR0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2479606A88A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FVc++JR0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8052B1F000C6;
	Mon, 16 Nov 2026 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826548;
	bh=kmQvt1UCbjuMhtpN4OiUXlJWOrQfIZG1i7NH6rxNLIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FVc++JR0UFlf7jLyOMMTzAI48mqJyJjV3G4SJDcE0txQcYOrgpGg1+mb3iNMcdkgN
	 WMSLi1KndEhtQ1NjgPR31/+w+ZgFWNtuQZY8pCW7mNUSD3HxuaOM76GDqtTGay/EIA
	 Gr1ptuVEWgJjLEhfKWmlhV266LrWJkUaljCDV3ewocUUSfgd2WDi+vK1H2CbyLPmJB
	 UZ/1BhXkzhdU9uOYKTFYhyFxHScm/R7e6Pq1WxnroZruyDfFZMh+62apb3O+Ji2UVj
	 nsPbQ8NIwFm4OuvWMgVv0wmYNnDAAtGrxf5rrwt2/UXl48mSuAJkIB0E+XaeMk4wxM
	 61N3tN81JRyLQ==
Message-ID: <505e53ac-6720-431a-b272-bc5bd593b0d6@kernel.org>
Date: Mon, 16 Nov 2026 11:55:41 +0100
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
Subject: Re: [PATCH v2 1/3] mm: page_alloc: add a watermark check that knows
 the migratetype
Content-Language: en-US
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Dev Jain <dev.jain@arm.com>,
 Harry Yoo <harry@kernel.org>, Usama Arif <usama.arif@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261102093939.3340540-1-kas@kernel.org>
 <20261102093939.3340540-2-kas@kernel.org>
 <7e82bf2d-3a36-46d4-b63e-6b6720620380@kernel.org>
 <avrVAUGFUJdoVRG7@shutemov.name>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <avrVAUGFUJdoVRG7@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 11:41, Kiryl Shutsemau (Meta) wrote:
> On Fri, Nov 13, 2026 at 05:51:52PM +0100, Vlastimil Babka (SUSE) wrote:
>> On 11/2/26 10:39, Kiryl Shutsemau (Meta) wrote:
>> > The high-order check in __zone_watermark_ok() accepts a free page of any
>> > migratetype.  Under ALLOC_NOFRAGMENT, a request below pageblock_order can
>> > only take a page of its own migratetype or claim a whole free block, so
>> > the check can pass when the allocation cannot succeed.
>> > 
>> > Telling those apart needs the request's migratetype, but not every check
>> > wants them told apart.  A check whether an allocation can be served now
>> > has to count only the pages it can take.
>> > 
>> > A check whether there is enough free memory counts every migratetype:
>> > kswapd and kcompactd balancing a zone, order-0 thresholds, the
>> > slowpath's forecast whether reclaim and compaction can still make
>> > progress.  Reclaim and compaction work across migratetypes to free whole
>> > pageblocks.
>> > 
>> > Move the body of __zone_watermark_ok() into __zone_watermark_ok_mt(),
>> > which takes the migratetype as well, and make __zone_watermark_ok() a
>> > wrapper around it for the second kind of check.  These use the new
>> > function:
>> > 
>> >   - the allocator fast path, zone_watermark_fast();
>> >   - its recheck after node reclaim in get_page_from_freelist();
>> >   - compaction's up-front check, compaction_suit_allocation_order().
>> > 
>> > Declare both in mm/internal.h: nothing outside mm uses them.
>> 
>> Why not mm/page_alloc.h instead, now that it exists.
> 
> Ack. Will change.
> 
>> > @@ -3665,6 +3666,21 @@ bool __zone_watermark_ok(struct zone *z, unsigned int order, unsigned long mark,
>> >  	return false;
>> >  }
>> >  
>> > +/*
>> > + * For checks that are not about serving one allocation now: kswapd and
>> > + * kcompactd balancing a zone, order-0 thresholds, forecasts whether
>> > + * reclaim and compaction can still make progress.  They count free pages
>> > + * of every migratetype: reclaim and compaction work across migratetypes
>> > + * to free whole pageblocks.
>> > + */
>> 
>> What a slop comment, sigh. Can you rewrite it normally?
> 
> /*
>  * Return true if free base pages in the zone are above 'mark' regardless
>  * of migratetype. Use it to check whether the zone as a whole has enough
>  * free memory. Use __zone_watermark_ok_mt() instead to check whether a
>  * particular allocation can be served.
>  */
> 
> Okay?

Yes, thanks!

