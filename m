Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291834;
	b=veIagKAlsYSHWLz8dwp7QwtKlSPVElSFvOQ9QsurOhO5ZVfJXsxE5F+D5y2GKvAEkrVI
	 AMsacjdTUD5ge5keBiBrzyLLAmQO4t0PBCKzZ/Cg/+LGlspLjQlW8q1K9VpZh0D+aZWOg
	 bEivxWjvy1GWKoCkXwecFZ7Cwg1VI1WVMwRMS0FF7tZvWvKjKiBzC8P6B/5b9STaZI4NI
	 SjBQ2pUxv4Y7q5aEYdnSlNARrxjTysDppjl0+E1WuwAdNpSaifESxytNK+K5buyYiCK66
	 TsIlFjHcCiahANT0euKcOKwAUs1W9H/1i2ui7pRDPmtMmP+y6RVtVw7SWfEYS15yX/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291834;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=nKkhdqVD8ZDaQWaWgeabMl+KwyqTWSczMhRw1w7SJCA=;
	b=ieEMZDqKUYJhu3GGuw1ZG4xMB2d5QvYZEaZ0bmxVPxbxNAHvG8pYVLTsp+OIdGOhz39A
	 z6wH56XNPeChwTtLMDxgQ0FfZqmuzH2vo72OTq3sJoLBYcLPy+Kujhty8/OxDafFSsCND
	 wi0a/6DNEatDZKw9AfAWTZJvoNP7L3rmncpPnarvsh56cdECRaVzKs4DMWgD7/o9gkHoB
	 S1DkBKO1Tp7U+coqPO1ahtnJe+ZXKrCCMBnhD6GXSkwE7ORGShNUULFh8wc7UNJdIdCPa
	 1tdz5F/d86uJpHDSWNEEKqZ4om4jtDgFUUpTHK9RFEiPn7l4HWd5nkonuuKyHeYYGTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xg0PKsnV;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F3A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F3A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xg0PKsnV
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794291830; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=nKkhdqVD8ZDaQWaWgeabMl+KwyqTWSczMhRw1w7SJCA=;
	b=xg0PKsnVcJcD3wl4CzjByolvzEriqCM1R2IdK0SdLTWkoOsstvihjXX4DQl73vG5lf8vcl99nocsIPYbIdMSVKZReTIhDcQEChutSpQ7UssPdFFts8EgsgHHVvDKrRKCxgBdpL3kzH6U0gSTYtOTaTIVUWWOdsiALpIezlDoP/M=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XEUDJQw_1794291827;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEUDJQw_1794291827 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 14:23:48 +0800
Message-ID: <86856d64-593e-4d10-ad40-c0c4f056332f@linux.alibaba.com>
Date: Tue, 10 Nov 2026 14:23:46 +0800
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
From: Baolin Wang <baolin.wang@linux.alibaba.com>
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
 <3c0185d0-ed2c-458e-bbcc-cd35070ec743@linux.alibaba.com>
In-Reply-To: <3c0185d0-ed2c-458e-bbcc-cd35070ec743@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Barry,

On 11/6/26 9:56 PM, Baolin Wang wrote:
> 
> 
> On 11/6/26 5:56 PM, Barry Song wrote:
>> On Fri, Nov 6, 2026 at 4:55 PM Baolin Wang
>> <baolin.wang@linux.alibaba.com> wrote:
>> [...]
>>>>>> Ouch ... one thing I missed ... what about order-0 reclaim?
>>>>>>
>>>>>> shrink_folio_list() only sets TTU_SYNC for large folio, so can't 
>>>>>> we still
>>>>>> hit the same race there?
>>>>>
>>>>> Thanks Lance. But this matches the purpose of the TTU_SYNC flag, which
>>>>> is used to avoid racy checks with PVMW_SYNC. If no TTU_SYNC flag is 
>>>>> set,
>>>>> it means the caller can tolerate some racy checks.
>>>>>
>>>>> For this case, I think we should set TTU_SYNC unconditionally in
>>>>> shrink_folio_list(). Barry, what do you think?
>>>>
>>>> Baolin, thanks for reaching out to me. I added that flag
>>>> mainly for large folios.
>>>>
>>>> I observed cases where PTEs for large folios are partially
>>>> cleared during certain transition states, for example, when
>>>> PTEs are cleared before being modified:
>>>>
>>>> pte = ptep_get_and_clear();
>>>> pte modification;
>>>> set_pte_at();
>>>>
>>>> In such cases, page_vma_mapped_walk() skips the empty
>>>> entries and starts from the next valid one.
>>>>
>>>> This may result in partially unmapping PTEs for large folios
>>>> and trigger unexpected folio splits. At the time, I was
>>>> particularly concerned about unnecessary folio splitting,
>>>> so my focus was mainly on large folios.
>>>
>>> Thanks for the information.
>>>
>>>> However, I also noticed that a similar race can occur with
>>>> small folios. In that case, the folio may simply remain
>>>> unreclaimed by the reclamation path.
>>>>
>>>> However, my main concern at the time was avoiding
>>>> unnecessary folio splits.
>>>>
>>>> Your new race also seems to amplify the same situation.
>>>> However, I don't think this problem necessarily depends on
>>>> the commit you mentioned. It has been around for a long time.
>>>
>>> Agree.
>>>
>>>> If the concern is reclaim failure, I agree that there is no
>>>> fundamental difference between large folios and small folios.
>>>
>>> OK. And I did a quick measurement to reclaim anon and file folios via
>>> the memory.reclaim interface.
>>>
>>>   From test results, reclaiming 1G small anonymous folios (using zram as
>>> swap) shows no significant performance change. However, reclaiming 1G
>>> mapped clean small file folios does show an observable regression if the
>>> TTU_SYNC flag is set.
>>>
>>> Without TTU_SYNC for small folios:
>>> time echo 1G > /sys/fs/cgroup/test/memory.reclaim
>>> real    0m0.178s
>>> user    0m0.000s
>>> sys     0m0.178s
>>>
>>> With TTU_SYNC for small folios:
>>> real    0m0.315s
>>> user    0m0.000s
>>> sys     0m0.314s
>>>
>>> So for the current patch, I'd prefer to keep things as is: only sync
>>> when TTU_SYNC is set. Without setting the TTU_SYNC flag, keep the
>>> original logic, meaning the caller can tolerate some racy checks.
>>>
>>> Any other thoughts?
>>
>> I'm still struggling to understand where the regression comes
>> from. You're doing echo 1G > /sys/fs/cgroup/test/memory.reclaim
>> without the concurrent CPU 1 (MADV_DONTNEED) operation that
>> causes the race.
>>
>> so the regression actually comes from other places, maybe here?
> 
> Yes, I think so. But I haven't had time to dig into how this affects my 
> tests yet. I'll dig into this later.

Sorry for the rough quick measurement last Friday :(.

I found the first memory.reclaim() trigger has high variance because 
folio_check_references() activates folios. After the folios' reference 
flag are consumed, memory.reclaim() shows no regression with or without 
the TTU_SYNC flag, and the data is relatively stable.

However, my testing is simple and doesn't cover concurrent stress 
scenarios. Whether to set the TTU_SYNC flag for small folios can be 
discussed in a separate patch, along with how to evaluate the impact.
