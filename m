Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288191;
	b=BxETPadnZ4GP3SRdR7ToIEugiNTjCW37OlB3FD3qSU1Dd3+vMygDBt5gVRhy/esVc/ww
	 liSDGCrUl17K+pytz/Cc1qhteQZcC47y5fxAv0PiP1OgTr4zuX0MOuLzwxI3+Y+Y9qmCC
	 YTlbGKqMCSyDIMozd0e2aamJAoKP3POmyDgyjab3RTm4wkGD30tml0TUekIAYr24t1Zfm
	 bc5HAgACbVn6aq8CzOxcI0eoXDLYsCGrk7392EfGzBkM3piqFoKY5UvmSl4VDNeG+qWr/
	 yMxjsXJDPxz96kShrH6nfm7eCiAU8SFgFvHa5VX/60+RLiPJZMj/KgXMF138FA87Oqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288191;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=T2nhlnktC6+vpOu5LGFXVvKIRUFvwweE0CgD5SaybwE=;
	b=QwxClec1CI+5w8QLBdkjHdC2GJIjD6ANV0197gTYJe2Ow+QD+bAyCY/o9H8494hk3zpX
	 OSNhxJ7JUiOdTlP4NZ0t5LbkW1RyL2KH0GK9WDRRX83TPVm3GmxVmDFq6+yVXAIS0702/
	 D7SBZM/d1AEIjId27nTVFqtg2F4I56NQLKZo6fHi7htnBvgVVo6oxhlPc0oMX6Qqh9tF9
	 rTwPYPCMyyjc9JowKsrXZQ6YUEMCbqDripqxcYZXy0MAdLaRbHstACDbyu4n6iqEjhVub
	 nJFeyhi9bBnLnOYwKiAaxvbrZexSB2+f5TYM5P1EDBfomgo1x4lIG4NyjKnlfK+NP9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alistair23.me;
	spf=pass smtp.mailfrom=alistair23.me;
	dkim=pass header.d=alistair23.me header.i=@alistair23.me header.a=rsa-sha256 header.s=fm3 header.b=KpDOjiBE;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=spYI1GwE;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AC8606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5AC8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alistair23.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alistair23.me header.i=@alistair23.me header.a=rsa-sha256 header.s=fm3 header.b=KpDOjiBE;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=spYI1GwE
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id F1399EC058B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:23:09 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 10 Nov 2026 00:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1794288189; x=1794374589; bh=T2nhlnktC6+vpOu5LGFXVvKIRUFvwweE
	0CgD5SaybwE=; b=KpDOjiBEiB7vsZmFL7JvlaPk6xFRjfR7mbmcnM17kwpF3ouI
	zX1qon5dXBs9+KBoaA9bpajzXYdWX/ktCF6u3Zi2Hnv+VCYcFlhNKMkpxGy4N/Th
	evd+PUpzSaxBkmHG9rZ2WYqLyw/Tgx9Qas1hCWKJMEP2qKS3FcmtxrHAh2x40l1L
	uH6nWGelKjYAT7c1piGdODFwMcZPulYthymkxLoC1ApdYqeSsKvDrV4wqRJMrWFW
	vY0waDVbebDFiwtc7d3vEpQhIoBnRAnNNTuDbT4NppzToF3VcuysnSeFUO6NWIV5
	GUKPg8jiyBvIluzK71/CaJjVtbeXzf1Jr7NGLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794288189; x=
	1794374589; bh=T2nhlnktC6+vpOu5LGFXVvKIRUFvwweE0CgD5SaybwE=; b=s
	pYI1GwEwOjfIvH6g/LdRbVe+fcnLM6lx15N4bzckstQQg/2h36PH4J1mGRBbZ+MH
	em9ZJTHc//jBsJu11QNfXZNIBec6iAiqEmymLkuCGe//JZeja362+hx8PFWRxjpF
	eqwN3EgUKFD3FmKPz/aTbm+JCLGdCHsbDZPKztYEXQXMmvjrpZbhqeBX0s+O1Rdz
	UYmuQI4y4hyD5gXYot6QPR1BsYBuhW67zAosW8M1sdKs2XT8waoFT6Da4yHbIe0j
	KPv6dT0Ozk5S+BJXwx0L6cvlqlXfnCIPTbaPhxdgjNuv03UnzYSDj6PfVfPuWTm8
	U6wcW9KOkN/VWim3JOrsg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=alistair23.me a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794288189; d=alistair23.me;
	mf=PGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:AoY3KDW/rTnHHmvO9jYP7YVaN5TVbPMtd7aiIfJrvYBRPn1
	8RYbmX1dO3mu/7nHs1Sg6VA+lFYJJqDexS0A6bNU9xON/y1G8Cu20OFy6c7BatxW
	de6uSJA8zceHcAGYCGlM/wzJIj0o/gh2yJ1Ml0IMXqoCYff9Wkd87w9qK6yeiD9/
	s67vlRYr4cRZ/cYV4VhXJH3EdAGGjd9RonnMFVkYnMPm9I+sswOzreHPh6fFM+dh
	Czux7Rj9CUnAG6uHe2a1Qsy/jKCNpAQ2+yBRII4vuBePDkp9Vqc0SWq6ZaFwQ3hz
	gINO0Op5ScWwtjtPJCO6/enYeGYKsU5UF9MAiLA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:E9+F5HLFgZz19ViFV5KDWazPCgNCMAv0N6wh6U3+dn8=:T2nhlnktC6+vpOu5LGFXVvKIRUFvwweE0CgD5SaybwE=;
