Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195566;
	b=mxoqmZI3sWZhnW5rXiKrxFE8QU7c9BkCSCWW1oH9uoP4QdCDHk4xxv9iVy+ohde4kEDX
	 QkffoNcBUMPDqO23lFLvbcRdsGBmfa2ZwpPIcB7xNqxKCP3+I2KNe9u96U8YRtJB3c6vv
	 AqabdVPn9LRswq5a3T3fAggodzyEjTOhLHlwJYqDWJV9/mByNdNn2kOc2oDqSd25/PFjn
	 yu31SYN6ymZV9080lIdw1dDaaK7Ej+GykFDY/nVkCBOUqZTu/Lj8BSeIl+7kZGFt0HlVW
	 H3ICAHBF+/i61oceYbL/ntysDl0jn/bhFjwu4HGQqSQGrIsc5oLJaVwfnT/2v647OaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195566;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ipzH5qd6kjldVL6ueBW7MvcsKXTNSFLFRFYQ19uyfag=;
	b=FKS4cMOqtJ0j8siex/KasrkTnisUShDlKjmaFQI2JCAQoxzWgrEaLjsXzLPXULM90WjK
	 TnINyNZOgt3z2pd+pja1AHvRWGBPL2WbXneyIrwy6b53GyFF3bXaMk1ixDRvzK1at66c0
	 +ZoLJyiqnISF1cpuHW62Jep1QWfeXOkjH/+h6NSoA/FaeQvzxIT8YpOZhmgBoopLZ050R
	 ogrsBjcN0+5ZnaNAhwR1q+q8BKrNKQVB6E5vFMPSvG5P0WNqVcB5vDf53WzzqVaMFaxmD
	 A91/RubA1MOgRITgE5tPVHT/PCxZChxDMhH08PvCmH0exUVvD7jvRFFPlaUofYqgf7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EdD2nhOl;
	arc=none smtp.remote-ip=115.124.30.101
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25679606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25679606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EdD2nhOl
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794195557; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ipzH5qd6kjldVL6ueBW7MvcsKXTNSFLFRFYQ19uyfag=;
	b=EdD2nhOlVb8o+Gm85umIdamli0H/3c+4VY2KXFZS647xCcuKiNrDipqRi22TDC3sRfFabu86DZS8+b4jfbaYPI8PFVRjNLURaLy/T2jNEYcX1b+8EPw62DcBnwGpRtPwVbMOpV2fZ0vORjMD0h6+vJ8/Ui20/T079A/F4JU2QRg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEIHFYj_1794195554;
Received: from 30.74.144.145(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEIHFYj_1794195554 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Nov 2026 11:39:15 +0800
Message-ID: <a069e3ca-6bbc-481e-acec-5ef21855b9ec@linux.alibaba.com>
Date: Mon, 9 Nov 2026 11:39:14 +0800
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
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, ljs@kernel.org, riel@surriel.com,
 liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com,
 lance.yang@linux.dev, qi.zheng@linux.dev, ayushr@modal.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <auxqWxUfRVvxnk_n@pedro-suse.tail5790ac.ts.net>
 <44740e38-77ae-457e-97db-d6e0a0149dc2@linux.alibaba.com>
 <4a64ea17-6ac2-406e-a432-b82c481a4f84@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <4a64ea17-6ac2-406e-a432-b82c481a4f84@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/8/26 3:58 AM, David Hildenbrand (Arm) wrote:
> On 11/6/26 03:12, Baolin Wang wrote:
>>
>>
>> On 11/5/26 7:37 PM, Pedro Falcato wrote:
>>> On Thu, Nov 05, 2026 at 10:56:28AM +0800, Baolin Wang wrote:
>>>> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
>>>> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
>>>> with concurrent page table reclamation via zap_empty_pte_table().
>>>>
>>>> page_vma_mapped_walk() is used by many functions including try_to_unmap(),
>>>> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_ptes(),
>>>> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_unmap()
>>>> and try_to_migrate(), the other callers do not perform post-walk accounting
>>>> checks, so the race has no observable impact on them.
>>>>
>>>> For migration, the race can cause unnecessary retries. For reclaim via
>>>> try_to_unmap(), the race can cause failure to reclaim a folio that is in
>>>> fact already unmapped (as shown below), which may lead to unexpected OOM
>>>> or increased refaults.
>>>
>>> This is very handwavy. Do you have numbers? Does this actually make sense?
>>
>> This is hard to measure in practice. But in theory, if we can't reclaim
>> cold large folios that are actually unmapped due to the racy checks, it
>> could cause cold/hot inversion (e.g., in MGLRU) and increase refaults.
>> In extreme cases, failing to reclaim unmapped large folios could even
>> cause OOM.
> 
> Yeah, but the question is if it really matters in practice.
> 
> I agree that page_mapped_in_vma() should sync properly, but the current impact
> might not be as severe.

Yes, what I meant is the theoretical impact. In practice, this race is 
not easy to trigger with no real reports so far, or the impact is tolerable.

But I still think the fix is needed, as it matches the purpose of the 
TTU_SYNC flag.
