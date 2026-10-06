Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE05A374A0C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264938; cv=none; b=NO9mj69s5Upqtxi4+xm0iQfTmsO5T/rFdMmXNDQyz+yaiSM6+NEB5H0Dat0BTLs4GRrCC4ZiQ5SYbwSOf3w+Y9u76Krw6P272fmAeS1FYRKtSMg6ZA/SIBuVPRAtuV9OTtOLhqppVMMb+RihIlasfQ6eAJMgFOszBLqZMdTXQmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264938; c=relaxed/simple;
	bh=DGW8lI2SR9lWmJKtrYzG10TLsythMb8q9PQyzrQoibM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7YK4bP0S0DswXxbi+9xGQKi9rvgysZjQv9V2C5ndZ8rg9cLu4K5YNVkt1PjqeU8hfNh2k8fD8G07OEtZx+7ovqGxVJBES7EuAOXjnYe0giQMF+pRL+Wfx9kTKJldFwsqjUga4pYpvOUNJ1huTA+IFTxvK2ohCBVKZyElCgMYXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YbYYyT3J; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fUgMddgk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YbYYyT3J";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fUgMddgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791264935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6HKUn32Pl0RcC+t4ZBVYw0IBfWo3PWYr/PqqN0MysU=;
	b=YbYYyT3JQ5znoQkCh+TPAkiGT2Xc395ffYZOw2efomSkG5NnUlLFVrd9eekSKm4vFjhimP
	GA6N3l3Aoa1o7lUbRbv1+EWL/FNdUWf8Tk4qAbAMgGWxw2sN3Ye78JTWxYzodKqJq863B0
	Gq7yJ3YPBIUjxq+e4EwEeQ91GTcYNAc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-_reOuRgvMeSbgJ7B0hOMaw-1; Tue, 06 Oct 2026 01:35:33 -0400
X-MC-Unique: _reOuRgvMeSbgJ7B0hOMaw-1
X-Mimecast-MFC-AGG-ID: _reOuRgvMeSbgJ7B0hOMaw_1791264932
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a85a33333cso437744a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791264932; x=1791869732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6HKUn32Pl0RcC+t4ZBVYw0IBfWo3PWYr/PqqN0MysU=;
        b=fUgMddgkGIpirz7uR+XHjU0aC5brNUUESk98ZOM8ZNme1utfoULlr3P0efNU1pNeWC
         hQIoN9hc7rPO4nL1ACF+iEiwfCG9vxuX+b1TFl0Usq7sL8zS/1wlC9XcIpLtW1ryrBEy
         BegWMqYIkKM7qpvaUmIA7VswI9vHaX5LtGivG3jpaoqsXMxvJqyHQnDEZAGwqObh/DNq
         juPD6H66ucwHHsAd6fDsyGy6RswgeVwI38rBA8FUi2ao1sJQZ1xRryUiQltnvApWr5v/
         j8zA1/lC8pJIQbTpzmd37MOVAHekoc8A4bPMgUWivm15o/+dnFCUcKoorY3ElE46CeTh
         M90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264932; x=1791869732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6HKUn32Pl0RcC+t4ZBVYw0IBfWo3PWYr/PqqN0MysU=;
        b=T9T5PZwFCtHNt+w7kYvTKBOelyvOufU/76hS8pyLj5tumYCNU6Hh/ysSBtat5uIeFu
         7UA44LNw0uhhDLEWnuFjlIxAYytwanrMscKZCdbSZJV5ejHGSu/ySBOIJNS6b119lARU
         OGBXim9mUh866Q0S+hpEpu2HBCxzH2M0HHuP/xsZHdhDtSpFOydDsuPfms2g8cUfrbov
         CVp84/qxSTuNq9KGBX4ktw6bbDIgcu6Hl+JvFTIAWTgOiNsUFoC6pQs7X07VNB0DnAkh
         f9pyeYnNbbv2kOHgWbYm7A3ZDk+YdHwZ6IZC9ZTmHKgRGAz3SeqDFly/wub0gotEJahx
         xJOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhitGT6FPdZBMuJ4xYsQFjmQ3VaOZ4cdgo0/O+qiA5SIl6cuJJrEeiMYneYTsIQ2k/J9RnDLsSGhJBohM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4emUYYO8NhvJVr6lwq0zwrLhKUv8of1d6N1ejTzKnV6LtxDHV
	QO3rGrYkTO9KoOS8i4Cpk3jxkpk0kJhN5dhF5kUES+WhJjAgVF6T7+Nd04pggaWrVMeAebqFwnQ
	O5VcqGGmX+u/9wG/OG5L1bZ94ixUbdD72/Rdz3/KQfDtEn/qdcKFT6XBkd2tQGa9AyA==
X-Gm-Gg: AYBFou0obOJFhU40I5UoeLzKKL4J7cLRllQ8bwcLuaNkHracj8Pqm+1Pf9cDC/D3gb2
	EM0u5mpJ+kGhL+N2TbNFg0U16jv28H87meEFLQyIWPDjId1/CYWmsp5AskmUaon7zcMBJ1bjyzY
	YRI7VRhKVaIoYKZ1TxXI0P21MvZXLuRSwYwVTyPoYQ7YFaKKWyRuXy26cIXvdoNz2MsifxYDGTc
	yXEe7oYHoy5V1EMc18wz0zb0LwX9WB7kyGTR671wxiODf4pDtEbTGA64qa87CJX8unUEG4o7kI8
	ZR/V5aJqUgQu1LbRbusMihGA4DB7IkGN45tOoIHyrK5qdrQTX3umlW7jTCPwj4HO7IFyAXRiDBs
	9wNwdtlbT9EHudIkwj6YsGdvZg1wGIgdA3MEQ2JUIuw==
