Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E524AB3C1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087874; cv=none; b=S6tKEkO+vXTSzUAPsvRpZ40psNAAW1qxRT3hhc/3VL8qezLhihk9N1S3ZYVimibS6XIdxvuFvr0HP4XEQN9UfzyJKtWOH60nyFuoUiQB1uOEG3Cc7SW6ITQK8qfRtMe41EMWu4LvlmROMU8Cjj1ypPtj9yflvgSK5OAOqSUPJb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087874; c=relaxed/simple;
	bh=iwzl4TmttRgZH6+LcSL9jtKW6m/PREnCiiaa3tlWicA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o/N1FYU5LvrUUbc+Ng93Z29qjgHZ0cbPC7KxdTPnygqHK/ElvTjFtOLJ9BPH7O+IGwKQHytF4TJ2m+HPrR8n7msKBitKYY0Lk69S4s/A5Ha8zw+DVoCOzYejU64cE6dcOud999kcrZmRVdmDtq+qdHpbx5bSWyUpBfBuXFviMnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=YCqCtRpY; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="YCqCtRpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ehmYf5evPklyM7EHCrcZXHzSiswTPVrJ1nC9cWwTL0k=;
  b=YCqCtRpYSlREB9iAOSM/TuIjUiigCEMeDngUE3/JIgsw9ij8ZWWHNjM1
   Rjv0HQsVROJtDGEXH6IDRORca8FLHCRrmdhTtMXjeYAC/n+z1HWbKzf/H
   zErjmkMwMvld2P1Y4RMJI2Abbd9c2ADBZWCkmMieZ+GYtKO0p2YGgNDi9
   Q=;
X-CSE-ConnectionGUID: NvKQuuPyRPiQqsUKViosIg==
X-CSE-MsgGUID: UxVCTSUhR4GeQdH0H0ECIQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,160,1787004000"; 
   d="scan'208";a="300430180"
Received: from static.host-68-71-1-178.nrbn.ca (HELO hadrien) ([68.71.18.178])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 20:10:54 +0200
Date: Thu, 15 Oct 2026 14:10:53 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Alex Elder <elder@ieee.org>
cc: pavankumaryalagada@gmail.com, johan@kernel.org, gregkh@linuxfoundation.org, 
    vireshk@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: greybus: replace PTR_ERR() with %pe in error
 messages
In-Reply-To: <99cd529b-dffd-4315-b9be-9b0029973497@ieee.org>
Message-ID: <cc868527-c13c-4e9b-aa7a-d2553f93d92@inria.fr>
References: <20261015082238.65187-1-pavankumaryalagada@gmail.com> <99cd529b-dffd-4315-b9be-9b0029973497@ieee.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Thu, 15 Oct 2026, Alex Elder wrote:

> On 10/15/26 3:22 AM, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >
> > Use %pe to print error pointers directly and display their
> > error names.
> >
> > Keep PTR_ERR() calls when the numeric error value is needed
> > for returning the error code.
> >
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>
> In a few places you are *adding* the error value where it was
> missing (which I think is an improvement).  I assume that the
> return values in this case are negative errnos.
>
> It would have been worth mentioning this other type of change
> in the patch description too.  But it's not worth doing a new
> version for that.  I trust you found all the spots, and fixed
> them this way.  This looks good to me.

This Coccinelle semantic patch finds over 3000 opportunities for this
change in the kernel as a whole.  Outside the context of outreachy, I
wonder if people would be happy to see such changes, since the %pe code
seems much more informative.

julia

@@
constant char [] c;
expression f;
@@

* f(..., c, ..., PTR_ERR(...), ...)

@@
constant char [] c;
expression ret, e, f;
@@
  if (IS_ERR(e)) {
   ...
   ret = PTR_ERR(e);
   ...
*  f(..., c, ..., ret, ...)
   ...
  }







