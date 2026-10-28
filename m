Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175546;
	b=fUJ7FnDHvOJQDfCxpXBBJ6Ov0x6IE+aBY/Im/cPmGsOKJ0vGj0n60hqRWD7MSnJcy65+
	 U5QFs/I1DsG6UeNC+JkYvSyx+mAbe54HCjAK87Sufnp1K8HNy8INDnDxpIRS5r8KzeaM+
	 lZ/USfbTvTxbRyC+1yR5u/wL77WjWOwvUVEFa0M2e0pMjHP6hSVAKnHXd1ODvlgWQej2v
	 vEx97S1vQ7Bffmur7fu9aUA+qhBnJzJTJ1dRWGKgyBAHyRXbvewjtSd4rQSy4SvOWGhGF
	 WSAV3n2Tr1SW888C/RHL1flAOIyfKYbxLjtpNfEAJLU40e7DhUZ6O83mbZTBQpPW9OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175546;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=35AvFCOz2079sviJ8Tev4re9xiiqZIZFJhIi2bKIuUk=;
	b=ejEns1kyzDBuYSF5nS/L3lbsmSiduIJD4crKc7bkzW13P/M77T9ycJOTJIXkPWnDb9f5
	 SlBoEGgqwQmwNNSZkTt8lK1ro2RbEcpg4qoeLYc62rjiWR7c9bbruxyxxHWe9w4Nxmntz
	 jwSPTGjx/r2V8WfkGj5+8vmLtCkSX4lN9mmKzgA/+I3FRoKHhfxsEvVjOOG0qQv33/c4g
	 QLIzLHWXXRM62iYZxboE/RMWdH1dgxkKayJzjqSXHoMR09vxBjl15kdkaNTwmf2Cz/BLc
	 CQdy5/MFb2/KBEE8bfOfbzz8jsWO8A/N4wUTul42LWVYVxPRf8c2NVnCRxawx4nh/Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UCgvqE25;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E3B606A31F;
	Wed, 28 Oct 2026 08:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E3B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UCgvqE25
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAC63C1;
	Wed, 28 Oct 2026 09:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793175410;
	bh=ylQ6axDdwtfjvRU+2qs8niTWWhpNNu50zy5DOU3vbP8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UCgvqE25oIHOWQnSXUgM6ekhENm205Ea4Wa1l15GqGgdwrJNhbbuqTwG+BolY98a1
	 WV4esfSjFo9AkqBBj5GPIgQ1iP6qFiW8VwZc/3M/tTJhWmuz3LSxrHSuy/DgZOEYWP
	 Qma5UspGYbtSR2e0VPpPRFy1fegARn0CsJ3/qC98=
Message-ID: <aca04907-1ace-4fe2-8ca9-280c56b4b3e6@ideasonboard.com>
Date: Wed, 28 Oct 2026 08:19:00 +0000
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
Subject: Re: [PATCH 3/3] media: i2c: ov5693: Use autosuspend when stopping the
 stream
To: rylos78@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>,
 Simon Kruse <simon0x+git@proton.me>, "D. Manresa" <dmanresa@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
 <20261027-ov5693-fixes-v1-3-3c8ab1ae104d@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20261027-ov5693-fixes-v1-3-3c8ab1ae104d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning

On 27/10/2026 20:29, Marco Ziliani via B4 Relay wrote:
> From: Marco Ziliani <rylos78@gmail.com>
> 
> The driver enables runtime PM autosuspend with a 1 second delay at
> probe, but drops the usage count at stream stop with pm_runtime_put(),
> which doesn't update the device's last busy time. The autosuspend
> delay is then counted from the runtime resume at stream start rather
> than from stream stop, so after any stream longer than the delay the
> sensor is powered off right away.
> 
> Use pm_runtime_put_autosuspend(), which marks the device busy, so that
> the delay counts from stream stop as intended, and a following stream
> started within it doesn't power the sensor up from scratch again. With
> the mode now programmed on every stream start, keeping the sensor
> powered between streams no longer leaves it in a stale mode.
> 
> On a Surface Pro 9 (IPU6) with autosuspend_delay_ms set to 3000, the
> sensor suspended 1-2 ms after a 5 s stream stopped; with this change,
> 3.7 s after it, i.e. the delay plus the autosuspend timer slack. On a
> Surface Pro 5 (IPU3) with the default 1 s delay, the sensor suspended
> as soon as a 2 s stream stopped; with this change, 1.1 s after it.
> 
> Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
> Reported-by: D. Manresa <dmanresa@gmail.com>
> Closes: https://github.com/linux-surface/kernel/pull/181#issuecomment-6436016335
> Signed-off-by: Marco Ziliani <rylos78@gmail.com>
> ---
>   drivers/media/i2c/ov5693.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index ca0968498..ef5e7285c 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -1070,7 +1070,7 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
>   		goto err_power_down;
>   
>   	if (!enable)
> -		pm_runtime_put(ov5693->dev);
> +		pm_runtime_put_autosuspend(ov5693->dev);

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   
>   	return 0;
>   err_power_down:
> 

