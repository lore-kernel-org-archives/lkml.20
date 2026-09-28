Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D36A4B7A28;
	Mon, 28 Sep 2026 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596103; cv=none; b=mbJTJ6D7kVEGyT+lfRu1/3Ig55Ib2KeaTNS18pI8xUK4hWUFmjk0ATuTNyXIn8T8IWyHNhRSn3M/GBOtFH+6IDrFg/MQ/gkq8lsVVlmlHgcy+8Yrn8GjvLnXtjJelEBEshmMPggQytl93mnywY1Jy5vANzP2Goxxc/VqKB27WBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596103; c=relaxed/simple;
	bh=EgPFAuP9qvQBrProAV6Bi/9+EkS0oVZfziknCw4Lrlg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=pstxIicdiK9nmuTHWI5wWebM4V1j0eI+ARtls6d7H+gON/PumFwOPaJVya8HRW/+C7x2LCLKhOiNBwxLrO0uVzKJ/INpvqDlNbRHWXiRRzxd/uimSoZoShMLkp0DVwQAFgA/pTvYbAAZWCvOHiyKyMpNQ73gwsqx2uzDOAdIToo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MGXKKc4c; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MGXKKc4c"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BFD551A1040;
	Mon, 28 Sep 2026 11:48:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73DFD60504;
	Mon, 28 Sep 2026 11:48:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAA5A102F2227;
	Mon, 28 Sep 2026 13:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790596095; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TR2EoUedzfwkF3107b5KNS7BcXvPvkAv8bW+yYycLg8=;
	b=MGXKKc4c5SOmaVWp/phoair6djFZb7UjXYb4g7L1mu9HkDS45D2Mlcr5y0nCwPGAVqpsGv
	OEyWMqiy3ker2qxJrAW/UnrGrRHX0U5FTADuUuUtmWYUjbjs5sEQnRZOMUAMqnzQlFMAjA
	pPfwXpH8+1YUt2r57oV6Vdkon/lXPcVhV54ca8km8DMGpKDscvP2exc0uf2Nu6SDXfkR44
	TLdVQPBbaKuqlM8N4aAFilFSY0cAFNPEgcpSiJcNTfZYNkrgZ0RKbrheWBH8E5cEAIKAjr
	8JuIZsDLIGY++CVbtEFdbI5WenxcI1Asgjh4lbJzwiQZuHiUsB0V5sy5A7bfEQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 13:47:52 +0200
Message-Id: <DLQXBZQ8KOCD.17XT73H60GTNJ@bootlin.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
Cc: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Chen-Yu Tsai"
 <wens@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>, "Frank
 Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Francesco Dolcini" <francesco@dolcini.it>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>,
 "Rob Clark" <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica
 Zhang" <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Marcus Folkesson"
 <marcus.folkesson@gmail.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Yannick Fertre"
 <yannick.fertre@foss.st.com>, "Raphael Gallais-Pou"
 <raphael.gallais-pou@foss.st.com>, "Philippe Cornu"
 <philippe.cornu@foss.st.com>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Adrien Grassein" <adrien.grassein@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "Simha BN" <simhavcs@gmail.com>, "CK Hu"
 <ck.hu@mediatek.com>, "Jitao shi" <jitao.shi@mediatek.com>, "Yongxing Mou"
 <yongxing.mou@oss.qualcomm.com>, "Abel Vesa" <abelvesa@kernel.org>, "Chris
 Morgan" <macromorgan@hotmail.com>, "Martinez Canillas"
 <javierm@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
X-Mailer: aerc 0.22.0
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <179057359762.92994.13773102514654073802.b4-ty@b4>
 <8499ed1a-df9e-4e5a-b609-3da8499a47b5@oss.qualcomm.com>
 <20260928065837.GA22609@killaraus.ideasonboard.com>
 <ccb949ea-5fa9-47e5-be75-af8155328dc8@oss.qualcomm.com>
 <20260928100841.GC22609@killaraus.ideasonboard.com>
In-Reply-To: <20260928100841.GC22609@killaraus.ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Krzysztof, Laurent,

On Mon Sep 28, 2026 at 12:08 PM CEST, Laurent Pinchart wrote:
> On Mon, Sep 28, 2026 at 10:08:43AM +0200, Krzysztof Kozlowski wrote:
>> On 28/09/2026 08:58, Laurent Pinchart wrote:
>> > On Mon, Sep 28, 2026 at 08:03:18AM +0200, Krzysztof Kozlowski wrote:
>> >> On 28/09/2026 07:33, Luca Ceresoli wrote:
>> >>> On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
>> >>>> Correct indentation in the examples to consistent 2- or 4-spaces
>> >>>> indentation to fix dt-check-style warnings ("example 0
>> >>>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, =
but
>> >>>> re-indenting entire example just for that is too much churn.
>> >>>
>> >>> Applied, thanks!
>> >>>
>> >>> [1/2] dt-bindings: display: Use consistent indentation in the exampl=
e
>> >>>       commit: 370c5d9004f8b754351981d59fc26851bf943e93
>> >>
>> >> Thanks, but I expected no one will pick it up, so I asked Rob to take
>> >> it, thus it is already queued.

Sorry that this caused confusion.

>> > Please explain your merge plans in the cover letter next time.
>>
>> The merge plan was this going through drm-misc. It got reviews, no one
>> applied, even Dmitry for msm only reviewed the msm-bits (second patch),
>> so I asked Rob to take it. This was not planned, but result of usual
>> drm-misc inactivity for bindings (many bindings were not taken in the
>> past or with noticeable delay/pings).

My personal rule of thumb to apply patches to drm-misc is to wait at least
(the latest of):

 * 2w after the patch has been sent
 * 1w after it's reviewed/acked

This is to give everyone reasonable time to chime in and nack if needed.

According to that policy, which is of course debatable and not ubiquitous,
this patch got applied timely.

> If that happens again, could you please reply to the series on the
> dri-devel list to tell it will be merged through the DT tree ? I don't
> think there's any issue with merging patches that way, it's just
> coordination that's lacking.

I agree a ping over e-mail or on #dri-devel would be good and less noisy.

But if the patch has multiple eligible branches an "applied, thanks" e-mail
would let everyone know. I do it very cheaply with 'b4 ty'.

Kind regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
