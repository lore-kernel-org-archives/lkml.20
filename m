Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE7A3502A5;
	Fri, 25 Sep 2026 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342797; cv=pass; b=e8MMwtlH1Eve7fGJRmbrP9T9a6Zofsb1UhNUr31oJO8dXpewF66lF8af5E7Zhsy5eBW38/5Om1oeWCWSy9X2bapmoJePv3ueh5k/p2Mb8OgcUITRYAy4+3SxIQ71dgHLSsOGlTuUTrGgd0XjUGTBi9UPlWfhMWBSzkMdkKpNgbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342797; c=relaxed/simple;
	bh=KatJ+RzNowR9TAsQ9JayoiWdlAvKTv7/Nf90gD4O9vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwqmNjMyHy+P1sLlle4uUFrcKbTDcKQIlmfglXho/XgUTViAFhD0oa4FJkdlC+V+FoyDGYZS0lsfVZp0CiqgAMVwUnzUOo7nyrCdwOFZQXNWtGhfh4YxzOGEBa9Eh1YwR7VLT7Ffe4DyeHbzyB9hQxb2EvJ4G1fAV8kR7BsHa3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=jUSgJNOb; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="jUSgJNOb"
ARC-Seal: i=1; a=rsa-sha256; t=1790342763; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V5FLorA8Lb3aR+vcL5FBo9HDzvNr64Cf6wlrnB53DORVFlYjiOs35o0mAH9WXbcVJtuCN5+bKVz1vO569f6YLvWjRy7AmXuVr+CBZ9fkfR38T9XJsur6Se7qCODeKZxCyDCzXXmvAMmwIg3m5s8Xg8pRfDp84AwXsDTw/EyFs+Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790342763; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tbI7BY1/DMfC1o6Nu52xiZ2zV1iIXaUIFyG9Dk4Azbw=; 
	b=gCWWqz1hZ6/B0eBdHBhvi63kX9mJEe9OrAuvd0w3nkMv4nM8H82ZJ6cWfkNpOomro6me3pa7KVLKdQFIeLo1e+7Q7xYGNCHmHXuIggMPF2xfGWapJdPp3N1L87OKAV8BcYiQf3WWKCc6o+6B3+wHHW5deabV/kZUqykWFxgdgqk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790342763;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=tbI7BY1/DMfC1o6Nu52xiZ2zV1iIXaUIFyG9Dk4Azbw=;
	b=jUSgJNOb5k/1s87wXZmGFXUJYpjBsFnNjpGjDRb7G8nxlk//Jj7ztMph0CXv85ue
	Q9dzAnDSlGxTMMPL5iam1h7Gun8hUcotu+7ZAjXsav0wmiS1/g7NyXogVxct6TdkvAU
	SdP79mNybPZxo3zmdQF9/MJ6Gp1JigCyINqy6IO0=
Received: by smtp.zohomail.com with SMTPS id 1790342761292221.70362510434052;
	Fri, 25 Sep 2026 06:26:01 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 4DE3E180809; Fri, 25 Sep 2026 15:25:57 +0200 (CEST)
Date: Fri, 25 Sep 2026 15:25:57 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Adam Wermuth <adam@wermuth.pl>
Cc: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
Message-ID: <arZ0nqBvHDzSbZOE@venus>
References: <20260924071445.441822-1-adam@wermuth.pl>
 <20260924071445.441822-2-adam@wermuth.pl>
 <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se>
 <CABkrwJ6uvjS8bez6j0MZbp2Y+O9RhyU09YOLrUzHaeUEVC=Qkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ezpnci3ypobxl7j4"
Content-Disposition: inline
In-Reply-To: <CABkrwJ6uvjS8bez6j0MZbp2Y+O9RhyU09YOLrUzHaeUEVC=Qkg@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.314.86
X-ZohoMailClient: External


--ezpnci3ypobxl7j4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
MIME-Version: 1.0

Hi,

On Thu, Sep 24, 2026 at 09:03:00PM +0200, Adam Wermuth wrote:
> On Thu, 24 Sep 2026 6:12 PM, Jonas Karlman wrote:
> > This and next patch is likely best suited as an dt-overlay.
>=20
> Thanks for the review. That makes sense, as the B-key slot is not
> always populated.
>=20
> For v2 I will move the host1 enablement and the WWAN power, RESET#
> and W_DISABLE1# handling into a new rk3568-rock-3b-wwan.dtso overlay,
> and keep only the fan patch in the base DT.

