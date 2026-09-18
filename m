Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9363ABD8F;
	Fri, 18 Sep 2026 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726404; cv=none; b=tetQGybWh6rC20idHuuVh/RYyk6n2LraAEMBttaugAlIuuuXZjHrEEKDwfuMWftMrE44UXYmKCuhsS+jybz4vbjg+SgHPIrJK+EwoYs2Wl+Q/Vho/b50Lakmr1XPchkQYT1HbQxwMSjEGRjEwBgkK4XqWyc91MVyRpwVYZ6IPrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726404; c=relaxed/simple;
	bh=ap1Y8a3oUP+UBdrEdrwyOGF4XZzM4Il2098hOyizWJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqeJBh+94bkfoTm/mLb+sdCvjRMMcOIBov5B6crr74jc38YNzOnfxdzYw8llDZQwIvQcqwAImfDO9Sz9Q+ob6toDNJuA7N0f2q3f1YGG78vepGfS5GTirCBVGPJzzkUiiQM0a4MGmDsS6+wHFlA4l2Vpiho0tYeSIz1RTrPjMWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4wMKtX1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4wMKtX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789726402; x=1821262402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ap1Y8a3oUP+UBdrEdrwyOGF4XZzM4Il2098hOyizWJo=;
  b=V4wMKtX1tU2OhwAUzYdG/D4Ar5rqOti9ift5szJLUvcz5HK2TS167xOF
   wW6YFMyO32nJLGveCCWup/w72UrYaWtScuYz4W17WIDvMI6RHG2L4c1yk
   TikC5b69knxCviN54azTd/ApUsnnR+yltie4zylVWC9Nch/GUqy0YrBtl
   CGINLAR8o/41zPUwLaf+7uDn4Y8GR8w3Ty9YQIvXzeVZJlNKrX1xi+Y7U
   sjS3ziQCqWkW707nVy7syhy3G0WCnF8RX6C5gplZGUFan+JMXOiVA4Agj
   eBC1N4siphVuxwTVN1gsBAnEpAvPSmSMOJrQcwqaQAgftTqYOcqOUkwgG
   A==;
X-CSE-ConnectionGUID: rg+u4/pkRvC9OuonM3ga9A==
X-CSE-MsgGUID: vGPoBD2KSP+L2TWWPyZG1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77785751"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77785751"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 03:13:18 -0700
X-CSE-ConnectionGUID: EO9hDx4mTX+u/N0/fa2OXA==
X-CSE-MsgGUID: Eo0mktPNTa+RSo3R6CrlKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268074483"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.224])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 03:13:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 936B5121BB0;
	Fri, 18 Sep 2026 13:13:11 +0300 (EEST)
Date: Fri, 18 Sep 2026 13:13:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hermes.wu@ite.com.tw
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/21] media: i2c: it6625: fold subdev initialization
 into probe
Message-ID: <aq0Ot1n9q6f_AtpX@kekkonen.localdomain>
References: <20260918-upstream-it6625-follow-up-patch-v1-0-78d72d7886a5@ite.com.tw>
 <20260918-upstream-it6625-follow-up-patch-v1-19-78d72d7886a5@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-upstream-it6625-follow-up-patch-v1-19-78d72d7886a5@ite.com.tw>

Hi Hermes,

Overall the patches are nice, thank you. One comment below...

On Fri, Sep 18, 2026 at 04:57:34PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> it6625_init_v4l2_subdev() split subdev/control-handler/media-entity
> initialization out of probe(), which made error handling harder to
> follow across the two functions and forced probe() to normalize every
> init_v4l2_subdev() failure to -ENOMEM regardless of the real error
> (e.g. a media_entity_pads_init() failure was reported to the caller as
> -ENOMEM instead of its actual code).
> 
> Inline it into it6625_probe() so initialization and its unwind path
> are visible together, and propagate the real error from
> it6625_v4l2_init_controls() instead of replacing it. Cleanup behavior
> on each failure path is unchanged: it6625_v4l2_init_controls() already
> frees the control handler internally before returning an error, and a
> media_entity_pads_init() failure still frees it explicitly before
> unwinding, so neither path double-frees it through the later
> err_clean_hdl label.
> 
> State finalization (v4l2_subdev_init_finalize()/cleanup()) is
> deliberately left for a follow-up change, to keep this a pure
> restructuring and keep the locking-model transition atomic on its own.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/media/i2c/it6625.c | 46 +++++++++++++++++-----------------------------
>  1 file changed, 17 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
> index 40cd413e0ed49c118421ce3dec77bb2df08cf042..ec6aaa878471ff210264a35e4aa66dfb1e63ed3b 100644
> --- a/drivers/media/i2c/it6625.c
> +++ b/drivers/media/i2c/it6625.c
> @@ -2142,33 +2142,6 @@ static int it6625_parse_dt(struct it6625 *it6625)
>  	return it6625_parse_endpoint(it6625);
>  }
>  
> -static int it6625_init_v4l2_subdev(struct it6625 *it6625)
> -{
> -	struct v4l2_subdev *sd = &it6625->sd;
> -	int err;
> -
> -	sd->dev = it6625->dev;
> -
> -	v4l2_i2c_subdev_init(sd, it6625->i2c_client, &it6625_ops);
> -	sd->internal_ops = &it6625_internal_ops;
> -	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> -	if (it6625_v4l2_init_controls(sd)) {
> -		dev_err(it6625->dev, "Failed to initialize v4l2 controls");
> -		return -ENOMEM;
> -	}
> -
> -	it6625->pad.flags = MEDIA_PAD_FL_SOURCE;
> -	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> -	err = media_entity_pads_init(&sd->entity, 1, &it6625->pad);
> -	if (err < 0) {
> -		dev_err(it6625->dev, "%s %d err=%d", __func__, __LINE__, err);
> -		v4l2_ctrl_handler_free(sd->ctrl_handler);
> -		return err;
> -	}
> -
> -	return 0;
> -}
> -
>  static int it6625_check_device(struct it6625 *it6625)
>  {
>  	static const u8 chip_ids[][2] = {
> @@ -2254,9 +2227,24 @@ static int it6625_probe(struct i2c_client *client)
>  	}
>  
>  	sd = &it6625->sd;
> -	err = it6625_init_v4l2_subdev(it6625);
> -	if (err)
> +	v4l2_i2c_subdev_init(sd, it6625->i2c_client, &it6625_ops);
> +	sd->internal_ops = &it6625_internal_ops;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> +
> +	err = it6625_v4l2_init_controls(sd);
> +	if (err) {
> +		dev_err(it6625->dev, "failed to initialize v4l2 controls: %d", err);
>  		goto err_clean_work_queues;
> +	}
> +
> +	it6625->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	err = media_entity_pads_init(&sd->entity, 1, &it6625->pad);
> +	if (err < 0) {
> +		dev_err(it6625->dev, "%s %d err=%d", __func__, __LINE__, err);
> +		v4l2_ctrl_handler_free(sd->ctrl_handler);

Please add a new label instead of freeing the control handler here.

> +		goto err_clean_work_queues;
> +	}
>  
>  	err = v4l2_ctrl_handler_setup(sd->ctrl_handler);
>  	if (err)
> 

-- 
Kind regards,

Sakari Ailus
