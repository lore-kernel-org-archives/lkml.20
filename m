Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F57B4A0149;
	Tue,  8 Sep 2026 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862476; cv=none; b=OTkxl5XAUAWGORWffPcwxKUwMH2+Blxst3WaQexzyANCwAqe5zvdauwh0b0A0L6wVL9+c2Fjgv0Ck5KJ0g9h/FMqjsybL+x9K7gpXS6uI8z1FnAet2zCTs9wYuHkJSLeIjxqp5DTwG8GIE2HWH/8Ji4IvqcTQBuZhR4I5OJYPeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862476; c=relaxed/simple;
	bh=VYi2TCEjycmy2/DrEcEyOVcfD2V+FfYWuaXq56bSXmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mktFQ/kRT1fM9u3XzZRwOS+PLov2EugfcGZLDCSzwa95UeE9G5mcclTKE+kRXOz9SOy0+1qcu783X3n9pKc9AihqhPjMJiJG52ib3nNIZj3ps36QnKzm5nGyrLJhYzeYG3xFn6U2LRALEfv54iz5FS02xVOUjx3C0Nc/rRq3ET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9ZX/YRw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9ZX/YRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788862474; x=1820398474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYi2TCEjycmy2/DrEcEyOVcfD2V+FfYWuaXq56bSXmw=;
  b=J9ZX/YRw79GQTR7i6rBRSxlLxSKklSyofmscz8/f11Vk4wOFZ9ypu/c5
   s9SDl0CMe1RH/4cMb1Gg+8rXWH2n9Rs/1moF0QnWRhMEJyTuC8O4bL6I2
   ldEpEpEySXY6pmOQt21UAABpYAJiOBoYpa4LFyE/O6Zr6eih/o/YJVE/w
   HgU++R2NvTIj0+CiB1S66Lu/Wec6fC3PNTM4zXQmRfqgfgyI4zA+Ow7Eo
   l7X1gUgI3NSMVhouuM/zSiLn4WJC5MqhbBqKk22YAZQRV+IREOvNnio3j
   fFOwKpFPPwxtnVSytvOoiRAIAkXt50vqglYkysiZ2UFEVrk26VnOv67k3
   Q==;
X-CSE-ConnectionGUID: lxfX4UlmT6WuYWeGgwcOuw==
X-CSE-MsgGUID: i2K76ZxqSG2xxjlNhFS9xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89277957"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89277957"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:14:33 -0700
X-CSE-ConnectionGUID: 4VZ6Rsk9TcOBvPakOF5K1A==
X-CSE-MsgGUID: rW04QBUTRmu+82MkdiYQKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269627931"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:14:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B769311F7F5;
	Tue, 08 Sep 2026 13:14:32 +0300 (EEST)
Date: Tue, 8 Sep 2026 13:14:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
Cc: hverkuil+cisco@kernel.org, mehdi.djait@linux.intel.com,
	u.kleine-koenig@baylibre.com, laurent.pinchart@ideasonboard.com,
	jacopo@jmondi.org, p.zabel@pengutronix.de,
	ezequiel@vanguardiasur.com.ar, mchehab+samsung@kernel.org,
	festevam@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5645: Fix CSI-2 CRC errors on RK3576 after
 init sequence
Message-ID: <ap_gCH1AnciFIEoa@kekkonen.localdomain>
References: <20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826085432.1482348-1-xiaoleiwangxiaolei@gmail.com>

Hi Xiaolei,

On Wed, Aug 26, 2026 at 08:54:32AM +0000, Xiaolei Wang wrote:
> On the RK3576 platform, after ov5645_global_init_setting completes and
> before stream on, the CSI host reports a high rate of CRC errors:
> 
>   MIPI_CSI2 ERR1:0x1000000 (crc,vc: 0)
> 
> These errors occur exclusively in the window between init completion and
> stream on. Once preview starts and the sensor outputs valid HS data, no
> further CRC errors are observed.
> 
> Commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") reworked
> the power sequence to properly enter LP-11 during power-up. As part of
> this change, the SYSTEM_CTRL0_STOP (0x42) write in s_power() was replaced
> with usleep_range(500, 1000), leaving the sensor in wake state (0x3008 =
> 0x02) from init through to s_stream. Reverting this commit resolves the
> CRC errors, confirming it as the triggering change.
> 
> Restore the power-down state after init by appending { 0x3008, 0x42 } to
> the end of ov5645_global_init_setting[]. This powers down the sensor core
> after MIPI configuration is complete, while keeping the MIPI PHY active in
> LP-11. The sensor is then woken up only at s_stream time.
> 
> This preserves all LP-11 compliance improvements from
> commit 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence") while
> eliminating the CRC errors on RK3576.
> 
> Fixes: 092e8eb90a7d ("media: i2c: ov5645: Fix power sequence")
> Signed-off-by: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
> ---
>  drivers/media/i2c/ov5645.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index c772ef6e51d2..be85e0155b81 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -351,7 +351,8 @@ static const struct reg_value ov5645_global_init_setting[] = {
>  	{ 0x3008, 0x02 },
>  	{ OV5645_IO_MIPI_CTRL00, 0x40 },
>  	{ OV5645_MIPI_CTRL00, 0x24 },
> -	{ OV5645_PAD_OUTPUT00, 0x70 }
> +	{ OV5645_PAD_OUTPUT00, 0x70 },
> +	{ 0x3008, 0x42 }

Is the earlier write of 0x3008 still appropriate?

>  };
>  
>  static const struct reg_value ov5645_setting_sxga[] = {

-- 
Sakari Ailus
