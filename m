Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AAA390618;
	Tue,  6 Oct 2026 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278297; cv=none; b=qY+oN4QN3eF8AXT37SJMl51uRgy72kD2eVfgoDswnNxo/48iPUR2RazCjAGYLE8BO7N5tEzlk2cSiwBn2+gAjcIS5QZ/YsG9A1rv2ofmKN9NLGGnJpq89kwCT0IZ7hRGGq387TFdijWgnyqosHUOQdWfne9CeZVTycrWv/fTKfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278297; c=relaxed/simple;
	bh=uz5nK0Esbev4IXTSrlTJxD7fAwuwp9QJ0fImOJV29ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFw7HTt0IhGRykB5q3cPGIlZ2QnQhUAMTt0NnbfiwOsEgCb5a6CdptipOKdBUCSlye6vJqof/jedu3fATBmr+ABlc1dJ+kGSoxoaknHamnVOGb6viY9Zif3Oz/lSAUQO5u/rbJWzyScYUz8ZNvGwDO5wUBHTcGi+PrAPtWfT5Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrnFRMCb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrnFRMCb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932121F000FF;
	Tue,  6 Oct 2026 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791278294;
	bh=fwBCYnwNFk4ZMTj+qPeBrwzZbK88LLQJgUmh18M8wj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LrnFRMCbzA2dvkuIb9FmCIRXf86GBtg+uVN951Mp/yjNRbpw0ntKPKAeIjiNjzP/P
	 SXDDTtx5vrRRhL5+Pa4KqAWGOR3Dtxcqxh372werY7LeQGtSmp5q1PxSJU0Z9isJD3
	 mqdQrgbBE4SZzJc5f3wQd2Qnwwuvei29faM58vhjDwfZuL7fifJ6JF4vNtKY3bL715
	 lA/JZgGpZeptfb6agSvYSvvcZx3jB9jAC9iDAkfW/6MDK25jAl+tLNPG/V9rgyoXDT
	 U2+LljHN7+vDV7NvEf2qf2P3Bf2bAIJntyExKKXfYRtfemRjbGvrmqlRK4RtK5q1S6
	 G0bDMidMT8cXg==
Date: Tue, 6 Oct 2026 11:18:11 +0200
From: Vinod Koul <vkoul@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 0/3] airoha: an7581: USB support
Message-ID: <asS805-vbum46Oji@parshuram>
References: <20261005105535.2472-1-ansuelsmth@gmail.com>
 <asPCFDMXyntAV6lx@parshuram>
 <CA+_ehUx_B2K3WgLYkt2fz5jzDRB24LQRB3uX_VScZ2QSxCojPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUx_B2K3WgLYkt2fz5jzDRB24LQRB3uX_VScZ2QSxCojPg@mail.gmail.com>

On 05-10-26, 17:31, Christian Marangi (Ansuel) wrote:
> Il giorno lun 5 ott 2026 alle ore 17:28 Vinod Koul <vkoul@kernel.org>
> ha scritto:
> >
> > On 05-10-26, 12:55, Christian Marangi wrote:
> > > This is a major rework of the old v2 series.
> > >
> > > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > > configuration for the Serdes port. Such port can be either configured
> > > for USB usage or for PCIe lines or HSGMII and these are configured
> > > in the SCU space.
> > >
> > > The previous implementation of a dedicated SSR driver was too
> > > complex and fragile for the simple task of configuring a register
> > > hence it was dropped and the handling is entirely in the PHY driver.
> > >
> > > Everything was reducted to the dt-bindings to describe the Serdes line.
> > >
> > > Also the property for the PHY are renamed to a more suitable name and
> > > everything is now mandatory to simplify the implementation.
> > > (the PHY are always present and active on the SoC)
> > >
> > > Also other unrelated patch are dropped from this series.
> > >
> > > Changes v13:
> > > - Rebase on top of phy next
> >
> > Pls fix the chechpatch issues. There is new blank line at EOF, SPDX
> > format mismatches and many more. Make sure you pass --strict flag to it
> >
> 
> My checkpatch doesn't report the blank line. Am I missing something?
> For SPDX, is it ok to change it? The commit just move file. I would
> like to fix that in a separate commit after. (I can include in this
> series if you
> want)

Yeah checkpatch wont. Git complains when i apply:

Applying: dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
.git/rebase-apply/patch:74: new blank line at EOF.
+

I think we should fix SPDX ones.

> The other warning are about Kconfig description where I can
> artificially make the help text longer (no idea if it's OK...)

That one is okay, I this description is fine

> And the line too long for the define but making the line shorter
> would result in a disaster for the register.
> 
> Up to you what I should fix but I guess the real important one
> is the blank line but my checkpatch script is not detecting that...

Yep, line and SPDX ones are important. long line splitting will make
code worse to read, i care more about readablity more..

-- 
~Vinod
