Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3B146EC77
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368092; cv=none; b=t4JiyXOjztEI+KAV0p9D+syUqS+7poTaq3dfs8Zx0DOC0JM0ZtGDJicu6KKyEabqUUzEqSYPoLJXPD6lc4vYGBkyD9pgO1bG1kMVmo09AqTFU845yEy2CLexSk3nZOr7+nWtXeGPkytr8khMpmHWRszeWyy7M9VoWXRO9CQWdX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368092; c=relaxed/simple;
	bh=SnxAA51Phu0y+7xpwqWPQ6doD/tRmrRov5pAbLdJmEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpMritTI1XkCg7fpuNV6CoZqxAzD4P1HhbzksHVpsqw5bte7pXExU4fXAO+FozfPNyR9S5JcgqOySz36DAWIQ2Ts1NKzbiG1YWMUT1s8yanqsDXGwog6ChqjK3xo4VMIx7NE/N/Dp7mPQsgfgGSRtAZ2Cpg0CQmnk4P/B76udpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FB1Jj+4M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FB1Jj+4M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D93F1F0089C;
	Wed,  7 Oct 2026 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368082;
	bh=sN3INHehnuwIqDn1zYTsEcVzsGRL6CVhM7/fVLldTGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FB1Jj+4MqHujCz0zvS22SPjFGFSsrXDGCuzOjpgQtN013w5rV851tYy9C0wVlN06g
	 lVn5pGnLwSETgHOitqZIdyTEUqJMMO3NsQP4bC41zsn3cel3w28KDQ9Cs2dV3B6EF7
	 r0l1ehCejzQ7Ks/+s5Y3vKko92Y5IXQ3im5b9IDIOJtpIomIAMdUSONUYVbcUIko3w
	 H3HQ46u6TcHOOKEdmv8ZjwYHfPgmTnGv66RuTTCXWdHaSO+/+JRVPbTBDfai8JgsV2
	 cHXB8qFuVtQcG/bBwx5f6Oxpp6gP/dbtOnd507ief8+REiIGtByOhxqihIrCMcwhod
	 6ncGqIcOqpxPA==
Message-ID: <36599ffd-8f7c-43e4-8ea5-ddef02a77c08@kernel.org>
Date: Wed, 7 Oct 2026 12:14:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/gup: batch PTE-mapped large folios in
 gup_fast_pte_range()
To: Rik van Riel <riel@surriel.com>, Yuan-Hao Hsu <aa9736195201@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 liam@infradead.org, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Aristeu Rozanski <aris@ruivo.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260917083747.786-1-aa9736195201@gmail.com>
 <f8f6d553-d818-4cc6-a1a1-a9c9149a17e9@kernel.org>
 <fca681e9e9af66c8bbc43a181409ef44a24d9250.camel@surriel.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <fca681e9e9af66c8bbc43a181409ef44a24d9250.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/7/26 12:07, Rik van Riel wrote:
> On Thu, 2026-09-17 at 10:42 +0200, David Hildenbrand (Arm) wrote:
>> On 9/17/26 10:37, Yuan-Hao Hsu wrote:
>>> GUP-fast grabs a PTE-mapped large folio one page at a time.  Every
>>> PTE
>>> costs a try_grab_folio_fast() (a refcount cmpxchg, plus the
>>> pincount
>>> atomic, a full barrier and a node stat update for FOLL_PIN), a
>>> gup_fast_folio_allowed() and a folio_set_referenced(), so a 64 kB
>>> mTHP
>>> pays sixteen of each and a PTE-mapped 2 MB THP pays 512.  The PMD
>>> and
>>> PUD leaf paths already take the whole range with one
>>> try_grab_folio_fast() call, and the slow path is getting the same
>>> treatment for PTEs in Rik's follow_page_mask() series.
>>>
>>> IORING_REGISTER_BUFFERS of 1 GB, median of 15:
>>>
>>>   64 kB mTHP           6179/5998 us  ->  1599 us
>>>   1 MB mTHP            5790/5801 us  ->   893 us
>>>   4 kB pages           7173/6741 us  ->  6763 us
>>>
>>
>> I think Rik was already working on this and sent some patches.
>> Anyhow, there is
>> quite some GUP review backlog I have t go through, so this will have
>> to wait.
> 
> My patches are for the regular gup path, in
> follow_pages_mask()
> 
> This is for the gup_fast path.
> 
> Unfortunately there is some nearly duplicated
> code between them. Last I looked I did not
> find any clear ways to merge them, but I
> can take another look if you want.

We'll likely have to keep it separate.

I looked at the patch here and it needs quite some work do do it cleanly. Too
much for me to comment on this, so I'll likely end up doing it myself or
delegate it to someone internally.

-- 
Cheers,

David
