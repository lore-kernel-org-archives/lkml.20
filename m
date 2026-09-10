Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CFE34DCE4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789018445; cv=none; b=dRkUetq7RzwaKtKuI7z88Y0FR52kcs1eS4gfCYrumApoeHaB0VIOo85RlgPA3EDH9LdlMq2PJqnqkko2QjVL8v/QMbe0peJFvUPQomqS580jpGGgz1UftSSFp5hEtbbmYnu2PN3RuCG4E7SvR0VYkxQPKNEodLkzMV4t1ilfaAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789018445; c=relaxed/simple;
	bh=ZIT1JUns1UwkE1FUePimxNg9u/6VCWQdnkHihI+FCVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPRF1fF0fSPsRtSoWUL1k742GdJho4bmZtuBhWgxdiTaZrBuN9hTwNXaqQAcAHjg24vsJsIfqtfRx7DAD9mGjcPrKMe90HUFQZxkNUh9h3ptDdjpiQt3TAfLnMUPsmHmVKoUoOVcUrPagmEmfbQzQuxlpIoU+Gbv4/I8wfrhm7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RRDMxddL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=By65bAwa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRDMxddL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="By65bAwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789018441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmfagZcaovN6T79eUTiT4gf4vwdGinNeI+/TCO/n5fs=;
	b=RRDMxddL+/u0n39oBB63RcPiRYDWYrwrVwbTAjPTrJsSEw2iVwukO05iA92ou/jiweuR+U
	J08/Wqd/E7Zwtp/Qh2nyc8KctVOWNIlXInkxotoT4Gr36swDzO6mvZ3dJkH1VRTvYzcTw7
	8JoOIOi8IjXG/t53QtBVuefNKRZ5Yi0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-MR18Fgz_NU-PkKjdnOXW_A-1; Thu, 10 Sep 2026 01:33:59 -0400
X-MC-Unique: MR18Fgz_NU-PkKjdnOXW_A-1
X-Mimecast-MFC-AGG-ID: MR18Fgz_NU-PkKjdnOXW_A_1789018438
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso4971019a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789018438; x=1789623238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmfagZcaovN6T79eUTiT4gf4vwdGinNeI+/TCO/n5fs=;
        b=By65bAwaB7Nr05N0E1oeCQzal40QtX+j48sSxBTsRmgNPvw01MspurflNXt6kIk2Yq
         RDIU3KFmFsAYaqPBwYMCzdNTdnFR7sDKSn5JZ2DH1Rgd9jYAVo7tYdQANoGz8F7eYK8D
         kVaRWB4Fw6DeGqFIY6jSWORzehKVSg5GoqfFiZEnRsQfWwFICYxjS9XbTWXnAL61MMgv
         uMubXONPOECrDXpH/ZoJ04qAiq2ZoOHNQOT4tmIiC64vXjC2mdNQV6BeHkDevbCuaFyw
         SD306A/9LMQ6si1fg5QHf34D0/gwMnymG9nu2GXqSSvNJcDALFX0ppMsevXC7GbdekLn
         K+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789018438; x=1789623238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmfagZcaovN6T79eUTiT4gf4vwdGinNeI+/TCO/n5fs=;
        b=mw5ZKpeLzjJn7hHcmGfruI6y3pnKafepYXlrHp1Hfe1UxDeIydufA45O6Pbp45zlxW
         rrhrbZ3p/PeELj74/vm4S4g1BynveuiP95H0ChcvDfSRxeE8DEIQQOC0THPGEhlONagY
         2LMxrgTQRNVkLZnTPdwS56kHEjUoTmn6lGgjnQHtHLF++fnF9W7BgeeQh3rOmHf2zN/p
         T8SkHsRn146qpLVXCcc8i7SZhUXoGDEz/HhcriHzU+J6S1FjQrNYkZM4dhlM80fyhF04
         sT77NEVqHFs/UAFRTUwVqdTBl/MTGQ8Y9TXJDciprOay/7gpQDf0/fXUV67TjXZbF0+D
         da6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjCSdcx4I0ODBaNx/998BS3xZcr82G763WUz4arRi4rvK/4KTMZytR1qPkIEiwm+p7OtjQI9WzrLMPlns=@vger.kernel.org
