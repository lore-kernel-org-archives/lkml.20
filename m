Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307017;
	b=0amH6tnlQ6/GelfDMbgjK0GgoCnZY9IWdAz9+eNWr1HpGdtaBa2HYm+ZRYS8IT743ZLo
	 jcV0IyKfQcEfOMshS+CV4m82T0oS4F09bXREwDrCoNnaJrjZsT0n1efx4RcOCjphjTKk9
	 us1jgi40fnIOFX44usRMj7xDoSCxh+HUMjKXT87oMoUqISnyCCue2z66qhBe2oGoBCtJe
	 0MqtQ5uw8mmBkm3NbIjTQQLrPY7Y7JOWcQyELOyrHs0FjW+JUUziWMEsh7D4XYrQ0u8CM
	 jT+WIy3xDMWFpuMYJdlwej5hnIVeYqZhe6wVGCZP9j8R7RrFmg9hJXUsqWH6LlMdU4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307017;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=aYP6ZGB7srZlQ6US5JH2zaerS+sLxrc3zmnJGtbY/3E=;
	b=yzEa3sXBHWCGO04hywDphUMAHsg7t/0J3LoNydE8442R6m7Eah/CRXTaT7wiyv9aC+YZ
	 SGeFDe2y/2rVCYMrJsy393fp0tdh41oAoFXNI7xEprQeK5O66GWd2JB4Y6EXScH34WOfI
	 R0B0B7Sd9npsiy/ebRc6kjfy2FMfFz8dlTeCvbb9TlDW/CJ432GUlEQfTEHQ3jAAaif1P
	 AgSjdcTBbNXubDXQXWJ1LHYaThO5pfuAzlNrs5bvU+HQn70lfE0SjxCyyOR//qUy+bh/l
	 iBccY4EamxOD0Rht1f2U+k9iFxI8frkI6i8w1AjzW4W65ilxIGYFfnY6JF/zq7wJCLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=F0rncuQB;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35FD606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=F0rncuQB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9E641BC0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:36:52 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 77C243F85F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794307015; bh=AqF58HrT3bhON+KbWlWZ11YZ8tIs9dlGm5SmVttprrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F0rncuQBvpqsZPrRaH5O1BW7UlRmtmL2YPb0EDU2imN/55gxth4u3eOsmlfTkS3CD
	 4E7VYrsYzXp4BROU5Y0RofmYHEuF1bJJ0wGUBuGRtJvx8PZuklerQZmWa2MjeViM3Y
	 +mxu/uiQt20SzrEbtaXqN2AEj70IH5DAox6608Fw=
Date: Tue, 10 Nov 2026 10:36:43 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: aiyengar1990@gmail.com
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] drm/panthor: Do not change the GPU clock rate while
 suspended
Message-ID: <avLzu40gKwgJJiNK@e142607>
References: <20261110-panthor-suspend-clk-v1-1-53457050e51e@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261110-panthor-suspend-clk-v1-1-53457050e51e@gmail.com>

On Tue, Nov 10, 2026 at 07:15:00AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> From the start of panthor_device_suspend() until panthor_device_resume()
> has enabled the clocks again, the GPU clocks are off or about to be, and
> the GPU power domain may be down. devfreq can still call ->target() in
> that window: a write to min_freq or max_freq in sysfs, a thermal cooling
> state change or a PM QoS request all end up in update_devfreq() whatever
> the device state.
> 
> With the RK3588 GPU core clock switched to the firmware-managed
> SCMI_CLK_GPU (needed to reach the PVTPLL rates of the upper OPPs), such
> a call is fatal. To set a PVTPLL rate TF-A programs registers in the GPU
> GRF, which sit in the GPU power domain, and with the domain off that
> access ends in an asynchronous SError and a kernel panic, for example
> after
> 
>   echo 1000000000 > /sys/class/devfreq/fb000000.gpu/min_freq
> 
> while the GPU is runtime suspended.

Maybe what needs to be done is to disable the clock when the power domain
goes down.

