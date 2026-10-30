Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360667;
	b=I7axdJUFwW+mnKox5atSEdqWfp+Q832Dx/qb2n+ncV3nfmXGff6H8d3+DJkR1iYg/CZE
	 XYdjfRWEoAqfKsjxx8llXA9EW7y+naaczNFtz8s3ByCmTFqRtSZF+6nwxXLW67tpBnzqW
	 njnJ65YHIJyOEsOVfw/v+hx4arUMhRGNWAxl6/z79YKb5XNwpKRjQnkyWK0YYFFkegVdc
	 UCYnHxIDQkT3Mlf7dphvdLfpCJp5VJlvLLvRDHQbKks/fuIGD2ZyFzwSwCTB681YL586p
	 xfoWzlxsL6BJmv9+NL4ZzSGy/wqpeLTAaCjGINPUqCh9Rx6Uqbov5rEl0WjYkEUCKjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360667;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=K2dB0Ql9grwDChzbfX2B4Ey5mwC/vTUQxp839fTyFno=;
	b=PuYaln8jxHgCpzWSbNSkwISbvGJLde9H+Q8gbl2XMBxZDq5BdMQ0STge/1zeuW0MjtZu
	 N02/vcl5J1geu/GEjyS7rPhWs22CMo6tlVBQ2Y0NO42IxyHfnl6524M7lqQnT4Z+MEEVE
	 GKw7xbq7r69wIfi/hJxQ4QoNlDULgpDk+yUtfRlgnLrynbGIqedQtQEFum2bk/k5VFLPU
	 4BH10bzEw0+FdrvGimauOsmc0Sc4TlL0FPe1hnPJaLkqJ00VyOtSozSTsHMm0ZNnKNdxC
	 kWXfbmeZJZUiqW24OBsyHv3POeDL/yAwBvE3yWj28lcnrBC+9hZZm93tHdIVmXz12OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V8AdulUL;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F73606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V8AdulUL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793360666; x=1824896666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=x8TvwLzSHqdTbx1HgAAtb/ADR1txxIEQrI2u8aFySlM=;
  b=V8AdulULeadkCDgAHNtu3wjNvFFSw5cbzBlqXKR7BAtt3hWn7lxLK8F3
   Abj7PKD3owkzgxcH+wmq2dGzKns7dKs+77HxZ7kXqkM+lllzh13nsH1aQ
   tc6dYWtX4qXxUozfyL7N8aybUzdTGRAdTOiQxlsfbgewL4cFbNx9Tu6Yr
   US69J4oc7EAZe0wtZ1hbXvSnsg4v9V9GM3oBvbQv1pAu6agDkuK9yKYZC
   eaxowXykcNS9ddQwOUTgPOPhMvneWfLYiTgbqSIfErYnlbxdmspizNt0Q
   kT6GNR6wiDWtO/WwO1OhUjGorg3zWCuAvV1hMLphZjaN7SU6G/5G12mIe
   A==;
X-CSE-ConnectionGUID: iz4kIBXjSd2HG2olo9Ee1A==
X-CSE-MsgGUID: BiR25mb1QCWQukvTwomJ2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2153569"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2153569"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 04:44:25 -0700
X-CSE-ConnectionGUID: dUGh3GZZSfWnVLY/c5JscA==
X-CSE-MsgGUID: GtI3xy5jTpm+UPu/72vcvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5755803"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.58])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 04:44:20 -0700
Date: Fri, 30 Oct 2026 13:44:16 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>,
	dri-devel@lists.freedesktop.org,
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
Message-ID: <auSDEOoWZWcgbvzZ@intel.com>
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
 <20261029101826.72773-2-dmitrymalovanyy@gmail.com>
 <auR8R7G5S8hv5R0e@intel.com>
 <59106a36510e33e851f76c877f41952b11a8c774@intel.com>
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
In-Reply-To: <59106a36510e33e851f76c877f41952b11a8c774@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Fri, Oct 30, 2026 at 01:36:31PM +0200, Jani Nikula wrote:
> On Fri, 30 Oct 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Thu, Oct 29, 2026 at 11:18:22AM +0100, Dmytro Malovanyi wrote:
> >> DP 1.2 section 2.2.1.1 says "An upstream device interoperating with a
> >> downstream device with DPCD Revision of 1.2 or higher must enable
> >> Enhanced Framing Mode". So for r1.2+ the DPCD revision is enough, the
> >> DP_ENHANCED_FRAME_CAP bit does not need to be checked.
> >> 
> >> Some sinks get this bit wrong. The Xiaomi Monitor A24i (P24FBA-RAGL)
> >> sets it in the base receiver caps, but clears it in the extended
> >> receiver caps at 0x2200, which are the ones we use:
> >> 
> >>   base:     12 0a c4 01 01 00 01 80 02 00 06 00 00 00 81
> >>   extended: 14 0a 44 00 01 00 01 80 02 02 06 00 00 00 81
> >> 
> >> Through a USB4 dock (CalDigit Element 5) the link trains without
> >> enhanced framing (0x202-0x204: 77 77 81), but the sink never syncs to
> >> the stream (SINK_STATUS 0x205: 00) and shows "No signal". Forcing RBR
> >> does not change it. Connected directly to the laptop the same sink
> >> syncs without enhanced framing, at RBR, HBR and HBR2.
> >> 
> >> Make drm_dp_enhanced_frame_cap() return true for DPCD r1.2+. This
> >> changes behaviour for every driver using the helper, but only for sinks
> >> which already violate the spec by not setting the bit.
> >> 
> >> Tested on i915 (Arrow Lake-U), with the dock the link now uses enhanced
> >> framing (0x101: 84) and the sink syncs (0x205: 03).
> >> 
> >> Fixes: a1d926527b79 ("drm/i915: implement EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT")
> >> Cc: stable@vger.kernel.org
> >> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17719
> >> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> >> Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
> >> ---
> >>  include/drm/display/drm_dp_helper.h | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >> 
> >> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> >> index 5b05a7fbe..4f20f60db 100644
> >> --- a/include/drm/display/drm_dp_helper.h
> >> +++ b/include/drm/display/drm_dp_helper.h
> >> @@ -160,6 +160,10 @@ drm_dp_max_lane_count(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> >>  static inline bool
> >>  drm_dp_enhanced_frame_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> >>  {
> >> +	/* DP 1.2 2.2.1.1: enhanced framing is mandatory for DPCD r1.2+ */
> >
> > DP_ENHANCED_FRAME_CAP is also mandatory so I think this needs
> > a bit more detailed explanation.
> 
> Commit message not enough?

On its face the check looks completely redundant, so without further
justification someone is likely to just remove it.

> 
> I think the wording in the specs suggest that with DPCD r1.2+ you should
> just enable enhanced framing regardless of the cap.
> 
> BR,
> Jani.
> 
> >
> >> +	if (dpcd[DP_DPCD_REV] >= 0x12)
> >> +		return true;
> >> +
> >>  	return dpcd[DP_DPCD_REV] >= 0x11 &&
> >>  		(dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP);
> >>  }
> >> -- 
> >> 2.50.1 (Apple Git-155)
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
