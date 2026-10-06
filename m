Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA8735DA47
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262700; cv=none; b=m1MI/+75AZZgmmMSP4CE5PXqwgry36Sjox+GH/RrxALPKkT3JUaErO0rGgNNzSqiRom5bTHwLAubzUoy6bQ4lKwvS3Z2bTahTH3Rn7h7pPqjYzX44XWagyDxgxSk3hYs62sDhMbidGD+ne717sLXBdJ6+hU2yacvKud2sqvSl+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262700; c=relaxed/simple;
	bh=6OM9wWHapIU6KE4mRyTPlvJHLyN9Y0AIPIvU/nV26Uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aiWwWef24BU6M3kXvVpSuQPwR8Jh5LNvzvPhUnSV3nscy4G74h27d3M2jEwpFSC9o1cttfMDwdn32BZR7MHEXfu7zA1J3crkjlfw0RLWpRTtKNFVzchV5ykucAlnUVjyDyLBpxWd1Olq2e81x9iN+DiteX2TxfqaTzKcm8/jHuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VQq8jpJf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rq7eK0gO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VQq8jpJf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rq7eK0gO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791262697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xmwhtVAOTYHUjmcRz00UOuxKG7KIIGgmFuc28vNIW8=;
	b=VQq8jpJfEOzWvQUNrshD2pmtd92ou2oNAxhZFY/n+OfNZ6XJFNBhcxKcWfsVmsssaHXb96
	jyJbavZNu4+eRygGJ97VFOldoN7HK0xP/tuk1MFtRQd1D0OEJMAs868w/qZpS4iC7aktMD
	HAoi39kB3Bol8juMj+vN/4WVvHTH+4Q=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-AioQ3EdVPjixBpUMhouwyg-1; Tue, 06 Oct 2026 00:58:16 -0400
X-MC-Unique: AioQ3EdVPjixBpUMhouwyg-1
X-Mimecast-MFC-AGG-ID: AioQ3EdVPjixBpUMhouwyg_1791262695
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so2463306a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791262695; x=1791867495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xmwhtVAOTYHUjmcRz00UOuxKG7KIIGgmFuc28vNIW8=;
        b=rq7eK0gOEmJf0AO0RNWtPt6T1+BKb5iFZfuyUvzd+fmfj6Giier8SezLS+OzwaCLm6
         WXrDd649FPhQd/v6a8fqH65z+jXjlEfu1Is/sMxmSC7qULT+4b3bhscErjzWcu7DRCtH
         k2sM2pBUb4f8VXNiuL2IfS1o82lREX6VLdJzatSOfc9IU3P44uXPRIC+Z89EeTqDMugN
         OJHZAmvNFuxx0i8weVhJw6PYACpUDm196Rgx3krjVT8Tg0Ss0y9rfc1NaRA68x6BZsk/
         eyxefwpINv/QIffGiYJfZwUna3VcrUOoysvjuIUR4E4caU9M0Qcm+cQxUUvA3x6LUBxF
         PMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262695; x=1791867495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xmwhtVAOTYHUjmcRz00UOuxKG7KIIGgmFuc28vNIW8=;
        b=aVgFYMdcs4uwo46lb9vMwegO9JLKnlAD2e6MdBvOg7IYN69hnXXYwZMDovxVTrUd+U
         WvKIBFJl8FJu7m5D1bhTFAM1Ok3kDq9I0SvIyfv6cc3gXzvlSUaaJhKPrPxIi3PsOzSE
         9XlfT2fIaW5YcjRPAJowcbBjuQDvZ7IPKTRTmK/JZphTI3bg6oPAeRDZHImDX73cXa3p
         fCoJPXR0qA4YMvUKEVzwikkP8AUuqUbJVXAQUIbu7aRmNmHHK0IR3z7DtchbnnuUDQrX
         mKchvxLo3qlPbq+MgTtWDJQgLPI46pAyTySUNlMDy93+qTA/TIENZhlyk5zUp4vc4FSa
         Hvrw==
