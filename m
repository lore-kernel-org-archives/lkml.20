Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179879;
	b=B0pHDex5JpKe4O6L6RYmVONxIg3iurxzUbo04EfD9RzjP9y/fZ3emO/D5RzWV5HdOzuG
	 03yCUnvoPQUJ4X6A3goaMIkqu7d+gWXrPEg516i0zSHmWBQIsqBgTKaI9aWUQvOBg9KUT
	 lX4HosbvIvsRx7yhSjfCdeMUB/Uo4IfxNJiP72O2KtC4gdi+8O+6U2GVDFYoLxVxKru6E
	 wJL/hRq2uLI4d1UtwGDyEMGaujNwsP4nN69aVkbc1dbRZPvx/1ZRGV7enhBVx1+2S0MGl
	 MpX5KDJcK3CS5hH+9C6NuqX4cT5lMb9YNv2qTzCmvNPATfDRgBeweFdiQfI38kt+cPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179879;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MPrCqYlx4mKG8Otra71wvhn03dGut2sTy6q8jov1oiE=;
	b=xVrSQgxh9M5sRxHfKtx/jTBbF6dMDks6eHEcTjx0TpS55cGidiyvBD3yUELCztGjcq9A
	 zh3h3VCxfb+YBiM1ksNcjKMFH/NyjxoAhfamWA4HnxKY9c6GgKnoheUKPrPp2Axb0Q/r3
	 wtdJSkHfj7G9XnAZJTxVpiJd8t1qPLjIFB9+wRK64qdjsrJjG2E1ZvV18kgBQR3t9Nf9m
	 M/CGMJB7N9fQ27mEEaEOq/sLQJi7fXcF/fKHkgC/TOaYmDLq0N6WVPI7nJRCHapj7MFYj
	 a6xVp+NOt0sgm6hHnOzkUWb5R2WkjtAvDaL9pv2X+WQr6aOEBG6ehqBMEdtY2ocvtCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=TQFwKZD1;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D9C606A31E;
	Wed, 28 Oct 2026 09:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D9C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=TQFwKZD1
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14ABC4F1;
	Wed, 28 Oct 2026 10:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793179744;
	bh=YiFY6VG/LOBOa7WvB2X52V1IBWHcEWEBv6LdPuf5Mww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TQFwKZD14pxORh3eSiYLQ7a3yAbtLWUjTcej43cl5dt5a4JJ5EDCkw8M98dVIuual
	 d9iQ4xnKrv+G4loQSutWUuFtv/MGq4G6KZ/mchQeVKkh+fKoHTzJCBN94vHjUZH88W
	 dX12qo2tvMNCo/x3bOFEE5ZbcUWQryM8Nzc9b9hc=
Message-ID: <30b2925b-0518-4692-ae2a-f70fd11ce43b@ideasonboard.com>
Date: Wed, 28 Oct 2026 09:31:13 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: i2c: ov5693: Keep the Bayer order when
 flipping at full resolution
To: rylos78@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>,
 Simon Kruse <simon0x+git@proton.me>, "D. Manresa" <dmanresa@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
 <20261027-ov5693-fixes-v1-2-3c8ab1ae104d@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261027-ov5693-fixes-v1-2-3c8ab1ae104d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/10/2026 20:29, Marco Ziliani via B4 Relay wrote:
> From: Marco Ziliani <rylos78@gmail.com>
> 
> In the full (unbinned) readout each of the horizontal and vertical
> flips moves the Bayer phase by one column. With exactly one flip
> enabled the CSI-2 receiver gets GBRG instead of the SBGGR10 the driver
> reports, which gives a magenta and green image; with both enabled the
> two shifts cancel out.
> 
> The crop start is only honoured in steps of two pixels, so compensate
> by shifting the output window by one column when hflip XOR vflip, and
> widen the crop by two columns, within the pixel array, so that the
> window still fits. Reprogram the window when either flip changes. The
> binned readout is left unchanged.
> 
> With this change, raw 2592x1944 frames come out BGGR at all four
> hflip/vflip settings on the Surface Pro 5 (IPU3)

