Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E53AC0E9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058378; cv=none; b=OBmtimxnbNo+x66XEtRS4shQSLTtddJW176yEa7521VrNCtP90P662MXf1ClAdl1w1+2MLYuXwgmywPr2nO6VlkxfbnUjBW7kj0I7O8t6g7dXe3nwYbfBmzc20o3JAPFEa+WkkDT0nFIiqagN96rcuapsdH1IQLa/aY8wonnxDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058378; c=relaxed/simple;
	bh=6eFXZYIyBvltXsSnzrJaFa99BMULASGYR60Dhesc568=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+AdZM0ECLgIazF55Y2mfJWxyCRUwXme/d2LMKbB9DP+rNsil5DYkAHh5T/gDcDl3cjLecZk0RnSTM8Gp9zA2hjKA06mi1VV7RpyCdjQNmrKP3YjOVjh998EWNGhftJqFOK1MLWKWrgs3/bTfFn6b4T9nKEknI2rkAgWrRknQaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxEyv8Cw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxEyv8Cw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so440735e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789058374; x=1789663174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGCi7JGudYz4ih1yv+RTXMGqMbQdRYeEJWnczslWMzw=;
        b=VxEyv8CwTT0stgUdP9idJenz0VMAKoEoC46exZi3BSuydxmHemKnXKorqzPPcddVmw
         vhI0zy27DXItdDOVIljPsCTClgN23xUou6Xv4YMr9zvo+tlsurc7UkayXZDlXQ+1BYvh
         NwFszo4HP4er0tloytn8DPmnEBCrdOGE6BRk9gyLyKbvEbjyPvzT5lbAkVucyAJxx6v4
         xbT+LTEhWijkv7DCYdKYKXSjFLFpR5sPIoboRTB/1XUBa8WcPYycshNmw631l2mrOh8o
         o9Y0CL1oC7UZRzF6ZBndTOCFJrtG3ZMWP1aVsFvodKZLmvSunxXpX/3l5gWJ1y0VzXP/
         +I/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058374; x=1789663174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGCi7JGudYz4ih1yv+RTXMGqMbQdRYeEJWnczslWMzw=;
        b=EPtKSNK2ezf0KtHzaKgeJ2WrPPffhCe5xLewjggI/8eMQYPkzsqfwktLhkPRb8a/Aa
         BLKaCn5J0Rp4YiglDqYqzv3xVqToJtwiS+kAV1zjC8MI/abjaFBcXQYbZItyKPUpz+if
         OHkL8q9phZ4t3Tw8J0tN4nbGnYG5fOY6dBqNYDjaaddfb8+e22qSZWv+iiWdi1UCZT91
         eI9+OqyPA7hcc7ajCEqjyTJmokFCFNU7h8inrd4jZuNYs9MD0mDMAcWuO8SVxLl+QbTU
         PM3cQmEB9yGgXvRFY5E6Ts0Xwt64MrBDgD62CbWrHDB0/RG+9jQ7ExmVsQ62uH1ivbIs
         mwNg==
X-Forwarded-Encrypted: i=1; AKwUvByU1VY0EFNDAXLGuFTJSviQI2Gt7h951ePFY3too281/eb2GtPV5fegLodEpq9f8KBY6Z3qnb5kRATNxGk=@vger.kernel.org
X-Gm-Message-State: AFuF++n3j2e84yMcOZgOyUn/I2Xw22M6tihrvOin9S0Lrs5XRBmLi02e
	cP3Mczk+1CEC3BSPv4cGJ0qDOdchD2+3IfnT2cP8R6gTmp57A4ng/0cA
X-Gm-Gg: AYBFou11Tgg0Ke7tGJELpPzJb/okWNtT3sIxfcA3VfB0mQwsSNgb5U9KrdAHj6sKxNH
	O9NTVHLIkGbgyE2HekLov+heGEiIZCrrw19UjwFUaJ57f99x9Hhhdi5iXaMvZmljxfXBJA7onzl
	JSAcVpzRLQiijYYqxFk0hIRGEp6PVmcWs7sawP/9KQ4IAnBdqL5rIw2NjLoLPtiokOm9SDgjeMp
	sNI6775IG/C/5oO+9gwphFnFAtjGGM4PHEE7xjJ7aqU/RpZixX7dg8b9oGFRCAnCG6e4T9qVDXf
	BQ5pPCogd/vaVHs/cNUdUdlUWXg1nOZNR91UkIyu+kK37aRzJ6Vwa43HAgkWlLpTKom38MXpe99
	qAAI7wboR1zFgEhCXD41+KPg3q4x5t3Pf4qZgtIV0aGSGdbwdCGaQ32R4YYF2WK+9vXZHEUdGDg
	Mnhwe0d8BK2YZBoQJj1s7gNExPOOkWp9TMkPcvLi5DiR3WsvyQxrAoCkb0BecPUBXKA8m2G5ac3
	Z0LAAuoSbMM3ukmqe6iCVawjnJducVxo/n/K5L/NLu00LxNdL0dur48aeLYHvDJkb4JCenz/Q==
