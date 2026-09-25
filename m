Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCBE44A409;
	Fri, 25 Sep 2026 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339397; cv=none; b=QgN4UUqt7mWFYSKKHCwklhdKySmVzkPL+7bgVjbdElFjnT2Wdr98tm70X33L+YFa+j8gQCtZsBK082kJhqMVJcoW8rdDaz6jI4gKO0MW4KZBxDR+nKwK72qJPEpc0vNVAPrRpiheYbQHuVvIo5x4IpHenn1uO8W3r2d9ddOSOgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339397; c=relaxed/simple;
	bh=IEqy2GUnpTRuHVuLN5GpVQl9Ov3c2xDjhNoGfhMuuT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRGd2sQ9Py6TMOm9Bi4rotB0VLM7LIqrrE6c7FMacZJXXrzL88uoC9VAEIy6DJMMwLWLnXrjjDOylskxh1rJUpJjjcvtByJoqYEFEYyMtONLq9W6THFuRkFP6o6MREBFT02Zs714wZPgeY0CTOFzVGGXVNEtdIB2ipCt/wSQijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9hQwa5N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9hQwa5N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D691F000FF;
	Fri, 25 Sep 2026 12:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790339395;
	bh=zZMwuJi+uuOVEpnd6zSF27+CwSgdbF03Y7EP5Bx37VQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k9hQwa5N0f7/1SdDkUvFiNh3KdgCoYAJx8TtlLjJbd7yzw+8ZBEPTrtbFmOqFveLM
	 /V3HxMcneML6BiVfgdrPAxM/QvHsw2tVM5oAiVeVsv0yN4NHyrc0XVMfXiq8+PkMSX
	 MElNsNAHFvwvKXMfUsLjIUHCoiZy7Ch1IAUsMXUBMWyfmN03M1MbswlufDTbW/YYKC
	 ZFqX6j9hITGBzUUPMnM4LfwgsdkxkvYPZJWuGTuxRldU0mgVZNs9cETBNQyzFk1Tam
	 dIE013yxmVCsEkSSWGubYm9A/xirJYv8rCgw1+I0TJ+INOUpIZG7pu09ldTMdssg7f
	 7zsNgAcNkQ55A==
Date: Fri, 25 Sep 2026 07:29:54 -0500
From: Rob Herring <robh@kernel.org>
To: Joakim  Zhang =?utf-8?B?KOW8oOW8uuW6hik=?= <joakim.zhang@cixtech.com>
Cc: Mark Brown <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Message-ID: <20260925122954.GE677989-robh@kernel.org>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-2-joakim.zhang@cixtech.com>
 <arKPdM4bYsAeAKtr@sirena.co.uk>
 <OSNPR06MB86866A7DE38DC5AD8197BF6E82812@OSNPR06MB8686.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSNPR06MB86866A7DE38DC5AD8197BF6E82812@OSNPR06MB8686.apcprd06.prod.outlook.com>

On Thu, Sep 24, 2026 at 07:33:12AM +0000, Joakim  Zhang (张强庆) wrote:
> 
> Hello,
> 
> > -----Original Message-----
> > From: Mark Brown <broonie@kernel.org>
> > Sent: Tuesday, September 22, 2026 10:24 PM
> > To: Joakim Zhang (张强庆) <joakim.zhang@cixtech.com>
> > Cc: lgirdwood@gmail.com; robh@kernel.org; krzk+dt@kernel.org;
> > conor+dt@kernel.org; perex@perex.cz; tiwai@suse.com; p.zabel@pengutronix.de;
> > cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
> > sound@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
> > 
> > On Tue, Sep 22, 2026 at 07:21:31PM +0800, joakim.zhang@cixtech.com wrote:
> > 
> > > Add the DT binding for the Cadence I2S-SC controller integrated in the
> > > CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo controller
> > > supporting standard I2S, left/right-justified and DSP formats, plus
> > > TDM operation with up to 16 slots.
> > 
> > > +properties:
> > > +  compatible:
> > > +    const: cix,sky1-i2s-sc
> > 
> > Should there be some general Cadence fallback for this if it's a Cadence IP?
> 
> Yes, cdns,sky1-i2s-sc should be better.

No. Cadence has nothing to do with sky1. It would be the above *plus* a 
Cadence fallback compatible.

I'm on the fence whether a Cadence compatible is useful. For complex IP 
(e.g. PCIe, USB, etc.), IP vendor fallbacks have proven to be not 
useful. For simple IP blocks, they can be useful. It also depends if 
there is a h/w manual which can be used so we can really define the 
correct numbers of clocks, interrupts, etc. Perhaps I2S is simple 
enough.

Rob
