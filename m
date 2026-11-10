Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354388;
	b=bhMPi9XxfpILFrSUVlk7z5PSPjjr3aDhpNh19EzpKMFvVGl55/f/Ngvromh/RPCgvLPO
	 S/h5hrIC0kdAp+iMChVh1DHLdA6uC7J3JQbyTDMhNemotq+KnxLuGerD/BNV70t9EtaeQ
	 a8FCuPR9925wbQh7esr8GeDBEJJA4OwXEZQA6jDaMT7+4xVvae/D4Ba+oV9vLvL3+V0id
	 H/J6a6jPiV7IaF05WcZCYLZZFMqzT+zuXG86RiaKVUwAsFCUX5odGdX5E3fZrAquc1lf4
	 fjXTXJuy3rKFhDfd4YidJxWn4tWIb3fJbambxGv8oL9ROzt927y+KvrlALToMRC/fnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354388;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=ZY2me7IpVMu0VOVk6MnkcMVwheYkAPTnm5Mdg+hRDNQ=;
	b=KaGmlxteXJQsMcDDQu5jhyWlZsLoxfKpAPwogHB+uSlB20V+p+ZztFf207mZkRgt+/2r
	 0zas0eLgKnT7+svFwV/FyDmay8KHspP4ZDqWeI6luq6xR8gjjMBbBpuyRYl9ztWUHqIJ/
	 eZDElit1Supl1FPX3UQMA82yU44jBgkdrm/3w7BK0CeCHO+SBsDAVA0yP+7Jeq2ThSXUw
	 TAOsqIS3MQKZgHokD6b31LBDpvRLhsHyzOPyqnO5/w4PPs8o26/jzpY+V3wRBfmCrJiPf
	 7I69pZGCVbNtAb2vWWqAS6rOWJiHhsIw19OnmNla8bvGMWn4A8okAaJlJba/Nb/8eUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alistair23.me;
	spf=pass smtp.mailfrom=alistair23.me;
	dkim=pass header.d=alistair23.me header.i=@alistair23.me header.a=rsa-sha256 header.s=fm3 header.b=jk640Ehh;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lmtr+bbr;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B88606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B88606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alistair23.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alistair23.me header.i=@alistair23.me header.a=rsa-sha256 header.s=fm3 header.b=jk640Ehh;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lmtr+bbr
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 071A0EC0609
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:46:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 10 Nov 2026 18:46:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1794354386; x=1794440786; bh=ZY2me7IpVMu0VOVk6MnkcMVwheYkAPTn
	m5Mdg+hRDNQ=; b=jk640EhhOn6BUw/7ufZbyLIKl6+VvvxX52wTBFwV2tHnxDPJ
	bNjdVbvtOEkejoZAfb7xi9PWHFexZeWIJOJ/QnTNDNPEuEMRX7yGMADwJogI1mdk
	xPUFBu79/DGXK5HbdL3oCSttToR7SXAYPNiE0i/YVVQZV0L8qK8UXy8U9cX+pmhZ
	+BFMnEaXY6/sxzsDVHl2+PruEwM+XRofoehZUCi4NVYDf9vAYtV6bxWlvNekKXPM
	HnoHSvOkxCwjvjESST/WHw6sDETdpjqpJ9Bt2225H5QhG5yWfX1PbSjpIcN8dlNG
	JrjBxvzgd9s7ubsxalnAXAqLQw/Apr+rHmy7xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794354386; x=
	1794440786; bh=ZY2me7IpVMu0VOVk6MnkcMVwheYkAPTnm5Mdg+hRDNQ=; b=l
	mtr+bbrpddw2sjZ2iDC0zd5tCSck1Bj/s+Lqf4Fojga18upa4H1K51jfqWcofpZJ
	4ZDXsZFnE8Aq3GtOkOlPXQ2dzlkGZK/WnqugBQtyL8VZfaj4/ZOEegRIhPUoMGKD
	EdLsAi/y3CQh8yu+DwsjX78uhxkSlYnZoxbWwgRi6pNIyAWOXL6lLCgo8WmUfwtA
	UcOHEwZ/e9Bix4g2axl1S4NSLxN93ZWb59/CXKC1IBnA9iKTvfap0zlaxe8u8CWe
	Ws+WBC/9nVg1CGEdCusyb9JNWrjZDaLZekT8i8/T8vDGV/ZwyjbwSxwt0iNggyzH
	sqMHrChKxIWZHgSJobJrw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=alistair23.me a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794354386; d=alistair23.me;
	mf=PGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:HRuy/kWsv8GofgwPHyA5nOJPzTtIsvRSQr4f4BYSPx1/+PW
	x7RL95zKLLrv2Vgd7sH/Z35R9hWBdqCDPc8BZoiw1gztpIKyKoqmVnOz1ionI2xU
	R96VincJ1XVtmGMqzlZjexFITKLPshOb9PA/IilkrsbFU2JLapKLUqkq+fAjuDaL
	CYUO27vsLk+rzOMRmBHYzX18RZaRKx2yJ5xNGr0TlQJruN786/fpM+M84ssdPAWW
	+jSwRmk2H16iTtRRzmt8+cBJJqaEclsxMhwEBGjT+MifyUAOhlxGHzZmllGtPOyq
	GH8rrzxFh+isVkxMtwWGGPQKxaGtF+5LosE+/dg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:yPP5o9W0fBO30YwgA0F0JjRPXXCnTS3aB7uDWJvLydc=:ZY2me7IpVMu0VOVk6MnkcMVwheYkAPTnm5Mdg+hRDNQ=;
