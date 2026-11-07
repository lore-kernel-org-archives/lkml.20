Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079747;
	b=LUPW4Nsdxw0CMWQm4s9tOgfIwUPhBREcIBPJIZVrGlelr1sILP2ftgTgDCEYQqH/QvgR
	 yJA0tUTpTM3PglLWZJ4ZgnLlwMR/oBTGwkDRvor7SiSLK/jXAqrFkqtZhePj66HeihgBl
	 fVyJF4x1sB29bKIyxrU58jOCEcgHttuvjGzqJu6dSsp6dDLkmK9fo60njseXt/VZ8CQWS
	 UoRVtuiT/ECUBEQP1iWLfRaT0ZF1vloa5vxnsUbmejnL3Rumeul/G2DvlvHhDRe5aSJD8
	 uNJsSnMjT06n9wUG3fvmuk0Ye5kBBJJKVR8XZlHxvNt6DcKRslIQn78bNHm1wCz3K4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079747;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7Ov7GeLhcYhxCP17ziUm+7IIU7rjkhp7m+eZjNGqqtY=;
	b=32bnvH7TknpFFBFXUl7eQ8ye5T4EoXcuI2WlMVQKGOUPDkywnD/P2nKBCZO10AcsH7r+
	 A6RcU18ruPrU+aiRuy6jZS+89Sl5YBR8RjoEKTV0DfTCanpt/7pEp6SRRVR8ksrlQSS3g
	 C2DXsUOK2vmpbU0LF3GP6tH9dTErVRe60HXIRKdoa5OQ835AxyN4kasdKCXZqvmap8xIY
	 Fv4xFDe34/PGdws8OvczPPFFwm6npdL5gKS0JmCXqdiTO9100Cu2YPX3w/OfgnLx/hqc8
	 Q8NO/hdifStw4ZZAd9QKI8IX1pRNpkh/PNoF1G5001wmatBQSf8ZwAURplgKHeGKPCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="btak/NjA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB6E606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=btak/NjA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507901F008A2;
	Sat,  7 Nov 2026 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794079746;
	bh=7Ov7GeLhcYhxCP17ziUm+7IIU7rjkhp7m+eZjNGqqtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=btak/NjA5HXiNm9eB53iO2P0kVP6gcust1hNujA8Xhe6SIGL7ZPNyeyKDTGunctTR
	 +wKgGgu/BEey5ixlamyuuMx7Bcdih5YAlVE86Ut8vPi14t2nTSknpdYOCBbtRyD31Z
	 43q3G1u4wi8qbH6BgQk89ak9+8YtQ47eqIDkb9DJFZ5WcgDxml8QILGXk4mJORmmio
	 TMvcFjn52TIiV5wVNRNgUOElBw5Qrl22KgPhv0ObjtodP+I++g087oaMQpVvp+sica
	 4lColLpj+W/eH7yV/gc5tMuHVdVLNehJWSNNGUbPy1VCMfCagDWMrq8ZN3ehE7BBlz
	 vbreZ447FvvKA==
Message-ID: <bf5c4e81-2c9c-4f4a-ae7c-9edf6a524d1a@kernel.org>
Date: Sat, 7 Nov 2026 20:28:56 +0100
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
Subject: Re: [PATCH] mm: clear pmd in pmdp_invalidate()
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: akpm@linux-foundation.org, liam@infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 mhocko@suse.com, rppt@kernel.org, surenb@google.com, vbabka@kernel.org
References: <f1b2ec5a-f7a7-442c-97fd-f67fe6ecb197@kernel.org>
 <20261104111254.320059-1-trintaeoitogc@gmail.com>
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
In-Reply-To: <20261104111254.320059-1-trintaeoitogc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 12:12, Guilherme Giacomo Simoes wrote:
> David, I haved immersed inside this problem on last days, and how sashiko-bot
> very well apointed, I'm haved doing a wrong duplicated clear on pmd's. I not
> notice that the pmd_establish() already called the page_table_check_pmd_set()
> wich in turn call __page_table_check_pmd_clear(), my bad.
> 
> At first time, I thinked the problem is a duplicated
> page_table_check_pmd_set(), but with a LLM helpful I ruled out this hypothesis,
> because I not found any obvious call to page_table_check_pmd_set() before
> remove_migration_pte(). At second time, I suspicious that maybe we are haved a
> race condition, that make no sense...
> 
> After a lot of debug and tests, I found a thing.. And I attempt to test this.
> If you see inside arch/riscv/include/asm/pgtable.h, the pmd_mkinvalid() do:
> ```
> static inline pmd_t pmd_mkinvalid(pmd_t pmd)
> {
> 	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
> }
> ```
> 
> but , the pmd_user_accessible_page() check `pmd_leaf(pmd) && pmd_user(pmd);`
> and pmd_leaf():
> ```
> static inline bool pmd_leaf(pmd_t pmd)
> {
> 	return pmd_present(pmd) && (pmd_val(pmd) & _PAGE_LEAF);
> }
> ```
> 
> and the pmd_present():
> ```
> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> static inline int pmd_present(pmd_t pmd)
> {
> 	/*
> 	 * Checking for _PAGE_LEAF is needed too because:
> 	 * When splitting a THP, split_huge_page() will temporarily clear
> 	 * the present bit, in this situation, pmd_present() and
> 	 * pmd_trans_huge() still needs to return true.
> 	 */
> 	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE | _PAGE_LEAF));
> }
> #else
> static inline int pmd_present(pmd_t pmd)
> {
> 	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
> }
> #endif
> ```
> 
> And the TRANSPARENT HUGE PAGE , is exactly a page that I was allocated with
> mmap() (see my previous emails with my repro.c).
> 
> So, I change the pmd_mkinvalid() adding PAGE_LEAF flag:
> ```
> static inline pmd_t pmd_mkinvalid(pmd_t pmd)
> {
> 	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE|_PAGE_LEAF));
> }
> ```
> 
> And this work for my repro.c.
> The problem here is what the documentation of pmd_present() say:
> ```
> 	/*
> 	 * Checking for _PAGE_LEAF is needed too because:
> 	 * When splitting a THP, split_huge_page() will temporarily clear
> 	 * the present bit, in this situation, pmd_present() and
> 	 * pmd_trans_huge() still needs to return true.
> 	 */
> ```
> 
> So the documentation say that if a THP is splitting, this should return true
> event though PAGE_PRESENT and PAGE_PROT_NONE is cleared.
> If you think about this, maybe make sense.
> 
> And after some searchs I saw that was already fixed by Yunhui Cui
> <cuiyunhui@bytedance.com>
> https://lore.kernel.org/all/20260523042052.35476-1-cuiyunhui@bytedance.com/

I remember that Zi is currently also fixing some pmd_mkinvalid() implementations.

Is there anything to fix from your side, or does the above fix already resolve
your problem?

-- 
Cheers,

David
