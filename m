Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9422E7162
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167840; cv=none; b=hKNc5F1+HlzoiYHZwt4N78Q81hBdAfoiuPG6JSF1ygkVYas7a66NTswIvvXcb7BAyetGoExVwIMnSR6SqmSjtoBwJ2ozHMmLTUQaGpfe/gwM9eMaUlYJiBX8jn619cZf8chRSSuqVJgIf5e8o6vAbWJjwk34T/zTsyZ5NZxfeHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167840; c=relaxed/simple;
	bh=z+yS/SoyIg7hhvgkUwal0qH2INlM/SI5Zl/XhrLUvFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCzg7mp9OBeadQ8rF+Dax9H+fO8w3tdU54tikWL4ASK5httm3HW6zdpWXaliI4PGYpcL8LC8I2loZ6VoH0hyNJQtkTCG0bauJ8MXo+q1Z9dQmOuwx1min/cxasVsVHKX49b89TXr2sir+4w/3IPgcpYOoh+t8kRXYgG6A+bahIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ol1t6jJC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ol1t6jJC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF16F1570;
	Wed, 23 Sep 2026 05:50:34 -0700 (PDT)
Received: from [10.0.138.135] (XHFQ2J9959-5.cambridge.arm.com [10.0.138.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8CB23F86C;
	Wed, 23 Sep 2026 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790167838; bh=z+yS/SoyIg7hhvgkUwal0qH2INlM/SI5Zl/XhrLUvFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ol1t6jJCfzd6c8OpXVDodMTpqQmF63+NHtsFlKE4TQ375JHm/yI33ZZjp29fKkWf+
	 RfgLJJn28pc11PBO2a1AUz1svJeHdUebBJjxIokAlwBdwxnw8Lb76bFd3HRoK8JQ38
	 OrITSANkn63YEis81/z4L/rZwU7gTdMwO7FNk4hg=
Message-ID: <e852a2db-c15a-4e9f-b92e-ffd5740498cc@arm.com>
Date: Wed, 23 Sep 2026 13:50:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] arm64/mm: Use pmdp_get() for PMD accesses
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Mark Rtland <mark.rtland@arm.com>,
 linx-arm-kernel@lists.infradead.org, linx-kernel@vger.kernel.org,
 kasan-dev@googlegrops.com
References: <20260922061638.3967467-1-anshuman.khandual@arm.com>
 <20260922061638.3967467-2-anshuman.khandual@arm.com>
 <212067fe-1b16-4b87-87a7-4ce50847eb24@arm.com>
 <m72rpspdg5cv7xptent4tglgd25zehx462nfmcx5uyjwi2ag7p@bc6hvhosgtfb>
 <bce043cc-0f69-4297-8f31-92dcfbc0061d@arm.com>
 <7dn5t2m2fzuwxj2anuycz245hnctqc5mgaj5vdx7ybfql7arwv@6ac363txw3ff>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <7dn5t2m2fzuwxj2anuycz245hnctqc5mgaj5vdx7ybfql7arwv@6ac363txw3ff>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/09/2026 13:22, Anshuman Khandual wrote:
> On Wed, Sep 23, 2026 at 12:31:42PM +0100, Ryan Roberts wrote:
>> On 23/09/2026 12:01, Anshuman Khandual wrote:
>>> On Wed, Sep 23, 2026 at 09:32:17AM +0100, Ryan Roberts wrote:
>>>> On 22/09/2026 07:16, Anshuman Khandual wrote:
>>>>> Replace READ_ONCE() with pmdp_get() for PMD accesses in preparation for
>>>>> supporting both D64 and D128 translation table formats.
>>>>>
>>>>> READ_ONCE() cannot currently be used for 128-bit page table entries on
>>>>> arm64 because it does not provide the required 128-bit single-copy
>>>>> atomicity, causing builds to fail for accesses wider than 64 bits.
>>>>>
>>>>> Although LDP/STP provide the required atomicity when FEAT_LSE is
>>>>> available (as required by FEAT_D128), extending READ_ONCE() to support
>>>>> 128-bit accesses is undesirable. READ_ONCE() is a general-purpose API,
>>>>> so doing so could encourage other 128-bit users that would either fail
>>>>> to build in configurations without D128 support or, if D128 becomes a
>>>>> runtime option, silently permit tearing on systems without the required
>>>>> hardware support.
>>>>>
>>>>> Instead, standardize PMD accesses on the existing page-table helpers.
>>>>> These can be overridden on arm64 to provide 128-bit single-copy
>>>>> atomicity when required. No functional change intended.
>>>>
>>>> I notice you have an unconverted READ_ONCE(*pmdp) in
>>>> pmdp_test_and_clear_young(). Is that intentional?
>>>
>>> Converting the above READ_ONCE() instances as pmdp_get() cuases a build
>>> failure as pmpd_get() which is defined in generic pgtable header is not
>>> visible inside platform specific pgtable header, even with a forward
>>> declaration.

I was wondering why the forward declaration doesn't work, but looks like some c
files include asm/pgtable.h directly, which explains it. Let's assume there are
good reasons and unpicking it so that only linux/pgtable.h includes
asm/pgtable.h is not practical.

>>>
>>> In D128 V2 series these conversions were performed later in the series,
>>> when platform specific pxdp_get() overrides were added via ptval_get(). 
>>>
>>> But to avoid this, we could just move pmdp_test_and_clear_young() inside
>>> arch/arm64/mm/mmu.c file instead. Folding in the following change builds.
>>
>> I'm not sure if/how this might affect performance? Probably not significant
>> since they are for higher levels, so not called as frequently as pte helpers.
> 
> Right, should not have much performance impact.
> 
>>
>> Another option would be to implement arm64-specific pxdp_get() helpers in
>> asm/pgtable.h to override the generic versions?
> 
> For now those will still be based on READ_ONCE() just like the default ones.
> Although trying to drop similar redundancies from other platforms :)
> 
> https://lore.kernel.org/linux-mm/20260923043226.331880-1-anshuman.khandual@arm.com/
> 
> But given D128 is going to define pxdp_get() anyway it might make sense to
> define them now and withdraw the above series :) Seems like s390 platform
> also has similar situation.

Given the desired end state is that arm64 defines it's own pxdp_get() helpers, I
think the best approach is just to define them now (as READ_ONCE()).

Thanks,
Ryan