X-ME-Sender: <xms:0qzzany6GxsHyC930g5fQYTXx6oCA4a5h0Dum7peRLAuV6Fedkz7Nw>
    <xme:0qzzai_Cb4QMph3LXJZZbkaGXLpvbPqAXTuWvp2itaVFmU2n9sj2K5g0LlLbOCll1
    2sjY5qCDxtsJb8xuUYWiIzXviKn1U42HOON4Bd-RTitlJCbQs0RaCgn>
X-ME-Received: <xmr:0qzzap8111gQl_AuhacNRNykSqYf0T_pFG3yfCvixwaip9WDTvfzYuBbRhZpEN7H5Pj_Hrzw23ubLg0_WB-9>
X-ME-Proxy-Cause: dmFkZTFACASdWw7/TKSrRhU+vyKUHE0wTEU3blEN/5RhWbn//aiGCLx0Kh/k1ulJ16CuUP
    BP7EUxRg6kSnNbfU5v5KvMCMgqcluKMm4CjhYo9/fEjoK2BFQF5MxCs9vc+iN1MO22b7q+
    bB3PfYt2kw4PrOXofzg/daiwrlA/mp7bW55wVQOkLCDq8CGP5opoSKyWvf7frRKr9thQ99
    BT8/0CdteNiFz9UXzRZykaMdmPRKFUbz7XTgfNgfLwd0dVyIa/tuuZLLWg56SG2F6bybjC
    Q8khudhNY/zpwo2IqJGXsMxvfUC5+UlbtCloBxmC+NPg1nyQFJyLU2LeEt3vjriLcejZex
    50zvu8TF+2g94bAFCE3c10QTaic7zl6nr3XFCdw0jAvN7RbFTSxBB2kXL+VHCPGhWnWPWR
    G9ciABlafCkL73l+02Q4m0vyGrgSTPxcbOvA0Sq5pO1MimoYWtyMFtLIT1ZUr/S6eb0WYc
    RTy5ME/aD1zERn3xbdgWou2uP4nhboM4LKsE1oj7lFRzD2kNeDoLtO3xYY6xNMmEWdkJXz
    99uZ08R4SI+a211Yl6GnKTpUZUYxroERVEOMbU+HbqRG/6rJ7EskLCTW3iIOTgCnwOTXHr
    gNZ88nTCxaTztaBW1H0MLyJiUOGBfXa+qPu8IDAcUqsKowzj0h7FDJtUdHBA
X-ME-Proxy: <xmx:0qzzai724q694-C_AKowocvyDvzAQoI-0vHncrE9fwDD1e77zBP8mw>
    <xmx:0qzzaqatolX-p9SIU67hYHuFYMzUIPhuLmmZrHmh1rrGVoCG9nUi7Q>
    <xmx:0qzzas9SbUW5S4r5SBtNN9oTznFgsfhqVkceRtBswxkKtX5MAiROyw>
    <xmx:0qzzapTPQYNJ4GMWY60c4V0j8-7JV3oQzeT98_Nc7cIMhSExItQeaA>
    <xmx:0qzzagP1YnW1WJkDqYo1qEy6OwTVnrvBnq1S-ji6xofCr4hT0RkgSLkB>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 18:46:21 -0500 (EST)
