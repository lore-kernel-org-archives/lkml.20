Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391173;
	b=iRM7+y0Yly/koroL8G0yhWrkuLM0K9+UsEOeiyAZ1LPYkCtCnGTPal44ulGMFgf94KpT
	 0p4ZcY+5BpwZZ02BmHYvFsLJyDgz9z/uVt1nh7YKm63juxOcBL34hzu4jPmGcuiBwT6xc
	 H6b782QlB4kPNQLKff5zmpEKfUrN3EUw90gWLB2o91IZlNEtaabKA050Vs+jkpUfk+aVk
	 8JsIh/uOAhIyl/1zztXF2EuTsZlgNka+++iXj7zqOfWVGnDk5fvki3moUsEv64U+q24mg
	 Go2Xk0vKMR6yUE9m3R5MswMVBjGm+gfRdYouhjVSHH9NfL6fVUnpgP20RIZde7B966g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391173;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=hp1XgAo2T9VabG3tdMB+IAUfvCTHW0OWXcirmwmfQMA=;
	b=zs1nMnIKLYglZ7KvykaUjeRHm/ncSy9vFMplB6pt82EDUezNFSx1spaPexhT3M2IWhU3
	 P6z2Bv23oW893EviEmxWfvuUxy8DRSCPIZWCp0CSGKFnTfaax+V58Fo+A/7RPRoSc/Yjl
	 /mpj6262bcWmcQdeekjsK8DW+mqL0imH/JTCg+8H90KuE/kchb5D0UAAHsfsqk3wKPIHm
	 gJH/LmEr3Xz+P+OWqdgvTTRYTkF/s27ZDSaa1Stme7JYaaIiO6loZn75ncEXHvPehMWRi
	 elBnx2Y3QCBzw3OUvshsCmLdcuvy2vbGDO8h2/pWPIWp/bmUDXgTYg/a1vBHeRXoBtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrHCaHoy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54674606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrHCaHoy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFD91F00A05;
	Wed, 11 Nov 2026 09:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391173;
	bh=hp1XgAo2T9VabG3tdMB+IAUfvCTHW0OWXcirmwmfQMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IrHCaHoyiKo1N9O9LLDj5GCu4KUrrqPEaKLWMAkK+SyIMl5UdzU4tHXxqP4lnXxjW
	 lAp/Do/LY4fQDQNHZNfpvw4XmvWlNKJ4V2yBhH29aFBGG2dLcRtiLzxFxH0RRrnvpb
	 eGgI0BqI6DFq/mRSJBzmHE9ukbZzfh0KwgyZdiXXvfT4uQgcCOeb7DCRafvOeAj1Qz
	 Xp0VaQ1rxHobox6bh1DjXubgVwCIwuB+nPSTLdYDu3dabcZDQEER3/e9xijc5w1AAl
	 OtzMe/rKvQ1oc9OxjcBnUEN9LhISmVYqlvdF9KyN0AMelCsVkLXVrs1YD91ZZjevTf
	 r42c1BTqKoYaQ==
Date: Wed, 11 Nov 2026 10:59:29 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 1/3] tick/nohz: Re-evaluate the tick on polling idle and
 on user entry
Message-ID: <avQ8gT1D6p1d2MS3@localhost.localdomain>
References: <20261106160621.347228-1-marco.crivellari@suse.com>
 <20261106160621.347228-2-marco.crivellari@suse.com>
 <au5RmN37RlOCp2m9@pavilion.home>
 <CAAofZF6_JpSDNSKUuePiJx+74tbRH8vJ4spyNGp9KbjFPrbA0w@mail.gmail.com>
 <avMdOa44c5qvryuH@localhost.localdomain>
 <CAAofZF7KAnd0xpOcgKDs6yDL9vmbON3xRAK360BBuzEpwJzu9g@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF7KAnd0xpOcgKDs6yDL9vmbON3xRAK360BBuzEpwJzu9g@mail.gmail.com>

Le Tue, Nov 10, 2026 at 06:35:49PM +0100, Marco Crivellari a écrit :
> On Tue, Nov 10, 2026 at 2:33 PM Frederic Weisbecker <frederic@kernel.org> wrote:
> > [...]
> > > With the hunk, the stopped tick firing for the first timer sets
> > > TIF_NEED_RESCHED, the polling loop exits and the tick is reprogrammed
> > > for the second timer within a few microseconds; the 10 iterations
> > > captured take 0.92s instead of ~18s. Without that hunk, the CPU stops
> > > spinning on an unrelated event.
> > >
> > > So in my understanding tick_nohz_idle_exit() program the tick only for
> > > the earliest timer; when it expire, the tick is stopped and not
> > > rearmed in tick_nohz_handler() (HRTIMER_NORESTART). Without setting
> > > NEED_RESCHED if another timer has been queued it has to wait for
> > > another event that set NEED_RESCHED.
> >
> > Hehe, you're right :)
> >
> > Let's try another strategy then. TS_FLAG_INIDLE is what tells nohz_fool whether
> > to manage the tick through the idle loop or through the IRQ exit.
> >
> > So why not calling tick_nohz_idle_enter() on each idle loop iterations? That is,
> > from cpuidle_idle_call(). And call tick_nohz_idle_exit() right before
> > cpu_idle_poll()?
> 
> Aha, sounds good! :-) So INIDLE is set only when really "in idle" (eg
> no polling).
> 
> > Then you can remove tick_nohz_idle_restart_tick().
> 
> Should we remove only the call or also the function and its declaration?
> I'm asking because the call we're going to remove is the only one present.

You can remove also the function.

> 
> > Just be careful: tick_nohz_idle_enter() and tick_nohz_idle_exit() may now be
> > unbalanced. If TS_FLAG_INIDLE is already set, tick_nohz_idle_enter() should
> > return early and tick_nohz_idle_exit() as well if !TS_FLAG_INIDLE.
> >
> > Also IRQs may now be disabled while calling tick_nohz_idle_exit(), so it should
> > use local_irq_save() and not local_irq_disable(). OTOH tick_nohz_idle_enter()
> > should always expect IRQs disabled.
> >
> > So the purpose is to move cpu_idle_poll() outside the dynticks idle logic, then
> > it's safe against nohz_full timer management, the tick keeps being stopped if
> > possible and it's only restarted for dynticks idle.
> 
> Ok, I think it's clear.
> 
> I've already started implementing the changes. I will send v2 with all
> the changes.

Thanks a lot!

> 
> Thank you!
> 
> -- 
> 
> Marco Crivellari
> 
> SUSE Labs

-- 
Frederic Weisbecker
SUSE Labs
