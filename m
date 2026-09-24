Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4A14A0F1B;
	Thu, 24 Sep 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263811; cv=pass; b=U1oLHh5FwXsWKkZbxCF/tKSWZSSkCNz9/JK1huWwygM/PQtGnApwrJPySF3K9AJ3dd4yjyiXNnFXjlu26rmYuvU9qO8jNXvhzElwxKXn2uw4Lj8ooWlEC3K1IC0ipeBXj0n03H2vKKZcR4AA1zpUwtUjVsgNs0LZGzqBcQS3dSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263811; c=relaxed/simple;
	bh=YRH6Rar1sYyh2YGzCVd5DnssVof55np0H86XwWyFpJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTPeOIDnmVc30eLd+awBMv0lRrHevdnBeLI2Qebl2FvRMSXk1L2VaPMvIhY7Q51i3arruCOzcJYnkb19rjtXOuruP+3DI+wGGQtubSGYRlL5VZ17VbjA5mUM+79ZM7ODVkELANo+IKNwTgqyRizBigt4FmJZcPID8mKEm5ywjmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=XCyollQY; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="XCyollQY"
ARC-Seal: i=1; a=rsa-sha256; t=1790263788; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=abg3tD7gCn40tZBonWdZgORycIx1YU6wZqDmUrH2Gnd23rPRFFfpKVI7MfbJcgUeDTTH+rCVFkfNQrX0juuIK+CS+RxWK314U/DEL0AewBkqJVf50oSpfmM1bGIgyew3jb8LtxEtN3MZKutX3cacJ58D6V7BOGvMygY572JEIJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790263788; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ojt2BoZRoit8YTa2oyVkPQDILAU3Mszm9vA+7r1Y+sA=; 
	b=ALrCtEpougLfWu0xgNeeaNbeDwS2DhTMD4P7+sly0gtSqEHmZKOvNLMhVzCx0b+YKca9QIl44SlI6uScgj7MXwymTpijt+NLKgbkSMyy1BFecrMzAP6f5z4XGOwd/jFY4VwgzQGBPbTzRKjfbZI7yNS85AgHttitdOtHR3691kk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790263788;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=ojt2BoZRoit8YTa2oyVkPQDILAU3Mszm9vA+7r1Y+sA=;
	b=XCyollQYtXMfftFpQuXEw/OZQ//HFVoEGB8bi3XL48hTfvEb06MV9q08GU21iSyt
	hdSDtJU0YyHujH3q9GIqwWi6vHD7IjYwQJfKDIlJNmGsrSPi4quF48xJFVI+rDTIMJx
	rqob72feqCv0BAAYruxTWcEG9cYbJKvjxOhuwnXI=
Received: by smtp.zohomail.com with SMTPS id 1790263785416232.6245725162671;
	Thu, 24 Sep 2026 08:29:45 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 86684180EDC; Thu, 24 Sep 2026 17:29:40 +0200 (CEST)
Date: Thu, 24 Sep 2026 17:29:40 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"kernel@collabora.com" <kernel@collabora.com>, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH 2/5] usb: dwc3: rockchip: introduce glue driver
Message-ID: <arU0_rRUerCfhAs0@venus>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-2-763bb546824e@collabora.com>
 <arMkheCePz6PD8NZ@vbox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5yc4rucu7v66hpki"
Content-Disposition: inline
In-Reply-To: <arMkheCePz6PD8NZ@vbox>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.230.26
X-ZohoMailClient: External


--5yc4rucu7v66hpki
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] usb: dwc3: rockchip: introduce glue driver
MIME-Version: 1.0

Hi,

On Wed, Sep 23, 2026 at 01:31:03AM +0000, Thinh Nguyen wrote:
> On Tue, Sep 15, 2026, Sebastian Reichel wrote:
> > Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
> > For now this handles things identical to the default glue.
> >=20
> > Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  drivers/usb/dwc3/Kconfig         |  11 ++++
> >  drivers/usb/dwc3/Makefile        |   1 +
> >  drivers/usb/dwc3/core.c          |  15 ++++++
> >  drivers/usb/dwc3/dwc3-rockchip.c | 106 +++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 133 insertions(+)
> >=20
>=20
> <...>
>=20
> > =20
> > +/*
> > + * List of compatibles, which have "synopsys,dwc3" as a fallback
> > + * compatible, but have a vendor specific glue driver that should
> > + * be used instead of this one.
> > + */
>=20
> Shouldn't these be guarded by CONFIG_USB_DWC3_ROCKCHIP so that
> we can still fall back to the generic DWC3 driver?