X-Forwarded-Encrypted: i=1; AKwUvByqaIMX8UfUgI5jI/C/H0SQWqmB2TpvcyC3Fyz57Gd/F3oM2lVSeAJcAGFv49QHKwYzBuIKqK2uGWWHnRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuRhCoS4AvuVxO3QBzI4k++LU3lDWwRl1n05zQuEU6HW/6TlR8
	iz3ocRlPkmalIXTmWA9odPFvGh5IhPFh1/82xEqTyLvuOVBBrd5DaEI2//CvfKI0UJO71GhlAsv
	E1OId6uf8qgAh7dpe9EjjjLBUicbhRx9nq8hXv0z0p9E0FAzFc/bRgzIj45sBtrHpqGALMXAWJw
	==
X-Gm-Gg: AYBFou3cJmt1edPnk8DYRXZ00d/A9PeDVg6Cr51dZZ+PfM0j7HboYLXfag2b5UERXAv
	J3DHI2aXq1mIaYLScD2LuwNtgJqXLk1u1luXVoeXnBpl5aaKV8hHLufjshdKr6E0Hre7Jt8Tp9m
	QM8/czRSQMUwHOCvVzGT3QifGn0PwHFwRE27Y9qXQySH2nFAFET1ZNcpWqeF3gcLW+rfbsblpdi
	ElBFxJyyV3crMj8YnZLPS3Lo1PQYqBWAZu529YHg2IWjP1+h0yF7nc1CDhTVK9AoMB5tWKehhJn
	zqPnVUOXZbPg2yF3VvYp3eqzA3CVZgryKVAR5+54vlauVY2IUyrulTucTlXPRIQOpd3bnJuFfsu
	LD2tTXsIFTEd4rzj8JF86moSNmm/HRooWI3O/K2zQhg==
X-Received: by 2002:a17:90b:288c:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3a87350ab48mr128895a91.13.1791262694821;
        Mon, 05 Oct 2026 21:58:14 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3a87350ab48mr128872a91.13.1791262694226;
        Mon, 05 Oct 2026 21:58:14 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853d0261csm2783924a91.17.2026.10.05.21.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 21:58:13 -0700 (PDT)
Message-ID: <b8c965a4-7b89-4938-ba40-35d06b7c8419@redhat.com>
Date: Tue, 6 Oct 2026 14:58:04 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 19/23] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-20-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-20-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Limit the capabilities that are allowed for Realm VMs. Similarly block
> the vm_ioctls backed by the capabilities.
> 
> Repurpose the kvm_pkvm_ioctl_allowed() to support both pKVM and Realm
> ioctls. Rename the helper to kvm_vm_ioctl_allowed() and move it
> into arch/arm64/kvm/arm.c. Also add a generic kvm_vm_ext_allowed()
> to handle pKVM and Realm capability filtering and route them accordingly.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Drop WARN_ON_ONCE() from kvm_vm_ioctl_allowed to synchronise with
>     what is in -rc5 and make the conflict resolution easier.
> ---
>   arch/arm64/include/asm/kvm_pkvm.h | 19 ------------
>   arch/arm64/include/asm/kvm_rmi.h  | 24 +++++++++++++++
>   arch/arm64/kvm/arm.c              | 49 +++++++++++++++++++++++++++++--
>   3 files changed, 70 insertions(+), 22 deletions(-)
> 