Why would this be better suited as an Overlay? Nothing describes the
specific card plugged in as it is auto-discovered via USB. The
overlays are mostly required for things that cannot easily be
auto-detected. FWIW we don't have M.2 Key M as a DT overlay either.

Something to consider is, that for Key E and Key M there is a proper
DT binding now: Documentation/devicetree/bindings/connector/pcie-m2-*.yaml

We probably want the same for Key B.

Greetings,

-- Sebastian


>=20
>=20
> czw., 24 wrz 2026 o 18:12 Jonas Karlman <jonas@kwiboo.se> napisa=C5=82(a):
> >
> > Hi Adam,
> >
> > On 9/24/2026 9:14 AM, Adam Wermuth wrote:
> > > The USB 2.0 data lines of the M.2 B-key slot are routed to USB2_HOST3,
> > > which is served by usb_host1_ehci/ohci through the host port of
> > > usb2phy1. Enable the controllers and the PHY port so that modules in
> > > the B-key slot, such as LTE modems, can enumerate.
> >
> > This and next patch is likely best suited as an dt-overlay.
> >
> > Regards,
> > Jonas
> >
> > >
> > > Signed-off-by: Adam Wermuth <adam@wermuth.pl>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/a=
rm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > > index 149a5306bb03..ad9a91c0d0d0 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > > @@ -758,6 +758,14 @@ &usb_host0_xhci {
> > >       status =3D "okay";
> > >  };
> > >
> > > +&usb_host1_ehci {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&usb_host1_ohci {
> > > +     status =3D "okay";
> > > +};
> > > +
> > >  &usb_host1_xhci {
> > >       status =3D "okay";
> > >  };
> > > @@ -780,6 +788,11 @@ &usb2phy1 {
> > >       status =3D "okay";
> > >  };
> > >
> > > +&usb2phy1_host {
> > > +     phy-supply =3D <&vcc5v0_usb_host>;
> > > +     status =3D "okay";
> > > +};
> > > +
> > >  &usb2phy1_otg {
> > >       phy-supply =3D <&vcc5v0_usb_host>;
> > >       status =3D "okay";
> >
>=20

--ezpnci3ypobxl7j4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmq2dloACgkQ2O7X88g7
+pr/mg/7B+OoEEnFA754wyjYfRo8dxmBN2hNuzkDTAK9Nt3BsF9Isgc9nHMJ+u05
nnyo/WzdkZA1PxvQHfCdAvM0GvqiGfjMJGrHSdlY9Oe49aVSDqz9nKiHWg2CWmDu
zbTryJ8NW+5V/xeDGBHdM6cyMijY163EbOGYjiADvp5s5BRuHAtjyBp7mR1ioIQv
WvJH80zO5zKZ+HEBrEQb7Ubtu1nutrdi1+dv0gd6+lLwLclsAz02GOzORBC3m4QG
wm5tKVHKvatK2qNvPvqwOzagDLzRboJRizUK9xpsl0cFo8vUUhTBzyqANTxDr1f/
ZnlntysqzIlUryj7lFxCUnR3faIMEZ/gNd19z87+JtMnyMpoMry5JSnaU+wcS9aO
rLdK79wUux7VW3xMH35NWR7Tzh5OYXyizncw5TJ0l6vwlH8qGgS2M3wuisDtrzax
lAkNhwXKCjokbemj2/JBGX632TZY/ZUHq+4mVQ27+6pjfx13efMiM6+FRfav2pfU
BqONw6uZkbTi3RURfYMumfftnjczwQtqAd5sYV3cdVg9ufHRgs3yRgfVHbboKYPV
dfJoj3w/UldTw4TB3VHzBdcQiQ7boCIVjIAJQkhTTil2nT2QqXk1ZATN+RDz3Q3n
nILT8M3CGNu+7No4ijr1nksfo9Hev19qsbkVU4nORonCCwTvgUA=
=rQLU
-----END PGP SIGNATURE-----

--ezpnci3ypobxl7j4--
