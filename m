Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175419;
	b=HsRlR3QzQAxE0ucAfUgdSxHdg4LVQ6yZu7kKYknVG9+PqFGcWsQJX9xq4cUQkSCw5Iis
	 NewFaK41SxVDwewg1KJ0xaXDq/1wY7kZjLGTZOtxghFgK7mHJFfggc1zx0Pjz+a/3bPQv
	 0T/jlFXTyUu6kfGq2/MTxLmeFAnX6VVxJ2HiqUQsX9loQDF2A9YgsIh9Gu4emooKZO+SP
	 H5nvsXsmCApD2F2lhrfES5FmVv5RRLh0Ac6KQi4/3zV7S2iWQBtmT3tBsq2b51CHrSPe8
	 ASC7FdZAnDAde8FH+rjYqeNaiFtvk+tIzF3AmGyKauf2QPxJ/dFVHxJPbhT+w1sIHRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175419;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dqnWKvbCDNqZUxkMc7D8w+XMOrdlu1tMeCS8z4qa+HI=;
	b=13X+GC5oa3BM200C6Y8NCl+WnN5QEC6opFgmcXZ3JtIrNhykfbwH+qlsgkQ5gRqrMBux
	 2mcWCb8GT6lKsuZG2BalQE31qtB+llKCNq3+LQcJ7LCibDkcgs+mDTz4Cjnzzzaqesz9S
	 4MDZAb1lfGGjAFLl2PSGGzpcXmt99dWszgVOi/hNh72TcR5fvdspuvK4DyPSHqu17zb/a
	 KECQauI3tDVW7FRH6hP8TNLm40rFsnPme1pifDkTl5QsxE9FBSU5qhL8VwJS6SakMHRNP
	 UOsy/iSAuwCAR2b55yac28V2cCVBu3OUuVby6ilyP4FVSf+1zu30cAGu5zUzm3/Juig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Bli89J4B;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC770606A323;
	Wed, 28 Oct 2026 08:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC770606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Bli89J4B
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87A43B07;
	Wed, 28 Oct 2026 09:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793175281;
	bh=AWSwERrxciPJHOKVtZ7cmk7EJfcz8HKAbL/Ezzdq9oM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bli89J4BJcwEeKK1PdPKib63+AjbsLfDQN0QfAS6lokEi9XXdMMeOHMtRU+BzYeb/
	 9MHSprc13ofWHlEiA5eRZbTEJHNUYFr8x/lEZfNcwlxoIDEaa0jH4C+MbveDlDTt0G
	 QhOA0LII1dBq23CGZnT4HIp0OYsn9SZxkrnOql+U=
Message-ID: <6b275d56-0dfe-4076-9d02-8410e50aef07@ideasonboard.com>
Date: Wed, 28 Oct 2026 08:16:50 +0000
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
Subject: Re: [PATCH 1/3] media: i2c: ov5693: Program the mode registers on
 stream start
To: rylos78@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>,
 Simon Kruse <simon0x+git@proton.me>, "D. Manresa" <dmanresa@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
 <20261027-ov5693-fixes-v1-1-3c8ab1ae104d@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261027-ov5693-fixes-v1-1-3c8ab1ae104d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning Marco

On 27/10/2026 20:29, Marco Ziliani via B4 Relay wrote:
> From: Marco Ziliani <rylos78@gmail.com>
> 
> The mode registers (readout window, binning and subsampling) are only
> written from the runtime PM resume handler, and ov5693_set_fmt() merely
> stores the requested mode. If the sensor stays powered between two
> streams, the new mode never reaches the chip: the sensor keeps
> streaming the previous mode while the CSI-2 receiver expects the newly
> negotiated format.
> 
> This happens whenever the format is changed while the sensor is still
> powered. On a Surface Pro 7+ (IPU6), with the sensor held powered
> between two streams, OUTPUT_SIZE_X read back over I2C showed the sensor
> stuck in the mode it was powered up in, and 0 of 16 streams that asked
> for a different mode produced a frame. With this change, 32 of 32
> streams completed and the register followed the requested mode. A
> Surface Pro 9 (IPU6) gave the same result: without the change
> OUTPUT_SIZE stayed at 2592x1944 in all 32 streams of 16 such switches,
> with it the register matched the requested size in all 32. On a
> Surface Pro 5 (IPU3), switching between 2592x1944 and a 1920x1080 crop
> the same way, OUTPUT_SIZE_X stayed at 2592 and none of the 16 streams
> in the new size produced a frame; with this change, 32 of 32 streams
> gave 10 of 10 frames at the requested size.
> 
> Program the mode on every stream start, before the controls, so that
> the mode registers don't clobber them. This matches what commit
> 4e1446ac169a ("media: i2c: ov8865: Program the sensor on stream start")
> does for the ov8865.

This commit message is very long, most of this detail is not necessary:

"ov5693_mode_configure() is only called in the driver's PM .runtime_resume() hook. If the sensor 
remains powered between two streams with different modes, the settings for the second mode are never 
written to hardware.

Move the call to ov5693_mode_configure() to ov5693_s_stream() to ensure it's written every time."
> 
> Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
> Link: https://github.com/linux-surface/kernel/pull/181
> Signed-off-by: Marco Ziliani <rylos78@gmail.com>
> ---
>   drivers/media/i2c/ov5693.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 56599f9ca..579aa55b7 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -1000,6 +1000,19 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
>   			return ret;
>   
>   		mutex_lock(&ov5693->lock);
> +
> +		/*
> +		 * The mode registers are otherwise only written on runtime PM
> +		 * resume, so a format change on a sensor that stays powered
> +		 * would never reach the chip. Program the mode first, then the
> +		 * controls, so the mode registers don't clobber them.
> +		 */
> +		ret = ov5693_mode_configure(ov5693);
> +		if (ret) {
> +			mutex_unlock(&ov5693->lock);
> +			goto err_power_down;
> +		}

The same function call should come out of ov5693_sensor_init() then, or it'll be written twice on a 
stream on from an unpowered state.

Thanks
Dan
> +
>   		ret = __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
>   		if (ret) {
>   			mutex_unlock(&ov5693->lock);
> 

