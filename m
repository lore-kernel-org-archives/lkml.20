Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960944;
	b=NBYlCqq+RdGAe+AHH5SiCz2zlyTFoHgXS2X9N6NPbLbQFuu2MiEsEHj4mjvUKFdrw0JT
	 MmRSKwA9KBVBZDkEiAcNn8Zp/+foqWVPEN6MFfdzwyTJxey7grpA61V81Tsyw5WQh/KeQ
	 TbR2RWatOzJwRk9T5AwCnRkxcwUrhZP6lGUmGxEKv/51MhKlE5Qmv8CedXlQH9fqnZIcK
	 W8fEYdA4w2eHMWWhtDZye8qB4tIkAJ1Rxjwpeh0otd7p7J2X9L10bLb0UKs8IMTHaXoc5
	 Ej5D8yZJ5v2wS+xXYL2lYCke62DVqvbVqohjqkV8UdrB/OZgbcGiw25IEVNuRaMbptg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4mlR8+gtgMvy46avSZaRKYsDQLl9BuorhRkyL83qQCw=;
	b=zPjMmldCxmAYcVFXDejr3ox2swOa0MmIzgyMVrxwlmn9WJ0KpeYN0xSOwwZxr6ia8o2m
	 mh0ZHU/GeNId4YnE6RZuNtN4uynSTblnCkQdRu1AbYyrggQyhS4FLv3RDJPZKfvgNYYO+
	 Fl9DSIF+sjt8u1Ne0zIxpEReZTb7xGD7sPMz7I4XaXpCwMyKdz57Re8LfyrLC11CsRfxE
	 UMSSvUNu7CJVpRkdjL/kDud/+c+Uu6zN4NLQowbzP/9OeZ0d3lEQUhhN1LPXTnvW5YTiD
	 PvlYVI1FRxU8xVOTV4e0wplArl+SoQxma6pX023rpurP7xcHSx8PxRPJm+W7U7eH65Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AY4yfxp3;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5145606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5145606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AY4yfxp3
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so4752465e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793960942; x=1794565742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mlR8+gtgMvy46avSZaRKYsDQLl9BuorhRkyL83qQCw=;
        b=AY4yfxp3tSixutFSxuKzs+1uefrzw+9tzlCv9HR/qC0nyluT9sZeAWOA6n8fLskpph
         e/hs2XVYq6ZCJybUo/KwkeVlsj0/iCndvxvSN7TrAEfesKIzocpOePQr6dtHvV7dzvH2
         /LYekyZullvGCEiZc1tDEfLMF0HPC8u2b77SkOW82K3idTFYNNhlPcUVe+W1WBMdqJg2
         RCETHZ3l8CEfH4vDcvISveiKyVav4bL8dqfkjx66NuT+p8br1FL1wlaIHg7v7X5MTEPP
         br7hdIAMzEoJG48f/sXzqG3WoMrnU2DxRCJLE0bhOOXI9e587M44WV5GCXX2BuHWpObG
         w9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793960942; x=1794565742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mlR8+gtgMvy46avSZaRKYsDQLl9BuorhRkyL83qQCw=;
        b=N8AKMrMM6duCnYN8pLoOTEKdErEEktMkHUg1+EicUG7RZfJSo/puc5pXprhXaX7tl/
         I+VD1tiJHZeqzbwxUOpSu44mWRWFJpe7fUI2hB7oplEDhgmi/FeEeL766httPkw3zFlr
         mqtt2ONF5pAgzMcG/vayOYwlA/UNstG8QqxrpMdkOq6Wg5vHT98tvU8dvN7vimkBorzD
         w+cVs4E06Xf7Lhs3FaYpv4qWXn/2viyFU9FNn1wHuvvZlp5taCrP3AJF8YC+vMtIS6+H
         RxoyFln8RUQDO244bp6UA17VsqAvFnRNYkArsuuULT4AkEj0GODb+i1kiAkeefr8jO/6
         iohA==
