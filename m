Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB333A1E81
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097989; cv=pass; b=NjZI3LDFU1CqVLCQ8fsVzTNj9x4WWW8JiIeX9FA2qG93/PkQgIfHzrgFAaDiTUDSzikPt5ODIb7B6Coynl5C2IQjJoS8ME6PW7kDv3RBAyOP6htxKLPd6x0iVu52lnaSIDawHBR0oECty42JZfgwLASn4iRX4p1f1SC0pwRjVgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097989; c=relaxed/simple;
	bh=auynPE4YRBTaiiG4cgY7GxNXwzKmvro3WBl+seSvTRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEP6KnHi8mfceQqfhUyYb8n6JlWd/DSClb4VsAhq6W7n9b+eLseZCH2H6WpspdcAFswdXljFBcS1Ni8Az7X/jnvzvCNNYQO9LfHrPsvha9n6qaLcCCYasxHtNyXa53JEiRoDXHGToNJsTUMmeeaguFRAKFiVZkC8AFSkV5okw0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=c18TE1cT; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="c18TE1cT"
ARC-Seal: i=1; a=rsa-sha256; t=1789097972; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Fm49Z0y2pAXY/TrkvUqdxqF/cQfpvFDi2CnuJaiTSkLCCHzEReYD/EsoVojFcKlslxzMCGDH3lBYVLTm/nF5uh7EjuYRizUhzl2BTnVueBisVdDBDJc3zznB2yCcXNUzjfAMVb/YIf+Coz7DPy7OoZPsv+gMS53aRd21cZasyAA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789097972; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=57dzH60RbZLQeq1ftu6Jokwp58QAUEfKkymOQdUzHZo=; 
	b=FJylqJ09cuqKqB/Gug+VpEo0bTVKtxOcrVOaFulh5iyGLRfgJE+37/NAIjE16j1aeT8IhJhZIsb7GTY3OR1JGVV4vWEYWgWjFYxN7u+v0Ko9Om751DVLv2Yn9v8e7ortkCsdQTrARrv6o6s4drFN8dDaowNs+hxRhRHvSR2xslU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789097972;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=57dzH60RbZLQeq1ftu6Jokwp58QAUEfKkymOQdUzHZo=;
	b=c18TE1cTkmfjYQhYektofXoBexo1ZWqfsFqGfT+8ixrIHcbQI5USFUHf47AOVFwv
	3lemgqYbC1rlyboHmrL+Bt1bv/AHqizLvEaSlniySJa09WdbmTCaZVahm/gsbl/E7tb
	TJfP0/4d8zMCoVmShgYr2vdEcXwqiZYRFSRqbzCo=
Received: by mx.zohomail.com with SMTPS id 1789097972473312.92150154004;
	Thu, 10 Sep 2026 20:39:32 -0700 (PDT)
Date: Fri, 11 Sep 2026 04:39:28 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/18] drm/panthor: Let l2_power_off return errors and
 force users to check it
