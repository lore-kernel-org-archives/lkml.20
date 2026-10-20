Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492010;
	b=Qt/Mim5uiedrncNP1uGY4g3eqIZ1vpRnETKrLyjWX9Z0hSgQ5uyxF/vRjka24RST8KSA
	 NOx/7mc7PlyDA40Omkn8AdSt8+Zp5rcC2EW1j6pM04GyFSUZsdZbU9iWeDHUXLrZ5JQl0
	 Isua0MTleUFD5LWExnjlp+MUX4vOQwmZniInYCxD5t93FNmevSPAjLbY+Ei8MTLYMcZZv
	 xmpjo5pVazTjTQWRxJWMMitvmTGcO8BNJpdhpsqcAK1MOlGAfwnG6BsBiHaxr8Xx7z6bB
	 P5ICqufwz5YTKmGHfs0wLZK5XlElspCXD9CAwxmRq0iyY/7MfhLMtx5dt11AEreEP/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492010;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FMmthLcjHJSWSDaEG61XYBxevgxiYWHMZtyfEQ71iAA=;
	b=uz6R4W67xzpbnaWPPDb1zvFEeO2mjhNz8iwxZtxOTJF87+VPpqhUmF7Ztv0/JDZKLGfa
	 IUfftnaK84lbw0xHsmy0LCXmFcge4Z6+3jzHqy8D3vehB3mTDU/ar5aVEYED+cXjWHOUq
	 3Fa7Wjv7v3fV1T9D0pUMdeqzgtQQnW2fBE6iPxVZozFN5VNXaSwuD3CTJbU1vf0QyY0b1
	 pWYB+0fGZuD26000Av1mcXwfE8vZOjM4M/PAjB4NsIJG3IFaYyZCZnR+axazgVqKh7a/c
	 IKBnpO0wFiwdON+tuypZ2vh1podZb+EwXpsVB/7XsSFMmyKs+kHLrDEha2OLm3yx2BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="AnjaH/UO";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E6E606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E6E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AnjaH/UO
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91B401596;
	Tue, 20 Oct 2026 03:26:44 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 929773F7D8;
	Tue, 20 Oct 2026 03:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792492007; bh=rVr5DLobVsa4z0JmSriIanKvspEW4Of9gMiZNZhQaD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AnjaH/UObbjIJUBAp4DIogd1Jjoq/fdJhUB7eNFSHgCNSyD7A9S09eZn1NuRcpqKV
	 9sYDNkies/PjowKFbwitT6GuTbuwP63MqJc45Sowm5MArvs5U/BrgbUPKN80U0SRat
	 qUiqvccR2FnJmLFgX/CFZ/bd0xFSPWjwWgKgsZA4=
Date: Tue, 20 Oct 2026 11:26:35 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Ensure TLBs and I-cache are private to
 each vCPU in pKVM
Message-ID: <atdBzoLpddpwzKU4@e143914.arm.com>
References: <20261020074311.1873316-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020074311.1873316-1-fuad.tabba@linux.dev>

On Tue, Oct 20, 2026 at 08:43:11AM +0100, Fuad Tabba wrote:
> All vCPUs of a VM share its VMID, so KVM flushes a physical CPU's TLBs
> and I-cache for the VM whenever a different vCPU of that VM is loaded
> there. pKVM guests, protected or not, run on the hypervisor's stage-2
> and VMID, and the host doesn't flush for them. Nothing at EL2 flushes
> instead, so a vCPU can hit TLB and I-cache entries that another vCPU of
> the same VM left on that CPU.
> 
> Track at EL2 the last vCPU of each VM loaded on each CPU, and flush
> when it changes. EL2 can't allocate per-CPU memory for each VM, as the
> host does, so use one per-CPU array indexed by the VM's table entry.
> Reset the entry's slot on every CPU when a VM reserves it, so that a new
> VM starts with no last vCPU, whether the entry is unused or was left by
> a VM that was torn down.
> 
> Fixes: fce886a602073 ("KVM: arm64: Plumb the pKVM MMU in KVM")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
> Changes since v1 [1]:
>   - Dropped patch 1, which added a CPU number at EL2. The last vCPU is
>     now tracked in a per-CPU array indexed by VM table entry. (Marc)
>   - Moved the check from __pkvm_vcpu_load() to pkvm_load_hyp_vcpu().
>   - The array is unsigned int, initialised to UINT_MAX. (Vincent)
>   - Dropped Joey's Reviewed-by, since the patch changed.
> 
> Based on kvmarm/next (dd0bc00e3e920).
> 
> [1] https://lore.kernel.org/all/20261014125510.2928306-1-fuad.tabba@linux.dev/
> 
>  arch/arm64/kvm/hyp/nvhe/pkvm.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index ac020d0501d2e..1fc59229c8e86 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -38,6 +38,9 @@ unsigned int kvm_host_sve_max_vl;
>   */
>  static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
>  
> +/* Per VM table entry, the vcpu_idx of the last vCPU of that VM loaded on this CPU. */
> +static DEFINE_PER_CPU(unsigned int, last_vcpu_ran[KVM_MAX_PVMS]);
> +
>  static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
>  {
>  	vcpu->arch.hcr_el2 = HCR_GUEST_FLAGS;
> @@ -261,6 +264,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>  {
>  	struct pkvm_hyp_vcpu *hyp_vcpu = NULL;
>  	struct pkvm_hyp_vm *hyp_vm;
> +	unsigned int *last_ran;
>  
>  	/* Cannot load a new vcpu without putting the old one first. */
>  	if (__this_cpu_read(loaded_hyp_vcpu))
> @@ -290,8 +294,18 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>  unlock:
>  	hyp_spin_unlock(&vm_table_lock);
>  
> -	if (hyp_vcpu)
> -		__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
> +	if (!hyp_vcpu)
> +		return NULL;
> +
> +	__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
> +
> +	/* TLBs and I-cache are private to each vCPU, see vcpu_prepare_mmu(). */
> +	last_ran = this_cpu_ptr(&last_vcpu_ran[vm_handle_to_idx(handle)]);
> +	if (*last_ran != vcpu_idx) {
> +		__kvm_flush_cpu_context(hyp_vcpu->vcpu.arch.hw_mmu);
> +		*last_ran = vcpu_idx;
> +	}
> +
>  	return hyp_vcpu;
>  }
>  
> @@ -652,6 +666,7 @@ static int find_free_vm_table_entry(void)
>   */
>  static int allocate_vm_table_entry(void)
>  {
> +	unsigned int cpu;
>  	int idx;
>  
>  	hyp_assert_lock_held(&vm_table_lock);
> @@ -670,6 +685,9 @@ static int allocate_vm_table_entry(void)
>  
>  	vm_table[idx] = RESERVED_ENTRY;
>  
> +	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
> +		per_cpu(last_vcpu_ran[idx], cpu) = UINT_MAX;
> +
>  	return idx;
>  }
>  
> 
> base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
> -- 
> 2.47.3
> 
