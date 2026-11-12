Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794508629;
	b=2+X/OiSMH8yowOLIM3MD1UllCZZ6Ovp0PCL3TDlHPW8Z/3ydiIzYUZHLTHH4IipjtIql
	 JYg5RtMo9ce7anP87CUHGu/UUsv/b8zAmK/qZ6rna7hVfG8XnfVq+NaztjmRq30VqlPcb
	 TRqw3EQJ+7/neksIrir5sQt3bAH3u5wNRfhmHAMqGKN8cAApLhazbnjl8maC0qDqgIUWp
	 RzS/ZzuWvh0c4/tL2qw+U8In8DbQtotPrfSDJkD2cuSJzui6pGMFOWMAQFhxakAhXA7j6
	 UdJHEAnSaQciaNFY1RatcsVSEJPbPRrYM9dyNzdfydQZfdiWRNWDWFluoUnZlEhvU3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
	b=RoHeGZQ92ZpzS+IEM9t96Qntp5NZ9iaxhX+A949LCC6vBfkZtuZKJMdPkqDe0EuOtVBT
	 4rxKG4OvjkSZRPaD/4rfuz18HEb75cQz6Xhp4Jm2IYWaldXb701ZTkBtTc1LaTbF/2ALb
	 i1R1LzkRZcKLJYazR/w9Ppwd4P4bXhni+4NXRLLxBcj55eTIvKfzP1i8GdKLOcebgGwrc
	 IYHgYHMI04jIH/Rb/l6rpA5yfGivoqx1f1YbIQY8DxU5gvd5/l605RA1hVXFgPXGEM1zb
	 ljPZT+regmbTw+tzL7s+0qtOtwtElj4sGHFQLXs2c2ECm9MfZlp3XdoA/WC42OlsCsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H4xaCjFy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7495A606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7495A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H4xaCjFy
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so715a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:37:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794508628; cv=none;
        d=google.com; s=arc-20260327;
        b=psBS94ekIzXwClV5i9I8uYLLSov4ePJRet5qfs7Wr7xAfmxuHtfLISgdwMgnQoewTO
         +z2T7SMFk8/GclPm0ecbX980/IiTz+saJ5LVOw7qR8gZMs2iAPUsFNZkXfDRVTQW6WQP
         GfodHdi3UCWF53kSMObDDhj/A1HqE0STdsQ5r47Kpw1wx4X0yL/xUKrEW4VPdor1F2Yv
         dY+QI59euxxWGoFA+bCSBW/8hGxJ4ZDrWRVlIHSNcymR1GQJWFOy4S9ci8lbSoJEmOJ9
         DCDQn0hJ2PCYOBPoZZjJySk6BRrMTyCHxb0BmXsR2ysfC2NvULxHxPKhY8sn86mrQRCM
         vcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
        fh=f30SGvvSfm3jQPgf3rPKb9XuZPbzFxIqER/5glG3xHY=;
        b=O2R3YHQKKFIUiO47RMVjO4xpoe4FF8wtOXe68iw1txDu93betCGuJwXNRrI1F/Zn2H
         pLTfAT9w9MJA6Nl3gStNhmo0sYbFCaqP+9YgBKpQ4FTyM6huwiUC3Y7PTcPDjbf3W8ve
         xG8GPd3xAjZ1eGaQdxdrJPbBqN/gXqeJsDA9nF0ULUUYyCSc34skIfkM9q5EDkHa/0EV
         NqwiOSBd9+nW/wbwf+AGNVjRKqycujklIV5W1wgyKVYjS02bm/rZEghVUSDnCwlWCp3l
         EpaKAQ80C4uY2wrrQogbgjHlKxe52DX4Lyw5Uxe3CIR1OplRLqT4TJ/l7eEnf4THUIr5
         BBbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794508628; x=1795113428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
        b=H4xaCjFyorNRMHu4JRUVL3kxyy5XCQ6rNk8FBb8UHfiwxPUXcNR+K7MS7C4x78naKL
         5MOv/s9oEhDu1SbMd3o/DJBUsa4W4ti+6tv8MmJicFNtOqjeLdI1JAbO/2qz4i4uFY0Q
         e3qymi10upruK+tneE8hA8/AKXVfGXeiKZtP+4JQ3HLhw6u+4akhqCrJAPURAKsCcspd
         4JWSzSv9H+mUj9EDxZYeAgjEKcgCJ8h3LTY4iAeiBIuTQGMR7EFE7TNqTzGX83KuRmQP
         hD1v8lUtxCOH3+4BqSRXL8g0ZFeDDHy4KvYqV7bstknRTq4Am4P2n+utcs4C7+i5tN/H
         yJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508628; x=1795113428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwsnVdAdvSGrDGgG3+S9CYGhPqY+OBHsYH8Jxiu3UE4=;
        b=2dGbaMJYaXiGBSedhVQTdnHKhhCBdPmCwZkSrCRxHvujInpeiK8aVQ5+hq2XvyMHIj
         XjF7BkMuMIjv3ZK5ambe4cka7DT5rojHvjmjv6oUL/gg2DGFpNbXhOQZ6+c+Ppwn+rCw
         xm0+RezJr8W53FIR51PwsWPD+sim0iLMfGTxzvY1BNoCk9y70ZZOazSPOJfhXVHyW9PK
         cIwx/Hfi174pp3By1s8+gQkbhuNC4smTaR3t4jt86VRxD0qrEL/e+QOJFUxyGlIAeyiR
         3FKJMh9hgTnT848HnB4EYTi0pCuuiYCn30npbrpyACRnydiJxFqRaJWcoophzKvcN40w
         +9iw==