Message-ID: <055961e4d9ce7e0c78c12389f432e1d8732d83ec.camel@alistair23.me>
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
From: Alistair <alistair@alistair23.me>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, 	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 11 Nov 2026 09:46:18 +1000
In-Reply-To: <20261110103405.5e0384bb@kemnade.info>
References: <20261026003918.155321-1-pmazzini@gmail.com>
		<20261026003918.155321-2-pmazzini@gmail.com>
		<20261026083058.04173f10@kemnade.info>
		<54130686e08db48928484e226f48dc31a8c5ee29.camel@alistair23.me>
	 <20261110103405.5e0384bb@kemnade.info>
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

On Tue, 2026-11-10 at 10:34 +0100, Andreas Kemnade wrote:
> On Tue, 10 Nov 2026 15:23:03 +1000
> Alistair <alistair@alistair23.me> wrote:
>=20
> > On Mon, 2026-10-26 at 08:30 +0100, Andreas Kemnade wrote:
> > > On Mon, 26 Oct 2026 00:39:12 +0000
> > > Pablo Mazzini <pmazzini@gmail.com> wrote:
> > > =C2=A0=20
> > > > The SY7636A hwmon driver turns VCOM on at probe. The reMarkable
> > > > 2,
> > > > Kobo
> > > > Libra H2O and Tolino Vision 5 have had the rails on so far.
> > > > Mark
> > > > VCOM
> > > > always-on before the driver stops doing it.
> > > >=20
> > > > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > > > ---
> > > > =C2=A0arch/arm/boot/dts/nxp/imx/e70k02.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > > > =C2=A0arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
> > > > =C2=A02 files changed, 2 insertions(+)
> > > >=20
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > > b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > > index dc7ff108aa85..bd9c6c6fa117 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> > > > @@ -154,6 +154,7 @@ sy7636: pmic@62 {
> > > > =C2=A0=09=09regulators {
> > > > =C2=A0=09=09=09reg_epdpmic: vcom {
> > > > =C2=A0=09=09=09=09regulator-name =3D "vcom";
> > > > +=09=09=09=09regulator-always-on;
> > > > =C2=A0=09=09=09};
> > > > =C2=A0=09=09};
> > > > =C2=A0=09};=C2=A0=20
> > > No, please not. That regulator is in practice used with a not yet
> > > upstreamed
> > > driver for the EPDC on that platform used to deal with the
> > > current
> > > kernels
> > > fp9931 / tps65185 drivers. So it is very welcome to have it not
> > > always turned
> > > on.
> > >=20
> > > =C2=A0=20
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > > b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > > index ff9d50942884..6cf5603c0752 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> > > > @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
> > > > =C2=A0=09=09regulators {
> > > > =C2=A0=09=09=09reg_epdpmic: vcom {
> > > > =C2=A0=09=09=09=09regulator-name =3D "vcom";
> > > > +=09=09=09=09regulator-always-on;
> > > > =C2=A0=09=09=09=09regulator-boot-on;
> > > > =C2=A0=09=09=09};
> > > > =C2=A0=09=09};=C2=A0=20
> > >=20
> > >=20
> > > Here the situation is a bit different. If I remember correctly,
> > > there
> > > is some special EPD logic in userspace on top of some ordinary
> > > kernel
> > > display driver. But thesse things are missing is devicetree?!
> > > But=C2=A0=20
> >=20
> > Yeah, the kernel just exposes a framebuffer and a special secret
> > sauce
> > userspace program writes to that.
>=20
> Looking at that processor. It seems to have an EPDC like the i.MX6
> has.

It has been awhile since I looked at this, but from memory the display
isn't connected to the EPDC. It's connected like a normal (non-eInk)
display. Which is why it needs special userspace software

> Looking even further. The Kobo factory kernel for i.MX6SLL devices
> specifies
> fsl,imx7d-epdc as compatible for that.
> So if your display is just connected to that EPDC, then you could
> probably
> wire up things on top of my EPDC driver with DRM interface.

I remember that it isn't that simple

>=20
> So you still too need to run your own fork for the display?=20

Yep, it needs a custom kernel (with the FB display driver in the
kernel) and then a custom userspace.

At the time there didn't seem to be anyway around that. I haven't
looked in a few years, but short of reverse engineering their userspace
(which would be easier to do today) there isn't much to do.

Alistair

>=20
> >=20
> > > that might need to learn to deal with regulator
> > > enabling/disabling.
> > >=20
> > > Regulator always on is probably not desired here, either.=C2=A0=20
> >=20
> > Yeah, I **think** we don't need that
> >=20
> You just need to add logic to enable/disable the regulator (if it is
> not
> wired up yet). But it is nothing from the perspective of mainline to
> worry
> about.
>=20
> Regards,
> Andreas
