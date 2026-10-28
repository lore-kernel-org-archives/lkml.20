Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203077;
	b=rA9gJ6+MIc6lspfoSLDE6mUGCDzEq7E50L+LqRAd+pwNYxrqrTuMzfVsVSHKAQ2LDNcK
	 3cwRKhfuigu/ufYfnyeKaBQcc+5ndNWJIZDczysrxM0E1Z7Wmrsos7G6dctCt3VMlav8m
	 AEob6juvlW3hIxD6WEOPyfZ/HnVJ+TjqRpQLBLDOHNxM0/ryXFsBqOthHoDCw7OjQkQhB
	 Lw3fhxufb6u5k+0O68v7o4MItJA2Hk9ZD4Vrw2cWMBIuVq3W7V2hnGinxLjRY/mndHYEl
	 rajMyPSA5l33rvaWvRq5WITb+K1Mk80IRSEgoTmxnsxnznW0VEW++2YZwWX8rykEIPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203077;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ImZLJM0Q4Gb7axhyP4kpPkXr3ZGCEv1jmEakR1p4wH0=;
	b=LpsNe2a2EsNQTvICK8i3RXffnvIhcXbpi3sYMF2Ry28iDC1dXHj+ZooIvXQ0855y/QRo
	 +RxqOxx+vIQdya8aj6h8HdGl8iwKIwiketoLy12fCuwgCBcn9oXfsLPYVHRha3mVa6p+C
	 2Gffx96ShSSJ0UKIp1Y/ZM4KAla+F0yqtCRTPf8dJgRQKEYJF/XNCSqVFO4TzdxtaNuo7
	 g673aL3DVVjWfU0RA+7jOgTZyLGLMlAD0gxbpfCvKAGuw+0Ul8mVETLKd7uzAdqm8/ds2
	 JsOuHJ5OHQ68NFJ4NU+bMYYz3S6AUbPKQHZqckpS3hrVR1tC9oYs93vnhwyqSzP5g2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=e5Ko31zG;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C9F606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C9F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=e5Ko31zG
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9FCB1756
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:57:52 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC1E43F673
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793203076; bh=txQmD3ouPDSBPgZC5W9cfkGiI+1/33A6oWKISoZaYhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5Ko31zGFkMhl0JQoGbEBtw3JFOvHYy4recozeS312DWjFBdHNDgzJEcoWQ7vO3E1
	 nxx1Fv9zg5DTqD9Flo5J9LX91gmz6vT37J71NDqhXl/JtoBv6Y+YYhDJUBffV+yXw9
	 RbLFgaNyqrlrxlx3ewphUDKGP9kONrGdvsILMe8k=
Date: Wed, 28 Oct 2026 15:57:44 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v1 03/27] drm/panthor: Parse and store GPU_ID fields
Message-ID: <auIbeK8uH-ZWRyu-@e142607>
References: <20260922204535.2850094-1-karunika.choo@arm.com>
 <20260922204535.2850094-4-karunika.choo@arm.com>
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
In-Reply-To: <20260922204535.2850094-4-karunika.choo@arm.com>

