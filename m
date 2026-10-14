Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0A79460;
	Wed, 14 Oct 2026 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977622; cv=none; b=EC1sTuwN5uXlQZPCOUTCgnJVQprJMFtEEzy4mvOxFfKYej+8wutt9ThKvr4dDDx6xqr9uBZiokKUAMu09trylKDCDB8tAknObitCcgbLQHkwfCnb0feDx9vUDHbmVrDI7oPsFsdyutNsuKF5aK63fF+slP7BqWP6ZAdXWiNkfHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977622; c=relaxed/simple;
	bh=tHNpA5vm1hV5Vdxxa9JWrHalQKkLQHjRt3V/whoWAyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SK2Kno9WCvSU734MBwyHKZYxv0Jz2Uho13zozIm8N5o7+QexCmqpucKd8iMum/VzXH9H6f9KOqoY92JlL22vckVKcFjcj9W+xUqiTsBa6Br1XgEx4xfcbIX4dRm1Tpry4Gy3T51rKuZGYZEJAzvooSQbhBfOUlPsaFXDnpEIG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6apc+eh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6apc+eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791977621; x=1823513621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tHNpA5vm1hV5Vdxxa9JWrHalQKkLQHjRt3V/whoWAyE=;
  b=M6apc+ehid1JLLwKuyzERqFHXLLyJZgeLKX0wxKu9NiAPC1M1I7olI4c
   w7crKpDerHX8Xv+Jo5WiRpeTl9kCjFXOcjdR4pKtd6oKEujpEo8bbFrq2
   cIe6mtwZll078ogsobvHI4MmqOZsghq+B3OiVwlyea6HxJ0AYMXyrrZtx
   jzBz+IkwUYMX+7deixdacmNaiwvaohWoMorLArF9y9d+4XB7TIhrHMn93
   eaHBWO9yeSej2cZ1Mar8qI7SvSfLhQKAqMo/nS7Q3sRTcDNeUvjtCH33z
   AIWiRBdJdwzmNPTyG5pOsDoIvc1FoaYzYjvZUOvHPc+tA344/dgo3C1Kx
   g==;
X-CSE-ConnectionGUID: nzfM6U6GQUq8+4TKfzp25A==
X-CSE-MsgGUID: ebwpjNWZQp66dOB1S5QHXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="619606"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="619606"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 04:33:37 -0700
X-CSE-ConnectionGUID: 2OiX4ZENRi+ntMyfpq4CEg==
X-CSE-MsgGUID: 8SUYL8wfQsOTN99XjIOSLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1322273"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.210])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 04:33:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B311311FBA6;
	Wed, 14 Oct 2026 14:33:38 +0300 (EEST)
Date: Wed, 14 Oct 2026 14:33:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: maxim-serdes: reduce
 max_des_update_streams() stack usage
Message-ID: <as9okp5GgBgc5Hlp@kekkonen.localdomain>
References: <20261014103201.859465-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014103201.859465-1-arnd@kernel.org>

Hi Arnd,

