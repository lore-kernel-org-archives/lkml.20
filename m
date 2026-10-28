Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203687;
	b=4jQ+wQEE5Ix6DpP6dl96NcYqo5GGXVmZ/9s+pronfy2xC6XqZBjx/X1fGq0DTDyvPcV6
	 hh2GBFpbe7cIQIeXC7Ux0NDN6Xm3jOQfogffwh63bk1vtLtFHvXg0xlGHnz8bISCIe7ht
	 ElfNN44n/hoDcU3Gn+uTyTU7ek+SoiPjoBcvqbM//YeHZCS0LBTpLGlR0kyZ8ligVpxUI
	 obUaLKe/nFQRoLMDWBLWBjCXG6YqfR/T+UHlAw26qk5Ea61swW3hcH4vPUZ9HgNidzPwM
	 OciuKFDqAHE98B0/3n6dZH7180/Hd53YxJguDxQpFyhDKmcYUepsiSnC72ILnzwPZ/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203687;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ga8rqL+109v/fKuZ5mT99In7aNIISKXhgfrPd0PyXs8=;
	b=TFCTfCYq1d0yQW1au6GGTAQBB61Tc7tn3G4NMqXPNAQNhEWvwClKlv2a+6CLkImDgD5b
	 aKrvPnSba56Cth+c7LJ9BfOtXzPOexX24nOwklKrFFwk2gxnyE5IJuNB2NUdjMxwMmyn5
	 bGKt76nkVjC6wru5qHnselc6QRIF1tJeVlzTomjFOjWmiUPUz7r3GkufcBV7fK/4f49vs
	 SNzhM6QUXLi+7PN/dHxTOvqwSVEFcqcAHdogNuKvqZQJ9JSXErIHsZ6RVm/dqRtuyYDC5
	 OOUpuR8L8hYy0FNeixSILXlt+9OC4M25vKRpv4CFtYtEGD0n0vIAZ4kLNy2VGKiNwLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CiABkuui;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A7E606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CiABkuui
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB7A1F01300;
	Wed, 28 Oct 2026 16:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793203687;
	bh=ga8rqL+109v/fKuZ5mT99In7aNIISKXhgfrPd0PyXs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CiABkuuisImSPE+Plcx5yKvUaz+gcoONNaIqr4xnxWbfIeq8JY5+r/8x/FopicgZS
	 LE1M/OGJ/y0MN6DSoH1OEHyKW5oXZDC0I8TFZbcGaNFz5QhTbQTyvsn/P0d0RsFyyI
	 PFkrjmX8G69uuCWLXMiJV8F+s1pT1jDx08uaom+IJ20b6/SD/f3DJWwbv/nF7CABOI
	 cfzEEfy3v46l7P1jedpnib8AjmuvANS64bEGvJLZqIbZSxnvTs+0DyQv1yzPQ1QZ8z
	 in62Deb3QCVii2VxzMucEDFl+osdi9qAkgUaPdnEufmBXNnXkV5DkztL44+A873apa
	 npNufunsN0tVg==
Date: Wed, 28 Oct 2026 10:08:05 -0600
From: Keith Busch <kbusch@kernel.org>
To: Erwan Velu <e.velu@criteo.com>
Cc: linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de,
	sagi@grimberg.me, linux-kernel@vger.kernel.org,
	Erwan Velu <erwanaliasr1@gmail.com>
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
Message-ID: <auId5RuBhMFGirJ1@kbusch-mbp>
References: <20261016141208.2641974-1-e.velu@criteo.com>
 <atJXYHJa4jkUWJmP@kbusch-mbp>
 <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com>
 <atJeazM_rJ0uj3vt@kbusch-mbp>
 <CAL2Jzux8v6zCxfcdd=MY5n0zQMVSa-_8Lki9z-fz7bFShNf7vw@mail.gmail.com>
 <atJk_2FmzjUZYO_Z@kbusch-mbp>
 <f665dc3e-fc5c-4352-8e41-a46b7ae97946@criteo.com>
 <CAL2JzuwuZp0gg1D7wSn7cdgpnhotnuLP6YpPd-SrdVyqhkeiJw@mail.gmail.com>
 <atqZmctbU0siYmVX@kbusch-mbp>
 <7fec6534-9e57-4041-8699-72c5950c7e2a@criteo.com>
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
In-Reply-To: <7fec6534-9e57-4041-8699-72c5950c7e2a@criteo.com>

On Fri, Oct 23, 2026 at 04:53:54PM +0200, Erwan Velu wrote:
> > I just wanted to see if there was any difference in the controller's
> > Flush behavior when the volatile cache was enabled vs disabled, and this
> > looks like it's the same either way. The Flush should have been a no-op
> > to the device with WCE cleared, so something seems off here.
> > 
> > I'm wondering if the device is actually really respecting WCE set to 0
> > now. That might be tricky to prove, but it wouldn't be the first time a
> > device lied  about durability. Not saying that's happening here, but the
> > behavior you're reporting is suspicious: 15usec writes are not
> > physically possible with TLC NAND (your model says BiCS TLC) without a
> > cache, and your controller says your cache is volatile.
> > 
> > Anyway, the principle of what you're proposing looks fine to me from a
> > spec standpoint. I'll get this queued up if I don't see any other review
> > feedback or concerns that it's going to corrupt something...
> 
> Thanks for your feedback.
> 
> I'll discuss this firmware question with the vendor in private and will keep
> you aware.
> 
> Considering the performance impact for these type of device,s would you be
> open to a backport to stable once merged ?

Not sure when a performance improvement is stable worthy. I'm more
concerned that doing this is going to expose corruption, but it's what
the device is asking for, so fine to introduce it, but stable is
questionable.
 
> This patch is really about matching the spec and it would be probably a
> great positive impact for many stable users to benefit from this patch.

There's just a gap with the multipath head: if you start up with WCE
cleared, then turn it on, the head isn't updated to indicate flush
limits. Let's get that fixed, then I'll queue this up.
