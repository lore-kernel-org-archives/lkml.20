Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0936E46C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789012824; cv=none; b=tq3SdpmM06PGQOeNMBP81QDcP09OLG6TR6GZuqhejeCkTEuR1y4JtjqUicCc7tDGCfcDwgn7XEqsm9BmOYg5XhgQH/+7XlksAqtNagkj+77Tq+Z6pAer/Rh/i904AB1Eni8o6HsmAgD4ZJpcm3ujAZUcJhS5VYeq6dKp/sPpHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789012824; c=relaxed/simple;
	bh=pBqbGbHdUjToyCWJUAd59537eBPwlH2Z0Zl7h1xavv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqAg+3u1S1etbX5f52AtQYwVRK11VAdYsajh+YkNtBRaNCiOnWYu36N01gE99gPiDHiNRhWMcOMaCRxisS+XhF1RiqUjrHmuqTPzEzAJaOLxNT+VhzZ65/s+htcQmThkF+LcDmo45nOb+tpWPM2pej3YXAuHrBbSp7urk7qczhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HHeQhTIk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GnT5ZYIS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HHeQhTIk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GnT5ZYIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789012822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4MZLtSduN3n4DstPQZClxNsj5BwxMrrkDzTkcMmPEOA=;
	b=HHeQhTIkmuESr+NZ+XPjh4G34hLdj1MTWpnRxq32YTmByWxGJWnwC7pcMXspxadyExJIj9
	s+VX0lwKbg2DIBZQp6GztmQ9+NRu/nAuMGi2RZwYWqyO/LmqChsIo2YOEfDhcq5FHZ8V4r
	5zN2I4m98SRAD9ClaZm6xgzsP59zakM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-2uPN0kTFNkiRpnYRTBDK8A-1; Thu, 10 Sep 2026 00:00:20 -0400
X-MC-Unique: 2uPN0kTFNkiRpnYRTBDK8A-1
X-Mimecast-MFC-AGG-ID: 2uPN0kTFNkiRpnYRTBDK8A_1789012819
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d94a158dc8so110304035ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789012819; x=1789617619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4MZLtSduN3n4DstPQZClxNsj5BwxMrrkDzTkcMmPEOA=;
        b=GnT5ZYISUa8mexK6QBmcugyiK5TQmKdg5atq5PvKR9vfwUpTPHcXBT/a74MEbsWQXx
         vnb1TM/YzNrJ4j6Qdahk57c1uaMclzC0WbogeOTzx0B9FNXGXQFiNXR2WWUBUNoJz1um
         yi1/5/7bzwJyAH+OGHYSx7l4IZu6SPiAaVWpvovzaP1Ak1WyKE/bXKtGQRGfWYvlF562
         GEsZNZTBDR+cmtBQjZfAJQjfNALl0IyEnMuxGwtFwWP+tAxhNItTUVZiVAIxj4nEtbjA
         bxEFacbAPJKLUyHvMjEDNxbhZaNhWkH5IHOMIqU+AxNI8pcGDrJnaff7FsqTiXLXfEmx
         3kZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789012819; x=1789617619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MZLtSduN3n4DstPQZClxNsj5BwxMrrkDzTkcMmPEOA=;
        b=eW0oJjOgkbEmtiWvQ0EsKDhQHIeR/hPNsZpyw+sgM+2c4K1FCeol1olAoDNrYfyyPL
         QHmdxcOt1uSimFPPdHmSb/yHAbfKGN6KE/NXJhFSwMQPfeYAOmgBRcXHm0ZKylxgrLIA
         mo9G2sYo4LUXd5xE30DRXaEcF69pJLwue9hz48j2EQK8btRqtqFPGEsJ9ko80ytaNInJ
         dxLNWMxZOh9HeERrYG9SO7JU+6WrlJjdsm4VM1IDKbG+DlvC4xF5TqoTKc7/gsfm6nsb
         2XITPk66CpIpJ0CklicFlSJD9pjeJd6X9SfLv7atNXMGECrMM8kCJexaWL3351zEomjM
         LH/g==
X-Forwarded-Encrypted: i=1; AKwUvBz/eBoJTYTREIuPqyUKSqtHPizoy6B8NwX0vN+Du0B1ms28lFYB2yiO5EktDu9ky3JpCEWay7E5M1AluH4=@vger.kernel.org
X-Gm-Message-State: AFuF++kJHYkrpEl4lnRK24T75H57midoSL5Sp8GKvtAs9ZBAQfWFiaw3
	dZ6ca8BUqc3F8/DI38GkZQ0Zha+egvUatoV9tHCHfNPOgx17E9SYXgJQF5V3E5RCxchRU7XdCC9
	dLE1AEYV1oMPtqzJMu+WNd7PzOUlkPv1tqXHhkiW7x6XrrX6YKGGoLtY9TtvCDfB5cA4ixXrW/w
	==
