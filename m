Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9EB3B5301
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008583; cv=none; b=bfj7JTZIoKLeNzrVLZsbxw2T6tS7LuboQOcQmL7x0w03uT2Zx6OeRbsRrOEH2tb+xj5FHMbqPa9E38cqmX3Uh+jQF3+mN7+BnIMnG4yODN6U735lktkV9W5MAu/r7AKCkdNRJqu0x2sYoA4X0UsbxubF1HytjDK3vk7LCWeCMaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008583; c=relaxed/simple;
	bh=4iyfBXQPN/kMHD3Pi/xPJUMFHR4GcFjDxAHBGHDGGf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nflRH868DvD1Ty7bCDdG49Us0FKtJkffDPskjys/tGW6wkkZLO22vOV57HEZMbPWpVmBYEp1icokuVNNdH0oMnkJVV0kqb4i3h/Y4CxqWtO05mwJuNeyXmq8EzfqqgXVB/+HtyWTpMRN8DFSAEAmQ99it2tLG6IoZDzFd1CxdWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cf1GFUn5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cf1GFUn5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C183C19F0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:36:13 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 204803F86C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790008577; bh=4iyfBXQPN/kMHD3Pi/xPJUMFHR4GcFjDxAHBGHDGGf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cf1GFUn5D5kHzicS7HFYCWmKzasKkAtmjp9RuXbkDih+I8IShZ6KOJaHendJa7z/i
	 lksHXs2bZBu8xIUxG9iZ7no9MTXP1b2RoPki2ulDFGX50WJnoFS3UgubgJOgoNsFBi
	 m61tbtHDagkN3hkKNz4oWmmxJOl3OxSrWZCa/FiM=
Date: Mon, 21 Sep 2026 17:36:06 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: ryan.zhang@oss.nxp.com
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: dummy read to discard the stale first
 GPU_TIMESTAMP read
Message-ID: <arFc9vNnxld2PtTp@e142607>
References: <20260921102957.1024029-1-ryan.zhang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260921102957.1024029-1-ryan.zhang@oss.nxp.com>

On Mon, Sep 21, 2026 at 06:29:57PM +0800, ryan.zhang@oss.nxp.com wrote:
> From: Ryan Zhang <ryan.zhang@oss.nxp.com>
> 
> The first read of GPU_TIMESTAMP after the GPU has been idle can return a
> value that lags the real counter, while a read issued immediately after is
> accurate.
> 
> Userspace correlates this timestamp with the host clock, so a stale value
> shows up as skew between the device and host time domains and makes
> dEQP-VK.pipeline.monolithic.timestamp.calibrated.calibration_test fail
> whenever a query happens to hit a large first-read error.
> 
> Signed-off-by: Ryan Zhang <ryan.zhang@oss.nxp.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 720bf889096d..956a147dc282 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -2,6 +2,7 @@
>  /* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
>  /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
>  /* Copyright 2019 Collabora ltd. */
> +/* Copyright 2026 NXP */
>  
>  #ifdef CONFIG_ARM_ARCH_TIMER
>  #include <asm/arch_timer.h>
> @@ -772,6 +773,10 @@ static int panthor_query_timestamp_info(struct panthor_device *ptdev,
>  #else
>  	arg->timestamp_frequency = 0;
>  #endif
> +
> +	/* Dummy read to avoid stale values. */
> +	gpu_read64_counter(ptdev, GPU_TIMESTAMP);
> +
>  	arg->current_timestamp = gpu_read64_counter(ptdev, GPU_TIMESTAMP);
>  	arg->timestamp_offset = gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET);
>  
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
