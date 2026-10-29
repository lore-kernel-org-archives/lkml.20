Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275126;
	b=3stkfPiEv3NQQO0gFuoh8kD9/NgdTp/yfQp40cdbBeWLfEcGUW2GFfMF2ZfOA9+RWU0b
	 ZIPx2uED1bWorCSEAMAj50fRqK69Ly/uMI6Lehgo6K804TnjJGY5wRU/RhmORalveFx1G
	 OBx5ET86w2Bifw8YK8z7bgNVoXCx8ISW/BVbU5GgtRBcCEB4IHGHqsQRc/j6RvlGF4HdW
	 Wsh86aISk4ynLjK0OFiUm5qfpHT5rS6fStw6rBIBOpYfaY1ldtCYzY7QLgcDmPa3WtoWL
	 msUz1HAiiiSrWaxHTxeE216MrodTeQgVJtPipAOn+VzO7NGUdQQa9etaUUS59g8aMSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275126;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=bFtWXG8m5JKsyn/qeOedunaPNpqgZZez15iz91neCTQ=;
	b=CUwHJXysU7xaHXCwUdXKOfnWa1/kxbqQHXBQCyJT0aJOwCKQ5hYSSug6DL7cdn1lo39y
	 mx1039BQmvrc9FjaAcrDvmaNdvAB4fByl/DJbZeirsrfA3K5PeCLFuTb3YS9FYJV/HU/r
	 nR3MdViWo+jT3whoFCSvF5OJLE8gZFHNE8i5qzUaIVBSJicP3QmN6HfX6bMyETrNo8h1L
	 pnNshluAXDHQgUNt+KScElSBZL/7H0dbs+oqmJMQNyaJAgkzjcZHtBoZ+uFwj9507f6E9
	 pG1oYJiacw0aDc+o6ESjuVgTYeH7QoP06Q5x3IwwvSPvbz5vK3sb4QQDbn83yECTWTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="hCEgCh/B";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BB5606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62BB5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hCEgCh/B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793275125; x=1824811125;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=i2ey7uKnBTF2PqloNxgHfVH5I2ULdNgzLR4UomlVJVE=;
  b=hCEgCh/BTa/Qzgmp+4HLQioOq5WHwB5VWc3hQ0aXHp3L7kbbr10u6jYH
   GnH9fCIp3T3nNhuncYyXqjaITEMpHcRldCDGwLzI1V6fJPW/fJgBNMzuv
   6IxniOigI2OVzv96VJG40Tgs5qtI7cUSnvlmHSAsGcddQS651DnimrYYR
   s/dJdfVXpMzQpCNB3MmgtZBbwmCyDg107BZXI6i/a7Pv75ifGWeui+jve
   daZ7Lck+LldP8LBtktbd4WqK99HhxJYhgrbQL/2t4+nDknQAUkxhgN2jJ
   E4wFxDWL7bs+hUce2OMBxvGLr3n1Ry/S/iYpo1FBDAeMHaDmMaIj9BUux
   A==;
X-CSE-ConnectionGUID: zwFmdZriRKWYBEedRq7rSw==
X-CSE-MsgGUID: MQFxtwHRQ+etF4FlcH+lXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1908637"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1908637"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 04:58:44 -0700
X-CSE-ConnectionGUID: c3VOsTDBQBC2683iNWsTgg==
X-CSE-MsgGUID: NQ3qXX8fTMilynHkhUiSEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5462784"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 04:58:39 -0700
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
Subject: Re: [PATCH v2 2/5] drm/bridge: cdns-mhdp8546: Use
 drm_dp_enhanced_frame_cap()
In-Reply-To: <20261029101826.72773-3-dmitrymalovanyy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
 <20261029101826.72773-3-dmitrymalovanyy@gmail.com>
Date: Thu, 29 Oct 2026 13:58:36 +0200
Message-ID: <3d8c0987e3f9e4e099372475b2e0584963b6b71d@intel.com>
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
> Use the helper instead of checking DP_ENHANCED_FRAME_CAP directly, so
> enhanced framing is used for all DPCD r1.2+ sinks as the spec requires.
>
> Compile tested only.
>
> Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index f47717bd1..8cab9a3e6 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -1375,7 +1375,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
>  	mhdp->link.rate = drm_dp_bw_code_to_link_rate(dpcd[1]);
>  	mhdp->link.num_lanes = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
>  
> -	if (dpcd[2] & DP_ENHANCED_FRAME_CAP)
> +	if (drm_dp_enhanced_frame_cap(dpcd))
>  		mhdp->link.capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;

I note that the driver should probably also switch to
drm_dp_read_dpcd_caps(), but that's beyond the patch at hand.

>  
>  	dev_dbg(mhdp->dev, "Set sink device power state via DPCD\n");

-- 
Jani Nikula, Intel
