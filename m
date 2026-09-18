Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E7050C285
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746775; cv=none; b=SIaUgDSaalMAKR0a5e4eFdKsLcu7mh5Rt9YW2+6M9nc4TyBvoernju5FoxXt7mGbOlTghcRiu0PsDVuG/wpyVPDt1EoQWZMpVoEc2hCvgZoehbY3efxLrKVjLCnGay00PB3QrbZHJCMEbd9aucQjgHHPZseigHfJx+c8OcWtf4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746775; c=relaxed/simple;
	bh=bKoAKaYVqYSejGK91K7wvuWekpoWN56qy7KmibjB/TE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CWTJriCGYV/NxTTjxlmVGt51/PI93Nnv16gFHBxxVbF8nOhSPyBGkpJsH+RTqy/tjhMXXMqrErJHZPKkeZaUIjLp/3Hn9QQfGX/En3tPb5MoOtc3Y58r9A/sYLB5LN4w/e4dwzltuvpCB8Yukh6fLoPrwKVbCPCdLuh9FFMOVA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R3DtHrnS; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R3DtHrnS"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so12006545ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789746774; x=1790351574; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ktxsxbM2vcYpa5w2sIzlpjNQbQQ80zGB82S0F5fT6e4=;
        b=R3DtHrnSVPUwFzW4hn1W8jBQktThNpwpDX/uuyislhscBy35uIe+547e5hEtoNrf0f
         gsXWegxTmMni3c9Ep/gQIc6S6nZOUidtfiUgM/QnPV9Vln/7zzqRejGvqhtPsPxH8R3i
         t+F/KMcSj+xD5jJVSYl93x3RQxCAlPV4Qgrm951ZR1eza3oLlkbu8tjR0Zr5sJLYD3OG
         nhmSBEPsotfm026r5Zz9L44Xo0RBnL9Zctvl2vH+c5zUujJ7jB0STBZMOMAXi2iFbiS5
         GxJPll4AormR0vlRfN5Q2+i48pWrnOM+v8JrxXNZwV5EYk4uFSMDj4nhqJaaetBnMRFi
         ucBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789746774; x=1790351574;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktxsxbM2vcYpa5w2sIzlpjNQbQQ80zGB82S0F5fT6e4=;
        b=GFMyQzuyM2Zzfaevp7xaOxrescWvG2ObT2f3uMH4yZPkbCzK2bsKLx9r3QsGZva1pp
         meG/UdX5LEKqrPxeWzbBcwXevH+jlpmgHFxAkmlUwS6Tb2/ZYrnJZ+2NC4BZ2QCsclYT
         MO8Z06Xq2jz5pLOYshce3HQ3sFog33qDEhoyUJygYNIiMM5vsUa5gt+T1MdZk97I0WRP
         /NWdy4ntgyQjL+/3QThSSioW2moQXtyB4vM4ao8S8cmVF+XizIFOjg1qweZpOX/5QsYW
         MAI/Aq04OubmwcMp/XB0NBIBNsYF9R2TY7nxMcrXG3PAuhJ2FoqosvCYICFLc+BnYQUI
         mhTg==
X-Forwarded-Encrypted: i=1; AKwUvByRk9mMwBa4BV3l7I69f9rv0fuKZxvOUL5l1ZseM4ShXFmGeQ70Uz6wBWn/xcSdrSk4uAW3rxMjLxI6DxM=@vger.kernel.org
X-Gm-Message-State: AFuF++kEZE2QcvXll70pAkj0R1WyEQs12FQfcxHQcJ29I6kNptZ9DtfZ
	sfLnrotejX81AhMdzaawsJUGGQdopXIv+cnoIASbj0U0zAVutWJ5le/kHv+qaYRy5v58crQBSv7
	rs+2soA==
X-Received: from plad17.prod.google.com ([2002:a17:902:e151:b0:2db:79ec:b693])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f609:b0:2dd:c0ff:e72f
 with SMTP id d9443c01a7336-2ddc0ffe9c2mr732965ad.65.1789746773557; Fri, 18
 Sep 2026 08:52:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 08:52:52 -0700
In-Reply-To: <aqPdrVJjJFBmC1m1@tachyon.qsoe.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aqPdrVJjJFBmC1m1@tachyon.qsoe.net>
Message-ID: <aq1eVEMxlmyHiuNi@google.com>
Subject: Re: [PATCH] x86/acrn: Set the LAPIC timer period from CPUID leaf
 0x40000010 EBX
