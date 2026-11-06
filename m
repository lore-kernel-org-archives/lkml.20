Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973396;
	b=jSNnZY90jPjdDFVZ7fOKH3sf8XOyG1gSlBuW9yKF9Dkm+kShse8lRan9qfnd1J/wWaEc
	 RMonqOF3fMR98PP3nYHufwR+Mcbhxvvnz+Ac7V+fyDYwhUfdcENfx/xwvMPu7Tp5MF7I5
	 lH6BjMsrAUomAgicbfmMyIc2BNtRokV/yWJDkjlHc8LDKPLV6z8OfjXH881CoTA6d/FYU
	 SDuhM+dLIPVfmU2iv6AB9TLiLc0FyBobttEeD1561NI5Xr+8gf9jD2hJ8HxGiqL5Dlsl7
	 HmyfZPggKevu77y0B9GhrrrnJL6iFjTpTIN2kuAhor+fDD3H/i2BcHBmYcKelmQxe0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973396;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UkYVC6JgbebV6njVGe6gs4FA7AO+9hyOeWdBXzF6uKs=;
	b=MI4D25XZPMC+2huxBZxKK6om9tJGW1+Hgh9uO2vkNARJF4+5dDdBdSQBBRnz/AMA/2gZ
	 a68xBUhR2rubMxnLsrSAoXBm8aWxcJR0OZGEj3wC0R6WSRIWOFQJmFJQ+CiC4QgGpcHD+
	 I2+9c4Ju+tNUSxLqSOc2gQwMzDNuOk+7+2/BWkZFeou+vPqrkOvxcAPav9nQOe2Af2sNJ
	 q4rL+8RyjzbHs2YlcGd+y/NKfQziY9RtDX8S9gKEI8pY5tmCuk0JmUum6aqQD67IEbOi6
	 nYHeBrA0pm4d+n7lrpoGpfq6qFeRSXUPbgkXDYZj6Ne5u3SxedYI9P+m8bPfyVayBxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	arc=none smtp.remote-ip=115.124.30.100
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCDF606D838
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FCDF606D838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793973389; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=UkYVC6JgbebV6njVGe6gs4FA7AO+9hyOeWdBXzF6uKs=;
	b=IPtihB/+7D/A0jjbWh0dAbMcI/6f/Ke+XXoUfcRRMI/PNDqDdjkw3wBrriYXRdM5I60SR8ydsZCQJ+oSoE6QPA/EDEjc8XzHatpZLSOXXd6ZFHYXpFDqiEfimmhscWDnqf2hKA05YO5bFfnjlv3xQD9olilg5Lx+J8fiM/ELtQE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XEBpgb8_1793973386;
Received: from 30.251.68.229(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEBpgb8_1793973386 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 21:56:27 +0800
Message-ID: <3c0185d0-ed2c-458e-bbcc-cd35070ec743@linux.alibaba.com>
Date: Fri, 6 Nov 2026 21:56:26 +0800
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
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio
 sizes
To: Barry Song <baohua@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, riel@surriel.com, liam@infradead.org,
 vbabka@kernel.org, harry@kernel.org, jannh@google.com, qi.zheng@linux.dev,
 pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <20261105045406.39871-1-lance.yang@linux.dev>
 <0ddaf336-7cb7-4e83-af2c-f60d23f7aafd@linux.dev>
 <f7bd740e-1328-473e-96f5-89658a08d514@linux.alibaba.com>
 <CAGsJ_4zHtv7hBCaW=wdfiM7yA4OJS7pcFomSo22bEzWHizYAXQ@mail.gmail.com>
 <453e2c18-4e79-4db2-b565-1af881925f08@linux.alibaba.com>
 <CAGsJ_4zLiwYf6LM_BWoZyiYWxvW2H_siZ0QC7FmEHazF_fLa6g@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4zLiwYf6LM_BWoZyiYWxvW2H_siZ0QC7FmEHazF_fLa6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/6/26 5:56 PM, Barry Song wrote:
> On Fri, Nov 6, 2026 at 4:55 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
> [...]
>>>>> Ouch ... one thing I missed ... what about order-0 reclaim?
>>>>>
>>>>> shrink_folio_list() only sets TTU_SYNC for large folio, so can't we still
>>>>> hit the same race there?
>>>>
>>>> Thanks Lance. But this matches the purpose of the TTU_SYNC flag, which
>>>> is used to avoid racy checks with PVMW_SYNC. If no TTU_SYNC flag is set,
>>>> it means the caller can tolerate some racy checks.
>>>>
>>>> For this case, I think we should set TTU_SYNC unconditionally in
>>>> shrink_folio_list(). Barry, what do you think?
>>>
>>> Baolin, thanks for reaching out to me. I added that flag
>>> mainly for large folios.
>>>
>>> I observed cases where PTEs for large folios are partially
>>> cleared during certain transition states, for example, when
>>> PTEs are cleared before being modified:
>>>
>>> pte = ptep_get_and_clear();
>>> pte modification;
>>> set_pte_at();
>>>
>>> In such cases, page_vma_mapped_walk() skips the empty
>>> entries and starts from the next valid one.
>>>
>>> This may result in partially unmapping PTEs for large folios
>>> and trigger unexpected folio splits. At the time, I was
>>> particularly concerned about unnecessary folio splitting,
>>> so my focus was mainly on large folios.
>>
>> Thanks for the information.
>>
>>> However, I also noticed that a similar race can occur with
>>> small folios. In that case, the folio may simply remain
>>> unreclaimed by the reclamation path.
>>>
>>> However, my main concern at the time was avoiding
>>> unnecessary folio splits.
>>>
>>> Your new race also seems to amplify the same situation.
>>> However, I don't think this problem necessarily depends on
>>> the commit you mentioned. It has been around for a long time.
>>
>> Agree.
>>
>>> If the concern is reclaim failure, I agree that there is no
>>> fundamental difference between large folios and small folios.
>>
>> OK. And I did a quick measurement to reclaim anon and file folios via
>> the memory.reclaim interface.
>>
>>   From test results, reclaiming 1G small anonymous folios (using zram as
>> swap) shows no significant performance change. However, reclaiming 1G
>> mapped clean small file folios does show an observable regression if the
>> TTU_SYNC flag is set.
>>
>> Without TTU_SYNC for small folios:
>> time echo 1G > /sys/fs/cgroup/test/memory.reclaim
>> real    0m0.178s
>> user    0m0.000s
>> sys     0m0.178s
>>
>> With TTU_SYNC for small folios:
>> real    0m0.315s
>> user    0m0.000s
>> sys     0m0.314s
>>
>> So for the current patch, I'd prefer to keep things as is: only sync
>> when TTU_SYNC is set. Without setting the TTU_SYNC flag, keep the
>> original logic, meaning the caller can tolerate some racy checks.
>>
>> Any other thoughts?
> 
> I'm still struggling to understand where the regression comes
> from. You're doing echo 1G > /sys/fs/cgroup/test/memory.reclaim
> without the concurrent CPU 1 (MADV_DONTNEED) operation that
> causes the race.
> 
> so the regression actually comes from other places, maybe here?

Yes, I think so. But I haven't had time to dig into how this affects my 
tests yet. I'll dig into this later.