> 
> Only apply a rate to the hardware while the device is resuming or
> active, plus the suspend frequency that devfreq_suspend_device() applies
> from the suspend path while the GPU is still powered. Other requests are
> still accepted and recorded by devfreq, which applies them on resume or
> at the next governor update.
> 
> The RFC this is based on (Jonas Karlman's panthor SCMI clock change,
> carried in Armbian's linux-rockchip pull request 380) checked the
> runtime PM status instead. That
> status is still RPM_SUSPENDING after panthor_devfreq_suspend() has run,
> which leaves a window where the rate can be raised again right before
> the power domain goes down. The devfreq suspend count cannot be used
> either: panthor's first runtime resume calls devfreq_resume_device()
> without a matching suspend, so the count is -1 while the GPU is active
> and 0 while it is suspended.
> 
> Suggested-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Tested on an Orange Pi 5 (RK3588S) with the GPU core clock switched to
> SCMI_CLK_GPU and a 200 MHz opp-suspend (the configuration from the RFC,
> not yet in mainline): writing min_freq while the GPU was runtime
> suspended no longer ends in an SError, the request takes effect at the
> next job (1 GHz measured), max_freq likewise; 200 suspend/resume cycles
> with short GPU jobs and a 3 minute sustained load ran without faults.
> With the mainline device tree (CRU clock, no suspend OPP) the SError is
> not reachable and the guard only skips rate changes while the GPU is
> powered down.
> 
> This patch was developed with Claude (Anthropic) as a coding assistant:
> it wrote the code and the commit message, and I reviewed and tested it
> as described above.
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 42 ++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 2249b41ca4af..cab86e9c9d46 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -60,20 +60,56 @@ static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
>  	pdevfreq->time_last_update = now;
>  }
>  
> +/*
> + * Whether a new rate can be applied to the hardware now.
> + *
> + * From the start of panthor_device_suspend() until panthor_device_resume()
> + * has enabled the clocks again, the GPU clocks are about to be disabled
> + * or are off, and the GPU power domain may be down. devfreq can still
> + * call ->target() in that window: sysfs
> + * min_freq/max_freq writes, thermal cooling and PM QoS requests all end
> + * up in update_devfreq() whatever the device state.
> + *
> + * Changing the rate then is pointless, and harmful where the core clock
> + * is managed by firmware: on RK3588, setting SCMI_CLK_GPU to a PVTPLL
> + * rate with the GPU power domain off makes TF-A access the powered-down
> + * GPU GRF, which ends in an asynchronous SError. So while the device is
> + * suspending only the suspend frequency, applied by
> + * devfreq_suspend_device(), reaches the hardware, and nothing does
> + * while it is suspended. devfreq records the other requests: they are
> + * applied on resume or at the next governor update.

Can this comment be rewritten to be less verbose?

> + */
> +static bool panthor_devfreq_can_set_rate(struct panthor_device *ptdev,
> +					 unsigned long freq)
> +{
> +	struct devfreq *devfreq = ptdev->devfreq ? ptdev->devfreq->devfreq : NULL;
> +
> +	switch (atomic_read(&ptdev->pm.state)) {
> +	case PANTHOR_DEVICE_PM_STATE_SUSPENDED:
> +		return false;
> +	case PANTHOR_DEVICE_PM_STATE_SUSPENDING:
> +		return devfreq && devfreq->suspend_freq &&
> +		       freq == devfreq->suspend_freq;
> +	default:
> +		return true;
> +	}
> +}
> +
>  static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
>  				  u32 flags)
>  {
> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
>  	struct dev_pm_opp *opp;
> -	int err;
>  
>  	opp = devfreq_recommended_opp(dev, freq, flags);
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
>  	dev_pm_opp_put(opp);
>  
> -	err = dev_pm_opp_set_rate(dev, *freq);
> +	if (!panthor_devfreq_can_set_rate(ptdev, *freq))
> +		return 0;

Hmm, why not return an error here? -EINVAL?

>  
> -	return err;
> +	return dev_pm_opp_set_rate(dev, *freq);
>  }
>  
>  static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
> 
> ---
> base-commit: 8deaade4a5a4ff635df91e246e42139ab2b33f6d
> change-id: 20261110-panthor-suspend-clk-11d5604fe5be
> 
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>
> 
> 

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
