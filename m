Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66420402436;
	Thu, 17 Sep 2026 08:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633163; cv=none; b=qfcGx7g93gysNscx5NssDPay5Kl8tKqu8RlrIi1irxRfBR+8EwNULTFaFQkr7QcQnE/6oA4FFFOXvvYF+/jZqTSu5Lwpq4HQVXB7D6PnuyhmZKn4Czz0mYfVczsRlsGJIk6jFMX7ihpsn0/FadDuVkDAUUEpWmPDh/QsLuuAF1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633163; c=relaxed/simple;
	bh=LS99K8Op4slw1Q3V2zznD24yITjo1HPU1HStlTL3Ldg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDCTXm6ac7e0Lcdbhppckwk+YWPkdQ/NWl4am0LWB+12x222jSkSev87Fgvw22EwdxLU0yJ+Dtzrnp79S8q/fiR4wwp1xRNINOYhWcs8jL+K1+EjNlU0uADVSR6v5P/vFlGs5/xSnlvuYGOY7spKk0RUz5m/Hs2/UPJapNYxCj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uTFwO27X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uTFwO27X"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 942DB512;
	Thu, 17 Sep 2026 10:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789633056;
	bh=LS99K8Op4slw1Q3V2zznD24yITjo1HPU1HStlTL3Ldg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uTFwO27XdrmQIcRxWvyqKbRrtAt0F2Z5jOGUrbXKX+k9RSjYlRf/36wVgt9WDMmhP
	 ogVToOnFrlhfS6IE4a5IpMbyyYpy/OLND/JQIJHPNXJ39uq83yhYpwV5mNIGcQLvFX
	 2pKzZF1x3wIM80PjU2x5uV471p5Sbq90NaR0TYAw=
Date: Thu, 17 Sep 2026 11:19:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Leitner <richard.leitner@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: media: i2c: Add
 vision-components,mipi-module-controller
Message-ID: <20260917081917.GB21347@killaraus.ideasonboard.com>
References: <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
 <20260916-daft-relaxed-mouse-9bfaf4@quoll>
 <aqpC8fxO4F3bFjF4@bombadil>
 <45fd8255-6ba8-4488-acc8-4f7fc9c85ade@kernel.org>
 <aqpYqrtKTY20IW_0@bombadil>
 <a46e3ea2-8a21-4b9c-a112-99d249f46e99@kernel.org>
 <20260916165244.GB191870@killaraus.ideasonboard.com>
 <f20daf57-88cf-44e1-a2af-8769d3500176@kernel.org>
 <aquan_6JiKkEw-Kp@bombadil>
 <3dc63afd-ab21-4e3c-b6da-0fb51584ca9a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3dc63afd-ab21-4e3c-b6da-0fb51584ca9a@kernel.org>

On Thu, Sep 17, 2026 at 10:08:15AM +0200, Krzysztof Kozlowski wrote:
> On 17/09/2026 09:55, Richard Leitner wrote:
> >> There is no "clocks" property in the binding. If there is input, then
> >> there is a "clocks".
> >>
> >> Then we never describe external oscillators with "clock-frequency"
> >> property. ACPI does, but not DT.
> > 
> > So how would that be best solved in DT?
> > 
> > Should there be a "fixed-clock" child node for that external oscillator?
> > Something like:
> > 
> > vc_mipi_ctrl: controller@10 {
> >   ...
> > 
> >   vc_mipi_clk: clock {
> >     compatible = "fixed-clock";
> >     #clock-cells = <0>;
> >     clock-frequency = <37125000>;
> >   };
> > 
> 
> Oh, wait, I misread. The external oscillator is not external to the
> module? Below...
> 
> >   i2c-tunnel {
> >     ...
> > 
> >     vc_mipi_sensor: camera@60 {
> >       ...
> > 
> >       clocks = <&vc_mipi_clk>;
> >       clock-names = "inck";
> >     };
> > };
> > 
> > Or should (as discussed in the other branch of this thread) there be a
> > separate compatible for every vc-mipi sensor variant board? Then this
> > could also be part of the compatible-dependent driver data.
> > 
> > Or are there any other/better approaches to this?
> > 
> >>
> >>
> >>> uses it for internal purpose, and also to provide a clock to the sensor.
> >>> Very roughly speaking, and ignoring power supplies as we focus on the
> >>> clocks, the camera module is architectured this way:
> >>>
> >>> Connector
> >>>    ||                                       +--------+
> >>>    || <------------ MIPI CSI-2 ------------ |        |
> >>>    ||               +-------+               |        |
> >>>    || <--- I2C ---> |       | <--- I2C ---> | Sensor |
> >>>    ||               | FPGA  |               |        |
> >>>    ||               |       | --- Clock --> |        |
> >>>    ||               +-------+               +--------+
> >>>                         ^
> >>>                         |
> >>>                     +-------+
> >>>                     | Clock |
> >>>                     | Osc.  |
> >>>                     +-------+
> >>>
> >>> The frequency of the external clock oscillator is what the
> >>> clock-frequency models.
> 
> ... this sentence confused me. If the oscillator is part of the module,
> then clock-frequency property is applicable or it is implied by the
> compatible.

Our replies have crossed each other. I should have waited, it would have
saved me time writing a long message :-)

Yes, the external oscillator is in the module. That's why I initially
proposed using the clock-frequency property. We could still model it as
a separate DT node (see my other e-mail), but I think it brings
complexity for little gain.

-- 
Regards,

Laurent Pinchart
