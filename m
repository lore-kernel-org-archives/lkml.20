Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B672F3438B9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553353; cv=none; b=pBopRBm/i6MUpbAQs63hbVvzInq5n063USRDC7kX21WygT7wRsL0uVo4iOi+xBu7/9F7redEiD9P40wGmZw5bum0hp1OUca7mnrBVRxXXnp7PqLEaCEwxJsEgPwhBv/nMhnuwUMOrvJuHu3Pm8CqiBZYOVNhgFGYIQNlZf56tO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553353; c=relaxed/simple;
	bh=H0JFzYKFvfZ62ZwnlWO8o3pxZ6bvkB0afd0y0xAshj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpJed6zT7+fWKbwpUbPsm96pE7HQvs/gHyv+ZmfAMICtX/YTAjfw9g8BWBdiNs+ddWbFSSBqAkAi6y+htR7WUx3lnFoMHIAq4kHhg4BRjcZU+foqExrcWP6Q3Cdw5jrjmuzYTI/gMbx7X/kKz0zA75m1emcyZ6y1/4uSU89M5Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qv9Sx+9M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qv9Sx+9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8631F000FF;
	Fri,  9 Oct 2026 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791553352;
	bh=AL3f6mEoawJ9HW9Wk3wp7IdRwOgr3ARvl4e9/hReObI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qv9Sx+9ME0axEJXwI4GpzPioiuXUGHjkeNQKu0K422H/HsT2wffhDKJMJe5uf4vh7
	 xpxlpK01u/QGTsTkJ6CnO5nFELmprFfiJ25YCtOWfxOcZNs61qeB+0QQ74JUUitVQi
	 Kztd3/+HteFXzF/X+TPVgcrru3Hrqb5JQ43+15uj3726DzbIrs2B2yxsdLAxEmcBMk
	 baXWnd3TS3Q90+kOH99Yp0a4whVNr8a4/pFea5OGrxy3aMQoG0oi2PmExbjLDjiCNf
	 Uk6eTsD+UpauGF/nh7OOEcPWvuARUy5r97XW9lYb3zKiF16JAmLoAqXJbmE/kb2kHi
	 dvb9Qo1q5BuQA==
Date: Fri, 9 Oct 2026 15:42:27 +0200
From: Thorsten Blum <blum@kernel.org>
To: Petr Tesarik <ptesarik@suse.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Hans Peter Anvin <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 2/3] x86/tsc: Define and use HZ_PER_KHZ and KHZ_PER_MHZ
Message-ID: <asjvQ-3mZzYdtTie@kernel.org>
References: <20261009100436.1133518-1-ptesarik@suse.com>
 <20261009100436.1133518-3-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009100436.1133518-3-ptesarik@suse.com>

On Fri, Oct 09, 2026 at 12:04:35PM +0200, Petr Tesarik wrote:
> The KHZ macro is ambiguous. Sometimes it is used for conversion between Hz
> and KHz, and sometimes for conversion between KHz and MHz. Use two
> different macros to distinguish between them.
> 
> Convert plain 1000 constants to one of the two macros where appropriate.
> 
> No functional change intended.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> ---
>  arch/x86/kernel/tsc.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> index bac81d37a90ce..8b905c4dbefe2 100644
> --- a/arch/x86/kernel/tsc.c
> +++ b/arch/x86/kernel/tsc.c
> @@ -41,7 +41,8 @@ EXPORT_SYMBOL(cpu_khz);
>  unsigned int __read_mostly tsc_khz;
>  EXPORT_SYMBOL(tsc_khz);
>  
> -#define KHZ	1000
> +#define HZ_PER_KHZ	1000
> +#define KHZ_PER_MHZ	1000

These are already defined in linux/units.h.
