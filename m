Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275443;
	b=Ppphvf2fPzt+fhp+WypK9+x+6Dqd7XRPus2bVzqasNPUdiCYBpFE05MD2AUs+lCvR+Kj
	 r9b/MTW0NcMtK++08YOSmsMok9o54pUZOg8ABykC9oAAIuDOm2NkEY4LHigpquDYpwqx/
	 0UK1Kt92geZiGh4FZjbJU5YZi/9FrJgGxrn/8Mb/O5WmyK7XC/qLBBwEG7gZQlGTVwT/3
	 Z3HF1W344rcZ8ZyMGY2imlrN4PcEDyFrbRC5BwfbFNDwdUUOvajqMWyOmUZtD33tEcRQS
	 m8Rw4vpO0jqAARJyi1BjTQVCNAd2MkJ6OKXX1b8MRaH+gP+alR6CNUuocgJXHelaKSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275443;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=aoaaiqgG+MuPX1i302u4z5cKAwdcZoyJSA3p5kyjrws=;
	b=cx76U9wrUcWnU/fQaTpNzlOYZTXs62wtA5VBxhS3/87liv8oaFjn8uen3CTiFDPAxf/I
	 tcENrHI6ZziqJ5y1l+avud8ATSiKrUaSeE6VXu3KegcDeAASD/g73AkVuQjWsjP6Z60WA
	 I8iIfQKRmAT+R2hHJeADf9SGuHhFGgVSzleJskP2Nl4GXu5XbiXskKx6ki4oyDwihr5Cu
	 oZA2TdOnWDg3D/KM9NN+G9ff6TDJrkQ1E/Dpk+79L3DeMbZcKbpupohtN3KogtJFdekio
	 kwhT0MQAEycBYPMLK84h3bgF694KW0Wx+cRfzRCyDfxCZ/7Ww/0uQwtQDNRjXIC+b5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QtlXh4HB;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB37606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB37606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QtlXh4HB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793275443; x=1824811443;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=/oBe4m0YLZywxlXPUaO71KbtVZmDBPNp0Bo+RUOGUyA=;
  b=QtlXh4HBcZRMd6Hqk470+0P9ZUNkHdg289pJ5GghCQOXNal92q83XyUK
   abWMFXUBUDGO+yCIkw9ezuzNB0oyU3vm6APenpcBHZyf983TAW0e8Nphb
   sqSmoKUJUHGxXRfLd5ZXthaygjEaGbnC2IWG3BLIjlS5tNVCvLExVAuB/
   wxygBk2BbYZZNMcNpSdGpOPDaf2+2Uuz/kNT3xW82xGCZp0LeiqiF4GYI
   vPkXgrh874+naHdJoYnM8Nr672Qc/RYkPduuhHIkonEgOc7lzjQ6vuSaa
   sVeSFvwheoxOXvyNrJSRwHspcRQRIbKKdkJtyHOQCkt4PJ5yNnn8Shahz
   Q==;
X-CSE-ConnectionGUID: j2+C7q1ySZu2MqfmvXcBvw==
X-CSE-MsgGUID: 6ApJ9Ao9S52StlzFwO1dSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1921902"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1921902"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:04:02 -0700
X-CSE-ConnectionGUID: o3cZccRnTY6iVlX7c2yjog==
X-CSE-MsgGUID: MwZM0ZfbRSO/mxbxVGNxYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5252995"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:03:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Maarten
 Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dmytro
 Malovanyi <dmitrymalovanyy@gmail.com>
Subject: Re: [PATCH v2 4/5] drm/gma500: Use drm_dp_enhanced_frame_cap()
In-Reply-To: <20261029101826.72773-5-dmitrymalovanyy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
 <20261029101826.72773-5-dmitrymalovanyy@gmail.com>
Date: Thu, 29 Oct 2026 14:03:53 +0200
Message-ID: <ffac172bea7c82b9fddf8fa3949d62e9f62af497@intel.com>
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

On Thu, 29 Oct 2026, Dmytro Malovanyi <dmitrymalovanyy@gmail.com> wrote:
> Use the helper instead of open coding the check, so enhanced framing is
> used for all DPCD r1.2+ sinks as the spec requires.
>
> The helper takes DP_RECEIVER_CAP_SIZE bytes and gcc warns about reading
> past dpcd[4] (-Wstringop-overread), so read the full receiver caps like
> the other drivers do. That is 15 bytes, it fits in one AUX transfer.
>
> Compile tested only.
>
> Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Ditto about drm_dp_read_dpcd_caps() usage.

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> index 8d0626ddf..0973598c7 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -262,7 +262,7 @@ struct cdv_intel_dp {
>  	uint32_t color_range;
>  	uint8_t link_bw;
>  	uint8_t lane_count;
> -	uint8_t dpcd[4];
> +	uint8_t dpcd[DP_RECEIVER_CAP_SIZE];
>  	struct gma_encoder *encoder;
>  	struct i2c_adapter adapter;
>  	struct i2c_algo_dp_aux_data algo;
> @@ -1070,11 +1070,7 @@ cdv_intel_dp_mode_set(struct drm_encoder *encoder, struct drm_display_mode *mode
>  	intel_dp->link_configuration[0] = intel_dp->link_bw;
>  	intel_dp->link_configuration[1] = intel_dp->lane_count;
>  
> -	/*
> -	 * Check for DPCD version > 1.1 and enhanced framing support
> -	 */
> -	if (intel_dp->dpcd[DP_DPCD_REV] >= 0x11 &&
> -	    (intel_dp->dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP)) {
> +	if (drm_dp_enhanced_frame_cap(intel_dp->dpcd)) {
>  		intel_dp->link_configuration[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
>  		intel_dp->DP |= DP_ENHANCED_FRAMING;
>  	}

-- 
Jani Nikula, Intel