From: Sean Christopherson <seanjc@google.com>
To: Yuri Zaporozhets <yuriz@vodafonemail.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Fei Li <fei1.li@intel.com>, acrn-dev@lists.projectacrn.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Sep 11, 2026, Yuri Zaporozhets wrote:
> ACRN guests without a TSC-deadline timer currently always need the PIT:
> apic_needs_pit() returns true because lapic_timer_period is never set,
> even though the hypervisor knows the LAPIC bus frequency and could
> provide it, in the same way it already provides the TSC frequency.
> 
> The ACRN timing information leaf 0x40000010 only defines EAX (TSC
> frequency in kHz); EBX, ECX and EDX are reserved and return zero.
> Define EBX as the LAPIC bus frequency in kHz and use it to preset
> lapic_timer_period, so that the kernel skips both the PIT and the LAPIC
> timer calibration. This mirrors what Hyper-V (HV_X64_MSR_APIC_FREQUENCY)
> and VMware (VMWARE_CMD_GETHZ) already do, and matches the register layout
> VMware defines for its own timing information leaf, which also lives at
> 0x40000010.
> 
> Hypervisors which do not implement this return zero in EBX, in which
> case the current behaviour is kept.

If you actually have access to ACRN, can you weigh in on a very related rework
of all the guest-side PV clock/timing stuff?  Thanks!

https://lore.kernel.org/all/20260806233609.212337-1-seanjc@google.com

> Signed-off-by: Yuri Zaporozhets <yuriz@vodafonemail.de>
> ---
>  arch/x86/include/asm/acrn.h | 10 ++++++++--
>  arch/x86/kernel/cpu/acrn.c  | 15 +++++++++++++++
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/acrn.h b/arch/x86/include/asm/acrn.h
> index fab11192c60a..5db1b6e17f7c 100644
> --- a/arch/x86/include/asm/acrn.h
> +++ b/arch/x86/include/asm/acrn.h
> @@ -12,10 +12,11 @@
>  
>  /*
>   * Timing Information.
> - * This leaf returns the current TSC frequency in kHz.
> + * This leaf returns the current TSC and LAPIC bus frequencies in kHz.
>   *
>   * EAX: (Virtual) TSC frequency in kHz.
> - * EBX, ECX, EDX: RESERVED (reserved fields are set to zero).
> + * EBX: LAPIC bus frequency in kHz (0 if not provided by hypervisor).
> + * ECX, EDX: RESERVED (reserved fields are set to zero).
>   */
>  #define ACRN_CPUID_TIMING_INFO		0x40000010
>  
> @@ -35,6 +36,11 @@ static inline unsigned long acrn_get_tsc_khz(void)
>  	return cpuid_eax(ACRN_CPUID_TIMING_INFO);
>  }
>  
> +static inline unsigned long acrn_get_lapic_khz(void)
> +{
> +	return cpuid_ebx(ACRN_CPUID_TIMING_INFO);

Stating the somewhat obvious, this will conflict with:

https://lore.kernel.org/all/20260806233609.212337-13-seanjc@google.com

> +}
> +
>  /*
>   * Hypercalls for ACRN
>   *
> diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
> index 2c5b51aad91a..23b6d895cccd 100644
> --- a/arch/x86/kernel/cpu/acrn.c
> +++ b/arch/x86/kernel/cpu/acrn.c
> @@ -31,6 +31,21 @@ static void __init acrn_init_platform(void)
>  
>  	x86_platform.calibrate_tsc = acrn_get_tsc_khz;
>  	x86_platform.calibrate_cpu = acrn_get_tsc_khz;
> +
> +	/*
> +	 * Set the LAPIC bus frequency if provided by the hypervisor (EBX of
> +	 * leaf 0x40000010). Hypervisors which do not implement this return 0,
> +	 * which has no effect. When set, apic_needs_pit() returns false and
> +	 * the kernel skips PIT initialization entirely.
> +	 */
> +	if (boot_cpu_has(X86_FEATURE_APIC)) {
> +		unsigned long lapic_khz = acrn_get_lapic_khz();
> +
> +		if (lapic_khz) {
> +			lapic_timer_period = lapic_khz * (1000 / HZ);
> +			pr_info("ACRN: LAPIC bus frequency: %lu kHz\n", lapic_khz);

and this will conflict with:

https://lore.kernel.org/all/20260806233609.212337-2-seanjc@google.com
