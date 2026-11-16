Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828981;
	b=VFFUekASQByDvl8+jmUMfTdukoFV+NsCaBY5bVlY41z+qC4MDSj6jeR1YYNWV69RpacT
	 yhzIIihmhWOh60GOCQjedXxEaH4QwpAxjByJ49zURX/fMCMiVS6K/d9ApbpGtn7UVM8Ne
	 Hm/TF3sxzda1+ZRzIEZ7bZtuHQ1k630bQj995SjjZSJbmnYm1xL/z6RAwD7imneZyLx+4
	 ONSeCSaYoj0IF76FzjGsLJVEFcr9MFg1InVwTfOTEuq6Ru6zi2pBAQJ3ZfqK0lX9GLIlY
	 +IML4rQpu7UkRXzqj7H+D4FAD5ZzMZBEKkYJk/J8WfzrutWNtCUbwr49HM6Yt1A4/VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828981;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pAYwOqj72xaPTAga9I5XXxlhmXlx4t/3+61UtxIhuH4=;
	b=vMvG4vnVgK8Aqm5jsBJYf8bX5NsmgGpFwMa1octSQKamw/RIlxqd3rKJS7dXsYgJ85NU
	 OlOxcTDF6HYve0aqH9GG53M3GvHGZEqowY0gauNsGqQX/yxM1zJripj8C0ypT71d9BadQ
	 +tG49zzvjMURZFf5ijykb6sCnRBG8qZT4KFRrOkL9VwXOqxQtzZamUUMMi9HRwmAJ4iWj
	 LXACy+93Pv1M8ss3JfSzMYcJ9ceeqXlTZHBKqkEyI2p+nQbXKfUSKz7T06agJuCSba3gE
	 yXx98YNppiaDAkA9lBqmmay04QMLgxdmtpT+nF2LZFbeO3CktFvnc8eMmy9Q5b8/gaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTv0PSI7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13166606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTv0PSI7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B9C1F000C4;
	Mon, 16 Nov 2026 11:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828980;
	bh=pAYwOqj72xaPTAga9I5XXxlhmXlx4t/3+61UtxIhuH4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kTv0PSI7IUDsu8y078oL7oMWnCU2IlWTNtMb8yCl0kYXvUvuBMP97EuqYc0pnvWah
	 Z3z16+lOzn7oRU+zdC8d0huLlYIKnEHMoNLOXatg9xkRo9Ly3i1r8Qw4G2OQkWeFI1
	 O9YUGB+wSKJ9GU7bk1T8wWpoCEYjxWYHq0PwM74scSQA/9h8KxrGxxlWykW/V1ZBZA
	 gLt0T6RJ30N98+9OXDn4pRH7BIYeC5A5yaL5+QaRP/oWLILT76V1PxusJoVwqiIL3r
	 oQZzLlIXHTl1w9scVpvv7h839eW9rPt4pIxmmK2jEUVte41RTX1+K75eFidNoivJyw
	 ugZ+/k8UNW9bg==
Message-ID: <b6765576-0db0-498f-8564-3a0ecf420b37@kernel.org>
Date: Mon, 16 Nov 2026 12:36:16 +0100
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
Subject: Re: [PATCH] mm/compaction: sample empty pageblocks again from a
 random offset
Content-Language: en-US
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20261104101747.2485913-1-kas@kernel.org>
 <28a340e0-76f5-416f-a74e-f74f4a2c2d36@arm.com>
 <d92f9b62-5d2a-44af-908a-ef80fc8e1766@kernel.org>
 <avroysmflhyRZ42p@shutemov.name>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <avroysmflhyRZ42p@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:32, Kiryl Shutsemau (Meta) wrote:
> On Mon, Nov 16, 2026 at 09:38:29AM +0100, Vlastimil Babka (SUSE) wrote:
>> > IOW I think the probability this patch is going to have a downside is
>> > more than that of upside.
>> 
>> Agreed. This seems to all be based on a hypothetical scenario, only
>> constructed artificially to demonstrate it. A real-life motivation is needed.
> 
> Fair enough, let's drop it.
> 
> It is not entirely made up, though.
> 
> I stepped on it while testing another series. A fragmentation stress
> test gave bimodal results: no direct reclaim in most runs and hundreds
> to thousands of allocstalls in others.
> 
> It was confusing and looked like a regression in that series.
> 
> It took a bisection to find that the only thing that mattered was where
> the free pages fell relative to the stride grid. The test in the
> changelog was built after that, to show it on purpose.

Yeah I think it's better to make such stress tests randomized instead. Such
regularity might hit even other unintended effects.

> The workload is very artificial, but the fix looked simple enough to
> post.
> 

