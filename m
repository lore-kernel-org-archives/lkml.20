Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622827;
	b=gnscnCeRUtc87vjCw4Ze7VcUEti8hmYMYFRBF76q5XNXNh7JQJP0zRQ1oXP3d7+lLwhr
	 WulYBSHrE5+dRGHoxLh6exn2jyzM87klAQWrdZzpOeVOlwZ5AtI3Km6F0xecZLJRcNBCh
	 Fwj5/v7JwdH1w8KzBz/rjseccKON06kB6CTL3qvkBYV3zXOJLmhRsh67C9VpRSxp90y4Z
	 3o4vrZEECu6zlUkDnOlRFJNoJ7QgVRBXDDCP53bSa+q/efv69B044aqZWELT05uHfH70c
	 spkFlYPlpyMvjaxneamOA86/iNtUXe9kEuOLxTVU36ixOiKTlcr5VKLvLs2hTYeQ7vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622827;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KNpObkuBl2jxBGzx+klnoZYXHcDTT3YLeykb5RLLCJE=;
	b=GQtG16aNb/sLIiq61BtSyM63Tg5dGChbuPMKtZzkH3LfiIBRmPVodq83tMrTNUV7y+gt
	 htuLatmxFIZWBdxDBxA6kqiTJGrM9mfHxRYzaTtK3D/3iB+nwcfKTf6ltuxzPcR76LYim
	 rwYtNVuu5YcF9k91uN+xH/7UmjFdwg0+53gzvokJGc5IUUY/yvSV1v/+RQY5Uhe1B1Zvl
	 Kp4774fczmpV/UIuYvE7NwcsXZ1ytLYVk+RyGBHGslREDzZnSIiiqcEV8K4eFjtG53Thy
	 9zKSFbX7YR8EItPCkLlSU8CPCEVWYWH3K03wfYwIWC7CoxiRwUQJnXMuneVk0NdKCxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RBd1wnox;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B1F606A324;
	Mon,  2 Nov 2026 12:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B1F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RBd1wnox
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793622826; x=1825158826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yepd+tvmDkiDLTp+5GcMC3p+4dlbG/hoWgIaEkJprEc=;
  b=RBd1wnoxrFySEp/pEEULxU916zQk14AxIAOoiKwhlblH+ozEnm//0TFX
   qeR3j0D9SREgt2NJ971WUiHPayDfSQPwWXBW3qC4zpwV+YPLZyoON4AKg
   rWrBjZXjmtgVL65wwSIYyLRTN/PcUtSZXFqmf37UBKAXao/RwafWanErA
   legN+h6XypG8MF9+8MfSDuqYwsRIoDLJWjuVZ3EHUKdXBO0fo/sRY4ZFj
   Sl5cba7t/ARlctkmXbkoDy5lAN72rPvf7TltOY/+p2AEVEjav8M7Kipp9
   ZOzOoDExzzYuXsCqiPfBvCb8sJvdxW3u3AXzyI7d2ocZaJ/fKchgeJxWn
   w==;
X-CSE-ConnectionGUID: iIJ6t1gcQceutAszcrEbUw==
X-CSE-MsgGUID: 6ZQbKf8JS22y6eAjqT7hCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2218493"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2218493"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 04:33:45 -0800
X-CSE-ConnectionGUID: OlPDVIrRTJ+Qg7vqrwfq0Q==
X-CSE-MsgGUID: Z4lSoMjqS9moHJ/eoYwKSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5960872"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 04:33:40 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 23492121B6E;
	Mon, 02 Nov 2026 14:33:50 +0200 (EET)
Date: Mon, 2 Nov 2026 14:33:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: jai.luthra@ideasonboard.com,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/15] media: i2c: os05b10: Add H/V flip support
Message-ID: <auiDLo73gQgslsvL@kekkonen.localdomain>
References: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
 <20261030104806.1223991-10-tarang.raval@siliconsignals.io>
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
In-Reply-To: <20261030104806.1223991-10-tarang.raval@siliconsignals.io>

Hi Tarang,

On Fri, Oct 30, 2026 at 04:17:58PM +0530, Tarang Raval wrote:
> Add HFLIP and VFLIP controls, lock them while streaming, and update
> the reported Bayer format based on the flip state.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/os05b10.c | 59 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 55 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> index 14046f1c9324..4b87ef60a2a7 100644
> --- a/drivers/media/i2c/os05b10.c
> +++ b/drivers/media/i2c/os05b10.c
> @@ -92,6 +92,10 @@
>  #define OS05B10_MIRROR			BIT(3)
>  #define OS05B10_FLIP			GENMASK(5, 4)
>  
> +#define OS05B10_REG_ANALOG_FLIP	CCI_REG8(0x3716)
> +#define OS05B10_FLIP_ENABLE		0x04
> +#define OS05B10_FLIP_DISABLE		0x24

