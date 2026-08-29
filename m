Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1EF3A0B2E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788038144; cv=none; b=PVaIhW3ArsIQZ2kBOyXGIMhhypp5LMifjUy6KhJLvXkJEAVdw3OfKRVO4PyiZxfod67T0ZfRvqgohtBbENv2dAgYn7N8hMZms+Yjiqsdk3R3/291oIEx8VrbY3VIylyJiEOxQX9JWCfHvUX676VEKRS9G3IhyH2t/N23c5C00J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788038144; c=relaxed/simple;
	bh=mjynPxD7nRchsj2Yqc6Yl1iIO6s6FS4XtySh9N842JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+Hpk/e2Kqi8NHr+S/stfUOr3tSiOg3UfZxx/JrFODOJyI5mqOtTC+Bj0Ab/SefGjWdUN2hGfCjfD+A4PWVgJ+UEtTBJ1Z9v4ZRIuZVE2Ih08XiEd0sVBTZiIAju0kOsUaWu37+YL4YrkcgoKlWNmaIvxIAqiBq0ZwdMas+l47g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oAy0sfCf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oAy0sfCf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96D51F00A3D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788038140;
	bh=kl82kjwNjANSx5Y/E3qWOyitFO8M63uxkYUOYWoDpS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oAy0sfCfornUy0c41L7gSGcznMexgpaCaMaVgzKlJPX9iyYBfYqZPNChZDocHEJqW
	 dxs1lIfGylE2Kja4kWC1FdanGMgAHhhsqE4mS2URRWsUBHD3GKg81UB9VP8b/1UBge
	 C3ZJ9UNUhToeuM/kRY/7CixFfTGBQVUCsdhfwuNmXsOfzpRJ5UuhNCON3mWOHtbhpZ
	 iWAdr4gc1+bdX+BOZMjnuhN5OX1GLl6vzAU9Xq+zdPp/cxVifYGD5Zz+MQ8IqSsELd
	 pQsEx3d+0Y27KkijJ4iEcLvGfdX+MnAqjJimXReBxNh0cbpFU6YRsf8FFUYptocVHX
	 k1RaSuwt13KWg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id F1829F40068;
	Sat, 29 Aug 2026 17:15:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 29 Aug 2026 17:15:39 -0400
X-ME-Sender: <xms:-0uTartXnnSIY76Ul1Telc3fHM_8u9LgRN2R7iPL-q2m108AH-bVaQ>
    <xme:-0uTautgb_NXlu8NW6WXatpP0Lo4tOFKZSYRAisvspLOXAdtXF5KXvEZG8yB69fEK
    tqrROK6f7PmdXAPOCTgQ_nGrrTfdDDUuJJ71ouZWTEBL3D1x3j_7A>
X-ME-Received: <xmr:-0uTahBCZ8V41zQEhUkYl6ED3U2lr2g0cplVZvwRWVu3kBJPp4QVihaJGOCPHZmU43EZgOh7oiWy9809RVZB-KtmWhnqwLIr>
X-ME-Proxy-Cause: dmFkZTGmpeKORl6G3QJhcnyta6QmboqpwAgEvILdgXf04fMXbSHlKiyMHSEs8fzwWeMSE2
    goNVqKQQFg9+wMyPmaDuz4WXZCYiJCs57nJHQgL9Vaq6RaO1nqJq8+sRPWjHr59yi154wm
    0JxEROeS25IXAKpS6S7j4ZV/cnKXEUCl30LNWgIMaEmh9vJTBSSwMNUResIs3QzylaTbHV
    Nc0PtrHTvSKD/g5O2oba1eYNCGpeUSE8WPFqV1inKDxFcldSUN74T70mJcjjwG6pxiyUnA
    BH4MojuD2hC9VLL9V0W+ZJAgcQw2KeHX/NwGzrSgxJF5j7A3uIGuE2XWNXotuyFKJX/3NO
    k1vpDc5arxsfOYe2hR9ZjxIh1AFHgjXfHyZEAlCQZwEZwxxco7vLwoZdRv1aK2dpB/xB3m
    nruiYT1B8pUE+8myc+C8nqudNcBSh+ZjFATvfPjmBEBB4ZyP6yQf1p27fDebYISqVKjfxY
    GNIakcNJq/ZQt31hMPRV+pEPLXeYTtKHqcqEKiCdm+hAQac8BnIBl9fcQ4ThFAet5lzrgQ
    puF2+/bk/oeIiqdl5AYVOskhE7UC7tX5DqlLIj62Z3k3m4IxhyvZJXe30pRznFZNOSc0NX
    msAekGxFa5Vc5hWqQxaoFXzdssSlEc+pL4KdUSH+OammS7fCocE2kOkqO2TQ
