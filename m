Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9510143231D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355375; cv=none; b=AM8OT74WtNmu5Fr0LpCkEsGpuraOQdF5FW+Fz+68NhpihqoFhaaGbpGgK0Xiq/aQPg1qOyruW6CowtOb9sLtuGVHvIHt+CufpPf2hjL7bBCVJ07xeeT0DXsMHE8eW8kzYcpFoELYe+HYgPCqPJl7et46sLRFM2iQQSgiC89h7mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355375; c=relaxed/simple;
	bh=ykvs7KzDcNds52UpSQNLo8DYDxovyJzyt1OUd/vPhK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXprykOHJzXdWmqFVKwcHC5uFPrPDp77ARjmRiIwbAg6/8l7dwMVCSEMrk2c6OCkG27gnyZATsUT1S8hFuezJT+AhYFmtyRIeW9Q0j7enLHl5kBAQ2Z+6+u0rK5zoNUvWx82tXCwR1E3LF5zfFVM4xs8J9AcFPpkP0c+U+t0f5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N8LUk3ng; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N8LUk3ng"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2530cabcf4so163838966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788355372; x=1788960172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UpZHhDtMEGc3JLMXKQwgWRW08IpO1s/vNjepdgWkdhs=;
        b=N8LUk3ngzP+R1dP+0W1sLdlgprOPZORXtX/xbyu1LBErCZBZOeHAJn5oBKc2p9n1Ft
         7UT3uOt3Yox/j6xuxaYXc2tOvXlikjp7DdcbxQ1GovV33GS+u1NRkRd7BgiVL9sDuDrb
         rK4V8XjBrYgeTQZZaZVS4zXdMgvcco1f7w6DGy3mLW/Hbc2xU0D8rkrk5O1s07AMiaRs
         iQSYrAxAYg6ZPwokQ3DVqQyaO4Yv0/73EAEnwcyqoUVo2ELNW0Z7Z+YyS3Gp6SwUnNhn
         SJ/CFAYWu6nQz426L9C+DN1WER/lZKHiSoMYnYsJPwjsqDbNvilRG9oq3BTR0oeMKRPD
         JkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355372; x=1788960172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpZHhDtMEGc3JLMXKQwgWRW08IpO1s/vNjepdgWkdhs=;
        b=FGpB/Sa2j1tKKve7T6ViyWsyH+PiRIs2Gbv9capo/jM70jyazMeF0fqHofxut1Spvw
         Wc44ceVkuujdRYxfuJGDhvg3vkjuf/OOE9jnkuMtXOA3bwP3IKAjrZRtWwXymvb+hePV
         G9sN4qW/MXWCevNm1HEpu6n+IGdMJhiSslLy2V9Uak2b+6UAljw3xXjsnitZ/DLINNSI
         KWcpJUuZXhsTry8oe9kse5IMFmlg1P91iNW6MahsKUZAJrvefDVf09GCPI1Cbz559SKw
         mZMmJ+/nIUImasK/wbnqe4MVdwF2R8QmkvjEelNVcRr1vXB07FpSgUcyM8PeuzCokLlo
         P67Q==
X-Forwarded-Encrypted: i=1; AKwUvBzx4tUK/aXn8cVGOL6rCdtHfAVaPh9Bga5f9ZeCVvVZHRaPoL8lSy+2xAF2u/16121Q3JekYjMpFDBXgJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++lfs6ov78abNXBH1F5cckFt+nq+SOGU8QOxzQY+CdpD+brdCXt5
	7uyaHFwy7NBiwlfFchHSstIR1UyAgbO1RUuuU4vwHIgtUfErZWcJhoF7kCYLNvR6sQ==
X-Gm-Gg: AYBFou1WVhpHcZ3bIOa7hzv8zjslhrX28ZuebW4jZWTlutCUMnlyYz3oe/hhg7WYyzE
	hdTqTlNjJv9j4fEgC4+WNMTbf4ISegXD/65j5oOdzbzN9qlQbiIzPoDLl59bkAYWCPbtcmIoaRo
	k8XeIz/yLJslU75bqFsU8ZF5gOjd9SNm6v/mnEkS8iPtiIqXlHAR/f+NLCMGWNla2sYU07I2QPy
	v6L8egyvv6SlMlrLyyPTNnXYuXcM8yEy+29/ERJhP4ebrqud+MD5BCeocbrac0r2+ho8F3tTVXn
	Cm9GYv8jGVp80HM3jJysY1MNpK7pwBo7kJdNHnMz07+DDWGoJ09PVwRkN+a/JQQr6QOl4xmWBQ2
	vDQ8vheaouq6qact18QXuPnXXV6D5ZGGLZQjS3L5/8OPRJfc4zWvME47Ct3G0MKwnwh1Up49C/C
	J2nq9KP7GXAwHy/do8iUQo5+FKzqy8iPOgzOnCeQfkEVEf6Gja7qKNEgJV+7EaitvEIKFsG90dl
	3NyYtCin8Z5jEqzWaTQzy7sFl4eqo/v
X-Received: by 2002:a17:906:ba8b:b0:c25:c14d:1c4d with SMTP id a640c23a62f3a-c25d52b2913mr236962466b.7.1788355370944;
        Wed, 02 Sep 2026 06:22:50 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d042efa4sm131923066b.56.2026.09.02.06.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:22:49 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:22:45 +0100
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
Subject: Re: [PATCH 02/17] KVM: arm64: Advertise the capabilities that
 protected VMs support
Message-ID: <apgjJVg0PmS3OudU@google.com>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
 <20260831163421.272420-3-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163421.272420-3-fuad.tabba@linux.dev>

On Mon, Aug 31, 2026 at 05:34:06PM +0100, Fuad Tabba wrote:
> kvm_pkvm_ext_allowed() denies every capability it does not name, so a
> protected VM reports 0 for interfaces it implements: KVM_CHECK_EXTENSION
> denies KVM_CAP_ONE_REG while KVM_{GET,SET}_ONE_REG stage the guest's
> boot state.
> 
> Allow the capabilities that work for a protected guest, the vGIC and
> the I/O bus being host-managed, subject to the restrictions the rest of
> this series adds.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/include/asm/kvm_pkvm.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index beea00e693a0a..c4c834d55e503 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -42,6 +42,15 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
>  	case KVM_CAP_ARM_VM_IPA_SIZE:
>  	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
>  	case KVM_CAP_ARM_PTRAUTH_GENERIC:
> +	case KVM_CAP_ONE_REG:

Shouldn't we bring the VCPU_PKVM_FINALIZED restriction in kvm_arch_vcpu_ioctl()
first before we allow SET_ONE_REG/GET_ONE_REG?

> +	case KVM_CAP_MP_STATE:
> +	case KVM_CAP_VCPU_EVENTS:
> +	case KVM_CAP_VCPU_ATTRIBUTES:
> +	case KVM_CAP_IMMEDIATE_EXIT:
> +	case KVM_CAP_IOEVENTFD:
> +	case KVM_CAP_IRQFD_RESAMPLE:
> +	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
> +	case KVM_CAP_ARM_INJECT_SERROR_ESR:
>  		return true;
>  	case KVM_CAP_ARM_MTE:
>  		return false;
> -- 
> 2.39.5
> 
