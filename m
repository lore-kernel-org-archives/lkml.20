Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9DB43712C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553085; cv=none; b=dhuqvHwjDkVnYSWl/MtZ17vIzSV4YJuNaNJ1uKOG+VTMdJ/z5wHWCCw7tME4JzRCasWbGTLlLW6UsJOOOMwYTdpzj/WkOotc8ZLe7sV5JzYfNwmPjLuV6OMu67FEswfaQDv8+KN5jRtuZOeWfUsXqDnji7RF1pQ3XE4kiSFwTx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553085; c=relaxed/simple;
	bh=D6YCv23vIDOCNfyAf84v3eDVXo5lUxySX5HoBloBXlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnZemfoloi08FMAbhZGQDfXuE4tg/2Dm2gidjUjlQEjlk2v7xa7j5N13XqLXTb0BpCu89+Mbot0nKmIUi5gv/Up8H8z0wLn0/E+TRLkKJhhamGhcIYHM/iVsvPYi/fNHbe3ldSdqXcZUFJUQeJZ+IlUiNmVzp+Y0HVpsa3bwtKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+KuC8Q1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+KuC8Q1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2111F000FF;
	Fri,  9 Oct 2026 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791553083;
	bh=br7/h9CMzB5fuTEO28g1+PfnC3yL5f0JjiAFRvFaz8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D+KuC8Q1FvILg8zl3t1LvibyxauqQYSf3VJQxr0bEWCTjFXJHPxrXYLHIPBQfdYG5
	 nEtG9+b0+1HwuIST5iGvEL88jqBb+UVJZYsukyAlS6y+DyVreO/gQFU2of9B4ZpyAA
	 RvAEaz0waBN2vjWlkOTTZtQlfXCmYqrkKu3+QA301EHGdp71AhE/ftNszTRc85thvD
	 s7WYlYrRSeg4waXXHPVEsoo8qvYe9YUtLuqzvqgK/CI3YYzx2ClVMhcx9VWK2tzfvG
	 zy0dEdDnhg+im/6CC9M5+z7yKIPj/1oDDgLqyE9inMEc83mYiNpvcIXZmU3aKDG+C9
	 EVShi0KSRd9kA==
Date: Fri, 9 Oct 2026 15:37:58 +0200
From: Thorsten Blum <blum@kernel.org>
To: Petr Tesarik <ptesarik@suse.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Hans Peter Anvin <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 1/3] x86/tsc: Replace magic constants with xxx_PER_SEC
Message-ID: <asjuNlFdLGsNUJh9@kernel.org>
References: <20261009100436.1133518-1-ptesarik@suse.com>
 <20261009100436.1133518-2-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009100436.1133518-2-ptesarik@suse.com>

On Fri, Oct 09, 2026 at 12:04:34PM +0200, Petr Tesarik wrote:
> Make it clear that these constants refer to the conversion between seconds
> and milliseconds or nanoseconds.
> 
> No functional change intended.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> ---
>  arch/x86/kernel/tsc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> index 723347e2cf7f8..bac81d37a90ce 100644
> --- a/arch/x86/kernel/tsc.c
> +++ b/arch/x86/kernel/tsc.c
> @@ -253,7 +253,7 @@ noinstr u64 native_sched_clock(void)
>  	 */
>  
>  	/* No locking but a rare wrong value is not a big deal: */
> -	return (jiffies_64 - INITIAL_JIFFIES) * (1000000000 / HZ);
> +	return (jiffies_64 - INITIAL_JIFFIES) * (NSEC_PER_SEC / HZ);
>  }

Maybe use TICK_NSEC here?
