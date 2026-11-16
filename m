Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818386;
	b=2cN172EPhElNJqfl3dznlx5kbQeIFDOyGoRpTBkMW+nBd2/rKmcLpsFBDkb1PYjQhwty
	 b7+0+uJYnQ9H3Oxu4yClvFXfSwFtQWZzGykjYeERZjZA/MjzKIjKdpmeoNf9z2DGqlHaI
	 izZmQY1NpeyHD4Xvc9plJaVM4uQVCIRgLphDxBBGcNSG5xiLrbvKFoar/pjh8ANMwLUnh
	 SgVbO0HfkbwMlzKKsYJ17NrCcH5xOH3zGkXk8HJ7HYQHP1haSrq3V2qM8JM5XnC28aVgY
	 DHamrymGghJKsON+Lzs5l0vg+qlmAyTo1AsbQWaorsnjnPQK8W3Prko/CfbsTrfp8OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818386;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=dTdyk2EjyqVzz4KPKLGv5hAWlm5hdqoLVqQHX3m7q48=;
	b=NOv7dR6K/4+Q0nILgIb56CtxyqlA395kRGmGZKRF692NPEAA180Akx2oQiiEbCv0lLgB
	 3tfnxI/RWI+X1djpgA50He0rDOS4Wh0sqxNkQ0lfUNKsDA0bkoX5TPab8pZDZabLZZnE3
	 3Jkx7ItLi3FVGYcn6aYAM2PYNMpp3tMUajSONNIMhRTQWZdrV3VPy+8yQUltHaGwWPzEX
	 SpziId5dAeFk4rDGxx/XO4g5KPfrqxzf/kWbdS6yfaglN6lJSnpOHoWiPAJg6GuwEiN5Q
	 SQKrW/97NBw1gfFDxCs/LBSo02BfLJd9/lEaRLaodyUHQrusBDeTYZns1v0M3qBVBNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hWpHWOmg;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF31606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF31606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hWpHWOmg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794818386; x=1826354386;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Ponfat1/q3JT/qiKw+w9w6BSScu+K9xI4e3DrPd/6Ww=;
  b=hWpHWOmgcRSKI/dtWVQvK6hJzv2SoDyuP84W1MzHpsEFi3DawhPj6MtQ
   wcy7uyvnoJE3DRWzzh6AVWDvKnkkr+PrOynsHdSrQksQgsHUIaRpgdh9C
   p+LVyuva1BiO4APpDDIleCgHaBwsVlDfQpQeRPEVuU/BuFp7omYN/Kvzn
   xSUwwnA5sEmMQqICRXohJUGXlEmIEYifo5Z+U9g9kLeB2Hu9aqi4eDe5E
   4y2DXvQ+81f6tg9/87DeTLzjFRBYX/kf3ySzHXCS1xAJ7CLQNTTDOwqMw
   KcZgEHSmdTBp6LV9hbcvUy5yp9k1khDCs5TdVVebTa07RAMuy+HOEwnfm
   w==;
X-CSE-ConnectionGUID: 2xCR4Yl0RVqFRYIY0WHxpA==
X-CSE-MsgGUID: 8xBHZoIhS/eRiM3c8pfU1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3578194"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3578194"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 00:39:45 -0800
X-CSE-ConnectionGUID: gwpAQ6Q4Q8miECw2Cy0wXA==
X-CSE-MsgGUID: s1HeY7N6SgKwNfFkhRPfiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9413260"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 00:39:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Baoli Zhang <baoli.zhang@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com,
 airlied@gmail.com, simona@ffwll.ch, andriy.shevchenko@linux.intel.com,
 Baoli Zhang <baoli.zhang@linux.intel.com>, Yanx L Liu
 <yanx.l.liu@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/display: Let the drivers free the KMS objects
In-Reply-To: <20261116011504.3910139-3-baoli.zhang@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261116011504.3910139-1-baoli.zhang@linux.intel.com>
 <20261116011504.3910139-3-baoli.zhang@linux.intel.com>
