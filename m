Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17319305698
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578614; cv=pass; b=hKkXRymJFyQXPGqW0i2QACdLyS6aJnvK9yj1lJphNQckEajCRcU4szfXT/CMz1czbZUNIKdJV+zvZSmMt0dI6NnxAZLh/EVWxpVOsQ//yeOmXB/4VQvryeWUzp/sMPWHajpzXtVQ4NlFlssMT4mDy6hF4JUwrL+wYanYEgC/388=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578614; c=relaxed/simple;
	bh=oDVFyTgc0jEjWTx3wGakD1eVCDxa9++gL5VON22nCjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gov5oYHf0RGoDls+zoIQG0E7DvAIHtjm/MsWmF4+dDLL0i5I2LGkyteypQn0IqsXexbrooZeZE6ZC5wGA0oPcqGe+CWGpXgpCALRSHWjG2w2d7vxuYPTLnVI0O0NK90ENvCmG+1xIpb2jHScUpYiIY5N+T3v1eBpNbc4XQUc4p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O/IV2XUt; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O/IV2XUt"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b8f42bb8a9so3721e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790578611; cv=none;
        d=google.com; s=arc-20260327;
        b=HCeafhAjGZLc0314oSJvdIsHQOn++ZTfmaihWXu+ZidOZqo4XXxKHNbHQab1p3cyKF
         715LbStCzR8vl3XY7tdvlPMk7iJArixA7t8u7RxZ5edes6BXOO0iIeDRFbCFRv2zvDor
         TEFWNhLz/ls0e1eS/7GdqJo+gw9vCuDq1bu4BSE8s/ZX+rgTHf/cZ149V4FjiMhdREN/
         tyD1yhy4dGGkT7vkT6l5mDn4cXEsnYZzcH/r6zTNbeN6A2a5FbGD4C0Ok/Sxl1EzQ/PI
         hhcV8zRyTj3ztJ45hLyUhDpmoF/VUBiQhQ2S4oiUC58xTiHnR9mj5xuOKBAo/TKxVLDH
         TJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wAk85Ancg6OFmC+89rPAK+EUepKbCsC89fJMdetQk4k=;
        fh=f/n4G5VCZCarBJ+f2caA5uawFDCcKOnXU5/jaeEtOHQ=;
        b=bnfpchHl+aIMqKqoP47Rr94vLhPAWpFoyTrgQOcNW3Xek3UfFkBDqCtW0zFhOTtsxl
         fi2r1bmRSfCDTR99YfN/ktpEfwqMfMiqplmLf5agYNBRFpkEDmrWMaHXiAUJlWPdrNzx
         ZAmmGPSCht6sY+wC6fNC6s/4XveTz3n4+FrH9E7sXqudo6pgfaI5rRG5jQcihVZ6qhBP
         fozxQurHsTBYdFLI/S73DwCHxoroNDpxPSXKMiEcCJdLOrjsOi8i4rVlFP8zbPpjPdzG
         5wyu71SVMMLnJZTNqr3RIzmYD8Rdx6RDTjm0gbx107JI3WseypNXrdP5IR5acL3enEGp
         CV9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790578611; x=1791183411; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAk85Ancg6OFmC+89rPAK+EUepKbCsC89fJMdetQk4k=;
        b=O/IV2XUtt5v++XKoGnEV+x35eWOPUL9sGjlf3wSWbuTO4kBPNiMaPE+IoNhhnUDGMz
         TB+gXTjCnWA1QoK9JpR2eZlcNuu+IV04PP5cEwysiIAXsJgkqueMzO2H72bUTlLYLeLN
         1wABQNlX7FgJ7hJo21L3fdm8pb/i1fRFwWl3NEK/1a2ma85MAlpwpSmmQ0Hg8Q0gv/F7
         DLT5sIqWhYM2QNnLLYlpJLWQ7vHz22hBsxyVGVkh4mpKQQnti1pFL+oF+9W/3SKNQqmF
         TdZ4UnN9T8xEI3sDbl6DYm+KcfR6FK13iVGixBZdbnuSq5rpNsJ22KIQHSqIQNdCB8oh
         wUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578611; x=1791183411;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wAk85Ancg6OFmC+89rPAK+EUepKbCsC89fJMdetQk4k=;
        b=pPtMlan+/CD8khE0ZIn/dVGosZOnO2P2H1mStWTLb6JzSODgQvQWIYQTFd33H0kUvG
         P8xHVXFoiPRbPl4kQC2FyYw9GSv+FuWzyxqoCbhQKoX+u1uXpZo3ufSHQs51hnq3T08K
         hmQGrtqYxKVN36p8HxfvQlZ8ils5x8AmFyawilsMipXSccQbICY0QO3uJD45bPFddTf8
         R6v/p/RqpcHqg2rJi5VGfq6ArOcFOEr9EJOf3VoRVcBa6L7rDiRi3V6/wYdjiOM8OuKE
         kCtbSq/AonnI60jSuFORnofahdL5/o2pti9oBf5i49MKKOqM8O1ZGFGYZXriC+cI9J75
         lxxw==
X-Forwarded-Encrypted: i=1; AKwUvBwsqpwVbukzp2Podzs2FhDdOG0zm4ch1dsCmVTDr4qKeXDayoCD5Xcx8kfsS3uTi18vG5JKcmzLUj0CsMs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCfYYFzcDM/nYPztubskOzVPh+oTsMcK2y0zBElmHxqwFGYeTL
	DGEqJanH1xDl0coryUxY+TpHAnwIpoL0T60woeEzJVAJrVOSP5GGgFfxJYlRRy8oVXuzqvu6mL6
	/aPD0VWPLw5DkDmGKVjAFJXD4qzCqj+iEBzJJ2zy4
