Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274864;
	b=Mq3xEiqpNChAJvHdn9V54wAM69880shKDpPADelTi/z4x728Pwwif/bphZH5mM6/vS6Z
	 KdoJx++3M7nGn9kndROISpa2zLXmf68pDB4XjTwjJsUwpzBZp3qVLavLJJ+WlEoiCrz7u
	 0SwKAU4+ez7rXWtfd2LCBFZh/Yq8lpJQKldWlgQR3MyEKpmREm0N5un0f5stlhwJEzvCA
	 RDhYqyBbm0MSBSy+MxArzSSWSZthI0vi8MnWUfJOrWP7uL5w+9++SlwYUtp+VxkSW/A0G
	 SIBX8YMRGwu5AaYvPK6L+I0yjsegxH2XFH5bzbKubM16QM3IcKjrO1C/T37QbrDAPgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274864;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=YBi8xDJGx/6F9wWTOGSs2iQ/3D1cw/PX4gpZHk4mGeQ=;
	b=pQHkC8kX+hyGZOsGjTgnLRg0hwsL4aaXrS2XzbGT5CJ9ylsgRb/b33lWitYN9KSPwbKx
	 0mXNQTHaF4hMfJ8BGMu9Wh8+3Su0sfMHMRKvMruqF6pblBqL8mnBsFRW2663kkDXxYUL5
	 az3XdIouaUAIrJDxQEhjgGg9amYa93xvytq+KXKyQBEb7YVOfaxTgvCM61F0wBZ5prfvz
	 Oi0KlggtE6roYunJUknxovesh6d/osR5CGXr5xAX1m2dLm0lvv8bIy4hS6xuFEmPOIkTk
	 Kz6nuxofhCDYH6iF+ipMOWFBxWXVm9KfbXLPIC1ZimIv9EcyQiq7NDCUPS+Rrpq6pLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SxzGwxCT;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12812606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12812606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SxzGwxCT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793274862; x=1824810862;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=JWrFGNTUYl9evw/cUDq4OqTIxZXe9cF0vyFHTZm8iS8=;
  b=SxzGwxCTU84+5kcDIPqej9/kQkXmcPIvfJnap2hnITMUM6RRVlB60rGF
   x/HgVyMK5v4+QljOZFEgaX7ecmP3ScQ+/DKZZjN98X0pKDLH7gPIHWK5V
   JEnbZsVjLxg77lCBH0HkkMnNTYDI9aOSr0zmPz3o86d+7Ge7OtSR1fy5y
   ht+vaV031GQzm/yprwDpL5nSR9R9FiP6+r11Y+jWCdRSHnPTbJZ3Y13uq
   FCDPl2l8vr/c/GJiQtWBQ9RGldEbMPkOdWxRbIDcBar1HTu0DCscDTFdu
   KhlNCC7OMpwS/PX1ADBIPoGECvrWkTSGP6xB/hSYwOl4sDlV7sWpr4FR7
   Q==;
X-CSE-ConnectionGUID: S5nDR3OOSuWeHu+jFByU/Q==
X-CSE-MsgGUID: vkfqZihkQvy1x48qdtPRLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1898024"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1898024"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 04:54:21 -0700
X-CSE-ConnectionGUID: +A58QkJcTMik+42R32X5Cw==
X-CSE-MsgGUID: RDmo4aLCReW6b8SBGQAJbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5218611"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 04:54:12 -0700
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
 Malovanyi <dmitrymalovanyy@gmail.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH v2 1/5] drm/dp: Always use enhanced framing for DPCD r1.2+
In-Reply-To: <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
 <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
Date: Thu, 29 Oct 2026 13:54:09 +0200
Message-ID: <5c241fa804e1e4ea4518854a96097252f7a5317a@intel.com>
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

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

I've bounced the series to intel-gfx and intel-xe to get CI results,
though I don't really expect any regressions.

I'd appreciate acks from other driver vendors too.

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
> +	if (dpcd[DP_DPCD_REV] >= 0x12)
> +		return true;
> +
>  	return dpcd[DP_DPCD_REV] >= 0x11 &&
>  		(dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
>  }

-- 
Jani Nikula, Intel
