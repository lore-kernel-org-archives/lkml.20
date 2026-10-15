Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC6138C406
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030889; cv=none; b=EDXuKvfCN3/le2WsUb3ou4TYetgaaAnjEsc+F6vgESAmqKHGcGeDK/8hRblmkY6DSKcRHLX6zrd7+wxoST5hxV+jrSVCk18DpJWBMsDM/vWvHU3Mhil1AflOIZJJSOdBJH9Jpq9ZmzHhbzCxhHePBNij6LY8Oe4MTy97ia7XMXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030889; c=relaxed/simple;
	bh=LWMhfmN0h1/ORMip9RaDPmUcGXvCLGQbdN2F4Uk60L0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kpohtYmX5GecCOxJKb27DoC8y08AONnHu5zwkjExXStz1pASUIf+SDSZSwy0YnRhdOFLXmeXuZ0w+OXq7Vo4UauhiOpT6YOgp1n/XIC4k05MgpEXOfHzBt4P5JlmzLuRF6yGECF5MKwwuFRsGRJngt02ILB2B1y6Fmlxi6OlBE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=MvT09+qd; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="MvT09+qd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RnXTNwerBgQqWgqQhL4zziJKRpc/uU5pPZ7H4xoQWBc=;
  b=MvT09+qdydLKRaQ8UsktmQpJjLryHfDrdg9vs/nDlWAcqRR1V2PARJpk
   LW4UiPTlXm9pkMC6RAnrwWdNOeKYrQxFmvPe9Sw+mcy87BNn2MTBQUnjO
   wmvctXp/xL4L3D/n1jn4r8QnpgiSP4iqh51E0Ry6GEiOkju+kejyhD2cI
   0=;
X-CSE-ConnectionGUID: mrZtPcrRTyGUzdxrrkI08A==
X-CSE-MsgGUID: RCHKlq7FRROo8vW7T9vBCA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,158,1787004000"; 
   d="scan'208";a="300261299"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 04:21:24 +0200
Date: Wed, 14 Oct 2026 22:21:22 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org, 
    elder@kernel.org, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    outreachy@lists.linux.dev
Subject: Re: [PATCH v3] staging: greybus: replace PTR_ERR() with %pe in error
 messages
In-Reply-To: <20261015015624.22031-1-pavankumaryalagada@gmail.com>
Message-ID: <c42bf562-913d-c449-4c7a-5f67bd08f9d@inria.fr>
References: <20261015015624.22031-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 15 Oct 2026, pavankumaryalagada@gmail.com wrote:

> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>
> Use %pe to print error pointers directly and display their
> error names.
>
> Keep PTR_ERR() calls when the numeric error value is needed
> for returning the error code.
>
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> ---
> v3:
> - Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.
>
> v2:
> - Use %pe in the firmware management case, as suggested by Jeremy Clifton,
>   to match the other cases.
>
> v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
> ---
>  drivers/staging/greybus/arche-apb-ctrl.c | 18 +++++++++---------
>  drivers/staging/greybus/arche-platform.c |  8 ++++----
>  drivers/staging/greybus/fw-core.c        | 16 ++++++++--------
>  drivers/staging/greybus/uart.c           |  2 +-
>  4 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
> index 4302c2226126..fa4d2d88dc3f 100644
> --- a/drivers/staging/greybus/arche-apb-ctrl.c
> +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> @@ -145,8 +145,8 @@ static int fw_flashing_seq(struct platform_device *pdev)
>  		apb->spi_en = devm_gpiod_get(dev, "spi-en", flags);
>  		if (IS_ERR(apb->spi_en)) {
>  			ret = PTR_ERR(apb->spi_en);
> -			dev_err(dev, "Failed requesting SPI bus en GPIO: %d\n",
> -				ret);
> +			dev_err(dev, "Failed requesting SPI bus en GPIO: %pe\n",
> +				apb->spi_en);
>  			return ret;

Maybe it's for after this series gets accepted, but you don't really need
to initialize ret here.  You can just return PTR_ERR(apb->spi_en).

You can also check whether the ret variable is needed at all in this
function (I don't know).

>  		}
>  	}
> @@ -323,14 +323,14 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
>  	apb->resetn = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(apb->resetn)) {
>  		ret = PTR_ERR(apb->resetn);
> -		dev_err(dev, "Failed requesting reset GPIO: %d\n", ret);
> +		dev_err(dev, "Failed requesting reset GPIO: %pe\n", apb->resetn);
>  		return ret;
>  	}
>
>  	apb->boot_ret = devm_gpiod_get(dev, "boot-ret", GPIOD_OUT_LOW);
>  	if (IS_ERR(apb->boot_ret)) {
>  		ret = PTR_ERR(apb->boot_ret);
> -		dev_err(dev, "Failed requesting bootret GPIO: %d\n", ret);
> +		dev_err(dev, "Failed requesting bootret GPIO: %pe\n", apb->boot_ret);
>  		return ret;
>  	}

