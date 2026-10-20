Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503472;
	b=L9dq3lzOBt7DyU1fzpeoKD1Qo8iF3obgkvSvbGTIZ3YRD0KOm5yluBZARdAZFjdDfRJK
	 jnKGCkSSZrYPdLXKNzI1fnbAdrjZRLlfQXXfEMx2nQCS9815eAm7ObB3YtdX+n4hxylag
	 5j5vXB6LpKr4j5/VSMzVwlkXftGi3bywEqaH3sigSQWoyhEhBmtS+FBKsP6iwtQef+z3o
	 jtUAj7kC8FSKXUq+1EPbNuJWBo4ZvrwU8Zuusds6X7eBCf0kcsiI+jK94Yipl2cw67Qp6
	 QDh76C8f6mZXcPecgmKMZ2Rb6ioB+Ywbb3hKxldsDl6qTn6jVqwNrlFeR6SzOmLT4/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503472;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=m8yfQEcljjdCYG73U7/b7AoriibsdHfzmxVKPS8fPUs=;
	b=4OLlFEr1MmX2+DrlvkheW3tvLH17DGq/dlMH7CLlxhOFU2x2m1XiKfs35Z8IrsON9Nby
	 Y9RzvB7TmbFHgwvPnr1AhaglmwyeHXDDlyGj38AFTl+K5RkGbfYiYoRmd9PfEGr8ncGMI
	 id9wAf9wLAuTmDlN7a6QXB5qi7w5UxJQaxputFYAXyX3XY1AgKoUwMHzkrHG8fiL4Bi5Y
	 Q0ZlkZVwyleWn/h8s+ZgxV1Yz7kyRadaMEauYpk39Q9EYe1QU4w65iP4BRLFZIhRkPAZx
	 wc/RyWIuaOog6DgS86KO5vzTO76bJnDTeZDcB/7+jEdXGLQPiedjJYCssAf7zMSFDVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=R8rsXKOl;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734F2606A33C;
	Tue, 20 Oct 2026 13:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734F2606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=R8rsXKOl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=m8yfQEcljjdCYG73U7/b7AoriibsdHfzmxVKPS8fPUs=; b=R8rsXKOlypisObnCg9uR6fNJlX
	3Ubrwa1LV61x/Q2ZHgC5nkXY6zgx+U0J3139rGr7qgrXVCaOFicihD2ArvNXmk3po7ySxW+/iKiA+
	ZSVKW6spvm8mn7dKG86W6sztHwm1Zaue5dFIOkgFPxaJDeZsyVWimViZN6t2uR58W/fgW2zSyADH/
	8N77TIADYxy7+zZMLREv7YAkIfD5l6c7xqSXjnqB0poA9y0O92RuJavkgLP9bEJe05gVeX13vUjgk
	nRHqV/V6MLrFK3mGyzBM96C2HURgOjSjJup1Yf6oMTK4ddLWw3jTrM9y2A+/+ivOZdy+vdYmznz+I
	a1VDQpHA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
 =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>,
 Michael Riesch <michael.riesch@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add a cell
 to select TX or RX
Date: Tue, 20 Oct 2026 15:37:35 +0200
Message-ID: <2501273.NG923GbCHz@diego>
In-Reply-To: <73ef0d06-75c5-4c10-b4c3-c7b3c07a1e18@collabora.com>
References:
 <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261019150631.GA265407-robh@kernel.org>
 <73ef0d06-75c5-4c10-b4c3-c7b3c07a1e18@collabora.com>
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

