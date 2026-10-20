Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491839;
	b=Ya1PRfck0dTviAFeMfkc+tzL2pmrMcBFeMaNRBXvy4+/jdCcj570CkS6FwdoisCMZmFt
	 umYPWyuiu9zvgLkI2MLJ9Ad2KSEE2bjokigCzNmld5dQdMwu9pD3hi3WoK5/tR1rkV4RG
	 /IilrQxG0i4IjEyJshGJMkqFIpDiIYnHMidmLAifgc9A7DwQh8RogmOwLsxVnpG+FMhLS
	 l4wgtG4Rja/DTkkEvjtCss6I2Soddl+QF7EsTUr9bGKaPUE6/f/EwyCNiolN3mfDUkZzS
	 TBdg0KapYab1gOFDK7dtcHw+lxxQzmf7z6Br2apDr23NAIthE7ROf9qsXev2vaEH1ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491839;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0BfaLNG+1GrzLtNTyjqq5RXnkyj8x654Yffp8nh3UTU=;
	b=F84hlaXwtQHhMjkDL/yhLFM8kgcNdtXupDvzBhUbk0+rU6pe7gflhD0WWm04p1MaqZNC
	 r7wYH3XB1qcR02QY2ufJDeK//PxR3cDChiIFAgQGgcr1hv4jrlp/4jrGmlFB10kh1ah83
	 CXaI2Rycj1eCZaNfLxeN6kdUllRxJzJIaIl8oK0jYEnjVUWm/T2qjED3uHFnPhPanSK37
	 DrFW7MV1pfUk4Qz9uEBrAYVR3kyHAMddADbACZ1lhqnPvUe99GrKpN31cgIqKlXnjowXt
	 s941NZqDzzX7JhxqY5GIYtXQ+7lpVCTzXVdPh35JmG+/HcXKXp4nZJfAOyRhMIGR9nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Bk8B8FqQ;
	arc=none smtp.remote-ip=91.218.175.199
Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2B2606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE2B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Bk8B8FqQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xq83IAnPUw5tLOBMvZbp0yp+dVx7BwR94kISZs+eFjo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792491835; v=1; x=1793096635;
 b=Bk8B8FqQXjRrNooy3YQnQXwAZjDSUxdkp+EubYl6LibCd/jYCmR42jmXIqgWdfGU/BX2lFo3
 vP1KLSnQ2QVtXuPO1sP00Tb1+nXmG780o8kRV8dnsOQPde3y6xKMH2/Q7X+6uFQnkw/Ekn8ws1f
 tRPpRKPdAu2plYTElnjcKvIk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e512103824f9c4cb;
	Tue, 20 Oct 2026 10:23:55 +0000
X-Mizu-Trace-ID: e512103824f9c4cb
X-Migadu-Flow: FLOW_OUT
Message-ID: <04c89538-28c8-4d03-92c1-08d854a46ac4@linux.dev>
Date: Tue, 20 Oct 2026 18:23:49 +0800
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
Subject: Re: [PATCH 5/5] mm: hugetlb: enable CMA allocation for PMD-sized
 pages
To: Lance Yang <lance.yang@linux.dev>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 zhengqi.arch@bytedance.com
References: <df6eee954b62f41d65c4d087d17a7a7cf60da791.1792136742.git.zhengqi.arch@bytedance.com>
 <20261020091653.14959-1-lance.yang@linux.dev>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20261020091653.14959-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lance,

On 10/20/26 5:16 PM, Lance Yang wrote:
> 
> On Fri, Oct 16, 2026 at 06:07:36PM +0800, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
> [...]
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 218fbaee6f7e5..8c00fd9d0658d 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -1362,18 +1362,8 @@ static struct folio *dequeue_hugetlb_folio(struct hstate *h, gfp_t gfp_mask,
>> static struct folio *alloc_gigantic_frozen_folio(int order, gfp_t gfp_mask,
>> 		int nid, nodemask_t *nodemask)
>> {
>> -	struct folio *folio;
>> -
>> -	folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, nodemask);
>> -	if (folio)
>> -		return folio;
>> -
>> -	if (hugetlb_cma_exclusive_alloc(order))
>> -		return NULL;
>> -
>> -	folio = (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
>> -							  nid, nodemask);
>> -	return folio;
>> +	return (struct folio *)alloc_contig_frozen_pages(1 << order, gfp_mask,
>> +							 nid, nodemask);
>> }
>> #else /* !CONFIG_ARCH_HAS_GIGANTIC_PAGE || !CONFIG_CONTIG_ALLOC */
>> static struct folio *alloc_gigantic_frozen_folio(int order, gfp_t gfp_mask, int nid,
>> @@ -1849,11 +1839,18 @@ static struct folio *only_alloc_fresh_hugetlb_folio(struct hstate *h,
>> 	if (nid == NUMA_NO_NODE)
>> 		nid = numa_mem_id();
>>
>> -	if (order_is_gigantic(order))
>> -		folio = alloc_gigantic_frozen_folio(order, gfp_mask, nid, nmask);
>> -	else
>> -		folio = alloc_buddy_frozen_folio(order, gfp_mask, nid, nmask,
>> -						 node_alloc_noretry);
>> +	folio = hugetlb_cma_alloc_frozen_folio(order, gfp_mask, nid, nmask);
>> +	if (!folio) {
> 
> Emm ... what about PF_MEMALLOC_PIN here?
> 
> If a FOLL_LONGTERM migration out of CMA needs a fresh hugetlb folio,
> this can allocate another CMA folio as the target.
> 
> With HVO disabled, the old folio is freed back to CMA and can be picked
> again again again.
> 
> I guess we'd keep migrating between CMA folios without ever completing
> the pin ... even if pinnable buddy memory is available, no?

Yes, you are right. A fresh migration target can come from CMA again,
causing repeated migration without completing the pin, even when
pinnable buddy memory is available.

The same missing PF_MEMALLOC_PIN check also affects 1 GiB CMA
allocations, so I had planned to fix it separately.

Thanks,
Qi

> 
> [...]
> 
> Cheers, Lance

