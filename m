Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4A63803C3;
	Wed,  2 Sep 2026 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334042; cv=none; b=rEwvO4k+A+b+WH05mTfOgBubMwF9/2cJ+ShLay6vK1jDlg0cM9ot9u89LqSrkfC3zABXDeeWVspLsMQm5STQSu4nGjDDqtUlvfpscW69+1W7yIHOO5a363PbOOWcIwtYSo0TveuUmbiQJHC6qrdbcmYNuySiCJGee/mRm+dj8jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334042; c=relaxed/simple;
	bh=0PePt6DHJxr/ZP2ZqbDDTpxOUJ+/a6mMlVgWOd7WjZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvGSL/5ZXirWG51PKBLlO+A2hJOSbT8p5lXrVcn2sIDAgHp16Db2sNjnezHn1RRsZcX+C564O9OdEpCjbHmdNPiDqtx6HF/upxlq97dDvLOwYypV1QoO2HbnlTKWi2UDu1DerWXDEFJmSgJ59hu6RY+BOrxJT6GrIYxbmxux/Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QcdmdXqE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QcdmdXqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788334038; x=1819870038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0PePt6DHJxr/ZP2ZqbDDTpxOUJ+/a6mMlVgWOd7WjZo=;
  b=QcdmdXqE68mNIUt+s46UqhDiSdRWLRS+bL+GEx0sFRklFfQUWuUHxAPr
   K0wtZaTP9jca7VhmXVhDL2espcT9vG88ifH+hyJL/tl34c1hCCtbnXNPo
   QPXzGl2V1nDYRx/KfRaaP+irq4Na3M9hKbCOKIu7TTgmMV1FUj63CDjDa
   oCXnlvHqkbI7t6VFfUs8SpjZx+iinBgrx9vI5lsoYyib2Da+Q8kxdxf10
   Rt92vstZx7XDkn9Jl6Opi1j0SHuA99SiTykeUCSsGSG0b2CYsVuyOUHNx
   wA2qGmZCinA+UKNAzHoGJFvecwSlGamYEwuJfs4EW1WrnAnN1lboj0OHZ
   Q==;
X-CSE-ConnectionGUID: 5YxNlNCqQUCQfG+QBBbzUA==
X-CSE-MsgGUID: ufceGEhiRkWRKrnChxW78A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99945586"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99945586"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 00:27:16 -0700
X-CSE-ConnectionGUID: szpfs2DnT3ChG0TbzMUK+A==
X-CSE-MsgGUID: qqbV+xLKSDOPWnKJMIe3lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="267555497"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 00:27:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F0D9D11F944;
	Wed, 02 Sep 2026 10:27:10 +0300 (EEST)
Date: Wed, 2 Sep 2026 10:27:10 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] media: i2c: ov5693: Gate the MIPI clock lane for
 non-continuous clock
Message-ID: <apfPzjJQeM48oM9m@kekkonen.localdomain>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260831181858.325109-4-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831181858.325109-4-fernandorimoli11@gmail.com>

Hi Fernando,

On Mon, Aug 31, 2026 at 08:18:55PM +0200, Fernando Rimoli wrote:
> The ov5693 never programs MIPI_CTRL00 (0x4800), leaving it at its 0x00
> power-on default, which lets the MIPI clock run freely. The IPU3 CSI-2
> receiver tolerates this, but the IPU6 receiver (e.g. on Microsoft
> Surface Pro 8/9 and Surface Go 4) fails to lock onto the link, so the
> sensor streams but capture times out with "stream stop time out" and no
> frames arrive.
> 
> Parse the "clock-noncontinuous" endpoint property (which sets the
> V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK flag) and, when it is present, gate
> the clock lane while idle at stream on. Bit 5 of MIPI_CTRL00 has the

I'd clip what's after the period above.

> same meaning here as in ov5647, which sets it for the same purpose.
> 
> Unlike ov5647, which owns the register across its own stream on and off,
> this is a read-modify-write of the single gate bit: the ov5693 otherwise
> never touches MIPI_CTRL00, so preserving the rest of it keeps every
> platform that does not ask for a non-continuous clock bit-for-bit as it
> was. No counterpart is needed at stream off, as the link is down by then
> and the register returns to its default when the sensor is powered off.
> 
> The "clock-noncontinuous" property is supplied by the ipu-bridge for the
> affected IPU6 variants in a subsequent patch.
> 
> Link: https://github.com/linux-surface/linux-surface/pull/2171
> Co-developed-by: Arsalan Naeem <naeemarsalan@gmail.com>
> Signed-off-by: Arsalan Naeem <naeemarsalan@gmail.com>
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> ---
>  drivers/media/i2c/ov5693.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 02236f3db..cedc6ea03 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -35,6 +35,11 @@
>  #define OV5693_STOP_STREAMING			0x00
>  #define OV5693_SW_RESET				0x01
>  
> +/* MIPI transmitter control */
> +#define OV5693_MIPI_CTRL00_REG			CCI_REG8(0x4800)
> +/* Gate the clock lane when there is no packet to transmit */
> +#define OV5693_MIPI_CTRL00_CLOCK_LANE_GATE	BIT(5)
> +
>  #define OV5693_REG_CHIP_ID			CCI_REG16(0x300a)
>  /* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
>  #define OV5693_CHIP_ID				0x5690
> @@ -144,6 +149,9 @@ struct ov5693_device {
>  	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
>  	struct clk *xvclk;
>  
> +	/* Gate the MIPI clock lane when idle (CSI-2 non-continuous clock) */
> +	bool clock_ncont;
> +
>  	struct ov5693_mode {
>  		struct v4l2_rect crop;
>  		struct v4l2_mbus_framefmt format;
> @@ -611,6 +619,19 @@ static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
>  {
>  	int ret = 0;
>  
> +	/*
> +	 * Gate the MIPI clock lane while idle if the CSI-2 link is configured
> +	 * for a non-continuous clock. Only that bit is touched, and only in
> +	 * that case, so the register keeps whatever the platform left in it
> +	 * and the clock stays free-running as before everywhere else. It
> +	 * needs no counterpart at stream off: the link is down by then, and
> +	 * the register returns to its default when the sensor is powered off.
> +	 */
> +	if (enable && ov5693->clock_ncont)
> +		cci_update_bits(ov5693->regmap, OV5693_MIPI_CTRL00_REG,
> +				OV5693_MIPI_CTRL00_CLOCK_LANE_GATE,
> +				OV5693_MIPI_CTRL00_CLOCK_LANE_GATE, &ret);
> +
>  	cci_write(ov5693->regmap, OV5693_SW_STREAM_REG,
>  		  enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
>  		  &ret);
> @@ -1259,6 +1280,9 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
>  		goto out_free_bus_cfg;
>  	}
>  
> +	ov5693->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
> +			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;

Could you also make the change to the DT bindings, adding "clock-noncontinuous:
true" there?

> +
>  out_free_bus_cfg:
>  	v4l2_fwnode_endpoint_free(&bus_cfg);
>  

-- 
Regards,

Sakari Ailus
