Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BF030DECB;
	Sun,  6 Sep 2026 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788708708; cv=none; b=rZdEevjWy5+wNML3gxV4Z6Dl7ZsI6FiDx9FEUrNhCrRGN8/zlA8FX8Mpls+ZGQcD9kDrXRo+6WySIlfl/VPIIea8FhYwfeA/EnqmUnThBtWK/yViizKQPji5Z3xveRhYXlG5FgIZ5BEB2gt9FSLNUnGMyfkHkQWNW5CQYdvWtGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788708708; c=relaxed/simple;
	bh=oqU7/OzFE3Z6RheIye6ryFom0Ri6IZ97p2OpEMhqx8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChuizBfYgie0svK3a1BCH+SJIbEyFNNoaQ1mZm8FTD+5ZUv5zUq6KQ2WumHGPTPwhaWBS+1bUhU/LFWKvmU0rk4pDxAANE6BK6Z11FLK18lxw5IB4PZXe2yVUCBUoPobaz1dGMFbG5TAw7UOPAvZX77siww5HGuXVCxvyp0j2To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=BAkmLRab; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="BAkmLRab"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 34F58222CE;
	Sun,  6 Sep 2026 17:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788708695;
	bh=ZzRnZqGCK4vQaDQlzB7tpWSJvujbPPPlfGioawuGr2U=; h=From:To:Subject;
	b=BAkmLRabM3PlM/H+7r0rbSqmgR3bhd/Nl1XNS86hjPd/WINU6tbl3ftmlZyJaj0DE
	 fUMM+6DitlVyws1ZEVVTshV7gKtfwPuRGbmTt9pCzWLKn/XciQbSp4uEu06ny2UxRP
	 ld7sOxSppSyXvqe3O9fN95B8kFK0iGwSxXrvTTzhv/WUOt9YKZcO+KXkPziCwA2m9y
	 c7ASe5BsT7iTp5pES4U1z8B/JdjrbXeI6+oHvrTigVocyepvtjybaGqBa1XX2BwX8N
	 cRvxQwUuBSR89R8Of7REd9qLz9QmMGxbHNwpyWTPzf/Kp4jQOEuNrezA++SzbFijQH
	 O4LTyQvLX5ROw==
Date: Sun, 6 Sep 2026 17:31:30 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, nm@ti.com, vigneshr@ti.com,
	kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-j7200-common-proc-board: Add
 ethernet alias
Message-ID: <20260906153114.GA3576@francesco-nb>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
 <20260811061351.2538688-3-s-vadapalli@ti.com>
 <b7147489-00bc-4f55-bfe5-2c9cb675c7ec@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7147489-00bc-4f55-bfe5-2c9cb675c7ec@ti.com>

On Sun, Sep 06, 2026 at 11:13:27AM +0530, Kumar, Udit wrote:
> 
> 
> On 8/11/2026 11:43 AM, Siddharth Vadapalli wrote:
> > Add the 'ethernet0' alias for the Ethernet interface corresponding to the
> > MCU CPSW2G instance of the CPSW Ethernet Switch on the J7200 Common
> > Processor Board.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> > index 54dea36b153b..ac1c1ffe40b7 100644
> > --- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> > +++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> > @@ -24,6 +24,7 @@ aliases {
> >  		serial5 = &main_uart3;
> >  		mmc0 = &main_sdhci0;
> >  		mmc1 = &main_sdhci1;
> > +		ethernet0 = &cpsw_port1;
> 
> Hello Siddharth,
> As default only 1 cpsw port is enabled for all boards in this series.
> So ethernet0 will be cpsw_port1 always, In case you want to enable more
> port in default config then having aliasing will help.

I do not know for this specific board, but in general having the alias
when only one ethernet interface is present in the DT can still be
useful.

We might want it to ensure that the interface name is stable (`end0`
with systemd), or maybe you can have additional interfaces that are on
some discoverable bus (PCIe ?) or you need it for the bootloader to set
correctly the MAC address or ...

Francesco