X-Received: by 2002:a05:600c:6383:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49cf820507cmr379154095e9.5.1789058373630;
        Thu, 10 Sep 2026 09:39:33 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm155013825e9.3.2026.09.10.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:39:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 18:39:30 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Message-ID: <prwghb3ftrz5xd3hapxtlv2o2gm5xmuapnpz2h7fqulf75phqz@lk4yiaepormb>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
 <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
 <aqLaLmz7n31P6igy@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqLaLmz7n31P6igy@SMW015318>

Hi Frank,

Thanks for reviewing this so quickly.

On Thu, Sep 10, 2026 at 11:26:22AM -0500, Frank Li wrote:
> On Thu, Sep 10, 2026 at 05:37:59PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > Toradex boards route the sideband signals of their 24-pin camera
> > connectors to different GPIO controllers. Camera overlays which name
> > those controllers directly must therefore be duplicated for each host
> > board.
> >
> > Describe reset, power-down, detection and power-control as
> > connector-local GPIO functions. This lets an accessory overlay remain
> > independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
> > remain described separately because the GPIO nexus does not abstract
> > them.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> >  .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > new file mode 100644
> > index 000000000000..06e6836e1aa6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/base.yaml#
> > +
> > +title: Toradex camera connector GPIO nexus
> > +
> > +maintainers:
> > +  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > +  - Toradex Linux BSP Team <linux-bsp@toradex.com>
> > +
> > +description: |
> > +  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
> > +  clock, power, and sideband GPIO signals. This binding describes the sideband
> > +  signals as a GPIO nexus. The other connector resources remain described by
> > +  the surrounding board device tree.
> > +
> > +  The nexus exposes connector-local GPIO function numbers to camera overlays
> > +  and maps the functions wired by a carrier board to their GPIO controllers.
> > +  GPIO specifiers contain a function number followed by standard GPIO flags.
> > +  A board may omit functions which it does not wire.
> > +
> > +  The function numbers are:
> > +    - 0: Camera reset, connector pin 11
> > +    - 1: Camera power-down, connector pin 22
> > +    - 2: Camera identification, connector pin 23
> > +    - 3: Camera power control, connector pin 24
> > +
> > +properties:
> > +  compatible:
> > +    const: toradex,camera-connector
> 
> Name is too generally, suggest use board name, we got similar comments at
> 
> https://lore.kernel.org/imx/20260629074734.3643227-2-chancel.liu@oss.nxp.com/

I saw that and it made me reconsider this name.

However, I believe that in our case it is specific enough. It is really
the same on all our carrier boards, and Toradex specific. It's also only
for cameras, which is more defined than just "io". Curious to see if
others agree or if we should come up with a name for this.
 
> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  gpio-map:
> > +    minItems: 1
> > +    maxItems: 4
> > +
> > +  gpio-map-mask:
> > +    items:
> > +      - const: 0xffffffff
> 
> are you sure need full 32bit, only 4 pin, maybe 0xf should enough?
> 

Indeed we could reduce the size of the mask, but I don't really see the
value in it. Isn't it good that a user can pass through the full GPIO?

> > +      - const: 0
> > +
> > +  gpio-map-pass-thru:
> > +    items:
> > +      - const: 0
> > +      - const: 0xffffffff
> > +
> 
> missed
> 	gpio-controller: true
> 

This is one thing I didn't fully understand about the GPIO nexus
concept, why would we need this gpio-controller flag? Isn't the gpio
controller behind the nexus? The nexus just maps onto it. The actual
controller would be on the SoC or an expander.

> > +required:
> > +  - compatible
> > +  - "#gpio-cells"
> > +  - gpio-map
> > +  - gpio-map-mask
> > +  - gpio-map-pass-thru
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    camera-connector {
> > +        compatible = "toradex,camera-connector";
> > +        #gpio-cells = <2>;
> > +        /*
> > +         * 0: Camera reset, connector pin 11
> > +         * 1: Camera power-down, connector pin 22
> > +         * 2: Camera identification, connector pin 23
> > +         * 3: Camera power control, connector pin 24
> > +         */
> > +        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
> > +                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
> > +                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
> > +                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
> > +        gpio-map-mask = <0xffffffff 0x0>;
> > +        gpio-map-pass-thru = <0x0 0xffffffff>;
> > +    };
> > +
> > +    gpio1: gpio-controller {
> > +        #gpio-cells = <2>;
> > +        gpio-controller;
> > +    };
> 
> Need't gpio-controller.
> 
> Frank
> 

This ties in to my same confusion above, could you explain why or point
me to a relevant example/docs?

Thanks and kind regards,
Ernest
