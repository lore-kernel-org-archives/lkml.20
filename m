Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F6A3D5643;
	Mon, 31 Aug 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166656; cv=none; b=UVKGnwLvou03n7VdnuhSx3/ci3fCpkqwpE1PRy28D8emvisiYEFOYi/iFD25k+dooSd4to/1+oTMk2OrwYNAkIKVSeecQ2AeBf3e8lx/xuBCDBfBHnAC7ytNue2kYFOGR/J0ejSRfsaLxOu1OiThyRmQKuUi0bfNdghTBCfpbg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166656; c=relaxed/simple;
	bh=URTWqNIh8YyWeHvaBA5BZQxA5qRUNu41wUSIq/cYQ6Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=njF1JBTWH9AA8Y1sN970/HoAwnf+P3KZ6JyIkos8ynMxPHQKWvpyJQ8itpRR/91CkOd1AkqX2elkRrQ4Qy1FTJBqreWEsTdYLMgqi4RRXvMED0B+RNoZjEMqx3Z+LmFzyrluWS4FqOoyv6UV6C0wUfyUM0qN7L8CZgUwGde+WMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 80188201D27;
	Mon, 31 Aug 2026 10:57:31 +0200 (CEST)
Message-ID: <0c53abedc1b58a141556627d4d68065638d22376.camel@pengutronix.de>
Subject: Re: [PATCH v1 3/4] usb: cdns3: Add CIX Sky1 glue driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hongliang Yang <hongliang.yang@cixtech.com>, peter.chen@kernel.org, 
	pawell@cadence.com, vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: gregkh@linuxfoundation.org, rogerq@kernel.org,
 neil.armstrong@linaro.org, 	fugang.duan@cixtech.com,
 cix-kernel-upstream@cixtech.com, 	linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org, Gary
 Yang <gary.yang@cixtech.com>
Date: Mon, 31 Aug 2026 10:57:31 +0200
In-Reply-To: <20260831082309.3854507-4-hongliang.yang@cixtech.com>
References: <20260831082309.3854507-1-hongliang.yang@cixtech.com>
	 <20260831082309.3854507-4-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-08-31 at 16:23 +0800, Hongliang Yang wrote:
> Add glue layer for the Cadence USBSSP DRD controller on CIX Sky1
> SoCs. The glue driver handles platform-specific initialization
> including clocks, resets, and PHY configuration.
>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> Reviewed-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  drivers/usb/cdns3/Kconfig      |  13 +
>  drivers/usb/cdns3/Makefile     |   1 +
>  drivers/usb/cdns3/cdnsp-sky1.c | 682 +++++++++++++++++++++++++++++++++
>  drivers/usb/cdns3/cdnsp-sky1.h | 127 ++++++
>  4 files changed, 823 insertions(+)
>  create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
>  create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h
>=20
[...]
> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> index 000000000000..3dd20451569e
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c
> @@ -0,0 +1,682 @@
[...]
> +static int cdnsp_sky1_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node =3D dev->of_node;
> +	struct cdnsp_sky1 *data;
> +	int ret =3D 0;
> +	struct cdns3_platform_data *cdns_sky1_pdata;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->axi_base =3D devm_platform_ioremap_resource_byname(pdev, "axi_pro=
perty");
> +	if (IS_ERR(data->axi_base)) {
> +		dev_err(dev, "can't map IOMEM resource\n");
> +		return PTR_ERR(data->axi_base);
> +	}
> +	data->ctst_base =3D devm_platform_ioremap_resource_byname(pdev, "contro=
ller_status");
> +	if (IS_ERR(data->ctst_base)) {
> +		dev_err(dev, "can't map IOMEM resource\n");
> +		return PTR_ERR(data->ctst_base);
> +	}
> +	data->reset =3D devm_reset_control_get(&pdev->dev, "usb_reset");

Please use devm_reset_control_get_exclusive() directly.

regards
Philipp
