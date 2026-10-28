Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793208273;
	b=5VbdxlDW+zO8mEZHZfdAeN2LYSaB/11HimPRLJoHfwqMK5bPWO6MBtMGQk6avFF475ev
	 10qlP8K9yUKLyzAdqYg1bKCHlTgPWDoJy0VLaq6MYnojE5Up46gbw4pixGSs2Jd25b7La
	 yuJ7P5yVg/4/VGDcxCTeGZKeyEZV79g9CgIj0XVWC7D7sRfzcnaDV/8kJ0hlERrSiUHxK
	 sx+Xnvjnp0PULp60UF6CrjJRPWhAGWYKz/r7xxvAUAuibGK/rR3O/v85qkYGkb3FyVSCM
	 ygDgbxFb/zbD1QSvqa2wGist+huGJacqhhx5GL/Xduj134qgHJYIxqKhPyzUCdzeygg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793208273;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=eH7NkV0R55RFUS/3R48NH80ZCM5ZPdcxrzgR8cBwN1w=;
	b=fybELU+S8Y3bdPgnBq4kyfnbq0ntlU3/GlZ1nzg1789xz3yyOEWGgI9sO/cOfBH3Z6Jy
	 kTcJ2jmxLHLo6Gr4ZE8ZuAVNCBLpX/yFJ1dKI9XASfoXUW9BQb2Bc4o8727fQOm+EHxKT
	 NrrIv/4Tj0RDrlvXJc1Y/QImk/ceupv8CVqVNIU2PHMCNKh8uauN5smtUBrFy33KL9cEC
	 VEPvvq9LaXWQ/PjB+eUwDCsefRnGFzGkCSWETjLQJahCnwIuK0AI9gHLWzrLBmw5Z4kNs
	 i3XLPuF+/GfSBbhl/Yvz+5qAvlOpLrmZbxMu4et91XxSHm2amhPSReeSioqmfMgpdTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DHnrWWXd;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9E0606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A9E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DHnrWWXd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793208271; x=1824744271;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=q+A7n6B0D9P/iULjXHA3ItLVVm9Rb0ZtxeZH8/sxmTU=;
  b=DHnrWWXd4r710VQjDqxULgQnK9r+e5AMObnHI3OGeFqj8LEYsvIsARwa
   FEWLEO0h9Wc9JxaxBZVrwMn7wu81ysquDdMP4JfX/x5ZNmK/Y7IZJkcjw
   KwGW3693AslkcB1mkuf0H+FY0kWl2rcPYqQDyQszVb4RdCkWfAzohYjFb
   xu0DI8GxqItRW/x8QDfdlu4BzH/K8ci1SXPW9Xp3TFguo1jOLrAk6RWQr
   dePHa4FVkxTUhPPJ7YVXOHPwg3dQnV4Q+fJIqKeGmwCN3vVO9ByVCLqc1
   MLNcQYjGPmi+0rocwF7z+j/49Idw3st+b5O2/gwvprUHJ1HW2E46BJL4O
   A==;
X-CSE-ConnectionGUID: heFXIkdzQVOYAtPgqshZow==
X-CSE-MsgGUID: AaxwU7VQTTG6tm5Mkud4LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1941077"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1941077"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 10:24:30 -0700
X-CSE-ConnectionGUID: 1lcKzMECQnOt5PTeph0HQQ==
X-CSE-MsgGUID: R5o1uH+cTY+uAVQ3Sz3/cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5425749"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 10:24:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmytro Malovanyi
 <dmitrymalovanyy@gmail.com>, Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] drm/dp: Keep base enhanced framing cap from extended
 DPCD caps
In-Reply-To: <20261028162941.62762-1-dmitrymalovanyy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261028162941.62762-1-dmitrymalovanyy@gmail.com>
Date: Wed, 28 Oct 2026 19:24:25 +0200
Message-ID: <77b574384ed695f8ea06a2ed142907e7d5f118d6@intel.com>
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

On Wed, 28 Oct 2026, Dmytro Malovanyi <dmitrymalovanyy@gmail.com> wrote:
> Some sinks set DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT and advertise
> DP_ENHANCED_FRAME_CAP in the base receiver caps, but clear it in the
> extended receiver caps at 0x2200. drm_dp_read_extended_dpcd_caps()
> replaces the base caps with the extended ones, so the link is trained
> without enhanced framing.
>
> The Xiaomi Monitor A24i (P24FBA-RAGL) is one such sink:
>
>   base:     12 0a c4 01 01 00 01 80 02 00 06 00 00 00 81
>   extended: 14 0a 44 00 01 00 01 80 02 02 06 00 00 00 81
>
> Without enhanced framing all lanes train (0x202-0x204: 77 77 81), but
> the sink never syncs to the stream (SINK_STATUS 0x205: 00) and shows
> "No signal" until it is power cycled. The same monitor works on macOS.
>
> DP 1.4 section 2.9.3.1, as quoted in the commit that added extended
> caps support, says the extended caps match the base caps except for
> DPCD_REV, MAX_LINK_RATE and DOWN_STREAM_PORT_PRESENT. Keep the base
> value of DP_ENHANCED_FRAME_CAP.

Thanks for the patch and explanation, refreshing clarity.

The display is obviously being silly.

Additionally, a DPRX with DPCD r1.2+ must indicate support for enhanced
framing. The display is also in violation of the spec.

That said, the spec kind of says to use enhanced framing for DPRX with
DPCD r1.2+. It's subtle, but it doesn't say check the capability
anymore, just the DPCD revision. That's my reading of DP v1.1a, v1.2a,
v1.3, v1.4a and v2.1a anyway.

So I guess that might be the more appropriate fix, really. Even if it's
slightly more work.

I think drm_dp_enhanced_frame_cap() should probably be:

static inline bool
drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
{
	return dpcd[DP_DPCD_REV] >= 0x12 || dpcd[DP_DPCD_REV] >= 0x11 &&
		(dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
}

And the remaining direct references to DP_ENHANCED_FRAME_CAP should be
migrated to use drm_dp_enhanced_frame_cap().

> With this change the link uses enhanced framing (0x101: 84) and the
> sink syncs (0x205: 03).
>
> Tested on i915 (Arrow Lake-U) through a USB4 dock.
>
> Fixes: a1d926527b79 ("drm/i915: implement EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT")
> Cc: stable@vger.kernel.org
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17719
> Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index e623ccb4c..205b6cc89 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -1219,6 +1219,9 @@ static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
>  
>  	drm_dbg_kms(aux->drm_dev, "%s: Base DPCD: %*ph\n", aux->name, DP_RECEIVER_CAP_SIZE, dpcd);
>  
> +	/* Keep the base enhanced framing cap if the extended caps drop it */
> +	dpcd_ext[DP_MAX_LANE_COUNT] |= dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP;

One of the main reasons I don't like this is that we have the logging
for the base and extended caps, and this sneaks in a change without it
being present in the logs.

And having the decision in drm_dp_enhanced_frame_cap() is explicit and
same for everyone.

BR,
Jani.

> +
>  	memcpy(dpcd, dpcd_ext, sizeof(dpcd_ext));
>  
>  	return 0;
>
> base-commit: feaa32dc98090b2f45f7b6f179711a6640169c1a

-- 
Jani Nikula, Intel
