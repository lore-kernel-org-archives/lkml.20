Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215301D5CFE;
	Fri, 11 Sep 2026 07:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112344; cv=none; b=XvvOunS5w4dAK97NVIRUDznl4+5t+0te+O9hwlFj8BjSGxymqq4rJLGKob1hbDwHm1CbIp8a6Nkgz0bSFvnNYWejj+ZFjeWYYONzmJp95c7d5ZlCAlv2holGmvn2qcmWG8LmilV2bstWg8mVn7fEkxhoe/mphfVIBmgDQXg+Rww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112344; c=relaxed/simple;
	bh=go3wlP3m/ngWQzlHm8J39psAltyzckGRbaqkeEJWp+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ynlwonw49DM6hRLzxYzaFRAb7v1a4MZh73MASACi1ECOl/SMQCpHoGNGpjYKZ2tzvkaJH4BYF0rGTASQx9PzrR1/4vQLnWBVU/5TGfBMk7364tU9VxHzCEuTTefoEoGtRE8C2v0opecPo7A86m7IwDP0IRm8mxBgYyI5Cc71rKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mO61UKKQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mO61UKKQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAB31F000FF;
	Fri, 11 Sep 2026 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789112342;
	bh=EIwmi8HHqny/S7OwzP0Z31PJ1QE+rQm5ddfpOHV/Nzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mO61UKKQMO8XN9cdGaot2bgzngU42gZs3hpROHfT3FPOCX9fQYTG4f1gQCeEiQNcJ
	 MwvcFDUJDbCi1ARK+O+UG1FUWCIEsnZ91RtHh8Cj0w1H+hTfAV3uTxjje2TiZyE6tl
	 AxL+d5E2+4qXGHE9ar5mf4opmiGD7eXgimruMw+DOL+QT32svbt/Acpz83bD4VJYQs
	 6CN5FGTmayCyovbynpE3arjde0896IRlu5EhKtvJHjLNDkq0MPMKdbeqflEpSwox+A
	 WvhVZ38M2rrq5lmeVRn/aI08KMkXNUSxFl3ln8q6PdckX5qY9wnLzCVlyRDwe1FRFG
	 1tmHmnKUC/GIA==
Date: Fri, 11 Sep 2026 09:38:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	German <germanpapulindez@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: i2c: Add Sony IMX681 sensor driver
Message-ID: <20260911-lovely-khaki-inchworm-a13bb2@quoll>
References: <20260909203717.90605-1-lsa.uz@pm.me>
 <20260909203717.90605-3-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909203717.90605-3-lsa.uz@pm.me>

On Wed, Sep 09, 2026 at 08:37:40PM +0000, Sergey Lebedev wrote:
> From: Andre Gilerson <andre.gilerson@gmail.com>
> 
> The Sony IMX681 is the user-facing camera on the Microsoft Surface Pro 11
> for Business (Intel Lunar Lake, IPU7), where it is enumerated as ACPI
> device SONY0681. Without a driver the camera does not appear at all.
> 
> There is no public documentation for this sensor. The initialisation
> sequence and the mode registers were recovered from I2C traces taken under
> Windows, and the driver does not pretend otherwise: imx681_init_regs[] is
> 21 register writes whose individual meaning is not known.
> 
> What is not from the traces is derived and written down. The link frequency
> comes from the PLL configuration visible in the same traces - 19.2 MHz
> EXCK, PLL2_MUL 303, PLL2_PRE_DIV 3, giving 1939.2 MHz on the bus and
> therefore 969.6 MHz per lane - and the pixel rate follows from that, the
> lane count and the bit depth. The gain law and the black level were
> measured against the sensor rather than taken from the traces; the numbers
> are in the cover letter.
> 
> The driver uses the streams API, v4l2-cci for register access, the subdev
> state API and runtime PM, and validates the endpoint's lane count and link
> frequency against what the firmware describes.
> 
> Signed-off-by: Andre Gilerson <andre.gilerson@gmail.com>
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
>  MAINTAINERS                |   8 +
>  drivers/media/i2c/Kconfig  |  10 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/imx681.c | 884 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 903 insertions(+)
>  create mode 100644 drivers/media/i2c/imx681.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e12dc3ca5..198eaeefa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25586,6 +25586,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
>  F:	drivers/media/i2c/imx678.c
>  
> +SONY IMX681 SENSOR DRIVER
> +M:	Andre Gilerson <andre.gilerson@gmail.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git

Drop, I don't think you/Andre have commit rights there.


> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> +F:	drivers/media/i2c/imx681.c
> +

...

> +	/* Initialise V4L2 subdev */
> +	v4l2_i2c_subdev_init(&imx681->sd, client, &imx681_subdev_ops);
> +
> +	/* Initialise CCI regmap for 16-bit register addresses */
> +	imx681->cci = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(imx681->cci)) {
> +		ret = PTR_ERR(imx681->cci);
> +		dev_err(imx681->dev, "failed to init CCI: %d\n", ret);
> +		return ret;

return dev_err_probe

> +	}
> +
> +	/* Get clock (optional - INT3472 provides it on Surface devices) */
> +	imx681->xclk = devm_clk_get_optional(imx681->dev, NULL);
> +	if (IS_ERR(imx681->xclk))
> +		return dev_err_probe(imx681->dev, PTR_ERR(imx681->xclk),
> +				     "failed to get clock\n");
> +
> +	if (imx681->xclk)
> +		dev_dbg(imx681->dev, "clock rate: %lu Hz\n",
> +			clk_get_rate(imx681->xclk));

Drop. clk_summary tells that. No need for obvious debug messages.

Best regards,
Krzysztof

