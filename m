Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854974657FE;
	Thu,  3 Sep 2026 11:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435392; cv=none; b=iyEfJVobiJP6Se7GM6Oae6DWBg7VW5GxYO2iPBdeK6nEEDihtBYjP4qZ0T1m3srY15q0kboAKfy10TAe9INSOzQYFVKWuxkLZioY9vEqXsBrCQAq5EDdBMOiVB26ryYYTiIeEpvbhZMz6a1oRvtc+iN9PFcBJ9ci4PDY9ZTlMck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435392; c=relaxed/simple;
	bh=4BrUozfJNo0rG4OrODIJWwKKspx4G6mMrrRp7O0dnQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzJpM6wxAsT4gIbbIlBPvCEPV1VGBAvHlf/031b38lpRn5eybF8s0kEHP01ed8aZe5Yg6KDDJGIvUvyGoVAXhPz85UzcxtReI8R+KPWmMk3kyOvA2258b/gVEtLKVzz0rZptWKFH0X3b9EnN9KruwkL2jM31iUDon8la6E1cFEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRDM+4W6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRDM+4W6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037631F000E9;
	Thu,  3 Sep 2026 11:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788435383;
	bh=wrVEUaKDCxXfXSiIelEGPpoYL6FTx7PTDLeMKbSuEgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NRDM+4W6Kx1wgNOjbukiCqHo/tSG95NOqtnKCE0GtS8m7HX7kgUaW3mJHhHgaIh6S
	 OQ8rwMA82m+AF+sBDQNqTBzb1RwflASZbJ1r/IANBk6tYgV/Yu5Tb8sG2tHOttN/S1
	 a9Hj4DaaX+9ZscuiDxnYT3giYzaF4jJ8pkx1kziIMzmR+dR0F4KGIeZxrpNcJVuRUt
	 6mQ5p89NC7nX1OG+809dM+ZbG8Gv1jArkOMlj64eyXTZnp6XQ1ugGFabT4Jd2JUMif
	 PxuHwdRacwmiHUXBBUvcrfDTcmFagzgLlO8HbrmJcd9WI5oK5hppRRHZN3CtoyU0bc
	 n5Et8HmqmvI1w==
Date: Thu, 3 Sep 2026 12:36:18 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Frank.Li@oss.nxp.com,
	Support Opensource <support.opensource@diasemi.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa
 fallback to dlg,da9052
Message-ID: <20260903113618.GR2133376@google.com>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
 <20260901-devourer-pushover-f26c72688255@spud>
 <20260902102532.GQ2943942@google.com>
 <20260902-varied-unsent-b99f9f007685@spud>
 <20260903090625.GI2133376@google.com>
 <20260903-vague-sassy-cow-d2d6c8@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-vague-sassy-cow-d2d6c8@quoll>

On Thu, 03 Sep 2026, Krzysztof Kozlowski wrote:

> On Thu, Sep 03, 2026 at 10:06:25AM +0100, Lee Jones wrote:
> > On Wed, 02 Sep 2026, Conor Dooley wrote:
> > 
> > > On Wed, Sep 02, 2026 at 11:25:32AM +0100, Lee Jones wrote:
> > > > On Tue, 01 Sep 2026, Conor Dooley wrote:
> > > > 
> > > > > On Mon, Aug 31, 2026 at 04:15:21PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > > > From: Frank Li <Frank.Li@nxp.com>
> > > > > > 
> > > > > > Allow dlg,da9053-aa fallback to dlg,da9052 to fix legacy platform (> 10
> > > > > > years) check_dtbs warnings:
> > > > > >   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
> > > > > >         from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
> > > > > > 
> > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > ---
> > > > > > Previous try drop dlg,da9052 at
> > > > > > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> > > > > > 
> > > > > > but Krzy have concern about compablity.
> > > > > > 
> > > > > > https://lore.kernel.org/imx/20251107-matrimony-showdown-ba6ce6996b2f@spud/
> > > > > > 
> > > > > > Conor prefer update old dts.
> > > > > 
> > > > > I don't think these devices are actually compatible, so this fallback
> > > > > would be wrong.
> > > > > The data comes from the match data, be that spi or i2c, and there's
> > > > > explicitly different behaviour for the da9052 and da9053aa.
> > > > > I doubt the legacy platform ever worked properly, and this is what should
> > > > > have been explained in the PR that Krzysztof denied not just blindly
> > > > > citing a dtbs_check problem.
> > > > > 
> > > > > Nacked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > 
> > > > At first glance this looks like an Acked-by.
> > > > 
> > > > IMHO, this is going to cause issues - please rethink this.
> > > 
> > > As in, use NAKed-by instead or just say NAK without the name/mail?
> > > Not entirely sure what you're getting at.
> > 
> > As in, don't make NACKs looks like acceptance trailers.
> > 
> > If you're going to "NACK", which I always felt was a bit harsh anyway,
> > just say it without making it appear like an official sign-off.  Please.
> 
> Heh, tag is correct if maintainer, e.g. you in this case, would like to
> take such patch still. There were already such cases, I did it once as
> well to express that I do not agree with the approach taken by other
> maintainer and I want to be sure that a commit in git history will never
> be used in future discussions against my review (because this happens
> all the time "I found commit like this, so I can add here poor code").

I wouldn't take the patch if it was NACKed.

-- 
Lee Jones
