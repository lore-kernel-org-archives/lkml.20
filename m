Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793931142;
	b=rFqqjFE6xvvUsIHbGqidSyGj/FLT+CQyNhjROSZcJJgcySzx8oLQ19tuB8IpLcV+hyfT
	 WPwSzBs8+BPg51XOJTNsP4NRX1+ru+5sVCucBla70qMem6+B08j18QUGncbovA8dvHtJ5
	 YsLZFYlAz1fpHshl0yqj+b5GV9BPVI3mEafZO3y/LKjrsYFqhdxe4gjy+e3WJR/x/+eRJ
	 ENSeOp09aYFa9fdhWwHFwT7rDLWZ4zBAfmt8BhwmwUxtZiwH7nqGHQfyNZS9RMRMb40NQ
	 Hj5A26g6TOypD75U19kHcVhytAgX/+jFdtkgmkZxtWTYplu/oihRgA45b/Q0rhl2oVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931142;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=BoPT4cnztlWhe++QcEIoMFQGVSkCAinjrbX3Ih95LjA=;
	b=2f0cgUjdjhqw1x9dl2irI9nfAmGr3Hj5+bstZgGB5uiLJi+Jl4SWvBuWmKrbWT78udsu
	 vd5y56IMy0OtzPsp0XpBXT47loZFtPSYbwD1DnPThMHpdSmsVBZikkINZGMBX4jaVxOlp
	 XIwi2qpVxVFMpr4sy6tzOZ8O8uZ2zAmExY3MblGPKXHtibp5Xk+Eh2u6JhQLd0Z8zEB0d
	 6IbTT2SgiNb86s6KwvJZFULWagV5kdiiEq7UHAtrZOnRpVTzY6ch9SZ5vvB4gZxJpEBXP
	 1KZNJkpowmsbyv9DqjI0vxPMo/5V2ybWGdeATFC31Y/zKQD8suHYzMxrjgosqtAUFrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=GrExV6hp;
	arc=none smtp.remote-ip=115.124.30.131
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F32606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 02:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F32606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=GrExV6hp
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793931132; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=BoPT4cnztlWhe++QcEIoMFQGVSkCAinjrbX3Ih95LjA=;
	b=GrExV6hpolJzr+iJAMeQiKPp/a5BgdQeN6RiU/nNaNo1coegw4al82RqRMgUwK4rXmeY6GfcED/Rb735MJU//nr0lnlWqKQuYbk9wrFgE2Jx9Rgb874N503WrALotE8NXZMhVpGI5Q3gYPBR5OIWu15dh4bwMX/vWygT7+6iw3k=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEA4u3G_1793931129;
Received: from 30.74.144.130(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEA4u3G_1793931129 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 10:12:10 +0800
Message-ID: <44740e38-77ae-457e-97db-d6e0a0149dc2@linux.alibaba.com>
Date: Fri, 6 Nov 2026 10:12:09 +0800
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
To: Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 riel@surriel.com, liam@infradead.org, vbabka@kernel.org, harry@kernel.org,
 jannh@google.com, lance.yang@linux.dev, qi.zheng@linux.dev,
 ayushr@modal.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <auxqWxUfRVvxnk_n@pedro-suse.tail5790ac.ts.net>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <auxqWxUfRVvxnk_n@pedro-suse.tail5790ac.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 7:37 PM, Pedro Falcato wrote:
> On Thu, Nov 05, 2026 at 10:56:28AM +0800, Baolin Wang wrote:
>> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
>> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
>> with concurrent page table reclamation via zap_empty_pte_table().
>>
>> page_vma_mapped_walk() is used by many functions including try_to_unmap(),
>> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_ptes(),
>> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_unmap()
>> and try_to_migrate(), the other callers do not perform post-walk accounting
>> checks, so the race has no observable impact on them.
>>
>> For migration, the race can cause unnecessary retries. For reclaim via
>> try_to_unmap(), the race can cause failure to reclaim a folio that is in
>> fact already unmapped (as shown below), which may lead to unexpected OOM
>> or increased refaults.
> 
> This is very handwavy. Do you have numbers? Does this actually make sense?

This is hard to measure in practice. But in theory, if we can't reclaim 
cold large folios that are actually unmapped due to the racy checks, it 
could cause cold/hot inversion (e.g., in MGLRU) and increase refaults. 
In extreme cases, failing to reclaim unmapped large folios could even 
cause OOM.
