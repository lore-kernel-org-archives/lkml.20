Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AA03C061F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792183706; cv=none; b=m2QqjyBLPFp/F4HEvLZg8kIsiI7z6/I2tDNPTEORxaT1Xg9az+YMxaM2PiVo5pwkXFaR3CMN2TGAd8zFh2PHbzVnXdq2fE4y7khyVZ2vpPTdOdkgRI7BF5ATkXOWKzrEnohoU5csyF8iCAozt9WA9rFIKuvErOP2DhQBOvubQuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792183706; c=relaxed/simple;
	bh=cYFTm9Nc2gqNdgyZ35xsSY7JeCdgIJzgWJf7GvvMLZw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n0AGAZCmCXbYTr2AGLSpBmqpNP9mY6mQMKhvQ5sh+nM/e4f9pi1iAhdXgtTIA5YsoDutbckU6Bs7mWwlu1Tr++Qg7YGUKgBaNOkOSFwQbdH/dfH4XMB2O50DJkC+s091O2Ambj7dCzlJh2tC6Bh1ssw0mJw97lq31YIy+C/dTN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aGSh1a7V; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3VfKh040; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aGSh1a7V";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3VfKh040"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792183701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeyVsOyXsONjJlnThzWKAJr9Mu7+kuLWZkfW4XvRl34=;
	b=aGSh1a7V/J33HNsKFlE2OOG7jAPTDbOmO0xPQbU+ajEZhhJtMZqoTkQHxkWk+n3L239u8q
	zk6nPUNzutF+aKlmxp05adgFFMNVPjvzZ7abaUM7bukyMz/MrTa0vFj1HGGVLhQONP4Jhn
	FQDakVIHy103NRXKZICxP3Cwrzt/4ZVuoxYTuhecywZb9I1orFjegw+iGnxo09OyLc+ClX
	qhbp6yKrOEYkDkXycF0JPekHmxee1DOXmD4Bkklq7tmZ/LORfexRAU0rRNhXR6r09WsAe2
	Y3RVzBcVfbab1HhD0XvdEKL9xwxKnywLpnt3x3kFdQIt9+0NFjAGyjpzhwFKsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792183701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeyVsOyXsONjJlnThzWKAJr9Mu7+kuLWZkfW4XvRl34=;
	b=3VfKh040XyM3Txm14TaKN+SNdW/p/vhtfQQdKk8Kw9kdApVU6lAs0kBotBn8Ie8QG+kHI/
	ONzRdZ2D6orazQCg==
To: "Hahn, Matthias" <matthias.hahn@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "peterz@infradead.org" <peterz@infradead.org>, "Hahn, Matthias"
 <matthias.hahn@intel.com>
Subject: Re: [RFC/DISCUSSION] x86/tsc: Handling legacy PIT fallback
 calibration on modern platforms
In-Reply-To: <CH3PR11MB08137159D0CC079C8BFA13F6E7F1952@CH3PR11MB081371.namprd11.prod.outlook.com>
References: <CH3PR11MB08137159D0CC079C8BFA13F6E7F1952@CH3PR11MB081371.namprd11.prod.outlook.com>
Date: Fri, 16 Oct 2026 22:48:20 +0200
Message-ID: <878q3xcqy3.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Matthias!

On Tue, Oct 06 2026 at 12:53, Hahn, Matthias wrote:
> We have recently observed an issue regarding TSC calibration fallback on
> modern client/server platforms (specifically Raptor Lake and newer) when
> running inside restricted virtualized environments.
>
> Problem Background:
> -------------------
> In arch/x86/kernel/tsc.c, quick_pit_calibrate() assumes that legacy port
> I/O accesses (ports 0x61, 0x43, 0x42) take roughly ~1 us per read.
>
> On modern platforms, however, legacy port I/O cycle latency has increased
> substantially. In benchmark comparisons between older platforms (e.g.
> Broadwell-DE) and modern silicon (Raptor Lake), 1024 PIT reads took ~2.7M
> cycles on BDX compared to ~21.3M cycles on RPL (~8x-10x slower, yielding
> ~10-20 us per read).

