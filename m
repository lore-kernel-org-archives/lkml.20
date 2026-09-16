Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E002A4A64C0;
	Wed, 16 Sep 2026 09:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550581; cv=none; b=ULNWX1ejrVZurC6dx0wulAhdBQtCGqbcbAyV+teBXvpPoG4iXAiZm68Wwcdkpk9FBTcJ6ZxGeXIiHnkH3mxIPjyLR60VUh2e38oOjMSRsjBZWuX9a7H+vZGKnXNUGTfW+f4SAWni2m1FQGD/gsIZdvgSRWVBvQuGlsud1x+hGuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550581; c=relaxed/simple;
	bh=x0Bv120PBMqdBL0qiaWthAuVHa6Rz3oJcR+zaqc56rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCN86Na8uBoz4OoncxvNGkcz0Ttco2Ybejq49YUIN/V+atMbsEBHfRfgbhaFJzYZaD7xli8USlYTZMyJjLg3fQiq9ElqhKUym02Dxq4nNcyGLaOz6tVK7gUVdTwmhaxAAUoYd+lvPfIxjnEf89fM+7h53uR5biVzXzLQlWjp81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=T0JrFGj1; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="T0JrFGj1"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 1CB4A22819;
	Wed, 16 Sep 2026 11:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789550564;
	bh=BTV5XMyrmHp39LHImMD7jLIBjdgbYzzgBsLUqmjYR3M=; h=From:To:Subject;
	b=T0JrFGj1/D4bssAaOGqKlJb+MlfTwpU+rmpdeUZaoGgTMQlHtWmIBgKSv6CPgR5pu
	 CJOcJwIxs9Br5Grbb0Jgo4NsmF8jhNEmC+f3g3WM0fCsiPfH+ObpmpO8wCM4uT1qew
	 V1rIi407+uL42ECJgC6e5fSOOvfWK4tWxnJJiYriUEeSeQzyrD87kt82LOEx7744rw
	 JM+KJGHb+fy+2MoqMyzrWct/oZ5HhIfbMh8LNsQS3crESWCXOrgJ1R9ck25n6cXvzg
	 8VoH2BINXGyYMm0ZbsyNxb306RT3moHfBVGG+6IR+YXarl6NmMqkuF/5DKVMnyqT92
	 0W8BP2CYLyb/w==
Date: Wed, 16 Sep 2026 11:22:42 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/4] ARM: dts: imx6ull-colibri: Set LCDIF bus-width
Message-ID: <20260916092242.GB277833@francesco-nb>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-4-francesco@dolcini.it>
 <178954813309.214898.9623998050171113140.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178954813309.214898.9623998050171113140.b4-review@b4>

Hi Luca,
thanks for the review.

On Wed, Sep 16, 2026 at 10:42:13AM +0200, Luca Ceresoli wrote:
> > The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
> > the bus-width property accordingly.
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > index ec3c1e7301f4..1eb1cf2d7395 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > @@ -229,6 +229,7 @@ &lcdif {
> >
> >  	port {
> >  		lcdif_out: endpoint {
> > +			bus-width = <18>;
> 
> I don't know the hardware in detail, but the datasheet [0] mentions 16, 18
> and 24 bits, and says "Up to 24-bit color (18-bit recommended)". More
> details in ection 5.6.1.
> 
> This patch would force 18 bits, but "recommended" suggests 24 bits makes
> sense in some cases, no?
> 
> Can you elaborate on this?

The colibri family standard defines only 18-bit for the parallel RGB
interface on the edge connector, the additional 6-bit are mapped on
different pins that are not on fixed position, depend on the actual SoM
and can also be not present at all. The standard/generic colibri family
carrier boards can only rely on the 18-bits being available therefore.

24-bit is possible and makes sense only on a specific combo
carrier+module, and not as a generic SoM feature. Assuming you would
have such combo you should just override the property on the carrier
board dts file deviating from the standard colibri family.

let me know if you want such detailed explanation in the commit message

Francesco

