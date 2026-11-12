Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794517493;
	b=5FFGcucHH8Z+EWy4Ezm7lnnbKfD3DfzOG0hFBZwAhgS7cdIHivh5Ij4VOQudAoJEIVmh
	 e1D/FiY7qmpfgBeaB9/dA4D4NrMY94Z5/sH4jtV5tH/SGgmsWPuzUfcIPXfwEvB3GhLO3
	 wpJ99RE+K2R0B9VhKTW8Ot2czIizkbMv0CDICgni+HxoejiYaZYe4QeyhbQ2EwDB102ez
	 Wba5B/H9kf4XEFeOpI+onYeWUCUoNpIrPyYDpszyjcGVpiyju4U5EfjFV0XzucHbvcDKE
	 UIFCJ4k8HclrChe40CH9d2JhMJDa5ho1qEqSAhQOdeXR0oTBQ72dWre8YN26nuefJUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=O5gco7lHoYOygwHEP3RxfzTMIYTl8gyDFQ4fgofww90=;
	b=G+aL+OS0l8EwocFPqar1ZJKayxXCe7+HytYhPPcTj1Yp6dYaIkWIrgRwrJCgtmWXcUmy
	 K94RHv52v7CGmoBHQ0lQR50gCkIAiwN6pMpAQkzSKfDLVThAeTxWWLQS6/34LgEqmHosL
	 IKUG1xk6JbS4EN3UoPMG9tDHWQQSsFbYHGzykFm/hV6CCjmHcbdCov4wfw/Q0tVF51FrV
	 YpL2VT4xlzz6JsB0aCqn6N2yNoN9r6SzgWX/h9oNQn5DpDr6mN313iGbbLToX0EwLcH1U
	 DklY0UawfLifkszE9Nlo6gaBOtjdeKlslTHpYupfTLTNB8Zn3SjtLUqqJfbyFxTq8EA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iki.fi;
	spf=pass smtp.mailfrom=iki.fi;
	dkim=pass header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=Ntf9RyoF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DE5606A323;
	Thu, 12 Nov 2026 21:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DE5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=Ntf9RyoF
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4jQXvh3xyLz49Q3S;
	Thu, 12 Nov 2026 23:04:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1794517489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O5gco7lHoYOygwHEP3RxfzTMIYTl8gyDFQ4fgofww90=;
	b=Ntf9RyoFS7ANT10yvOzT0aZIEdWNZj+HgpPm9deg+Yg8/nCchphZAgEjEx3u5MdWSthDrB
	bE05ivGc9kQq7Lh4+8d2ke/d69JddZL9wQ76zHc3kMxn+BgjmXvp6gdj/zz0I0deEN1MXC
	VaMSCf3eohzDbPJ47lQ+2xkCf6CA79lJ1krUsfuaQ5hlyoAM+H6wGtAtRGUnoYBW3wPf7m
	Cfa2lAZ/KFsJt8qhD2+9U8zSXKzimqSdNtKmT3JFY2SY72GNgfVGU1IrQwIPg+qyA4Pscl
	y7jzEwSmCx8vjABfs+6SM7o8DUBj6gkvySsTFDJP1ftFdsCQxxUH6WFc24oXUA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1794517489;
	b=LTt2iSm1JbODNpX4huvzAYLb/04YXj6EYZHFtRPKfX4WW95nwqQuV1P8f9J8VZKCEMHh6n
	NPxY7AMq+040l5Q4Z+WMgOvVUFWk7runbQBihvJZXAbeJNLek45eOGAunmTAi1t7DX2bCB
	Fxxm9cJAA9zd7QiYN3XmLURFWbJm0SZFdZ2nrvyEpLixNQYRxWcfzM7paIF8rRm+3zIi1Z
	W+MlOJtzd1wFR86IWleiRILNfSO9NB8KujH/N2wfPkkI8C9Ltmq+auYNOUsqraN0uG/mpr
	7BZ8BwHGEP7l0ZG9GZgQCfo6hbnjOFxScL/bV4RD4LiL5UOc51Pc/dVsxnKO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1794517489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O5gco7lHoYOygwHEP3RxfzTMIYTl8gyDFQ4fgofww90=;
	b=hLJ8ueaLm+Uq6EcSySnN8dUqucLtbCVfn0lI+SN7MNS6kBs2S5RJpSv89lteoTCymet1CU
	y2uAjN2p5hibHES0CU5ybv+ccOG+lConQcyKi3dW258kxoifMwibA/yzY4qdFMSVvps56Q
	xAXVN9y8nDygMWHCrDa8vsq1YYvnjVoFpakgaM+PZR+xZoq4thSVmeL8JpbUMlokYIvCI3
	3xV5oaujKp8oToqqpEX6qp1jfoFtdpGX5KlcxEPtm1CgsMKYxYZ1YttWxp52TKVDxFnvRc
	L4OUvL9WO62NCnascCZMw+yyRcsggHacm2jC8Uo/OSi71P+wh0O3La6nRqf1Lg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 10CCC634C4E;
	Thu, 12 Nov 2026 23:04:48 +0200 (EET)
