Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512963;
	b=zzpH53WT+M1b6D9xcnd5dlUApFASRwDUC6I630xHMaeEPYn7U04tMIt2vfUtCYbAvN6y
	 BKWFVWiQgSzQ/Ig3R5bQgDsEyeO1hhoMgPpKCWX/wtoZZO6ZGhzzapebITAUPQqxRZnFe
	 YQZ4rjzipqNkbhnw5nFzLfDQ9GxvvwGCSMbwaxRdNSkdACPD03qV5bWzAxGCAWBSkb40m
	 1ujfXc1E8bD6a2KOnwPq6wZimaVMs0y78Zmz/qwJcSIJDgIHkR0bsgSM3ANjI8J9/P9ao
	 x4LfjuJMpmEYYua6a41waA/lmZ2nu1Ehqjcr3WnTAzWVvsqiPVKBb+3KGYjc0l4dvzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512963;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=6UBGr0JtIRvk1fPr8ZpS8vOpHIMNcYvo4indNpVaC7w=;
	b=yLzr3nl5GHbTmsrQDp3hgzwU9S8uvoPMpV/wBw9xAk+F3ewFf6hDFwRlCHwFpLU6BQvX
	 w+voRhpx9gQRN9pel7zUrTXU4zYjFlweVJnBYiViKm2leqO03oC3cN1/FfGSXL20WWRLI
	 LEMWvK8VyNaVhIv33/HyTXlLcA3zIFmp9DZK32tRBSiey7wVk/pMw/mKQtjkSIP2s3g4E
	 BPKdZn2Nh3tPKFQ82fZDn2Fc4G25EVtpgxv9coIfz+gSZQl0fyD2T1K0nOqKBI7BOvtGW
	 kaT0KCe7yquM5RI0sbw7Ox9AWRLM/f5F75cOc5DNpRgWArn+PIxfb6d8e7mymYHel1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZxV3ryO6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C414606A335
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZxV3ryO6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DD91F000C5;
	Tue, 20 Oct 2026 16:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792512962;
	bh=6UBGr0JtIRvk1fPr8ZpS8vOpHIMNcYvo4indNpVaC7w=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=ZxV3ryO6Hy3FIBqzbc0wKjz2VgeWA6ZXej5ZZyGr52zrKBDXH/qKc104OM+CshDhr
	 K+U6bQbtBM1xPYRVFEjFn9ux+Hr8fXXlWyztZ41MTH8gTtVj+RyHAkO1kF5K9kRdIG
	 LGTH18tg3FHQ8Bli6ao2665LTbqKX987h2aWw+ncHno3WK/ovs3/XzlU44Eusus5U8
	 bZVfMeQlXwb6gELaol6YTomno3QkNVRYh0i9rLOMlVS37IOfRl8V9h30s9rHbtKCGB
	 AzjT6H9dadW3FtSFBz2+mhpVxphMCjA80XNu9hnT9q11BMNxZSa+fwKhnlK9rLfo6z
	 rKQBuvyyeLaag==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 20AAECE1B83; Tue, 20 Oct 2026 09:15:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:15:56 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] x86/nmi: Enable panic() when NMI handler runs too long
Message-ID: <5182974b-500a-4076-b9a1-5c67dded8380@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <53ff8d29-b7ce-4b3f-bdcf-9ac1f31f0a9f@paulmck-laptop>
 <8b14bd35-8f7e-4e41-9aae-e085f9a536f6@paulmck-laptop>
 <20261020045247.GEatbzn7VKvUfDTbR4@fat_crate.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020045247.GEatbzn7VKvUfDTbR4@fat_crate.local>

On Mon, Oct 19, 2026 at 09:52:47PM -0700, Borislav Petkov wrote:
> On Mon, Oct 19, 2026 at 01:44:30PM -0700, Paul E. McKenney wrote:
> > Firmware, device-driver, and configuration issues can result in
> > long-running NMI handlers, for example, nmi_cpu_backtrace_handler()
> > running for more than two seconds, and with no console issues.  In this
> > case, this is not the fault of nmi_cpu_backtrace_handler(), but it is
> > the first symptom of the underlying problem.  These NMI handlers result
> > in various other problems, including CSD-lock warnings, clocksource
> > watchdog false positives, scheduler frequency invariance wobbliness,
> > systemd excessive-CPU complaints, and even the occasional RCU CPU
> > stall warning.  Eventually, the automation will take the system out of
> > service, but with quite a bit of noise obscuring the underlying issue,
> > and thus confusing both automation and human beings.
> > 
> > Therefore, provide a toolong_nmi_panic __setup() parameter that makes
> > nmi_check_duration() invoke nmi_panic() if the just-completed NMI handler
> > ran for more than the specified number of milliseconds.  This parameter
> > defaults to zero, which disables the nmi_panic().  As in, by default
> > you get the same behavior that you get today.
> > 
> > [ paulmck: Apply kernel test robot feedback, add documentation. ]
> > 
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Thomas Gleixner <tglx@kernel.org>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: <x86@kernel.org>
> > 
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt |    6 ++++++
> >  arch/x86/kernel/nmi.c                           |   21 +++++++++++++++++++--
> >  2 files changed, 25 insertions(+), 2 deletions(-)
> > 
> > Changes since v1:
> > 
> > o	Add documentation of new toolong_nmi_panic kernel boot parameter.
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 68647ff4bdd24..e7dbd5bf48fc9 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -7642,6 +7642,12 @@ Kernel parameters
> >  			Format: {ipi}
> >  			ipi: switch to IPI-based TLB flushing
> >  
> > +	toolong_nmi_panic= [X86]
> > +			Cause a panic upon return from an NMI handler
> > +			that took longer than the specified number
> > +			of milliseconds.  The default value of zero
> > +			suppresses these panics.
> 
> Cause a panic after an NMI?!

When the NMI handler runs for more than ten seconds, life is hard anyway.
And no, these were not bugs in the several affected NMI handlers themselves.

> Oh boy, is this trying to solve a Meta fleet problem and you're thinking, why
> not upstream it too?
> 
> Because I fail to use the usefulness of this...

I might be wrong, but I doubt that Meta's fleet is the only place where
such bugs appear.  ;-)

							Thanx, Paul
