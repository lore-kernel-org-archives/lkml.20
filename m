Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAD54D797C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693088; cv=pass; b=HnEJkV7Bj5v3kVf4NglsDP9FSSYFLrbUAoHU18ocEc17xCp5ka3cBrPNUMTnp/86JH0r8X98Ad3bG+4wltPv9FUoUc8RYrFmtSoc6HQodMHhX7THMOGoPM0Puk84zdIHYWLAH8IwfSwnVsa6DY1OHKD6rBXbPKwO3Bhp8EfaatA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693088; c=relaxed/simple;
	bh=AMr7U9hTb6sLfQ675Aem6bpQ8zjawID9veo2Av71L8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFctTcKYiunWZO62gh4Klqtoif5yrk2MbQ+2mHorr1AWrmx3FsGwtzMPe2OfOYeX2reb3WHiMJn9Taby3L9upvx9BVod+QkGcZJvDROEGsEsqQr4xMc5WywyuvqLcz7BUv892qcVVJ5cre0P2+oHqTK3wzYQRGrupSHkLpL575Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=b4weWwb+; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="b4weWwb+"
ARC-Seal: i=1; a=rsa-sha256; t=1790693060; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f4GeXpY1M2bwtODjax+4rYiqEzHIdRQurPqhyj6N4cYvd5bCzJmWuq28K3/9fQW8j5WA8i5JQbSvT3bbr8T08vj0QdCWs+gg4Fox57W1EFVdXlncp2as/sIdWsOVD48QFk61w2SaxI52ps0yJiPXrTDyrIpmgXWdPby5gyI4C30=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790693060; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I4ENDV94a3fiIT12CeebVXBQSZWge4T+VpgKHXCne54=; 
	b=T8au3eYwVkYRSgQvbZRF4vF3W/1Jk5SCjscJLoO0I397BWODpCQttq6x40cCCZcVU5UsQLRGsHywfTTyeoz2NG4ysCOm3fOvbF3TQykkjcwzPOdWGU5xh7RpCsx7tZ3gvOCXdb1KXC4G2aGjCe+xd6yhlcgcbYbv78OgoZgR10w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790693060;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=I4ENDV94a3fiIT12CeebVXBQSZWge4T+VpgKHXCne54=;
	b=b4weWwb+x4fDkwXTT/9RcFrN3ABI1gy5HjK5Hr1usQeqALSAoMXyz1kXwhPsVXCi
	TX9TEywTJGhtlyx87qHhcQ6BJjVBSL1v55EQdRk3cG0rEFvlcxO5CdAwg/4OmYsap+0
	Tgl+aGxAHXnTGaQt3B19zpXzpTP+6vsA6DvQbKM0=
Received: by smtp.zohomail.com with SMTPS id 1790693059734721.4714077251464;
	Tue, 29 Sep 2026 07:44:19 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id B9376182AB2; Tue, 29 Sep 2026 16:44:15 +0200 (CEST)
Date: Tue, 29 Sep 2026 16:44:15 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com
Subject: Re: [PATCH] phy: rockchip: inno-usb2: ensure PHY is running when
 clock is requested
Message-ID: <aru3ZSWtaHTdufXM@venus>
References: <20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com>
 <xnvakstneih6njyxfe27kdx54vy3zpnth24o4mjlzuoykb2pfh@np7dx62waujo>
 <arqnn8s5yFmZzQvG@venus>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cc3vyrofs6pfoimn"
Content-Disposition: inline
In-Reply-To: <arqnn8s5yFmZzQvG@venus>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.7.7.1.5.4/290.556.6
X-ZohoMailClient: External


--cc3vyrofs6pfoimn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] phy: rockchip: inno-usb2: ensure PHY is running when
 clock is requested
MIME-Version: 1.0

Hello Mani,

On Mon, Sep 28, 2026 at 08:00:24PM +0200, Sebastian Reichel wrote:
> On Sat, Sep 26, 2026 at 04:50:07AM +0200, Manivannan Sadhasivam wrote:
> > On Tue, Sep 08, 2026 at 06:07:42PM +0200, Sebastian Reichel wrote:
> > > On RK3588 the OHCI controller registers can only be accessed when the
> > > PHY's 480MHz clock is running. After system suspend the controller is
> > > resumed before the PHY.
> >=20
> > This statement is slightly confusing. There is no PM ops in this
> > PHY driver.
>=20
> I will take a closer look how it is powered off during suspend.
> Generally I expect it to loose state in any case as the related
> power domain should be disabled.

The PHY is disabled/enabled via generic hcd_bus_suspend and
hcd_bus_resume, which is called by usb_dev_suspend/usb_dev_resume
(i.e. the child USB bus PM handles the PHY power), which is a child
of the OHCI platform device.

The OHCI platform device itself just handles resets and clocks.

It works in the normal driver probe case, since there are no
controller registers accessed before the USB bus itself is started.