One nitpick below. In either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 2addc37c500e1..b833abb1be9c7 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -53,25 +53,6 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
>   	}
>   }
>   
> -/*
> - * Check whether the KVM VM IOCTL is allowed in pKVM.
> - *
> - * Certain features are allowed only for non-protected VMs in pKVM, which is why
> - * this takes the VM (kvm) as a parameter.
> - */
> -static inline bool kvm_pkvm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> -{
> -	long ext;
> -	int r;
> -
> -	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> -
> -	if (WARN_ON_ONCE(r < 0))
> -		return false;
> -
> -	return kvm_pkvm_ext_allowed(kvm, ext);
> -}
> -
>   extern struct memblock_region kvm_nvhe_sym(hyp_memory)[];
>   extern unsigned int kvm_nvhe_sym(hyp_memblock_nr);
>   
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index 44f5c75a27b5b..ea1450e0c8619 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -6,6 +6,8 @@
>   #ifndef __ASM_KVM_RMI_H
>   #define __ASM_KVM_RMI_H
>   
> +#include <linux/kvm.h>
> +
>   /**
>    * enum realm_state - State of a Realm
>    *
> @@ -58,4 +60,26 @@ struct realm {
>   
>   void kvm_init_rmi(void);
>   
> +static inline bool kvm_realm_ext_allowed(long ext)
> +{
> +	switch (ext) {
> +	case KVM_CAP_IRQCHIP:
> +	case KVM_CAP_ARM_PSCI:
> +	case KVM_CAP_ARM_PSCI_0_2:
> +	case KVM_CAP_DEVICE_CTRL:
> +	case KVM_CAP_NR_VCPUS:
> +	case KVM_CAP_MAX_VCPUS:
> +	case KVM_CAP_MAX_VCPU_ID:
> +	case KVM_CAP_MSI_DEVID:
> +	case KVM_CAP_ARM_VM_IPA_SIZE:
> +	case KVM_CAP_ARM_SVE:
> +	case KVM_CAP_ONE_REG:
> +	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
> +	case KVM_CAP_ARM_PTRAUTH_GENERIC:
> +	case KVM_CAP_SYNC_MMU:
> +		return true;
> +	}
> +	return false;
> +}
> +
>   #endif /* __ASM_KVM_RMI_H */
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 37ef2ba4e43e2..fe707a0c47308 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -136,6 +136,49 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>   	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
>   }
>   
> +static inline bool kvm_vm_ext_allowed(struct kvm *kvm, long ext)
> +{
> +	/*
> +	 * We could be called with kvm as NULL, so can't use kvm_vm_* for pKVM
> +	 * flavors
> +	 */
> +	if (is_protected_kvm_enabled())
> +		return kvm_pkvm_ext_allowed(kvm, ext);
> +	else if (kvm && kvm_vm_is_realm(kvm))
> +		return kvm_realm_ext_allowed(ext);
> +	else
> +		return true;
> +}
> +
> +/*
> + * Check whether the KVM VM IOCTL is allowed. For pKVM and Realm VMs, certain
> + * ioctls are not allowed. Further, certain features are allowed only for
> + * non-protected VMs in pKVM.
> + */
> +static inline bool kvm_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> +{
> +	long ext;
> +	int r;

	long ext, r;

	kvm_get_cap_for_kvm_ioctl() returns 'long' instead of 'int' value.

> +
> +	/*
> +	 * We are guaranteed to be called with a valid kvm instance, as the
> +	 * only caller is kvm_arch_vm_ioctl(). Catch any deviations, as we
> +	 * rely on the kvm instance below.
> +	 */
> +	if (WARN_ON_ONCE(!kvm))
> +		return false;
> +
> +	/* Cover both pKVM host and Realm VMs */
> +	if (!kvm_vm_hyp_is_distrusting(kvm))
> +		return true;
> +
> +	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> +	if (r < 0)
> +		return false;
> +
> +	return kvm_vm_ext_allowed(kvm, ext);
> +}
> +
>   int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>   			    struct kvm_enable_cap *cap)
>   {
> @@ -144,7 +187,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>   	if (cap->flags)
>   		return -EINVAL;
>   
> -	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, cap->cap))
> +	if (!kvm_vm_ext_allowed(kvm, cap->cap))
>   		return -EINVAL;
>   
>   	switch (cap->cap) {
> @@ -403,7 +446,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   {
>   	int r;
>   
> -	if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, ext))
> +	if (!kvm_vm_ext_allowed(kvm, ext))
>   		return 0;
>   
>   	switch (ext) {
> @@ -2146,7 +2189,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>   	void __user *argp = (void __user *)arg;
>   	struct kvm_device_attr attr;
>   
> -	if (is_protected_kvm_enabled() && !kvm_pkvm_ioctl_allowed(kvm, ioctl))
> +	if (!kvm_vm_ioctl_allowed(kvm, ioctl))
>   		return -EINVAL;
>   
>   	switch (ioctl) {

Thanks,
Gavin

