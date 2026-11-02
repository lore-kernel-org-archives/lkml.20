Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602184;
	b=wtueZg0ZnaoLDf3wWOMGYt6OS4waVePPCeVSnkn2CgQ3sVQW08nzRbIa17xon0VgyE58
	 2BLFNwyPaP9uOfOpfGH6yCFg8fhhzWlQPI7fFSMwYXwLx4YDeAmI2oXR2HhjAh/9ZIgF4
	 h9xvhBrlwWUwVvpVk5BI1yWP/9TpOcNHsyANiB6QcmtvML6KQUwy88M5GDK8WH783HpKh
	 8bTLOT1MFw39YZuwsxsdzBimt5Hn6QPJgz2PeaXIGUJDd7iGPjIFPOo9+1b1viM5/St+d
	 oSOvXFwfZpXCKS+1Q08ZYijqvEJNkcx+3MB8WdFV3gyHG3WiMvkRgyaJ4jvebZGD/lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602184;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lHJKYoJn2rQcORF8UUmu/uUQz3K49GvOCpYRw8uJeTw=;
	b=chAhtMVTDbLxf3c1fgflgI1KTFzDc8amtCz2Yi11pOu00CnlUWncQBMCKdPtCV3kR956
	 ozP6F/SL1RGuVUCUfD2UeuLpDCVo3J5gDwA/XeCXuqbReuqNIHjyBEX1tZ4G/uz+/KMgj
	 0xJkIN3gfalvspxlvkhgWD3NiUO5MuDRlmpmROiirD4iXpbPWLGD/JljNr3bPTFnRrgao
	 PguXjfDLUpckjAtT2ocjJwWBjEavLXxY9iOVbg3c2Ipm7Bh2pltYHjmM2UyozzT49DTjS
	 TBbD/GaK9T5Sanf+jpYebCdsL1WiBp94MySUNJ1poXsZiz5rBOuf72gJ3tLxccpZXbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MFM3BLP9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39BB606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MFM3BLP9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE001F000C1;
	Mon,  2 Nov 2026 06:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793602183;
	bh=lHJKYoJn2rQcORF8UUmu/uUQz3K49GvOCpYRw8uJeTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MFM3BLP9ClG/wpwp8m2Y+F7r9H7PumjtWx30iXhIhEEVNlaHPzMErxGkapMn919RK
	 Z7xG7RlaYy6cgJdIGKS4HA38UIGPemB51XWXP7DZlTkX5XWJJtWl6Pb3PSln1FGA9L
	 AYsg/g7O5HQyQ7r4tB7Uh4C4J2D/N1GgSUOPyPNUgp31aNc9grwPTwSwH9h8IvdLR/
	 soUnea6qM44H37EC5fbfOAovvWG8ByvoOzjLLzUpGsVIdExut6fiI97Tp0kg8nbvHJ
	 3kAkvrewtCxarSA+gIi3ipnFFLyPtVEICDKrRLUWjb2DjFmCUsAtuHuMpZlW41I14x
	 QEK0zthUAlIPQ==
Message-ID: <40a8fb84-4d76-40f8-b331-66ef94f3b17b@kernel.org>
Date: Mon, 2 Nov 2026 07:49:39 +0100
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
Subject: Re: [PATCH] mm/memory: use pmdp_get() for the lockless pmd read in
 do_fault_around()
To: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>
References: <20261102031308.66177-1-hui.zhu@linux.dev>
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
In-Reply-To: <20261102031308.66177-1-hui.zhu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 04:13, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
> 
> KCSAN reports a data-race in do_read_fault / pmd_install; the same code
> is in mainline:
> 
>   write (marked) to 0xffff8d52a75fb810 of 8 bytes by task 27487 on cpu 5:
>    native_set_pmd arch/x86/include/asm/pgtable_64.h:83 [inline]
>    pmd_populate arch/x86/include/asm/pgalloc.h:84 [inline]
>    pmd_install+0xe0/0x120 mm/memory.c:444
>    finish_fault+0x5bc/0xb00 mm/memory.c:5204
>    do_cow_fault mm/memory.c:5432 [inline]
>    do_fault+0x5d0/0x6e0 mm/memory.c:5526
>    handle_mm_fault+0x211/0x4c0 mm/memory.c:6218
>    __mm_populate+0x144/0x270 mm/gup.c:2207
>    __do_sys_mlockall+0x2cd/0x380 mm/mlock.c:764
> 
>   read to 0xffff8d52a75fb810 of 8 bytes by task 27527 on cpu 9:
>    do_fault_around mm/memory.c:5341 [inline]
>    do_read_fault+0x162/0x670 mm/memory.c:5381
>    do_fault+0x31a/0x6e0 mm/memory.c:5524
>    handle_mm_fault+0x211/0x4c0 mm/memory.c:6218
>    faultin_page_range+0x227/0x530 mm/gup.c:2156
>    __x64_sys_madvise+0x67/0x80 mm/madvise.c:1479
> 
>   value changed: 0x0000000000000000 -> 0x000000001386c067
> 
> do_fault_around() reads vmf->pmd without the pmd lock to decide whether
> ->map_pages() needs a preallocated PTE page, while pmd_install() publishes
> the entry with WRITE_ONCE() under the pmd lock.  Both paths above only hold
> mmap_lock for read, so they can fault into the same VMA concurrently.
> 
> The race is benign.  The pmd is a naturally aligned 8 byte object, the
> store is a single WRITE_ONCE() and pmd_none() only tests the low word, so
> no torn value is possible.  A stale none pmd only allocates an extra
> prealloc_pte, which pmd_install() leaves unused because it rechecks
> pmd_none() under the pmd lock, and do_fault() frees it on the error path.
> A pmd already seen as populated makes ->map_pages() find no PTE, and
> do_read_fault() then falls back to __do_fault() and finish_fault(), which
> allocate the page table properly.
> 
> Read the entry with pmdp_get() so that the load becomes a READ_ONCE()
> pairing with the WRITE_ONCE() in pmd_install().
> 
> No functional change intended.
> 
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
>  mm/memory.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 0fb676dd2bd63..90afbd124d503 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6017,7 +6017,11 @@ static vm_fault_t do_fault_around(struct vm_fault *vmf)
>  	to_pte = min3(from_pte + nr_pages, (pgoff_t)PTRS_PER_PTE,
>  		      pte_off + vma_pages(vmf->vma) - vma_off) - 1;
>  
> -	if (pmd_none(*vmf->pmd)) {
> +	/*
> +	 * Lockless hint: pmd_install() may populate this pmd concurrently and
> +	 * rechecks it under the pmd lock, so a stale value is harmless.
> +	 */
> +	if (pmd_none(pmdp_get(vmf->pmd))) {
>  		vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
>  		if (!vmf->prealloc_pte)
>  			return VM_FAULT_OOM;

If it's an lockless access, shouldn't we be using pmdp_get_lockless()?

-- 
Cheers,

David
