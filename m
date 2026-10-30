Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358931;
	b=wTCvIKp8wDzCAyLBZNJgzz2uhm5zrFG5lKA646gDPqHqyXLgpUqACf0T7PDPd/VdclrR
	 CGdrjk12lpSjjtDNyjsVmZVVNI4toQKQth3AaEdZ5jC/TanlfWy2bz7aukUSULslgNA+O
	 vab6UnAFln2xsKlc57Py+dzk3iSkOgIYcnqNq7PBgvRxg/r5g1CsuQz85Qhfdh66sc3d9
	 d11XC/0P+K3oXmRZPKB0u7P9txAjVsWOX4sBAZMsfymZNTwirT18GAB6OBL+qBUjawDhY
	 BGF78eoRscWLRD5oyVIvvWVlkaH+1yv28phZSQwW2d4odpVc9aUEnj09ahvyMs/9U3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358931;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=H7/oio+Hg9GSpr6abNQasYJWCkT67LW3pbPlx6tFe8E=;
	b=v6TkYj5eu/jTw1V47WGBgvqqYfD/QgHbcTZ8S++IihY62Z2UXtAil/up01fYnbuj1n3M
	 6ROFPWKtL7n+rheGcahdl+jHNOn0QHjVqbdyv13F8QfNwuQcLAz/6xEUd3tfM0nlbfgKE
	 4IAubA5oqxCd6Yqf0OtZbA1m5Zbly2a9wK9vACsPsaJdjbKjoGgplm3pRJ28k6Kci6q1U
	 YxJNQSD4L0UISCgG5btfVGRxBY+qf2UCNwtWKhcibZryacY1FL//mbc7xq3Dz6Mo8FUa0
	 CW6UntqJ08zc22vgD9HgyIHYCl0uU0VpvQnCdxEauGiE/bReSoYdakJaPB1zMAihpSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O+dfijMb;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C58606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6C58606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O+dfijMb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793358928; x=1824894928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=g1ONnB+NbjvqgDLM112cAGMnNcTmZ7rBKsZD6MbICpk=;
  b=O+dfijMbNWrVktolYv5LWvq6pMZV2+svLkpAWrjgaYdDZViBJSEjBuIz
   S7e/IAoQlt3vZwDtCSnP0YWZ6zFy6QVM9Sc0NwTAJBAN6RcKMpdRGxXw5
   dVeFuJW6UA3k6zal9Cg4SBeQhGm8SfP6CeAEJvlhqjw4vaQEE2eIlCy/K
   D0o9KvLPyRgP5qR8+AsO/zuo+xmr73QrEhrv8pQSXBohcKcTXs4jNJLmm
   iRWUHMR5iYdvbULa1FFnuSxLCJ5JeGSLXPCf3MZ9IayU5UbQwJ7n17Kv/
   dSBCvTYb+BfkkjDPcdg/bA1QPdnGPnroVjjvEWGHOTzs4gfh/89anmNVQ
   w==;
X-CSE-ConnectionGUID: T2IGV5j2RXWF/XwHzwkVnw==
X-CSE-MsgGUID: 0j3u6tBaSlaJXER580vSaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2151551"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2151551"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 04:15:28 -0700
X-CSE-ConnectionGUID: yb71Tav0Ss+85cfPI2AKuQ==
X-CSE-MsgGUID: JVPkhtUUTAGAt9DyjE3lkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7202602"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.58])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 04:15:23 -0700
Date: Fri, 30 Oct 2026 13:15:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] drm/dp: Always use enhanced framing for DPCD r1.2+
Message-ID: <auR8R7G5S8hv5R0e@intel.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
 <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Thu, Oct 29, 2026 at 11:18:22AM +0100, Dmytro Malovanyi wrote:
> DP 1.2 section 2.2.1.1 says "An upstream device interoperating with a
> downstream device with DPCD Revision of 1.2 or higher must enable
> Enhanced Framing Mode". So for r1.2+ the DPCD revision is enough, the
> DP_ENHANCED_FRAME_CAP bit does not need to be checked.
> 
> Some sinks get this bit wrong. The Xiaomi Monitor A24i (P24FBA-RAGL)
> sets it in the base receiver caps, but clears it in the extended
> receiver caps at 0x2200, which are the ones we use:
> 
>   base:     12 0a c4 01 01 00 01 80 02 00 06 00 00 00 81
>   extended: 14 0a 44 00 01 00 01 80 02 02 06 00 00 00 81
> 
> Through a USB4 dock (CalDigit Element 5) the link trains without
> enhanced framing (0x202-0x204: 77 77 81), but the sink never syncs to
> the stream (SINK_STATUS 0x205: 00) and shows "No signal". Forcing RBR
> does not change it. Connected directly to the laptop the same sink
> syncs without enhanced framing, at RBR, HBR and HBR2.
> 
> Make drm_dp_enhanced_frame_cap() return true for DPCD r1.2+. This
> changes behaviour for every driver using the helper, but only for sinks
> which already violate the spec by not setting the bit.
> 
> Tested on i915 (Arrow Lake-U), with the dock the link now uses enhanced
> framing (0x101: 84) and the sink syncs (0x205: 03).
> 
> Fixes: a1d926527b79 ("drm/i915: implement EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT")
> Cc: stable@vger.kernel.org
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17719
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
> ---
>  include/drm/display/drm_dp_helper.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 5b05a7fbe..4f20f60db 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -160,6 +160,10 @@ drm_dp_max_lane_count(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  static inline bool
>  drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
> +	/* DP 1.2 2.2.1.1: enhanced framing is mandatory for DPCD r1.2+ */

DP_ENHANCED_FRAME_CAP is also mandatory so I think this needs
a bit more detailed explanation.

> +	if (dpcd[DP_DPCD_REV] >= 0x12)
> +		return true;
> +
>  	return dpcd[DP_DPCD_REV] >= 0x11 &&
>  		(dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
>  }
> -- 
> 2.50.1 (Apple Git-155)

-- 
Ville Syrjälä
Intel
