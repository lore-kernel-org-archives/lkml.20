Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD8C501F36
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793780; cv=none; b=WH8gd6xi8Mkr03Ogzk0Lmx9Q1y1pzudZ0gJa2fROW1RkuGDtsiYH23ryePxd3m+WBNyO03fLNp5NiMBUv2xEPFv69wpsl30WQTd1kZHO4Re8ENthK/FjhesiedUWKKAhuh1UvpUSUjn8kuursHnDXNcc0QA+5bN1cxsIYGtWWpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793780; c=relaxed/simple;
	bh=vYccEb9v4ogQi1pDxqXbn5V1aO3tYmPKmmHkHmBZo+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHGRBRXSVlPBUQO/3g90sR46fFzLsnfWWurMNaB3xdtq17T0c2jqRLgMucnZbMCLhwZSAK549Yb+EVOMezkoky5uO/YByEH1miiHVUAwnUzH/coR8rJnAUnetoVEAKp5GNEMqoqdYmv0Mbzlo4ygFS9VPLVnJ6L9yWdAoSTgNM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZ2Ej4o6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZ2Ej4o6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808521F00A3A;
	Mon,  7 Sep 2026 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788793778;
	bh=a2tewgAqN1l+PrFwzJKAGhBGvdeNnZRzDfeds4hg5zQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jZ2Ej4o6rCHE2ixHPTMWVEAmIO5OFj7MCI5XtjI1faWcP9lpG+HKvXSgQnnKOKaNu
	 OSY7kCfUHC2N40EHpjnYwTVbQCDs8ZVTlGyw8AV1JoMFXO7+w1pzKYj2gtYCK7w+0o
	 ezaMAlDteQT5vaKbQp0EkqF2hITJRtSYSJ7OLiL5qvyNmx80Mwds/eGji17U1sNaNn
	 a5H0W+TS/TiCCvTYjJeWXhtI6u42a52JMveYl/lnfin0T/yDvgkKs+gPvYuPQf5+IW
	 TBWH4fI/eV5wG8xmpsZJ4oE0PZqSqGvEUoBl+M9K8gP+xtMxh0tPt6BuFkJ4VzCzH3
	 AFMcrPlq8NqvA==
Message-ID: <55ce7bee-c0e0-4051-8bc4-26cf3aa3f7e9@kernel.org>
Date: Mon, 7 Sep 2026 17:09:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
 MADV_WILLNEED
Content-Language: en-US
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Pedro Falcato <pfalcato@suse.de>, "Liam R. Howlett" <liam@infradead.org>,
 David Hildenbrand <david@kernel.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Mike Kaplinskiy <mike@recall.ai>, zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
References: <20260904-madv-will-need-map-private-v1-1-6b83cc99fcff@kernel.org>
 <apriM1q4GzAgP7JQ@pedro-suse.tail5790ac.ts.net> <aprjOxDy3JCPb2oa@gremlin>
 <20260905171757.ba8b0f8f0f18ebd04418bfeb@linux-foundation.org>
 <ap6u6Ana3MvvIIUe@gremlin>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <ap6u6Ana3MvvIIUe@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 14:32, Lorenzo Stoakes (ARM) wrote:
> On Sat, Sep 05, 2026 at 05:17:57PM -0700, Andrew Morton wrote:
>> On Fri, 4 Sep 2026 17:01:37 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
>>
>> > Andrew - could you swap the patch out in-place with below? Thanks!
>> >
>>
>> np.
>>
>> > Currently MADV_WILLNEED treats file-backed and pure anonymous mappings
>> > entirely separately - using POSIX_FADV_WILLNEED (equivalent of a readahead)
>> > for the former and a tree walk and swap in to swap cache for the latter.
>> >
>> > MAP_PRIVATE-file backed mappings straddle the two and currently get treated
>> > as if they were purely file-backed, meaning any swapped out private pages
>> > remain swapped out.
>> >
>> > Resolve the issue by explicitly checking for CoW'd MAP_PRIVATE-file backed
>> > mappings and performing both walks in this case.
>> >
>> > Since the logic checks for vma->anon_vma this means un-CoW'd
>> > MAP_PRIVATE-file backed mappings retain only the single file walk.
>> >
>> > Reported-by: Mike Kaplinskiy <mike@recall.ai>
>> > Closes: https://lore.kernel.org/all/CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com/
>> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>>
>> The failure mode looks pretty obscure, so I'm thinking that no backport
>> is needed.
> 
> Well it's not even really a failure mode so much as a 'known limitation' :)
> So yeah agreed.

Yeah, as we know madvise() just an advice after all, the kernel is free to
ignore it :)

(MADV_DONTNEED and friends enter the chat)

> --
> Cheers, Lorenzo

