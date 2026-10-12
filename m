Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7B7476CF9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807316; cv=none; b=XIjEkZtMqC55q5y0S5D8/1Imv/r8eF3Jng/ZkLbyAaeABfra+DdG+UVrsdGsnreQrDP595nf0KEEVOOfUlZ/hcS02zaYGI2maGFaqenAXz7HtzRYLYoceWbBdlQNv9/PYEduBNZ1GdSfNsQ4mxD0dVE7nYzQdX8RyNA2qUb/Dw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807316; c=relaxed/simple;
	bh=DMfzaODv+X4rVAl4WF+kEEoPKgzLJ8k6qC5EAIV4KlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjvbzIdwpA/+H1AxhPN47orpgSFP30YqunKFG5ET+1t7NAB/kczFTsm+DFnqEP+n2uKrIzVHFSsSKUq7kLQgavXUUBOBaS72mY9+m4GrlTJmgwFqxFvio7wA/U1nF/J/FwAFXsGr77ULonBJfBeDa/yVasI1h9bhgLqJmYmRzWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o1G7tYKA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o1G7tYKA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E417A1655;
	Mon, 12 Oct 2026 05:15:10 -0700 (PDT)
Received: from [10.0.128.125] (Suzukis-MBP.cambridge.arm.com [10.0.128.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE4013F66F;
	Mon, 12 Oct 2026 05:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791807314; bh=DMfzaODv+X4rVAl4WF+kEEoPKgzLJ8k6qC5EAIV4KlE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o1G7tYKAGZ8ZUOIwIMmHupcl8h8MbxdF5P7ZnXLQuJfQB61fuKwkwK3TZmO6C28+N
	 SbYuqfBg6rLwPYEE4bDpmIioMu2kDIHPUhQ9ZwHQlrvSnf+FbOofNqaEPjIQNkYSSX
	 T1ISHippehbYzUvxDUu/A6KZveqt9lew5OOG1nss=
Message-ID: <9cae3f68-1e6a-41e3-a092-39a662e26e6c@arm.com>
Date: Mon, 12 Oct 2026 13:15:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] KVM: arm64: Validate the host-provided vgic model
 in pKVM
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, maz@kernel.org, oupton@kernel.org,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
 seiden@linux.ibm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
 vdonnefort@google.com, qperret@google.com, Sascha.Bischoff@arm.com,
 steven.price@arm.com, tabba@google.com
References: <20261011143648.211337-1-fuad.tabba@linux.dev>
 <20261011143648.211337-4-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261011143648.211337-4-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2026 15:36, Fuad Tabba wrote:
> EL2 copies vgic_model from the host's struct kvm unchecked, and the nVHE
> world switch dispatches on it with no cpucap guard. A host writing
> KVM_DEV_TYPE_ARM_VGIC_V5 makes EL2 access GICv5 CPU interface registers
> that are UNDEFINED without FEAT_GCIE, and panics the hypervisor on any
> GICv3 machine.
> 
> Accept only GICv3, the one model pKVM supports, and force anything else
> to 0, as for a VM with no in-kernel irqchip. EL2 reads the model only to
> pick the GICv5 world switch and to emulate GICv3 CPU interface accesses,
> and the host's own copy is left alone.
> 
> Fixes: 9b8e3d4ca0e73 ("KVM: arm64: gic-v5: Implement GICv5 load/put and save/restore")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   arch/arm64/kvm/hyp/nvhe/pkvm.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 459bd9eb7e4bc..a9d0e94709199 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -340,13 +340,19 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
>   {
>   	struct kvm *kvm = &hyp_vm->kvm;
>   	unsigned long host_arch_flags = READ_ONCE(host_kvm->arch.flags);
> +	u32 vgic_model = READ_ONCE(host_kvm->arch.vgic.vgic_model);
>   	DECLARE_BITMAP(allowed_features, KVM_VCPU_MAX_FEATURES);
>   
>   	/* CTR_EL0 is always under host control, even for protected VMs. */
>   	hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
>   
> -	/* Preserve the vgic model so that GICv3 emulation works */
> -	hyp_vm->kvm.arch.vgic.vgic_model = host_kvm->arch.vgic.vgic_model;
> +	/*
> +	 * pKVM runs only GICv3. Anything else becomes 0, the model of a VM
> +	 * with no in-kernel irqchip, which keeps EL2 off the GICv5 registers.
> +	 */
> +	if (vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
> +		vgic_model = 0;



> +	hyp_vm->kvm.arch.vgic.vgic_model = vgic_model;

0 is not a valid KVM_DEV_TYPE_*, so this looks good to me.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


