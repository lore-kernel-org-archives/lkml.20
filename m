Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA83EEAD0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237041; cv=none; b=A8uKrT4HoRLkHbMfuQJ59tE0f0AvoTnWxWs8f0dHXOIyeXXMCqulnacCiLriNxVs8paT/IoXxJusMxFAFbEHO/7ZJO3K8NEchs4N1Bh8H0mbtgroYrCy9p5Qwg3qHge1zPLVTRSunEga7iGADZWQuMlvKysDv9g2Z2VbTuFyKfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237041; c=relaxed/simple;
	bh=ht4eIQbtIrPtGKeyLtuaX/EoLNGaj6v/Hn1biY+6DB0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iaQ6PLHoyEe374MT+pwVWTJU/jMvfBoZeTf3j0tYPfJOlGbWpdnqK0YogSD9lxKxggYIAM/4Yht8qS5F98RAhUn/rXvjIEK33oxVIp4UJ5fV4sAbntc+UWXQrKmRIpcvpuvKPzlh2z8cFPz2jBxdJDkJJB049ndjXNKkmEcyCRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGmD8/of; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGmD8/of"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790237039; x=1821773039;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ht4eIQbtIrPtGKeyLtuaX/EoLNGaj6v/Hn1biY+6DB0=;
  b=dGmD8/ofK5KpUvJiAKV+6cjj86E+LNKxyeBXshcQUU2f++V27OCkCBxE
   3nXk6cOc0U+6aHWKWFwPHifxQ6cx0K4hlqpbpYdecsliFbl6hKST8DCtI
   sO78ogvgluJwH7G9YA49LKi3BY83kdIf6IoJVN1FHWNVUiHn0dQWHKlDW
   QMgkaqg0Ho5AiORUxdsMdqnFmtYuQ+k20U7s/RCuTsVhoR0ln1mVhE/MT
   1uwg4BzL32Mvr/Js8iX3ttLAUKB16wz4jZf5qt+xgYY2dtOknEgudcSAu
   WRSME5urFW19ruUopz6VASs5ZMd/8z/TjmRPB+Q5V99b2+LKZ2LQThigm
   g==;
X-CSE-ConnectionGUID: 0utr9ntfRdGH5XoCVtViSw==
X-CSE-MsgGUID: F+AqWBT5Tp+1b+illy2DQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89956413"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="89956413"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 01:03:58 -0700
X-CSE-ConnectionGUID: uN8caXrkT2ax+wqk3bH4CA==
X-CSE-MsgGUID: EADGVSp8SfmZzftbjOvZBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273541203"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 01:03:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Conor Svensson <conor10@gmail.com>, intel-gfx@lists.freedesktop.org
Cc: Conor Svensson <conor10@gmail.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm/i915/dp: Ignore inconsistent TMDS limits on an
 Anker DP branch
In-Reply-To: <20260923221018.42133-1-conor10@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260923221018.42133-1-conor10@gmail.com>
Date: Thu, 24 Sep 2026 11:03:51 +0300
Message-ID: <5893371ab206c97d5d2f1d72eb149d5ace4250e2@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 23 Sep 2026, Conor Svensson <conor10@gmail.com> wrote:
> Reconnecting an Anker 565 A8388 USB-C hub with a DisplayPort monitor
> attached can leave the branch reporting a DVI downstream descriptor
> with 25-165 MHz TMDS limits. On a ThinkPad L14 Gen 4 Intel with a Dell
> S3422DWG, this removes the native 3440x1440 mode from the connector's
> mode list even though the EDID still contains it. An explicit native
> modeline works with the same hardware state.
>
> Ignore the derived TMDS limits only for the captured branch identity,
> firmware and downstream descriptor when EDID 1.4 identifies a digital
> DisplayPort input. Retain the raw descriptor and other mode checks.
> Do not restrict the match to a particular monitor or laptop model.
>
> With otherwise matching upstream Linux 7.2.5 control/patched builds,
> the control loses native modes after USB-C reconnect, while the patched
> kernel selects 3440x1440 at 59.973 Hz automatically. Repeated reconnects,
> both USB-C ports, suspend/resume, undocking while asleep and docked boot
> pass. HDMI also works and does not activate the workaround. Periodic
> picture cycling observed on the control stops with the patch.
>
> The branch identity is not proven unique to this retail adapter. This
> is an experimental workaround for review, not an explanation of why the
> branch reports inconsistent capabilities. Other adapters and monitors
> have not been tested.
>
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180
> Assisted-by: LLM
> Signed-off-by: Conor Svensson <conor10@gmail.com>
> ---
> RFC: is this best handled as a branch quirk here, or in the common DP
> helpers? The captured identity and descriptor match is deliberately narrow;
> there is no monitor/laptop model restriction. The informational log marker
> is retained to show exactly when this experimental workaround executes.
> The commit introducing the underlying problem has not been identified, so
> there is no speculative Fixes tag.
>
> Hardware A/B testing used upstream Linux 7.2.5 with otherwise identical
> configurations. This RFC applies the same 48 added lines to drm-tip at the
> base commit below. This drm-tip revision has not been boot-tested. The affected intel_dp.o
> compiles successfully here with no compiler warnings; strict checkpatch
> passes (human sign-off pending), and 426 predicate boundary cases pass
> with ASan/UBSan. These predicate tests are not DRM integration tests.
>
> Results: three USB-C reconnects, alternate USB-C port, docked s2idle
> resume plus reconnect, undock while asleep/wake/reconnect, and docked
> DisplayPort reboot all passed. HDMI also passed without activating the
> workaround. The control lost native modes and showed periodic picture
> cycling; that cycling stopped on the patched kernel. No custom modeline
> was used in either test kernel. Other hardware and higher refresh rates
> remain untested.
>
> AI assistance: Codex (GPT-6) helped investigate the reported hotplug
> failure, wrote the match/limit-clearing change, prepared the predicate
> tests, collected diagnostics and drafted this message. The human reporter
> performed the physical reconnect, suspend and reboot tests and confirmed
> the visible results. The assistance arose from an extended troubleshooting
> session, rather than a single code-generation prompt.
>
> Evidence and detailed test results:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180#note_3677750
>
> This is my first kernel patch submission. I'd appreciate feedback on
> whether this belongs here or in the common DP helpers, and whether the
> matching criteria are appropriate.

