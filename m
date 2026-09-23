Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3170253B5E2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790200663; cv=none; b=F2S5JToXRgdq8d0OtG5V/l/idCAA1ve9q7I4eqvvOQ+6sfQ2KDin36Yu2TBg5gNqyzM2Df0EwGgJaZrsILDOdPQbEZoHmxrZR67ahbIlDMty0/5XKCJQbqp1cO1mbN+abNs+64nPlft9a79epFjjBD1fV9h8pfiktxjsGhp0640=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790200663; c=relaxed/simple;
	bh=cDctsACO4GX2Nf+W7WzQPrg8wTk/YI8e4HjqIhkckoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3o2ePOzKHgZu4KgZC0eBu5tE8ChQH0X3WtDvGASmM+zyfY8ZaxBHrP82cCgCs7Y5dZ0HV8n8JRuumHn/ofildvyJYoHD1k5kTrsjxGTvj4kINxJjw5NgZgwJrpoSGBK2XDn3NrSQ9HaKIBtM97GyPKj3usSSHVY8Jr54O7Ixsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlRCpIiu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlRCpIiu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E64F1F000FF;
	Wed, 23 Sep 2026 21:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790200661;
	bh=8M+UT7oIyha+XPFScsNzmi18L28ReOVLoc3XQz11GVc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UlRCpIiuV4BL8JAAastxBfA9AqVs0ltc4wCol3mQOA0gLZjTyueHPUzDfkomWqfcu
	 vpR5AZPTtAEq8u8eSrNmhkr+1CMQCTroungYOMyBMU32U2CLz6KVXjlWqsLSI8bR6S
	 wP35XQ0D+0tN2X9HGw/1WDk6TQFINV9Nk3VDmxB8pRzxfOrvcjXU2KNpiq4TgP+2pl
	 ygpXh/ifYG/6W3V00QmeW4/BAs7W2rOQMFTUC0RlwS5eMPL8R/2vlpijuJKJ/F+yA+
	 MDkFmyaiUsbKOg26ABOc+B4X0L531YtjJ1pdd1hXGLbmJLpqc1OPuXWPqBU7xsqBdy
	 Cg9pPN+qNyR9w==
Message-ID: <f95ccf9c-c366-48d6-ac9f-c97546b9b543@kernel.org>
Date: Wed, 23 Sep 2026 23:57:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Barry Song <baohua@kernel.org>, Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
 urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
 ajd@linux.ibm.com, anshuman.khandual@arm.com, david@kernel.org,
 dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-4-jiangwen6@xiaomi.com>
 <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 23/09/2026 à 23:38, Barry Song a écrit :
> On Wed, Sep 23, 2026 at 2:28 PM Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>>
>> vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
>> huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
>> the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
>> couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
>>
>> Now that arm64 and powerpc/8xx provide pte_set_huge() and
>> pte_clear_huge(), add the generic fallbacks next to the existing
>> pmd/pud_set_huge() family and convert vmap_pte_range() and
>> vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
>> around the block-mapping paths are dropped, so PTE-level block mappings
>> now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
>> longer includes <linux/hugetlb.h>.
>>
>> The fallbacks exist only to keep the build working on architectures
>> without PTE-level block mapping support. They are unreachable there:
> 
> Since this is a `BUILD_BUG`, can the compiler simply eliminate the call?
> I guess the build would still pass even without the fallbacks, so this is
> more of a build-time check than something needed to keep the build passing?

Yes and that's what the compiler does, it eliminates the call.
The BUILD_BUG() is there to make sure it does eliminates the call.

The build won't pass without at least a forward declaration of the fallback.

In the old days when BUILD_BUG() didn't exist, the trick was the declare 
the function and never define it. But with that trick the problem is 
only detected at link time. With BUILD_BUG() the problem is detected at 
build time.

> 
> Am I missing something?
> 
>> the callers only run when arch_vmap_pte_range_map_size() or
>> arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
>> which requires an arch implementation. BUILD_BUG() makes that
>> explicit rather than silently doing nothing.
>>
>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> 
> Nice to see that `#ifdef CONFIG_HUGETLB_PAGE` and
> `#include <linux/hugetlb.h>` are no longer needed in `vmalloc`.
> 
> Nothing concerns me except for the changelog issue mentioned above.
> Please double-check whether the changelog needs to be corrected.
> 
> Reviewed-by: Barry Song <baohua@kernel.org>