Message-ID: <aqMblxYoeXJuTJth@sobremesa>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
 <20260826-panthor-unplug-fixes-v4-12-982cc8f4234b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-panthor-unplug-fixes-v4-12-982cc8f4234b@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.74.40

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 26.08.2026 16:56, Boris Brezillon wrote:
> The MMU logic assumes that, after a suspend, all the AS that were
> resident before the suspend are free to leave their slot because the HW
> is inactive until the next resume request. This doesn't hold if we
> ignore failures to power-off the L2 block.
> 
> Let's propagate the error from the PWR backend to
> panthor_gpu_l2_power_off(), and adjust panthor_gpu_suspend() to
> escalate to slow reset when a fast reset is not possible. Add a
> __must_check on panthor_hw_l2_power_off() to make sure new users
> don't forget that they have to check the returned value.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c  |  2 +-
>  drivers/gpu/drm/panthor/panthor_gpu.c | 15 ++++++++++-----
>  drivers/gpu/drm/panthor/panthor_gpu.h |  2 +-
>  drivers/gpu/drm/panthor/panthor_hw.h  |  7 ++++---
>  drivers/gpu/drm/panthor/panthor_pwr.c | 20 ++++++++++++--------
>  drivers/gpu/drm/panthor/panthor_pwr.h |  2 +-
>  6 files changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 68965175105f..731da736e372 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1308,7 +1308,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>  	ptdev->fw->vm = NULL;
>  
>  	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
> -		panthor_hw_l2_power_off(ptdev);
> +		drm_WARN_ON(&ptdev->base, panthor_hw_l2_power_off(ptdev));
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index a383b04f101e..09ebe0294691 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -288,9 +288,9 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
>  	return 0;
>  }
>  
> -void panthor_gpu_l2_power_off(struct panthor_device *ptdev)
> +int panthor_gpu_l2_power_off(struct panthor_device *ptdev)
>  {
> -	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
> +	return panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
>  }
>  
>  /**
> @@ -446,11 +446,16 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
>   */
>  void panthor_gpu_suspend(struct panthor_device *ptdev)
>  {
> -	/* On a fast reset, simply power down the L2. */
> +	/* On a fast reset, simply power down the L2. If it fails, escalate to
> +	 * a slow reset.
> +	 */
> +	if (ptdev->reset.fast && panthor_hw_l2_power_off(ptdev)) {
> +		drm_warn(&ptdev->base, "L2 power-off failed, escalating to a slow reset.");
> +		ptdev->reset.fast = false;
> +	}
> +
>  	if (!ptdev->reset.fast)
>  		panthor_hw_soft_reset(ptdev);
> -	else
> -		panthor_hw_l2_power_off(ptdev);
>  
>  	panthor_irq_suspend(&ptdev->gpu->irq);
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
> index f615feb05609..4b8bae363efb 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.h
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.h
> @@ -46,7 +46,7 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
>  				   type ## _PWRTRANS, \
>  				   mask, timeout_us)
>  
> -void panthor_gpu_l2_power_off(struct panthor_device *ptdev);
> +int panthor_gpu_l2_power_off(struct panthor_device *ptdev);
>  int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
>  int panthor_gpu_flush_caches(struct panthor_device *ptdev,
>  			     u32 l2, u32 lsc, u32 other);
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index f797663893b2..4531c1239cb6 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -15,7 +15,7 @@ struct panthor_hw_ops {
>  	int (*soft_reset)(struct panthor_device *ptdev);
>  
>  	/** @l2_power_off: L2 power off function pointer */
> -	void (*l2_power_off)(struct panthor_device *ptdev);
> +	int (*l2_power_off)(struct panthor_device *ptdev);
>  
>  	/** @l2_power_on: L2 power on function pointer */
>  	int (*l2_power_on)(struct panthor_device *ptdev);
> @@ -51,9 +51,10 @@ static inline int panthor_hw_l2_power_on(struct panthor_device *ptdev)
>  	return ptdev->hw->ops.l2_power_on(ptdev);
>  }
>  
> -static inline void panthor_hw_l2_power_off(struct panthor_device *ptdev)
> +static inline int __must_check
> +panthor_hw_l2_power_off(struct panthor_device *ptdev)
>  {
> -	ptdev->hw->ops.l2_power_off(ptdev);
> +	return ptdev->hw->ops.l2_power_off(ptdev);
>  }
>  
>  static inline bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
> index dd7b6ef8ea20..c81e2cc053db 100644
> --- a/drivers/gpu/drm/panthor/panthor_pwr.c
> +++ b/drivers/gpu/drm/panthor/panthor_pwr.c
> @@ -512,16 +512,17 @@ int panthor_pwr_reset_soft(struct panthor_device *ptdev)
>  	return panthor_pwr_reset(ptdev, PWR_COMMAND_RESET_SOFT);
>  }
>  
> -void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
> +int panthor_pwr_l2_power_off(struct panthor_device *ptdev)
>  {
>  	struct panthor_pwr *pwr = ptdev->pwr;
>  	const u64 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
>  	const u64 pwr_status = gpu_read64(pwr->iomem, PWR_STATUS);
> +	int ret;
>  
>  	/* Abort if L2 power off constraints are not satisfied */
>  	if (!(pwr_status & l2_allow_mask)) {
>  		drm_warn(&ptdev->base, "Power off L2 domain not allowed");
> -		return;
> +		return -EOPNOTSUPP;
>  	}
>  
>  	/* It is expected that when halting the MCU, it would power down its
> @@ -530,14 +531,17 @@ void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
>  	 * host control to be powered down in the right order before powering
>  	 * down the L2.
>  	 */
> -	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_TILER))
> -		return;
> +	ret = panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_TILER);
> +	if (ret)
> +		return ret;
>  
> -	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_SHADER))
> -		return;
> +	ret = panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_SHADER);
> +	if (ret)
> +		return ret;
>  
> -	panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
> -				     PWR_TRANSITION_TIMEOUT_US);
> +	return panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2,
> +					    ptdev->gpu_info.l2_present,
> +					    PWR_TRANSITION_TIMEOUT_US);
>  }
>  
>  int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
> diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
> index adf1f6136abc..98a9a5b24270 100644
> --- a/drivers/gpu/drm/panthor/panthor_pwr.h
> +++ b/drivers/gpu/drm/panthor/panthor_pwr.h
> @@ -12,7 +12,7 @@ int panthor_pwr_init(struct panthor_device *ptdev);
>  
>  int panthor_pwr_reset_soft(struct panthor_device *ptdev);
>  
> -void panthor_pwr_l2_power_off(struct panthor_device *ptdev);
> +int panthor_pwr_l2_power_off(struct panthor_device *ptdev);
>  
>  int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
>  
> 
> -- 
> 2.55.0


Adrian Larumbe