On Wed, Oct 14, 2026 at 12:31:33PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The function can break the stack frame warning limit in
> some configurations:
> 
> drivers/media/i2c/maxim-serdes/max_des.c: In function 'max_des_update_streams.isra':
> drivers/media/i2c/maxim-serdes/max_des.c:2550:1: error: the frame size of 1648 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
>  2550 | }
>       | ^
> 
> This is a simple large structure on the stack that shouldn't be
> there. Move both instances into a dynamically allocated structure
> instead.
> 
> Fixes: 22923bc4512c ("media: i2c: add Maxim GMSL2/3 deserializer framework")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/i2c/maxim-serdes/max_des.c | 28 ++++++++++++++----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c/maxim-serdes/max_des.c
> index 6b4ffd0e2415..4347ca24b5a1 100644
> --- a/drivers/media/i2c/maxim-serdes/max_des.c
> +++ b/drivers/media/i2c/maxim-serdes/max_des.c
> @@ -2164,7 +2164,7 @@ static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
>  					struct v4l2_mbus_frame_desc *fd,
>  					unsigned int pad)
>  {
> -	struct max_des_remap_context context = { 0 };
> +	struct max_des_remap_context __free(kfree) *context = kzalloc_obj(*context);
>  	struct max_des_priv *priv = sd_to_priv(sd);
>  	struct v4l2_subdev_route *route;
>  	int ret;
> @@ -2172,7 +2172,10 @@ static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
>  	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>  	fd->num_entries = 0;
>  
> -	ret = max_des_populate_remap_context(priv, &context, state);
> +	if (!context)
> +		return -ENOMEM;
> +
> +	ret = max_des_populate_remap_context(priv, context, state);
>  	if (ret)
>  		return ret;
>  
> @@ -2187,7 +2190,7 @@ static int max_des_get_frame_desc_state(struct v4l2_subdev *sd,
>  		if (ret)
>  			return ret;
>  
> -		ret = max_des_get_src_dst_vc_id(&context, hw.pipe->index, hw.phy->index,
> +		ret = max_des_get_src_dst_vc_id(context, hw.pipe->index, hw.phy->index,
>  						hw.entry.bus.csi2.vc, &dst_vc_id);
>  		if (ret)
>  			return ret;
> @@ -2450,18 +2453,21 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
>  				  u32 pad, u64 updated_streams_mask, bool enable)
>  {
>  	struct max_des_priv *priv = v4l2_get_subdevdata(sd);
> -	struct max_des_remap_context context = { 0 };
> +	struct max_des_remap_context *context __free(kfree) = kzalloc_obj(*context);

max_des_update_streams() is used in implementing disable_streams()
sub-device pad op where meaningful error handling isn't possible.

It seems there are other ways it can fail but this adds one more.

The bulk of the struct consists of the vc_ids_map unsigned int array, but
the maximum value VCs can have is 31. Also the size of unsigned long
depends on the architecture, so a fixed-size type would be probably a
better choice.

Also using bit fields instead of bool would save space.

>  	struct max_des_mode_context mode_context = { 0 };
>  	struct max_des *des = priv->des;
>  	unsigned int num_pads = max_des_num_pads(des);
>  	u64 *streams_masks;
>  	int ret;
>  
> -	ret = max_des_populate_remap_context(priv, &context, state);
> +	if (!context)
> +		return -ENOMEM;
> +
> +	ret = max_des_populate_remap_context(priv, context, state);
>  	if (ret)
>  		return ret;
>  
> -	ret = max_des_populate_mode_context(priv, &mode_context, state, context.mode);
> +	ret = max_des_populate_mode_context(priv, &mode_context, state, context->mode);
>  	if (ret)
>  		return ret;
>  
> @@ -2471,11 +2477,11 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		return ret;
>  
> -	ret = max_des_set_pipes_phy(priv, &context);
> +	ret = max_des_set_pipes_phy(priv, context);
>  	if (ret)
>  		goto err_free_streams_masks;
>  
> -	ret = max_des_set_tunnel(priv, &context);
> +	ret = max_des_set_tunnel(priv, context);
>  	if (ret)
>  		goto err_free_streams_masks;
>  
> @@ -2483,7 +2489,7 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		goto err_free_streams_masks;
>  
> -	ret = max_des_set_vc_remaps(priv, &context, state, streams_masks);
> +	ret = max_des_set_vc_remaps(priv, context, state, streams_masks);
>  	if (ret)
>  		goto err_free_streams_masks;
>  
> @@ -2502,7 +2508,7 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		goto err_revert_streams_disable;
>  
> -	ret = max_des_update_links(priv, &context, state, streams_masks);
> +	ret = max_des_update_links(priv, context, state, streams_masks);
>  	if (ret)
>  		goto err_revert_active_disable;
>  
> @@ -2533,7 +2539,7 @@ static int max_des_update_streams(struct v4l2_subdev *sd,
>  	max_des_update_tpg(priv, state, priv->streams_masks);
>  
>  err_revert_links_update:
> -	max_des_update_links(priv, &context, state, priv->streams_masks);
> +	max_des_update_links(priv, context, state, priv->streams_masks);
>  
>  err_revert_active_disable:
>  	max_des_update_active(priv, priv->streams_masks, true);
> 

-- 
Regards,

Sakari Ailus
