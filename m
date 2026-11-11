Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364028;
	b=1O9HF8DTteS/p25zwaDiJT99tyGGJgKM6T3yF+fK0Fph/d3Knkn713U6ef2UeO28zyuT
	 izZQgQnpYc8z13DuvIchv9mqzzZitKXeIdk+dboOrRei6rEUEL+bT555oD2HmqmdQOWc5
	 5NuwllESJ8a5dt5AOPyHIdziWamF5rdnlC2F2zt+fr4MnjmE3ElvRbFEN6PZXjS4ms1xa
	 1BuitfEUmqOVGZ8b64lJnN3Tz5KOtNiKnC606SIanTMHAkidX2ve3RiRjhIoIlcvWG8bs
	 UMuSpMoCNh4HrWe+1qQRGyXbEvh7nyhcKce2gfXvMEI3jNVPnDegtyICAU8xvQ/z8MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364028;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Cc:Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PhQURgUIcHKqh7HKNiSdZ1UHIXZTkSo2Cch6MWvnHLM=;
	b=e+cC6osjOeFQxEyBrX58VVP5d1NqPiMnSA/kXxZlNyoIZxQoIFzqfNFZzAglZnWyY/0H
	 5hd8DH6l7f1lc/v9BM7DfnFDNIwCw2gIN8bdsAVoVnvWBDNzpFif3T3tUGDgw/Vvc1lhA
	 2UgN+ND99EbcoqPN7Qs0aOfRgTP4KwnQ6c1lhNr7e4chLma1l3AlaYkvi5x7WpKUz7j6q
	 aJevxPKdISoSdCdOwCCk/OeXRiJ8DIt7S7blZP5eZBPlwohvjoT9EVe1+FaXE00ACHBQi
	 rVS/AQbKxyyes0Eg1mzWC6geyvBGIFfvJh70TPKPbIMO48FvEQac8FHf4MIVtX1WN0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o83sucRy;
	arc=none smtp.remote-ip=95.215.58.105
Received: from mta1.migadu.com (out-105.mta1.migadu.com [95.215.58.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9280B606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9280B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o83sucRy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Wv9122kMEZf/lFR0DCpqumkP3VwnY7IyQl5g+ItEPc8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794364025; v=1; x=1794968825;
 b=o83sucRymj2LXoKiyVVIXK6LuAaOSvns2VtDfVRFXz0P/Q0LJGDkPV43/jk8YnXpMEaBMT1U
 eLwmiJYraKRvEYGWk7uFMJ+4RBKOb5oDnUmSEaw9Na7WvP6ANaOmGhQOsUejn05WeF4e8LnW5nG
 lcpBkPFkKKnLXZmXjjCrl0l4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6bcbf81a8ca16547;
	Wed, 11 Nov 2026 02:27:04 +0000
X-Mizu-Trace-ID: 6bcbf81a8ca16547
X-Migadu-Flow: FLOW_OUT
Message-ID: <b66188b8-3b55-416c-a296-9313f94b5cfe@linux.dev>
Date: Wed, 11 Nov 2026 10:26:59 +0800
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
Cc: hongfu.li@linux.dev, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>,
 Daehyeon Ko <4ncienth@gmail.com>, Hongfu Li <lihongfu@kylinos.cn>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] mm/hugetlb: charge hugetlb cgroup and memcg in
 alloc_hugetlb_folio_reserve()
To: "Gregory Price (Meta)" <gourry@gourry.net>
References: <20261110-for-alloc_hugetlb-1109-v2-1-25795ce44f80@kylinos.cn>
 <179431474443.789062.10429880669466859032.b4-reply@b4>
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <179431474443.789062.10429880669466859032.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 11/10/26 20:45, Gregory Price (Meta) 写道:
> On 2026-11-10 14:05 +0800, Hongfu Li wrote:
>> From: Hongfu Li <lihongfu@kylinos.cn>
>>
>> alloc_hugetlb_folio_reserve() hands out a folio from the hugetlb pool and
>> consumes a global reservation, but unlike the fault path it never charged
>> the folio to the hugetlb cgroup or to the memcg.  Folios allocated for
>> memfd_pin_folios() through memfd_alloc_folio() were therefore silently
>> bypassing the accounting: they are never charged to the hugetlb cgroup
>> usage counter (hugetlb.<size>.current or hugetlb.<size>.usage_in_bytes),
>> so the limits (hugetlb.<size>.max or hugetlb.<size>.limit_in_bytes) are
>> bypassed.  In cgroup v2, with memory_hugetlb_accounting enabled, these
>> folios are also not accounted in memory.current and are not bounded by
>> memory.max.
>>
>> Charge the folios to both the hugetlb cgroup and the memcg, just like
>> hugetlb_alloc_folio() does.
>>
>> Test with a process that creates a hugetlb memfd and pins pages through
>> UDMABUF_CREATE. The counters were read while the folio was still pinned:
>>
> ...
>> Fixes: 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios() for pinning memfd folios")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
> Tested-by: Gregory Price (Meta) <gourry@gourry.net>
>
> one note below that is worth assessing but maybe not a blocker.
>
>> +		ret = mem_cgroup_charge_hugetlb(folio, current->mm,
>> +						gfp_mask | __GFP_RETRY_MAYFAIL);
>> +		if (ret == -ENOMEM) {
>> +			folio_put(folio);
>> +			/*
>> +			 * Skip uncharging hugetlb_cgroup since the charges
>> +			 * were committed to the folio and freeing the folio
>> +			 * would have cleared those up.
>> +			 */
>> +			return NULL;
>> +		}
> This adds a new -ENOMEM condition on stable which may race subtly on
> two tasks allocating against the same memory.max and cause failures.
> In testing, it doesn't cause splats or anything, it may just cause
> spurious allocation failures that fallback to other paths.
>
> This implication may be worth a comment in the changelog.

Hi Gregory,

Thanks for the review and the testing.

Agreed on the new -ENOMEM condition. It is a real behaviour change that
affects stable kernels. I will add the following to the commit message
in v3:

memfd_pin_folios() can now fail because the memcg charge fails. Two
tasks allocating concurrently against the same memory.max may see a
spurious failure. That failure frees the folio, returns the global
reservation, and undoes the hugetlb cgroup charge, so no accounting is
left behind.

>
> ~Gregory
>
-- 
Best regards,
Hongfu

