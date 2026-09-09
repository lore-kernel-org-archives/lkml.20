Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269D6471247
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956183; cv=none; b=fBe9hfBQQIbHUo3VctrFWbB5eH2UAKkUZL7bPPcJX2jGGsFD5Y9Ku9qeP/fkpexRm262NiS6e31VirXU+6u+SIKs8ULDpjv5uueGDW3PXopKsD695K27dDF66Ugby6kT1wW4N4x7tFegyrZ/uFMWmemQStGeTNJsgH4UfoHl0Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956183; c=relaxed/simple;
	bh=y0AFMcKTGl7uv/p5BHEJJeildm+pyxOLf4CVF643gno=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ler0BZQCan0fLvQuyNEE3yXwK+EAQE2rhX+6imxFss8f7Zjai+GOiW06nIBIpPifc6tRpQP31y/3w8dNBUHxx0iv3IOOEtkBoJ2IZNtfQvBbcbK7QvR7gg84R2IYoFtdFvdz99ln57cLEvqzC3rHT7sm1r+ehRxka59tJFQ1/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIXXv8s6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIXXv8s6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788956182; x=1820492182;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=y0AFMcKTGl7uv/p5BHEJJeildm+pyxOLf4CVF643gno=;
  b=HIXXv8s6lFg6edAxL2m7JzHtC+1XGnegIjXG44jgCgCjWX6O8ywVXuBy
   g6ZraTQ+BW0yc5Z5JlIDYNZMwKr581ux9eQo+Ee8VYkea5qkS6oXEI9TC
   /9kP/kHA1Q1bbPaIE1QJAjZ8lxxhwVTtsfu1ZzFzIG0gmuZFEvO7iiYe2
   rksw67AJIoVCTRRRlvKqgzClMxCUYLQTMbf1vnI8GWlhhP/54G26iR3e3
   Gx5ApwHF/qnzGv0fU1GhHl6PbrdNEaomZo/KJJJovuqoR1TxEEOaXetey
   KRd4RrXpUnAZ4KUO8zzFmyzsE5l5txIO3aE/cJ9DwAr6aIfGcmQEijjOM
   Q==;
X-CSE-ConnectionGUID: 96qSxNyNS0m7dOM+U+k1jA==
X-CSE-MsgGUID: d09oW9V+S0epapUflzxGMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89420156"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89420156"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 05:16:22 -0700
X-CSE-ConnectionGUID: SqBcx/zaToSD5AD4+2lWdg==
X-CSE-MsgGUID: jP4tqTR2Rpy3s7bt60Pj9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="265090508"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.20])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 05:16:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: tarund18303@gmail.com
Cc: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tarun-tarun143 <tarund18303@gmail.com>
Subject: Re: [PATCH] drm/i915/dp_link_caps: Validate max link rate
In-Reply-To: <20260827022035.3442-1-tarund18303@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260827022035.3442-1-tarund18303@gmail.com>
Date: Wed, 09 Sep 2026 15:16:16 +0300
Message-ID: <0531dd3f6e5056128dc1208c31199373a9035175@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 27 Aug 2026, tarund18303@gmail.com wrote:
> From: tarun-tarun143 <tarund18303@gmail.com>
>
> Validate the maximum link rate against the source-supported rates
> before using the maximum link limits to calculate allowed
> configurations.
>
> This prevents an unsupported link rate from being accepted as a
> maximum link limit.

Are you seeing this issue being hit, or are you just going through TODO
comments and trying to come up with fixes?

BR,
Jani.

>
> Signed-off-by: tarun-tarun143 <tarund18303@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> index 7b6cc6055da8..0934488153bb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -710,7 +710,10 @@ static bool max_link_limits_valid(struct intel_dp_link_caps *link_caps,
>  	    !is_power_of_2(max_link_limits->lane_count))
>  		return false;
>  
> -	/* TODO: Validate max_link_limits->rate against the source supported rates. */
> +	if (intel_dp_rate_index(link_caps->dp->source_rates,
> +				link_caps->dp->num_source_rates,
> +				max_link_limits->rate) < 0)
> +		return false;
>  
>  	intel_dp_link_caps_get_forced_params(link_caps, &forced_params);
>  	allowed_configs = calc_allowed_config_filter(link_caps, link_caps->enabled_configs,
>
> base-commit: 73e3f0710014fe6d4ed98cfc02292f6121db7558

-- 
Jani Nikula, Intel