X-Gm-Message-State: AFuF++kq0YnxA6O+HDJmHAjmTwmLsdcO/X8NxoD6Mncag1LIfIebcrej
	tpMbbqUoBhkytvAQYYv6SeYgWXZUSDNzqwro1IFQRP5vTOzcyofzrBT3GHUiy6/RzZL6od3ty+w
	XemSM8ZwxX1P7znpe23iJZsjSVkWVrQ1rRHaQaTOwA41RKrgf7aeJ39V3XI7gMIrrtQ==
X-Gm-Gg: AYBFou1u+twFR5pzkooFQmVNOFKsYqF5XLuPrjx7lUrEUShVwu5g2Ian5S4oOSiAVRw
	civv5AxF0/UNqDnVyB8nd4LHh3aBBwX/ljOzATTT44CktIfiDrkpKM4ep+l8VzBBwNNLLSFzdRg
	ziJBf9t6FNkbjGRIksMZcSTmh+/HDBfHfAD/XExYmvHgM0gIO1lM0PJXM+mQIMUg05qacmqCkHb
	oMCjsDF3OU+lIRtToymVDgsr9vcmS0AmXqC0/evhnQLdUvxJp0BR2KAAoKy7kKQVx7UJ27hfSo3
	jrG+H5BxWhEIuRlnzSQ73bajoHX8C3frxdo9sh/lVFzzVAF6AxQH4kbqWaIUizCitjSNpvHDIhm
	3YsGASmHvoIdMpGiPRUQXL+wo3QHrnu6DwDbLesYSIw==
X-Received: by 2002:a17:902:ef44:b0:2db:5f8c:b81c with SMTP id d9443c01a7336-2dd07dc594cmr84179025ad.19.1789018438213;
        Wed, 09 Sep 2026 22:33:58 -0700 (PDT)
X-Received: by 2002:a17:902:ef44:b0:2db:5f8c:b81c with SMTP id d9443c01a7336-2dd07dc594cmr84178265ad.19.1789018437476;
        Wed, 09 Sep 2026 22:33:57 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14aeaf74sm82803575ad.81.2026.09.09.22.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 22:33:56 -0700 (PDT)
Message-ID: <09f1d245-2104-4ca2-93af-a004c44b4161@redhat.com>
Date: Thu, 10 Sep 2026 15:33:45 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 05/20] KVM: arm64: Add vcpu load/put call backs for
 flavors
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-6-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260908162223.1683432-6-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Suzuki,

On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
> Add VM flavor specific handlers for VCPU load/put, in an effort to make it
> easier to follow the code.
> 
> Based on a patch by Marc Zyngier
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h |   6 ++
>   arch/arm64/kvm/arm.c              | 156 ++++++++++++++++++++++--------
>   2 files changed, 123 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index d0dccc9ad6aa8..b2e99c5cb1cd3 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -150,6 +150,11 @@ struct kvm_vmid {
>   	atomic64_t id;
>   };
>   
> +struct kvm_vcpu_ops {
> +	void (*vcpu_load)(struct kvm_vcpu *vcpu, int cpu);
> +	void (*vcpu_put)(struct kvm_vcpu *vcpu);
> +};
> +

struct kvm_vcpu::cpu has been set to 'cpu' before vcpu_load() is called in
kvm_arch_vcpu_load(), so we needn't explicitly pass @cpu to vcpu_load()?

