Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FA84A2A6E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062771; cv=none; b=UV9nI2MnQfoFSGFDl5Ww09Wo6JJS680VSfKBwDFhQLoJbPP0w7HLYYtLIRtymciHYlsGsIVn+jz2Un7023z0eCwdgP/E+RCf+o5AQtMGfQGJch0AvGqROdj0aMsmZxQDH53tIiHM3FANqqyRI7Y71GGN5eJWSu1eL2OjvAl1tQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062771; c=relaxed/simple;
	bh=VREGc/jXj0Z0SXjsh8IXf33tikwFMJzZfA+YaVWVO10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezXBCP6yu4i+n1SWi6W+OlGwi767OGwLCa5DfcSZFPzSLdDxLO7QAvx4yS/Qis5uvtJyOdBRJNlHRhV1lA+qMR8qMU646pbUNQQvmvuyqP+nsVWEr0lGIQEIGnYmm8Us6BsbmgnS5sQRSQ4BJWoqQjwn/EfBX3ua3gHlxV21jl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYHJwrZ0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYHJwrZ0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b042c0759so3805519f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062765; x=1792667565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VUqBmWmM5axrFUhnR3iwkhZ6bc0BaajgOPvb6M4hJIo=;
        b=gYHJwrZ0sTEFvHLm33JMeU1sGznSZQ01c7GhBKC1gr/jfp36E/69TP8GMOJl3m66Ju
         xymDOJV5aSL3MZL5n89xwsx/bHyNCf1uO5rVAuZssBrdsR9jholTn3nWROwbe+maUtCA
         m9kHLky1wnyCQ7I/ww/wnQOInBoyf1lircn+eiUTGBPrKClzPRR0Vh7VpGY7ZZRhZ0R4
         xpvhtHOO8mm/jqDNDb224t5DVSzihv93fPfzZwhvJClwDEM3ieGra3jPSFndNfkyNLkK
         PyWRk4rnUEedsScS303QMBxRZfPsZPLxkpslvMHHRmW43D1Jj/+QWKcSPAWvTuw9OTZI
         NQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062765; x=1792667565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUqBmWmM5axrFUhnR3iwkhZ6bc0BaajgOPvb6M4hJIo=;
        b=XbpTYyN8lfa9huz67yy7w4V7qIh0UVl0TdPVP3hRWQUbvLfURBK0Y9v7AygwuNNVQ5
         Dq5NziaNQD0OKfGSvqlxeIP2A/thcNKLuuEJXjjGU6A8L7QA7fgvJc7djUQ0PieaXvbB
         J0DktSRyQ+ugHfkx56ojIrSWrHeDVFIb/Wihx6h4VQ11Q1vp3IeMh+BvO35KRAeLObS+
         GIJRqlRItD/hz8I74odY/HL8lQDrrKAl/b55PVIeQoaQIjic69eSCpmyr9nG0gaFFTUD
         OWdYv1PcyvtJIdpmqnPU5MBiUF2JbHP1fAqwdlXb0VDg37ycjNtboKHppvTcRHFUzXbh
         WenQ==
X-Forwarded-Encrypted: i=1; AKwUvBykJ6F52Gmuxh1afd37J0uNcwzxWSEL4U5zp4OvCHs2oR78gbbF6drz2QVuqPCk/EXtSflFZAY1LnkuWCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjaGLO5Dgdjyy4iVxpWnKdmyUK7LB3Wj26lXmAh6qQcwRErnxa
	leVgDZyP0BZ++QVlH2eil8wtuJ9tKQoJYqnnSHy90OTx8gi5IlvhqK9A
X-Gm-Gg: AYBFou2j8ajfP6L/TRwEky13VIhYuE/rFs7KKpgzUeVqScdLkEILR177f59V9mlSQYo
	8kQ3PZlOCo/PFe1/8F9TiTzqabLJZuM1yCiSfymlgUrL7WeiWyWELmZuc8sXwLFZfHjv7AGIEmW
	U417gIh5bv810K+Nlk22sTZBvVYE+e0BwlMG9Vl/N+/wHWs2OA0JkMOZo5Ln/EotieSHORU9CH8
	2JLBDaVm0FyHTOSuTUfE/o9S4apzkO/u/vioB9oxA7SkhjhDMckWVRuI+JsXQ5uNQKMAo4XTpYg
	ELcWhdQKXYRzS+rlZJhzrwur3zR/kyFEOE+NvrqpY0Q7yUUS5xEhmkiQ57uKhy3ogg/vGJJXUQd
	ZflW5uIvTuy9RYxNOeGqyRGh0lSxVKyn3qYSuwo/XWzPZC/0mEhz8DFl1BpfS1Iv0d2i+ZRGvEz
	ExVdP+oInWp9wnqo9J+H+qlV9U0FzrixMqhnUUM47kK0QbuzmZ/nZeMugz7l9VGukOz/mQKt0LL
	zWQ4ktYJZEMGNCN5WLe5Sg8zxWKDDbg1SFRUq/fvAU3MzOmJLpPNTcFS5WI6Y8VGEgS8SbvfatR
	1i96XUnDzYgVw40dssRH08Zlss7c
X-Received: by 2002:a05:6000:987:b0:488:7787:469d with SMTP id ffacd0b85a97d-48df14ed887mr6757337f8f.25.1792062764555;
        Thu, 15 Oct 2026 04:12:44 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm24262249f8f.49.2026.10.15.04.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:12:43 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:12:40 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag
 on i2c3 GPIOs
Message-ID: <atC1KAbaRwnrn-mR@Lord-Beerus.station>
References: <20261015081149.5919-1-stefano.r@variscite.com>
 <atCy2Li2wrPHhW8K@shlinux89>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atCy2Li2wrPHhW8K@shlinux89>

On Thu, Oct 15, 2026 at 07:02:48PM +0800, Peng Fan wrote:
> On Thu, Oct 15, 2026 at 10:11:49AM +0200, Stefano Radaelli wrote:
> >From: Stefano Radaelli <stefano.r@variscite.com>
> >
> >scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
> >following run-time warning is seen:
> >
> >gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
> >
> >Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> >---
> > arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >index 3e590afa4fab..036afa0f6990 100644
> >--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >@@ -287,8 +287,8 @@ &i2c3 {
> > 	pinctrl-names = "default", "gpio";
> > 	pinctrl-0 = <&pinctrl_i2c3>;
> > 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> >-	scl-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
> >-	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
> >+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> >+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> 
> I think ODE should be configured for pinctrl_i2c3_gpio.
> 
> Regards
> Peng

Hi Peng,

I followed the same approach used in commit
2b1d5d054d29e08926f05cfa30e34d149644585e, as well as in the other i.MX
DTS files that use GPIO_OPEN_DRAIN for I2C bus recovery.

Even in imx8mn-evk.dtsi itself, I2C2 uses the same configuration,
with GPIO_OPEN_DRAIN specified in the GPIO properties and without
ODE enabled in the pinctrl.

Wouldn't introducing a different configuration for I2C3 create some
inconsistency and potentially cause confusion?

If enabling ODE in the pinctrl is the preferred approach, wouldn't it
make more sense to address this in a separate follow-up patch, updating
the existing I2C recovery pinctrl configurations consistently across the
affected DTS files?

What do you think?

Best Regards,
Stefano
