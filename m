Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AE337F8CA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422430; cv=none; b=ta7zfUEvwlswN1GuvyYddf3x7NaYDzsUa1bApFDnLypKWNabhp+XINQSafha03s203lOZvw6eFk7oXOOz4ylQXYopdR2T45E+dm60udbmDACwF5KwXWh0cdeQXeXCgXrHTS1SWnl2iQ2Y1Dugtv5STrC8v1zKBVkd+2EESkopMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422430; c=relaxed/simple;
	bh=IiSD1Kd6l72CtXC372nsMHFluY1YeXG015CTqpig3DM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHiDcVYjPI4MmdN5k/v4MKQKBffHMlUoLgAV3/a+OlCbBdI63qY1V7hbKfzJIKGUrqfx1bctNABHkI0FnsX1RB6Kdy4g2qlpj9Wjo08Uj1pJyAqUneZQuGcJtld5N+JDQw/QjEWhy2U28Wnqur9EGtIoeZWB38TVzvdek8YEkMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7iRT08p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7iRT08p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359B31F000E9;
	Thu,  3 Sep 2026 08:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788422429;
	bh=mH9xxi+NuX/7rAStj5yokYt3AaeJoJgJZjMceCTL2nE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=d7iRT08pKtrpl+FS8F9XGYWGb54fjKRbJt/wm7yMpEXiokgdrv23tgEn8Dje5lFxB
	 Xpel97egrz56kjU20xZ4pk4d0TtaQ+G+af792PD36Zccz2MkZQ/aMYkK85gA3YsjAD
	 BGRwxxvOg7bPL2QDe7W6+cmgR2QlNoOo1+y7Y32T1P4YxFCmmjVSh+Osfiu3ya0Vl3
	 cjLDlkcxY70ZVR01S80kC9kcUhQt9eQobn7vu5qjlq3+4kGVEXa+xf8vBHOSGTMJfu
	 BaOO4k16B0EpfQpyBMrlzKbuzQYoQ1cUGKB4mtlyZNUKNNbue7QcTW9+WydcfQpqe7
	 hgEgZEcEaUr2g==
Message-ID: <76dd87e0-cd34-4ce2-9586-d7ff019b1fb9@kernel.org>
Date: Thu, 3 Sep 2026 10:00:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/26] mm: introduce freetype_t
To: Yosry Ahmed <yosry@kernel.org>,
 Brendan Jackman <brendan.jackman@linux.dev>
Cc: Brendan Jackman <jackmanb@google.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 Sumit Garg <sumit.garg@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 rientjes@google.com, patrick.roy@linux.dev,
 "Itazuri, Takahiro" <itazur@amazon.co.uk>, Andy Lutomirski
 <luto@kernel.org>, David Kaplan <david.kaplan@amd.com>,
 Thomas Gleixner <tglx@kernel.org>, Patrick Bellasi <derkling@google.com>,
 Reiji Watanabe <reijiw@google.com>, Sean Christopherson <seanjc@google.com>
References: <20260726-page_alloc-unmapped-v3-0-6f5729aa9832@google.com>
 <20260726-page_alloc-unmapped-v3-13-6f5729aa9832@google.com>
 <anJmOMqCVugycC9x@google.com> <DKOLND2TRB15.2Y8DKB3ZKEYAY@linux.dev>
 <aoOomzh1ErtSeKFb@google.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <aoOomzh1ErtSeKFb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/18/26 02:35, Yosry Ahmed wrote:
>> >> +static inline
>> >> +struct list_head *free_area_list(struct free_area *area, freetype_t type)
>> >> +{
>> >> +	int idx = freetype_idx(type);
>> >> +
>> >> +	VM_WARN_ON(idx < 0);
>> >> +	return &area->free_list[idx];
>> >
>> > Should we return NULL here if idx < 0 instead of an out of bounds
>> > access?
>> 
>> TBH my descending order of preference is:
>> 
>> 1.
>> 
>> BUG_ON(idx < 0);
>> return &area->free_list[idx];
>> 
>> 2.
>> 
>> if (WARN_ON(idx < 0)) // OR VM_WARN_ON
>>   return NULL;
>> return &area->free_list[idx];
>> 
>> 3.
>> 
>> VM_WARN_ON(idx < 0);
>> return &area->free_list[idx];
>> 
>> 4. 
>> 
>> return &area->free_list[idx];
>> 
>> But I suspect[0] Vlastimil (and Linus) would order it the exact opposite
>> way.
>> 
>> [0]: https://lore.kernel.org/all/bd36e972-8900-4476-a66b-4dc218b21a4d@kernel.org/
>> 
>> And I care more about making Vlastimil (and Linus) happy than this tiny
>> detail of the code, so I'll defer to him. The current style is a
>> compromise, but maybe it's just a compromise that makes nobody happy.
> 
> I think I prefer #2 (regardless of whether it's WARN_ON() or
> VM_WARN_ON()), let's see if anyone disagrees.

#2 can't work with VM_WARN_ON as it returns void. Otherwise if it evaluated
the cond with DEBUG_VM and hardcoded false otherwise, it would be ideal. I
don't remember why it's not.

Do the callers all handle NULL safely? In that case #2 has some merit (maybe
with WARN_ON_ONCE()) otherwise #3
