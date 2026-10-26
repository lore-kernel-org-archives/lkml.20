Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023846;
	b=KOPHlnGn2Jz8pauglWie77yO7iGeAI9ha8ib+pfBkY6VDm4K7LY/DKnKx5AFKte2QxlA
	 Zb6zBqWmjvWJ076G2hocj8JDSFpYSbsC/a+Bi3bzoi58jN+eZ1Nw9HPWzNL9Am3kdNboR
	 ii5seyV37Yo3ekVbZ54AJtBcb5bL246ivnb7ugQejpitTu/80aV0HbFNQG2NLEnOJLZiq
	 c4XsUdY/0YgEzdVeZmmDcqkBbJB3+VvwiZEXqJBRRqEOkjiTNYiR1YPT9//r5l1pvvJRn
	 QHKctOTrMy8NPHSNm4u1mS0dMjclcX+JlfP6SsG2/zPETbocaC/qsvXzuuOEveXpjWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023846;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Y2zLXho5SS0y11t9haMgcXsPoLJBOCMXHdgbb41xv9w=;
	b=H1k0IRgyHvb+pMOiui/yRt02RUCC3796AR8At5bSQgpf6qSoPyhd8OXqv8AMMvKPr2wL
	 ApgaQUU9FE0cKraPtpYDS045NsL4rUkTwAvtGTNHhAAkqD81QouNhwmE5Q7FtDTO6/5Ag
	 xQBq0pkFWVaS2QXUt+Fdrq9ivrX4Inmg4ZbDCzw/CW39jDoY9NDn3hwFP5iH+g124L1ot
	 2E68lxeHDvfCyTbuueXgIYyCByvGzkgXOWis02yes1hRjvanWmMV6QHMMAuYKa7Qr7stb
	 wJQREpCWm3UZHK88CBosWDIADah/+uoNzVlHRU/+8uhB/KI7AL3RSdLY7w+I1NIkusg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YB2D4aEC;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FBBC606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FBBC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YB2D4aEC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A95E62720
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:10:41 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 94F8F3F7B4
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793023844; bh=2sAXnIXAPho4z+s8CQR8tTsNIWs6s/t/uWe+/rNGIpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YB2D4aECcj4szS6a+bbPuoaHrBwwVf3WaWwwbln1yfvkFNLQcHTScfAAsZB1xRruo
	 v1n/k0eabhP1jneY2phGIkpJDEfkYWcLqARTdo27N7EVr48TKV7hvvhwAx0/wXWSOb
	 maTn/8U0fRnWJdVLs8OJZwzq/eTJO4SPKrHLEmVs=
Date: Mon, 26 Oct 2026 14:10:33 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: ryan.zhang@oss.nxp.com
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: dummy read to discard the stale first
 GPU_TIMESTAMP read
Message-ID: <at9fWYkbqFNyLNU0@e142607>
References: <20260921102957.1024029-1-ryan.zhang@oss.nxp.com>
 <20260923102448.2279852-1-ryan.zhang@oss.nxp.com>
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
In-Reply-To: <20260923102448.2279852-1-ryan.zhang@oss.nxp.com>

On Wed, Sep 23, 2026 at 06:24:48PM +0800, ryan.zhang@oss.nxp.com wrote:
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
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Pushed to drm-misc-next.

Best regards,
Liviu

> ---
> v2:
>  - Added the r-b in commit msg.
>  - Rebased on drm-misc-next to resolve conflict.
>  - Moved the dummy read into panthor_gpu_get_timestamp() to align with
>    the refactored timestamp query code on drm-misc-next.
> Note: The original v1 patch was based on v6.18 and applied cleanly there.
> Could we also port v1 into 6.18?
> 
>  drivers/gpu/drm/panthor/panthor_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index a383b04f101e..b8df5663f04e 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -2,6 +2,7 @@
>  /* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
>  /* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
>  /* Copyright 2019 Collabora ltd. */
> +/* Copyright 2026 NXP */
>  
>  #include <linux/bitfield.h>
>  #include <linux/bitmap.h>
> @@ -470,6 +471,9 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
>  
>  u64 panthor_gpu_get_timestamp(struct panthor_device *ptdev)
>  {
> +	/* Dummy read to avoid stale values. */
> +	gpu_read64_counter(ptdev->gpu->iomem, GPU_TIMESTAMP);
> +
>  	return gpu_read64_counter(ptdev->gpu->iomem, GPU_TIMESTAMP);
>  }
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
