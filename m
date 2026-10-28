Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203412;
	b=FhBFcEOafyQZsnwkCGPqEwizyAR54hKmXMAKlYY7zI9eZZP9RKQ8RRowKKL62obQ/vAw
	 kNVJ/AOJVXDQ4mkPffjTks8hjZXIrE6qu7Q5bz5zDIcFPfOD+YufAXGTTdqXfxxDezrjn
	 xNTH2jeynznh2FJHXowxmt2aITJHU04j7GycrNh4GTFIDCdzawzzmuXKIMCVO8n0PAGDJ
	 jsGQvp9AOqHaYn+efhXg9C23lL5cQXIZu1QFmyMgPEEnqyqergUucYIqQ7//l2iWh4DXy
	 rpu9WyAb4BC4pU++g5+gOir1WP0yibIEzZ8zqVaDNcEWGKm9PZZtRxjMp0TapuBiDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203412;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=QiLWCzzd107+2dR+tglXudYvr8B2VeboljFrR/xOofo=;
	b=xcQ+uRNSpfAsM5FOISR05VDxTKESRLyCT+3x031nSBTPuq20TvE9YkEfcXVmvf+/2O8J
	 LaWPsPWwzRQuTZPG8m9bnZ518wrya24rInb0EbqBzUf63Vpk9MSe2RwzFMiZY1AN8bmqd
	 evt+FtxzsncBS3q4ku1ZckO3R9MCCXobiFN6e2achjmLJIzjqufmCdHPDqPZOqbuISs0i
	 gHA/baDNrHN410dmOQpnLGERbIZmlL7iEdUy3ChgLlOwk8DLD0SvTv/yxwVwoqA6hojYl
	 69yTG5TuKVBtdt6SHbavzpfm1MftVAe7Rqsb1G9dFyYS8YnmcBNYT1pmL256m+4J75A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QA69jcs4;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC71B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC71B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QA69jcs4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5889175D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:03:27 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE52E3F59E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793203411; bh=CMZVJ5YT9JJ8tpX8bI1KqzXScFcovvI/hSXWXqZPaDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QA69jcs4ZFCJ2cImlSaUNfklbPcEJGab72+awrxZ7z1FuwIC2iwCBcVJ4Thuj1zC4
	 BWcp5z+qrqlT/nfkYB3n4t34qxq+2WVUfuBGMwZOsBA0LgxIdxGHchIA3Y3M9GjNZ2
	 VDM0VNRTlemYzm8rkY+s5k5DzKlB1qcZIPgl6Sn0=
Date: Wed, 28 Oct 2026 16:03:25 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v1 05/27] drm/panthor: Move register base offsets to the
 HW description
Message-ID: <auIczSl53RK5AG9t@e142607>
References: <20260922204535.2850094-1-karunika.choo@arm.com>
 <20260922204535.2850094-6-karunika.choo@arm.com>
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
In-Reply-To: <20260922204535.2850094-6-karunika.choo@arm.com>

