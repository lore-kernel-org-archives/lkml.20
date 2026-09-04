Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F203A35DA64
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490050; cv=none; b=RY1q3Lyqw5G34oSMVzVMUdRipjf2IlrOhZeZ6Kb7DagoRetpTo6xQ6fvUFeUfpEPsrjHkj7YOLpMiou+ENyYJcz1iQic3fsTdRbrInTDdrjKqPTVpOXZc22+iraJhDUSoRYY+V1SuZ9+zxvogkPBRpyuB3+Y0j+hOApKKwRFQ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490050; c=relaxed/simple;
	bh=FDfYUjIpyk0SCZ/6jfWXbfBJ9tBn61s9Ync+j2s3cBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XntTBV6SqLLt8dLg5ja3zJCJSQ0KPs7bG+YvFKra4mqwIyjIud8t8ln/qnJOlXZp6+9UJ8X3GJEGHo4Rz2uA/uvn3CcNcP4XSiTT4Gj0CfgGEmOajpiFKYFmq24bPUcHCXDTDmelhujzXqq6AFW5uHq4lXYccxhGPTc9C211SbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=mrz80cGB; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="mrz80cGB"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788490039; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=D0mchN2Yz1nzmvNj/LwOzWIwDRSSMt3lvAixYcXrXcA=;
	b=mrz80cGBVghfTEHVi4Pz9DY3iw+aeZ1/87zHIa8guVf9QWoJcdieCOsvHUi4Kin76EU3p7t1tiJIgV2K6w1bbRq6W5JKR9ki62JomHMHlYHhghqdhj2x44fqc/2EgJk/rKBwEdI3cDOXzO2vUYrEbZG5/hjiVSUCj9HK3eJH5v8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XAHLQyT_1788490036;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAHLQyT_1788490036 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 10:47:17 +0800
Message-ID: <129ecc53-f96e-4a5d-a79c-c05293d815d3@linux.alibaba.com>
Date: Fri, 4 Sep 2026 10:47:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] mm/mglru: move folios from oldest gen to
 second-oldest gen from head to tail
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com,
 baoquan.he@linux.dev, chenridong@xiaomi.com, david@kernel.org,
 hannes@cmpxchg.org, kasong@tencent.com, lianux.mm@gmail.com,
 linux-kernel@vger.kernel.org, ljs@kernel.org, lyugaofei@xiaomi.com,
 mhocko@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev,
 stevensd@chromium.org, wangzicheng@honor.com, weixugc@google.com,
 yuanchu@google.com, zhangbo56@xiaomi.com,
 Xueyuan Chen <xueyuan.chen21@gmail.com>
References: <20260901232421.40157-1-baohua@kernel.org>
 <20260901232421.40157-7-baohua@kernel.org>
 <c1992315-8e2a-45eb-a042-29f1f1725f76@linux.alibaba.com>
 <CAGsJ_4ybQbbxxyz5EU29cckoQQpm4PrQi3W2Bu3Mb22UCjFBrQ@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4ybQbbxxyz5EU29cckoQQpm4PrQi3W2Bu3Mb22UCjFBrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/4/26 10:28 AM, Barry Song wrote:
> On Fri, Sep 4, 2026 at 9:53 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>>
>>
>> On 9/2/26 7:24 AM, Barry Song (Xiaomi) wrote:
>>> For reclamation, it makes sense to reclaim folios from tail to
>>> head, as folios near the head are relatively hot. However, when
>>> moving folios from the oldest generation to the second-oldest
>>> generation, using the tail-to-head order would effectively cause
>>> a cold/hot inversion.
>>>
>>> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
>>> Reviewed-by: Baoquan He <baoquan.he@linux.dev>
>>> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
>>> Reviewed-by: Lian Wang <lianux.mm@gmail.com>
>>> ---
>>>    mm/vmscan.c | 23 +++++++++++++++++++++--
>>>    1 file changed, 21 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>>> index 1907a946840d..76dfa9575852 100644
>>> --- a/mm/vmscan.c
>>> +++ b/mm/vmscan.c
>>> @@ -192,11 +192,27 @@ static inline void prefetchw_prev_lru_folio(struct folio *folio,
>>>                prefetchw(&prev->flags);
>>>        }
>>>    }
>>> +
>>> +static inline void prefetchw_next_lru_folio(struct folio *folio,
>>> +             struct list_head *base)
>>> +{
>>> +     if (folio->lru.next != base) {
>>> +             struct folio *next;
>>> +
>>> +             next = list_entry(folio->lru.next, struct folio, lru);
>>> +             prefetchw(&next->flags);
>>> +     }
>>> +}
>>
>> You did not mention in the commit message why this prefetch was added.
>> Just curious, does it really help performance?
> 
> Hi Baolin,
> 
> Thanks for your review.
> 
> I had this discussion with Kairui and thought it might be
> useful to keep it here:
> 
> https://lore.kernel.org/linux-mm/CAMgjq7AJnWGGH=FNuV7ynXjbffktsDRgdcyagLUJUwJf1ukaJQ@mail.gmail.com/
> 
> It might be arch-dependent. Some architectures could benefit
> significantly from prefetching, while others might see little to
> no impact.
> 
> for my x86 test, it has very slight improvement:
> 
> ***** no-prefetch:
> 
> agetest:
> ...
> gen 100:    2.421 ms
> gen 101:    2.424 ms
> gen 102:    2.420 ms
> gen 103:    2.413 ms
> 
> Total:   248.418 ms
> Average: 2.460 ms
> 
> agetest:
> ...
> gen 100:    2.393 ms
> gen 101:    2.396 ms
> gen 102:    2.395 ms
> gen 103:    2.392 ms
> 
> Total:   245.627 ms
> Average: 2.432 ms
> 
> agetest:
> ...
> gen 100:    2.433 ms
> gen 101:    2.427 ms
> gen 102:    2.432 ms
> gen 103:    2.450 ms
> 
> Total:   249.186 ms
> Average: 2.467 ms
> 
> **** has-prefetch:
> 
> agetest:
> ....
> gen 100:    2.314 ms
> gen 101:    2.310 ms
> gen 102:    2.321 ms
> gen 103:    2.303 ms
> 
> Total:   237.619 ms
> Average: 2.353 ms
> 
> agetest:
> gen 100:    2.342 ms
> gen 101:    2.343 ms
> gen 102:    2.339 ms
> gen 103:    2.335 ms
> 
> Total:   239.929 ms
> Average: 2.376 ms
> 
> agetest:
> 
> gen 100:    2.344 ms
> gen 101:    2.347 ms
> gen 102:    2.352 ms
> gen 103:    2.348 ms
> 
> Total:   241.188 ms
> Average: 2.388 ms
> 
> Basically, it’s 2.3xx vs. 2.4xx, lower is better.

Could you add this info to the commit message? (IIUC, someone tried to 
remove the prefetch in MM, since they found that prefetch doesn't seem 
to help much on modern CPUs.)
