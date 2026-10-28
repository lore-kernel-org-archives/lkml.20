Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793197976;
	b=qKWtTW4yQ76iTGifiXyhDzWZVze+ZBHCrR3s0OtFYatuqAgSi1BKbwtnQOKK3iP6p0yE
	 fqRqlKR8RN08W8r6LAuQU0Mho4fdYomeiXqTNA+a5eDcRroXnjczwi8VAWrkc4ABSNLgx
	 DArLH98CVrOMMgblEflELW6cnye1KSZ7v3U4QZAH1j3SEjlCYH/MXprAYjWPK/XZm1OaP
	 FcJkiKBaAOzS5QX9otG4JDNh0wAjvoskEpPMyQg+RomFpnMN6JVKUJ4LNl/C7vINahByh
	 epof8m2wEF2o2gcnhX4+cU9qhboJ/3FrdyFSXThZVH54AhYqlYafURkgTnpR49MUGYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yx+5R/vIWc879ffCmh+IwgIrqvOvc4BaxTNXJTSV5Fw=;
	b=JU+9ZQlfPKqE2qS6inbsqa8bJ3J/PBPSYN4plbzF0XrJXdblq7l1irE/hHkTDymsxc3+
	 UWNg5qcoB9Rgg37f+w1JNQkOncxo75a/snuvw/b7PEfwMbUQuqFwuL/rLnGSD5zH05o8k
	 JJCC7vGattxtIXasjsi0wGOMyZQqXTPOxq6oVuj01B34YoaGaFtYas5mTYdM5bDdGjN35
	 gav/a7Ncd93DX71YCYihPuK5U09Uabs7r2PPjV63NQeUOU4Uv3nV0y+0M9PVZhbJb/s2Q
	 b0lcjARReZxZpF+wRN2YuQgUX65JgPJ6+f0VCit0p86A0lMbJoAjKSPrqdZCg9Gm8Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L6UNNPxY;
	arc=fail smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39DF606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B39DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L6UNNPxY
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so9998a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793197974; cv=none;
        d=google.com; s=arc-20260327;
        b=RpbazGyYSQfebEXeG2S2YgtLUJLNvPFXEsFlQbgn50UXnN6kvCQs85zDmcLX8lqRMt
         IZSsiy/g2lwoDTkxlJ0shBYGPdLpx7NU3pyzPLyuiIUpJUxbUU6krS7rjAAnwXaFVTK1
         bShpgAyYZS98kdB177pWFd1yVrTAWf2w9Lx4RJU4PVnW34m/aukDoHaljIea54l9UaAn
         aOEvTj6o6mc20GhyRfUz8XbBAMrAaqXPVriypdzR3ilqq5kphGaVMgc4y9q9rm19KtdC
         e83F4lCZvBe6RFdYd3PDe1W0eYJKcGtVRM66Q0sDWO6OHp1pTOraVNNkU3AZHqJyUHbZ
         dx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yx+5R/vIWc879ffCmh+IwgIrqvOvc4BaxTNXJTSV5Fw=;
        fh=C7C+7eHG0gzLJ3bq3NU+iaXHRhXb7uIl8pV6B5YvkZI=;
        b=FLG7E/HDbErChhkzq41UeThVB082AlFecRA3NkgCfE5jr6ezWbmAQu/2lHpJVdnPcW
         C8MFTfL6U8fCNti+qLooG3kh75ahZIUSdM8Kw0AsFIkk4BiN/QZnt3KIs5/wDHXRuVnE
         HeIeSPoyESI0/1tUmuAMYLlfdLw0QfGcGAuDqnatdaFxy9c2kHJLEjRij7npe2lBHGXa
         UXw51j4qTChka2UL3Iy1ruIl+Af2KarcDadh0vP4B9DC91THObJIBFeOHFHxTSPS7G8G
         ZE7xwGG2DENFNsyoylZita+HbdTjJC2+bE+xoaz/WbyquxlCcCDnXTbp+R9VAFcoOLi5
         SurQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793197974; x=1793802774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yx+5R/vIWc879ffCmh+IwgIrqvOvc4BaxTNXJTSV5Fw=;
        b=L6UNNPxY3OmY+7xadndWEjftwLGw4TwEcjEokthroIC7FNqwiexSIF6WbsCJTD4fDM
         KPge6ZhY8x5JT7H2CTE+kn2ZOfOgX3NZFw4rW2Rbm2ezPHu84/qmOTNX+pUtWNLZuydp
         y47GjNaMDCtjPzyYoTHm6e1lhOutvxo7i2wQYssLo61Cbbkrmrh2lj5DpxcBsLVlnsYB
         gnl+54f9LpHOOfOyvVtN39ICEipYGE9iGR5rfjVGmkgzp8Szz9/9I0pBhZkNujXBbkvT
         huYEktZxbWZzURW5jQSB7ma63LfMb/TWHRNAOjoeKtbnVIEc1XdJGB5/IgHilGAzysfX
         mkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197974; x=1793802774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yx+5R/vIWc879ffCmh+IwgIrqvOvc4BaxTNXJTSV5Fw=;
        b=kKdayQdF/1+qaCzNWKLnEbDtkEhlNf0RZt/rNFCVg7IOh0plbI2iiosBcDZjkn9glm
         hMFcKRODfx0xLr0hV052XfpAg8yTMlYrqOqe9QldrHmdZno7/gxBjIoXZJH3q/8sHqTt
         9Ps6nbMZ4GknzVDQ/OLJjrfif2buGbFDXG8W/Shc5OIY/41v8ivPt/0NBq0fSAql9L5J
         Rvnzan3mAnO3GtBlM/t3SncHbfgL5mEz2vO8ASrBL9hIFHHHQr7BYzIfwvspHQqggck8
         wubye6AN72WTaTIghXqdm042PnthofncPsr41iH0TlMdFifs4cUIyZ+Ov4BlqZClN22T
         MA9g==