>
> Reviewed-by: Alex Elder <elder@riscstar.com>
>
> > ---
> > v4:
> > - Return error codes directly instead of storing them in ret,
> >    as suggested by Julia Lawall.
> > - Remove the unused ret variable.
> >
> > v3:
> > - Extend the %pe conversion throughout Greybus, as suggested by Alex Elder.
> >
> > v2:
> > - Use %pe in the firmware management case, as suggested by Jeremy Clifton,
> >    to match the other cases.
> >
> > v1: https://lore.kernel.org/outreachy/as0nhVbagZa8Birm@user/T/#t
> > ---
> >   drivers/staging/greybus/arche-apb-ctrl.c | 37 ++++++++++--------------
> >   drivers/staging/greybus/arche-platform.c | 26 +++++++----------
> >   drivers/staging/greybus/fw-core.c        | 16 +++++-----
> >   drivers/staging/greybus/uart.c           |  2 +-
> >   4 files changed, 35 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/staging/greybus/arche-apb-ctrl.c
> > b/drivers/staging/greybus/arche-apb-ctrl.c
> > index 4302c2226126..d30174310828 100644
> > --- a/drivers/staging/greybus/arche-apb-ctrl.c
> > +++ b/drivers/staging/greybus/arche-apb-ctrl.c
> > @@ -144,10 +144,9 @@ static int fw_flashing_seq(struct platform_device
> > *pdev)
> >     		apb->spi_en = devm_gpiod_get(dev, "spi-en", flags);
> >   		if (IS_ERR(apb->spi_en)) {
> > -			ret = PTR_ERR(apb->spi_en);
> > -			dev_err(dev, "Failed requesting SPI bus en GPIO:
> > %d\n",
> > -				ret);
> > -			return ret;
> > +			dev_err(dev, "Failed requesting SPI bus en GPIO:
> > %pe\n",
> > +				apb->spi_en);
> > +			return PTR_ERR(apb->spi_en);
> >   		}
> >   	}
> >   @@ -318,43 +317,37 @@ static int apb_ctrl_get_fw_data(struct
> > platform_device *pdev,
> >   				struct arche_apb_ctrl_drvdata *apb)
> >   {
> >   	struct device *dev = &pdev->dev;
> > -	int ret;
> >     	apb->resetn = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> >   	if (IS_ERR(apb->resetn)) {
> > -		ret = PTR_ERR(apb->resetn);
> > -		dev_err(dev, "Failed requesting reset GPIO: %d\n", ret);
> > -		return ret;
> > +		dev_err(dev, "Failed requesting reset GPIO: %pe\n",
> > apb->resetn);
> > +		return PTR_ERR(apb->resetn);
> >   	}
> >     	apb->boot_ret = devm_gpiod_get(dev, "boot-ret", GPIOD_OUT_LOW);
> >   	if (IS_ERR(apb->boot_ret)) {
> > -		ret = PTR_ERR(apb->boot_ret);
> > -		dev_err(dev, "Failed requesting bootret GPIO: %d\n", ret);
> > -		return ret;
> > +		dev_err(dev, "Failed requesting bootret GPIO: %pe\n",
> > apb->boot_ret);
> > +		return PTR_ERR(apb->boot_ret);
> >   	}
> >     	/* It's not mandatory to support power management interface */
> >   	apb->pwroff = devm_gpiod_get_optional(dev, "pwr-off", GPIOD_IN);
> >   	if (IS_ERR(apb->pwroff)) {
> > -		ret = PTR_ERR(apb->pwroff);
> > -		dev_err(dev, "Failed requesting pwroff_n GPIO: %d\n", ret);
> > -		return ret;
> > +		dev_err(dev, "Failed requesting pwroff_n GPIO: %pe\n",
> > apb->pwroff);
> > +		return PTR_ERR(apb->pwroff);
> >   	}
> >     	/* Do not make clock mandatory as of now (for DB3) */
> >   	apb->clk_en = devm_gpiod_get_optional(dev, "clock-en", GPIOD_OUT_LOW);
> >   	if (IS_ERR(apb->clk_en)) {
> > -		ret = PTR_ERR(apb->clk_en);
> > -		dev_err(dev, "Failed requesting APB clock en GPIO: %d\n",
> > ret);
> > -		return ret;
> > +		dev_err(dev, "Failed requesting APB clock en GPIO: %pe\n",
> > apb->clk_en);
> > +		return PTR_ERR(apb->clk_en);
> >   	}
> >     	apb->pwrdn = devm_gpiod_get(dev, "pwr-down", GPIOD_OUT_LOW);
> >   	if (IS_ERR(apb->pwrdn)) {
> > -		ret = PTR_ERR(apb->pwrdn);
> > -		dev_warn(dev, "Failed requesting power down GPIO: %d\n", ret);
> > -		return ret;
> > +		dev_warn(dev, "Failed requesting power down GPIO: %pe\n",
> > apb->pwrdn);
> > +		return PTR_ERR(apb->pwrdn);
> >   	}
> >     	/* Regulators are optional, as we may have fixed supply coming in */
> > @@ -368,12 +361,12 @@ static int apb_ctrl_get_fw_data(struct platform_device
> > *pdev,
> >     	apb->pinctrl = devm_pinctrl_get(&pdev->dev);
> >   	if (IS_ERR(apb->pinctrl)) {
> > -		dev_err(&pdev->dev, "could not get pinctrl handle\n");
> > +		dev_err(&pdev->dev, "could not get pinctrl handle: %pe\n",
> > apb->pinctrl);
> >   		return PTR_ERR(apb->pinctrl);
> >   	}
> >   	apb->pin_default = pinctrl_lookup_state(apb->pinctrl, "default");
> >   	if (IS_ERR(apb->pin_default)) {
> > -		dev_err(&pdev->dev, "could not get default pin state\n");
> > +		dev_err(&pdev->dev, "could not get default pin state: %pe\n",
> > apb->pin_default);
> >   		return PTR_ERR(apb->pin_default);
> >   	}
> >   diff --git a/drivers/staging/greybus/arche-platform.c
> > b/drivers/staging/greybus/arche-platform.c
> > index de5de59ea8ab..8e75accc34b6 100644
> > --- a/drivers/staging/greybus/arche-platform.c
> > +++ b/drivers/staging/greybus/arche-platform.c
> > @@ -444,35 +444,32 @@ static int arche_platform_probe(struct platform_device
> > *pdev)
> >     	arche_pdata->svc_reset = devm_gpiod_get(dev, "svc,reset", flags);
> >   	if (IS_ERR(arche_pdata->svc_reset)) {
> > -		ret = PTR_ERR(arche_pdata->svc_reset);
> > -		dev_err(dev, "failed to request svc-reset GPIO: %d\n", ret);
> > -		return ret;
> > +		dev_err(dev, "failed to request svc-reset GPIO: %pe\n",
> > arche_pdata->svc_reset);
> > +		return PTR_ERR(arche_pdata->svc_reset);
> >   	}
> >   	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_OFF);
> >     	arche_pdata->svc_sysboot = devm_gpiod_get(dev, "svc,sysboot",
> >   						  GPIOD_OUT_LOW);
> >   	if (IS_ERR(arche_pdata->svc_sysboot)) {
> > -		ret = PTR_ERR(arche_pdata->svc_sysboot);
> > -		dev_err(dev, "failed to request sysboot0 GPIO: %d\n", ret);
> > -		return ret;
> > +		dev_err(dev, "failed to request sysboot0 GPIO: %pe\n",
> > arche_pdata->svc_sysboot);
> > +		return PTR_ERR(arche_pdata->svc_sysboot);
> >   	}
> >     	/* setup the clock request gpio first */
> >   	arche_pdata->svc_refclk_req = devm_gpiod_get(dev, "svc,refclk-req",
> >   						     GPIOD_IN);
> >   	if (IS_ERR(arche_pdata->svc_refclk_req)) {
> > -		ret = PTR_ERR(arche_pdata->svc_refclk_req);
> > -		dev_err(dev, "failed to request svc-clk-req GPIO: %d\n", ret);
> > -		return ret;
> > +		dev_err(dev, "failed to request svc-clk-req GPIO: %pe\n",
> > +			arche_pdata->svc_refclk_req);
> > +		return PTR_ERR(arche_pdata->svc_refclk_req);
> >   	}
> >     	/* setup refclk2 to follow the pin */
> >   	arche_pdata->svc_ref_clk = devm_clk_get(dev, "svc_ref_clk");
> >   	if (IS_ERR(arche_pdata->svc_ref_clk)) {
> > -		ret = PTR_ERR(arche_pdata->svc_ref_clk);
> > -		dev_err(dev, "failed to get svc_ref_clk: %d\n", ret);
> > -		return ret;
> > +		dev_err(dev, "failed to get svc_ref_clk: %pe\n",
> > arche_pdata->svc_ref_clk);
> > +		return PTR_ERR(arche_pdata->svc_ref_clk);
> >   	}
> >     	platform_set_drvdata(pdev, arche_pdata);
> > @@ -483,9 +480,8 @@ static int arche_platform_probe(struct platform_device
> > *pdev)
> >   	arche_pdata->wake_detect = devm_gpiod_get(dev, "svc,wake-detect",
> >   						  GPIOD_IN);
> >   	if (IS_ERR(arche_pdata->wake_detect)) {
> > -		ret = PTR_ERR(arche_pdata->wake_detect);
> > -		dev_err(dev, "Failed requesting wake_detect GPIO: %d\n", ret);
> > -		return ret;
> > +		dev_err(dev, "Failed requesting wake_detect GPIO: %pe\n",
> > arche_pdata->wake_detect);
> > +		return PTR_ERR(arche_pdata->wake_detect);
> >   	}
> >     	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_IDLE);
> > diff --git a/drivers/staging/greybus/fw-core.c
> > b/drivers/staging/greybus/fw-core.c
> > index 2016a74f137f..78321be80013 100644
> > --- a/drivers/staging/greybus/fw-core.c
> > +++ b/drivers/staging/greybus/fw-core.c
> > @@ -93,8 +93,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >   			if (IS_ERR(connection)) {
> >   				ret = PTR_ERR(connection);
> >   				dev_err(&bundle->dev,
> > -					"failed to create management
> > connection (%d)\n",
> > -					ret);
> > +					"failed to create management
> > connection (%pe)\n",
> > +					connection);
> >   				goto err_destroy_connections;
> >   			}
> >   @@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >   			connection = gb_connection_create(bundle, cport_id,
> >   							  gb_fw_download_request_handler);
> >   			if (IS_ERR(connection)) {
> > -				dev_err(&bundle->dev, "failed to create
> > download connection (%ld)\n",
> > -					PTR_ERR(connection));
> > +				dev_err(&bundle->dev, "failed to create
> > download connection (%pe)\n",
> > +					connection);
> >   			} else {
> >   				fw_core->download_connection = connection;
> >   			}
> > @@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >   			connection = gb_connection_create(bundle, cport_id,
> >   							  NULL);
> >   			if (IS_ERR(connection)) {
> > -				dev_err(&bundle->dev, "failed to create SPI
> > connection (%ld)\n",
> > -					PTR_ERR(connection));
> > +				dev_err(&bundle->dev, "failed to create SPI
> > connection (%pe)\n",
> > +					connection);
> >   			} else {
> >   				fw_core->spi_connection = connection;
> >   			}
> > @@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
> >   			connection = gb_connection_create(bundle, cport_id,
> >   							  NULL);
> >   			if (IS_ERR(connection)) {
> > -				dev_err(&bundle->dev, "failed to create
> > Authentication connection (%ld)\n",
> > -					PTR_ERR(connection));
> > +				dev_err(&bundle->dev, "failed to create
> > Authentication connection (%pe)\n",
> > +					connection);
> >   			} else {
> >   				fw_core->cap_connection = connection;
> >   			}
> > diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> > index 172cf900eaf0..59a112cf47a0 100644
> > --- a/drivers/staging/greybus/uart.c
> > +++ b/drivers/staging/greybus/uart.c
> > @@ -951,7 +951,7 @@ static int gb_tty_init(void)
> >   					 TTY_DRIVER_DYNAMIC_DEV |
> >   					 TTY_DRIVER_RESET_SAVED_TERMIOS);
> >   	if (IS_ERR(gb_tty_driver)) {
> > -		pr_err("Can not allocate tty driver\n");
> > +		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
> >   		retval = PTR_ERR(gb_tty_driver);
> >   		goto fail_unregister_dev;
> >   	}
>
>
>