X-Forwarded-Encrypted: i=1; AKwUvBwC5DPeG7R0itbic5vNSNj35wMFF/KEggrp6hXxAdimCB8ixEz882/IdO6wdr8w/qvyy32LtCL1tqQbgDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oNY7S7nM1cl0EoVsyZBcgGa0qKxnU0yV6NdIcQrGSF9Gl2X1o
	p3TEOPecgCQRjcB8yBxXLApmuWwI1rncUIfNonI0PhvvW/OENIGllE5u
X-Gm-Gg: AYBFou1zo4u1JEBPMoKn4LhlCISUgyc5LBbR4ChGJnmodm56x/x29j8/0PhLh6Hz/CH
	03RpF3UmQmN6py15Zk8s2k2Kg8dZnCvLh+WMBN83eVVj6U7aVGipiPfDpxJQySPRmU3E77Ok3wk
	DWdmtn7nu0aqhPM1nyRlt7LMuseVAmTR5GtVM59sBe4tU8q+SAXUS1/ahLr4Kl9zr6Ge/A3z8n/
	layO6Jn+RWLACaQbsjo4VA4pMWGNgLXmAZ+HI+Y3phy9Qdr3whk6BFccvl0zUIUclMnNQPvr38n
	RJoOAJh0OJg1fErN3ItxLTLcYvdWv4o8+8K6zQeTWOZ7u0ax41SLoU1pkS4iR347VjxSTF/zrk4
	8zjgH+EPvR/+t0tmttweabsuZi+OzPO4cz67YYamvHYe3dxH2tAxYeYyRWW2+mZmuuD94J7PyGB
	8tLQA62NXN5so+OYMgdLty4IiUZBOlCyhzJCvKo6vWLFpXlMWUpifaUgLvybWxj60BhWpE7jic7
	7yEHniRxYNeVyUHhJz1NbK4EmUQhnTPCE3lUtOiYZ8IKt/eFg/HpPngTtdN6m7hd3DdSVJMo5ab
	mG42PuL8YFKO1OEym7666Cc=
X-Received: by 2002:a05:600c:4694:b0:4a2:994:575c with SMTP id 5b1f17b1804b1-4b6e0454d69mr33998485e9.34.1793960941975;
        Fri, 06 Nov 2026 02:29:01 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7dbb0d4sm2925477f8f.50.2026.11.06.02.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:29:01 -0800 (PST)
