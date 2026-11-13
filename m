Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794612013;
	b=1/nvyoVvS1GxgnHLlZBReoLIrPvMWDAGrz+6M28AwT0hng5WA2qqhps3Fhbh0WtA+SDq
	 TmXCtHHxqIVujFVz4gFvwGQGgfQAddaBLKWRTcZZyFKsng/9e9GruaF93neKAIhRlIYq+
	 8UOiXfoNSLJYtb88lrIprFewAhhA9ONMKVrtEARnQipJPCruui1UYPLU6aDPkrMZyYP28
	 Y2jDYaDrmZ93ijrEclH3h1fs0bzoP272M1ywXUlLRHgykfz5NvY/pbl9LWDIx8VZe3HrM
	 aEvvjlZeracb8OUNbjaebSm+pw5ugJ5VJvLrOvScrf55btglDjxQn9Jpi0kOONpHYWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612013;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=396mrwK6+J7I5FsFadAXxxySHp8JW5xQvIYTLzX9T0E=;
	b=Z114hdl6azby+bjoTCTrSLTpx7HebzYyStym3kxS0e0vpI3I2sFSS4rda2qU30jkOLVZ
	 lyuy/2DKcQpSFM7TPfwhGJgwqUXyy5Ch2CwAemrgT+j0G8sxcxgy6oqeMSL9g85VX7I4B
	 QBitImi+LhdFQiqMKW8RWY9lPgQjPJKfv22kQ09jW3FDe7cQ6PknzzadpcTQfKdKNTHCf
	 n1JmDzRQx3ECRIPVIWtYGJh3TbW4UKYgsEl3lEYm4PQzgZBLvlDg0TXlYCzJ8lA6+Vwfd
	 yEt/ftF/sCm90CxQaOvzad4Gt/VdEyDQf96RDrVOUlLlTO7hpm8Jyh++9HRUvFq2xKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=bSMnCDyQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89448606A330;
	Fri, 13 Nov 2026 23:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89448606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=bSMnCDyQ
ARC-Seal: i=1; a=rsa-sha256; t=1794611993; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aAQBU41mKIkR/itcVu2Jv0cVvvszPNuNWnrIe9/92kwK+ALxQhz2zn/7tcaXccdy5HNgZsdJf0obqrHI+EEkyUBPHrTFk+FeGXlx54e4BvP1wNyvdMIBIOEtHaPUxZHcf8sVo1WIil7exWta+ni65qVWi4lv9U8tscGGcTzu9gw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794611993; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=396mrwK6+J7I5FsFadAXxxySHp8JW5xQvIYTLzX9T0E=; 
	b=IJBe7MdfGVPOznTUBuKTJCUrJ21JGjks/7jg9VPY2aMH7df8EPIab9PHw3jzdfNNs9VEnNgYu/qlViHA/2/hZKC6vnQXm2NfCS/D+uQMlVNJMVqgOjgkYykj328Za6/Y1o7M0zo7DOSiZy+tOTb7xY5HhJvctJS0no8DlBFz7XI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=bSMnCDyQNSUHmc+xnbyHDkeLBa7V8jCscjNLWHTT0KDuZvJvy1VttKXIKr9zzc8RqqsVFqiu4EA8ticrBYzNHQr/I1APuyoE3yRzYLoVTvYCwCp3JMh7w+539DzeuJAyvp7k4oiNB0GZc5LiZIoTykf2oLb7owMKkZTgyx8Ozyw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=396mrwK6+J7I5FsFadAXxxySHp8JW5xQvIYTLzX9T0E=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179461199111667.75435217143877;
	Fri, 13 Nov 2026 15:19:51 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 4148B1803FC; Sat, 14 Nov 2026 00:19:46 +0100 (CET)
Date: Sat, 14 Nov 2026 00:19:46 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, kernel@collabora.com, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
Message-ID: <aveY4hjCgstjkmy7@venus>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <avZvYlYyL3Doc8qt@hu-petche-lv.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y273ql62b2nj3j4n"
Content-Disposition: inline
In-Reply-To: <avZvYlYyL3Doc8qt@hu-petche-lv.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.590.96
X-ZohoMailClient: External


--y273ql62b2nj3j4n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
MIME-Version: 1.0

Hi,

On Thu, Nov 12, 2026 at 06:01:06PM -0800, Peter Chen wrote:
> On 26-10-21 20:05:25, Sebastian Reichel wrote:
> > - drop generic PHY reset notifier API; I discussed this series at Linux
> >   Plumbers Conference with Vinod Koul and he prefers a local driver
> >   hack/quirk instead
>=20
> Hi Sebastian and Vinod,
>=20
> Sorry to jump out late, do we really decide to use private callback betwe=
en
> USB controller and USB Combo PHY, and notify PHY's reset events for
> controller? Many platforms which support USB/DP altmode feature need this
> requirement, besides Rockchip, Qualcomm and the platforms use Cadence USB
> controller and PHY also need this.
>=20
> For this scenario, USB controller works at USB3 mode (also configures PHY=
 for
> USB3) first. Later, Type-C/DP event tells PHY that it needs to work for D=
P(4lane),
> since this event doesn't go to controller now, sudden switch PHY from USB3
> to DP (4lane) will turn off PIPE clock, and cause all controller's event =
which
> needs PHY (PIPE) clock abnormal, that's the reason why controller needs
> this PHY switch (reset) notification and let the controller know it needs
> to work at USB2 mode from now on.

This is similar to the Rockchip requirements. But the issue is
partially covered within the PHY by muxing the clock differently
(which is also somewhat of a hack, as common clock framework is not
aware of this). FWIW I expected more platforms to run into this over
time. Having combined PHYs for USB-C handling makes a lot of sense.