Am Dienstag, 20. Oktober 2026, 00:20:47 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Michael Riesch:
> Hi all,
>=20
> On 10/19/26 17:06, Rob Herring wrote:
> > On Mon, Oct 19, 2026 at 04:15:03PM +0800, =E6=A5=8A=E6=99=BA=E6=88=90 w=
rote:
> >> Hi Krzysztof, Rob,
> >>
> >>> Existing OS should ignore surplus cell if the driver is coded properl=
y.
> >>> Same as adding new properties or new front-compatible.  The question =
is
> >>> how the existing driver behaves?
> >>
> >> As you pointed out on 5/8, the xlate checks args_count !=3D 1. The DC-=
PHY
> >> driver was merged in v6.15, so every kernel since 6.15 fails on a seco=
nd cell.
> >>
> >> 1. Keep the second cell. Add the patch as follows:
> >>
> >> - if (args->args_count !=3D 1) {
> >> + if (args->args_count < 1) {
> >>     dev_err(dev, "invalid number of arguments\n");
> >>     return ERR_PTR(-EINVAL);
> >>   }
> >>
> >> + if (args->args_count > 1 && args->args[1]) {
> >> +   dev_err(dev, "only the transmitter is supported\n");
> >> +   return ERR_PTR(-EINVAL);
> >> + }
> >>
> >>   With Fixes: and Cc: stable, the stable kernels maintained at that
> >>   time (currently 6.18.y and 7.2.y) keep DSI working with the new
> >>   dts, and the receiver fails cleanly instead of getting the transmitt=
er.
> >>   But EOL kernels (6.15, 6.16, 6.17, 6.19, 7.0, 7.1) stay affected.
> >>   It goes in with the series, since two-cell dts only exist after it.
> >>
> >> 2. Use a flag in the upper bits of the existing cell, as Rob
> >>     suggested. Existing kernels are not affected, unless a board enabl=
es
> >>     the DC-PHY CSI-2 receiver on 7.0 or later without this series.
> >>
> >> I will write the impact clearly whichever  approach is selected in
> >> the related commit messages and the cover letter.
> >>
> >> I think the cell approach is easier to read and more symmetric in the
> >> long term,
> >> but it breaks more. Which one do you think is better? Thanks.
> >=20
> > I'm not a user of this platform, so I don't care. Up to the platform=20
> > maintainers to decide if breakage is acceptible. You just need to=20
> > document the issue in the commit message.
> >=20
> > Rob
>=20
> It's a bit of a pickle, all this.
>=20
> I gave it some more thought. In the end this is an IP block with two
> PHYs. No more, no less. One cell is sufficient to address those, and it
> could be 0 for the transmitting PHY (DSI, display) and 1 for the
> receiving PHY (CSI, camera).
>=20
> Of course the two PHYs can operate in either DPHY or CPHY mode. The
> phy-cells have been (mis?)used to select the proper mode of combo PHYs,
> and this principle has been applied here too.
>=20
> However, we have the special situation here that the mode can only be
> changed for the complete IP block (and thus for both PHYs at the same
> time). As Bryan points out, we need to check and complain if the PHY
> mode is not set to the same value for both PHYs.
>=20
> I suggest using a property
>     samsung,cphy-mode;

I guess, a maybe nicer way would be mimicing
	Documentation/devicetree/bindings/phy/intel,combo-phy.yaml

with its
	intel,phy-mode =3D <x>

with x coming from include/dt-bindings/phy/phy.h
for the distinction between cphy and dphy, so we don't introduce yet
another way to describe this.

As you said, the electrical wiring is completely different between the dphy
and cphy parts, so is a property of the board.


> (name to be bikeshedded) that sets the complete IP block into CPHY mode
> (DPHY being the default) to distinguish between the modes. Since both
> modes use a different electrical interface, this is clearly a hardware
> thing and thus suitable for device tree.
>=20
> Then, we can address the two PHYs with the help of the already existing
> phy cell (without any bitflag tweaks to the value).
>=20
> The sole drawback is that we need to accept the PHY_TYPE_DPHY and
> PHY_TYPE_CPHY values that some OS in the field might pass. (For Linux,
> it should only be the former.) And we need to handle those values
> correctly. But I think this is not more painful than the other
> approaches. At the same time, this design seems to be the most correct

The current cell values are 10 + 11, so as long as we don't re-use those
exact values for the other constants the driver should somewhat easily
be able to recognize an old DT?


Heiko


