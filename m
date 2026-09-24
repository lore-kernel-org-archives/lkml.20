Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237BA283142;
	Thu, 24 Sep 2026 15:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264212; cv=pass; b=X47JFeW8yA0SZSGRqsRkLoq1Q9+qNM+sBeV5Ru2c3dIlm4Fl/xcL7/mtUlGqVDORxvzE2joH3TpltbOhJwz7mdZDpiwrWyALYRk4hlyChZQ8EFMQ0y0RYuu6+dwT5uTMVovUuTel+iQHnIPkgXisz+gF36weFcR1EG+5GMxQfPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264212; c=relaxed/simple;
	bh=5JNjVQv7bSkrx8P3DCGguOs0UiYqksyxP7OGxYOPImw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Psk5WqoJcgEIRCXWCqlvO7fPzzNtgpou0RHuU5bngbAzpbPGwP/7KS0Ejwg4Ju64ZA8WvcnFGe8+ZMwH4LGpf+SdgwUp07EJGPK/I2JYU39lmDeIPnbNg33905Ze+43nKeLdj0BIsk6CMNa+5kK+//TDK5Fl2l0E5GtbftzojuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=LeGGMk8w; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="LeGGMk8w"
ARC-Seal: i=1; a=rsa-sha256; t=1790264193; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=avEIboCA7whGHLn5oj39qSTIrGRfMJV8ZiqxKNhqRMdlnAl9laOyKXZRMmDZGxAtqsOnI3KNvBup4aRqDeDGqAGSTxMBP3YIpLoFYceDvCnpHw6KRBZCd5Pi55cmpyk7ytvnBrur4jWrt7Gkrw9pDA7zTbKIKA26vOyisPURA8A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790264193; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xpHCM0iE2esEzIC122AELBh0E5yUB3wABaM/lIaa61Q=; 
	b=IGLIylyyEAOON9rdg0yA4hqUjiuq6Jqrl1jUNsPi/mNalOeB2EAYnEMZck+mj4p3YvS2lLKf1QUKxyyz8iE2fudVRUpg0YzJfd72WOB1ombH24l3MvMc6CIuoy6PRSPAbZmGBT0mhrYy9CoyX0YJhYc7E3qBx+PV2G4C1kFgBec=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790264193;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=xpHCM0iE2esEzIC122AELBh0E5yUB3wABaM/lIaa61Q=;
	b=LeGGMk8wl/AL71GOyYLhJRlUUDzBlpFLWqtDay16AcCmgywF2N0TZJvNyycTamoh
	e/LbcaLUo5dg0Z+buiTWVA5YujHT7M6thspb81LXzpJjAHSC5yZ7O/WOTV5aXtF+X3W
	ZRjh6q31BvSv5IY0K9S718XkXmfZRTBhOzbFjsfA=
Received: by smtp.zohomail.com with SMTPS id 179026419157669.64049589350486;
	Thu, 24 Sep 2026 08:36:31 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id C4383180EDC; Thu, 24 Sep 2026 17:36:26 +0200 (CEST)
Date: Thu, 24 Sep 2026 17:36:26 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 2/5] usb: dwc3: rockchip: introduce glue driver
Message-ID: <arVB7k5QRcwYfZEO@venus>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-2-763bb546824e@collabora.com>
 <6eacce65-5636-413f-8213-10910f3a7ee8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vu4syrqui7xkgy6d"
Content-Disposition: inline
In-Reply-To: <6eacce65-5636-413f-8213-10910f3a7ee8@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.230.26
X-ZohoMailClient: External


--vu4syrqui7xkgy6d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] usb: dwc3: rockchip: introduce glue driver
MIME-Version: 1.0

Hi Krishna,

On Wed, Sep 23, 2026 at 11:23:01AM +0530, Krishna Kurapati wrote:
>=20
>=20
> On 9/15/2026 8:47 PM, Sebastian Reichel wrote:
> > Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
> > For now this handles things identical to the default glue.
> >=20
>=20
> [...]
>=20
> > @@ -2448,11 +2448,26 @@ int dwc3_core_probe(const struct dwc3_probe_dat=
a *data)
> >   }
> >   EXPORT_SYMBOL_GPL(dwc3_core_probe);
> > +/*
> > + * List of compatibles, which have "synopsys,dwc3" as a fallback
> > + * compatible, but have a vendor specific glue driver that should
> > + * be used instead of this one.
> > + */
> > +static const char *const dwc3_compatible_blocklist[] =3D {
> > +	"rockchip,rk3588-dwc3",
> > +	"rockchip,rk3576-dwc3",
> > +};
> > +
> >   static int dwc3_probe(struct platform_device *pdev)
> >   {
> >   	struct dwc3_probe_data probe_data =3D {};
> >   	struct resource *res;
> >   	struct dwc3 *dwc;
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(dwc3_compatible_blocklist); i++)
> > +		if (device_is_compatible(&pdev->dev, dwc3_compatible_blocklist[i]))
> > +			return -ENODEV;
>=20
> Would it be better to split this patch into two ? I see core changes are
> independent of addition of the new driver.

That's true from a pure compile time perspective, but the new glue
driver is effectively dead code as it will never probe without that
change.

Greetings,

-- Sebastian

>=20
> Regards,
> Krishna,
>=20
> >   	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >   	if (!res) {
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

--vu4syrqui7xkgy6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmq1Q3oACgkQ2O7X88g7
+pqNww/9EHGMcp537E32jHoRUriW7+ZRqiKtCJUEczh/NpGV7a9xXNuE+bkz7LVq
8UvGrp0IAOp4D25D87IBZIwDPnw67hIbvheZ0jI1RSFoEfccO2RDqEJuwgr7TqdC
g0d427lgmozamZMyUVzI09/4Utnl3DSa8uWwYIq9/qRf6b5iqraovAoySq+KmKOY
5hss824MlBk2PKv5Zo8O0dd9CwcSyZuwxDgRoBToCZxQbHJdnAoHtJJN2VmLzZVx
N5IeQwKnqfLMS2lfiX5xSoRNotkrA7Ui5iKFvsKsLU/gARuQ6LHhChy9SE8aBww+
chxvuSCF2s+FGF71RIHfUpVyq4+jMUdlL3ptA0mLVQrrUQsfinFAIuDtzQdTflBb
ap3t6hwgj5zfBq/BueWKWUDfh8WurhILCEk45ALEKePEDKa7D5Dh1KEdwYBtTMy/
G7FflOWk8J5oA9DiPHVGD5Bnu92PmD/yCxIEIDCWz03nK1cDJTl2+ahxrKrVKQa8
1PmUSIabWXinh1fiptThR0Egj/dzscArNESi2IvoxtGBLyAVZ0aesZgGdURhV7w1
lUxmBBlwcpDZr9TDgDakKW70TgPsuccXeCsgxLkMNm5ydtqU7l/gH5kDun4FrbWz
0xZWpKVyrZvU0zEoz56h56Rbd+Hcas6pXZIFgJH1+tnZMCVfD7U=
=yBxX
-----END PGP SIGNATURE-----

--vu4syrqui7xkgy6d--
