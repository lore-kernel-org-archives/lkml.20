Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4431C43BDA4;
	Sat, 26 Sep 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428592; cv=none; b=ZxNe9gusQp/aEez5yQUU/n2nZN2etfzOBJGTcj68raD4zRKvSNt0Iny8xhYePHfey6YVAF9nSba3RVKPjRTSEuE1udoJVenbDeDc85GaJdv/WOJEQ0HvRwu2HPAcOZSSaZuERGIIcoP8JhnaliEgmMyRhGD5MMbWAmIbdwL/jjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428592; c=relaxed/simple;
	bh=OXhHlWf1wRSoQbEVebDx82kqMH+nTlQqpsnlqOpUeqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xrdx/gbdEjIlL4T00cgMiFjkVwOParwju2SoIdk+cufg/d6xzKrP2iWh2kN+dwAHCPTaP8d9ayJzF12D7pojbwbv3RGSlFeFWv2CBrn9aUUbKnkjhW4e/WMKhOBYs33cN4cvryWTf6rcfunV4eRqHUnjvea+p6zQq7/d/t22+WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSMA+7DD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSMA+7DD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A20B1F00899;
	Sat, 26 Sep 2026 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790428587;
	bh=BDClg9qgbyCtAhRmhFJ5SgxMh4tfpQElCLJG4ZEHjwA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RSMA+7DDJxz/ttkwccSn/nVq7wV2aaIHdOLJdV6/Uh8yfP6ohJukUag8UkqawVH9Z
	 sKu0B5D9gJjYwnH1L/mYd249XoEM/8mAY8h/uxYH5CUVmka7xnfg+gYQeBKS/mwrMB
	 wfAhl1zJEpbD3GzEjLud/52V+OYLHh0fGRGpUEOTFnQFxlIBMwbemoqPfzDEGBUT3H
	 e17EhciYx9zq0D7Bw38MTpQaxCgeb7GMy4J+ln5kD7G5yRqMOcNCpw9XN3PFMKY3LV
	 u2jB3ucas4wDb373O8tFbMlp+N8GneFvx+NnokXCICfat/lmk5Yub1g6Jo1y325Ew0
	 PrhMiNnIIiq3Q==
Message-ID: <410c824d-5833-44ec-8242-4e2d2fc69fc3@kernel.org>
Date: Sat, 26 Sep 2026 16:16:21 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: microchip-csi2dc: Power off on probe failure and
 remove
To: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, linux-kernel@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>,
 Balakrishnan Sambath <balakrishnan.s@microchip.com>
References: <20260910224837.15554-1-mhun512@gmail.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260910224837.15554-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/11/26 01:48, Myeonghun Pak wrote:
> csi2dc_probe() leaves runtime PM enabled and the controller powered on
> if subdevice registration fails. Removal also leaves an active controller
> powered on, since pm_runtime_disable() does not suspend it.
> 
> Disable runtime PM and power off the controller on both paths, then mark
> it suspended. Check pm_runtime_status_suspended() after disabling runtime
> PM to avoid turning off clocks that runtime suspend has already disabled.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: 2de0b3c0f678 ("media: atmel: introduce microchip csi2dc driver")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/media/platform/microchip/microchip-csi2dc.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
> index e69292f3b2a909be6a044db6ad086a7b0e082802..56cccb02bc562febe5e6a36e69a9ae014e005ccc 100644
> --- a/drivers/media/platform/microchip/microchip-csi2dc.c
> +++ b/drivers/media/platform/microchip/microchip-csi2dc.c
> @@ -727,13 +727,18 @@ static int csi2dc_probe(struct platform_device *pdev)
>  	ret = v4l2_async_register_subdev(&csi2dc->csi2dc_sd);
>  	if (ret) {
>  		dev_err(csi2dc->dev, "failed to register the subdevice\n");
> -		goto csi2dc_probe_cleanup_notifier;
> +		goto csi2dc_probe_disable_pm;
>  	}
>  
>  	dev_info(dev, "Microchip CSI2DC version %x\n", ver);
>  
>  	return 0;
>  
> +csi2dc_probe_disable_pm:
> +	pm_runtime_disable(dev);
> +	if (!pm_runtime_status_suspended(dev))
> +		csi2dc_power(csi2dc, false);
> +	pm_runtime_set_suspended(dev);

Hello Myeonghun,

Thank you for your patch. I have added Balakrishnan for review and help
testing.

I guess the proper way would be to not leave the device powered on at
the end of the probe, since all further operations will use resume on
the device.
So if probe fails, yes, disable runtime PM, but regardless of probe
success/fail, at the end, the device should be powered off.

>  csi2dc_probe_cleanup_notifier:
>  	v4l2_async_nf_cleanup(&csi2dc->notifier);
>  csi2dc_probe_cleanup_entity:
> @@ -746,12 +751,15 @@ static void csi2dc_remove(struct platform_device *pdev)
>  {
>  	struct csi2dc_device *csi2dc = platform_get_drvdata(pdev);
>  
> -	pm_runtime_disable(&pdev->dev);
> -
>  	v4l2_async_unregister_subdev(&csi2dc->csi2dc_sd);
>  	v4l2_async_nf_unregister(&csi2dc->notifier);
>  	v4l2_async_nf_cleanup(&csi2dc->notifier);
>  	media_entity_cleanup(&csi2dc->csi2dc_sd.entity);
> +
> +	pm_runtime_disable(&pdev->dev);
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		csi2dc_power(csi2dc, false);

I suppose the device should be powered off, and when runtime pm is
disabled, there should not be any requirement to manually power off. So
something is odd here.

Eugen

> +	pm_runtime_set_suspended(&pdev->dev);
>  }
>  
>  static int __maybe_unused csi2dc_runtime_suspend(struct device *dev)
> 
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713