X-ME-Sender: <xms:ParyalWRKmx3UJdOU-2UBPwUvO0Db-9bVZ75xtAGz2yf3PFZxHe9bQ>
    <xme:Paryas2MhcRegoaQm7kJZ4IPMR09DJhXCmH59PphafexnRlFySd5A6hathStutdID
    hS8wdpngmga-57FXGlvOBroyvx5plb3zrDxJYmS1rgN4BYAth6Zv2SL>
X-ME-Received: <xmr:ParyasRo2Wx4VSHn9RZNkjYdflzznlmN_gzsGhPTQhHsdGL1ckZ9RC4fWrKC1u-r0GM92GEdSCtV_UjMCvSLl-6mP-g>
X-ME-Proxy-Cause: dmFkZTGqBuX4sZN2nDVJ/px5UrVJdztRnTOsNRAZSLYCUlxw3NGhJBNfRM2geYvMl4kkOr
    SaBD5eouIGLmXMXQy/gPLzuOSxSGKPMH1YTTkqzmjrV0L5Z2fwgFCkXmwhX6En2hzACDDF
    Ttd3rLZMjjKFiMf2Su56kvxmJZIvBcwFxmrCmbfTQt424EpyDiIGluHPzJp0V38RE3hvao
    3FPOFjU7AG74YWVlN6nZk0XV3VtKwHvHjSPw1Bl7G7BvgwodmfRWKfFBcT7oJisCRKTnwZ
    u9rVSrscMMhvArtCLbp1XiZ2d786Y7p7DGwYj9omuiY1kohetrPilohm0iIepp7y+uuqSQ
    zKfV4yP/etu6tdXXzwRm/nqWdER6Q5VkdoN5CKcsBPRsHBzYaWO9J3FwlEyhxNwnt9xF97
    mJ4hySDnUwvWQtDQH+VCF36rsCF3yCVt88fdBvY8mLzT3CKTNuH6UlCVD8ySQppJFyoIZV
    O+UrxuLxdGuuvp1UgBNWWhdy5u5PSfmqV1AgaeQ8UmV9LAfjTLgXRLfBiBVte2RnY6Kj3d
    6sQ76rDsQj4ecOscz0xEDyiY+9kGFSCyRfLQx1cTF0gZvjlUjlpcblOV4feOdi/wpDx64V
    7EKBJsWCRlXRFWZXh5iQpr7sR5Xe2cEh+ZaJzG/c5dE/LK4Q+CIhJPxMPg2g
X-ME-Proxy: <xmx:ParyaoQ7zFijaKaqh1XsKAo3lbd6HRW2Gut8VpkSdSRxp4n47LjL0A>
    <xmx:ParyalUuPEC9P7wrP2FHkiQd0Q2cUNOVXaKWMCO_wYbVCA_uLIp5bw>
    <xmx:ParyaqKrF7qGEPi6sirlhozKynqY1acy2TxfH_y_3Ab6Y0lWQcTlvg>
    <xmx:ParyaugfgHY0kyPTyO71B_ty4eg-VuXUV4Gq4UOnc8jJ_ziJ0dgHlA>
    <xmx:ParyaiEoObQDdfoLeeGHeYlQRh_PSOqrQ0d1OcpHjZOJE0Vten1fXy2y>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 00:23:05 -0500 (EST)
Message-ID: <54130686e08db48928484e226f48dc31a8c5ee29.camel@alistair23.me>
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
From: Alistair <alistair@alistair23.me>
To: Andreas Kemnade <andreas@kemnade.info>, Pablo Mazzini
 <pmazzini@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 15:23:03 +1000
In-Reply-To: <20261026083058.04173f10@kemnade.info>
References: <20261026003918.155321-1-pmazzini@gmail.com>
		<20261026003918.155321-2-pmazzini@gmail.com>
	 <20261026083058.04173f10@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (by Flathub.org) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-10-26 at 08:30 +0100, Andreas Kemnade wrote:
> On Mon, 26 Oct 2026 00:39:12 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>=20
> > The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2,
> > Kobo
> > Libra H2O and Tolino Vision 5 have had the rails on so far. Mark
> > VCOM
> > always-on before the driver stops doing it.
> >=20
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> > =C2=A0arch/arm/boot/dts/nxp/imx/e70k02.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A0arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
> > =C2=A02 files changed, 2 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > index dc7ff108aa85..bd9c6c6fa117 100644
> > --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > @@ -154,6 +154,7 @@ sy7636: pmic@62 {
> > =C2=A0=09=09regulators {
> > =C2=A0=09=09=09reg_epdpmic: vcom {
> > =C2=A0=09=09=09=09regulator-name =3D "vcom";
> > +=09=09=09=09regulator-always-on;
> > =C2=A0=09=09=09};
> > =C2=A0=09=09};
> > =C2=A0=09};
> No, please not. That regulator is in practice used with a not yet
> upstreamed
> driver for the EPDC on that platform used to deal with the current
> kernels
> fp9931 / tps65185 drivers. So it is very welcome to have it not
> always turned
> on.
>=20
>=20
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > index ff9d50942884..6cf5603c0752 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
> > =C2=A0=09=09regulators {
> > =C2=A0=09=09=09reg_epdpmic: vcom {
> > =C2=A0=09=09=09=09regulator-name =3D "vcom";
> > +=09=09=09=09regulator-always-on;
> > =C2=A0=09=09=09=09regulator-boot-on;
> > =C2=A0=09=09=09};
> > =C2=A0=09=09};
>=20
>=20
> Here the situation is a bit different. If I remember correctly, there
> is some special EPD logic in userspace on top of some ordinary kernel
> display driver. But thesse things are missing is devicetree?! But

Yeah, the kernel just exposes a framebuffer and a special secret sauce
userspace program writes to that.

> that might need to learn to deal with regulator enabling/disabling.
>=20
> Regulator always on is probably not desired here, either.

Yeah, I **think** we don't need that

Alistair

>=20
> Regards,
> Andreas