On Tue, Sep 22, 2026 at 09:44:59PM +0100, Karunika Choo wrote:
> Mali v15 reorders several register regions, including GPU_CONTROL,
> MCU_CONTROL and PWR_CONTROL, so the driver can no longer assume a single
> fixed base layout across all supported GPUs.
> 
> Add per-GPU register base offsets to the panthor hardware description
> and switch the GPU, FW and PWR local iomem setup to use those stored
> values. With the base addresses now owned by the hardware description,
> drop the corresponding fixed base-offset definitions from the register
> headers.
> 
> This prepares the driver for GPUs with different register layouts
> without changing the existing behaviour on currently supported parts.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> v1:
> - rebased on drm-misc-next
> - use a generic panthor_hw_regbank structure for all register offsets.
> 
>  drivers/gpu/drm/panthor/panthor_fw.c       |  2 +-
>  drivers/gpu/drm/panthor/panthor_fw_regs.h  |  2 --
>  drivers/gpu/drm/panthor/panthor_gpu.c      |  4 +--
>  drivers/gpu/drm/panthor/panthor_gpu_regs.h |  2 --
>  drivers/gpu/drm/panthor/panthor_hw.c       | 23 +++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_hw.h       | 29 ++++++++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_pwr.c      |  2 +-
>  drivers/gpu/drm/panthor/panthor_pwr_regs.h |  2 --
>  8 files changed, 52 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 13efed3a2ea72..679ea1d233d53 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1500,7 +1500,7 @@ int panthor_fw_init(struct panthor_device *ptdev)
>  	if (!fw)
>  		return -ENOMEM;
>  
> -	fw->iomem = ptdev->iomem + MCU_CONTROL_BASE;
> +	fw->iomem = ptdev->iomem + ptdev->hw->regs.mcu_control.offset;
>  	ptdev->fw = fw;
>  	init_waitqueue_head(&fw->req_waitqueue);
>  	INIT_LIST_HEAD(&fw->sections);
> diff --git a/drivers/gpu/drm/panthor/panthor_fw_regs.h b/drivers/gpu/drm/panthor/panthor_fw_regs.h
> index b2e59cfc22b00..a3492f7f913f9 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw_regs.h
> @@ -4,8 +4,6 @@
>  #ifndef __PANTHOR_FW_REGS_H__
>  #define __PANTHOR_FW_REGS_H__
>  
> -#define MCU_CONTROL_BASE				0x700
> -
>  #define MCU_CONTROL					0x0
>  #define   MCU_CONTROL_ENABLE				1
>  #define   MCU_CONTROL_AUTO				2
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index ade2646e2caf6..d6534fabc682e 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -158,7 +158,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>  	if (!gpu)
>  		return -ENOMEM;
>  
> -	gpu->iomem = ptdev->iomem + GPU_CONTROL_BASE;
> +	gpu->iomem = ptdev->iomem + ptdev->hw->regs.gpu_control.offset;
>  	spin_lock_init(&gpu->reqs_lock);
>  	init_waitqueue_head(&gpu->reqs_acked);
>  	mutex_init(&gpu->cache_flush_lock);
> @@ -175,7 +175,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>  		return irq;
>  
>  	ret = panthor_irq_request(ptdev, &ptdev->gpu->irq, irq,
> -				  ptdev->iomem + GPU_INT_BASE, "gpu",
> +				  gpu->iomem + GPU_INT_BASE, "gpu",
>  				  panthor_gpu_irq_threaded_handler);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu_regs.h b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> index 4c5b953796e4f..753df87009901 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> @@ -4,8 +4,6 @@
>  #ifndef __PANTHOR_GPU_REGS_H__
>  #define __PANTHOR_GPU_REGS_H__
>  
> -#define GPU_CONTROL_BASE				0x0
> -
>  #define GPU_ID						0x0
>  #define   GPU_ARCH_MAJOR(x)				((x) >> 28)
>  #define   GPU_ARCH_MINOR(x)				(((x) & GENMASK(27, 24)) >> 24)
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 40012ba7e23ca..2ca5a334f5817 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -37,6 +37,14 @@ static struct panthor_hw panthor_hw_arch_v10 = {
>  		.power_changed_off = panthor_gpu_power_changed_off,
>  		.power_changed_on = panthor_gpu_power_changed_on,
>  	},
> +	.regs = {
> +		.gpu_control = {
> +			.offset = 0x0,
> +		},
> +		.mcu_control = {
> +			.offset = 0x700,
> +		},
> +	},
>  };
>  
>  static struct panthor_hw panthor_hw_arch_v14 = {
> @@ -45,6 +53,17 @@ static struct panthor_hw panthor_hw_arch_v14 = {
>  		.l2_power_off = panthor_pwr_l2_power_off,
>  		.l2_power_on = panthor_pwr_l2_power_on,
>  	},
> +	.regs = {
> +		.gpu_control = {
> +			.offset = 0x0,
> +		},
> +		.mcu_control = {
> +			.offset = 0x700,
> +		},
> +		.pwr_control = {
> +			.offset = 0x800,
> +		},
> +	},
>  };
>  
>  static struct panthor_hw_entry panthor_hw_match[] = {
> @@ -196,7 +215,7 @@ static int panthor_gpu_info_init(struct panthor_device *ptdev)
>  {
>  	unsigned int i;
>  
> -	void __iomem *gpu_iomem = ptdev->iomem + GPU_CONTROL_BASE;
> +	void __iomem *gpu_iomem = ptdev->iomem + ptdev->hw->regs.gpu_control.offset;
>  
>  	ptdev->gpu_info.csf_id = gpu_read(gpu_iomem, GPU_CSF_ID);
>  	ptdev->gpu_info.gpu_rev = gpu_read(gpu_iomem, GPU_REVID);
> @@ -222,7 +241,7 @@ static int panthor_gpu_info_init(struct panthor_device *ptdev)
>  	ptdev->gpu_info.gpu_features = gpu_read64(gpu_iomem, GPU_FEATURES);
>  
>  	if (panthor_hw_has_pwr_ctrl(ptdev)) {
> -		void __iomem *pwr_iomem = gpu_iomem + PWR_CONTROL_BASE;
> +		void __iomem *pwr_iomem = ptdev->iomem + ptdev->hw->regs.pwr_control.offset;
>  
>  		/* Introduced in arch 14.x */
>  		ptdev->gpu_info.l2_present = gpu_read64(pwr_iomem, PWR_L2_PRESENT);
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index bdda3b10e660a..9231c18af94d1 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -26,14 +26,39 @@ struct panthor_hw_ops {
>  	void (*power_changed_off)(struct panthor_device *ptdev);
>  };
>  
> +/** struct panthor_hw_regbank - Register offset and instance stride information */
> +struct panthor_hw_regbank {
> +	/** @offset: Register offset relative to &struct panthor_device.iomem */
> +	u32 offset;
> +
> +	/**
> +	 * @stride: Register offset between instances, or 0 for non-instanced
> +	 * registers
> +	 */
> +	u32 stride;
> +};
> +
> +/** struct panthor_hw_regs_layout - Hardware register bank layout */
> +struct panthor_hw_regs_layout {
> +	/** @gpu_control: GPU_CONTROL register bank layout */
> +	struct panthor_hw_regbank gpu_control;
> +
> +	/** @pwr_control: PWR_CONTROL register bank layout */
> +	struct panthor_hw_regbank pwr_control;
> +
> +	/** @mcu_control: MCU_CONTROL register bank layout */
> +	struct panthor_hw_regbank mcu_control;
> +};
> +
>  /**
>   * struct panthor_hw - GPU specific register mapping and functions
>   */
>  struct panthor_hw {
> -	/** @features: Bitmap containing panthor_hw_feature */
> -
>  	/** @ops: Panthor HW specific operations */
>  	struct panthor_hw_ops ops;
> +
> +	/** @regs: Hardware register bank layout */
> +	struct panthor_hw_regs_layout regs;
>  };
>  
>  int panthor_hw_init(struct panthor_device *ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
> index dd7b6ef8ea209..cc2e01595f23b 100644
> --- a/drivers/gpu/drm/panthor/panthor_pwr.c
> +++ b/drivers/gpu/drm/panthor/panthor_pwr.c
> @@ -480,7 +480,7 @@ int panthor_pwr_init(struct panthor_device *ptdev)
>  	if (!pwr)
>  		return -ENOMEM;
>  
> -	pwr->iomem = ptdev->iomem + PWR_CONTROL_BASE;
> +	pwr->iomem = ptdev->iomem + ptdev->hw->regs.pwr_control.offset;
>  	spin_lock_init(&pwr->reqs_lock);
>  	init_waitqueue_head(&pwr->reqs_acked);
>  	ptdev->pwr = pwr;
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr_regs.h b/drivers/gpu/drm/panthor/panthor_pwr_regs.h
> index 9cf7a715066f8..05f5b48e6a39a 100644
> --- a/drivers/gpu/drm/panthor/panthor_pwr_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_pwr_regs.h
> @@ -4,8 +4,6 @@
>  #ifndef __PANTHOR_PWR_REGS_H__
>  #define __PANTHOR_PWR_REGS_H__
>  
> -#define PWR_CONTROL_BASE				0x800
> -
>  #define PWR_INT_BASE					0x0
>  #define   PWR_IRQ_POWER_CHANGED_SINGLE			BIT(0)
>  #define   PWR_IRQ_POWER_CHANGED_ALL			BIT(1)
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
