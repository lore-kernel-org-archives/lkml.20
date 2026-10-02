Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7E44BA1F5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953168; cv=none; b=dyDvVMdmuXIB8vf8WcDl3IvXGYuImUET6AgntJia9nxqlsDvOVGfZICIUTJWOt50gkeXEyvCLkZOqXtbjME91ppWIHiLv1lG4l1IIvb64v4mSdJaPv8zoBUgcYgHw5yHDNPmP6/kGi6FWqUMAYDiUj+RY8Lf+HnOVDG2xZ4gJi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953168; c=relaxed/simple;
	bh=60iLyypFeTMFMLDDFBKmKIqTEUGVGgM37aVqe56QZ9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tG7nuojjhSr9ceXHIhBpNPBhHLZ396AxV6htXPJ89gkK6oMEc3gGGlmiDTa0MVd6M9VQglla82H2D5y7pa4tXfe2+PdfXAAKuDzeasLuQrx7Srukm92dTbfiDQL3DPzF1hSSy4GYVOeT/gSnXDewBJi3Df4VVwH8GrE6f2F66ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o758SUAU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o758SUAU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FBD8497;
	Fri,  2 Oct 2026 07:59:22 -0700 (PDT)
Received: from [10.0.129.26] (e122027.cambridge.arm.com [10.0.129.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DAE13F86F;
	Fri,  2 Oct 2026 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953165; bh=60iLyypFeTMFMLDDFBKmKIqTEUGVGgM37aVqe56QZ9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o758SUAU/1/9G0JalInzwQ/AC7TnTEop1I3+zVAoMB/p5Gay3uQY3SZp3VyWBFmAW
	 m7k+FqRcGw8OPZMxmGEjZWSZP2g7rbpe4+m3Nw3PU40RGvAqoWv2HXO2BVvO2dNcDb
	 H4xieLawR6D5ZFdJj31H5BkaHitSbxAGYo9QBOXc=
Message-ID: <2ea16821-fcd8-4f35-b371-7c7e57f76e7c@arm.com>
Date: Fri, 2 Oct 2026 15:59:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/15] drm/panfrost: Add warning messages to fatal
 error conditions
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 "Marty E. Plummer" <hanetzer@startmail.com>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>,
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Collabora Kernel Team <kernel@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
 <20260929-claude-fixes-v12-9-62beb08de207@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260929-claude-fixes-v12-9-62beb08de207@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2026 04:44, Adrián Larumbe wrote:
> Rather than just failing silently, let's warn the user of device remove not
> being able to take an PM reference or the PM suspend path still reporting
> inflight jobs. Neither situation should ever happen.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index c6bf3d0663df..09a5752a3f40 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -9,6 +9,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_print.h>
>  
>  #include "panfrost_device.h"
>  #include "panfrost_devfreq.h"
> @@ -357,7 +358,7 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>  
>  void panfrost_device_fini(struct panfrost_device *pfdev)
>  {
> -	pm_runtime_get_sync(pfdev->base.dev);
> +	drm_WARN_ON(&pfdev->base, pm_runtime_get_sync(pfdev->base.dev) < 0);

This seems fine.

>  
>  	pm_runtime_dont_use_autosuspend(pfdev->base.dev);
>  	pm_runtime_disable(pfdev->base.dev);
> @@ -516,7 +517,7 @@ static int panfrost_device_runtime_suspend(struct device *dev)
>  {
>  	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  
> -	if (!panfrost_jm_is_idle(pfdev))
> +	if (drm_WARN_ON(&pfdev->base, !panfrost_jm_is_idle(pfdev)))

I'm a bit wary that this might be something that user space can trigger.
My AI says:

The runtime-suspend WARN can be reached by ordinary userspace job
submissions. The DRM scheduler increments credit_count before calling
Panfrost’s job runner (drivers/gpu/drm/scheduler/sched_main.c:1044).
Panfrost takes the job’s PM reference later in hardware submission
(drivers/gpu/drm/panfrost/panfrost_job.c:213). If autosuspend runs in
that interval, the new WARN
(drivers/gpu/drm/panfrost/panfrost_device.c:525) sees the credit and
fires, even though this is a timing race rather than a broken job.
Repeated submissions near the autosuspend boundary could therefore
produce repeated stack traces. The PM core treats the resulting -EBUSY
as a transient failure.

Now I have to admit I don't trust it that much - but I'd want a
convincing argument on why panfrost_jm_is_idle() will never be false here.

Thanks,
Steve

>  		return -EBUSY;
>  
>  	panfrost_devfreq_suspend(pfdev);
> 