I think it's better to not probe at all. The reason for introducing
the new glue driver is avoiding PHY startup problems. They already
happen every now and then (so the bug is not introduced by my USBDP
patches, but rather its an existing race condition). Fixing the hangs
also requires driving the reset notifier from the USBDP PHY, which is
not part of this series. But I doubt we get a lot from making
patch series interdependencies even more complicated by temporarily
continueing to allow using the generic DWC3 driver on Rockchip.

Note that the PHY startup hang probability increases a lot by my
USBDP series. So once that landed the generic code is no longer
usable without doing lots of reboots and getting very lucky.

> > +static const char *const dwc3_compatible_blocklist[] =3D {
>=20
> #if IS_ENABLED(CONFIG_USB_DWC3_ROCKCHIP)
>=20
> > +	"rockchip,rk3588-dwc3",
> > +	"rockchip,rk3576-dwc3",
>=20
> #endif
>=20
> > +};
> > +
>=20
>=20
>=20
> >  static int dwc3_probe(struct platform_device *pdev)
> >  {
> >  	struct dwc3_probe_data probe_data =3D {};
> >  	struct resource *res;
> >  	struct dwc3 *dwc;
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(dwc3_compatible_blocklist); i++)
> > +		if (device_is_compatible(&pdev->dev, dwc3_compatible_blocklist[i]))
> > +			return -ENODEV;
> > =20
> >  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	if (!res) {
>=20
>=20
>=20
> <...>
>=20
>=20
>=20
> > diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-r=
ockchip.c
> > new file mode 100644
> > index 000000000000..62f2a03b08a2
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-rockchip.c
> > @@ -0,0 +1,106 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2026, Collabora Ltd. */
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include "glue.h"
> > +
> > +struct dwc3_rockchip {
> > +	struct dwc3		dwc;
> > +};
> > +
> > +static int dwc3_rockchip_probe(struct platform_device *pdev)
> > +{
> > +	struct dwc3_probe_data probe_data =3D {};
> > +	struct resource *res;
> > +	struct dwc3_rockchip *dwc_rk;
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "missing memory resource\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	dwc_rk =3D devm_kzalloc(&pdev->dev, sizeof(*dwc_rk), GFP_KERNEL);
> > +	if (!dwc_rk)
> > +		return -ENOMEM;
> > +
> > +	dwc_rk->dwc.dev =3D &pdev->dev;
> > +	dwc_rk->dwc.glue_ops =3D NULL;
> > +
> > +	probe_data.dwc =3D &dwc_rk->dwc;
> > +	probe_data.res =3D res;
> > +	probe_data.properties =3D DWC3_DEFAULT_PROPERTIES;
> > +
> > +	return dwc3_core_probe(&probe_data);
> > +}
> > +
> > +static void dwc3_rockchip_remove(struct platform_device *pdev)
> > +{
> > +	dwc3_core_remove(platform_get_drvdata(pdev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_runtime_suspend(struct device =
*dev)
>=20
> Please use the same PM callback pattern as dwc3-generic-plat.c. That
> should avoid the need for __maybe_unused on each callback.

Will do. FWIW this wastes a bunch of memory for !CONFIG_PM by simply
always including the code, even when it's not needed. I suppose
that's fine as disabled CONFIG_PM is uncommon config anyways.

> > +{
> > +	return dwc3_runtime_suspend(dev_get_drvdata(dev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_runtime_resume(struct device *=
dev)
> > +{
> > +	return dwc3_runtime_resume(dev_get_drvdata(dev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_runtime_idle(struct device *de=
v)
> > +{
> > +	return dwc3_runtime_idle(dev_get_drvdata(dev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_suspend(struct device *dev)
> > +{
> > +	return dwc3_pm_suspend(dev_get_drvdata(dev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_resume(struct device *dev)
> > +{
> > +	return dwc3_pm_resume(dev_get_drvdata(dev));
> > +}
> > +
> > +static void __maybe_unused dwc3_rockchip_complete(struct device *dev)
> > +{
> > +	dwc3_pm_complete(dev_get_drvdata(dev));
> > +}
> > +
> > +static int __maybe_unused dwc3_rockchip_prepare(struct device *dev)
> > +{
> > +	return dwc3_pm_prepare(dev_get_drvdata(dev));
> > +}
> > +
> > +static const struct dev_pm_ops dwc3_rockchip_dev_pm_ops =3D {
> > +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_rockchip_suspend, dwc3_rockchip_resume)
> > +	SET_RUNTIME_PM_OPS(dwc3_rockchip_runtime_suspend, dwc3_rockchip_runti=
me_resume,
> > +			   dwc3_rockchip_runtime_idle)
> > +	.complete =3D pm_sleep_ptr(dwc3_rockchip_complete),
> > +	.prepare =3D pm_sleep_ptr(dwc3_rockchip_prepare),
> > +};
> > +
> > +static const struct of_device_id dwc3_rockchip_of_match[] =3D {
> > +	{ .compatible =3D "rockchip,rk3588-dwc3" },
> > +	{ .compatible =3D "rockchip,rk3576-dwc3" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_rockchip_of_match);
> > +
> > +static struct platform_driver dwc3_rockchip_driver =3D {
> > +	.probe		=3D dwc3_rockchip_probe,
> > +	.remove		=3D dwc3_rockchip_remove,
> > +	.driver		=3D {
> > +		.name	=3D "dwc3-rockchip",
> > +		.pm	=3D pm_ptr(&dwc3_rockchip_dev_pm_ops),
> > +		.of_match_table	=3D dwc3_rockchip_of_match,
> > +	},
> > +};
> > +
> > +module_platform_driver(dwc3_rockchip_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("DesignWare DWC3 Rockchip Glue Driver");
> >=20
>=20
>=20
> Thanks,
> Thinh

--5yc4rucu7v66hpki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmq1QeAACgkQ2O7X88g7
+ppB2hAAjYENPwlnCsE+aWnPmc/FTPh4KKly3W7g+jkx92kcGIcWRH8hmIhQMl+I
jPUOAsSbSWt55UU1YPfjv07sTJzZu3/0mV06gq0dzuPpg4ydlNO8JUenXrsCDOA6
I2Rupq0w00a1abBCVazFtKDwk6pyF434Tt0f9x3F6OZule95Jhwi6ZqM9pYRt2es
NOf1gTLVzPspX+jscjWhRm6KOk+ZS63jKkxXyer6W1OV2efRJAVd1hmPQzt1k7zC
kFAWJxYc7r7nApdiHeEoKgudQTFg76D7rZ3eYbk9zLGifIwAe+SYUcUtJb3rsY7+
9Kas/Edff1CUuNf5ho7v81cr8QvB+bytgv1eHGS5je7C3/zHRnUOfPUM6wIfdfr5
kD7l+iAthwlokCyuftXJtrdgw0fV3WcFnUwTc0eA429xwUQpAxKhGvi3evWKFn0S
ZuH65oux33Lde8rEvvzyF0uZWipCvk5FU2qPsdQpOvOdWU6jBL5XvHDo3pWVvyh1
refxT+ZtLlKJbdJ9YKkNyQKhZr36DO5trAUMELrRFMRIx4p0VCRFrc6Pr/qnKtn9
Ihw8vNzTw7P3VuiQo6INPC9/MtQQ6EMxGFXFP59yBxeBe2l9jmOna4Ea8NFljaa4
3yT9E6uRDq9kj3rMt94cbdp+76Bq5McRwEsd+Zua6lo4q+tvGtI=
=VHfI
-----END PGP SIGNATURE-----

--5yc4rucu7v66hpki--