Date: Thu, 12 Nov 2026 23:04:47 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: mauriziocasciano7@gmail.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v10 02/15] media: ov8858: support 19.2 MHz clock and
 manual white balance
Message-ID: <avYp7y9Vvh2Oo5c6@valkosipuli.retiisi.eu>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
 <20261002-submission-media-yogabook-v10-b4-final-v10-2-817ec765b257@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-submission-media-yogabook-v10-b4-final-v10-2-817ec765b257@gmail.com>

Hi Maurizio,

On Fri, Oct 02, 2026 at 10:57:40AM +0200, Maurizio Casciano via B4 Relay wrote:
> From: Maurizio Casciano <mauriziocasciano7@gmail.com>
> 
> Support both 19.2 MHz and 24 MHz input clocks. Move the PLL and
> global-timing registers out of the common mode tables and select register
> settings for the detected revision, lane count, input clock and 360 MHz
> link frequency when starting the stream. Use the actual input-clock rate
> when calculating the reset delay.
> 
> Add standard red and blue balance controls for the sensor's manual white
> balance registers. V4L2 defines red and blue balance relative to green but
> does not define a standard green-balance control, so keep green at unity.
> Accumulate errors while programming all three channels.
> 
> The manual white-balance register definitions and programming follow
> Intel's GPL-2.0 OV5670 driver, so retain its 2017 Intel copyright notice.

Any others notices that should be added?

> 
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: LLM sparse

The Assisted-by: tags are no longer used, please remove them.

> ---
>  drivers/media/i2c/ov8858.c | 183 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 147 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> index 2a0e2b08b9aa..64532237e8b5 100644
> --- a/drivers/media/i2c/ov8858.c
> +++ b/drivers/media/i2c/ov8858.c

...