X-ME-Proxy: <xmx:-0uTagPvwCdP_e_7apmRQrtZwbHlWSSFW7M2XOEgMEsej4dlYIN8Pg>
    <xmx:-0uTaqxKW3z3Zmeunc5ItOdipdrLuO4WlcLZwjv7TRSn9H1E58__lw>
    <xmx:-0uTagWz0kjMZq0sFP4sMtZ_OQZN54S3pT8SUPQZhNaleXcKnFtYeA>
    <xmx:-0uTasMSAyEqBrwRRPG-my6ALee7eTb6Z4FBhRemNY_CzMy4AUU2bw>
    <xmx:-0uTaiAqV8X2BDnzzgCeKGSObcGZ3UHPCSq55R1VjKuBpViMhDfOT4bZ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Aug 2026 17:15:39 -0400 (EDT)
Date: Sat, 29 Aug 2026 14:15:38 -0700
From: Boqun Feng <boqun@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Lyude Paul <lyude@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interrupt: Disable interrupt before modifying
 hardirq_disable counter
Message-ID: <apNL-qhyr4PwSonr@tardis.local>
References: <20260827181106.30090-1-boqun@kernel.org>
 <87ecfgej3h.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecfgej3h.ffs@fw13>

On Sat, Aug 29, 2026 at 11:02:10PM +0200, Thomas Gleixner wrote:
> On Thu, Aug 27 2026 at 11:10, Boqun Feng wrote:
> > Currently a softirq may be pending longer then expected if the
> > triggering interrupt happens in-between hardirq_disable_enter() and
> > _local_interrupt_disable() in local_interrupt_disable():
> >
> >     local_interrupt_disable():
> >       hardirq_disable_enter();
> >       <interrupt>
> >       ...
> >       __irq_exit_rcu():
> >         // false because hardirq_disable_count() is not 0
> >         if (.. && !hardirq_disable_count() && ..) {
> > 	  invoke_softirq();
> > 	}
> >       _local_interrupt_disable();
> >
> > , it'll defer the softirq to the next interrupt which can be forever.
> >
> > The order between hardirq_disable_enter() and _local_interrupt_disable()
> > is to optimize re-disabling interrupts if they are already disabled, but
> > as 1) local_interrupt_disable() is not widely used yet and 2) the proper
> > way to achieve this optimization may need fixing up the counter at
> > entry/exit time [1], so reverse the order for now to avoid the softirq
> > pending issue.
> >
> > Since we are doing this, the part of saving the current state is
> > separated from irq disabling, and we basically do the following in
> > local_interrupt_disable():
> 
> We do nothing. See
> 
> https://docs.kernel.org/process/maintainer-tip.html#changelog
> 

Will fix this.

> >     local_irq_save(flags);
> >     if (counter++ == 0) {
> >       this_cpu(local_interrupt_disable_state) = flags;
> >     }
> >
> > Change _local_interrupt_disable() to _local_interrupt_save_state().
> >
> > Link: https://lore.kernel.org/lkml/87v78wezid.ffs@fw13/ [1]
> 
>   https://lore.kernel.org/lkml/87jypbfu1t.ffs@fw13/
> 
> is the mail where I explained that softirq issue.
> 

The link [1] here is for "the proper way to achieve this optimization
may need fixing up the counter at entry/exit time [1]", so I think
that's correct because it contains your explanation on how the fixup
would work. I will add a "Closes" tag to the other email that you
explained the issue. Sounds good?

Regards,
Boqun
