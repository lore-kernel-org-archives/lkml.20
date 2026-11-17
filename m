Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915005;
	b=i704YaUx/WcfHYAx7GmNqO1PoOjTChae7XJWcAsUDcvRIUX18EYFc0uguZm6o8rJAJmM
	 mxsb6ma2E+fHb/752wuCQbRRdVBeX3M4RLOk/Qefb3JOOQO2inLJJh128G+STpRcPryMb
	 iGHClva0Yq4Da8+8TZS3GMjnMeTD0yyKkkUZQcMEHbkunsVlP7tILuOxTzoDuHtIjUxo5
	 k1J68WXONDHR4rs5JqUXNiLQbH+5sWi1xrb3DtLcx1vcBXYq+WPl2BgtkcA689Hv1WxKO
	 siEmyrcJYke4GjAnGflfvzXqqTENyAL1y4hi/LbqJ0fMEryJRl6Gqp6fGX+8ghwaXqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915005;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=vHZykofTSxhR4YbIKE9YExJjwIdIHTlsyFCFWFMlm+E=;
	b=jmiSgXVZiveY25t5ob86HKOuzAbJtW6RcGPYQumPMJSgm6q98gxnriVfroQ1Ev1BiQza
	 Eu4VDmsDEy6SAqKmZTOlpatl6lGtBeh47ddOxjB3LnAt8a87ud+jUU9Xr/iCc/U+PMN0i
	 fjBK07oG3r4qg3QQmQ1NbPMBwF+C1lh+MjXqsZklSTdIxd2g8FVrJ6k0VxSKeV1mj3r6R
	 o+EmpYXg4sOHTGSce2AAZfIvJ+yMYbYkb4fYHbg56AD8uXP9o4hs5IT98WWrBT3Cg2bzA
	 fGiL2F25scwI6eCvbP8Gf1BM08jV6Wa/Mx4IvVAvWvBO83rrlmtRwdJJJfusKnjOm7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dYFzKf4H;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6AE606A323;
	Tue, 17 Nov 2026 11:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA6AE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dYFzKf4H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794915004; x=1826451004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NDcbKhzY9YnVCiHdnj2P4vzxB+u59wlKnnupOi68fhU=;
  b=dYFzKf4HipbjIDfMBselaOF777asATJbQh/FZ6qD1+kTmvVqV1AxWeP9
   mY+UYy30j5bbLsZ2O2q5O6tcHzrf/2QLkz20EKNyIiVyV+oyluLHpXxlT
   D941Ep6t02ZTGA4TSdUXTc2hHr1xdam1dhmdPzip2UbGShUtja2Hk/oVp
   fQUxGbRJ+bq5UVTbUymbubL5AzHuBuqVi6aHvhTH+u1obJamIDRCD3T9l
   b55nPZacNtqOVl9MWtRpdeTFEtaHshCjZKvRPUG0uLxk9lrp3KIJa0Fzt
   YJkp7u0Ghm9JB/MYWiWF0tsgh6dpPTCf4ZgcYEY0KsumesK5cR7ymZ4KZ
   w==;
X-CSE-ConnectionGUID: 73QSjBdoRLCpxK4sJG3BjQ==
X-CSE-MsgGUID: GD+5Oox7RBuZ+eGfYa17iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3720539"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3720539"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 03:30:03 -0800
X-CSE-ConnectionGUID: S7MUGMn7RKaZVqLON9l39Q==
X-CSE-MsgGUID: hdPysI59S2KtJZzLW6IwNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9954420"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2026 03:30:01 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id C1D9D99; Tue, 17 Nov 2026 12:29:59 +0100 (CET)
Date: Tue, 17 Nov 2026 12:29:59 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hex Lindqvist <hex@freenixos.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ajay Gupta <ajayg@nvidia.com>, Wayne Chang <waynec@nvidia.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi_ccg: Don't probe GPUs without a CCGx
 controller
Message-ID: <avw6tzJhChN6hcwQ@black.igk.intel.com>
References: <20261114013243.1240146-1-hex@freenixos.com>
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
In-Reply-To: <20261114013243.1240146-1-hex@freenixos.com>

On Fri, Nov 13, 2026 at 05:32:43PM -0800, Hex Lindqvist wrote:
> The NVIDIA GPU I2C driver adds a ccgx-ucsi client on every GPU, but
> GPUs without a USB Type-C port, such as the GTX 1660 Ti, have no CCGx
> controller, and every probe fails with:
> 
>   ucsi_ccg 4-0008: i2c_transfer failed -110
>   ucsi_ccg 4-0008: ucsi_ccg_init failed - -110
>   ucsi_ccg 4-0008: probe with driver ucsi_ccg failed with error -110
> 
> Fix this by reading DEVICE_MODE first for clients created by the GPU
> driver, and returning -ENODEV if the read times out. Controllers
> described by firmware are not affected.
> 
> Tested on an ASUS TUF Gaming A17 (FA706IU, GTX 1660 Ti): the three
> errors are gone, probe takes the same time (one timed-out transfer, as
> before), and the platform's own UCSI port and suspend/resume are not
> affected.
> 
> Assisted by LLM.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206653
> Link: https://lore.kernel.org/all/20200922054338.GA588161@kroah.com/
> Signed-off-by: Hex Lindqvist <hex@freenixos.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> The nvidia-gpu timeout line is fixed by a separate patch to linux-i2c.
> 
> Not tested on a GPU with a CCGx controller; there this adds one
> DEVICE_MODE read before ucsi_ccg_init().
> 
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 3f12db95c7f4..0f082952272e 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -357,6 +357,31 @@ static int ccg_op_region_update(struct ucsi_ccg *uc, u32 cci)
>  	return 0;
>  }
>  
> +/* GPUs without a USB Type-C port have no CCGx; transfers to it time out. */
> +static bool ccg_is_present(struct ucsi_ccg *uc)
> +{
> +	struct i2c_client *client = uc->client;
> +	unsigned char buf[2];
> +	u8 data;
> +	struct i2c_msg msgs[] = {
> +		{
> +			.addr	= client->addr,
> +			.len	= sizeof(buf),
> +			.buf	= buf,
> +		},
> +		{
> +			.addr	= client->addr,
> +			.flags	= I2C_M_RD,
> +			.len	= sizeof(data),
> +			.buf	= &data,
> +		},
> +	};
> +
> +	put_unaligned_le16(CCGX_RAB_DEVICE_MODE, buf);
> +
> +	return i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs)) != -ETIMEDOUT;
> +}
> +
>  static int ucsi_ccg_init(struct ucsi_ccg *uc)
>  {
>  	unsigned int count = 10;
> @@ -1488,6 +1513,11 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>  			dev_err(uc->dev, "failed to get FW build information\n");
>  	}
>  
> +	if (uc->fw_build == CCG_FW_BUILD_NVIDIA && !ccg_is_present(uc)) {
> +		dev_dbg(dev, "no CCGx controller on this GPU\n");
> +		return -ENODEV;
> +	}
> +
>  	/* reset ccg device and initialize ucsi */
>  	status = ucsi_ccg_init(uc);
>  	if (status < 0) {
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.56.0

-- 
heikki
