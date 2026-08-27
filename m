Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27872456DEA;
	Thu, 27 Aug 2026 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834683; cv=none; b=Q2CRIHc17NsEdPvIfh3obNQN+zthYe9sUHxIYs0p3m9d6Kgvlhoc0SqXVhuO8Y3c8PSbbCjYJedw+v0le94PcPfkT1gCvIRveNkJb0DRdooQyxTLYNHp1X8DSCNLIS/CIbAxvD9ZJV8qNUewRw11I1f681nxBS76JwQ1+DdEpHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834683; c=relaxed/simple;
	bh=Jy0Fb9crUbreHV7o2/wl0bnhbOT/In5PhEij54JgeH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jyc67IFATl8BJHTR+GbdYVwNIIpmuaWI6dapaI5e9GwFE7PNHx1IKoPjpKssp4SDHG1qFVnVbbjAYUtAxVKOAgOkWdW78TnvDcT5prqJ+EZSzTvYsB1XkHL9ZI2NkhBgegPoD+AdW7Rzbzn/4UKnM82Q+dYFi6DT267GZRF/w8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9GyhaLH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9GyhaLH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E858C1F000E9;
	Thu, 27 Aug 2026 12:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787834665;
	bh=OG/i49AUF5ncN9ZquXzQyCMye6P3QPZAzJwH1vW0iXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E9GyhaLHvc5qm1xe5F+LweUh5WMOvuzORzSiuUsyNLPdVi2x6c8+8QueV3zeRANI3
	 +NZ8YOu6Uw76InokvaP4phxEiT5B9dtHBAgCFnM+fYDhJJy1Es5fUX2ChNkj/rIH5z
	 /X3sBlpNqKo79r+ElV2WVt5aMeLHVeu8tXudBknO6HsgImpiY06ZFet8UT/TYziJSK
	 BzMECwXJBYSRxTKJoGS5ieJJXtVtz0w3paau347F74DJuYSqY4tW1dzjD5nmZokhb3
	 QtmJbjWDLR0TbKWMUZHtycEp3k2jwMM48WguOE3+UzH+UxnSoGpvBKoHoW1YitFOZy
	 hP2GsVd4JEayA==
Date: Thu, 27 Aug 2026 14:44:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Marek Vasut <marex@nabladev.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 11/16] dt-bindings: usb: dwc3: stm32: refer to dwc3-common
Message-ID: <20260827-beige-shoebill-of-calibration-ec29ff@quoll>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-11-c5e27cbc0795@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-11-c5e27cbc0795@foss.st.com>

On Fri, Aug 21, 2026 at 06:23:22PM +0200, Fabrice Gasnier wrote:
> Add reference to the dwc3-common bindings, used on stm32mp25.
> This is a temporary update, as it depends on Marek's series [1]. This

Why should dependency be put into the commit log? How does it matter
after this gets merged?

> should be dropped in later series revision.
> It's a precursor to validate further DT addition on USB and Type-C, with
> usb-role-switch properties.
> 
> [1] https://lore.kernel.org/linux-phy/20260816213849.1044073-6-marex@nabladev.com/
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml | 3 +++

There is no such file. Why aren't you reviewing patches on the lists but
instead create inter-patch-chains?

Best regards,
Krzysztof

