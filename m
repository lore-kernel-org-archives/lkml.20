Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792471985;
	b=HG/xDWMq3zMN5DNu3M3Acl82hCsJbXnLC0A39yD8AAuIiY02c1E3ujLtR7klz2fumyYv
	 KhuPH9crIC9DFgMaK+ie9HPh4o7JvgipgeJ+vFCcorq3oDVptWUBc0FLH1glSReslVEMb
	 pHXiB7ae+SFPpVOQt+YYHHL8wzDfLcJlbKdQZ+Q1F5ojlEMFkMwCnRV0MsPJ2DZIopj9f
	 fSsCOhbn1/kTF+Hi4O0/jYsMepgV26juQSBRZY18zLxdwwignlrWv5Y5NqyA200diCfzF
	 08zzWY8CRtjaphq/JeR/NbN5uIvwbdgzv4rauvURXO304Id0YlfbEMXPJlJZiYnIedg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792471985;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9y2GwAwKf/Bl2v9VhIZSCOdz4yUOGHWR0BlQG2ZOO6Q=;
	b=2ar1dazxcUnmbovc/2jeAtq4xysz1SaXQxiYWpv7WzH/8W4E1u5IwanGbcF0wLDhPHBh
	 JC01RDkejBeOVeGFPL/fNJFlcLCkP5vUwxcWe8eYQu+YsjaWvvo+IAfoL5k8CJxwyt/Tx
	 lIhRhurn/VXqmAb9OWQ98KSI7mavy1rSz+Sq9WW5fF5JMHjg36e1hF5oiE69WgVcYxYKW
	 kFMW+abqFALOO0cr+n7cfW3O06x7g8fFC77Uov51kj5d0zb2m/sqgQ2bL1m/GT4y1j5fT
	 BXJcDe7jlii1lY0jg1jJCr+rEQYqJurh1U2kR55Z2CYYiei0YsWA9uTF6cnneXJFUfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Rd2dc6gA;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB8C606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB8C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Rd2dc6gA
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2360E40E02A0;
	Tue, 20 Oct 2026 04:53:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CNY5w2XjlH3g; Tue, 20 Oct 2026 04:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792471978; bh=9y2GwAwKf/Bl2v9VhIZSCOdz4yUOGHWR0BlQG2ZOO6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rd2dc6gAEIXJB2Id/KTMW5bLrKtCJkSdu64Pm/lY062ty1DMOFUiFljBkjQlMr75c
	 nqNmXIXCjZ38MbxrrMH7go3GqUmzcbFfGCARXkgOvuBXVSlg6uxfPcJk1sNnvIhGJG
	 6hro3J4jWUcAarIYGwLRSKiMkdy+A2JIm2487j9FD6SnGTIwIpblGzWjI4XiouIu5n
	 J9F03ZfkehmUdMYE9MxOucK/SQAGePhullhmYk3+/1s8kXBb3VZor4lrPKu+5o7Ns9
	 x42LOFCyrY7YBmm4cuKBvwk1kGxkIsNnsbQBBRzeyL6QEm9k3s39fWfhlBU3Ri2H74
	 oiyZhCDSvUvjun6o9IZO7vfAYKrixexFAzjh4pYK0NcOYx3EqcZZ5Oq+ZRDZ+5tp5R
	 2yfATraEEMgDX4e/w2D8FdX/RDjOIubS5D81dMqziyyO7/qr+LJBF5xf4CiM23LIYN
	 K481Vla3AV4p101rnQH0b81k3mw2dq1mdoAF57M1o3Hs8gBmO4KWa08iJ0o/G+Fnnr
	 w530mAWjoIaAwI9vct34f7fHM1XDn4rJV6R469E3SCHpJARfaONBMpdJ6kYQVhVVcT
	 dExfza7UAerq6WO0wexcve/a8W1indVrz7hPI7Ps1YYfw/0eueBEQgcK1x5DcRrrxu
	 jWNApxUxleaCuCRwJafV0mDw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C86D940E029B;
	Tue, 20 Oct 2026 04:52:49 +0000 (UTC)
Date: Mon, 19 Oct 2026 21:52:47 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] x86/nmi: Enable panic() when NMI handler runs too long
Message-ID: <20261020045247.GEatbzn7VKvUfDTbR4@fat_crate.local>
References: <53ff8d29-b7ce-4b3f-bdcf-9ac1f31f0a9f@paulmck-laptop>
 <8b14bd35-8f7e-4e41-9aae-e085f9a536f6@paulmck-laptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b14bd35-8f7e-4e41-9aae-e085f9a536f6@paulmck-laptop>

On Mon, Oct 19, 2026 at 01:44:30PM -0700, Paul E. McKenney wrote:
> Firmware, device-driver, and configuration issues can result in
> long-running NMI handlers, for example, nmi_cpu_backtrace_handler()
> running for more than two seconds, and with no console issues.  In this
> case, this is not the fault of nmi_cpu_backtrace_handler(), but it is
> the first symptom of the underlying problem.  These NMI handlers result
> in various other problems, including CSD-lock warnings, clocksource
> watchdog false positives, scheduler frequency invariance wobbliness,
> systemd excessive-CPU complaints, and even the occasional RCU CPU
> stall warning.  Eventually, the automation will take the system out of
> service, but with quite a bit of noise obscuring the underlying issue,
> and thus confusing both automation and human beings.
> 
> Therefore, provide a toolong_nmi_panic __setup() parameter that makes
> nmi_check_duration() invoke nmi_panic() if the just-completed NMI handler
> ran for more than the specified number of milliseconds.  This parameter
> defaults to zero, which disables the nmi_panic().  As in, by default
> you get the same behavior that you get today.
> 
> [ paulmck: Apply kernel test robot feedback, add documentation. ]
> 
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: <x86@kernel.org>
> 
> ---
>  Documentation/admin-guide/kernel-parameters.txt |    6 ++++++
>  arch/x86/kernel/nmi.c                           |   21 +++++++++++++++++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> Changes since v1:
> 
> o	Add documentation of new toolong_nmi_panic kernel boot parameter.
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd24..e7dbd5bf48fc9 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7642,6 +7642,12 @@ Kernel parameters
>  			Format: {ipi}
>  			ipi: switch to IPI-based TLB flushing
>  
> +	toolong_nmi_panic= [X86]
> +			Cause a panic upon return from an NMI handler
> +			that took longer than the specified number
> +			of milliseconds.  The default value of zero
> +			suppresses these panics.

Cause a panic after an NMI?!

Oh boy, is this trying to solve a Meta fleet problem and you're thinking, why
not upstream it too?

Because I fail to use the usefulness of this...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
