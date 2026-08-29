Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C313093D8
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787987821; cv=none; b=urOODEUJ+HZilbmto+F8LVAKwYg/xCGuEIKu0L8RveQFky7O1n+9JpR5rNSy86q9Pro18A58vX1dkNETc4eXvcebhkCDd8MzlRfxvFu3AkLxIglfckhvReqSca6OxENZSZvwQPkohpvpXw0hD/ZkD3hgWHPAVwDWftdIvN2GENI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787987821; c=relaxed/simple;
	bh=bnW1uRPPym7D4jFDJHKaKR3hWA0klTNeikygi8E9nsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kj7GPCUwb8/oHhHc3veKN30GVon0haWHAch1Fv4K9t0LUmOAH2ERHgpcWCQk6pTyQ+RiU4tlnysrsHSQ33q6pTdqs+uc8zaOj4IAYMEvaOr2BQPQSSDS86jjaTVzJ7OZFpmjmgx/KluJUJWDyGRRO4BHGHh21HqOH7xiVSFHipQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=B/1Ex00v; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="B/1Ex00v"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xNys40qzCinjjkeQyfa5/uHXe62MEi0scb5rOsIlERM=;
	b=B/1Ex00vL4B1NGhygBdjgt8P6GU9hjy/4FB9a2qGim9uYzJ0pyfJtu43TFUGqY5BYSMvKYImN
	BPSdVPKIgwz39emn7ft14BIO5fzULtpQDvdbIpawvP65j4M80CTtjAWbDuUjQpzJFBBZD8BsFU1
	Ja2sEl4QSGFFrQNNHH4YvSo=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hX5rY0VMyzmVZQ;
	Sat, 29 Aug 2026 15:06:05 +0800 (CST)
Received: from kwepemo200010.china.huawei.com (unknown [7.202.195.178])
	by mail.maildlp.com (Postfix) with ESMTPS id A77E74048B;
	Sat, 29 Aug 2026 15:16:52 +0800 (CST)
Received: from [10.174.178.56] (10.174.178.56) by
 kwepemo200010.china.huawei.com (7.202.195.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 29 Aug 2026 15:16:51 +0800
Message-ID: <c7b0dc34-ae1e-4a3d-a286-fdae0e1d978b@huawei.com>
Date: Sat, 29 Aug 2026 15:16:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mm/page_isolation: guard compound_order() against
 racing
To: Andrew Morton <akpm@linux-foundation.org>
CC: Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan
	<surenb@google.com>, Michal Hocko <mhocko@suse.com>, Brendan Jackman
	<brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan
	<ziy@nvidia.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<sunnanyong@huawei.com>, <wangkefeng.wang@huawei.com>
References: <20260825120549.966271-1-xiqi2@huawei.com>
 <20260825120549.966271-3-xiqi2@huawei.com>
 <20260827204732.367c52ad420acb0b87bf29ed@linux-foundation.org>
Content-Language: en-GB
From: Qi Xi <xiqi2@huawei.com>
In-Reply-To: <20260827204732.367c52ad420acb0b87bf29ed@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemo200010.china.huawei.com (7.202.195.178)

Thanks for raising this. I checked the path: PageHuge(head) resolves to
folio_test_hugetlb(), which reads page_type via data_race(). I don't think
it's the same issue this series targets:

- It never touches page->flags or PF_SECOND — folio_test_hugetlb() reads
page_type on the head page via FOLIO_TYPE_OPS, a separate "page type" mechanism,
so neither folio_flags() nor its VM_BUG_ON_PGFLAGS assertions are on its path.
- The only shift is a fixed >> 24 on a u32, not a variable 1 << order,
so it can't produce the shift-out-of-bounds UBSAN this series fixes.

So no extra stabilization seems needed for PageHuge() itself.
Happy to add it if you see a case I missed.

Qi

On 28/08/2026 11:47, Andrew Morton wrote:
> On Tue, 25 Aug 2026 20:05:49 +0800 Qi Xi <xiqi2@huawei.com> wrote:
>
>> The PageCompound branch reads compound_head() without holding a reference.
>> A racing split or free can cause compound_head() to return a stale pointer,
>> and compound_nr() reads the order from that stale head, leading to
>> out-of-range shifts and making the skip distance meaningless.
>>
>> Read the order explicitly with compound_order() and validate it is within
>> MAX_FOLIO_ORDER before shifting. Also verify the derived head_pfn against
>> the legitimate pfn: the head must not be past pfn, must be aligned to
>> nr_pages, and pfn must fall within the compound page. Bail out with
>> -EBUSY if any check fails.
>>
>> ...
>>
>> --- a/mm/page_isolation.c
>> +++ b/mm/page_isolation.c
>> @@ -418,10 +418,28 @@ static int isolate_single_pageblock(unsigned long boundary_pfn,
>>   		if (PageCompound(page)) {
>>   			struct page *head = compound_head(page);
>>   			unsigned long head_pfn = page_to_pfn(head);
>> -			unsigned long nr_pages = compound_nr(head);
>> +			unsigned int order = compound_order(head);
>> +			unsigned long nr_pages;
>> +
>> +			/* compound_order() is racy. Cap it at MAX_FOLIO_ORDER. */
>> +			if (order > MAX_FOLIO_ORDER)
>> +				goto failed;
>> +
>> +			nr_pages = 1UL << order;
>> +
>> +			/*
>> +			 * compound_head() is also racy, so the derived head_pfn
>> +			 * needs additional checks to make sure it is valid.
>> +			 * Otherwise, just fail the check. pfn comes from
>> +			 * __first_valid_page() as a legitimate PFN, so use it to
>> +			 * check head_pfn.
>> +			 */
>> +			if (head_pfn > pfn || !IS_ALIGNED(head_pfn, nr_pages) ||
>> +			    pfn - head_pfn >= nr_pages)
>> +				goto failed;
>>   
>>   			if (head_pfn + nr_pages <= boundary_pfn ||
>> -			    PageHuge(page)) {
>> +			    PageHuge(head)) {
> Sashiko suggests that this PageHuge() test suffers the same issue?
>
> 	https://sashiko.dev/#/patchset/20260825120549.966271-1-xiqi2@huawei.com
>
>>   				pfn = head_pfn + nr_pages;
>>   				continue;
>>   			}
>> -- 
>> 2.33.0
>>
