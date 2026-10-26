Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008623;
	b=uzx5QOK4SP/wJnlECnvEsF1vxzOkOPg1LbWvEgxCoclUOVlPcQCjpDGaj83EakqTofzu
	 Cwbv6JK8VDO7RPAfWOBvNUbtBoGE1R+b/FmWAKDz6L1EAFB/7q12YWvGDByhOb1xoomsm
	 spcErwOJROOeK84WyyU912CE/2VafUsLzW6Kb9JXX6UpSek53eU6ohbBMWRiX/IO39CFk
	 9wCqDRDPskw2XJtIjZR+aAz8jVQWrpkqnrWP7tvXJG74ZuPczvlSpzVHGKCkG7ycMppm6
	 ao7NaMFateX5eS9fW4QK33PFeNJvN2RKRS7BbSVkVQdpK5CNwodbRXh5DY5BpX3jbBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008623;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uEc1Bmciiva82nUX+FVCSYZVGtSGCp8Z+LUTT/EsGek=;
	b=uNbWwEwOPOC6/PLyhmmA4HrSmzLfVWOlEhoryXGaQ0xIzPqlz0jYwJPeCE1HMvxJEklE
	 CaGlvo+8RyEEL9y5JCP5hbe99O2RqltMyxY5JVROYFI+/JmunGH+PqFs4q00nInxqavK/
	 W2b6qg1DYojttPviEz1UmptEHa+UmzPZbBplRogbsKwgiHE9CkrBEat8URvZ2fcBY05sd
	 C8ec//+YLT9WUiNifp8AvDKEWeDgTrbq+TarpAQHwitgqdrcbrVZnZq3oFCzJXzXgIafo
	 q0AVpPbBSCN0cNaVo6NKM9XaWFzFud34UorF39sF7tIN0dWw0RMIuSCduqaYdQNnrnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADibYKa6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF022606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADibYKa6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB981F01825;
	Mon, 26 Oct 2026 09:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793008622;
	bh=uEc1Bmciiva82nUX+FVCSYZVGtSGCp8Z+LUTT/EsGek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ADibYKa6IDFelyxOrz8R24pUpYscXPB+pjFUqfN2yzvXXexfAjjlvE8xEfbuxib1a
	 9iuKKqlbVMsfHNfY8DCH1nNOgHe4kTajBG8upwqlZp9HUaz0Jm3ecdaV86Vb7/vNvQ
	 pVTUkIJ1PrXGqNfuWJj4ilB87T5xg70/iei3rAqXx6qEUbMNQlQKTCvPCNx0BPsKu1
	 lpfZjxcbWshFPOnI+aAlGyoG1VN7lODhcoXGWlZH27/b+4YYdt8nqCAscjnoWTkJKj
	 LVXMT/ryh3eVhd+NCWnLLVqiT4ue426VHLCP7J6ORkJwIvkzwPbZ4RahyvrSR2DIY2
	 D2GTiBGBSgRPg==
Message-ID: <18602383-2326-4e54-8dec-bb695ae8878e@kernel.org>
Date: Mon, 26 Oct 2026 10:56:55 +0100
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
Subject: Re: [PATCH v2 0/2] mm: don't migrate folios containing hwpoisoned
 pages
To: Yuanhe Shu <xiangzao@linux.alibaba.com>, akpm@linux-foundation.org
Cc: "Huang, Ying" <ying.huang@linux.alibaba.com>,
 Kaitao Cheng <kaitao.cheng@linux.dev>, vbabka@kernel.org,
 linmiaohe@huawei.com, nao.horiguchi@gmail.com, ziy@nvidia.com,
 wangkefeng.wang@huawei.com, tujinjiang@huawei.com,
 mgorman@techsingularity.net, chengkaitao@kylinos.cn, muchun.song@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261026025552.1427901-1-xiangzao@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <20261026025552.1427901-1-xiangzao@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 03:55, Yuanhe Shu wrote:
> v2 of this series.  No changes to the approach; the two deltas are a
> wording correction promised in the v1 discussion and a third check
> suggested by Kaitao Cheng.
> 
> memory_failure() can end up abandoning a folio while PG_hwpoison is
> already set on it.  Two ways to get there:
> 
>   1. Race: any isolator (compaction, NUMA balancing, move_pages(),
>      mbind(), CMA, long-term GUP) clears PG_lru from under
>      memory_failure(), which then fails the HWPoisonHandlable()
>      check, exhausts the get_any_page() retries and bails out with
>      MF_IGNORED - without holding any reference, but with the flag
>      set.
> 
>   2. No race at all: the THP-split-failure path
>      (kill_procs_now() + MF_MSG_UNSPLIT_THP) leaves a large folio
>      on the LRU with a PG_hwpoisoned subpage by design.
> 
> In both cases the migrator still holds the folio on its migration
> list and migrates it like any other: the corrupted data is copied
> into a fresh folio with no poison marker, and no hwpoison PTE entry
> is installed on the way back, so the userspace mapping is silently
> redirected to the corrupted copy - no SIGBUS is ever delivered.
> 
> This was reproduced on v7.3-rc4-75-g62f4c998b297 (the base of
> this series): an order-0 stress workload (madvise(MADV_HWPOISON)
> racing move_pages()) left the poison flag set on 8426 abandoned
> folios in a 180-second run; 698 of them were subsequently
> migrated, and in every case the address then served the copied
> corrupted data with no SIGBUS.  With patch 2, 0 of 9711 were
> propagated.
> 
> The compaction-side guard is needed regardless of how the race in
> memory_failure() itself might be addressed: the steady state
> (split failure leaves the folio on the LRU with the flag already
> set) is not a race at all.  Deterministically validated 16/16
> poisoned mTHP folios migrated unpatched vs 0/16 with patch 1,
> with clean controls migrating 16/16 in both runs.
> 
> The checks compose with, not replace, copy_mc: folio_mc_copy()
> still catches real-DRAM corruption during the copy on archs that
> implement it, and the flag checks refuse software-injected poison
> on all archs before and after the copy.  Extending the
> !ARCH_HAS_COPY_MC fallbacks of copy_mc_user_highpage() and
> copy_mc_highpage() with the same flag check - which would also
> cover their non-migration callers - was proposed by Huang, Ying
> and welcomed by David in the v1 discussion; that is posted as a
> separate patch right after this series.

With that patch in place, why do we still need these changes here?

-- 
Cheers,

David