X-Gm-Gg: AYBFou08+c0mKBqFI4NA8A9o1Ljd8Lc2SSjSjPxWJiSDhdNGmjFo7UGk4M/f4DvJcr5
	mmzrlLG9zWlIZ6FEJiSVxna0aoYjZ5aPO3xlXHGYrGycZOho01apnpGNxMqe7IP+kpcKlBaZOw+
	oNd6Cz5gcWwDgciDW3bcyORY7WQYXTUOHT0iSXIFgWFc3GTW/0OSmufmO8iKyQDrrHkU9rxPzXj
	6k00FNEpPpYW68fGGyPsPwXmrDACI9XlOsxew1JUuGli1pQmE+X1tJoPL8Gq2oNYujBO1qr/4EL
	WxrNfweCf+dnSgMH9sOOMPYtdsKs+oMzeHP21KgwdPtef8epa0h4kWJEwHfRcbToNg90pcQHXiy
	iYCeLO50sxnoluEfGEMYxndboB7CXCWdfOtEnwCns0Q==
X-Received: by 2002:a17:902:ef44:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2db1259d1f8mr542225305ad.14.1789012819328;
        Wed, 09 Sep 2026 21:00:19 -0700 (PDT)
X-Received: by 2002:a17:902:ef44:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2db1259d1f8mr542224465ad.14.1789012818867;
        Wed, 09 Sep 2026 21:00:18 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149ccf2esm82468805ad.73.2026.09.09.21.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 21:00:18 -0700 (PDT)
Message-ID: <a0c5c373-b5c2-4ad2-9e53-ede58c392972@redhat.com>
Date: Thu, 10 Sep 2026 14:00:06 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 04/20] KVM: arm64: Refactor the vcpu_load to allow for
 VM specific callbacks
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
 <20260908162223.1683432-5-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260908162223.1683432-5-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Suzuki,

On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
> Based on a work by Marc Zyngier
> 
> To keep the VCPU load/put handling cleaner with the different kinds of VM types,
> we are about to introduce VM specific callbacks to do just the right thing.
> In preparation for that, make some refactoring to add the change easier.
> 
> No functional changes intended.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 46 +++++++++++++++++++++++++++-----------------
>   1 file changed, 28 insertions(+), 18 deletions(-)
> 

Nitpicks below, none of them are introduced by this patch itself. In either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 67f1ff9bc4fbe..51fc651267157 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -683,14 +683,11 @@ static bool kvm_vcpu_should_clear_twe(struct kvm_vcpu *vcpu)
>   	return single_task_running();
>   }
>   
> -void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> +static void vcpu_prepare_mmu(struct kvm_vcpu *vcpu)
>   {
>   	struct kvm_s2_mmu *mmu;
>   	int *last_ran;
>   
> -	if (is_protected_kvm_enabled())
> -		goto nommu;
> -
>   	if (vcpu_has_nv(vcpu))
>   		kvm_vcpu_load_hw_mmu(vcpu);
>   
> @@ -720,10 +717,33 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   		kvm_call_hyp(__kvm_flush_cpu_context, mmu);
>   		*last_ran = vcpu->vcpu_idx;
>   	}
> +}
> +
> +static void vcpu_set_wfx_traps(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_vcpu_should_clear_twe(vcpu))
> +		vcpu->arch.hcr_el2 &= ~HCR_TWE;
> +	else
> +		vcpu->arch.hcr_el2 |= HCR_TWE;
> +
> +	if (kvm_vcpu_should_clear_twi(vcpu))
> +		vcpu->arch.hcr_el2 &= ~HCR_TWI;
> +	else
> +		vcpu->arch.hcr_el2 |= HCR_TWI;
> +}
> +

It seems FIELD_MODIFY() can be applied here if no visible constraints exist:

	FIELD_MODIFY(HCR_TWE, vcpu->arch.hcr_el2, !kvm_vcpu_should_clear_twe(vcpu));
	FIELD_MODIFY(HCR_TWI, vcpu->arch.hcr_el2, !kvm_vcpu_should_clear_twi(vcpu));

> +static void vcpu_load_pvtime(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
> +		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
> +}
> +
> +void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> +{
> +	if (!is_protected_kvm_enabled())
> +		vcpu_prepare_mmu(vcpu);
>  

I think we probably try to depend on kvm->arch.vm_flavor instead
of !is_protected_kvm_enabled().

	struct kvm *kvm = vcpu->kvm;

	if (kvm_vm_is_protected(kvm) || kvm_vm_flavor_eq(kvm, VM_PKVM))
		vcpu_prepare_mmu(vcpu);
  
> -nommu:
>   	vcpu->cpu = cpu;
> -
>   	/*
>   	 * The timer must be loaded before the vgic to correctly set up physical
>   	 * interrupt deactivation in nested state (e.g. timer interrupt).
> @@ -736,19 +756,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   		kvm_vcpu_load_vhe(vcpu);
>   	kvm_arch_vcpu_load_fp(vcpu);
>   	kvm_vcpu_pmu_restore_guest(vcpu);
> -	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
> -		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
> -
> -	if (kvm_vcpu_should_clear_twe(vcpu))
> -		vcpu->arch.hcr_el2 &= ~HCR_TWE;
> -	else
> -		vcpu->arch.hcr_el2 |= HCR_TWE;
> -
> -	if (kvm_vcpu_should_clear_twi(vcpu))
> -		vcpu->arch.hcr_el2 &= ~HCR_TWI;
> -	else
> -		vcpu->arch.hcr_el2 |= HCR_TWI;
>   
> +	vcpu_load_pvtime(vcpu);
> +	vcpu_set_wfx_traps(vcpu);
>   	vcpu_set_pauth_traps(vcpu);
>   
>   	if (is_protected_kvm_enabled()) {

Thanks,
Gavin