X-Forwarded-Encrypted: i=1; AL+hErHD3p6F8AeFNny+VJZsfHp+zzyXw/GCVNB85Z8ATLs0frFQAt9gXwoo/nszQWzR/bLD0GkkzRjA78r3ch0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P5pwNJLNDYLKuoLbXMq8BetU+On4LROhfBMdEUuz0EQZGSP/O
	nWQUYEcZK6PwWEJJgrOdtyS1EFCeG31HUvcDE4tD0O/YnQz4BxbpdTLfaTzmBylJN5lCDgPbDye
	XleGJghoApDM62gFC3+dchop7B9ErKgLs7P1VPSYN
X-Gm-Gg: AYBFou2fzFTUigdzxdQ29gC3qxrlzZ+Y7x4vdwzibN9CUTq9e9D1R+2KWFAZJ/Yv6pM
	AVxd0GqLmw5RH4eoDtTaXT9PBzv1KaYeoAhgg/avNuBi6szVmV69ek5wVQejGu7uCuY+arDIsu1
	UkTtYpye12ZCH3B1yUTwjxeqBBKVsxKUKVnvDTJxnFm3Te55NUmFv71FrNFrx6ToABup2uE4dAM
	mRuaNgLWBlpq9v4WoXt9/BK8bEyYnIAEyzVHTbDwmcDDoa+e3HURNY4mP2Rw68rj2p7Z+A+tVFk
	QDlOtQagKRFCecsUeUlaJy1gB92Be4WedCH2SMEmRPif1KvuYVZfg7rU+DkOBuJDuc9xF9+2qjn
	8a4Vqu2Ap6r7jHC4EbhcdR2qREbnynSLGNpzKRW43VH41WqtVNlwVqBu2+m9yV/uyH7okLfPMK7
	Pi3Oc9WDU14yckfmkNag==
X-Received: by 2002:a05:6402:327:b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b7a2ab087cmr87795a12.16.1794508627091; Thu, 12 Nov 2026
 10:37:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794374897.git.zack.rusin@broadcom.com> <4dca09deb85d2d5db157888ae4a2de7cbf6421d2.1794374897.git.zack.rusin@broadcom.com>
In-Reply-To: <4dca09deb85d2d5db157888ae4a2de7cbf6421d2.1794374897.git.zack.rusin@broadcom.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 12 Nov 2026 10:36:54 -0800
X-Gm-Features: AclHuK8rt1aN38OOO-5Oe9cWGgilUSsg7YZ6I-VfVfdCTw37NLQGQcQLM8ki98w
Message-ID: <CALMp9eSARNY=K-bXSoV6sBBaWoKQGHtym1VrjnHtBQhFvsb2gQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] KVM: selftests: Port VMware backdoor coverage
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, Xin Li <xin@zytor.com>, 
	Francesco Lavra <flavra@baylibre.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Liran Alon <liran.alon@oracle.com>, Arbel Moshe <arbel.moshe@oracle.com>, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:08=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.co=
m> wrote:
>
> Add vmware_backdoor_test, adapted from KVM-unit-tests' vmware_backdoors
> test.  From CPL3, with CR4.PCE clear and no I/O permission bitmap in
> the TSS, read the VMware pseudo-PMCs with RDPMC and issue backdoor
> commands on the backdoor port with IN.  Verify that the pseudo-PMC
> reads succeed and the port accesses exit to userspace only when the
> backdoor is enabled and raise #GP otherwise, and that other PMC indices
> and ports always raise #GP.  Repeat the pseudo-PMC checks at CPL3 with
> CR4.PCE set and at CPL0, where RDPMC doesn't fault before KVM handles
> it.  Skip the pseudo-PMC checks if KVM doesn't virtualize a PMU, as KVM
> then injects #GP for every RDPMC.
>
> Run the checks for a VM that relies on the enable_vmware_backdoor
> default and for a VM that enables KVM_VMWARE_ENABLE_BACKDOOR, and
> verify that KVM_CAP_X86_VMWARE rejects every flag it doesn't report.
> KVM-unit-tests can only cover the module parameter, which applies to
> every VM, while the selftest also covers the per-VM capability.
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/r/aIEoNpe-LFoH6LBm@google.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---

[ ... ]

> +static struct insn_result guest_inl(u16 port, u32 command)
> +{
> +       struct insn_result result;
> +       unsigned long rax =3D VMPORT_DEFAULT_RETVAL;

Shouldn't %rax be VMWARE_MAGIC?


> +       unsigned long rbx =3D VMPORT_DEFAULT_RETVAL;
> +       unsigned long rcx =3D command;
> +       unsigned long rdx =3D port;
> +       u64 error_code;
> +
> +       asm volatile(KVM_ASM_SAFE("inl %%dx, %%eax")
> +                    : "+a"(rax), "+b"(rbx), "+c"(rcx), "+d"(rdx),
> +                      KVM_ASM_SAFE_OUTPUTS(result.vector, error_code)
> +                    :
> +                    : KVM_ASM_SAFE_CLOBBERS);
> +       result.value =3D rbx;
> +       return result;
> +}
> +
