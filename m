Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372AA3233ED
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788832110; cv=none; b=Ayi8R4X3ug08AK3PGq1X9EjXB1IjykiEgXUBsLwHYd/nhlrNokA+zORcv2dL/WDaPgoC4DDdsqbnKhJkUqHum3zyNWzRbJP/h2In5OCmUyoR7GRP9uWeqa5hBZcTEp//+pPMAmxnfjQxshuFgK2ISjMRxN0Ezrtp44pfjRiv3kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788832110; c=relaxed/simple;
	bh=uEykklFAum5ntaSEnruUMk+QvwlxsYokwFihjY81GAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jyUFP7zIEf7qaKbDvbtrFGKIYYACQRP6joVt/BlC4RiCTfRHovI3Xfyt8A7lDMqmQIbJsQ5vsxAS7/eZnmasqlGDu/Vc6MOfYhDxHZcyf4BUV0SGyHOvLS5JlGftLt6FFno9HyYd7k3jGPpEZLgKiIYxGAlRYsJ45b4xKVybLpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RFeKGN8q; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RFeKGN8q"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788832100; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=sj+gujuvTHFxhZN0Qt7S2VOpoMJsQgUY9QhEhfjAcs0=;
	b=RFeKGN8qjoMCBRlXoEf/Dr6/9GcBgoxJQgpzCcg6BGrnc7F120de9CS5nXny3LttvT4Sl32pak6JjOHyyXxvBYNcPiUpWeqHbKYWHlbfBUCSck+tbDcI4pR+LfQtwWbqYUwwmIRHntj4u7/TV83Gmy6Y6OvItRJL/W2KBCHli44=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R411e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XAZmSo9_1788832097;
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAZmSo9_1788832097 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Sep 2026 09:48:18 +0800
Message-ID: <04df803b-b168-41b7-b394-1071e002e3bc@linux.alibaba.com>
Date: Tue, 8 Sep 2026 09:48:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] mm/collapse: state what a collapse may do in the
 policy
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Zi Yan <ziy@nvidia.com>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>
References: <cover.1788533997.git.kas@kernel.org>
 <b01681c3cc945a7f7c3c7ca1de502f7cc0e93fe8.1788533997.git.kas@kernel.org>
 <c070e67a-4c1e-478f-aa28-09fb88f8a786@linux.alibaba.com>
 <ap6XERs2j7e1lZCU@thinkstation>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ap6XERs2j7e1lZCU@thinkstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/7/26 6:56 PM, Kiryl Shutsemau wrote:
> On Mon, Sep 07, 2026 at 05:05:19PM +0800, Baolin Wang wrote:
>>> +/* What a collapse is allowed to do, decided by the caller that asks for it */
>>> +struct collapse_policy {
>>> +	/* Limits, stated per PMD; HPAGE_PMD_NR means "no limit" */
>>> +	unsigned int max_ptes_none;
>>> +	unsigned int max_ptes_swap;
>>> +	unsigned int max_ptes_shared;
>>> +
>>> +	/*
>>> +	 * Hold a sub-PMD window to a stricter rule than a PMD: no swapped-out
>>> +	 * and no shared PTEs at all, and max_ptes_none as
>>> +	 * collapse_max_ptes_none() scales it.
>>> +	 */
>>> +	bool strict_sub_pmd;
>>
>> This is a bit confusing to me. Actually, the check for mTHP collapse is
>> stricter.
>>
>> How about naming it 'allow_mthp_collapse'? That way we can keep the most
>> original comments for the collapse_max_ptes_xxx() functions, which is
>> clearer to me.
>>
>> If others have a better name, please ignore my comment.
> 
> I would rather keep strict_sub_pmd.
> 
> Which orders a caller asks for is already decided elsewhere:
> collapse_possible_orders() hands khugepaged every anonymous order and
> MADV_COLLAPSE the PMD order only, from tva_type.
> 
> A flag called allow_mthp_collapse next to that would read as
> a second place deciding the same thing, and flipping it would not change
> which orders get collapsed.  What it does change is how a sub-PMD window
> is judged once one is asked for, and it is read at exactly the three
> places that judge one.
> 
> I will do:
> 
>        /* Take no swapped-out or shared PTE into a sub-PMD collapse */
>        bool strict_sub_pmd;

OK. Fair enough. Thanks.
