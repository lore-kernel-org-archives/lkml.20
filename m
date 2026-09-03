Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAE53B5E08;
	Thu,  3 Sep 2026 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430019; cv=none; b=f0CBNVkxEbBk29VEplS+EoUU6irgNv/r4kpTbBjnrHwplpFmWAudpPGz2atcgUOU8ANB7MnS+Kif+UxOJJSUPkmBWBl2pTICjkfG6bnWq5Kh1SGeRCR8T+Yr+GZBs+O1cR7JrBg9EaseLtljY0nKNYqmMGwP58tipHDcQjZ5/n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430019; c=relaxed/simple;
	bh=qf2fubPmfLIDNUT2h+9n7NqOBCnS2zp/lbMin3g9bxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAqn1NoRPMl2kSeVf1FT8U710WphIjRBSaslhZn8+jVKTosC6fVfeih+BBkVJkja6tLZeWAMjSRtGf4LKVO5Ym68KPqhA3Vz5js2mMzY1VIhzVTrP4j//95IHXnXxfiXlAjt9voWq8pQzHLWfaohr++cs0p2dYW/IpIHw0zmqU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KM3e1OqK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KM3e1OqK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4A41F000E9;
	Thu,  3 Sep 2026 10:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788430015;
	bh=JOjoOgvlM81zL+NiGiRTWOkPC5emIO7QZ5TW4bJblk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KM3e1OqKYXCj7bP5cNJc3bDDzKOIbdHc4oa+CQE5WQzfVC0t/tQ76wyIjIZo7aKn4
	 DSGWUN8Nc+lazZwr+OAX7VFZUEMG7PY5I2ODoU2QQm9V9uGLtSBMIozqCOUg9X/HuK
	 TTSjMfoNA5k13NeGRL0rXhXkRex47CLoVwXInd86MhN8RnT2QX9OhFyv8dV0fLyqxP
	 H0gVP43Dv9hOGbL/GIhrCz+IJ9k2t4sOqjLSMKFxvm2h47K7LUJ6M02sjxCmvf+fp9
	 66ncduGIkhE6kof0T3vcL+sQvTHvRj1qd7E4gh+fp5LwSKb1g5kPBL+Md/THdcDMRq
	 BksN1brdKv/Jg==
Date: Thu, 3 Sep 2026 12:06:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Frank.Li@oss.nxp.com, 
	Support Opensource <support.opensource@diasemi.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa
 fallback to dlg,da9052
Message-ID: <20260903-vague-sassy-cow-d2d6c8@quoll>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
 <20260901-devourer-pushover-f26c72688255@spud>
 <20260902102532.GQ2943942@google.com>
 <20260902-varied-unsent-b99f9f007685@spud>
 <20260903090625.GI2133376@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903090625.GI2133376@google.com>

On Thu, Sep 03, 2026 at 10:06:25AM +0100, Lee Jones wrote:
> On Wed, 02 Sep 2026, Conor Dooley wrote:
> 
> > On Wed, Sep 02, 2026 at 11:25:32AM +0100, Lee Jones wrote:
> > > On Tue, 01 Sep 2026, Conor Dooley wrote:
> > > 
> > > > On Mon, Aug 31, 2026 at 04:15:21PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > > From: Frank Li <Frank.Li@nxp.com>
> > > > > 
> > > > > Allow dlg,da9053-aa fallback to dlg,da9052 to fix legacy platform (> 10
> > > > > years) check_dtbs warnings:
> > > > >   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
> > > > >         from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
> > > > > 
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > > Previous try drop dlg,da9052 at
> > > > > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> > > > > 
> > > > > but Krzy have concern about compablity.
> > > > > 
> > > > > https://lore.kernel.org/imx/20251107-matrimony-showdown-ba6ce6996b2f@spud/
> > > > > 
> > > > > Conor prefer update old dts.
> > > > 
> > > > I don't think these devices are actually compatible, so this fallback
> > > > would be wrong.
> > > > The data comes from the match data, be that spi or i2c, and there's
> > > > explicitly different behaviour for the da9052 and da9053aa.
> > > > I doubt the legacy platform ever worked properly, and this is what should
> > > > have been explained in the PR that Krzysztof denied not just blindly
> > > > citing a dtbs_check problem.
> > > > 
> > > > Nacked-by: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > At first glance this looks like an Acked-by.
> > > 
> > > IMHO, this is going to cause issues - please rethink this.
> > 
> > As in, use NAKed-by instead or just say NAK without the name/mail?
> > Not entirely sure what you're getting at.
> 
> As in, don't make NACKs looks like acceptance trailers.
> 
> If you're going to "NACK", which I always felt was a bit harsh anyway,
> just say it without making it appear like an official sign-off.  Please.

Heh, tag is correct if maintainer, e.g. you in this case, would like to
take such patch still. There were already such cases, I did it once as
well to express that I do not agree with the approach taken by other
maintainer and I want to be sure that a commit in git history will never
be used in future discussions against my review (because this happens
all the time "I found commit like this, so I can add here poor code").

Best regards,
Krzysztof