I'd use the register name as prefix here, omitting "_REG".

0x4 has nothing to do with flip configuration, so I'd just use another
macro for that, e.g. OS05B10_ANALOG_FLIP_MAGIC, unless we know more about
that bit.

> +
>  #define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
>  
>  #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
> @@ -227,7 +231,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
>  	{ CCI_REG8(0x370f), 0x1c },
>  	{ CCI_REG8(0x3710), 0x00 },
>  	{ CCI_REG8(0x3713), 0x00 },
> -	{ CCI_REG8(0x3716), 0x24 },
>  	{ CCI_REG8(0x371a), 0x1e },
>  	{ CCI_REG8(0x3724), 0x09 },
>  	{ CCI_REG8(0x3725), 0xb2 },
> @@ -459,6 +462,8 @@ struct os05b10 {
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *vflip;
> +	struct v4l2_ctrl *hflip;
>  
>  	u32 link_freq_index;
>  	u32 data_lanes;
> @@ -507,6 +512,16 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
>  	return container_of_const(sd, struct os05b10, sd);
>  };
>  
> +static u32 os05b10_get_format_code(struct os05b10 *os05b10)
> +{
> +	static const u32 codes[2][2] = {
> +		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
> +		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
> +	};
> +
> +	return codes[os05b10->vflip->val][os05b10->hflip->val];

Note that accessing the control values requires holding the handler's mutex
here. That's not the case when called from enum_mbus_code() I think.

> +}
> +
>  static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
> @@ -550,6 +565,25 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
>  				ctrl->val, NULL);
>  		break;
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		ret = 0;
> +		cci_update_bits(os05b10->cci, OS05B10_REG_FORMAT1,
> +				OS05B10_MIRROR | OS05B10_FLIP,
> +				(!os05b10->hflip->val ?
> +				 OS05B10_MIRROR : 0) |
> +				(os05b10->vflip->val ?
> +				 OS05B10_FLIP : 0), &ret);
> +
> +		cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,
> +			 (os05b10->vflip->val == 1) ?
> +			 OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISABLE,
> +			 &ret);

Indentation. The last line can also be unwrapped.

> +		if (ret)
> +			break;
> +
> +		fmt->code = os05b10_get_format_code(os05b10);
> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -564,10 +598,12 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *sd_state,
>  				  struct v4l2_subdev_mbus_code_enum *code)
>  {
> +	struct os05b10 *os05b10 = to_os05b10(sd);
> +
>  	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
>  		return -EINVAL;
>  
> -	code->code = os05b10_mbus_codes[code->index];
> +	code->code = os05b10_get_format_code(os05b10);

If this is the case, then any non-zero value of code->index should yield
-EINVAL.

>  
>  	return 0;
>  }
> @@ -708,6 +744,9 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		goto err_rpm_put;
>  
> +	__v4l2_ctrl_grab(os05b10->vflip, true);
> +	__v4l2_ctrl_grab(os05b10->hflip, true);
> +
>  	return 0;
>  
>  err_rpm_put:
> @@ -728,6 +767,9 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		dev_err(os05b10->dev, "failed to set stream off\n");
>  
> +	__v4l2_ctrl_grab(os05b10->vflip, false);
> +	__v4l2_ctrl_grab(os05b10->hflip, false);
> +
>  	pm_runtime_put_autosuspend(os05b10->dev);
>  
>  	return 0;
> @@ -736,6 +778,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,
>  static int os05b10_init_state(struct v4l2_subdev *sd,
>  			      struct v4l2_subdev_state *state)
>  {
> +	struct os05b10 *os05b10 = to_os05b10(sd);
>  	struct v4l2_mbus_framefmt *format;
>  	const struct os05b10_mode *mode;
>  
> @@ -743,7 +786,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
>  	format = v4l2_subdev_state_get_format(state, 0);
>  
>  	mode = &supported_modes_10bit[0];
> -	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	format->code = os05b10_get_format_code(os05b10);
>  
>  	/* Update image pad formate */
>  	format->width = mode->width;
> @@ -929,7 +972,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>  	        return ret;
>  
>  	ctrl_hdlr = &os05b10->handler;
> -	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
> +	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
>  
>  	pixel_rate = os05b10_pixel_rate(os05b10, mode);
>  	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
> @@ -967,6 +1010,12 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>  	                  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
>  	                  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
>  
> +	os05b10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
> +					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> +
> +	os05b10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
> +					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
>  	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
>  					      &props);
>  	if (ret) {
> @@ -976,6 +1025,8 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
>  
>  	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  	os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	os05b10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +	os05b10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>  
>  	os05b10->sd.ctrl_handler = ctrl_hdlr;
>  

-- 
Regards,

Sakari Ailus
