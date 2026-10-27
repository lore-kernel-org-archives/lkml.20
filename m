Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104196;
	b=vcHDDENVosjjGX8QldGG+2loha7slQhAx3X/9Sjr23JwYPWY9t/Upce4fXmOhB4gyqLi
	 UHuiEh9uGTuS3UaQv34khjdjtcd0/ROcF5FBDFgiSOF9Dd1KTHRNnTEcn4YD79Psk9bTm
	 wIy8Jt3TAuz5JvsKf+yHWfkOiJgXNZLlh7i8fp1ejOZIF9jFlPkzhz9Pdr1b0Q8Y1xP+H
	 QigZHG94iUpyR2IlJ6P9FVfi1Ko4lj8KqSnk6uV+yy4Y4eOKvqrT8Yx3itl8vMiyOSYFR
	 LLoDwrpvbdh9mlJbQRM4W2DMo5W7AFHzOgEImivUnetdFDtM/mE4TsUUm3CZD8oHxVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104196;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=VW3vlk6yLtvUoqRXZDaZGf3txgL9CSLjcbhBlicupuw=;
	b=qZmkBIAEtj+VQ95RBHAPRtcFy0/hmtVS/oDuZYoM5YFXrt3yDyjtT9qgiq5nomK3qPev
	 mfWrmPc57+sx6nz20pBVDnSB5N6nS/6L5AQ1Y4yLBgwTG7x2E8JZ1TQMQzcBBajjIWPLq
	 yZUfMSHpVrVxCpNTKhAK7ZBUHME7zIpLzC35zre38KXuEnyd67DrALVT5+0G2lLwllD8R
	 rzk3K2Fmu101H/b9YQJe/YW0u8TyXsUoTQOBLwwRM/1VRJNjYPLHlt8WDPFwPn7Dy4sU2
	 jhu1PoY7tJlFiN2b6AkwXBPWqdMIf4JE0z75208AwuammykX3nwnmImiVmw7slIz1eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Gf+ltLjy;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43C3606CB2A;
	Tue, 27 Oct 2026 12:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D43C3606CB2A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Gf+ltLjy
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD7EDBE;
	Tue, 27 Oct 2026 13:27:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793104061;
	bh=nvsLBy4rEyUEJlstMjixP/DL9XbMbUy4KtNfXvk/xp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gf+ltLjyohMv7oD0ZtprDWZ2fTKQhM9J8e5WKpuo8aNXjFp1kpnCOV0xlp38dPNLX
	 R5MgMvyj6eqCGIGYdADasVIvffnkA5PrShWaTy2f9er7X4qt420JBTXHwsR92X0DaJ
	 R8HZNoP20iCh74MHxhJXs78Rh9BLrIJBkfbIsd2Y=
Date: Tue, 27 Oct 2026 14:29:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261027122952.GB2133989@killaraus.ideasonboard.com>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <20261021163242.GB325924@killaraus.ideasonboard.com>
 <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com>
 <3f518c8c-2950-458e-95fb-5b282db4c384@kernel.org>
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
In-Reply-To: <3f518c8c-2950-458e-95fb-5b282db4c384@kernel.org>

On Mon, Oct 26, 2026 at 11:48:16AM +0100, Krzysztof Kozlowski wrote:
> On 26/10/2026 11:40, Laurent Pinchart wrote:
> > On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> >> That's valid and for 95% (guessing the number...) of cases will be
> >> solved by having linux-next as a base, thus requiring the base
> >> information is redundant. It's just linux-next.
> >>
> >> When patchset does NOT apply on linux-next or maintainer tree is
> >> non-obvious, the base should be provided, but that is only "if ->
> >> should". I think the proposal here is a bit different.
> > 
> > What's the downside though ? As git can easily provide the base
> > information once configured to do so, what's the downside of asking
> > contributors to include it ?
> 
> For me the downside is that if you require it, half or more of my
> patches would be rejected

I don't think we want to automate rejection of patches that provide no
base information, and certainly not as a first step. The goal as I see
it is to encourage people to provide the information. It's a process
that will take time.

> and I would need to add unnecessary step to
> remember.

It doesn't have to require manual work every time you send paches.
format.useAutoBase in conjunction with specifying upstreams of branches
helps.

> Since this step is pointless - it would be linux-next
> (assuming in the first place that this is what the author wanted here!)
> - it is a waste of time for me and potential resubmit of series, just to
> fulfill requirement which brings no benefits. So I have downside and I
> see no upside for my case, when you require the base.
> 
> This might be affecting others as well, but now speaking about my
> workflow - I have a lot of independent cleanups, which I stack on top of
> each other, sometimes series, sometimes not, but stacking is important
> so when I run `make W=1` it passes.
> 
> What's more important, I reject the entire reasoning/cause of this
> change, which claimed you cannot review and therefore accept such
> patches. It's simply not true.

That's not my claim.

> So please come with proper reasoning and then maybe even it would be
> fine to require the tag. But if reasoning is not correct, changing
> policy is not right.

-- 
Regards,

Laurent Pinchart
