Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830623;
	b=frK24Ovl6YqnKv0DvNazesARDT0T8LpVNff/wbtllyCOQlgiUOEYnIs3601NrsQKzyeB
	 Kf25rn2xmxfmIBuCP+pe9EcdmrG41qlDTsR8w5AoJVNq4/yDzuoKg7vIE4RPME9WqSS50
	 50mX9PkUdEzvgGH1vqDsmCmYt9fzB0Ojc3vKf/52eYmxt6c7zKikKo2NOeAycH7HdTtze
	 fWAioDC7bSmymsCx05Hz/TRzEvIlu4HXJdy4PXCvlSnSLiEAUpnkef1lYsRivWYx+1u8v
	 E3Y5uLChHfGjdR6xf6N4Iip0G7KWsAc+e68X8fl3BXiKg7EqX2TZ5gmuZUo9dA+GKyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830623;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=IQekBwaziHPekHFCxrEj0AOguGwmnwhYwSVSC2fhEpU=;
	b=wQEE0zuTDaL0zVe/8z8HfkUhOnVG2roi0vIM2yMKDrwAu+EN9uwaxDQRgfbGv3MBnKZd
	 UOuDMPOFv++mVWFFpMLQWEuL5Tj0avWFbFVwaFEJw4XjL+EZA1BGn7wVaOtCAnyXHvApW
	 Df2H3q/MyxrCncQNEJbMCwPXOygjfzK+YjhHL8Jr9QHkDRmzbKS9EsiqVW5AnhRBvvQgQ
	 1881rmqbOa5NZgrdVMwbojwm3AymmLOwMKqbe3Z44EI1qa6PXlmXbq1Lr+gsCWNa02I1V
	 89E2vj3y1Rwc8FoPIc36Ab4iMHrhegAa8+WrYyJFTZAVwgN9PD/EQva4GuyUwzJXJ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqMxocZS;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12108606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12108606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqMxocZS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794830624; x=1826366624;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Bf5cAdHMAJ7il91i8L2BuKajCP/dY1k+p59Ms1D7n+U=;
  b=cqMxocZSi5Tq1UEPNK2Ir2JanxLkU7CZn7gGo8gw48Q+7/HN0lBraHUJ
   qkk4dCfI1p7Edgn8OPvKqCai2WO1+25Ak+FlEzO5IT8SNzjyXpsoT2OtA
   /Kof4b0DU4PGwIEx7Edlh/iVjDraa+nSxk53+SrFzQs7mkOz8JtaLP5lC
   2x3tJfvZJIIS5me8paLDnDsjJKF+r+F4aJk5pa+Z3BSItOfUosqVHbiVJ
   IsmbjFWDGD3YGWI8aYXSxSnuGonsd6qX+YrcAPelNXyUoA9A1Uh+tcF+Z
   qWNk6xt8ExNo+D0n8cd1STUagh8ZiyL7qaj+dccOQ3rm1Mug9ud1pFC7L
   g==;
X-CSE-ConnectionGUID: j0OwUyhTQd6OihXZICCQMg==
X-CSE-MsgGUID: kZtcOHS7RUSblVYZYAhurQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3552917"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3552917"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 04:03:43 -0800
X-CSE-ConnectionGUID: NBN82YKvRumnOXUGXvHsOA==
X-CSE-MsgGUID: 0PwLTXsfT56YDMVgPQUegw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9427054"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 04:03:33 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kory Maincent <kory.maincent@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mark Yacoub
 <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, Manasi Navare
 <navaremanasi@google.com>, Drew Davenport <ddavenport@google.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Kory Maincent
 <kory.maincent@bootlin.com>
Subject: Re: [PATCH RFC v3 2/8] drm: Move DSC capability reading helper out
 of i915
In-Reply-To: <20261012-feat_link_cap-v3-2-7517f4aba0f3@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
 <20261012-feat_link_cap-v3-2-7517f4aba0f3@bootlin.com>
Date: Mon, 16 Nov 2026 14:03:30 +0200
Message-ID: <d2ff3419f0965670bbf566bc4cb0afd1cab8e461@intel.com>
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

On Mon, 12 Oct 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:
> In preparation for adding generic DRM properties to report source and
> sink capabilities, move the DSC capability reading helper out of the
> i915 driver into the generic DRM helpers.