But I think it makes sense to proceed with this considering it is a
Fix. It has been going on for a very long time already and meanwhile
the problem is already there right now. Moving this from the
internal custom API to an official API is always possible as a
follow-up - it's all within the kernel, neither DT nor userspace ABI
is involved. Also having some users makes it easy to figure out how
the common API should look like.

Greetings,

-- Sebastian

>=20
> So, it is more like a general requirement, but not quirk for special plat=
form.
>=20
> Peter
>=20
> > - rework USBDP and DWC3 rockchip glue for the local driver quirk
> >   using direct function calls
> > - Ensure that the reset handler in DWC3 is only called when the PHY is
> >   initialized (and thus DWC3 is running)
> > - Also set vbus in the last patch when dwc3 is configured to device only
> >   mode (in contrast to dual-role mode being in device mode).
> >=20
> > Changes in v16:
> > - Link to v15 (sorry, I missed force setting the revision for this
> >   part in the series split, so the series says v1 in the patch subject):
> >   https://patch.msgid.link/20260915-b4-rockchip-dwc3-rockchip-glue-v1-0=
-763bb546824e@collabora.com
> > - Update first patch to also build the PM functions even when
> >   PM is disabled
> > - Add new patch for defining an empty usb_udc_vbus_handler stub
> >   when USB_GADGET is disabled
> > - Add dependency to Rockchip DWC3 glue, which disallows the
> >   configuration with USB_DWC3_ROCKCHIP=3Dy and USB_GADGET=3Dm
> > - Collect tags
> >=20
> > Changes in v15:
> >  - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanu=
p-v14-0-b5ad9c68fa11@collabora.com
> >  - Avoid #ifdef for CONFIG_PM in the new glue driver (Thinh Nguyen)
> >  - Do not add #if IS_ENABLED around the DT compatible blacklist in the
> >    generic driver, using the glue driver should be mandatory as the
> >    generic driver results in arbitrary system hangs. Thinh Nguyen sugge=
sted
> >    updating Kconfig for this, but did not clarify what that means.
> >    Current Kconfig works the same way as the other mandatory glue
> >    drivers.
> >  - Split series to simplify review
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> > Sebastian Reichel (7):
> >       phy: rockchip: usbdp: Track PHY power state
> >       phy: rockchip: usbdp: Add reset hook support for dwc3
> >       usb: dwc3: rockchip: introduce glue driver
> >       usb: dwc3: core: add post PHY registration hook for platform glue
> >       usb: dwc3: rockchip: add USBDP PHY reset quirk
> >       usb: gadget: define stub for usb_udc_vbus_handler
> >       usb: dwc3: rockchip: fix USB-C reconnect in gadget mode
> >=20
> >  drivers/phy/rockchip/phy-rockchip-usbdp.c |  82 ++++++++++-
> >  drivers/usb/dwc3/Kconfig                  |  13 ++
> >  drivers/usb/dwc3/Makefile                 |   1 +
> >  drivers/usb/dwc3/core.c                   |  17 ++-
> >  drivers/usb/dwc3/core.h                   |   9 ++
> >  drivers/usb/dwc3/dwc3-rockchip.c          | 227 ++++++++++++++++++++++=
++++++++
> >  drivers/usb/dwc3/trace.c                  |   3 +
> >  include/linux/phy/rockchip-usbdp.h        |  31 ++++
> >  include/linux/usb/gadget.h                |   5 +
> >  9 files changed, 383 insertions(+), 5 deletions(-)
> > ---
> > base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
> > change-id: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43
> >=20
> > Best regards,
> > -- =20
> > Sebastian Reichel <sebastian.reichel@collabora.com>
> >=20
> >=20
>=20
> --=20
>=20
> Thanks,
> Peter Chen

--y273ql62b2nj3j4n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr3mwoACgkQ2O7X88g7
+pragA/9FzXXAxsGqNAe5lp4EQDO7Y3egVEb59vzkimcTXPurGE/l4kePSGKJAg4
MWxXZ1F9OXKrbef+ruuzAE0SpV0QedcA+VFhgxMsB68j37twnkngzmpEiESkyNHR
/QPiUk0KYTqZyYDSeGmmvUiJWSyOLouIKKPs+hSxJ9CuLdF2+agbPuL7aNRcRK3t
6HQX6nM1QlcCXoLXhUo57rtplRGngj3l4HAGxrcptCTY6mRAt4gyiFg7cBUB6BNS
noUZ+GL1sW1wdFB9BMtRoR+ghTir5i+PQpy0TKx/TeEY4WVriTI0j4DCDnIFbpGw
PxRph0W+C6x+Am65L/LC4wBcL5yhlgNJCJeg+RXK7YJPGZTn5vX1VHUhiRa6wXCJ
3h8lHZJigfiiGEPbMUvgB+hHCdJBRVCiR7lu8GMS1thwcpcN87x+x7immvgG+sk/
62Z6mrGVy1ANECRBuNicQ68Nge0HKv6Ea2j1a3Ql1k5ZO8OSe9SZi3qutYUKtGtG
vk/w+ANGpGKbD3nnHQFLTywivg1ygndoOPVqrTGGWsRFY6yglkm4EvEndMe2khFe
zaTBuIg63ivrqZ0EQ9kV1vmSHWxgRRgxLK44pjzxCWeoOX3B6ilfEsDSLHoKtAac
gAUXovjWlFWb6IRTtUtoQsbY5C6HraVIwxniPSO1cuoZx0QFmk8=
=xdRH
-----END PGP SIGNATURE-----

--y273ql62b2nj3j4n--
