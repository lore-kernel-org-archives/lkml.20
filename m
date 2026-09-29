Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243D5345725
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692525; cv=none; b=nD7EoBu7iUwOqB5rdnplol6Kdc7czHy3eDWp+KU5PF2Qex/pU6aTDA5GVVMHq3rgpWr5lAiafKnMVYoQCKcYe1wOLuwFBdnpkql45zxLdirNn3fzEVTaORNcaqxMA2LXmKgJpGfOkvK4Wo1Sck2klDdJ3LjpgI/tJC3TCaf0REw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692525; c=relaxed/simple;
	bh=7DJqiPx/uh+FaUHFDlnsfIDPpG8J3+Jh68NLshvupQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOBhXSH2HYStHx1CnOpJvptNHao1nrp6NKAgl3tL5WYPCQAm5jqlxG+KxkHvoryPPy3kVx8BZqic95LO7l1XH8hFwmw0aH2SIrRqeFbWgQownku3rVqKl1s2TorYy8BmMbK9iiPROa3TdiR5IkOpS6bpLGltE+ebcX2FrOh9L8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjUdSti5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjUdSti5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A5C1F000FF;
	Tue, 29 Sep 2026 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790692520;
	bh=xXsyG1nJZcjvmXOLppTmlV6HL6GNJEk1tug38gOX6l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IjUdSti5PbGtpxTH9nZfpeWsbi0bAFEBEQgVElcuOKCzN/zvZsmvUgJnM3NZTIrRg
	 jamQRDL4Fe/VVJ9P+xNWfOHSSnFU/6jmptwUAdy5KFKjsjofxgATg6Y1INB59K1ybn
	 OjPd5zkLzYCyEETvR8VmutueNwMipWkvSozbzc/x6e62Tak2Roh7MIHekVrEw7LWVT
	 4qIw5AzDUpDcX0/5pGM6av4aj62QuRCCoe+62hiIn5nyUY91XGRCzdj5LRZf0j+Kdq
	 LKX/5DyBFT5UquYEqIibMnIMbnwYwX4vtKkHKmFAW91Ui21mjMgQS+M3wM+xhXYH5M
	 veB8hha56G79g==
Date: Tue, 29 Sep 2026 15:35:16 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 7/8] clocksource/drivers/arm_arch_timer: Expose a
 direct accessor for the virtual counter
Message-ID: <arvMpP8Htq3dKu99@willie-the-truck>
References: <20260802165327.385217-1-maz@kernel.org>
 <20260802165327.385217-8-maz@kernel.org>
 <aru1QvpaQ8A-OnQq@willie-the-truck>
 <868q4k3zds.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868q4k3zds.wl-maz@kernel.org>

On Tue, Sep 29, 2026 at 03:28:47PM +0100, Marc Zyngier wrote:
> On Tue, 29 Sep 2026 13:55:30 +0100,
> Will Deacon <will@kernel.org> wrote:
> > 
> > On Sun, Aug 02, 2026 at 05:53:26PM +0100, Marc Zyngier wrote:
> > > We allow access to the architected counter via arch_timer_read_counter().
> > > However, this accessor can either be the virtual or the physical
> > > view of the counter, depending on how the kernel has been booted.
> > > 
> > > At the same time, we have some architectural features (such as WFIT,
> > > WFET) that rely on the virtual counter, and nothing else.
> > > 
> > > If implementations were perfect, we'd rely on reading CNTVCT_EL0,
> > > and be done with it. However, we have a bunch of broken implementations
> > > in the wild, which rely on preemption being disabled and other
> > > costly workarounds.
> > > 
> > > In order to provide decent performance on non-broken HW while still
> > > supporting the legacy horrors, expose arch_timer_read_vcounter() as
> > > a new helper that hides this complexity. Obviously, this is simply
> > > a global alias of arch_counter_get_cntvct().
> > > 
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  drivers/clocksource/arm_arch_timer.c | 2 ++
> > >  include/clocksource/arm_arch_timer.h | 1 +
> > >  2 files changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
> > > index b3b31d4f4815f..9c7501ce57073 100644
> > > --- a/drivers/clocksource/arm_arch_timer.c
> > > +++ b/drivers/clocksource/arm_arch_timer.c
> > > @@ -128,6 +128,8 @@ static notrace u64 arch_counter_get_cntvct(void)
> > >  	return __arch_counter_get_cntvct();
> > >  }
> > >  
> > > +u64 arch_timer_read_vcounter(void) __attribute__((alias("arch_counter_get_cntvct")));
> > 
> > nit: compiler-attributes.h provides __alias to make this a tiny bit cleaner.
> > 
> > That said, why did you decide on the alias rather than just having this
> > as a wrapper function?
> 
> No idea. Laziness, probably.
> 
> But I've paged most of this stuff out, and I'm not sure it even serves
> a purpose, given that we've lived for about a decade with the problem
> it tries to solve.
> 
> Consider it an abandoned series.

Ok, but patch one is probably worth taking to fix the PMU issue, no?

Will