>   struct kvm_s2_mmu {
>   	struct kvm_vmid vmid;
>   
> @@ -854,6 +859,7 @@ struct vncr_tlb;
>   
>   struct kvm_vcpu_arch {
>   	struct kvm_cpu_context ctxt;
> +	const struct kvm_vcpu_ops *vcpu_ops;
>   

I think this would be a field of 'struct kvm_arch' if all vCPUs inside a VM
have same vCPU operations.

>   	/*
>   	 * Guest floating point state
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 51fc651267157..9af3bbb2f8c24 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -74,6 +74,8 @@ struct kvm_ioctl_cap_map {
>   	long ext;
>   };
>   
> +static const struct kvm_vcpu_ops *arm64_vcpu_ops[VM_FLAVOR_MAX];
> +
>   /* Make KVM_CAP_NR_VCPUS the reference for features we always supported */
>   #define KVM_CAP_ARM_BASIC	KVM_CAP_NR_VCPUS
>   
> @@ -569,6 +571,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>   	mutex_unlock(&vcpu->mutex);
>   #endif
>   
> +	vcpu->arch.vcpu_ops = arm64_vcpu_ops[vcpu->kvm->arch.vm_flavor];
> +
>   	/* Force users to call KVM_ARM_VCPU_INIT */
>   	vcpu_clear_flag(vcpu, VCPU_INITIALIZED);
>   
> @@ -738,36 +742,72 @@ static void vcpu_load_pvtime(struct kvm_vcpu *vcpu)
>   		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>   }
>   
> +static void vhe_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> +{
> +	vcpu_prepare_mmu(vcpu);
> +	/*
> +	 * The timer must be loaded before the vgic to correctly set up physical
> +	 * interrupt deactivation in nested state (e.g. timer interrupt).
> +	 */
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	kvm_vcpu_load_debug(vcpu);
> +	kvm_vcpu_load_fgt(vcpu);
> +	kvm_vcpu_load_vhe(vcpu);
> +	kvm_arch_vcpu_load_fp(vcpu);
> +	kvm_vcpu_pmu_restore_guest(vcpu);
> +
> +	vcpu_load_pvtime(vcpu);
> +	vcpu_set_wfx_traps(vcpu);
> +	vcpu_set_pauth_traps(vcpu);
> +}
> +
> +static void nvhe_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> +{
> +	vcpu_prepare_mmu(vcpu);
> +	/*
> +	 * The timer must be loaded before the vgic to correctly set up physical
> +	 * interrupt deactivation in nested state (e.g. timer interrupt).
> +	 */
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	kvm_vcpu_load_debug(vcpu);
> +	kvm_vcpu_load_fgt(vcpu);
> +	kvm_arch_vcpu_load_fp(vcpu);
> +	kvm_vcpu_pmu_restore_guest(vcpu);
> +
> +	vcpu_load_pvtime(vcpu);
> +	vcpu_set_wfx_traps(vcpu);
> +	vcpu_set_pauth_traps(vcpu);
> +}
> +
> +static void pkvm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> +{
> +	/*
> +	 * The timer must be loaded before the vgic to correctly set up physical
> +	 * interrupt deactivation in nested state (e.g. timer interrupt).
> +	 */
> +	kvm_timer_vcpu_load(vcpu);
> +	kvm_vgic_load(vcpu);
> +	kvm_vcpu_load_debug(vcpu);
> +	kvm_vcpu_load_fgt(vcpu);
> +	kvm_arch_vcpu_load_fp(vcpu);
> +	kvm_vcpu_pmu_restore_guest(vcpu);
> +
> +	vcpu_load_pvtime(vcpu);
> +	vcpu_set_wfx_traps(vcpu);

It seems vcpu_set_pauth_traps(vcpu) has been missed here?

> +
> +	kvm_call_hyp_nvhe(__pkvm_vcpu_load,
> +			  vcpu->kvm->arch.pkvm.handle,
> +			  vcpu->vcpu_idx, vcpu->arch.hcr_el2);
> +	kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
> +		     &vcpu->arch.vgic_cpu.vgic_v3);
> +}
> +
>   void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   {
> -	if (!is_protected_kvm_enabled())
> -		vcpu_prepare_mmu(vcpu);
> -
>   	vcpu->cpu = cpu;
> -	/*
> -	 * The timer must be loaded before the vgic to correctly set up physical
> -	 * interrupt deactivation in nested state (e.g. timer interrupt).
> -	 */
> -	kvm_timer_vcpu_load(vcpu);
> -	kvm_vgic_load(vcpu);
> -	kvm_vcpu_load_debug(vcpu);
> -	kvm_vcpu_load_fgt(vcpu);
> -	if (has_vhe())
> -		kvm_vcpu_load_vhe(vcpu);
> -	kvm_arch_vcpu_load_fp(vcpu);
> -	kvm_vcpu_pmu_restore_guest(vcpu);
> -
> -	vcpu_load_pvtime(vcpu);
> -	vcpu_set_wfx_traps(vcpu);
> -	vcpu_set_pauth_traps(vcpu);
> -
> -	if (is_protected_kvm_enabled()) {
> -		kvm_call_hyp_nvhe(__pkvm_vcpu_load,
> -				  vcpu->kvm->arch.pkvm.handle,
> -				  vcpu->vcpu_idx, vcpu->arch.hcr_el2);
> -		kvm_call_hyp(__vgic_v3_restore_vmcr_aprs,
> -			     &vcpu->arch.vgic_cpu.vgic_v3);
> -	}
> +	vcpu->arch.vcpu_ops->vcpu_load(vcpu, cpu);
>   
>   	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
>   		vcpu_set_on_unsupported_cpu(vcpu);
> @@ -775,28 +815,44 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   	vcpu->arch.pid = pid_nr(vcpu->pid);
>   }
>   
> -void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
> +static void vhe_vcpu_put(struct kvm_vcpu *vcpu)
>   {
> -	if (is_protected_kvm_enabled()) {
> -		kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
> -		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
> -
> -		/* __pkvm_vcpu_put implies a sync of the state */
> -		if (!kvm_vm_is_protected(vcpu->kvm))
> -			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> -	}
> -
>   	kvm_vcpu_put_debug(vcpu);
>   	kvm_arch_vcpu_put_fp(vcpu);
> -	if (has_vhe())
> -		kvm_vcpu_put_vhe(vcpu);
> +	kvm_vcpu_put_vhe(vcpu);
>   	kvm_timer_vcpu_put(vcpu);
>   	kvm_vgic_put(vcpu);
>   	kvm_vcpu_pmu_restore_host(vcpu);
>   	if (vcpu_has_nv(vcpu))
>   		kvm_vcpu_put_hw_mmu(vcpu);
>   	kvm_arm_vmid_clear_active();
> +}
>   
> +static void nvhe_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	kvm_vcpu_put_debug(vcpu);
> +	kvm_arch_vcpu_put_fp(vcpu);
> +	kvm_timer_vcpu_put(vcpu);
> +	kvm_vgic_put(vcpu);
> +	kvm_vcpu_pmu_restore_host(vcpu);
> +	kvm_arm_vmid_clear_active();
> +}
> +
> +static void pkvm_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
> +	kvm_call_hyp_nvhe(__pkvm_vcpu_put);
> +
> +	/* __pkvm_vcpu_put implies a sync of the state */
> +	if (!kvm_vm_is_protected(vcpu->kvm))
> +		vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> +
> +	nvhe_vcpu_put(vcpu);
> +}
> +
> +void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
> +{
> +	vcpu->arch.vcpu_ops->vcpu_put(vcpu);
>   	vcpu_clear_on_unsupported_cpu(vcpu);
>   	vcpu->cpu = -1;
>   }
> @@ -2136,6 +2192,28 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>   	}
>   }
>   
> +static const struct kvm_vcpu_ops vhe_vcpu_ops = {
> +	.vcpu_load = vhe_vcpu_load,
> +	.vcpu_put = vhe_vcpu_put,
> +};
> +
> +static const struct kvm_vcpu_ops nvhe_vcpu_ops = {
> +	.vcpu_load = nvhe_vcpu_load,
> +	.vcpu_put = nvhe_vcpu_put,
> +};
> +
> +static const struct kvm_vcpu_ops pkvm_vcpu_ops = {
> +	.vcpu_load = pkvm_vcpu_load,
> +	.vcpu_put = pkvm_vcpu_put,
> +};
> +
> +static const struct kvm_vcpu_ops *arm64_vcpu_ops[] = {
> +	[VM_VHE] = &vhe_vcpu_ops,
> +	[VM_NVHE] = &nvhe_vcpu_ops,
> +	[VM_PKVM] = &pkvm_vcpu_ops,
> +	[VM_PROTECTED_PKVM] = &pkvm_vcpu_ops,
> +};
> +

We may avoid the variables {vhe, nvhe, pkvm}_vcpu_ops which are used for once:

static const struct kvm_vcpu_ops kvm_vcpu_ops[] = {
	[VM_VHE]            = { vhe_vcpu_load,  vhe_vcpu_put  },
	[VM_NVHE]           = { nvhe_vcpu_load, nvhe_vcpu_put },
	[VM_PKVM]           = { pkvm_vcpu_load, pkvm_vcpu_put },
	[VM_PROTECTED_PKVM] = { pkvm_vcpu_load, pkvm_vcpu_put },
};

>   static unsigned long nvhe_percpu_size(void)
>   {
>   	return (unsigned long)CHOOSE_NVHE_SYM(__per_cpu_end) -

Thanks,
Gavin

