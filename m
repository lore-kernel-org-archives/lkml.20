Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793516380;
	b=Iwba1PxuXkRyL0YKsn81/L2UEMZm7p4Y/P240dAXo1LWaFWS6QTahibUB8Z/5vbTUHkX
	 DLjZWLSoEFCJuokAZifDknGRf2fkR2sQVESaOpzXeKKHabQ67oOTIOPqVPme/ETipXI4z
	 Mh++fyismb/d82Lf/4m54tyFKHwcjaIgqPaCaHBdSS99yyQW8BqJ35yOY97Bbxikh3IcW
	 iCrNNHkAA+0jRe5mSlxCL1SDL94JSz7cKC/8ynhmrS+bTySmzR6S1FToEEqeXhnxk2ENU
	 pgWGJ7h6FmqYGlpfkZ3RO5OSVTSe4XhA88OoCFYNCIxbZYgDi/ZsiugT16eeMYIXCaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793516380;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YeIoxROzkAdhFI4Ar5AnwjuAhq4OI4vjyPjDPC2k3nU=;
	b=mTCamxan/dbUmHEs5ZvdONC2+e2EO0oZcXTR2mlsbRG4h8NzhD6ktPOPelpcwrTrNm3E
	 qFmGjfBsFXWhX4/k83EpgLzCmO5gTQHfg6Oe9nnp/qXuQ0mkbB9OH/9YG7kOKdDLhzPjn
	 J+u1uWgprkc4/WgDbguEFxoT83AY7jPWHaz2NNYLS+9UpXWg/UUFQNESo8XmDhTdqA8uv
	 VHktEaiHTNfsPFeLegttIl0auKM46enA/ldawCHeVSSCyStqiae+PF03aFodcogQMrFuv
	 UjTtu0xHLH29Ge4Sj0bfARkuziyOtAtwdv4eqo3yxLdaAtTs//IUrzG27NxL4wCiQoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KsW8zLjF;
	arc=none smtp.remote-ip=95.215.58.251
Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC11606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC11606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KsW8zLjF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uSVvmFSAIOfOrJ9voHYtRM47z6sjBlD60gkSR70O4ak=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793516378; v=1; x=1794121178;
 b=KsW8zLjFG6M6V/qOXwO1HZPLeKqacZiKOP5IsUbZakyHpCXTx1jy7XHWmVpu8XNRaUsNOfim
 g+U7Vd3AgTiyqqLSXaNqtpgJesGIv3jJgLv0z8tJQXejBjLrSE3sRoEG2RGROrD6rXAN1Z6ZR+f
 yas9estBnISXcXDy98W/ZWRs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3eacaad6ebce6e07;
	Sun, 01 Nov 2026 06:59:37 +0000
X-Mizu-Trace-ID: 3eacaad6ebce6e07
X-Migadu-Flow: FLOW_OUT
Message-ID: <f91ed3e0-59f2-459e-8c72-abe093892e73@linux.dev>
Date: Sun, 1 Nov 2026 14:59:29 +0800
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
Subject: Re: [PATCH 02/12] mm: hugetlb_vmemmap: unify
 VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
To: Muchun Song <muchun.song@linux.dev>
Cc: Muchun Song <songmuchun@bytedance.com>, Oscar Salvador
 <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>, David Hildenbrand
 <david@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <86d9a986-58ea-44f5-a8af-514abff12c2a@linux.dev>
 <99503D05-0C4D-45E4-B5D6-EDD927838935@linux.dev>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <99503D05-0C4D-45E4-B5D6-EDD927838935@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/1/26 2:56 PM, Muchun Song wrote:
> 
> 
>> On Nov 1, 2026, at 14:22, Qi Zheng <qi.zheng@linux.dev> wrote:
>>
>>
>>
>> On 10/20/26 7:58 PM, Muchun Song wrote:
>>> VMEMMAP_SPLIT_NO_TLB_FLUSH and VMEMMAP_REMAP_NO_TLB_FLUSH do not
>>> describe fully independent choices. A split-only walk can defer the
>>> PMD-split flush to a later global flush, and a remap-only walk can
>>> defer the final remap flush. However, when a PMD split is followed
>>> by PTE remapping, the split flush must happen before the PTEs are
>>> changed, because stale large-page translations must not overlap with
>>> new small-page translations that map different physical pages.
>>> Replace the two flags with a single VMEMMAP_REMAP_NO_TLB_FLUSH flag.
>>> Keep split-only walks able to defer the flush, but force the split
>>> flush whenever a remap_pte callback is present. Callers that batch
>>> HVO work can still defer the final remap flush and issue their own
>>> global flush.
>>> Current callers keep the same flushing behavior.
>>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>>> ---
>>>   mm/hugetlb_vmemmap.c | 15 +++++++++------
>>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>>> index 1105aa925acc..8b3abb562599 100644
>>> --- a/mm/hugetlb_vmemmap.c
>>> +++ b/mm/hugetlb_vmemmap.c
>>> @@ -42,10 +42,8 @@ struct vmemmap_remap_walk {
>>>   	struct list_head	*vmemmap_pages;
>>>     -/* Skip the TLB flush when we split the PMD */
>>> -#define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
>>> -/* Skip the TLB flush when we remap the PTE */
>>> -#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
>>> +/* Skip the TLB flush while updating the vmemmap page tables. */
>>> +#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(0)
>>
>> Since this flag is now also used by the split-only path, the
>> VMEMMAP_REMAP_NO_TLB_FLUSH name is somewhat misleading. Moreover, the
>> flag does not suppress every TLB flush, as the PMD-split flush is still
>> mandatory when remapping follows.
> 
> Yeah, good point.
> 
>>
>> Would VMEMMAP_DEFER_TLB_FLUSH better describe its semantics? It
> 
> I think so.
> 
>> indicates that flushes which can be safely batched are deferred, without
>> implying that all TLB flushes are skipped.
> 
> I'll change it along side with the comment to:
> 
>    /* Defer safely batchable TLB flushes to the caller. */
>    #define VMEMMAP_DEFER_TLB_FLUSH       BIT(0)

LGTM, with this change:

Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