Hm. But what's the right approach? To allow flips without changing the media bus format code by 
offsetting the output rectangle, or to have flips change the media bus format that the driver 
reports and flag the flip controls with V4L2_CTRL_FLAG_MODIFY_LAYOUT. At the moment that would mean 
that you couldn't set flips whilst streaming though, which is suboptimal.


; the same change in
> the linux-surface tree gave BGGR at all four settings on a Surface
> Pro 7 (IPU4P) and a Surface Pro 9 (IPU6). Without it, the order is only
> right with both flips off or both on.
> 
> Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
> Link: https://github.com/linux-surface/kernel/pull/181
> Signed-off-by: Marco Ziliani <rylos78@gmail.com>
> ---
>   drivers/media/i2c/ov5693.c | 56 +++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 48 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 579aa55b7..ca0968498 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -361,6 +361,49 @@ static const u8 ov5693_test_pattern_bits[] = {
>   
>   /* V4L2 Controls Functions */
>   
> +/*
> + * In the full (unbinned) readout each flip moves the Bayer phase by one
> + * column, so with exactly one of them enabled the CSI-2 receiver gets GBRG
> + * instead of the SBGGR10 the driver reports; with both enabled the two shifts
> + * cancel out. The crop start is only honoured in steps of two pixels, so
> + * compensate by shifting the output window by one column instead, and widen
> + * the crop so that the window still fits.
> + */
> +static bool ov5693_bayer_shift(struct ov5693_device *ov5693)
> +{
> +	const struct ov5693_mode *mode = &ov5693->mode;
> +	bool hflip, vflip;
> +
> +	if (mode->binning_x || mode->binning_y)
> +		return false;
> +
> +	hflip = ov5693->ctrls.hflip && ov5693->ctrls.hflip->val;
> +	vflip = ov5693->ctrls.vflip && ov5693->ctrls.vflip->val;
> +
> +	return hflip ^ vflip;
> +}
> +
> +static int ov5693_window_x_configure(struct ov5693_device *ov5693)
> +{
> +	const struct ov5693_mode *mode = &ov5693->mode;
> +	bool shift = ov5693_bayer_shift(ov5693);
> +	u32 crop_end = mode->crop.left + mode->crop.width;
> +	int ret = 0;
> +
> +	/* Widen the crop for the shifted window, within the pixel array */
> +	if (shift)
> +		crop_end = min(crop_end + 2,
> +			       max_t(u32, crop_end, OV5693_NATIVE_WIDTH - 1));
> +
> +	/* Offset X */
> +	cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG, shift, &ret);
> +
> +	/* Crop End X */
> +	cci_write(ov5693->regmap, OV5693_CROP_END_X_REG, crop_end, &ret);
> +
> +	return ret;
> +}
> +
>   static int ov5693_flip_vert_configure(struct ov5693_device *ov5693,
>   				      bool enable)
>   {
> @@ -373,7 +416,7 @@ static int ov5693_flip_vert_configure(struct ov5693_device *ov5693,
>   	if (ret)
>   		return ret;
>   
> -	return 0;
> +	return ov5693_window_x_configure(ov5693);
>   }
>   
>   static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
> @@ -388,7 +431,7 @@ static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
>   	if (ret)
>   		return ret;
>   
> -	return 0;
> +	return ov5693_window_x_configure(ov5693);
>   }
>   
>   static int ov5693_get_exposure(struct ov5693_device *ov5693, s32 *value)
> @@ -566,16 +609,13 @@ static int ov5693_mode_configure(struct ov5693_device *ov5693)
>   	cci_write(ov5693->regmap, OV5693_CROP_START_X_REG, mode->crop.left,
>   		  &ret);
>   
> -	/* Offset X */
> -	cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG, 0, &ret);
> -
>   	/* Output Size X */
>   	cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_X_REG, mode->format.width,
>   		  &ret);
>   
> -	/* Crop End X */
> -	cci_write(ov5693->regmap, OV5693_CROP_END_X_REG,
> -		  mode->crop.left + mode->crop.width, &ret);
> +	/* Offset X and Crop End X follow the flips, see ov5693_bayer_shift() */
> +	if (!ret)
> +		ret = ov5693_window_x_configure(ov5693);
>   
>   	/* Horizontal Total Size */
>   	cci_write(ov5693->regmap, OV5693_TIMING_HTS_REG, OV5693_FIXED_PPL,
> 

