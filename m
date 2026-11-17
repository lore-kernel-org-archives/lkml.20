Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909646;
	b=qaac+g6CN2QPDUEZQa1iP7TX0JP5wgAYO/glYMAxTI/Xr0oqHpT4kJEzUTwP2n7i079u
	 xtCb9+7xw9mC6jU2rLnfNuRJxLl1kemaFlW2Ucj7C7nnkouW3Blc3dhZzXsn4rSxNJpsV
	 NZatKuxm19sn3tMXWVf3DOEIRSYcXSyLMSLI2MBZSdm/sjExRWXQpp0vNhOKm7GT3G6qI
	 Cu2OB3Q69gaNjIV452dcooD28rO32jv08iEObeajC0SmlJW5VOFbxVMA6SfVSpS808DJH
	 OLc1Kwy7e3JL8k8PFdBaT5PNF7OO9pldalda5mNCfhtKoQohaNNqYoa4btSZuz52Y5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909646;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rLU0m+i51pat3GsVZS9FC+8o0VmdU4AL5cy98JWS7c8=;
	b=NaAHHHs7aaSAHzHYk5Zc5XdcDMBVe8rPO3JpVo4TUkegC1ShTK5zZqb+5ld0dp/UORh7
	 4edd0GENAsXJsp3CeEzuLKDujt+TfNI51UyvF7AKsTqfppmnz4OUr/obq0IXPs8jrIyhM
	 97EMiWxm5CNMBaRsauU2XKxfjNrAn/ivWTQpZ+GtHpC9K/VVgVW2gwqRD1nSjpSma2H32
	 iPu2zpDIJDXFlMH998XeWaFTcdo5umzjrVaqf5pyqW30aUZUmpys+NGtXQyN5DFKFcUCg
	 IhF9C2OGl6wOpXcF0W4n4v328t7mf500AGjcKRhPtzs4LcsNtdzKDF5SjQSz1pAbofg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cZhOFAFV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80266606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cZhOFAFV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27711F000C5;
	Tue, 17 Nov 2026 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909646;
	bh=rLU0m+i51pat3GsVZS9FC+8o0VmdU4AL5cy98JWS7c8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cZhOFAFVxSdeDuTxSxEhs9gPpiWywSH6yCyruwfni1yeF1qmJqvrfwBErLufmMBan
	 v8UrVqfIqcZD02hwj7QfnjggRxzVAIPAzV6h7WvTLUFkFh7D2+CSj+OERAslUxr89j
	 omooWQzphPlqBa2fgYx+szJ0w8baRW/psZ54GaJB7oo3UFLRvYki0+sCUNzY2O0kp+
	 Gaz6TaLKYtW0GpnwpkWR2/v2+QJOCDScSxfgLKpoW1oCGohoIcax3kHF+PALoekhO/
	 9EjcscmKQFbaQfGkyn656zX4mCbhyUX8AZv6LmHZdfpj3XzeyfT4SFElCLWSvQPN25
	 YOtFYgWJ1FtHA==
Message-ID: <8c0ce90d-74d8-4578-bfc9-9218fcae8165@kernel.org>
Date: Tue, 17 Nov 2026 11:00:36 +0100
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
Subject: Re: [PATCH v2 1/2] mm/huge_memory.c: skip zero-page remapping when
 underused THP shrinker is disabled
To: Nico Pache <nico.pache@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>,
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Usama Arif <usamaarif642@gmail.com>, aarcange@redhat.com
References: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
 <20261025-b4-ksm_fixv2-v2-1-8b61ad0491f1@linux.dev>
 <175e7fae-2254-4e13-a4ba-0d39fb82018a@kernel.org>
 <22894af6-fd2f-4c26-b74b-d950f55a4e1b@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <22894af6-fd2f-4c26-b74b-d950f55a4e1b@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/17/26 00:08, Nico Pache wrote:
> 
> 
> On 11/16/26 3:30 PM, David Hildenbrand (Arm) wrote:
>> On 10/25/26 18:39, Nico Pache (Red Hat) wrote:
>>> The zero-page remapping in __folio_split() was added to support the
>>> underused THP shrinker. When the shrinker is disabled via
>>> shrink_underused, gate TTU_USE_SHARED_ZEROPAGE on split_underused_thp
>>> to avoid scanning subpages for zero content unnecessarily.
>>>
>>> Suggested-by: David Hildenbrand <david@kernel.org>
>>> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when
>>> splitting isolated thp")
>>> Signed-off-by: Nico Pache <nico.pache@linux.dev>
>>> ---
>>>   mm/huge_memory.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index bd44d58e8684..2d56d1bff0ea 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -4104,7 +4104,8 @@ static int __folio_freeze_split_anon(struct folio *folio,
>>>   out_no_split:
>>>       local_irq_enable();
>>>       if (anon_vma) {
>>> -        if (!ret && !folio_is_device_private(folio))
>>> +        if (!ret && !folio_is_device_private(folio) &&
>>> +            split_underused_thp)
>>>               ttu_flags = TTU_USE_SHARED_ZEROPAGE;
>>>           remap_anon_folio(folio, 1 << old_order, ttu_flags);
>>>       }
>>>
>>
>> I guess the change is not that relevant in practice, because I suspect most
>> people always run with split_underused_thp=true
> 
> Yeah these two patches are only tangentially related. Technically with this
> patch (1), disabling the underutilized shrinker would indeed fix it, as we no
> longer are doing zero-page remapping. But the root cause is the split initiated
> from KSM.
> 
> Most people always run with split_underused_thp=true, but they also run with 511
> max_pte_nones.
>>
>> Th question is whether "split_underused_thp" only determines "that we trigger a
>> split if underused", or also "what to do when splitting a folio".
>>
>> Yes, it was added for the deferred shrinker, but the semantics of the toggle are
>> not quite clear. I don't think there is any documentation for it ...
> 
> Yeah Im not really sure if the intentions were to make all the splits do this
> zero-page remapping. And im not fully aware either of the potential impact to
> the system (whether positive or negative) this could have system wide. You could
> argue it keeps better system utilization, but you could also argue the cmp is
> expensive.
> 
>>
>> Disabling the "split to zeropage" entirely with the toggle off (behavior before
>> the toggle was introduced) makes sense to me.
>>
>> But the behavior now already like that in the kernel for a while.
>>
>>
>> I know that I suggested this, but I wonder, is this patch relevant for your use
>> case and patch #2?
> 
> Technically patch #2 solves the issue im actually trying to tackle. But during
> this case we also found this functional change which we werent sure if it was
> intended or not. As you say its poorly defined.
> 
> Im ok with or without this patch. Perhaps we can take patch #2 (bar'ing review),
> and I can try to do some perf testing regarding the effect of this zeropage
> remapping system wide, and base our judgement off that.

Okay, then let's focus on patch #3. The semantics of this toggle here are rather
akward (and I'd suspect we might just get rid of it at some point).

-- 
Cheers,

David