Independent of the goal of the series, I support moving helpers from
i915 to generic drm code.

It might even make sense to try to do that separately, to make forward
progress.

> No functional change intended.
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> Change in v3:
> - New patch
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c | 28 ++++------------------------
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  3 files changed, 36 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 8ef096a0138e4..93cf43d166c6e 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -5149,3 +5149,33 @@ int drm_dp_read_edp_sink_rates(struct drm_dp_aux *aux, u8 edp_dpcd_rev,
>  	return num_sink_rates;
>  }
>  EXPORT_SYMBOL_GPL(drm_dp_read_edp_sink_rates);
> +
> +/**
> + * drm_dp_read_dsc_dpcd() - read the DSC capabilities from the DPCD
> + * @aux: DisplayPort AUX channel
> + * @dsc_dpcd: Buffer to store the DSC capabilities read from the DPCD
> + *
> + * Attempts to read the sink DSC capabilities from the DPCD of @aux.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +int drm_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
> +			 u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])

Nitpick, I think all or nearly all of the DSC functions here use the
drm_dp_dsc_ prefix, and so should this.

BR,
Jani.


> +{
> +	int ret;
> +
> +	ret = drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd,
> +				    DP_DSC_RECEIVER_CAP_SIZE);
> +	if (ret) {
> +		drm_dbg_kms(aux->drm_dev,
> +			    "Could not read DSC DPCD register 0x%x Error: %pe\n",
> +			    DP_DSC_SUPPORT, ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	drm_dbg_kms(aux->drm_dev, "DSC DPCD: %*ph\n",
> +		    DP_DSC_RECEIVER_CAP_SIZE,
> +		    dsc_dpcd);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_dp_read_dsc_dpcd);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index da73ad11e9cac..830fe6eda17d7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4430,26 +4430,6 @@ static bool intel_dp_get_sst_split_sdp_status(u8 dprx)
>  	return dprx & DP_SST_SPLIT_SDP_CAP;
>  }
>  
> -static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
> -				  u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
> -{
> -	int ret;
> -
> -	ret = drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd,
> -				    DP_DSC_RECEIVER_CAP_SIZE);
> -	if (ret) {
> -		drm_dbg_kms(aux->drm_dev,
> -			    "Could not read DSC DPCD register 0x%x Error: %pe\n",
> -			    DP_DSC_SUPPORT, ERR_PTR(ret));
> -		return ret;
> -	}
> -
> -	drm_dbg_kms(aux->drm_dev, "DSC DPCD: %*ph\n",
> -		    DP_DSC_RECEIVER_CAP_SIZE,
> -		    dsc_dpcd);
> -	return 0;
> -}
> -
>  static void init_dsc_overall_throughput_limits(struct intel_connector *connector, bool is_branch)
>  {
>  	u8 branch_caps[DP_DSC_BRANCH_CAP_SIZE];
> @@ -4498,8 +4478,8 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
>  	if (dpcd_rev < DP_DPCD_REV_14)
>  		return;
>  
> -	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
> -				   connector->dp.dsc_dpcd) < 0)
> +	if (drm_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
> +				 connector->dp.dsc_dpcd) < 0)
>  		return;
>  
>  	if (drm_dp_dpcd_readb(connector->dp.dsc_decompression_aux, DP_FEC_CAPABILITY,
> @@ -4530,8 +4510,8 @@ static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *
>  	if (edp_dpcd_rev < DP_EDP_14)
>  		return;
>  
> -	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
> -				   connector->dp.dsc_dpcd) < 0)
> +	if (drm_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
> +				 connector->dp.dsc_dpcd) < 0)
>  		return;
>  
>  	if (connector->dp.dsc_dpcd[0] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index d7f4c6f2ba4c7..7bc3b36f38b82 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -215,6 +215,8 @@ drm_dp_is_branch(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  }
>  
>  /* DP/eDP DSC support */
> +int drm_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
> +			 u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
>  u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
>  u32 drm_dp_dsc_slice_count_to_mask(int slice_count);
>  u32 drm_dp_dsc_sink_slice_count_mask(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],

-- 
Jani Nikula, Intel
