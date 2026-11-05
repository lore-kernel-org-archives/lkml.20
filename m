Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846393;
	b=J4m3JMFZvs77eVltu0+7caIwuyzpE8P0rZ88aUJGyE0Zpea0cmSwVnziAP6d5bP8UqMy
	 U/rs2Yl5DTd7bbcMSE68an/FqtDA2rsO3xgLWDCaDUxFJHMfdRRCZ+iYqGElsrRrvOgLR
	 tQbgN6RCGpisHakQvpFm+Kwa+71Vn4v8qfpEK8S7mbg7cAnOySs5qtaD+jb2NnUouOxDZ
	 xmLDZPCmK5ElemqCDX5FRh+coBOggiBxIftBFIsKCurJXjPN6mKVbQOVs0QISq9cGIsbe
	 QjQDP5/SL5RZjWsE+NkAdfgQDnUekvVhyTx4KG2MsTpXmL/Lan4F2TJ+XqcfDikIT3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846393;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	b=1EJZCg8SCbxRN5MF7752a0sGydCtakJebARmycaWeFqAci1aojCbVM7+q3N6pRzSqePs
	 zhyE13IKE4xdgCzphmJNc2AMt1BWY7HS2s+3elYfnnDsNjabxQIH8TBgL/ab/8AJ1d9Vx
	 R4EcS9MuG7uarGGAD4IibOgyMZJTqE00NaSRznJzD7J2lRSeYKp0fVxPHnIpjt44RG0T7
	 MI6h1NOyDR/a0KfivkELz6zgmgoadAQARrQHL/TiQs6FfbzCCeB3UBGf75pG7/msy8uaC
	 AqlAsWecV4FouHS713PKcoH1yTsoRh5izujxDV3GAo8/zS0OE2/kBiy9xCnaVOCIP/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FD606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 043FD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793846386;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=Nqz4+xihSRA/SOazc9ytMPaaon6hM2Zpa/k876GDLA/rAvSdmROK7bgusiNH5yJRm
	 MxDa4YviOx4vP5CKZmEuJc3kfvwqLKu/L2OohyPYk21mJnJpm1Y7KU5OpOGkVf3+ti
	 zev+B3KBBNrXf3bQvlO8tLbPTEvcdSoXebx80EGI=
X-QQ-mid: esmtpsz19t1793846385t4ab9dc35
X-QQ-Originating-IP: jAFRworH1vs13TNo3XKmxMaP6Gk9VNAPonuIyG2DiCA=
Received: from mail-pj1-f45.google.com ( [209.85.216.45])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:39:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11113350443145860582
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso697634a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxz5Yd0Qny2UaTsQGGFvVlZgk57+H4NoUpTdqi/AVE21d5hYhCCfUgYz7Tt+cnputAaqjS6i+B8ry+baO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ki6/354LmcDw2ZOAhursJjjQStWifgzWzeYyarni/SSXUVjGF
	xMJp9b68EOckoACptczIz3WD7cpeI21CabC4IN1DcKTf0Y99+eq5mDxBAReQ19SqU2i6I3eLQsF
	tLzmPMAEn/Pp4ga1Fi3hktFXwoJeSLYU=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3ae8982c1ffmr16206466a91.45.1793846382617; Wed, 04 Nov 2026
 18:39:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org>
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Thu, 5 Nov 2026 10:39:06 +0800
X-Gmail-Original-Message-ID: <872B2B4EAE847E62+CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
X-Gm-Features: AclHuK-lEE7dv-iC1Lsio6aPGOufL5hgelB1hFojisk2-zoMsjC0hhsp9HraOXA
Message-ID: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OaSeLAL/pLNE6iqgQI6QdQ0ukAKcl204Ani0Dxue88h46qnMEMwruuVj
	LUlrq6t3bFyukk6fpDNcWdwc2VspmKnENHy6n9EariJY7sKd7RLoFSy7KWW9vzUt6+54Jj6
	DGm9mWxP3AG4AEIMynMREoiTDOHet3KErCAo+fXIhJp6tKIcQJwFNwS0Rh94jdCLOKVaKZD
	dk9SMXwO4zS3BXWjmkKBVWW4RMFV6OVKR73X33hE1yGk77+gYowFrP60G4z2d1kzMzjAmF2
	yydBgzVsNlSPGWukvWV5880MKoui3uBuTp5q+B1OshwKNb01/ZE1yipSqwQT+yFpY/d0mjg
	BJnxoLK9GCEiqBFGw+rUWsnjMmftHny7NikXwW84UyWdBY1kozMi+7oME0ogjax43Hq0lnO
	Vd91yMtSPcYKtazM8LOjI1oFmWwKkh1foZd+52sk4SP04CB5I87RphDTdzkb9vbNNMLp1z2
	lRhnqLr+Wg03aqz+5NipZl9nColO7oPu8CX+kwmuBn2FVwWSer6JfXpPnIIq4NEOO2ldw35
	bR0Haxfi80KGaHqESj/9BsNMAtKFUWo5REFf+CMjDJzAhJdRc2Obq1hrjUfFha0IDh5EmKt
	pTNvmjbGL8sBw2FBWIMUdr4heaPSFC0rqEMR0rjX+xItNdFwD8jd32Lpo7BHi5/26pVAprN
	I995NA+od99ClAHvJqRYtrAWqNGvaHZaTnlruOabtm+qXd/cDT5UdcSH8UpBYHiWlpq8D+0
	b7KRC4ASEeFAi9/aG3JGloZZ410zG3s11T5YjVpTGPttidPQPp5RUB/zAD2I2x2F784E9pv
	Updqu17s7JdUl8WgSToLzSNa92v5ZaEzdriiHTZkd+5hQcT20Id9zI3p0wXbLcA6sdhD51H
	3p9WbUQrJLKTDyOfyY3FIdQs4XOjCto9vOwXruYfisSWWKhyPofWuNSB6SByLjG/hF0U2M0
	ywFCLcPaPkaRKFNPO/RF1M9/dExlaVbvKlsmT0C5ajUoSX122VuT6wj7Yyz4tq+CgEFaFYE
	Lxgz9TV6wtc/IVq0xbHnVeRpwwpNVBvpgEuFJiZQRJw8BKhdov
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> index afa551f6185f..222d70baef1e 100644
> --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> @@ -47,7 +47,7 @@ properties:
>      const: 0
>
>  patternProperties:
> -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan
