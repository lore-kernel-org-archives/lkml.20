Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5ABE47254E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253929; cv=none; b=Sjh5XXk6pNX0a4iZXxO+drQM2o+cTmWxFTEwQJPfoM++q6pbEblY1VEfO4waIRkk3Z+9PfD5KDDK1JgmrPah/eIEQ5b7UJ18v/W6PF82IYuduBomm+w80jnP8LiMGaMdISq80TkiN9fsWiMbxjh3PCn02oMNVXj0zspXUx4VhDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253929; c=relaxed/simple;
	bh=OAJbyZz/ESiAWbgy8vL8egurZestop0OBiXg4a+hnq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UA1CVAD7hnkxcRM7LihraTREUNmER8z8PU22qMMkOBRIZqnupna6voS/ODQF/xLA4flV3vni/Bk/f8KwFQ7wfLrfPK6XeoMPmIFSqbDEDG3ihtXGMcVSTyiWsFZdPQDyKCrn9Js64U7FD8KcuyfhhweFrFvTTIXjCqCJXbMdIw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Sna3chVx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Sna3chVx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF4111692;
	Tue,  1 Sep 2026 02:12:01 -0700 (PDT)
Received: from [10.57.7.38] (unknown [10.57.7.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FD163F882;
	Tue,  1 Sep 2026 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788253925; bh=OAJbyZz/ESiAWbgy8vL8egurZestop0OBiXg4a+hnq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sna3chVxatS6pqs5ij7OptLhR6Ki6mUqMl/tI+T7D8Px6fVtfcxa972Gcgu6EoxAR
	 kZwIBI7C/5PG5YnCPjO6Irpg2k0Uu1/FHapdxRi8tOfgmghmF0i4+A71ve4r7GYpTz
	 nxTpxxV+jCrtDwos/heb5hqZ2sPpNFVtjvxflqH8=
Message-ID: <2b56b3fa-872b-4600-a351-cb48e06b4657@arm.com>
Date: Tue, 1 Sep 2026 11:12:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/4] arm64: mm: Map fixmap PTE tables r/o in the
 linear map
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
References: <20260827164409.3421848-6-ardb+git@google.com>
 <20260827164409.3421848-7-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260827164409.3421848-7-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2026 18:44, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Without physical KASLR, the fixmap page tables will appear at an a
> priori known offset in the physical address space, and due to the lack
> of randomization, the linear map carries a writeable alias of the fixmap
> PTE pages, which appears at an offset in the kernel VA space that is
> also predictable.
>
> Given that the placement of the fixmap area is never randomized either,
> a single store to this linear alias region is sufficient to map any
> physical page with any permissions at a known offset in the kernel VA
> space, including on top of the PTI trampoline.
>
> Avoid this, by remapping the fixmap PTE pages read-only in the linear
> map. This is possible because all updates to bm_pte[] occur via the
> mapping of the kernel image in the vmap area. A read-only mapping is
> still needed for things like ptdump that walk the page tables.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/fixmap.h | 3 +++
>  arch/arm64/mm/fixmap.c          | 8 +++++---
>  arch/arm64/mm/mmu.c             | 8 ++++++++
>  3 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
> index 170c3502d723..9191125738e9 100644
> --- a/arch/arm64/include/asm/fixmap.h
> +++ b/arch/arm64/include/asm/fixmap.h
> @@ -112,6 +112,9 @@ enum fixed_addresses {
>  
>  void __init early_fixmap_init(void);
>  
> +extern pte_t fixmap_bm_pte[][PTRS_PER_PTE];

Instead of fixmap_bm_pte_size, why not use the same inner size as the
definition, and then simply use sizeof() where required (or make a macro
out of it)? Both the inner and outer sizes have to match the definition
so there's no risk of things going out of sync I think?

- Kevin

> +extern const size_t fixmap_bm_pte_size;
> [...]
