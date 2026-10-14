Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8690A3CFF65;
	Wed, 14 Oct 2026 05:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791956307; cv=pass; b=IceFlbFEu4GPie18bUusZl23ePhD67HqgH6zPiZEcpPLLnDDwPa8DJwgwN66Uf6f3ILGHtaIChCZ1c7AHnIKNC8QyjaPL0GzN+HQgU3bbCpFgq+shPD8kQ2ZMrNxvIXErHQUIBbqLOc5dCiaU5z+dKlSDRy7rXRCuD/df6lDtlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791956307; c=relaxed/simple;
	bh=3J/rLb8ES5AcTKu53P7jRn6B5YHHOjcAiDoWUeN4j18=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dXy69QsCqSMVN3PO1MVSVcHURIS8mb6gMnRkb1UhW1PBaIDyHhxFnlABywowmaj7trps4tNI8OKtSix5hoLdEhKFjovljQ/JzTsfugpDLWIXm28MClhIBzjoWtoYzpd8OtAGky1xS5pxnLZHFygdsCi1zTSm59p/g5esI0L11ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=D65J5Mc1; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="D65J5Mc1"
Received: from ratatoskr.pengutronix.de (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EE6B0201E26;
	Wed, 14 Oct 2026 07:38:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791956301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FulSn6OJfeIHzDnwk3zF+TElaTpZOeiPd2UC1814V+U=;
	b=D65J5Mc1W7aGTZbC5Kr0FJQkrVhgRmBZs/E5IVZe41xe0QTeH1CjlVxnU97EotB6zloDtD
	/qryNloec0QF2XK6bfYngITa8dlv+rYui6u/yoDuuWxmxgyqEOudDRxTGKGPzMwZDV3/iO
	MnGZBMN66bcZYv3a3KE6xTKbVj4K4x3DBKQCvPxAN9Tcciul+FRxNros+md1aoETq7jZMt
	pwDxXdmxNfdGb4c3FzV240jt9GdSZYXTUiKMpSmFmZjNZr7N7wX+TbpdS2lBvavJaKmn/3
	IMPhf9f6WaVeTB/sjcrRgnV67eN9lnU/Uzgd/XvparOr+jzSd12VTYKIkQsL8Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791956301; a=rsa-sha256;
	cv=none;
	b=HiYGDgXPxnLGdyyDGdK3NF/UcQyqOsbBbTYI3MQGR9J03xmRuHBNtzcxZAcT4FSswwpeSU
	zi76Iehe4u99O++kbDbGZ/RHurSnKOArXb2kTD6Z1afAz44RhdoN3oQSClGJnUdpzQr2M/
	pPEpFXs/I2Z4KqUhWtzP1HEexuKT6eMLtxyTdUn1HDmZfDUxQnHUMZD8vEGvsAwJeIAzmu
	X11gwfYY/LxExD3uqze9VUsEVD7l2zoZi/fggXBP2ciGmv/+FkFNKtGBtnFnb88B39tfU2
	4FTMrqHg8hpFjo3yUkV/zLwM0RB/35g43uoyU86aKqKeulM3uCZtINmdIB7Vfw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791956301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FulSn6OJfeIHzDnwk3zF+TElaTpZOeiPd2UC1814V+U=;
	b=ckm4czR412QiT0dT4TUaq26A19Hdcn90xw8b7xfthzJC31bF7ySu9Re4yTM4ja5VN4Nsrl
	uWpcrYzrC5yctBCY7kF43WmqLbRi0TbL69pg0JDxocdkAFIECM4hlT7d60ZafSOm5339FF
	LqA0J7cUMhI1+9ILrFYFc4nbGJZNkJAT1+/pbVOR1uJfcEBdNjdZATA17eQ2wUNlIexVTY
	uP3m9ID8GVc7FvhPdSALFS+dqpZqXbRRsd0A8ibcqLwPROlzXLqZX5qY9Q6s/N/s5rHF1B
	ygjrEs2RmQi/35O2kg8VW0IKIoNmMJo1riwUDReg9xE9Ykss80g1dBsIrcYGHw==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Frank Li
 <Frank.Li@nxp.com>,  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  Shawn Guo <shawnguo@kernel.org>,  =?utf-8?Q?S=C3=B8ren?= Andersen
 <san@skov.dk>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/4] arm64: dts: imx8mp-skov-revc: convert to overlays
In-Reply-To: <20261013-musical-brown-mamba-ff87a8@quoll>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
	<20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
	<20261013-musical-brown-mamba-ff87a8@quoll>
User-Agent: mu4e 1.14.3; emacs 31.1
Date: Wed, 14 Oct 2026 07:38:19 +0200
Message-ID: <87v774j0z8.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed


Hi,

On 2026-10-13 at 09:31 +02, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Mon, Oct 12, 2026 at 08:30:32AM +0200, Steffen Trumtrar wrote:
> > The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
> > similar, apart from the Display and touch controller.
> > 
> > Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
> > variants to use overlays applied on this base version.
> > 
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             |  5 ++
> >  .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
> >  .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
> >  .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
> >  ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
> >  5 files changed, 91 insertions(+), 99 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 475e1ad9116e1..7c1b61249778e 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -707,6 +707,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
> > +
> > +imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
> > +	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
> > +imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
> > +	imx8mp-skov-revc-tian-g07017.dtbo
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
> >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
> > diff --git
> > a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> > b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> > new file mode 100644
> > index 0000000000000..33ddd08a7adb5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> 
> I do not understand this. This is a board, so not an overlay.

yes, that's what I did up until v4. New board with new dts.

- Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de

The boards are all very similar apart from the touch panel, but they are all "real" boards and don't share a SOM, so dtsi is also not correct.


Best regards,
Steffen

> > @@ -0,0 +1,38 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +&{/} {
> > +	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
> > +	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";
> 
> Best regards,
> Krzysztof

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