> @@ -1541,6 +1606,23 @@ static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
>  	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
>  }
>  
> +static int ov8858_set_mwb_gains(struct ov8858 *ov8858)
> +{
> +	int ret = 0;
> +
> +	ov8858_write(ov8858, OV8858_REG_MWB_RED_GAIN,
> +		     ov8858->red_balance->val, &ret);
> +	/*
> +	 * Green is the unity reference for the red and blue balance controls.
> +	 */

UAPI-wise this doesn't look great. There's a digital gain control, too, so
you can still control the entire digital gain. But the hardware has
per-component gains and in this case the (likely analogue TV inspired?)
UAPI limits this. A few other sensor drivers appear to be doing the same.

Cc Laurent, too.

> +	ov8858_write(ov8858, OV8858_REG_MWB_GREEN_GAIN,
> +		     OV8858_MWB_GAIN_DEFAULT, &ret);
> +	ov8858_write(ov8858, OV8858_REG_MWB_BLUE_GAIN,
> +		     ov8858->blue_balance->val, &ret);
> +
> +	return ret;
> +}
> +
>  static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct ov8858 *ov8858 = container_of(ctrl->handler,
> @@ -1589,6 +1671,10 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_DIGITAL_GAIN:
>  		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
>  		break;
> +	case V4L2_CID_RED_BALANCE:
> +	case V4L2_CID_BLUE_BALANCE:
> +		ret = ov8858_set_mwb_gains(ov8858);
> +		break;
>  	case V4L2_CID_VBLANK:
>  		ret = ov8858_write(ov8858, OV8858_REG_VTS,
>  				   ctrl->val + format->height, NULL);
> @@ -1623,9 +1709,6 @@ static int ov8858_power_on(struct ov8858 *ov8858)
>  	unsigned long delay_us;
>  	int ret;
>  
> -	if (clk_get_rate(ov8858->xvclk) != OV8858_XVCLK_FREQ)
> -		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
> -
>  	ret = clk_prepare_enable(ov8858->xvclk);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to enable xvclk\n");
> @@ -1644,7 +1727,7 @@ static int ov8858_power_on(struct ov8858 *ov8858)
>  	 * transaction, but a double sleep between the release of gpios
>  	 * helps with sporadic failures observed at probe time.
>  	 */
> -	delay_us = DIV_ROUND_UP(8192, OV8858_XVCLK_FREQ / 1000 / 1000);
> +	delay_us = DIV_ROUND_UP(8192, ov8858->xvclk_rate / HZ_PER_MHZ);
>  
>  	gpiod_set_value_cansleep(ov8858->reset_gpio, 0);
>  	fsleep(delay_us);
> @@ -1710,7 +1793,7 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
>  	u32 h_blank;
>  	int ret;
>  
> -	ret = v4l2_ctrl_handler_init(handler, 10);
> +	ret = v4l2_ctrl_handler_init(handler, 12);
>  	if (ret)
>  		return ret;
>  
> @@ -1752,6 +1835,19 @@ static int ov8858_init_ctrls(struct ov8858 *ov8858)
>  			  OV8858_LONG_DIGIGAIN_STEP,
>  			  OV8858_LONG_DIGIGAIN_DEFAULT);
>  
> +	ov8858->red_balance =
> +		v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +				  V4L2_CID_RED_BALANCE,
> +				  OV8858_MWB_GAIN_MIN, OV8858_MWB_GAIN_MAX,
> +				  OV8858_MWB_GAIN_STEP,
> +				  OV8858_MWB_GAIN_DEFAULT);
> +	ov8858->blue_balance =
> +		v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> +				  V4L2_CID_BLUE_BALANCE,
> +				  OV8858_MWB_GAIN_MIN, OV8858_MWB_GAIN_MAX,
> +				  OV8858_MWB_GAIN_STEP,
> +				  OV8858_MWB_GAIN_DEFAULT);
> +
>  	v4l2_ctrl_new_std_menu_items(handler, &ov8858_ctrl_ops,
>  				     V4L2_CID_TEST_PATTERN,
>  				     ARRAY_SIZE(ov8858_test_pattern_menu) - 1,
> @@ -1805,15 +1901,20 @@ static int ov8858_check_sensor_id(struct ov8858 *ov8858)
>  
>  	if (id == OV8858_R2A) {
>  		/* R2A supports 2 and 4 lanes modes. */
> -		ov8858->global_regs = ov8858->num_lanes == 4
> -				    ? ov8858_global_regs_r2a_4lane
> -				    : ov8858_global_regs_r2a_2lane;
> +		if (ov8858->num_lanes == 4) {
> +			ov8858->global_regs = ov8858_global_regs_r2a_4lane;
> +			ov8858->xvclk_regs = ov8858_24mhz_360mhz_r2a_4lane;
> +		} else {
> +			ov8858->global_regs = ov8858_global_regs_r2a_2lane;
> +			ov8858->xvclk_regs = ov8858_24mhz_360mhz_r2a_2lane;
> +		}
>  	} else if (ov8858->num_lanes == 2) {
>  		/*
>  		 * R1A only supports 2 lanes mode and it's only partially
>  		 * supported.
>  		 */
>  		ov8858->global_regs = ov8858_global_regs_r1a;
> +		ov8858->xvclk_regs = ov8858_24mhz_360mhz_r1a_2lane;
>  		dev_warn(&client->dev, "R1A may not work well!\n");
>  	} else {
>  		dev_err(&client->dev,
> @@ -1821,6 +1922,9 @@ static int ov8858_check_sensor_id(struct ov8858 *ov8858)
>  		return -EINVAL;
>  	}
>  
> +	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ)
> +		ov8858->xvclk_regs = ov8858_19_2mhz_360mhz;

The 24 MHz configurations are lane number (and variant) dependent. Isn't
that applying to 19,2 MHz? If not, why?

> +
>  	return 0;
>  }
>  
> @@ -1888,6 +1992,13 @@ static int ov8858_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
>  				     "Failed to get xvclk\n");
>  
> +	ov8858->xvclk_rate = clk_get_rate(ov8858->xvclk);
> +	if (ov8858->xvclk_rate != OV8858_XVCLK_FREQ_19_2MHZ &&
> +	    ov8858->xvclk_rate != OV8858_XVCLK_FREQ_24MHZ)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Unsupported xvclk rate %lu Hz\n",
> +				     ov8858->xvclk_rate);
> +
>  	ov8858->reset_gpio = devm_gpiod_get_optional(dev, "reset",
>  						     GPIOD_OUT_HIGH);
>  	if (IS_ERR(ov8858->reset_gpio))
> 

-- 
Regards,

Sakari Ailus
