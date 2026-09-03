Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCDC3EEAF2;
	Thu,  3 Sep 2026 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429888; cv=none; b=hlJ3vuLGQaDGinqoovTpyIfTYSKlk/ln8I+INmL9CRdDhAtqdnqbBGEyokyHQ9cvOX9BWqvvnpYm+QOaftMNDdykJbT6TvcMCwx6OuGAFcsIuH0c8D6Zdopfl4zR3lZ3uyu1FFSir02cldai32oZziV6sp00DUEoDUxMu5Evj8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429888; c=relaxed/simple;
	bh=qQTVjz+z1WGTTP2fPJbRZecDFDNzkCFFT7VNAVRgexs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pq/L0hnOMJiPp5vKUoWl+fm8/e9wI5kkLHOJe0S2Fs3dbQiqWXbiSBzlt58sxonDqaXi5seZtP6XHaSAJkiBWr72qy7xA9bTT9zTNBK6PTVZrbGYBI8VG4LN9cNcvrIMXTRZQ638YlqPS279B9lSYz4LSvTquUpKRZptHlUpkFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDctrJQf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDctrJQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10FA1F000E9;
	Thu,  3 Sep 2026 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788429886;
	bh=NaACj+UcPnVqULrWvvrkVkcIm3rerd3GEmHRVnGA+Kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oDctrJQf4oMMycDUAyJf7HmvEwMinNjB5rXSc86aZrneTnV6tnn24NtFOonCVwN0A
	 1O38FI4VvX16IdjK16cJHBUz69JMnLe6bb1MEEA2eTq8bWosrWLHMOF5d1F5/JLon1
	 andOIz+MXbFkvbY7dGWSFYwKgZrNN2HcGgDE57uFk7ypayeXJJN3VuPv9pxKCHZAf3
	 P0N5wXm7IztNbWXA1oT82PBe2e6jVSuupQ1BG6i4m1vOTS0dvW1XYJxGDJUpH2ykyl
	 RB4jB0RsQC/dJNB+Dvl8OYbDjzeI7sdSy2VhMDhKvk0TVw/MrLBeSgOcPmEW+vo+FR
	 6YI5ftMdHdSqw==
Date: Thu, 3 Sep 2026 12:04:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Frank.Li@oss.nxp.com, 
	Support Opensource <support.opensource@diasemi.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa
 fallback to dlg,da9052
Message-ID: <20260903-succinct-military-macaw-9e6e71@quoll>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
 <20260901-devourer-pushover-f26c72688255@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901-devourer-pushover-f26c72688255@spud>

On Tue, Sep 01, 2026 at 06:00:31PM +0100, Conor Dooley wrote:
> On Mon, Aug 31, 2026 at 04:15:21PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> > 
> > Allow dlg,da9053-aa fallback to dlg,da9052 to fix legacy platform (> 10
> > years) check_dtbs warnings:
> >   arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
> >         from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Previous try drop dlg,da9052 at
> > https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/
> > 
> > but Krzy have concern about compablity.
> > 
> > https://lore.kernel.org/imx/20251107-matrimony-showdown-ba6ce6996b2f@spud/
> > 
> > Conor prefer update old dts.
> 
> I don't think these devices are actually compatible, so this fallback
> would be wrong.
> The data comes from the match data, be that spi or i2c, and there's
> explicitly different behaviour for the da9052 and da9053aa.

Maybe I looked at wrong driver, where is the difference? I made a very
quick glance and I found the only difference in da9052_i2c_fix():

 59         switch (da9052->chip_id) {
 60         case DA9052:
 61         case DA9053_AA:
 62         case DA9053_BA:
 63         case DA9053_BB:

No differences in "da9052-core.c" and SPI, while looking for these
device type enum values.

> I doubt the legacy platform ever worked properly, and this is what should
> have been explained in the PR that Krzysztof denied not just blindly
> citing a dtbs_check problem.

Well, yeah, I wanted an accurate reason with actual analysis, not
necessarily making devices compatible if they are not.

> 
> Nacked-by: Conor Dooley <conor.dooley@microchip.com>

Best regards,
Krzysztof