On Tue, Sep 22, 2026 at 09:44:57PM +0100, Karunika Choo wrote:
> Prepare for Mali v15, where GPU_ID expands to 64 bits and its field
> layout changes.
> 
> Introduce a small panthor_gpu_id structure and parse the GPU_ID fields
> once during hardware initialization. Convert existing users to consume
> the cached fields instead of extracting them repeatedly from the raw
> register value.
> 
> This centralizes GPU_ID decoding and makes it easier to support both the
> existing and v15 formats.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> v1:
> - changed struct panthor_gpu_id into a flat structure instead of
>   inconsistent groupings.
> 
>  drivers/gpu/drm/panthor/panthor_device.h | 29 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_fw.c     |  4 ++--
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  2 +-
>  drivers/gpu/drm/panthor/panthor_hw.c     | 26 ++++++++++++++-------
>  drivers/gpu/drm/panthor/panthor_hw.h     |  3 +--
>  5 files changed, 51 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 54031c5252473..ba93a100ceda2 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -110,6 +110,32 @@ struct panthor_irq {
>  	enum panthor_irq_state state;
>  };
>  
> +/**
> + * struct panthor_gpu_id - Parsed GPU_ID fields
> + */
> +struct panthor_gpu_id {
> +	/** @arch_major: Architecture major revision */
> +	u8 arch_major;
> +
> +	/** @arch_minor: Architecture minor revision */
> +	u8 arch_minor;
> +
> +	/** @arch_rev: Architecture patch revision */
> +	u8 arch_rev;
> +
> +	/** @prod_major: Product identifier */
> +	u8 prod_major;
> +
> +	/** @ver_major: Major release version number */
> +	u8 ver_major;
> +
> +	/** @ver_minor: Minor release version number */
> +	u8 ver_minor;
> +
> +	/** @ver_status: Status of GPU release */
> +	u8 ver_status;
> +};
> +
>  /**
>   * enum panthor_device_profiling_mode - Profiling state
>   */
> @@ -169,6 +195,9 @@ struct panthor_device {
>  	/** @mmu_info: MMU info */
>  	struct drm_panthor_mmu_info mmu_info;
>  
> +	/** @gpu_id: Parsed GPU_ID fields */
> +	struct panthor_gpu_id gpu_id;
> +
>  	/** @hw: GPU-specific data. */
>  	struct panthor_hw *hw;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 4f1fab66a13bf..13efed3a2ea72 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -809,8 +809,8 @@ static int panthor_fw_load(struct panthor_device *ptdev)
>  	int ret;
>  
>  	snprintf(fw_path, sizeof(fw_path), "arm/mali/arch%d.%d/%s",
> -		 (u32)GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id),
> -		 (u32)GPU_ARCH_MINOR(ptdev->gpu_info.gpu_id),
> +		 (u32)ptdev->gpu_id.arch_major,
> +		 (u32)ptdev->gpu_id.arch_minor,
>  		 CSF_FW_NAME);
>  
>  	ret = request_firmware(&fw, fw_path, ptdev->base.dev);
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index a383b04f101ed..ade2646e2caf6 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -73,7 +73,7 @@ static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
>  	if (!data || !data->asn_hash_enable)
>  		return;
>  
> -	if (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) < 11) {
> +	if (ptdev->gpu_id.arch_major < 11) {
>  		drm_err(&ptdev->base, "Custom ASN hash not supported by the device");
>  		return;
>  	}
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 4c96573b649a1..2143e57d48106 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -119,9 +119,9 @@ void panthor_hw_power_status_unregister(void)
>  
>  static char *get_gpu_model_name(struct panthor_device *ptdev)
>  {
> -	const u32 gpu_id = ptdev->gpu_info.gpu_id;
> -	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
> -						GPU_PROD_MAJOR(gpu_id));
> +	const struct panthor_gpu_id *gpu_id = &ptdev->gpu_id;
> +	const u32 product_id = GPU_PROD_ID_MAKE(gpu_id->arch_major,
> +						gpu_id->prod_major);
>  	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
>  					 GPU_FEATURES_RAY_INTERSECTION);
>  	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
> @@ -245,13 +245,13 @@ static int panthor_hw_info_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> -	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
> -	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
> -	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
> +	major = ptdev->gpu_id.ver_major;
> +	minor = ptdev->gpu_id.ver_minor;
> +	status = ptdev->gpu_id.ver_status;
>  
>  	drm_info(&ptdev->base,
>  		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> -		 get_gpu_model_name(ptdev), ptdev->gpu_info.gpu_id >> 16,
> +		 get_gpu_model_name(ptdev), ptdev->gpu_id.prod_major,
>  		 major, minor, status);
>  
>  	drm_info(&ptdev->base,
> @@ -273,7 +273,7 @@ static int panthor_hw_info_init(struct panthor_device *ptdev)
>  static int panthor_hw_bind_device(struct panthor_device *ptdev)
>  {
>  	struct panthor_hw *hdev = NULL;
> -	const u32 arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
> +	const u32 arch_major = ptdev->gpu_id.arch_major;
>  	int i = 0;
>  
>  	for (i = 0; i < ARRAY_SIZE(panthor_hw_match); i++) {
> @@ -295,10 +295,20 @@ static int panthor_hw_bind_device(struct panthor_device *ptdev)
>  
>  static int panthor_hw_gpu_id_init(struct panthor_device *ptdev)
>  {
> +	struct panthor_gpu_id *gpu_id = &ptdev->gpu_id;
>  	ptdev->gpu_info.gpu_id = gpu_read(ptdev->iomem, GPU_ID);
> +
>  	if (!ptdev->gpu_info.gpu_id)
>  		return -ENXIO;
>  
> +	gpu_id->arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
> +	gpu_id->arch_minor = GPU_ARCH_MINOR(ptdev->gpu_info.gpu_id);
> +	gpu_id->arch_rev = GPU_ARCH_REV(ptdev->gpu_info.gpu_id);
> +	gpu_id->prod_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
> +	gpu_id->ver_major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
> +	gpu_id->ver_minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
> +	gpu_id->ver_status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index f797663893b2d..bdda3b10e660a 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -5,7 +5,6 @@
>  #define __PANTHOR_HW_H__
>  
>  #include "panthor_device.h"
> -#include "panthor_gpu_regs.h"
>  
>  /**
>   * struct panthor_hw_ops - HW operations that are specific to a GPU
> @@ -58,7 +57,7 @@ static inline void panthor_hw_l2_power_off(struct panthor_device *ptdev)
>  
>  static inline bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
>  {
> -	return GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) >= 14;
> +	return ptdev->gpu_id.arch_major >= 14;
>  }
>  
>  #endif /* __PANTHOR_HW_H__ */
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
