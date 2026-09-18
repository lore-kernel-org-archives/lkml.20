Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B68A36B05E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722673; cv=none; b=YISkvy7zzleJP+gfr0Lorht32xv8A26gyHmTpGX5RaBzZi4ZF+a/kNBNPksJxfmh3utsQevjIM8lc4yRvm5Cf4wZPN5uuyGptaMaO/4SZuH5wFWueZi95cyaCQv4FdeMrxfPDUJA9Z6CbpsezG8FEG+Dn73eK2wmVtumQiOmebA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722673; c=relaxed/simple;
	bh=fTdbkTx5TlPW+D7+P0XQBhbL/3ErBwxgbdLTW6lL6zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/4aopaX5Xo129jcWQiruBqAc/YRaBsMf7ubplH7iwUjL4HrDhf22sJLpfFn1HjF1pHAf7OHF6dPVqa/MIHK/I5Ze+YRf0wMFCQO5S4W9ynj1j0t6YqhTE7EWy8tCCwSTbtVDkkdJnmuEP5lfrFn3gXjIJg/A/0RUZp05QfE6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcgVFMee; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcgVFMee"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAB21F00893;
	Fri, 18 Sep 2026 09:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722671;
	bh=dG/NQKkV41YhIgrIyd1kGa7K3ptoEDA2CGGt3WrAYAE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FcgVFMee+7sqAMMPEXTmkt4Ce4EqkYw/71EiqfiHMdlyb3ofAgUVEqi1SAGuiQ3IP
	 Z0xlcRWx8VoB9qokS9t1VxTzx+gFGV7kzSxOxWThG/a+ERFdVpq0rr8yxZHwIn13VO
	 Bb1ni3BbkCkjdpaUZ9NQhibPREdVJFxI5PdG4QQsfiEdcTiJtgLkIoYXypHnLI+YJu
	 a0WQ54kX1lr8qictRHrNQUoz5VfQmxDrLrTCuHaabztx3f33sw14YBlKYxpxlu1Leh
	 tYGkxMvWrqr2maFU8Z9S6g1dGkY0GDCwjiP539adNBTTDrEFmRIaQ3qZ5whpL33YE5
	 J8D58mL5RX1Dw==
Message-ID: <930f3db4-9034-4a48-98b2-07a44de3a718@kernel.org>
Date: Fri, 18 Sep 2026 11:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] powerpc/8xx: add pte_set_huge()
To: Barry Song <baohua@kernel.org>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
 anshuman.khandual@arm.com, david@kernel.org, dev.jain@arm.com,
 jiangwen6@xiaomi.com, leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
 ryan.roberts@arm.com
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-3-jiangwenxiaomi@gmail.com>
 <58e3b456-7389-4752-8de5-1cc82964c3c7@kernel.org>
 <CAGsJ_4wKG91hd1Y3W4mbdh6B8Kq09JyDjyvXeeCmQj+L6bHm2A@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAGsJ_4wKG91hd1Y3W4mbdh6B8Kq09JyDjyvXeeCmQj+L6bHm2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 18/09/2026 à 10:44, Barry Song a écrit :
> On Fri, Sep 18, 2026 at 2:14 PM Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
>>
>>
>>
>> Le 17/09/2026 à 07:29, Wen Jiang a écrit :
>>> From: Wen Jiang <jiangwen6@xiaomi.com>
>>>
>>> vmap installs PTE-level block mappings (SZ_16K/SZ_512K on powerpc/8xx)
>>> by reusing set_huge_pte_at(), a HugeTLB helper gated by
>>> CONFIG_HUGETLB_PAGE. This makes the feature silently unavailable on
>>> CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to HugeTLB
>>> internals it does not otherwise need.
>>>
>>> Add pte_set_huge() to powerpc/8xx, next to the existing
>>> pmd_clear_huge()/pud_clear_huge() in mm/nohash/8xx.c. It builds the huge
>>> PTE and writes it into the backing cells directly, without going through
>>> set_huge_pte_at(), so it does not depend on CONFIG_HUGETLB_PAGE.
>>>
>>> No pte_clear_huge() is needed: 8xx does not implement
>>> arch_vmap_pte_range_unmap_size(), so the vmap unmap path never takes the
>>> block-mapping branch.
>>>
>>> In practice PPC_8xx selects HUGETLBFS unconditionally, so
>>> CONFIG_HUGETLB_PAGE=n does not occur there today; this is a decoupling
>>> cleanup rather than a new configuration.
>>
>> 8xx selects CONFIG_HUGETLB_PAGE because it uses set_huge_pte_at() to map
>> kernel text with large pages. That was added by commit 34536d780683
>> ("powerpc/8xx: Add a function to early map kernel via huge pages")
>>
>> But now pte_set_huge() could be used instead in
>> __early_map_kernel_hugepage() and then CONFIG_HUGETLB_PAGE could be removed.
> 
> Hi Christophe,
> 
> Do you mean the code below? If so, it sounds like a good place to
> clean this up for powerpc as a separate cleanup patch.

Yes this is what I have in mind allthough I have not studied it in details.

> 
> diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
> index 2518d2a6bdb4..830cdb391161 100644
> --- a/arch/powerpc/mm/nohash/8xx.c
> +++ b/arch/powerpc/mm/nohash/8xx.c
> @@ -87,9 +87,7 @@ static int __ref
> __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
>          if (WARN_ON(!ptep))
>                  return -ENOMEM;
> 
> -       set_huge_pte_at(&init_mm, va, ptep,
> -                       arch_make_huge_pte(pfn_pte(pa >> PAGE_SHIFT,
> prot), shift, 0),
> -                       1UL << shift);
> +       pte_set_huge(ptep, va, pa, prot, 1UL << shift);
> 
>          return 0;
>   }
> diff --git a/arch/powerpc/platforms/Kconfig.cputype
> b/arch/powerpc/platforms/Kconfig.cputype
> index f0adbf7ecb7f..efba4d960083 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -41,7 +41,6 @@ config PPC_8xx
>          select FSL_SOC
>          select PPC_KUEP
>          select HAVE_ARCH_VMAP_STACK
> -       select HUGETLBFS
> 
>   config 44x
>          bool "AMCC 44x, 46x or 47x"
> 
>>
>>>
>>> There is no caller yet: mm/vmalloc.c is converted later in this series,
>>> once the generic fallbacks are in place.
>>>
>>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>>
>> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> 
> Best Regards
> Barry

