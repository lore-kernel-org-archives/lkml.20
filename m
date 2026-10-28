Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202727;
	b=5lekVVXQLUvD5wlfGPak3bCzUVhzYprRuSGpDVciDiVL/KEB81ANbDvjxvM6g2Z3iZVi
	 OncAG1kHqrvJ1J/CYB24s4Cb/yn1Fpm0YUALSMk6ARydkunEXsEiCWy4+s1kpm0890ldC
	 vmKHZo17NsxnocBOecq//S+j4FwLi9kgXo3PPyV8BVH5QQM5TQWr8qxh1Jy+96bP4t9+N
	 Rq+Hd40Jf6bzleoWBcGqpeclvwNOhN13nmRW7rsOnFFeNNnD4EguhM23CpJSnFPMQm7B/
	 UwxNdmLS06g/C8jKRkJ0YQfsGr2RyX+svXEMcVx9SPtB4x1ZaEBHb1mOMAHjsRhToXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202727;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=VSOzPZuWkuVtOo5uuD2wK03YOIfxcP5VC2PCRqN7c9I=;
	b=GCnCHMUuE0j8/jKognMPrdUejoF8YYiNEZkVOgCryjjQoc/9TYTqxmDNpjMB1JssNFcv
	 u5MBBMez52hYU2l79iKp14BRWAEc0pBCl8ow2p67HaiwyFV8KVgA/+KfxREp4XAL0Dobj
	 F0N/X0If+ZopdzQ4xNApEqd+6WmUipYaH/f8yOat9OGVSEyUQnOFLsCuaQ4EQfA2h1uJt
	 zTyvZQxptqn1WLYOd0CzUb8+xRTkJY9Phch2CSA0RfGoRERNnPAfDstfX2cr3W4WIhRoo
	 Z4xe7BdS7Y06of6DbVEK/T9qtxyEsiNhlDYKqzdqkNBZYL+CTQIeaiss/31b76DmMZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kR3744yU;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8ED3606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8ED3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kR3744yU
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0B84175D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:52:01 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D3E8D3F673
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793202725; bh=oHHZ8DhzfXs4MUGZ9+6PoZi4Xb1MrhxkebKog/hBHfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kR3744yU4r3Pi2zMW/UQ7rB3Kk3htnqFDVKJSKLzLf3NREnovXmVelGxxzBhi/pwk
	 GTMli4oOdmtj+7vxPvZ7whGc5LNb2rmhuKYRkrYeaLEj8QFqzbSxQFsW89uOZaD4Co
	 /64nPpHSHDd33Lzx413Z9ySledorw5kbniy5566k=
Date: Wed, 28 Oct 2026 15:52:00 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v1 02/27] drm/panthor: Move register access helpers out
 of panthor_device.h
Message-ID: <auIaIHhUtJDgqmB7@e142607>
References: <20260922204535.2850094-1-karunika.choo@arm.com>
 <20260922204535.2850094-3-karunika.choo@arm.com>
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
In-Reply-To: <20260922204535.2850094-3-karunika.choo@arm.com>

