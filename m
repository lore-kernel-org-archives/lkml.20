Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792671421;
	b=THsUMRVE8cHVLGQakJgtnZtVtOv6Jbxuy7I9GwoNTuocjD8H7ZYHUrk9bT4ZniytJZh+
	 j2cpOMG0pJFxTe2TDERdKIaw3ZDxvO8Nmt23dASBGXmYL4hct9cAX0SO0qD9l8Pgikwdf
	 geczLZOf6uRUREP9x+Gho01QSSfDRB7FM3SgPPwz34IeKd9vI5kFVjIuIqL/QUsSnerTH
	 4OaxHeGrNSggTIuhELkd3axIlxNzj3Yrx/fZbKSjHHQQYUdCROuMPEtKO6rzo3/MxynaU
	 V0r5P/GQfbc0c7UfQ87KsJ5TdhYzuVgPTl6v0CcamMcj8Gqf8HPgnfYXZZ9Eup1FYJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671421;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Dl0+4y9rpaLG0QiCFT2P0BjBCbwRmBqbxLvb8wuIB28=;
	b=nAslh6UiYj6jGK3gQqEW9J9SBAV9Kl8IS46qTijyRB8CCk03A0oOEkswN4B7zjyN7/FH
	 Z9sYTkygotEj4X9HvL4+mUETLDswgYxHT5aYB4H+WLxIQuaT9QwSZbyN440bR5dA0fMqO
	 HEEMKVPIHWmFak7OcVyD63OrqEBi1ZWVIVAgpHt5sSAqr6reXQJ9CZziJFDdmsGg1VvXv
	 3K27g3KZjgDzQJYNxTVb9ji+5qACtKU/UC6yWScvJSnrUr/gONEps1jPyGnjC2d/xHdCA
	 nStHrqW+aTDkzOQBeD2EwlM5K0IfIyX86YJWkvZ5G0gCNgKYhGTUg+Xyoc+nn6Qtijw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lWVmotgu;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77274606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77274606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lWVmotgu
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A11B2F27
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:16:57 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9BC9A3F7B4
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792671420; bh=iNNPWrLLhrInRpAMKQhmWTnUnRz/l8TgFGAx7zKoFqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWVmotgu3tdLYa+c/YdYPET8O86i8z5cWUHUhRbSuZJB4P5BYovFVg4kfRr374V4J
	 IghywJsiE4wO/I9k5tC+ha9qCJvhXW1rUF9j37q6/nJtww99BuZOhQ4fN2SQr/Tcyq
	 mqG83ijl6cyVTqeO2vuh/QZfhpMJ5UgKV4I9QeVE=
Date: Thu, 22 Oct 2026 13:16:48 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	nd@arm.com
Subject: Re: [PATCH v7 2/8] drm/panthor: Add register definitions for perf
Message-ID: <atn-sGozr05TmZKu@e142607>
References: <20261011-panthor-performance-counters-v7-0-12c32495062f@arm.com>
 <20261011-panthor-performance-counters-v7-2-12c32495062f@arm.com>
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
In-Reply-To: <20261011-panthor-performance-counters-v7-2-12c32495062f@arm.com>

On Sun, Oct 11, 2026 at 06:36:49PM +0100, Lukas Zapolskas wrote:
> The perfcnt_size register, needed to size the FW-side ring buffer, is
> comprised out of two fields, FIRMWARE_SIZE and HARDWARE_SIZE, indicating
> the size of the corresponding components of a single sample. The total
> size of a single sample in that ring buffer is the sum of the two.
> 
> The perfcnt_config register configures the size of the ring buffer, the
> counter set requested by the user, and whether the optional metadata block
> is required.
> 
> For newer FW revisions, the perfcnt_features register reports the
> presence of an optional metadata block.
> 
> GPUs with arch major 11 or greater also report the number of performance
> counters in a single counter block via the GPU_PRFCNT_FEATURES.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_fw.h       | 9 ++++++++-
>  drivers/gpu/drm/panthor/panthor_gpu_regs.h | 4 ++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index a99a9b6f4825..124e2b40b15f 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -198,8 +198,12 @@ struct panthor_fw_global_control_iface {
>  	u32 output_va;
>  	u32 group_num;
>  	u32 group_stride;
> +#define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
> +#define GLB_PERFCNT_HW_SIZE(x) (((x) & GENMASK(15, 0)) << 8)
>  	u32 perfcnt_size;
>  	u32 instr_features;
> +#define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
> +	u32 perfcnt_features;
>  };
>  
>  struct panthor_fw_global_input_iface {
> @@ -208,7 +212,7 @@ struct panthor_fw_global_input_iface {
>  #define GLB_CFG_ALLOC_EN			BIT(2)
>  #define GLB_CFG_POWEROFF_TIMER			BIT(3)
>  #define GLB_PROTM_ENTER				BIT(4)
> -#define GLB_PERFCNT_EN				BIT(5)
> +#define GLB_PERFCNT_ENABLE			BIT(5)
>  #define GLB_PERFCNT_SAMPLE			BIT(6)
>  #define GLB_COUNTER_EN				BIT(7)
>  #define GLB_PING				BIT(8)
> @@ -248,6 +252,9 @@ struct panthor_fw_global_input_iface {
>  	u64 perfcnt_base;
>  	u32 perfcnt_extract;
>  	u32 reserved3[3];
> +#define GLB_PERFCNT_CONFIG_SIZE(x) ((x) & GENMASK(7, 0))
> +#define GLB_PERFCNT_CONFIG_SET(x) (((x) & GENMASK(1, 0)) << 8)
> +#define GLB_PERFCNT_METADATA_ENABLE BIT(10)
>  	u32 perfcnt_config;
>  	u32 perfcnt_csg_select;
>  	u32 perfcnt_fw_enable;
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu_regs.h b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> index 4c5b953796e4..2f0877068e44 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> @@ -23,6 +23,7 @@
>  #define GPU_TILER_FEATURES				0xC
>  #define GPU_MEM_FEATURES				0x10
>  #define   GROUPS_L2_COHERENT				BIT(0)
> +#define   GPU_MEM_FEATURES_L2_SLICES(x)			((((x) & GENMASK(11, 8)) >> 8) + 1)
>  
>  #define GPU_MMU_FEATURES				0x14
>  #define  GPU_MMU_FEATURES_VA_BITS(x)			((x) & GENMASK(7, 0))
> @@ -69,6 +70,9 @@
>  #define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
>  #define   GPU_FEATURES_RAY_TRAVERSAL			BIT(5)
>  
> +#define GPU_PRFCNT_FEATURES				0x68
> +#define   PRFCNT_FEATURES_COUNTER_BLOCK_SIZE(x)		(((x) & GENMASK(7, 0)) << 8)
> +
>  #define GPU_TIMESTAMP_OFFSET				0x88
>  #define GPU_CYCLE_COUNT					0x90
>  #define GPU_TIMESTAMP					0x98
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