X-Gm-Gg: AYBFou2kBaLSmnXBPdhuXeZp+dU9MG/+rLhCK0RpDi5tLUwZBiMezWJauVgicVvYXNM
	hHEv74LexxVJly2490yDlib0FF5rTK374dZTXuzH/kD1eFzouDbwGZ6sMiwU/Dbtuf885wcI/jE
	OY41Z6ulaH70shoIE8wRHV+Csp+2JQXocFscCoKshKuHMsuj03AZ7lbTRjBkLy4CW2pZKulJIhq
	8c72bqcwG4wBgCPObRxJPjMLnuhPgqcWDhonzxxqIWPVHlw4sNFm1K+GTcAZsGOMLytsy7Ilnra
	g/QmV0TQJR/gGWY2SZMiF7yW457JAHNB8tJQl+/wrT622kLUjgoauNrbMnnySQxMbdAYdL/ydw8
	aKvyJXuvTN2san+Q0GRuYSXo=
X-Received: by 2002:a05:6512:3d8e:b0:5b8:c8f2:16c4 with SMTP id
 2adb3069b0e04-5b8ef255fa0mr155202e87.10.1790578610464; Sun, 27 Sep 2026
 23:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908145622.2828319-1-fuad.tabba@linux.dev>
In-Reply-To: <20260908145622.2828319-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 28 Sep 2026 07:56:14 +0100
X-Gm-Features: AclHuK9Nt0wxmbd5-RZTKhrKH6f7Mij28E53-dg3AuD8R3c5qE6gQbIJDKPoGaw
Message-ID: <CA+EHjTy6+JpcdwuP3wnxK9n2iR0REM7nFgxkLaS8RAOST4KY5g@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: mpam: Document when to set arm64.nompam
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Marc Zyngier <maz@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Catalin, Will,

On Tue, 8 Sept 2026 at 15:56, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
> left unwritten, at reset values that are UNKNOWN, and KVM still hides
> MPAM from the guest but no longer enables the traps that stop a guest
> from using it. KVM never saves or restores MPAM0_EL1, MPAM1_EL1 and
> MPAMSM_EL1, so what one guest writes reaches the next guest and the
> host. Nor can the kernel make the EL2 writes unconditionally: they trap
> to EL3 on the firmware the option exists for, and TRAPLOWER cannot be
> read below EL3.
>
> Say so in mpam.rst, and add the rule and a pointer to the
> kernel-parameters entry.

Gentle ping on this one; it has Ben's and Bradley's R-b. I think it
still stands regardless of the other cpufeature work going on now.
Anything else needed for it to go in?

Cheers,
/fuad

>
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>
> Notes:
>     Changes since v2:
>      - Add MPAMSM_EL1 to the registers a guest can reach (Ben).
>      - Carry Bradley's Reviewed-by, dropped at v2 and reaffirmed there.
>
>     v1: https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/
>     v2: https://lore.kernel.org/all/20260904103131.627392-1-fuad.tabba@linux.dev/
>
>  .../admin-guide/kernel-parameters.txt         |  3 ++-
>  Documentation/arch/arm64/mpam.rst             | 26 +++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd24..e6d543de3cde5 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -575,7 +575,8 @@ Kernel parameters
>                         Set instructions support
>
>         arm64.nompam    [ARM64] Unconditionally disable Memory Partitioning And
> -                       Monitoring support
> +                       Monitoring support. Only for a machine that does not
> +                       boot without it. See Documentation/arch/arm64/mpam.rst
>
>         arm64.nomte     [ARM64] Unconditionally disable Memory Tagging Extension
>                         support
> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
> index 67fe515ed501c..e445f4078ee1a 100644
> --- a/Documentation/arch/arm64/mpam.rst
> +++ b/Documentation/arch/arm64/mpam.rst
> @@ -87,6 +87,32 @@ The supported features are:
>    MBWU monitors can be exposed to the user after support for more monitoring
>    scopes is added to resctrl.
>
> +Command line parameters
> +=======================
> +
> +arm64.nompam
> +------------
> +Firmware controls MPAM through two bits of MPAM3_EL3. MPAMEN enables
> +it: while set, the PARTID and PMG in the MPAMn_ELx registers label the
> +CPU's memory requests. TRAPLOWER, which resets to 1, traps accesses to
> +the MPAM system registers from the lower exception levels to EL3.
> +Firmware must clear it, or handle the trap and emulate MPAM as disabled.
> +Where it does neither, the CPUs still advertise MPAM in the ID registers,
> +the kernel's MPAM register accesses trap to EL3, and the boot fails.
> +``arm64.nompam`` exists for that firmware: it makes the kernel treat the
> +CPUs as not implementing MPAM, so no MPAM system register is accessed.
> +Set it only on a machine that does not boot without it.
> +
> +It is not a way to turn MPAM off. Where firmware has cleared TRAPLOWER,
> +the option leaves the trap controls in MPAM2_EL2 and MPAMHCR_EL2
> +unwritten, and their reset values are UNKNOWN. KVM still hides MPAM from
> +guests but no longer enables the traps that stop a guest from using it,
> +so a guest may be able to read and write MPAM0_EL1, MPAM1_EL1 and
> +MPAMSM_EL1. KVM does not save or restore them, so what one guest writes
> +is still there when the next guest runs on that CPU, and when the host
> +does. With MPAMEN set, EL0 and EL1 requests then carry that PARTID and
> +PMG.
> +
>  Reporting Bugs
>  ==============
>  If you are not seeing the counters or controls you expect please share the
> --
> 2.39.5
>
