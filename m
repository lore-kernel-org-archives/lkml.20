Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9070476CE9;
	Thu,  3 Sep 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430076; cv=none; b=JMRMXjP1hOuYkqwO/yA1uaMmXLdXrj+6x7Y0KrrOFEv4EA00yZXgJ0y+F/0ShcU1VDO0whptV3pMVXd+NpQze3zbkIwPaekeYtt9c4ULE8VmtObR83/vQ0YHDDHhRAuR/7aoJK7Pu0qsGAzCucNNa21R0kgRrqFfhGsJVzvFT70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430076; c=relaxed/simple;
	bh=RvysufoL/j8UuHfJ6vysrlkcWB6T2CcmZl4Cm5gGEtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1huK5F6oqQ/7VB/xVkRY1hBcma2wXXqLaTrRJgOBu6hw2S89YR3HcuZFKoT9eKYwAYfybihb6ttY03LqWFIbEz+pgDFQCc85ofnNXcSg6NBz5bxjDig4iR9x6QsucpG9A9HV2t0zvmnuw6mST9PSMPxYwdF7Yk4TtYueZ/++L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jdk+/xzv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jdk+/xzv"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9F39C36;
	Thu,  3 Sep 2026 12:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788429977;
	bh=RvysufoL/j8UuHfJ6vysrlkcWB6T2CcmZl4Cm5gGEtQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jdk+/xzvswyZLB0VE80yHyUjcNSKPdO5a+VOXTn4phvvb1eOG2dztcYe6oy6L7ybp
	 Xc/mQaBHDqFSwIAecWQ677/+SOeralmdyFyydnogJ1x1FNwaBHiBFlJKWp0V/LMBCF
	 Vn3a4x0F6x58iLpBhGAy4jjV7DdU3JXCfNwThdRs=
Message-ID: <bfdf98d4-e3f3-42ff-a0b4-55c67790e4d0@ideasonboard.com>
Date: Thu, 3 Sep 2026 13:07:45 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: xilinx: vtc: Dynamically calculate pixel clock
To: Rajesh Gugulothu <rajesh.gugulothu@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260729101808.3904212-1-rajesh.gugulothu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/07/2026 13:18, Rajesh Gugulothu wrote:
> This update enables the vtc to set the pixel clock based on the
> specified timing parameters. A new fps field is added to struct
> xvtc_config and the pixel rate is computed as fps * hsize * vsize.
> After setting the rate, the actual clock rate is read back and a
> warning is emitted if it deviates beyond a small tolerance.
> 
> The pixel rate is computed in unsigned long arithmetic to avoid a 32-bit
> overflow in the fps * hsize * vsize product.
> 
> Signed-off-by: Rajesh Gugulothu <rajesh.gugulothu@amd.com>
> ---
>   drivers/media/platform/xilinx/xilinx-vtc.c | 19 +++++++++++++++++++
>   drivers/media/platform/xilinx/xilinx-vtc.h |  1 +
>   2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c b/drivers/media/platform/xilinx/xilinx-vtc.c
> index 92fec7bb4..695eb2a46 100644
> --- a/drivers/media/platform/xilinx/xilinx-vtc.c
> +++ b/drivers/media/platform/xilinx/xilinx-vtc.c
> @@ -141,6 +141,9 @@
>   
>   #define XVTC_GENERATOR_GLOBAL_DELAY		0x0104
>   
> +/* Value of 1 = .01% */
> +#define XVTC_CLK_MAX_PCT_ERR			1
> +
>   /**
>    * struct xvtc_device - Xilinx Video Timing Controller device structure
>    * @xvip: Xilinx Video IP device
> @@ -175,10 +178,26 @@ int xvtc_generator_start(struct xvtc_device *xvtc,
>   			 const struct xvtc_config *config)
>   {
>   	int ret;
> +	unsigned long s_rate;
> +	unsigned long g_rate;
> +	unsigned long clk_err;
>   
>   	if (!xvtc->has_generator)
>   		return -ENXIO;
>   
> +	s_rate = (unsigned long)config->fps * config->hsize * config->vsize;
> +	ret = clk_set_rate(xvtc->xvip.clk, s_rate);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Verify that the clock is within a reasonable tolerance. */
> +	g_rate = clk_get_rate(xvtc->xvip.clk);
> +	clk_err = (abs(g_rate - s_rate) * 10000) / (s_rate);
> +	if (clk_err > XVTC_CLK_MAX_PCT_ERR)
> +		dev_warn(xvtc->xvip.dev,
> +			 "Failed to set clk rate: %lu, actual rate: %lu\n",
> +			 s_rate, g_rate);
> +
>   	ret = clk_prepare_enable(xvtc->xvip.clk);
>   	if (ret < 0)
>   		return ret;
> diff --git a/drivers/media/platform/xilinx/xilinx-vtc.h b/drivers/media/platform/xilinx/xilinx-vtc.h
> index 855845911..0f360ed55 100644
> --- a/drivers/media/platform/xilinx/xilinx-vtc.h
> +++ b/drivers/media/platform/xilinx/xilinx-vtc.h
> @@ -27,6 +27,7 @@ struct xvtc_config {
>   	unsigned int vsync_start;
>   	unsigned int vsync_end;
>   	unsigned int vsize;
> +	unsigned int fps;
>   };
>   
>   struct xvtc_device *xvtc_of_get(struct device_node *np);

In upstream there's a single user for the VTC: the TPG driver. It 
doesn't set the fps field, so the above code would always try to set the 
rate to 0, wouldn't it?

What is "reasonable tolerance", why did you arrive to .01%? Also, the 
actual result is not visible to the user.

I think this is a slightly bigger topic than a single VTC patch. There 
should be a userspace API to set the FPS, and the user should see what 
was the actual rate he got via the API (instead of a dev_warn when the 
rate is off more than an arbitrary tolerance).

  Tomi

