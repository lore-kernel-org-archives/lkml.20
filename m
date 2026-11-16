Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853985;
	b=DEmKzuhjSdWnvvH4joE4XBvLH7g9FU124gAMJcoPGk/61EDp6O62LoUaggdOYGHUvtO3
	 8xnrx4W9jRbmY9bjUFySxdW5lTGXoE4tgNLGmbZgps8Z3nQ6mUCd+uwEfoayr5zGoUEL4
	 nU1lYgiSxvvS2aTJzhbEny2OZZjkTuU6UyXcj0rRrVrMMs0RFi9viqhaRnlQ6fFufCCxt
	 vMBj676xWlLN8w3IfiOei9IoA9B4mUeTQ0vWAFFFDPIf5jH0PrfHtkwW8F84n6ZzYZqDK
	 iFR5BNoN3tUV4XG/yFhFjftlAGS2FYwzBcLBAJ077BQsM/bFAUd3VVrAU7IuZpW64dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853985;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=pLbSnLN6/1576pxJwaqXyR5opWYY3qz9oGloy9SS1q0=;
	b=N4uA1IUIUm0cOYxoNq0UIbA8CnNYNk3wCfADjfLyCALJTBAxTmU4NnoWhSAnHCU//8S4
	 Mf+HlAlTgWE916Ds6WS0vH38LXz9u6X/Eg2iVSTEKqksmyQmlh46NB25LCOTiX8YuuTXW
	 gONCCI85O1JZ+uj4HQ62nPTMAGueDiGszEL+ecRgVwBjpl+M9IZEtQUGhrOmSMtA0jd2P
	 WMI7COR9LAFtqCr3AV0D9tA3ZhqmaGftFC5NsRXnlC/bJU+4pu2ZyvV/L6S/Fbr+gdvxd
	 OtmsJsynCg3JShm7nwJLq2BEstNhHtIYvTTlf+OOVb2jisoff5Sm5QZDjd/xCm0asdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=W5OzgRlU;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A982606A31C;
	Mon, 16 Nov 2026 18:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A982606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=W5OzgRlU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pLbSnLN6/1576pxJwaqXyR5opWYY3qz9oGloy9SS1q0=; b=W5OzgRlUb1W/Hy9/J3QxAUN0Ix
	FTvWd6w8rA4xJKPDV7q7tiHeFGhHmexLSo+OyjFj+fh7gaCCXiuokLsz2R9isWIjyZZ4y67Pr04Og
	6B9jZi5gQ2KtsPdY9Vs4WFs1bKrkf7/kASFGwwxDSYlmewoFW3DE+IqoHoPRvee6SZtpfIlgwuo2B
	Ie39YEw5gIBSjAvy7MJChKRJGId29KvnUavjpV3rl+rjHB6J8rSjb7SuZfj6FywiUYPzGHDIiucyI
	ixzkPp1rhsFMu1IVDCUxpW1fxBcZPe1X4u172PyuYoc5CqoOguLD9naFLThZ3cBaW+vA9IzgqlLvU
	+mYDz+Jg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Arun Iyengar <aiyengar1990@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Alex Bee <knaerzche@gmail.com>
Subject:
 Re: [PATCH v2 3/3] arm64: dts: rockchip: Add IEP2 deinterlacer to RK3588
Date: Mon, 16 Nov 2026 19:32:49 +0100
Message-ID: <yRxnTArhQFiS4u_tncJj-g@sntech.de>
In-Reply-To: <20261116-luminous-heavenly-guan-b20f2e@quoll>
References:
 <20261115-iep2-v2-0-3d8798cd9a55@gmail.com>
 <20261115-iep2-v2-3-3d8798cd9a55@gmail.com>
 <20261116-luminous-heavenly-guan-b20f2e@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Montag, 16. November 2026, 13:35:28 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Krzysztof Kozlowski:
> On Sun, Nov 15, 2026 at 08:47:44AM +0000, Arun Iyengar wrote:
> > Add the IEP2 deinterlacer and its IOMMU to the RK3588 base dtsi. Both
> > share GIC SPI 117 and sit in the VDPU power domain.
> >=20
> > Addresses, clocks, resets and the interrupt are taken from the Rockchip
> > BSP rk3588s.dtsi (develop-6.1).
> >=20
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 22 +++++++++++++++++++=
+++
> >  1 file changed, 22 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64=
/boot/dts/rockchip/rk3588-base.dtsi
> > index aa69fd3793fd..5297519bd251 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > @@ -1397,6 +1397,28 @@ vepu121_3_mmu: iommu@fdbac800 {
> >  		#iommu-cells =3D <0>;
> >  	};
> > =20
> > +	iep: deinterlace@fdbb0000 {
>=20
> Why all these are outside soc node? That's more of a question to
> existing code...

Many years back, during the RK3288 addition I got the comment from the
arm-soc maintainer to drop the soc node [0]:

"[...] this isn't how we tend to do it any more (unless all devices
are physically on a bus, but then it should probably be named something else
than 'soc')."

So since then we didn't have soc nodes. Except in time for the RK3576, the
tune has changed, so socs from then on have a soc node again ;-) .


Heiko


[0] https://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/272779=
=2Ehtml


