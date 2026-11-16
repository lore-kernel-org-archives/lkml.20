Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837974;
	b=ludng22Y0nw8RwQgvmK1m3reQDTgY3OK/QngnqnjuSsXV3aY5bkaK2fhEa6c0cOi2GBB
	 /Uq9YptjddGj2xX/PW9bb1PMVvGK85BqsBvjRhSiAuJgJ9ri9voi5bH2MJNJngxKHJBlG
	 1Fabn5Cw0stExfoeWij0lU4ghgy8gmLhTY79+SPj1+vS9VcQdo7pHpLb2Aq93ZR9X+syX
	 sQ6TV+FEh+ru35pnXCXTxUrGG+HDXwzA5SAhC97DYuBINhrlA0fkx+VyRfTGNg+lBeCH/
	 9oCGu91yGjinNtoQ89TqyCNKtDrdbJbhfe2IEHSZTWuJGHjNIOmxa4yAlfc0GmHyTZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837974;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KwLcRkPnstUk3ARTGuc1rQhwhKTM1szKdxcAeiFBkdE=;
	b=ULbbc4uidFMIE37mtboo8cUnxY27dV7B1p+dCo+98E4CSHheC4jNfZJYoL3Pl2hau5PX
	 Egr6PiSvIdG4NNW9i0Cv0h1YFTSRDf55vpI5aYyAzYyb+tv/OMnqoHnp9+ORLDd8BRtNL
	 3Lym+9Q1oD/4O6Ct487lgQ8nekKWP6Uf9u2+fUY2UnIfmToD9Tc/xKv0qA55ymOzhF5fe
	 KchuHLMO54zAvU/lLlGqXqpXQimLR6CVItpFmY/k68q2zyBO71ZCR3Jx6yaHQFwlpP1e8
	 N9zcCFxlBtLX7zXYN2TGddtGwEdiuc1ayc/KABrWblQ2DcfFg/geCpvO6nK4JUzLE8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNhC6SCb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A860C606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNhC6SCb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C401F000C4;
	Mon, 16 Nov 2026 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837974;
	bh=KwLcRkPnstUk3ARTGuc1rQhwhKTM1szKdxcAeiFBkdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iNhC6SCbyr0bjFPBo14UC/W7m2erFrHGvPCaV/tq/GtUg9VgQ1X55EbHnWLAN34RF
	 Hxhdx/seKwL9IL/yEjutCzYGl7TjUSuOAIJR7MPQUhyuwXWaMKTgygymIY2/TCYsYk
	 zpmy5KRgNScVZYzoyv14PJuZ/oKFuBQJcx9oR1I2022PhSeuE/BfjZOX7O7amGmSWc
	 Iyr+52DO80d654LdzhMqw7A7OFODbn5e32tBVAn06TClFDuulRpi/HdNNXkjZnZAe0
	 qZ6IwI/WQKLC1bPnM/MX30nMMznlMqrwdV+ooI2Tqx0eup85FP0k9kWzc56XMBgUqd
	 dBK9wxEjcHBVA==
Date: Mon, 16 Nov 2026 15:06:08 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host
 driver issues
Message-ID: <avsN0E-6_7kU3pTk@red-moon>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev>
 <avrzusx1g1ZICo0Q@red-moon>
 <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
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
In-Reply-To: <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>

On Mon, Nov 16, 2026 at 01:28:56PM +0000, Fuad Tabba wrote:
> Hi Lorenzo,
> 
> On Mon, 16 Nov 2026 12:14:50 +0000, Lorenzo Pieralisi
> <lpieralisi@kernel.org> wrote:
> [...]
> > > invalidate have the same shape. The question is, can an IRS miss the
> > > poll, or is a timeout here only ever a dead IRS?
> >
> > Thank you for your patches Fuad.
> >
> > The latter, though freeing memory on timeout wasn't a good idea given
> > that there is no way to cancel the respective, pending, mapping.
> 
> Thanks, that answers it. If you'd like a patch that doesn't free the
> memory on a timeout, let me know and I'll send one.

Thanks. Again, if that timeout expires I think we have more serious
problems than the IST mapping but I do agree that freeing memory
is not the answer; not urgent - please send a patch given that
you spotted it, can obviously do it too.

> 
> [...]
> > > Notes:
> > >     Setting L1 on every invalidation turns each registration and
> > >     teardown into a range invalidate, both rare paths, and keeps the
> > >     function simple. Setting it only when registration allocates the
> > >     level 2 table would miss a registration that fails after the
> > >     allocation, which leaves the level 1 DTE valid.
> >
> > I can't follow. I agree that we have to invalidate the L1 DTE on
> > L2 allocation but that's a one-off, I don't understand what issues
> > you are pointing out in the Notes above, if you can point out please
> > the code paths it refers to that'd help.
> 
> gicv5_its_device_register() can fail after
> gicv5_its_devtab_get_dte_ref() has made the L1 DTE valid, and before
> the gicv5_its_device_cache_inv() at the end. That happens if the
> EventID bits check fails, or the ITT allocation does. The L1 DTE is
> then already valid for the next device registered under it, so that
> registration doesn't allocate a level 2 table.
> 
> The patch Notes were about setting ITS_INV_DEVICER.L1 in that
> gicv5_its_device_cache_inv() call only when the registration allocated
> the table. In that case the failed registration never reaches that
> call and the next one reaches it with L1 clear, so this L1 DTE is
> never invalidated. Invalidating in gicv5_its_alloc_l2_devtab(), right
> after the L1 DTE write, is the one-off you describe. I'll rework the
> patch to do that instead.

Yes, I think that's what we should do - invalidating in
gicv5_its_alloc_l2_devtab() once for all and leave everything else as-is
matches architecture guidelines.

Thanks again.

Lorenzo
