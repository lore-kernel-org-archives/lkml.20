Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9045382383
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519528; cv=none; b=gkPicE0XS+8/LkjS5c3e99VUmn7v8AQw5cdHeCdxbvh03m0a2zLs36SyNQzLEzrzPgRrXtp2EscAnbwDLmc2RU+O+SoWDy7oCgL7uMk4cKTTAXZvGzHbrS5lbwH0UqIyxnjqbAd1zilmFJp03hrNULVTLFM0xZs6LR38+tsdgEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519528; c=relaxed/simple;
	bh=bcTTCZ4P5aW41J2GiHKBBR8lI2qcH02CUNdsoCICWJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irpbkSSZoZo8hitvWZFZLSEM1aGz117vn21p2bImDKDogv7DDtMmD4gbvDTA4UgXbtouDIqv8NCch19xxCSq/sdJJ16IbTmHnF8IeuSXGre5ArWsigksE1ti8XYnL6irBUmd1OPvZJaaWYZsBM5MxYXmDdElVdJ3CnPU1N2dtkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=lTj02mec; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="lTj02mec"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A10B940E02FC;
	Wed, 16 Sep 2026 00:45:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jefk5Gdqkrcn; Wed, 16 Sep 2026 00:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789519513; bh=RMCxd0RSMpfU6ltbjwVqRDjhq9HAbl9UwUphHcIzjnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTj02mec9kDvf0IAMQj5fKr2r+jX9o89CTyuDh+9QCkx7X2r/7KSBs49CCmO8qoEu
	 vYYiLx5wcvfmhKzBM5pppjR37gZlfUOkNhVRk1ZrRZDOrkyZbyKg3xfglgWvNdR8bC
	 VKVyEZsV3V/d6amu8tT7HgrvxKz1Xwk0pvJfskP0v+NZbZmKnyz06yy7Y1Ka1JOvt6
	 hwbHhWYUzPwlf+P4KT6mXbTINnqiuWtATaAAJXWXZDYcoITYUyA0XBZ43M9V09VUXq
	 AO9T+Zbyry/oes9WHpu/ucVtoJap8AfLVhCymNpYelShw6XO3CzbGEEocz3oyUGvDI
	 RpowQTxZF1u74e2t/SgPi0GfRHFas5H6Yd80OHoSupRdwF2FEynJAqzl8dm7eYIEiv
	 6yzflOXCI/Ldd3t3d0M+3QFyDkH/np6P7VNpZr00bzhgR9j1Nn6dkn5z37lNSN0Or5
	 Hr6TJ0sQ+D2q6gmTGb6fRW2R2DHFj2l7CsYtGfuOR6rmcuya6ak204lMUV7xY8fVRz
	 fDinCPpwG6VCaXUXb9HVfHbavOgpknCnS4CbOO8VrmAWvZTQEcB00o9BqAjQHy+j3e
	 1OjgAmHeAVujs3JPBI5rwz6m+hRoiOh8NyyEdjWJre+BwautXd1alox4Kj3PKHYXTk
	 wV4EFImdf6mRlCToyevPWt4o=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 391DA40E00B9;
	Wed, 16 Sep 2026 00:45:06 +0000 (UTC)
Date: Tue, 15 Sep 2026 17:45:02 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, kevin.shu@intel.com
Subject: Re: [PATCH RFC v1 0/8] x86/microcode: Enable uniform feature
Message-ID: <20260916004502.GCaqnmjjj7kApOD6_M@fat_crate.local>
References: <20260912000815.997720-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260912000815.997720-1-chang.seok.bae@intel.com>

On Sat, Sep 12, 2026 at 12:08:06AM +0000, Chang S. Bae wrote:
> Hi all,
> 
> This series enables another Intel microcode loading feature.
> 
> While this initial posting is marked with RFC, it is also expected to
> provide patches to the people who are interested in testing/using this
> feature. Tested-by is anticipated from that end.
> 
> So, x86 maintainers, feel free to ignore this round. Having said that,
> feedback will be appreciated and always welcomed.
> 
> == Introduction ==
> 
> Traditionally, a single trigger updates a core-scoped microcode, which
> thus requires executing WRMSR0x79 on every core. This also means that
> there is a possibility to load different microcode patches between cores.

Are you talking about heterogeneous cores?

> Despite this fact, the kernel currently enforces loading the same image
> across the CPUs.
> 
> This uniform microcode conceptually eliminates a chance of running a
> different microcode within a scope of CPUs. From the loader perspective,
> the uniform feature extends the loading scope to a larger number of cores
> than one core.

What does that even mean?

You want to avoid loading different revisions on different cores, you want to
support heterogeneous cores where you must load different patches, something
else?

> A few points worth calling out about the feature:
> 
>   * The CPU enumerates the update scope such as package-wide or system-
>     wide, depending on the implementation. The scope is advertised
>     via MSR and isn't programmable.
> 
>   * The scope reduces the number of triggers, whereas staging primarily
>     reduces the amount of work under the WRMSR window. Unlike staging,
>     uniform loading is applicable to both early- and late-loading paths.
> 
>   * For early loading, only the parallel CPU bringup is relevant. In the
>     legacy serial bringup, once the first CPU in a scope completes the
>     update, subsequent CPUs will observe the updated revision so skip
>     WRMSR0x79.
> 
>   * Staging introduced a new loading process. But uniform loading extends
>     the semantics of the existing flow. Software that assumes the legacy
>     scope remains supported. The next section discusses this
>     compatibility aspect in more detail.

I am more confused than I was before. I have no idea what uniform loading is.

> == Backward Compatibility ==
> 
> Older kernels assume a per-core scope, being ignorant of the uniform
> loading scope. So, they trigger loading via WRMSR0x79 on every core. And
> the spec [1] has the following statement, in Section 2.4 "Uniform
> Microcode Update":
> 
>    NOTE [*]
>    ... It is always allowed to load the update on more logical processors
>    than necessary, which may result in unnecessary additional latency.
> 
> So this means legacy kernels remain functional on uniform systems. To
> provide more context, folks involved in the implementation agreed to
> share additional implementation details with the community. Their
> write-up is attached at the end of this cover letter.

This sounds like you can load microcode on one logical CPU and that covers the
whole socket? Or L3 slice?

> == Appendix: Microcode Implementation Note ==
> 
> The uniform update protocol is an optimization for boot/runtime microcode
> update. It is backward compatible with existing microarchitecture of
> core/thread scope update and any OS MCU drivers that rely on legacy
> method of update.
> 
> With uniform update, if multiple logical processors attempt to load an
> update simultaneously, there is a race to an internal semaphore within
> the microcode. The winner of the race assumes control of the update
> process and sends an internal interrupt to all other threads (if only one
> thread initiates the update, it is the winner by default).
> 
> All other logical processors receive the internal interrupt at an
> architectural instruction boundary and proceed to load the update under
> the coordination of the winner. This ensures that the responding threads
> load the update in a controlled manner while at a well-defined
> architectural instruction boundary. If a higher priority interrupt or a
> fault happens, all logical processors will see it either before the
> microcode patch has been applied or after. In either case, all logical
> processors will see the same microcode revision and nothing intermediate.

I think you should lead with this, hm, weird requirement.

So let's first, please, give a second try at explaining what this uniform
thing is.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