Thanks for the patch. Please let's first root cause the issue (on the
gitlab issue) before jumping into quirking specific devices.

Regardless, a few comments below.

>
> Thanks,
> Conor
>
>  drivers/gpu/drm/i915/display/intel_dp.c | 48 +++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index ffddf4b33..6d6767ca7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6153,6 +6153,39 @@ intel_dp_get_edid(struct intel_dp *intel_dp)
>  	return drm_edid_read_ddc(&connector->base, &intel_dp->aux.ddc);
>  }
>  
> +static bool
> +intel_dp_has_anker_tmds_mismatch(struct intel_dp *intel_dp,
> +				 const struct drm_edid *drm_edid)
> +{
> +	static const struct drm_dp_dpcd_ident branch = {
> +		.oui = { 0x90, 0xcc, 0x24 },
> +		.device_id = { 'S', 'Y', 'N', 'A', 'b', 0x10 },
> +		.hw_rev = 0x10,
> +		.sw_major_rev = 0x06,
> +		.sw_minor_rev = 0x05,
> +	};
> +	static const u8 downstream_ports[] = {
> +		0x0a, 0x42, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	};

intel_dp->downstream_ports is read from DPCD address 0x80, and it
dynamically reflects the downstream port information, i.e. what's
currently connected to the branch device. Having a fixed comparison like
this will only work for a specific type of downstream device connected
to a specific downstream port.

> +	const struct edid *edid = drm_edid_raw(drm_edid);

No new drm_edid_raw() calls are to be added.

> +
> +	if (intel_dp_is_edp(intel_dp) || intel_dp->is_mst ||
> +	    !drm_dp_is_branch(intel_dp->dpcd) || !edid)
> +		return false;
> +
> +	/* HDMI and DVI inputs must retain their downstream limits. */
> +	if (edid->version != 1 || edid->revision < 4 ||
> +	    !(edid->input & DRM_EDID_INPUT_DIGITAL) ||
> +	    (edid->input & DRM_EDID_DIGITAL_TYPE_MASK) != DRM_EDID_DIGITAL_TYPE_DP)
> +		return false;
> +
> +	return !memcmp(&intel_dp->desc.ident, &branch, sizeof(branch)) &&
> +		!memcmp(intel_dp->downstream_ports, downstream_ports,
> +			sizeof(downstream_ports)) &&
> +		intel_dp->dfp.min_tmds_clock == 25000 &&
> +		intel_dp->dfp.max_tmds_clock == 165000;
> +}

We have intel_quirks.c with various structured mechanisms for
identifying quirks. If we end up needing a quirk for this, the existing
mechanisms need to be used instead of adding a bunch of code inline like
this.

Again, please let's first root cause and debug the issue instead of
trying to fix the patch.

BR,
Jani.


> +
>  static void
>  intel_dp_update_dfp(struct intel_dp *intel_dp,
>  		    const struct drm_edid *drm_edid)
> @@ -6181,6 +6214,21 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
>  		drm_dp_get_pcon_max_frl_bw(intel_dp->dpcd,
>  					   intel_dp->downstream_ports);
>  
> +	/*
> +	 * Experimental workaround for the branch observed in an Anker A8388.
> +	 * USB-C hotplug can expose a DVI descriptor for the DP output. The
> +	 * monitor's native timing works when requested explicitly, despite
> +	 * the reported 165 MHz limit. Keep the captured identity and failure
> +	 * signature checks narrow until the underlying cause is understood.
> +	 */
> +	if (intel_dp_has_anker_tmds_mismatch(intel_dp, drm_edid)) {
> +		intel_dp->dfp.min_tmds_clock = 0;
> +		intel_dp->dfp.max_tmds_clock = 0;
> +		drm_info(display->drm,
> +			 "[CONNECTOR:%d:%s] experimental Anker DP TMDS limit workaround\n",
> +			 connector->base.base.id, connector->base.name);
> +	}
> +
>  	drm_dbg_kms(display->drm,
>  		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d, TMDS clock %d-%d, PCON Max FRL BW %dGbps\n",
>  		    connector->base.base.id, connector->base.name,
>
> base-commit: 703cd271db3a35088460ab3fec0a96bd48e7fe04

-- 
Jani Nikula, Intel
