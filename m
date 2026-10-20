Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484308;
	b=Bfg1wvjifS+zAvIuyu5pgbyruGqb3W4C1uy5arENQTRHLsSkqqHzc6j/mX7Buv6aDrCk
	 mXIgCeKCzyl7+DctvZjNInlS03dJNHAVfvoy3zzP4oCtP7c2UPc6Xc7P7GwtWmwVDQo0+
	 kqDfsaVr7z7c9KBOl1UzbzBuKMw2NoRxZv1i+7upqHxTB6ADbQbf7pGpro83gBMfDxUFV
	 qm40yTS88sxnngA5tL+LcHDJdZ27KmSGZKEVhS17OAdW24DKUkUUAO6MYvlnLn5nmcytd
	 DVizFlzQ3ZYW442zXy3WXlpAHh5Qczi5t7LX//HJznGN4dEL3L9kIjTprPzJTvhZUlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484308;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rhd9i6MZ/tSeH3TKysGHa5PRQgjZlpMeCGZ/ilQN7u4=;
	b=cQyasgj2aYs1dZRy2kddyHIICoAQH/503kzh8gTQdUEphT2FPB4P8k2WnZOUJm7K0fsO
	 XYUOPODjcm0qfRJIAWS89ptgwjXMwMuqsZHf9g4h7mY4Cg7pepc2BScDdKup+t2qyTBYe
	 J0+FiYvgT6S9QQS44wNtPsK2A7wguGBWVJCcjXSNTMLm6KQAkM/wW8VaTRF3ya+AoNYMM
	 LxUl1XKSWroBaOZGU4jCKH/nSG1FsbMWAnRXx/3UypNA+HakkDdsvhVp50HR7j1vza0U7
	 CLUMR0Upvc90WlkiE3+UaCiIdqYOYUxNp7b0cEj3LdtYDF4YbM7hy+EdwfEG4P2QyEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DuyZcDLB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B56606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DuyZcDLB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878311F000C4;
	Tue, 20 Oct 2026 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484307;
	bh=rhd9i6MZ/tSeH3TKysGHa5PRQgjZlpMeCGZ/ilQN7u4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DuyZcDLBfXNWGZLzrjjSwNI0RzkczO2f3zpg9vZGZFaS9pACw8aG3t0ARdAuQvUpJ
	 Y0yKh/MRIGouMTXjxlKTSRaT6iXqHy71ZAbQXpZ9MkolrGsHxKh/dr/OX1/4OMSeQd
	 8Igv/fmXqVZP1lAGUC08nLriQ983EoBLSu9HIRMP3ZScQWfvC0afHppbX81k0ZFnEr
	 TI1vDWFtseK9Dfpk7vRuXTWYPHawurc49SNlwPBVNrosNDt+prbwGFkSHmFlmVRYgQ
	 tux4Gr+NELTlqmf4DbsgcToRnH0obdgf52u7zp6K/OETHTxV3DpRhRN2JvX9TbaFM/
	 /XwIgnp+F4UPg==
Message-ID: <b6d4de88-cf2c-444d-8050-da2a9b22c7b9@kernel.org>
Date: Tue, 20 Oct 2026 10:18:23 +0200
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
Subject: Re: [PATCH V2 1/3] mm/hugetlb: fix mremap move length truncation
To: Li Zhe <lizhe.67@bytedance.com>, muchun.song@linux.dev,
 osalvador@suse.de, akpm@linux-foundation.org, rppt@kernel.org,
 peterx@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261019113034.97690-1-lizhe.67@bytedance.com>
 <20261019113034.97690-2-lizhe.67@bytedance.com>
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
In-Reply-To: <20261019113034.97690-2-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 13:30, Li Zhe wrote:
> move_hugetlb_page_tables() returns the number of bytes moved, but
> its return type is int while the generic move_page_tables() path uses
> unsigned long lengths.
> 
> A hugetlb mremap() move length above INT_MAX can therefore be
> misreported to copy_vma_and_data(). The out-of-range conversion to int
> is implementation-defined; on common 64-bit builds, for example, a
> 4 GiB move can be reported as zero, making the caller treat the move as
> a failure and use the wrong length for rollback.

Sounds like we want to CC stable here, right?

> 
> Return unsigned long from move_hugetlb_page_tables(), matching
> move_page_tables() and preserving the full byte count.
> 
> Fixes: 550a7d60bd5e ("mm, hugepages: add mremap() support for hugepage backed vma")
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>  include/linux/hugetlb.h | 18 +++++++++---------
>  mm/hugetlb.c            |  8 ++++----
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 16c4c4caa126..cc12040e4032 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -121,10 +121,10 @@ void hugepage_put_subpool(struct hugepage_subpool *spool);
>  
>  void hugetlb_dup_vma_private(struct vm_area_struct *vma);
>  void clear_vma_resv_huge_pages(struct vm_area_struct *vma);
> -int move_hugetlb_page_tables(struct vm_area_struct *vma,
> -			     struct vm_area_struct *new_vma,
> -			     unsigned long old_addr, unsigned long new_addr,
> -			     unsigned long len);
> +unsigned long move_hugetlb_page_tables(struct vm_area_struct *vma,
> +				       struct vm_area_struct *new_vma,
> +				       unsigned long old_addr, unsigned long new_addr,
> +				       unsigned long len);

While at it, can you convert all these to use double tab indent instead?

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
