Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29522C08BB;
	Thu, 15 Oct 2026 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045882; cv=none; b=S0SR/V35m+WudobIE3WOktqmVH3xyXcyEGgGuhkagT8dC7i0v/6/cfzZ3QU5l7x8suG9PTRiqt831y7UBbg5loJGCJ10e+IvxpXOgRh+jPReCxtXrDxrkS2LyxGusjLY5Z459vjgdUzMds/H1irHWiPcOt7cDD3QzlMTLnBX3xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045882; c=relaxed/simple;
	bh=dCXhnYzCwpnojI7u2wCu1WWFpQblxRM81sL7Ra6gHb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoQNWP6n1BosMwYgmZq1+9C6I/ijbOvPe1ndKhA//P84c+WrK78eS7Q+2BqIXb83Xx5gBNqMA8HCWq/IhTdp9WHNl4P9Pq4fogIyH/UKn5cQpMf27fNys5XPEi+hi8pjXsWeU5Ep4YPmOA3foZhq34PNoDwBN8orb1mbn0CUB0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=zzQuVjTI; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="zzQuVjTI"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6B3EA1FAE5;
	Thu, 15 Oct 2026 08:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792045870;
	bh=HxESBsBcOxfIXhfEgZgU6ibboT4Rgframa1w/vi5IdE=; h=From:To:Subject;
	b=zzQuVjTIDnlKGOVfK6vm4rVXgCh5moV/gqYTfDabv86bGMpRNP4ZJkj5ZqNHA079n
	 rVCKfmhb2JYJhimweFdfdC4bAhRB+OMjW+U0f3YzgAtliHKpMQTOavGvMJjKiy3Gue
	 9j+lrelQA3LfwygkQ0qcS5yPJgKA+w+0Lg5N85tqzkw5xI0opeMFxiLtsq0qTmaRvK
	 yQMtpeL20zCmEReNzv486ii7N7qNyZEzYgJC7EXuUwwZ7qsO1zMI/14cw3gvEYfwcX
	 Jiz8PaRUNneymfFB0Rn9UOSmQDod3q6HoRUXXhgAno6eUqfeYfcIg0yi2ZLHJxd0kf
	 kxrxPARlvXS1Q==
Date: Thu, 15 Oct 2026 08:31:05 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>, Liu Ying <victor.liu@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller
 subsystem
Message-ID: <20261015063105.GA5720@francesco-nb>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-3-alexander.stein@ew.tq-group.com>
 <as-JyQG5vgaPYLeH@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as-JyQG5vgaPYLeH@SMW015318>

Hello Liu,

On Wed, Oct 14, 2026 at 08:55:21AM -0500, Frank Li wrote:
> On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:

[...]

> > diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
> > new file mode 100644
> > index 0000000000000..e94fbc6eae07d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
> ...
> > +
> > +	dc0_pc: pixel-combiner@56020000 {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		reg = <0x56020000 0x10000>;
> 
> reg should be first property, check others, you can use
> 
> https://github.com/lznuaa/dt-format/

We have a tool in the Linux tree, ./scripts/dtc/dt-check-style,
I would advise to use it and improve it if needed.

Documentation/devicetree/bindings/dts-coding-style.rst is the reference
document.

Francesco