On Tue, Sep 22, 2026 at 09:44:56PM +0100, Karunika Choo wrote:
> Move register access helpers out of panthor_device.h to allow reuse by
> other panthor drivers that will be added to enable v15 support.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> v1:
> - Includes "panthor_device_io.h" directly in "panthor_device.h" instead
>   of peppering multiple files with the header.
> 
>  drivers/gpu/drm/panthor/panthor_device.h    | 74 +-----------------
>  drivers/gpu/drm/panthor/panthor_device_io.h | 83 +++++++++++++++++++++
>  2 files changed, 85 insertions(+), 72 deletions(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device_io.h
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index b55a3f9edd414..54031c5252473 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -6,7 +6,6 @@
>  #ifndef __PANTHOR_DEVICE_H__
>  #define __PANTHOR_DEVICE_H__
> 
> -#include <linux/atomic.h>
>  #include <linux/io-pgtable.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/pm_runtime.h>
> @@ -19,6 +18,8 @@
>  #include <drm/gpu_scheduler.h>
>  #include <drm/panthor_drm.h>
> 
> +#include "panthor_device_io.h"
> +
>  struct panthor_csf;
>  struct panthor_csf_ctx;
>  struct panthor_device;
> @@ -495,77 +496,6 @@ panthor_exception_is_fault(u32 exception_code)
>  const char *panthor_exception_name(struct panthor_device *ptdev,
>  				   u32 exception_code);
> 
> -static inline void gpu_write(void __iomem *iomem, u32 reg, u32 data)
> -{
> -	writel(data, iomem + reg);
> -}
> -
> -static inline u32 gpu_read(void __iomem *iomem, u32 reg)
> -{
> -	return readl(iomem + reg);
> -}
> -
> -static inline u32 gpu_read_relaxed(void __iomem *iomem, u32 reg)
> -{
> -	return readl_relaxed(iomem + reg);
> -}
> -
> -static inline void gpu_write64(void __iomem *iomem, u32 reg, u64 data)
> -{
> -	gpu_write(iomem, reg, lower_32_bits(data));
> -	gpu_write(iomem, reg + 4, upper_32_bits(data));
> -}
> -
> -static inline u64 gpu_read64(void __iomem *iomem, u32 reg)
> -{
> -	return (gpu_read(iomem, reg) | ((u64)gpu_read(iomem, reg + 4) << 32));
> -}
> -
> -static inline u64 gpu_read64_relaxed(void __iomem *iomem, u32 reg)
> -{
> -	return (gpu_read_relaxed(iomem, reg) |
> -		((u64)gpu_read_relaxed(iomem, reg + 4) << 32));
> -}
> -
> -static inline u64 gpu_read64_counter(void __iomem *iomem, u32 reg)
> -{
> -	u32 lo, hi1, hi2;
> -	do {
> -		hi1 = gpu_read(iomem, reg + 4);
> -		lo = gpu_read(iomem, reg);
> -		hi2 = gpu_read(iomem, reg + 4);
> -	} while (hi1 != hi2);
> -	return lo | ((u64)hi2 << 32);
> -}
> -
> -#define gpu_read_poll_timeout(iomem, reg, val, cond, delay_us, timeout_us)	\
> -	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false,	\
> -			  iomem, reg)
> -
> -#define gpu_read_poll_timeout_atomic(iomem, reg, val, cond, delay_us,		\
> -				     timeout_us)				\
> -	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us,	\
> -				 false, iomem, reg)
> -
> -#define gpu_read64_poll_timeout(iomem, reg, val, cond, delay_us, timeout_us)	\
> -	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,	\
> -			  iomem, reg)
> -
> -#define gpu_read64_poll_timeout_atomic(iomem, reg, val, cond, delay_us,		\
> -				       timeout_us)				\
> -	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us,	\
> -				 false, iomem, reg)
> -
> -#define gpu_read_relaxed_poll_timeout_atomic(iomem, reg, val, cond, delay_us,	\
> -					     timeout_us)			\
> -	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,		\
> -				 timeout_us, false, iomem, reg)
> -
> -#define gpu_read64_relaxed_poll_timeout(iomem, reg, val, cond, delay_us,	\
> -					timeout_us)				\
> -	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us,	\
> -			  false, iomem, reg)
> -
>  #define INT_RAWSTAT 0x0
>  #define INT_CLEAR   0x4
>  #define INT_MASK    0x8
> diff --git a/drivers/gpu/drm/panthor/panthor_device_io.h b/drivers/gpu/drm/panthor/panthor_device_io.h
> new file mode 100644
> index 0000000000000..2287a0d9f86c2
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_device_io.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2026 ARM Limited. All rights reserved. */
> +
> +#ifndef __PANTHOR_DEVICE_IO_H__
> +#define __PANTHOR_DEVICE_IO_H__
> +
> +#include <linux/atomic.h>
> +#include <linux/io.h>
> +
> +
> +static inline void gpu_write(void __iomem *iomem, u32 reg, u32 data)
> +{
> +	writel(data, iomem + reg);
> +}
> +
> +static inline u32 gpu_read(void __iomem *iomem, u32 reg)
> +{
> +	return readl(iomem + reg);
> +}
> +
> +static inline u32 gpu_read_relaxed(void __iomem *iomem, u32 reg)
> +{
> +	return readl_relaxed(iomem + reg);
> +}
> +
> +static inline void gpu_write64(void __iomem *iomem, u32 reg, u64 data)
> +{
> +	gpu_write(iomem, reg, lower_32_bits(data));
> +	gpu_write(iomem, reg + 4, upper_32_bits(data));
> +}
> +
> +static inline u64 gpu_read64(void __iomem *iomem, u32 reg)
> +{
> +	return (gpu_read(iomem, reg) | ((u64)gpu_read(iomem, reg + 4) << 32));
> +}
> +
> +static inline u64 gpu_read64_relaxed(void __iomem *iomem, u32 reg)
> +{
> +	return (gpu_read_relaxed(iomem, reg) |
> +		((u64)gpu_read_relaxed(iomem, reg + 4) << 32));
> +}
> +
> +static inline u64 gpu_read64_counter(void __iomem *iomem, u32 reg)
> +{
> +	u32 lo, hi1, hi2;
> +	do {
> +		hi1 = gpu_read(iomem, reg + 4);
> +		lo = gpu_read(iomem, reg);
> +		hi2 = gpu_read(iomem, reg + 4);
> +	} while (hi1 != hi2);
> +	return lo | ((u64)hi2 << 32);
> +}
> +
> +#define gpu_read_poll_timeout(iomem, reg, val, cond, delay_us, timeout_us)	\
> +	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false,	\
> +			  iomem, reg)
> +
> +#define gpu_read_poll_timeout_atomic(iomem, reg, val, cond, delay_us,		\
> +				     timeout_us)				\
> +	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us,	\
> +				 false, iomem, reg)
> +
> +#define gpu_read64_poll_timeout(iomem, reg, val, cond, delay_us, timeout_us)	\
> +	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,	\
> +			  iomem, reg)
> +
> +#define gpu_read64_poll_timeout_atomic(iomem, reg, val, cond, delay_us,		\
> +				       timeout_us)				\
> +	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us,	\
> +				 false, iomem, reg)
> +
> +#define gpu_read_relaxed_poll_timeout_atomic(iomem, reg, val, cond, delay_us,	\
> +					     timeout_us)			\
> +	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,		\
> +				 timeout_us, false, iomem, reg)
> +
> +#define gpu_read64_relaxed_poll_timeout(iomem, reg, val, cond, delay_us,	\
> +					timeout_us)				\
> +	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us,	\
> +			  false, iomem, reg)
> +
> +
> +#endif /* __PANTHOR_DEVICE_IO_H__ */
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
