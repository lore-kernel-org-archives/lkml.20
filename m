Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282506;
	b=VougnzTbtSZo1ybkuSs84AyC9xPSeLI1/EySHsksZPi34jotKupxzIDRfFRqDOhKGaDl
	 Qx7tscFrreiceo/T5iCfdDcUfBbU6bgIUzOFsLHbhX7mnWlsd15DTDAQw/1crW8Zu07xU
	 YXc4iW+AI2srxPhOc+QgcSDIHTzf0NjaX26Mc1DRVojJuq6pn8gvmJkWo7CjhG2eybkgH
	 OZn23CvNEmpiAwdrxs2oA880XjvXCL2RUIkO4EQVgomK1yOJTPMjWzAsw/Xgpsh4uzXAf
	 /rB4liibhRC4TGNyt7kozHSreSPX0PHS91MPg+O4EiLGFNK0QdwAtJukW7jlonMTiWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282506;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=O1F5tVop/gxIp5o1dtKUD1SVWMDjQ1cisNQp/bAJJCQ=;
	b=wpLNDHKNnFEt1xTGnWc5ggL0I56FRjHFOYXux03dRdXc7xKt26JDbbl+Pp22G+QYwoy+
	 8GtNwRAC9UTGu3IRGGwkBtIM0AR5/jJmXNiY3VYoXEJRO0V4FXXXHLF5e4oAMHwJd9FEv
	 5LFIqGC+USnsFiyJQkwvRsRuBUt5XEiI6KHENjZqAKX50kn1LmgxpdMNb+QPMmBKxCzku
	 58UE5Bkc2khsmuon0hh/stJH130FpO5I8dL3BMYKtX3L5bE0NNpHF/McWi4cDKrp5H68f
	 BWW67JLNM8PrBLoP5oeQOp0yqwEkTU9hgwF6yxOgYUuJIggiCDwxej2yAByeJ5/ZvQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NzkWguWS;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807FF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807FF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NzkWguWS
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794282502; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=O1F5tVop/gxIp5o1dtKUD1SVWMDjQ1cisNQp/bAJJCQ=;
	b=NzkWguWSTk4S4A/er8HG3S47N4YiJOsc4FhtOGehbZJ/FuhajBqWhVXXm48Ih1i5STdDqeeZKY45p5Y6364AfLigRFXAiEq+in+jqyJ+bIhVqJRpVsBYJa/jzQWJY55SSulF7G43UQ/oj9GWt/VlVHs+1Pn/3Lziw5cRLshEMNg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0XETt0zg_1794282500;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XETt0zg_1794282500 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 11:48:20 +0800
Message-ID: <3819fbff-d605-44ad-8217-b7d07956fee8@linux.alibaba.com>
Date: Tue, 10 Nov 2026 11:48:19 +0800
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
To: Barry Song <21cnbao@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
 Pedro Falcato <pfalcato@suse.de>, akpm@linux-foundation.org, ljs@kernel.org,
 riel@surriel.com, liam@infradead.org, vbabka@kernel.org, harry@kernel.org,
 jannh@google.com, lance.yang@linux.dev, qi.zheng@linux.dev,
 ayushr@modal.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <auxqWxUfRVvxnk_n@pedro-suse.tail5790ac.ts.net>
 <44740e38-77ae-457e-97db-d6e0a0149dc2@linux.alibaba.com>
 <4a64ea17-6ac2-406e-a432-b82c481a4f84@kernel.org>
 <a069e3ca-6bbc-481e-acec-5ef21855b9ec@linux.alibaba.com>
 <CAGsJ_4wGQ68vEhCS=6CAAr9K4O3Q2fazjpP8QSK2Zs3r6R4Wfg@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAGsJ_4wGQ68vEhCS=6CAAr9K4O3Q2fazjpP8QSK2Zs3r6R4Wfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/9/26 12:27 PM, Barry Song wrote:
> On Mon, Nov 9, 2026 at 11:42 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>>
>>
>> On 11/8/26 3:58 AM, David Hildenbrand (Arm) wrote:
>>> On 11/6/26 03:12, Baolin Wang wrote:
>>>>
>>>>
>>>> On 11/5/26 7:37 PM, Pedro Falcato wrote:
>>>>> On Thu, Nov 05, 2026 at 10:56:28AM +0800, Baolin Wang wrote:
>>>>>> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
>>>>>> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
>>>>>> with concurrent page table reclamation via zap_empty_pte_table().
>>>>>>
>>>>>> page_vma_mapped_walk() is used by many functions including try_to_unmap(),
>>>>>> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_ptes(),
>>>>>> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_unmap()
>>>>>> and try_to_migrate(), the other callers do not perform post-walk accounting
>>>>>> checks, so the race has no observable impact on them.
>>>>>>
>>>>>> For migration, the race can cause unnecessary retries. For reclaim via
>>>>>> try_to_unmap(), the race can cause failure to reclaim a folio that is in
>>>>>> fact already unmapped (as shown below), which may lead to unexpected OOM
>>>>>> or increased refaults.
>>>>>
>>>>> This is very handwavy. Do you have numbers? Does this actually make sense?
>>>>
>>>> This is hard to measure in practice. But in theory, if we can't reclaim
>>>> cold large folios that are actually unmapped due to the racy checks, it
>>>> could cause cold/hot inversion (e.g., in MGLRU) and increase refaults.
>>>> In extreme cases, failing to reclaim unmapped large folios could even
>>>> cause OOM.
>>>
>>> Yeah, but the question is if it really matters in practice.
>>>
>>> I agree that page_mapped_in_vma() should sync properly, but the current impact
>>> might not be as severe.
>>
>> Yes, what I meant is the theoretical impact. In practice, this race is
>> not easy to trigger with no real reports so far, or the impact is tolerable.
>>
>> But I still think the fix is needed, as it matches the purpose of the
>> TTU_SYNC flag.
> 
> I assume the impact comes from LRU over-protecting folios
> that remain mapped after try_to_unmap().
>                          try_to_unmap(folio, flags);
>                          if (folio_mapped(folio)) {
>                                  stat->nr_unmap_fail += nr_pages;
>                                  if (!was_swapbacked &&
>                                      folio_test_swapbacked(folio))
>                                          stat->nr_lazyfree_fail += nr_pages;
>                                  goto activate_locked;
>                          }
> 
> folios are activated -  over protected in LRU.
> 
> The racy window should be quite small in theory, so the
> impact might not be that severe. There is no evidence
> that it could lead to OOM.
> 
> For large folios, the impact could be greater because
> we are over-protecting more memory, potentially
> increasing with the folio order. For small folios, we
> are only over-protecting a single 4KB page.

Agree.

> So perhaps the current TTU_SYNC flag for large folios
> is reasonable. Baolin's patch to respect the flag,
> which currently applies to large folios, also seems
> reasonable, as long as we don't extend it to small
> folios and introduce regressions, possibly in
> map_pte()?
> 
> I'm also wondering whether we should downgrade
> ACTIVATE to KEEP, which would allow racy folios to be
> reclaimed sooner.
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 071a6eaef1a1..726266e49533 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -1353,7 +1353,7 @@ static unsigned int shrink_folio_list(struct
> list_head *folio_list,
>                                  if (!was_swapbacked &&
>                                      folio_test_swapbacked(folio))
>                                          stat->nr_lazyfree_fail += nr_pages;
> -                               goto activate_locked;
> +                               goto keep_locked;
>                          }
>                  }

Sounds reasonable to me. It's also not easy to measure the impact. As 
mentioned earlier, this kind of racy check scenario probably doesn't 
have much impact anyway.
