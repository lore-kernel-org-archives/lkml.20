Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3F53E51F4;
	Tue,  6 Oct 2026 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284658; cv=none; b=oTMYIYWAb6MzzO62rPxwpaMnSfJbwemhHjB8BV82iT2KyKiNRjWJRxb39Rb3IG9NEGiw9t0moT//WkiDXX7/mCANcOyvi8HY2AYsQlaMJxyxx3D36zlYNrbIog/UnVyoebBv9gXMisXLIvgYcelX3riGDKbBZBpL4cMTuvKghQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284658; c=relaxed/simple;
	bh=OqF3Ap2AZaBUjm7tvmRY4qclkr+QEdK5FgHowYsJ004=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFVvD57p2YsDw2iX2Elzf3waMCQI6I1Q9b162/jGZrpiCHplT/Cx5TeCUgiqMuOSb19kBzagQnh934ELVARxI/jq0ANbgNquZpCDXhPgPpv0406xR5/NAd2nETMEKUt1BCzrA6Z/KTpEd8XOGCIHJorlRGVplofysfezvhAcB5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcaAaiAl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcaAaiAl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F80E1F000FF;
	Tue,  6 Oct 2026 11:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791284654;
	bh=zYy9ZPOUVut5R2+Ahn9onLfAABH9FQl5/jQQUgBaOdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FcaAaiAl8o0WdMF/V8wU5VWBeKFzqq78IeqqjynbS+yLRWzXtHTS9kf7IpltWo2me
	 6h2ln8qbZaZSchbiD9vf6KipxW7kT5wqW6Qf/4bG7KuFoOm+TK8aFqz1Jp7kQgeyvx
	 o5cpRha72vATiwEq6G5pKG8/BKA60Mou2OBuWe7Rex3YuhjVeQCz1R7QVSqhc3msoq
	 gkQWCQ8jd/Vi3e7ZjWezuygk1/kC8fj0FlD0FySnxCwjeyin08ErpqOeNIE+Jb86Q9
	 +7aLu4mHvTIAwe8V6I5e/1YNDeXIl6LX14C3QnGIOnFhNtkVXAlsbjGtxWa3pSJuUI
	 I/WDSUnhSbh4Q==
Date: Tue, 6 Oct 2026 13:04:10 +0200
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
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
Message-ID: <asTVqsqOLb29LY08@parshuram>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
 <asTRQ6d0-NYOeHqX@parshuram>
 <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>

On 06-10-26, 12:47, Christian Marangi (Ansuel) wrote:
> Il giorno mar 6 ott 2026 alle ore 12:45 Vinod Koul <vkoul@kernel.org>
> ha scritto:
> >
> > On 06-10-26, 12:29, Christian Marangi wrote:
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
> >
> > I get build failure:
> >
> > drivers/phy/airoha/phy-an7581-usb.c:7:10: fatal error: dt-bindings/soc/airoha,scu-ssr.h: No such file or directory
> >     7 | #include <dt-bindings/soc/airoha,scu-ssr.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> 
> This header is present in linux-next
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/soc/airoha,scu-ssr.h
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/soc/airoha,scu-ssr.h?id=11952173d8a180ac05641775f80bd6946327478f
> 
> Introduced by a clk series.

Okay so we have a cross tree dependency. I would like my tree to be
buildable and not depend on next.

I can
a) get a signed tag for this from clk tree with the required patch,
merge and then apply this series
b) postpone to rc1

Either works for me

Thanks
-- 
~Vinod
