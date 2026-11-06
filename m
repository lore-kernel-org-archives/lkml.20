Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957919;
	b=Nh1xrvP8hR22lDUGEM1VWGvHwEkFP/JWHnXj4tBr0U6/giwrtk6elYBnXdmXcJFD2Hxy
	 C37dmx+QdHgUn6u2g/Wqq/i6BDn0p+OZD2pJVdDfha7S2ScaBvV3x8V9zNA5rgbsB/Uzj
	 7ZHlXyynyZgIzjxAjZe/I8bDzpHX8QpXburC8MarEP6F2LW9D2ayn0mKnt45hFnCKoWrz
	 T1kObccs/EQpfbcEmcg1/d43ZqGlTtUHhjDkF8XJPYC06jNdzitOdGeBXejuGwtrXm2yv
	 lEjj4LN5Hdt048S9QZ+oje+1g7hQqzWEhNh6WGeQsOYXDJHKxIlGxAy3TnD7K57g6NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957919;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Okh68OdrFDN3h8R03ZH0j5Qf8O4M3e/BJYn/3wgqhSg=;
	b=i9i9y+hf7juf4TAIMmKxq3viSr/awkgMKFRtbHWTRYYLw6jFx4mwsYbIfYffKeybe11i
	 DGh19ctdevTjtgwdMyBPLVHZhTgjntOihySMaX+1kG0rom/Klr1llDTikL2J1+7kt1EdU
	 gaN8CNF+1HovcTJsuCV9Ayhy9pHbEvs3bbZAjcIyfU9SjmEh5Wpk3RdY076oMkXTIBnRg
	 BLyaah9XKlgh/I3VU3m+xkN2Vr0Ql/p4SaT/btfQyDxQqRzN6N+v10NBG3SPjcvHS6mfi
	 am8rEMACD2bLqtg7JvwgDbd1Da+61CqbgNRelJ4jnHWRQRDJYleeVup/aZ3khl2uxgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="luheT0/6";
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D24606A33B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D24606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=luheT0/6
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793957910; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Okh68OdrFDN3h8R03ZH0j5Qf8O4M3e/BJYn/3wgqhSg=;
	b=luheT0/64FKTN+BKUzegC+cU906BLC4nV3JNAviePfjyWyqjEfbWcf7GmejWsGu1cENFiP2l37OewU1hBmeim2dnjbgkpPglR9KGUk9DmlF12ka7F6jk2PYJ3eOG5/uQ30YmVmFn5xmaDU6lRjhK/OUZio4ZmO6UZd8SuJcW+Xc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEBNJzV_1793957908;
Received: from 30.74.144.130(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEBNJzV_1793957908 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 17:38:29 +0800
Message-ID: <a6333eb2-d51f-4947-bde6-f61ef52efb69@linux.alibaba.com>
Date: Fri, 6 Nov 2026 17:38:27 +0800
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
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 4:57 AM, Lorenzo Stoakes (ARM) wrote:
> khugepaged walks an mm's VMAs under the mmap read lock in
> collapse_scan_mm_slot(), checking for ineligible VMAs first, and skipping
> them if encountered.
> 
> It charges cc->progress 1 page against the /sys/.../pages_to_scan budget
> when these are encountered, however only checking this budget once an
> eligible PMD-spanning VMA is encountered.
> 
> It can therefore hold the mmap read lock for a long time if there are a
> large number of ineligible VMAs present in an mm, over which time no mmap
> write locks (and thus no VMA write locks) can be acquired.
> 
> Address this by checking whether the mmap lock is contended after every
> KHUGEPAGED_MAX_VMA_SCAN_BATCH VMAs walked, that is a quarter of the
> pages_to_scan budget, and if so dropping and re-acquiring the mmap read
> lock before resuming the walk from the per-mm cursor.
> 
> As the walk is resumed from the cursor rather than the VMA that was current
> when the lock was dropped, the cursor must never move backwards. A VMA
> ending at the top of the address space causes ALIGN() to wrap the cursor to
> zero, so treat such a VMA as the last in the mm rather than skipping past
> it.
> 
> This was tested locally with ~1M ineligible VMAs mapped ahead of a
> collapsible region of memory, and resulted in a reduced mmap_lock hold time
> of 170us down from 95ms.
> 
> This was also observed to reduce mmap_lock stalls in concurrent threads of
> a similar duration. Note that a reader re-acquiring the lock can currently
> steal it from a writer that is queued but not yet running, so the full
> benefit to writers depends on the separate rwsem change at [0].
> 
> Local measurements indicated no change for ordinary use cases, so this is
> all upside.
> 
> This work came out of investigations into mmap stalls when getting latency
> numbers for an unrelated patch series.
> 
> [0]: https://lore.kernel.org/all/20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org/
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---

[snip]

>   		if (!collapse_possible_orders(vma, vma->vm_flags, TVA_KHUGEPAGED)) {
> -			/* Unable to collapse, skip to the next candidate. */
> -			mm_slot->address = ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
> +			const unsigned long next =
> +				ALIGN(vma->vm_end, HPAGE_PMD_SIZE);
> +
>   			cc->progress++;
> +			/* Check for overflow. */
> +			if (unlikely(next < vma->vm_end)) {
> +				vma = NULL;
> +				break;
> +			}
> +			/* Unable to collapse, skip to the next candidate. */
> +			mm_slot->address = next;
>   			continue;
>   		}

IMO, these changes seem to belong in patch 2?