Message-ID: <5c084ac1-930d-40c7-b6d0-b56673da9cf5@gmail.com>
Date: Fri, 6 Nov 2026 11:29:00 +0100
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
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <551892bd-d7ca-4c79-9c7b-9d3d08c913e4@gmail.com> <au2lAPUNPlRtaeFY@gremlin>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <au2lAPUNPlRtaeFY@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/26 11:03 AM, Lorenzo Stoakes (ARM) wrote:
> On Thu, Nov 05, 2026 at 10:53:13PM +0100, Jose A. Perez de Azpillaga wrote:
>> On 11/5/26 9:57 PM, Lorenzo Stoakes (ARM) wrote:
>>> khugepaged walks an mm's VMAs under the mmap read lock in
>>> collapse_scan_mm_slot(), checking for ineligible VMAs first, and skipping
>>> them if encountered.
>>>
>>> It charges cc->progress 1 page against the /sys/.../pages_to_scan budget
>>> when these are encountered, however only checking this budget once an
>>> eligible PMD-spanning VMA is encountered.
>>>
>>> It can therefore hold the mmap read lock for a long time if there are a
>>> large number of ineligible VMAs present in an mm, over which time no mmap
>>> write locks (and thus no VMA write locks) can be acquired.
>>>
>>> Address this by checking whether the mmap lock is contended after every
>>> KHUGEPAGED_MAX_VMA_SCAN_BATCH VMAs walked, that is a quarter of the
>>> pages_to_scan budget, and if so dropping and re-acquiring the mmap read
>>> lock before resuming the walk from the per-mm cursor.
>>>
>>> As the walk is resumed from the cursor rather than the VMA that was current
>>> when the lock was dropped, the cursor must never move backwards. A VMA
>>> ending at the top of the address space causes ALIGN() to wrap the cursor to
>>> zero, so treat such a VMA as the last in the mm rather than skipping past
>>> it.
>>>
>>> This was tested locally with ~1M ineligible VMAs mapped ahead of a
>>> collapsible region of memory, and resulted in a reduced mmap_lock hold time
>>> of 170us down from 95ms.
>>>
>>> This was also observed to reduce mmap_lock stalls in concurrent threads of
>>> a similar duration. Note that a reader re-acquiring the lock can currently
>>> steal it from a writer that is queued but not yet running, so the full
>>> benefit to writers depends on the separate rwsem change at [0].
>>>
>>> Local measurements indicated no change for ordinary use cases, so this is
>>> all upside.
>>>
>>> This work came out of investigations into mmap stalls when getting latency
>>> numbers for an unrelated patch series.
>>>
>>> [0]: https://lore.kernel.org/all/20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org/
>>>
>>> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>>> ---
>>>  mm/khugepaged.c | 31 +++++++++++++++++++++++++++++--
>>>  1 file changed, 29 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index 216c4b8d28c4..eaa01dae5a03 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -66,6 +66,12 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, MM_SLOTS_HASH_BITS);
>>>
>>>  static struct kmem_cache *mm_slot_cache __ro_after_init;
>>>
>>> +/*
>>> + * The number of VMAs to walk before checking for, and relieving, mmap lock
>>> + * contention, as a function of the pages_to_scan budget.
>>> + */
>>> +#define KHUGEPAGED_MAX_VMA_SCAN_BATCH(pages_to_scan) ((pages_to_scan) / 4)
>>> +
>>>  /**
>>>   * struct khugepaged_mm_slot - khugepaged information per mm that is being scanned
>>>   * @slot: hash lookup from mm to mm_slot
>>> @@ -2910,6 +2916,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
>>>  	struct mm_struct *mm;
>>>  	struct vm_area_struct *vma;
>>>  	unsigned int progress_prev = cc->progress;
>>> +	unsigned int nr_vmas_batch = 0;
>>>
>>>  	lockdep_assert_held(&khugepaged_mm_lock);
>>>  	*result = SCAN_FAIL;
>>> @@ -2942,15 +2949,35 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
>>>  	for_each_vma(vmi, vma) {
>>>  		unsigned long hstart, hend;
>>>
>>> +		/* Relieve mmap lock contention after walking a batch of VMAs. */
>>> +		if (nr_vmas_batch++ >= KHUGEPAGED_MAX_VMA_SCAN_BATCH(progress_max)) {
>>> +			nr_vmas_batch = 0;
>>> +			if (mmap_lock_is_contended(mm)) {
>>> +				mmap_read_unlock(mm);
>>> +				cond_resched();
>>> +				mmap_read_lock(mm);
>>> +				vma_iter_set(&vmi, mm_slot->address);
>>> +				continue;
>>> +			}
>>> +		}
>>> +
>>
>> with pages_to_scan below 4 the batch is 0, so under constant contention
>> we keep dropping the lock at the cursor and never scan anything, don't we?
> 
> This feels like repackaged AI review...
> 
> The mmap lock won't be eternally contended and if it is, with pages_to_scan
> under 4, I think that's fine.
> 
> Alternatively could make that >= an == and the post-++ a pre-++ and the 0 will
> never be hit in this case.
> 
> Or could have a minimum cap.

with >= a minimum cap needs to be 2, since the cursor can stop at hend
inside the VMA we just scanned and the walk lands on it again after the
drop. with == only batch - 1 VMAs get scanned per cycle, so a batch of 1
scans nothing, today's batch-0 loop at pages_to_scan 4..7, and a batch
of 2 hits the hend case. it's safe from 3 up.

-- 
cheers,
jose a. p-a