> > > The controller requests the clock, which opens
> > > the gate in the PHY's clock prepare function. But with the PHY suspen=
ded
> > > this just results in a dead clock being routed. The OHCI driver will
> > > then continue to access its registers resulting in a board hang.
> > >=20
> > > Fix this by resuming the suspended PHY in the clock's prepare functio=
n,
> > > so that the clock is really prepared once the function returns.
> > >=20
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > ---
> > > This was noticed on RK3588 EVB1 when resuming from system suspend. Th=
is
> > > is technically a fix, but its unclear when the bug was introduced and
> > > system suspend is broken on RK3588 for quite a while and not just due
> > > to this problem. So I think this fix can be merged the normal way via
> > > linux-next.
> > > ---
> > >  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 37 +++++++++++++++++=
++++++++++
> > >  1 file changed, 37 insertions(+)
> > >=20
> > > diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/=
phy/rockchip/phy-rockchip-inno-usb2.c
> > > index 7d8a533f24ae..07d400967def 100644
> > > --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > > +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> > > @@ -332,6 +332,39 @@ rockchip_usb2phy_clk480m_clkout_ctl(struct clk_h=
w *hw, struct regmap **base,
> > >  	}
> > >  }
> > > =20
> > > +static int rockchip_usb2phy_clk480m_leave_suspend(struct clk_hw *hw)
> > > +{
> > > +	struct rockchip_usb2phy *rphy =3D container_of(hw, struct rockchip_=
usb2phy, clk480m_hw);
> > > +	bool relock =3D false;
> > > +	int ret, i;
> > > +
> > > +	/* Limit to single port; it's unclear how multi-port should be hand=
led */
> > > +	if (rphy->phy_cfg->num_ports > 1)
> > > +		return 0;
> > > +
> > > +	for (i =3D 0; i < rphy->phy_cfg->num_ports; i++) {
> > > +		struct rockchip_usb2phy_port *rport =3D &rphy->ports[i];
> > > +		const struct rockchip_usb2phy_port_cfg *port_cfg =3D rport->port_c=
fg;
> > > +
> > > +		if (!rport->phy || !port_cfg || !port_cfg->phy_sus.enable)
> > > +			continue;
> > > +		if (property_enabled(rphy->grf, &port_cfg->phy_sus)) {
> > > +			property_enable(rphy->grf, &port_cfg->phy_sus,
> > > +					false);
> > > +			relock =3D true;
> > > +		}
> > > +	}
> > > +
> > > +	if (relock) {
> > > +		ret =3D rockchip_usb2phy_reset(rphy);
> > > +		if (ret)
> > > +			return ret;
> > > +		usleep_range(1500, 2000);
> > > +	}
> > > +
> >=20
> > This looks like a duplication of rockchip_usb2phy_power_on(). So I'm as=
suming
> > that phy_power_on() is not called by the OHCI driver before accessing t=
he
> > registers. So why don't you fix that instead?
>=20
> I can look into it. My way of thinking was, that the clock should be
> running independently of that when the clock has been requested via
> common clock framework.

The exact call trace is:

ohci_platform_resume
    -> ohci_platform_resume_common
        -> deassert resets
        -> ohci_platform_power_on -> enable clocks required by controller
        -> ohci_resume
            -> ohci_readl(ohci, &ohci->regs->control); // boom
            -> ...
        -> ...
    -> root hub being resumed will resume the PHY

The ohci_readl results in the mentioned crash, since the clock is
not enabled. The read is used to figure out if the controller is
already running. There is no bus operation, so the PHY is
technically not needed. Of course the controller's clocks have to
be enabled, though. It's just on RK3588 that this means the PHY
must be enabled.

I also checked Rockchip's vendor kernel for their solution: It
solved the problem by using device_link_add() from EHCI to OHCI
based on the RK3588 compatible, so that OHCI is always resumed after
EHCI. This fixes the problem, since both share the same PHY.

I think handling this in rockchip_usb2phy_clk480m_prepare() is the
cleanest option as the disabled clock is the real issue as far as
I can tell. I will look into improving the patch to re-use
rockchip_usb2phy_power_on and improve the commit message.

Greetings,

-- Sebastian

--cc3vyrofs6pfoimn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmq7zrgACgkQ2O7X88g7
+prAxQ//UtVryFe3OI5zppL3hdhln6C9+oXtOoavPPdK1xl5CXhNLG5XxFgRPcpr
yT6S/gP9ilfRQ6B+8PsWyF6FcJLDwLjLC/pqjqWNCLCXv4uD+96S7yfDqqqTFpOQ
cCY74QP0S4eZxeMC6oGxMF309Bv66loWkovrQL1psnznigaNESWCvTRobNPTZQ0N
ZQ7rKO5Pj6Ze7OwmBMh7W+WO4RBx8rPzkJxeYnX4tWvl2pmkKN4gnG+R1DE+lHiL
rLRciOz3VAwGQOermfbrS/0/1VEQhfLUgUYhUdnOiNAxJ84WQZZ/1WDc8Ls4x0Jw
kMcbVBRVxxjqj5pmekFThoJpH7njjOFcYGiGMV8D+lr4hGlmDzb+5E2qm5SqYFyK
Y9PFVX/wGmgqaUiD/MvzU8kFlHuyzMYC2sf2Uodzz7KmCTaTcT1zKRcyQvx6ByVs
HCGZ87wxIp0wmOJmRYKA+KBRnNDuTwXzu0pAN8ro4Zn7idMCr6i4wowQWNJ8dIlr
r9LuVxpk/dpEPmgJvgJK+zzmCM7mavsRmXOn4Ck0LC3WWUHYiik/jaOgjWNswZln
M+ST0PUqfAdX2WgGhauS/B9fcRXupZbNIKdEeJfXmgRJLnNzij6yZZ1jB7pJ2fph
zMRjPLaRbgrxWViyjInmHmIm5zkBYwro/htN9IuKKHV1X9HDAns=
=nOuG
-----END PGP SIGNATURE-----

--cc3vyrofs6pfoimn--