X-Forwarded-Encrypted: i=1; AKwUvBykfF6Un8JhH3rcw/I8kfx8Suvt87fCMIuGp+AQT0oRepTzVVMPRbKdrrClwUBKziw1R3UsFodbVYzrrX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYITvE3U3UXBQqtHR+96QZYMunfBHb3GxM3mdprexh7EQF7VBGei
	CnvSblfTbUm5+XZYgwgc6prgrsd0s/XefyvhdALdItFUersY0HBjFn+tqt5oYk+ACnClSO5vvaX
	ulRrpswiH+xR50Afm++NA4Jf7jKg/jkBdR7eSKIEE
X-Gm-Gg: AYBFou2HlHNU1J8UWRmSGssHD0k4Kyc/LftY4YP4JkNKmvAdn+SdYxLDp4fNVuUY58E
	6Vulk+RiLBVP8L/5s9ElVqpcxcgDdma7MuES1qlU4/39btNi/Iiel7OriiToePWHv59JSgVaj5+
	IiU7HZQ/2GN5yyKJ9t8zzhHjBfghsHrse9MHeTX2m5Vt7dBh1F+NqFCdNUMJpsB5uL2/Eod3Ebo
	jZ9D0TAReU5NHPBcbo+Fzo6ak9Bufb36/klLVxdEe7Qk2AkpDhxP5MxZHGBRVNY6XBn2ufuOdyS
	E4SKEo1191iXj974V+GxjDEJS2ZXBgA2b44OcGL0SiHO8L+jEpU4P1kHS1PqtRc/GMUucIYAtgJ
	v68BqZ7WPfaJtRcm6pnTgGMSJMM0KxKK8l0Mk
X-Received: by 2002:a05:6402:15ca:b0:6b4:9221:8932 with SMTP id
 4fb4d7f45d1cf-6b49bf30d9emr71736a12.10.1793197973522; Wed, 28 Oct 2026
 07:32:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-6-zide.chen@intel.com>
In-Reply-To: <20260827223755.143247-6-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 07:32:27 -0700
X-Gm-Features: AclHuK_RSPZVdobAgjy_ogxXxziGOOIGg8mnY5uas-cfdvtLM2keEY9JFCCzDL4
Message-ID: <CALMp9eQ4uBX69=jZSx83t1xeO-3Jd0qsLOV=9ok+qGB+UnfRSg@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] KVM: x86/pmu: Add PMC bitmap accessor helpers
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:48=E2=80=AFPM Zide Chen <zide.chen@intel.com> wro=
te:
>
> pmu->nr_arch_{gp,fixed}_counters is not able to represent that a PMU
> may include non-contiguous GP or fixed counters.
>
> pmu->pmc_exists already holds a bitmap indicating both fixed and
> general-purpose counters, and loops over valid counters can be done via
> pmu->pmc_exists alone. Extend it to a union so that the u64 alias is
> available for convenient mask arithmetic operations.
>
> Add the necessary helpers to prepare for bitmap-based PMC counter
> implementation.
>
> No functional change intended.
>
> Co-developed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> ---
> v2:
> - Rename kvm_{gp,fixed}_pmc_supported() to kvm_is_{gp,fixed}_pmc_supporte=
d()
>   and simplify them by removing the temporary bitmap. (Sean)
> - Split kvm_for_each_set_pmc_idx() to kvm_for_each_gp_counter()
>   and kvm_for_each_fixed_counter(). (Sean)
> ---
>  arch/x86/include/asm/kvm_host.h |  5 +++-
>  arch/x86/kvm/pmu.h              | 53 +++++++++++++++++++++++++++++----
>  2 files changed, 51 insertions(+), 7 deletions(-)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_h=
ost.h
> index 90d80483df7f..49a8a2e9cee0 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -594,7 +594,10 @@ struct kvm_pmu {
>                 DECLARE_BITMAP(reprogram_pmi, X86_PMC_IDX_MAX);
>                 atomic64_t __reprogram_pmi;
>         };
> -       DECLARE_BITMAP(pmc_exists, X86_PMC_IDX_MAX);
> +       union {
> +               DECLARE_BITMAP(pmc_exists, X86_PMC_IDX_MAX);
> +               u64 pmc_exists64;
> +       };

Is it worth adding:

BUILD_BUG_ON(sizeof(pmu->pmc_exists) !=3D sizeof(pmu->pmc_exists64));

Either way,

Reviewed-by: Jim Mattson <jmattson@google.com>