Same here and in the subsequent ones.

> @@ -338,7 +338,7 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
>  	apb->pwroff = devm_gpiod_get_optional(dev, "pwr-off", GPIOD_IN);
>  	if (IS_ERR(apb->pwroff)) {
>  		ret = PTR_ERR(apb->pwroff);
> -		dev_err(dev, "Failed requesting pwroff_n GPIO: %d\n", ret);
> +		dev_err(dev, "Failed requesting pwroff_n GPIO: %pe\n", apb->pwroff);
>  		return ret;
>  	}
>
> @@ -346,14 +346,14 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
>  	apb->clk_en = devm_gpiod_get_optional(dev, "clock-en", GPIOD_OUT_LOW);
>  	if (IS_ERR(apb->clk_en)) {
>  		ret = PTR_ERR(apb->clk_en);
> -		dev_err(dev, "Failed requesting APB clock en GPIO: %d\n", ret);
> +		dev_err(dev, "Failed requesting APB clock en GPIO: %pe\n", apb->clk_en);
>  		return ret;
>  	}
>
>  	apb->pwrdn = devm_gpiod_get(dev, "pwr-down", GPIOD_OUT_LOW);
>  	if (IS_ERR(apb->pwrdn)) {
>  		ret = PTR_ERR(apb->pwrdn);
> -		dev_warn(dev, "Failed requesting power down GPIO: %d\n", ret);
> +		dev_warn(dev, "Failed requesting power down GPIO: %pe\n", apb->pwrdn);
>  		return ret;
>  	}
>
> @@ -368,12 +368,12 @@ static int apb_ctrl_get_fw_data(struct platform_device *pdev,
>
>  	apb->pinctrl = devm_pinctrl_get(&pdev->dev);
>  	if (IS_ERR(apb->pinctrl)) {
> -		dev_err(&pdev->dev, "could not get pinctrl handle\n");
> +		dev_err(&pdev->dev, "could not get pinctrl handle: %pe\n", apb->pinctrl);
>  		return PTR_ERR(apb->pinctrl);
>  	}
>  	apb->pin_default = pinctrl_lookup_state(apb->pinctrl, "default");
>  	if (IS_ERR(apb->pin_default)) {
> -		dev_err(&pdev->dev, "could not get default pin state\n");
> +		dev_err(&pdev->dev, "could not get default pin state: %pe\n", apb->pin_default);
>  		return PTR_ERR(apb->pin_default);
>  	}

These two are different from the others.

julia

> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index de5de59ea8ab..a97ac59c6f01 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -445,7 +445,7 @@ static int arche_platform_probe(struct platform_device *pdev)
>  	arche_pdata->svc_reset = devm_gpiod_get(dev, "svc,reset", flags);
>  	if (IS_ERR(arche_pdata->svc_reset)) {
>  		ret = PTR_ERR(arche_pdata->svc_reset);
> -		dev_err(dev, "failed to request svc-reset GPIO: %d\n", ret);
> +		dev_err(dev, "failed to request svc-reset GPIO: %pe\n", arche_pdata->svc_reset);
>  		return ret;
>  	}
>  	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_OFF);
> @@ -454,7 +454,7 @@ static int arche_platform_probe(struct platform_device *pdev)
>  						  GPIOD_OUT_LOW);
>  	if (IS_ERR(arche_pdata->svc_sysboot)) {
>  		ret = PTR_ERR(arche_pdata->svc_sysboot);
> -		dev_err(dev, "failed to request sysboot0 GPIO: %d\n", ret);
> +		dev_err(dev, "failed to request sysboot0 GPIO: %pe\n", arche_pdata->svc_sysboot);
>  		return ret;
>  	}
>
> @@ -471,7 +471,7 @@ static int arche_platform_probe(struct platform_device *pdev)
>  	arche_pdata->svc_ref_clk = devm_clk_get(dev, "svc_ref_clk");
>  	if (IS_ERR(arche_pdata->svc_ref_clk)) {
>  		ret = PTR_ERR(arche_pdata->svc_ref_clk);
> -		dev_err(dev, "failed to get svc_ref_clk: %d\n", ret);
> +		dev_err(dev, "failed to get svc_ref_clk: %pe\n", arche_pdata->svc_ref_clk);
>  		return ret;
>  	}
>
> @@ -484,7 +484,7 @@ static int arche_platform_probe(struct platform_device *pdev)
>  						  GPIOD_IN);
>  	if (IS_ERR(arche_pdata->wake_detect)) {
>  		ret = PTR_ERR(arche_pdata->wake_detect);
> -		dev_err(dev, "Failed requesting wake_detect GPIO: %d\n", ret);
> +		dev_err(dev, "Failed requesting wake_detect GPIO: %pe\n", arche_pdata->wake_detect);
>  		return ret;
>  	}
>
> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
> index 2016a74f137f..78321be80013 100644
> --- a/drivers/staging/greybus/fw-core.c
> +++ b/drivers/staging/greybus/fw-core.c
> @@ -93,8 +93,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>  			if (IS_ERR(connection)) {
>  				ret = PTR_ERR(connection);
>  				dev_err(&bundle->dev,
> -					"failed to create management connection (%d)\n",
> -					ret);
> +					"failed to create management connection (%pe)\n",
> +					connection);
>  				goto err_destroy_connections;
>  			}
>
> @@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>  			connection = gb_connection_create(bundle, cport_id,
>  							  gb_fw_download_request_handler);
>  			if (IS_ERR(connection)) {
> -				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
> -					PTR_ERR(connection));
> +				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
> +					connection);
>  			} else {
>  				fw_core->download_connection = connection;
>  			}
> @@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>  			connection = gb_connection_create(bundle, cport_id,
>  							  NULL);
>  			if (IS_ERR(connection)) {
> -				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
> -					PTR_ERR(connection));
> +				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
> +					connection);
>  			} else {
>  				fw_core->spi_connection = connection;
>  			}
> @@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
>  			connection = gb_connection_create(bundle, cport_id,
>  							  NULL);
>  			if (IS_ERR(connection)) {
> -				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
> -					PTR_ERR(connection));
> +				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
> +					connection);
>  			} else {
>  				fw_core->cap_connection = connection;
>  			}
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index 172cf900eaf0..59a112cf47a0 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -951,7 +951,7 @@ static int gb_tty_init(void)
>  					 TTY_DRIVER_DYNAMIC_DEV |
>  					 TTY_DRIVER_RESET_SAVED_TERMIOS);
>  	if (IS_ERR(gb_tty_driver)) {
> -		pr_err("Can not allocate tty driver\n");
> +		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
>  		retval = PTR_ERR(gb_tty_driver);
>  		goto fail_unregister_dev;
>  	}
> --
> 2.43.0
>
>
>
