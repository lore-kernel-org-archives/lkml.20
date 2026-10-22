Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674767;
	b=cSGLesfm6f7fcLrOajhMukh4dcr7xz3fIEcUvXjAfueeE/OCDMsZYCE47oKrZWk0sFo3
	 sJd++9MRIqDuExIQE/5L8FJzhQbX4yTZkQoEWVo10ezrVhvxznqQW+XhlmDtGXunUzSTx
	 jHAI0I+XL5kACZ6Oz5l5uavj5rhY682kZBfmTz85cMe16RNMOKrlxX+V4qIx8qk5qEAmI
	 HmlPfeAqkr1Hp9NvGGGsYqdEjbU4jYQ8lrBTz2w+VD3EFuAMthXHIX9KX5yknD4Pd++gb
	 L1A0xnm9Q4iP7c8f1JjZkxXxrzJ6tL/xke1vrQvhFU6zttKppLsWRcgB3XC/FvNiksw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674767;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bWeRZDGg5wgEIXQ2Q3Dog5Qq8cFNbVZQXYdNdnbIBxo=;
	b=QTVQKKks4/Zgrq09PS6ob1SzusP5VN0E+mGNcaC2xowPhso4TzhXsC+IpNyb/IcIRyK3
	 BfwaZI1JD5kjHIBvSka7mBZjgmRHedjGZAhlZZg4zjakVJgfSUXrYa8D0pZB0fA3+E0Su
	 uA2hkCyQM3H45G/acfL0kgqc3y6p3ZyvjN9uWYu6QriPcv3RtSfh181gqjQoUMkAZJKG6
	 0xpCeLPjk8s5w9ktkR9vptbPriPe3iN7Ian/fPQS+PNXABp4CZFPAJZvKrR5qoiI3zACH
	 ONVMCcbDittOJzMvAeJ5p4z4rSZlTgWT0kvQm699nOkZsrheTXHdxsqFatd9wu1jgvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YJ2pynxc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E156B606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E156B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YJ2pynxc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1B622C34;
	Thu, 22 Oct 2026 06:12:42 -0700 (PDT)
Received: from [10.0.129.145] (Suzukis-MBP.cambridge.arm.com [10.0.129.145])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 041FF3F673;
	Thu, 22 Oct 2026 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792674766; bh=D+1s1qGz4upJyB30Lz7rpPwzUA1TglIBkh6n3/mG9JE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YJ2pynxcE4vfMZ7QttDPP2sI6JxzDHVm9lVgFn+frTUeMehwdXSm7LUIPYh2pCght
	 VexFKqRbbXZx6Nr2WT7apXYQ1MW/rme9O4ZqnwBWnNTX1K6tYuOhC2deGdz5kdLAdT
	 Eji8POU3FseNWV3rSXDBS4I2vRpLVVcaFFFQHjOQ=
Message-ID: <a25c3ec1-ef58-4d70-b7c9-c1e213680541@arm.com>
Date: Thu, 22 Oct 2026 14:12:42 +0100
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
Subject: Re: [PATCH] KVM: arm64: Return on kvm_gmem_get_pfn() failure in
 gmem_abort()
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 Wei-Lin Chang <weilin.chang@arm.com>, Fuad Tabba <tabba@google.com>
References: <20261022123054.31729-1-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261022123054.31729-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/2026 13:30, Fuad Tabba wrote:
> The kvm-arm64/mmu-fixes-7.4 merge dropped the return from the
> kvm_gmem_get_pfn() error path in gmem_abort(). Both parents of the
> merge keep that return. On a failed kvm_gmem_get_pfn(), gmem_abort()
> then carries on with a zero pfn, and on a nested stage-2 it uses the
> mapping it has just freed.
> 
> Restore the return.
> 
> Fixes: 65f95b2874a15 ("Merge branch kvm-arm64/mmu-fixes-7.4 into kvmarm-master/next")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>      I went through the rest of the merge's conflict resolution with
>      git show --remerge-diff, and this is the only line it dropped.
> 
>   arch/arm64/kvm/mmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index a48f3f531e827..ba4fe58222ad5 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1802,6 +1802,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
>   						      s2vi.vma_pagesize, write_fault, exec_fault,
>   						      false);
>   		kfree(mapping);
> +		return ret;
>   	}
>   
>   	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))

Thanks for fixing this ! Looks correct to me.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

