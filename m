Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0AE434407
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355856; cv=none; b=CGXd2b4yqk2u+s1uCcSRlIXoZv4kdI6CkseoJxWDa0h9zdWOHKeC+imtj3QbhHtiDs3gGhT6k5y/qf/oSE0OkXD3iEhWFw099Iz1IokBU5D/bOOiXlx+5hphCSbSkmgHGR7nPIBOIQl7o3pSMSzbs6TGP0Z/IHgb9PpHogctaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355856; c=relaxed/simple;
	bh=NxKnop67K40F9mz2/w4xW51Ap2vB7W+wpl1PHcBVYv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4053uBMo9eMLZzxmmyK0eT4+MhXRZuBMRem6Et855Ff2Xr+8PDpH7G7wvTNJrxeWBEJHpkoJzNLrLkVFIvL5nXvYdShjgub7f72cjEPVAGdaL/Fj7C1Ozjc5pvg+CLAxC89owCFmpbpZlRhuVjLo20jyoxIHK0ybHbIkFV4yWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HTM5eR4z; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HTM5eR4z"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so1880131a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788355853; x=1788960653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YsG1U7ahDUDRdpBFdpvVDRbtk4czDxTB0Kyn7B74q6I=;
        b=HTM5eR4zwtyhIRWp6SvbizeK49rsy7afLqD3P6zHwzlx/nm46mzkE/03nPx467NgLc
         DjZiDpzKiZt5/AILctqowLz0R3/Cvqny96stSfLpf/143qO0WOFFo5ubKRLDfE60Xb/m
         uR554O6S6b5Tdxtsr/Cd7oGWd15sC11QDxTpjzwg+7c2Qbl1CHXgc0m18K3BYee/oIXT
         KwvCyC+6xh/gX61rrHbOqQkDLwYRN+exWeGfy4DBseKFtrIppLZILWG3D3OKCUhG2LM9
         DOIUBEtGsW3JYqUDQVb0todfVBNvZUqUha7WSV6xjjksX/NDUIw3iXHsMPlPuE3+nNDm
         AtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355853; x=1788960653;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsG1U7ahDUDRdpBFdpvVDRbtk4czDxTB0Kyn7B74q6I=;
        b=Y/b8TIuyQnBTb/u1B8HTgMI++3Cr4jKvoYqbzy7PA14UsmanTYCLUbV19Z3nzoZ0Dk
         Ksu5MUcDnW0xCn/zjkkZnz1VqMvm7XlTl7SccL/MSD0mH9Sx9yMFc2/n0zSVGmMXeBh4
         EvOdzxoBHilq/dfdxqol4iKloevGc2iKIcQkubGrJ9exduMiuBjgZJXXCdqu2iuPrhei
         /a09e8vAkYmv1jI4FbZM+yXP8MRk3/GSM3Da3i89OC1/0UGZ7n1W8tMOg85gDqyP9e4N
         69z+X91KgO7u5HMstJXlUE4w8spJl7W9e3nX2jJs5GFubLV8/pmQIGIFKpozmlEIQGA8
         VaZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSklYXxCVmKoTvY95+zo7nZIuxCdF60fslZFRb8hAD52S8Y8yzEwMyWoyb8sIIey2z5L2d6MGznj4WrE0=@vger.kernel.org
X-Gm-Message-State: AFuF++nyfwU3457NP1Fax/RG2zVdoR2+ew4RaRbmIX//bEilkJp2gGos
	p+FLJIs1X2NMSUPnlvEhwy4aKjdEfeD6889dWZ2y2VFSsWTBdyqGCH9zc1bo6Vfv2Q==
X-Gm-Gg: AYBFou3TJNXcAw0PkxmQeRvlES0Ss82IHI2hqJPXfq/sthMnReMOEZMiy3DXDaYZc5S
	6Djz0b5bT7rIjo1Ap4VCrqXONCZrhgLNQRZ8fm0ANQO/66fSXU3jD1WjKnvrM4Kqaoivv82ACih
	YJLeK3Sw1jbMcbDeK4TGPFAzbPKuHmldrDBEMbQfqJi4LCtPK2mMbjUzrf685az+wcrWU8vwiiT
	8Qwid4sV/KdqDY5eAdYeWhMj+ZMsDdl8P96x3wWq/r4pjhGFr33viKaUdncrHc5HiAdDrMfbkgw
	9jlggdmcAKVsU9Hv975vvKHgKVXobnRXr59WdtGBB2j6qniBBu5h5W3baL8sNXEMzDjV5ScmnlJ
	fU9hvoPlKVVrR1l+SQr18NWTzOXpRGlHSrFzlKSI+moE3s7wImsNJl+vRbZjx3/M1zQlLgvWfoh
	zVV6NvdAtHKcWgkQme1gkJpHwUtrWPbIYEMJvUs4e0xQpxVznVBN3BfPUkDp38dxMpLH8V1lczI
	HKwgkbyH86EE7Oq2WKgYP5NqmmZL7QeByuZoMqdGYx5
X-Received: by 2002:a05:6402:2486:b0:6a6:757d:632a with SMTP id 4fb4d7f45d1cf-6a6828a183fmr3550857a12.17.1788355852434;
        Wed, 02 Sep 2026 06:30:52 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f932bf5sm1108584a12.14.2026.09.02.06.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:30:51 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:30:48 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 03/17] KVM: arm64: Reject the PVTIME vCPU attribute for
 protected VMs
Message-ID: <apglCDec15q8D8u-@google.com>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
 <20260831163421.272420-4-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163421.272420-4-fuad.tabba@linux.dev>

On Mon, Aug 31, 2026 at 05:34:07PM +0100, Fuad Tabba wrote:
> pKVM currently does not support steal time for protected guests:
> KVM_CAP_STEAL_TIME reports 0 for them. The host still accepts the
> KVM_ARM_VCPU_PVTIME_CTRL attribute, whose IPA would point
> kvm_update_stolen_time() at the guest's private memory on every vCPU
> load. Return -EPERM for the attribute group instead.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/guest.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index b01d6622b8720..23f725e2cf745 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -916,6 +916,10 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
>  		ret = kvm_arm_timer_set_attr(vcpu, attr);
>  		break;
>  	case KVM_ARM_VCPU_PVTIME_CTRL:
> +		/* Steal time is not offered to protected guests. */
> +		if (kvm_vm_is_protected(vcpu->kvm))
> +			return -EPERM;
> +

nit: We have vcpu_is_protected()

Also, would that make more sense to put that check in kvm_arm_pvtime_supported()? 

>  		ret = kvm_arm_pvtime_set_attr(vcpu, attr);
>  		break;
>  	default:
> @@ -939,6 +943,9 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
>  		ret = kvm_arm_timer_get_attr(vcpu, attr);
>  		break;
>  	case KVM_ARM_VCPU_PVTIME_CTRL:
> +		if (kvm_vm_is_protected(vcpu->kvm))
> +			return -EPERM;
> +
>  		ret = kvm_arm_pvtime_get_attr(vcpu, attr);
>  		break;
>  	default:
> @@ -962,6 +969,9 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>  		ret = kvm_arm_timer_has_attr(vcpu, attr);
>  		break;
>  	case KVM_ARM_VCPU_PVTIME_CTRL:
> +		if (kvm_vm_is_protected(vcpu->kvm))
> +			return -EPERM;
> +
>  		ret = kvm_arm_pvtime_has_attr(vcpu, attr);
>  		break;
>  	default:
> -- 
> 2.39.5
> 

-- 
Vincent