That's a known problem and the proper solution is that the firmware
provides the TSC frequency in CPUID. Those CPUID fields have been there
for over a decade (starting with Skylake IIRC), but are still not
populated consistently.

> As a consequence:
> 1. When running as a guest under hypervisors that restrict or mask modern
> =C2=A0=C2=A0 enumeration methods (CPUID 0x15H / 0x16H, MSR_PLATFORM_INFO,=
 paravirt
> =C2=A0=C2=A0 clocks, or HPET), the guest falls back to quick_pit_calibrat=
e().

Trivial solution: Fix the hypervisor.

> 2. The inflated I/O latency breaks the internal loop budget:
> =C2=A0=C2=A0 `d1 + d2 >=3D (delta * MAX_QUICK_PIT_ITERATIONS) >> 11`
> =C2=A0=C2=A0 triggers prematurely, causing quick calibration to fail fast=
 ("Fast TSC
> =C2=A0=C2=A0 calibration failed") and leading either to refined calibrati=
on timeouts
> =C2=A0=C2=A0 or inaccurate tsc_khz determination.

Nothing the kernel can do about.

> Questions / Points for Discussion:
> ----------------------------------
> While hypervisors clearly *should* expose reliable timing interfaces
> (CPUID 0x15H, pvclock, etc.), fallback robustness in the kernel remains
> desirable.
>
> 1. Deprecation / Removal:
> =C2=A0=C2=A0 Is there an appetite to deprecate or completely drop legacy =
8254 PIT
> =C2=A0=C2=A0 calibration from modern x86 kernels, or is strict backward c=
ompatibility
> =C2=A0=C2=A0 for legacy systems still requiring it?

Disable it and half of the machines out there will fail to initialize
the TSC early. That's not about legacy systems. AMD does not provide
CPUID0x15/16 at all and I just logged into two recent Intel machines
which _have_ them, but the content is all zeros.

> 2. Guarding by Processor Generation:
> =C2=A0=C2=A0 Should PIT calibration be automatically bypassed / refused o=
n modern
> =C2=A0=C2=A0 CPU families (e.g. based on family/model or modern feature p=
resence)
> =C2=A0=C2=A0 where 8254 hardware timing assumptions are no longer valid?

And if CPUID 0x15/0x16 is not populated then the kernel uses a crystal
ball to determine the TSC frequency, right?

> 3. Heuristic Adjustments:
> =C2=A0=C2=A0 Alternatively, should the loop timing heuristics in quick_pi=
t_calibrate()
> =C2=A0=C2=A0 be adapted to account for multi-microsecond port I/O latenci=
es on modern
> =C2=A0=C2=A0 chipsets?

Good luck with that.

> I would appreciate thoughts and guidance from the x86 and timer maintaine=
rs
> on how the community prefers to handle this architectural gap.

We prefer that the hardware/hypervisor people finally understand that
not providing the nominal frequency in CPUID or some other
architecturally defined way is a patently bad idea and subsequently get
their act together and fix the underlying problem instead of expecting
magical software workarounds in the kernel to paper over them.

One potential workaround would be to utilize the _CPC ACPI tables, which
contain the nominal P0 frequency on both Intel and AMD, but those are
not accessible during early boot and in restricted guest environments
probably not available at all.

The kernel community has told both vendors for way more than a decade
that a architecturally guaranteed way to determine the TSC frequency is
required to solve all the underlying problems. The virtualization folks
worked around that by implementing their own paravirt clocks as a
wrapper around TSC, but that's a horrible and fragile hack as well.

Looking at the TSC evolution: It only took two decades of complaining to
get a frequency invariant TSC, so maybe in ten years from now we have a
architecturally guaranteed way to determine the frequency.

Thanks,

        tglx
