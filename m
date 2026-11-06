Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987585;
	b=btjiYHVI8f8LZb53npm4UZK3QJU3st7CK6huQY1rG13g7umbahEo1Eg1UtZT3PwOSJwi
	 pJfgU/XPBNWv1AHMhj48CnL6Yl8Rd84XdduHfGItciG/6g0wgmwDBMhISdIypKkKAwCl8
	 Q4wZdDW7BzVrtOfLk7dIlkSL/skTvsZ3JnbIYBDTxb05EKIU5ir8OglROwikK+Ge5Mo5k
	 4GYllOALF6p4ThDw1bkJvbbMuapjyxIiZLI3STDQt0eceb3C13UIImsmJJvaRH52J3ck7
	 peQ/gGLzY62awzTWlDK3RutPRNasPMoGVkxeHp4u3YVYH286wQs5i+lZrJI5EeM+c1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987585;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=W4OAvocE0qlA1Amupm0niVySJp2DlanCzEnVSkIuQO4=;
	b=A5E+8Z2IxSW43rohasXfezdB+2RzH9lMBLxIX+/ntHzUPm1IL1C2bKcRtAafFdcHgo4r
	 N6jStde7Z7lB2IyRMDH4Er2LLsNY/MGG1T2k0jrx6DIUliUxXTOzbtOMIjAxJKvGluMif
	 nsqtGkokk0Besd/uu36qqBZrO2zvrj8ZWJcKNHA0YEwAl8Z3Kq5iRtcjqQZLYvojt1nD2
	 aYqljMGxhi7Qo8WzgwFKs5Il8egGprnMmora+SX1WQGm7VirDrxT9cpj97cEJWlXzYOot
	 y5njYJiTH3oxxwhbDNzjZ13we7eUWvmj2BiY3PZVGgZ7S/DDzr6q73YXvoJ06LYLH8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XaNYbUWW;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F858606A330;
	Fri,  6 Nov 2026 17:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F858606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XaNYbUWW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793987583; x=1825523583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KnNMY4VUEpn1u3zJYQ28134e/qRwjrvFXhXZISGo0Ls=;
  b=XaNYbUWWW2JDymefGDRUBAXe0jTS+hq+yPa3Zky10B8jenfCus6TgRtZ
   5NMKIsi+WovvIzfYVz4ChSDsCINgfw2ixWTbQsFsqDT3Egi5V8EptOSBY
   RSNepQBnXbxhn8WF+bfctTrMQ0bUICPOuyvKApcQLM9TxcDZQHA4l2tmZ
   K/jwynG9xDkdTgoGyc/sTuBuGjrGe12Hzu+95AKuBnPJiCBsOtz+4Ll8E
   9uSDy2RtA5TzWgka9W0QsEPFvEWZ7vSmAmV+VZz0BhrimGjHMNNZfA/me
   kPhsL0oazOUCgvnNBeZ+kmi6mrNeuO7uhoXGxfYJ1dVFKLPgenQl0uOF4
   w==;
X-CSE-ConnectionGUID: K9BM+C8SQuWXydUtyNIUyw==
X-CSE-MsgGUID: DTH/JOqfSECj9AZz5J0PBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2797061"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2797061"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 09:53:03 -0800
X-CSE-ConnectionGUID: AwL697vRTeaX8tm3371aug==
X-CSE-MsgGUID: pit4l2piQ7SuJujJJP8hog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="9098200"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 06 Nov 2026 09:53:00 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8D52299; Fri, 06 Nov 2026 18:52:58 +0100 (CET)
Date: Fri, 6 Nov 2026 18:52:58 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	romain.gantois@bootlin.com, gregkh@linuxfoundation.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] usb: typec: mux: tusb1046: support HPD_IN override
Message-ID: <au4T-tKDamfaTWuR@black.igk.intel.com>
References: <20261104074202.76712-1-blfizzyy@gmail.com>
 <20261104074202.76712-3-blfizzyy@gmail.com>
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
In-Reply-To: <20261104074202.76712-3-blfizzyy@gmail.com>

On Wed, Nov 04, 2026 at 01:12:02PM +0530, Ajit Singh wrote:
> For boards where HPD_IN is not asserted by hardware, software can
> force it high over I2C using the HPDIN_OVERRIDE bit in the General
> register (0x0A).
> 
> Add support for the optional ti,hpd-in-override property to force
> HPD_IN high when DisplayPort mode is selected. Clear the override
> when switching to USB or Safe mode, and preserve the existing
> bit value when the property is absent.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/tusb1046.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/tusb1046.c b/drivers/usb/typec/mux/tusb1046.c
> index 34ef81f75693..c21b1f8b9786 100644
> --- a/drivers/usb/typec/mux/tusb1046.c
> +++ b/drivers/usb/typec/mux/tusb1046.c
> @@ -21,6 +21,7 @@
>  /* General register bits */
>  #define TUSB1046_GENERAL_FLIPSEL BIT(2)
>  #define TUSB1046_GENERAL_CTLSEL  GENMASK(1, 0)
> +#define TUSB1046_GENERAL_HPDIN_OVERRIDE BIT(3)
>  
>  /* Mux modes */
>  #define TUSB1046_CTLSEL_DISABLED          0x0
> @@ -32,6 +33,7 @@ struct tusb1046_priv {
>  	struct i2c_client *client;
>  	struct typec_switch_dev *sw;
>  	struct typec_mux_dev *mux;
> +	bool hpdin_override;
>  
>  	/* Lock General register during accesses */
>  	struct mutex general_reg_lock;
> @@ -44,6 +46,7 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
>  	struct i2c_client *client = priv->client;
>  	struct device *dev = &client->dev;
>  	int mode, val, ret = 0;
> +	bool dp_active = false;
>  
>  	if (state->mode >= TYPEC_STATE_MODAL &&
>  	    state->alt->svid != USB_TYPEC_DP_SID)
> @@ -67,9 +70,11 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
>  	case TYPEC_DP_STATE_C:
>  	case TYPEC_DP_STATE_E:
>  		mode = TUSB1046_CTLSEL_4LANE_DP;
> +		dp_active = true;
>  		break;
>  	case TYPEC_DP_STATE_D:
>  		mode = TUSB1046_CTLSEL_USB3_AND_2LANE_DP;
> +		dp_active = true;
>  		break;
>  	case TYPEC_STATE_SAFE:
>  	default:
> @@ -80,6 +85,13 @@ static int tusb1046_mux_set(struct typec_mux_dev *mux,
>  	val &= ~TUSB1046_GENERAL_CTLSEL;
>  	val |= mode;
>  
> +	if (priv->hpdin_override) {
> +		if (dp_active)
> +			val |= TUSB1046_GENERAL_HPDIN_OVERRIDE;
> +		else
> +			val &= ~TUSB1046_GENERAL_HPDIN_OVERRIDE;
> +	}
> +
>  	ret = i2c_smbus_write_byte_data(client, TUSB1046_REG_GENERAL, val);
>  
>  out_unlock:
> @@ -131,6 +143,8 @@ static int tusb1046_i2c_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	priv->client = client;
> +	priv->hpdin_override =
> +		device_property_read_bool(dev, "ti,hpd-in-override");
>  
>  	mutex_init(&priv->general_reg_lock);
>  
> -- 
> 2.50.1 (Apple Git-155)
> 

-- 
heikki