X-Received: by 2002:a17:90b:5101:b0:3a8:6b84:234d with SMTP id 98e67ed59e1d1-3a87254fb70mr144155a91.6.1791264931659;
        Mon, 05 Oct 2026 22:35:31 -0700 (PDT)
X-Received: by 2002:a17:90b:5101:b0:3a8:6b84:234d with SMTP id 98e67ed59e1d1-3a87254fb70mr144145a91.6.1791264931169;
        Mon, 05 Oct 2026 22:35:31 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543deb6dsm3003847a91.16.2026.10.05.22.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 22:35:30 -0700 (PDT)
Message-ID: <d330fe17-d9a4-4c6c-9d6c-f47162bbfd14@redhat.com>
Date: Tue, 6 Oct 2026 15:35:21 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 22/23] KVM: arm64: CCA: Expose SVE VL register before
 VCPU finalization
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-23-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-23-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Userspace must configure the SVE vector length before the Realm is created
> (as it is part of the parameter for Realm creation), but the Realm VCPUs
> cannot be finalized until after the Realm Descriptor has been created.
> 
> KVM_GET_REG_LIST currently rejects the unfinalized VCPUs, which prevents
> the userspace from discovering and configuring the VLs for  the Realm.
> 
> Allow KVM_GET_REG_LIST for unfinalized RECs and make the SVE register
> enumeration handle the unfinalized case explicitly. i.e., only expose
> KVM_REG_ARM64_SVE_VLS before SVE is finalized.
> 
> One adverse side effect of this change is that a KVM_GET_REG_LIST call that
> only probes for the array size will now succeed even if SVE is not
> finalized, but that seems harmless since the following KVM_GET_REG_LIST
> with the full array will fail.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/arm.c   | 15 ++++++++++++++-
>   arch/arm64/kvm/guest.c | 10 +++++-----
>   2 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index fe707a0c47308..d99e7818f5894 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2004,6 +2004,19 @@ static int kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
>   	return __kvm_arm_vcpu_set_events(vcpu, events);
>   }
>   
> +/*
> + * Realm VCPUs can be finalized only after the Realm descriptor is created.
> + * But in order to seal the SVE VL, we need to allow the userspace to read/write
> + * to the SVE_VL, before everything is finalized.
> + * Allow the register list for RECs before the VCPUs are finalized.
> + */
> +static bool kvm_arm_vcpu_reg_list_allowed(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_arm_vcpu_is_finalized(vcpu))
> +		return true;
> +	return vcpu_is_rec(vcpu);
> +}
> +

Needn't to keep this helper, and the code can be integrated to kvm_arch_vcpu_ioctl(),
see below.

>   long kvm_arch_vcpu_ioctl(struct file *filp,
>   			 unsigned int ioctl, unsigned long arg)
>   {
> @@ -2059,7 +2072,7 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>   			break;
>   
>   		r = -EPERM;
> -		if (!kvm_arm_vcpu_is_finalized(vcpu))
> +		if (!kvm_arm_vcpu_reg_list_allowed(vcpu))
>   			break;

Needn't to keep the helper kvm_arm_vcpu_reg_list_allowed() after its logic is
combined to kvm_arch_vcpu_ioctl().

		/*
		 * Realm vCPUs can be finalized only after the Realm descriptor is created.
		 * We need to allow access KVM_REG_ARM64_SVE_VLS before that so that the
		 * register can be sealed.
		 */
		if (!(vcpu_is_rec(vcpu) || kvm_arm_vcpu_is_finalized(vcpu))
			break;

>   
>   		r = -EFAULT;
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index b01d6622b8720..c3ca369882273 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -598,8 +598,8 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>   	if (!vcpu_has_sve(vcpu))
>   		return 0;
>   
> -	/* Policed by KVM_GET_REG_LIST: */
> -	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> +	if (!kvm_arm_vcpu_sve_finalized(vcpu))
> +		return 1; /* KVM_REG_ARM64_SVE_VLS */
>   

Question: After a (Rec) vCPU is finalized, the returned number of registers won't
be 1. Is this expected? Otherwise, we need to use vcpu_is_rec() here.

	/*
	 * KVM_REG_ARM64_SVE_VLS is visible for realm vCPUs no matter if
	 * they have been finalized.
	 */
	if (vcpu_is_rec(vcpu))
		return 1;

>   	return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
>   		+ 1; /* KVM_REG_ARM64_SVE_VLS */
> @@ -616,9 +616,6 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>   	if (!vcpu_has_sve(vcpu))
>   		return 0;
>   
> -	/* Policed by KVM_GET_REG_LIST: */
> -	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> -
>   	/*
>   	 * Enumerate this first, so that userspace can save/restore in
>   	 * the order reported by KVM_GET_REG_LIST:
> @@ -628,6 +625,9 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>   		return -EFAULT;
>   	++num_regs;
>   
> +	if (!kvm_arm_vcpu_sve_finalized(vcpu))
> +		return num_regs;
> +

Same question as above.

>   	for (i = 0; i < slices; i++) {
>   		for (n = 0; n < SVE_NUM_ZREGS; n++) {
>   			reg = KVM_REG_ARM64_SVE_ZREG(n, i);

Thanks,
Gavin