Date: Mon, 16 Nov 2026 10:39:37 +0200
Message-ID: <171277546a58621d8b771fd7043dad0fa0559da1@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 16 Nov 2026, Baoli Zhang <baoli.zhang@linux.intel.com> wrote:
> intel_display_driver_remove_noirq() frees all the KMS objects through
> drm_mode_config_cleanup(), while userspace may still hold the DRM fd
> open with references to them, e.g. framebuffers it created. Such
> objects must only be freed with the last reference to the DRM device.
>
> As a first step, move drm_mode_config_cleanup() into the new
> intel_display_driver_mode_config_cleanup() and call it from i915 and xe
> right after intel_display_driver_remove_noirq(), so each driver can
> then move it to the right place.
>
> drm_mode_config_cleanup() now runs after the rest of the noirq teardown
> (DP tunnel manager, overlay, GMBUS, workqueues and FBC). After the
> previous patch the KMS object destroy callbacks no longer depend on any
> of that.
>
> No functional change intended.
>
> Tested-by: Yanx L Liu <yanx.l.liu@intel.com>
> Signed-off-by: Baoli Zhang <baoli.zhang@linux.intel.com>

Please don't add new display calls to i915 or xe core drivers. The
direction must be the opposite, there needs to be fewer calls. Move the
functionality in existing higher level display functions.

I see that patch 3/3 then changes i915 and xe to behave differently
here. That's also the wrong direction. We need to make the drivers
behave more similarly. Can't have one driver make some calls, and the
other not.

The approach here makes future changes harder.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_display_driver.c | 12 ++++++++++++
>  drivers/gpu/drm/i915/display/intel_display_driver.h |  1 +
>  drivers/gpu/drm/i915/i915_driver.c                  |  2 ++
>  drivers/gpu/drm/xe/display/xe_display.c             |  2 ++
>  4 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index d513cfc881069..62a4d95d78b53 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -160,6 +160,18 @@ static void intel_mode_config_cleanup(struct intel_display *display)
>  {
>  	intel_atomic_global_obj_cleanup(display);
>  	intel_encoder_remove_all(display);
> +}
> +
> +/*
> + * Free the KMS objects, including the encoders torn down by
> + * intel_display_driver_remove_noirq(). Userspace can keep referring to them
> + * until the last reference to the DRM device is gone.
> + */
> +void intel_display_driver_mode_config_cleanup(struct intel_display *display)
> +{
> +	if (!HAS_DISPLAY(display))
> +		return;
> +
>  	drm_mode_config_cleanup(display->drm);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
> index 1ae2ad7e95f6c..88d9028e86e4b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
> @@ -23,6 +23,7 @@ void intel_display_driver_register(struct intel_display *display);
>  void intel_display_driver_remove(struct intel_display *display);
>  void intel_display_driver_remove_noirq(struct intel_display *display);
>  void intel_display_driver_remove_nogem(struct intel_display *display);
> +void intel_display_driver_mode_config_cleanup(struct intel_display *display);
>  void intel_display_driver_unregister(struct intel_display *display);
>  void intel_display_driver_shutdown(struct intel_display *display);
>  void intel_display_driver_shutdown_late(struct intel_display *display);
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index aeb7b24c81c8b..d29b37ab2833e 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -906,6 +906,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	intel_display_driver_remove(display);
>  	intel_irq_uninstall(i915);
>  	intel_display_driver_remove_noirq(display);
> +	intel_display_driver_mode_config_cleanup(display);
>  	goto out_cleanup_modeset;
>  out_cleanup_irq:
>  	intel_irq_uninstall(i915);
> @@ -951,6 +952,7 @@ void i915_driver_remove(struct drm_i915_private *i915)
>  	intel_irq_uninstall(i915);
>  
>  	intel_display_driver_remove_noirq(display);
> +	intel_display_driver_mode_config_cleanup(display);
>  
>  	i915_reset_error_state(i915);
>  	i915_gem_driver_remove(i915);
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 506f26e9c59a8..d33052a98d942 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -73,6 +73,7 @@ static void xe_display_fini_early(void *arg)
>  		return;
>  
>  	intel_display_driver_remove_noirq(display);
> +	intel_display_driver_mode_config_cleanup(display);
>  	intel_display_driver_remove_nogem(display);
>  	intel_display_power_cleanup(display);
>  }
> @@ -110,6 +111,7 @@ int xe_display_init_early(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_early, xe);
>  err_noirq:
>  	intel_display_driver_remove_noirq(display);
> +	intel_display_driver_mode_config_cleanup(display);
>  	intel_display_power_cleanup(display);
>  
>  	return err;

-- 
Jani Nikula, Intel
