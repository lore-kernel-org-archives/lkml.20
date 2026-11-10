Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315763;
	b=Le057ZzD5+KN2dTzAycOQoG92TbGEcKS52C+bXQX/7YYybDs/dEjFFxZemi0k4k/SHvx
	 JDuA79sEBJ2laxMYOYJdqFLVOFVk1qBCGSIY1vOG995I1euh+bkoDWpzLFr2WRXuAdJZ0
	 9zRRlIKO3prNt/gcDyFNC1vOb1mdMzHqIbCfSdlhhH4iMC6ueMjGfNgdN7CXzkmkwQSmO
	 HA12yLzU9ZtbDGw7FTQMlqlMC9I2Q8TeM0+fTBX2qMtSUobdSvZzcr93PSamh/RRqLg17
	 /nloHyo66vQZRGpbcdbXZGelq31IadqAE0Pw1Ne1cuXKM880RBblQ8s2VdSSSzuoPAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315763;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=q+tN4z7NXWlR4na9D2C+xhqXnnvW2XxnASuccDLlZx0=;
	b=WEIJV/XtRJ36BGVFNwQGmp7AxlfXJkbAM0+EgEhM1w4QVr6dAkDjIZ2jtkJ62SNW2jLR
	 5P6d7lKdJA/z/cga8xdlfNEIe/N6gZn+yPWiSv0pU8XsAtipfPH2dYiE1sgO5GAg3g9IU
	 PRFH4L+ydKo7kbNThs/vVHJs6oDg6in/L/h/+i1arMToKcjfiI2pyzjpUDqPWqLcxOD1h
	 v/54tV8cXzorYaGkFsGmsRWUwahnsm1pfuDEW7ANYxcN/E/8Sekf6uoVNQkTAria38x8G
	 wncvBhRbvEiD8ZvIEVGU27UOUalHnHI5qzKKHcO8sGgbPX3KGrbzFpmsZ3K232rDMrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OZH8i92z;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FA1606BFDE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FA1606BFDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=OZH8i92z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794315761;
	bh=lsfLnnAeFFIiJN/3WLIx+aewZN2Xynq+gqwio4jBfKc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OZH8i92z3ufcDkzTosplCkdMNnC+QCeCEK2E8+YRBIhCmlJ6mDQ8uQPi45sSieKKh
	 PuTfJWd00xBldkkvI+AxCRFhvxT52lQE2k2OmlNd+lbr8nzO/psQp4kops4Th1khiI
	 pP6oOlTN/3r2TcMerXASVrCDjX+4wavoedpXhbgZv6S2Nmnnrx0iGcUl+sbB6YGmih
	 ik4J3X+zsL3wdywi0fmMnEDCf0ioaw7SUJSY4FXn3LIkHambhnYO7KjKCvi8HoucMy
	 VyS6k0DoN5YF0KMlmVEg7khjH2RXPFvaJcemQVdDgnd2rB8JivgbZLlCW3qUX51t4w
	 wN6idlspv3yiw==
Received: from fedora1.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBB5B17E031D;
	Tue, 10 Nov 2026 14:02:40 +0100 (CET)
Date: Tue, 10 Nov 2026 14:02:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Cc: aiyengar1990@gmail.com, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] drm/panthor: Do not change the GPU clock rate while
 suspended
Message-ID: <20261110140232.061d6844@fedora1.home>
In-Reply-To: <20261110-panthor-suspend-clk-v1-1-53457050e51e@gmail.com>
References: <20261110-panthor-suspend-clk-v1-1-53457050e51e@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 07:15:00 +0000
Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
wrote:

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
> + */
> +static bool panthor_devfreq_can_set_rate(struct panthor_device *ptdev,
> +					 unsigned long freq)
> +{
> +	struct devfreq *devfreq = ptdev->devfreq ? ptdev->devfreq->devfreq : NULL;

I'd rather use devfreq::suspend_count to detect if the devfreq
component is suspended, since it gives us a better granularity than
panthor_device::pm::state.

> +
> +	switch (atomic_read(&ptdev->pm.state)) {
> +	case PANTHOR_DEVICE_PM_STATE_SUSPENDED:
> +		return false;
> +	case PANTHOR_DEVICE_PM_STATE_SUSPENDING:
> +		return devfreq && devfreq->suspend_freq &&
> +		       freq == devfreq->suspend_freq;
> +	default:

When PANTHOR_DEVICE_PM_STATE_SUSPENDING is set, not all HW
components have been clocked/put out of reset. It's probably okay
for power domains, because those deps are described through device
links, and the dependencies are resumed by PM core before the
panthor PM hooks are called, but this is fragile, and that's another
reason I think we shouldn't rely on panthor_device::pm::state for that,
but on devfreq::suspend_count (or any other internal panthor_devfreq
state that tracks the panthor_devfreq component status).

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

If you return zero here, the new frequency is assumed to be applied,
and it messes up with the devfreq state (::previous_freq for instance)
that was set on devfreq_suspend_device(). If we assume that rate
changes should be rejected while we're suspended, this should probably
return an error.

>  
> -	return err;
> +	return dev_pm_opp_set_rate(dev, *freq);

There's another race between devfreq_suspend_device(), which will
restore the ::resume_freq, and a concurrent devfreq_update_target() call
that's here to set a new rate. Using devfreq::suspend_count won't help,
because this atomic is decremented before the resume_freq is applied,
and the devfreq lock is only taken around the devfreq_set_target() call.

Honestly, it feels like we're trying to address the problem at the wrong
level. I would expect governors to stop calling devfreq_update_target()
between the DEVFREQ_GOV_SUSPEND and DEVFREQ_GOV_RESUME events (which
should probably be sent before suspend_count is incremented and the
suspend freq is applied). And I'd also expect some kind of
locking/synchronization to prevent races between
devfreq_update_target() and devfreq_{suspend,resume}_device().

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

