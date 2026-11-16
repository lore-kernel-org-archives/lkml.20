Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870496;
	b=DBUby58En3sd1F2hc4JuN1eHEWIt/4aFMmhj6RdkN2mpBt4hGG+enoRfS0upFx/MmBo9
	 Fpcs7jO8k7NrEl0eHXvacUQ9NIAMle1R+sD6B5mp7DisJX3+4g+BeFpGjG0Ms/WDe2u61
	 cDJrZsDz/c/WUwYKqK02ITYDq7WdGZb4nUsGUWw9pXXt5QbtlMuUtHfu9saFCsEfL0Cew
	 eXL2i0UHr8EVLdhkdulrP5zh1vO3QPpf9GvhcY4doYSP36aTf7jFm030nh02htxDAsVve
	 RVIt7ZOggXqyMq7aMm9uIe1Wd6C5aVsJdzvwB0RtbG1upR7GSONRzGP5Zr2JhPvjSeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870496;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=u13ZLq2lptT+a4y0lVmdnjbg2+Ze+YefmwumVGwWm0I=;
	b=oEx6D9PJ93CVTKHh4vafAKIhf72e/R8EpDSeD/5kcsS9oZq4e8cda+hxPel28dJnSE/f
	 CtQiBycUwpovJ+L2qpT03XdDVnbXzGhz2Q/6RNito9CJenn+iboKz3YOAB5vL7sIsyjAc
	 MGHE3vlo1EPpx/yD3k4zub2OTHjBn+ETV+SmSJkM+N80RS6MPvlrjL0NVJy3DJDRfatOe
	 unv6FJ2Rt0Cp8xJoioSRlGApUktNiYQ3FiRsH3ko41V9keskNVck71dzDC3evgLnTtS6d
	 +fcYaF0U96QppTXqp2G4RQnWqbtwPlVqbW5Yg/vMUtA5hQ1uEWoolyebd+BOPklgF7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LDs9n2IN;
	arc=none smtp.remote-ip=91.218.175.134
Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2628606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2628606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LDs9n2IN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CmLrmuxMcS4XtFnlW0SxWYP82KCApdHfstv3wqouCWI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794870493; v=1; x=1795475293;
 b=LDs9n2INltpG8YRkrxfuhfo94j0MfaFoD0RKJVw5vXySmI+i++4TjKr4Y6IJaDaXDgdbkOkG
 Znz627LAaecPrHTgZobp45Ez2IIngWPeUJwfADOX+yaLsiCzD/BthKWTHSQUENJpYc/nRPZuau/
 kysWGR1gop2zTriWce+SGX7k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 52396e59a3a35763;
	Mon, 16 Nov 2026 23:08:13 +0000
X-Mizu-Trace-ID: 52396e59a3a35763
X-Migadu-Flow: FLOW_OUT
Message-ID: <22894af6-fd2f-4c26-b74b-d950f55a4e1b@linux.dev>
Date: Mon, 16 Nov 2026 16:08:08 -0700
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
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org,
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
Content-Language: en-US
From: Nico Pache <nico.pache@linux.dev>
In-Reply-To: <175e7fae-2254-4e13-a4ba-0d39fb82018a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/16/26 3:30 PM, David Hildenbrand (Arm) wrote:
> On 10/25/26 18:39, Nico Pache (Red Hat) wrote:
>> The zero-page remapping in __folio_split() was added to support the
>> underused THP shrinker. When the shrinker is disabled via
>> shrink_underused, gate TTU_USE_SHARED_ZEROPAGE on split_underused_thp
>> to avoid scanning subpages for zero content unnecessarily.
>>
>> Suggested-by: David Hildenbrand <david@kernel.org>
>> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
>> Signed-off-by: Nico Pache <nico.pache@linux.dev>
>> ---
>>   mm/huge_memory.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index bd44d58e8684..2d56d1bff0ea 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -4104,7 +4104,8 @@ static int __folio_freeze_split_anon(struct folio *folio,
>>   out_no_split:
>>   	local_irq_enable();
>>   	if (anon_vma) {
>> -		if (!ret && !folio_is_device_private(folio))
>> +		if (!ret && !folio_is_device_private(folio) &&
>> +		    split_underused_thp)
>>   			ttu_flags = TTU_USE_SHARED_ZEROPAGE;
>>   		remap_anon_folio(folio, 1 << old_order, ttu_flags);
>>   	}
>>
> 
> I guess the change is not that relevant in practice, because I suspect most
> people always run with split_underused_thp=true

Yeah these two patches are only tangentially related. Technically with 
this patch (1), disabling the underutilized shrinker would indeed fix 
it, as we no longer are doing zero-page remapping. But the root cause is 
the split initiated from KSM.

Most people always run with split_underused_thp=true, but they also run 
with 511 max_pte_nones.
> 
> Th question is whether "split_underused_thp" only determines "that we trigger a
> split if underused", or also "what to do when splitting a folio".
> 
> Yes, it was added for the deferred shrinker, but the semantics of the toggle are
> not quite clear. I don't think there is any documentation for it ...

Yeah Im not really sure if the intentions were to make all the splits do 
this zero-page remapping. And im not fully aware either of the potential 
impact to the system (whether positive or negative) this could have 
system wide. You could argue it keeps better system utilization, but you 
could also argue the cmp is expensive.

> 
> Disabling the "split to zeropage" entirely with the toggle off (behavior before
> the toggle was introduced) makes sense to me.
> 
> But the behavior now already like that in the kernel for a while.
> 
> 
> I know that I suggested this, but I wonder, is this patch relevant for your use
> case and patch #2?

Technically patch #2 solves the issue im actually trying to tackle. But 
during this case we also found this functional change which we werent 
sure if it was intended or not. As you say its poorly defined.

Im ok with or without this patch. Perhaps we can take patch #2 (bar'ing 
review), and I can try to do some perf testing regarding the effect of 
this zeropage remapping system wide, and base our judgement off that.

> 
> IOW, woudl RHEL customers disable this toggle here when running with KSM on
> affected systems?

That would be a potential solution if we only took patch #1. patch #2 is 
also viable (and a better) solution to solve the KSM regression while 
keep the shrinker available.

-- Nico


> 

