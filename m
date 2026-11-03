Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701680;
	b=LJ2+XP0Y8Y2QYUEA6EIRa1P059ptVi/tq/urr8ptMGYD2C4Zf0sCRSUvTl/PLPBgVnRj
	 /WNa+9zyBlOAV4mZlYZpOHSfKPJZgeojaBYxDTevEMsD9cWlSVyewAuiskg+ObpDO5iLc
	 eR7EyxtgUyrYrD6q77LLeq5OdOuye+T490Xx/sYEtGdhj+R6r1G6Twfr6mzGYljXB+8u4
	 L6wgcyABv4roShrUMe5Neq/39lLbyOp27pD1DM/2RTxlGguzEaOkO7TkuLZRfbb94LUS0
	 TJuN3tmYlcv8xA/xeIXwzEVOUHa7BPRa1RgWm8GujVPx0Zw8ieqKLWivwHbJ2ZMEv9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701680;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Wwd+1akc+9m6GAzeQKhhdYGuxL3Km6Pnar76WQom0mI=;
	b=v8weiu+JPgMnuHC/L5oKgPZrwOsDNow2PkRwXfKkqiWMLSmDQ11fQksp3Dlfh0kZp81L
	 HvGYDTKcmfMMCVLAoNVEFu14u37XQjXKLDI/BXd++6I8c8eb7HPWqgGK3cLl8clPvQl11
	 Aps7S5O+u0GKEG65jugTdpooHLQfsvc2ADtNblIL03k5zGWOQeG3stRGXvOTnFAL5yu6T
	 0G9zP2ZpZSlm6jES26wRaKEgvq14EX5SDroFuCu93XeIU7Ze3ExPNmtx5JQqsf2pJg/My
	 FX2Ur2dER3Ar1+jSFuzDrp8/wJcEYhzEKoX4vUHp0bj/9s6Fji0YrSw1X5pAsdrKENA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="NWgIs3/1";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1792C606A834
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1792C606A834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NWgIs3/1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECFEF153B;
	Tue,  3 Nov 2026 02:27:54 -0800 (PST)
Received: from [10.57.66.79] (unknown [10.57.66.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA42E3F628;
	Tue,  3 Nov 2026 02:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793701678; bh=JGv4HbtoYJWryfsMptq2ido6QHmvaaQformtaau3Dsw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NWgIs3/1gxhtNnu3cixv1DpBk2C2ExTrY5PlfCOOBgx5xRVRpiHw1OyFvTrFQLOXF
	 hevzrOATtIPVEG584h3xOuNGBEnT8qVqSm10dkCZ52Xm2Y3Y4iZuV/uYJ/5BVz06XE
	 PmSpow+3T2VIV0qP3aeQKxKbFYWp7mrNGtVbw4E4=
Message-ID: <9841ba98-7f07-4d5d-8397-a07e22ba7f51@arm.com>
Date: Tue, 3 Nov 2026 10:27:54 +0000
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
Subject: Re: [PATCH 2/3] KVM: arm64: Skip empty IPA ranges when destroying
 stage-2 page-tables
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Raghavendra Rao Ananta <rananta@google.com>, Fuad Tabba <tabba@google.com>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-3-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261103084742.1302597-3-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Fuad

On 03/11/2026 08:47, Fuad Tabba wrote:
> The page-table walker steps over an empty entry in one go, but
> kvm_stage2_destroy() starts a new walk for every block-sized chunk of
> the IPA space. Tearing down a VM that requests a 52-bit IPA then takes
> 2^27 walks with 16K pages (2^22 with 4K), however little it maps.
> crosvm requests the host's limit.
> 

The patch looks good to me, in fact I was thinking about the same thing
yesterday while looking at the same code from a different angle, to move
to the vm_s2_ops abstraction.

> After destroying each chunk, look up the entry at its start and, if it
> is empty and larger than a chunk, skip its whole range. The lookup reads

Could we not lookup first before we destroy, that way we can avoid 
destroy walks ?

> fields that hold the mapping tree on a pKVM stage-2, so this depends on
> the previous patch keeping pKVM out of stage2_destroy_range(). For the
> same reason, call kvm_pgtable_stage2_destroy_range() directly rather
> than through KVM_PGT_FN().



> 
> Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   arch/arm64/kvm/mmu.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 42977cf8a7f5d..10b425a0141be 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1010,9 +1010,20 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
>   	u64 next;
>   
>   	do {
> +		kvm_pte_t pte;
> +		s8 level;
> +
>   		next = stage2_range_addr_end(addr, end);
> -		KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
> -							     next - addr);
> +		kvm_pgtable_stage2_destroy_range(pgt, addr, next - addr);

minor nit: Given the kvm_pgtable_stage2_destroy_range() is the only 
called from here, and this caller would benefit from the walk
information, would it make sense to return a hint back ? Not sure how
much of that is possible. We do this in the RMM, always return a hint
of the next possible address. Of course this is not that expensive
as the CCA case and could be dealt in a separate series.

> +
> +		/*
> +		 * The walk freed every table it emptied, so skipping an empty
> +		 * entry here doesn't leave anything behind.
> +		 */
> +		if (!kvm_pgtable_get_leaf(pgt, addr, &pte, &level, 0) && !pte &&
> +		    level < KVM_PGTABLE_MIN_BLOCK_LEVEL)
> +			next = __stage2_range_addr_end(addr, end, kvm_granule_size(level));

Suzuki


> +
>   		if (next != end)
>   			cond_resched();
>   	} while (addr = next, addr != end);

