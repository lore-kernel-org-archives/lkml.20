Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B737C3BED18
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161970; cv=none; b=cetzeQGB/dtqua3uJ7/Hsr+xnr/6MgpryXGqWtSuYItzrAeqrsKfTTSlKl61hht+5ONOzOjQqZWWm1YbDoIkeZ9Hv2HvsScqKdGPWIMq6I890fJCV8GyGJu/0k61IpOBQyvY5IcVd83ZqFSfChSYxKxoduBueb+DrXtir5Ggybw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161970; c=relaxed/simple;
	bh=BSX4JPsTUA1rhCA4YtPNJ8wqYMmJwWqrUrTT6yZORII=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K1OYKrjp6ijMzWRcm8xgUL2s89Xpcdzot/eQ7mkdjj6mB1yl8e3jS0pGulX62PY+FJJ0VzRjsDErpuFd70bvsHLUf8dswntiC57ZspPerseFMZKPFUZZyxr3FnzyrQC9y89VFGCl5EYOtLHpnRRvvH8fB3auqOnIZt1EG5MlCjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hX4fk/yH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hX4fk/yH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788161967; x=1819697967;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=BSX4JPsTUA1rhCA4YtPNJ8wqYMmJwWqrUrTT6yZORII=;
  b=hX4fk/yHsGAFWaZZIcBS6gjVN/+Fn/fGL5HaXYIRQQXND889K8c0LcAo
   2Txe2G6kZ13jpkkgj2PVgl5jSY3OENj03TiE18f4lqonJnbB/YY4ZQPNU
   cHibodAsiwkX/duXAEVrnSMjo6zK8IyNvxzi+U2fMo+PNMb58X1CKfUTz
   fVLFtX0l95nCzdv0CVjPbWWEjGaGPfPTsnJj+rToHw3Qs56S+N5OznQ0D
   MFC+Z5p0RtxaA+Cukr3NrztVCw45q0aFANlWwku58ceMxhH0topcuoA+R
   JSNTVBv4FfQRMq0s4RcuEr56f/Xlp4vVhA+xWhcZQgqJc7MLd6X4KL+0e
   Q==;
X-CSE-ConnectionGUID: 7+VjxtJ0RIyB5Pe/YCPHjQ==
X-CSE-MsgGUID: 8c8rsCM3QQei7RTpMvVoNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="114098585"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="114098585"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:39:09 -0700
X-CSE-ConnectionGUID: jC1wsiNNSiGuHFJsHoTFqw==
X-CSE-MsgGUID: zcC8wP6zRN6l3LDIsV0h4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="306966919"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 00:39:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Eduardo Diaz <iamedu@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Eduardo
 Diaz <iamedu@gmail.com>
Subject: Re: [PATCH] drm/i915/cdclk: Don't trust boot readout for per-pipe
 cdclk/voltage tracking
In-Reply-To: <20260830161703.11570-1-iamedu@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260830161703.11570-1-iamedu@gmail.com>
Date: Mon, 31 Aug 2026 10:39:03 +0300
Message-ID: <c2603413d2af50854a620c5966149495b36dc851@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 30 Aug 2026, Eduardo Diaz <iamedu@gmail.com> wrote:
> On Panther Lake (xe3lpd) laptops, cold boot reliably corrupts the
> internal eDP panel: pipe A gets a "Selective fetch area calculation
> failed in pipe A" warning immediately followed by a CPU pipe A FIFO
> underrun, and the panel stays corrupted for the rest of the session.
> A subsequent suspend/resume cycle (or any other full re-modeset)
> "fixes" it, which pointed at cdclk/voltage-level tracking rather than
> a genuine hardware race.
>
> intel_modeset_readout_hw_state() runs once at driver probe (and again
> on resume) to figure out what firmware/GOP left the display in. For
> each already-active pipe it calls intel_cdclk_update_hw_state(),
> which seeds cdclk_state->min_cdclk[]/min_voltage_level[] directly
> from the freshly read-out crtc_state. That treats "firmware left this
> pipe active with mode X" as proof that this driver's own cdclk,
> voltage-level and DBUF setup for mode X is already established in
> hardware. It isn't -- only firmware's own, entirely separate code
> path has ever touched those registers.
>
> The OS driver's first real modeset for an inherited pipe typically
> targets the same native panel mode, so the freshly computed
> crtc_state->min_cdclk/min_voltage_level trivially match this
> readout-seeded baseline. intel_cdclk_update_crtc_min_cdclk() and
> intel_cdclk_update_crtc_min_voltage_level() then conclude nothing
> changed and skip the recalculation, on the one commit where it
> actually matters: taking a pipe from firmware ownership to being
> correctly configured by this driver.
>
> Fix this in two parts:
>
>  - Invalidate the per-pipe min_cdclk[]/min_voltage_level[] tracking
>    right after boot-time readout, so the first real atomic commit is
>    guaranteed to see a difference.
>
>  - Stop early-returning in intel_cdclk_update_crtc_min_cdclk() and
>    intel_cdclk_update_crtc_min_voltage_level() based on the crtc_state
>    comparison alone. That comparison is unreliable for exactly the
>    same reason (it's derived from the same readout), and skips the
>    real, tracked-state check below it.
>
> Bisected on real hardware (Lenovo Yoga 9i 14IPH11, Panther Lake) down
> to a narrow window between v6.19.10 (clean on every cold boot) and
> v7.1.10 (broken on every cold boot); confirmed via live kernel
> tracing that the skip path fires unconditionally on this platform
> from the very first post-boot atomic commit onward. This fix
> eliminates the FIFO underrun across many consecutive cold boots on
> the same hardware, with no regression observed across suspend/resume.

Do you have a regressing commit? Nearly 600 commits were merged to i915
display alone between 6.19 and 7.1 so it's not really a narrow window.

Have you filed a bug as described at [1]? With debugs, logs, and
everything.

Have you tried with 1786d2688781 ("drm/i915/cdclk: Avoid spurious cdclk
sanitization on PTL+")?


BR,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


> The investigation and this fix were developed with the assistance of
> Claude (Anthropic), driven and verified end to end on the affected
> hardware by the Signed-off-by below.
>
> Signed-off-by: Eduardo Diaz <iamedu@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c    | 45 ++++++++++++++-----
>  drivers/gpu/drm/i915/display/intel_cdclk.h    |  1 +
>  .../drm/i915/display/intel_modeset_setup.c    |  1 +
>  3 files changed, 36 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index a53d887271..209a2373d1 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2981,11 +2981,14 @@ static int intel_cdclk_update_crtc_min_cdclk(struct intel_atomic_state *state,
>  	bool allow_cdclk_decrease = intel_any_crtc_needs_modeset(state);
>  	int ret;
>  
> -	if (new_min_cdclk == old_min_cdclk)
> -		return 0;
> -
> -	if (!allow_cdclk_decrease && new_min_cdclk < old_min_cdclk)
> -		return 0;
> +	/*
> +	 * old_min_cdclk comes from the previous crtc_state, which after
> +	 * boot-time readout reflects whatever firmware/GOP left running,
> +	 * not what this driver has programmed. For an inherited pipe it
> +	 * equals new_min_cdclk by construction (same mode, same formula),
> +	 * so an early return here would skip the recalculation that
> +	 * matters. Always continue on to the cdclk_state check below.
> +	 */
>  
>  	cdclk_state = intel_atomic_get_cdclk_state(state);
>  	if (IS_ERR(cdclk_state))
> @@ -3026,12 +3029,10 @@ static int intel_cdclk_update_crtc_min_voltage_level(struct intel_atomic_state *
>  	bool allow_voltage_level_decrease = intel_any_crtc_needs_modeset(state);
>  	int ret;
>  
> -	if (new_min_voltage_level == old_min_voltage_level)
> -		return 0;
> -
> -	if (!allow_voltage_level_decrease &&
> -	    new_min_voltage_level < old_min_voltage_level)
> -		return 0;
> +	/*
> +	 * old_min_voltage_level is unreliable for the same reason; see
> +	 * intel_cdclk_update_crtc_min_cdclk().
> +	 */
>  
>  	cdclk_state = intel_atomic_get_cdclk_state(state);
>  	if (IS_ERR(cdclk_state))
> @@ -3705,6 +3706,28 @@ void intel_cdclk_update_hw_state(struct intel_display *display)
>  	cdclk_state->dbuf_bw_min_cdclk = intel_dbuf_bw_min_cdclk(display, dbuf_bw_state);
>  }
>  
> +/*
> + * intel_cdclk_update_hw_state() seeds min_cdclk[]/min_voltage_level[]
> + * from readout's crtc_state, i.e. from whatever firmware/GOP left
> + * running, not from anything this driver has programmed. A pipe's
> + * first real modeset usually targets the same native mode, so the
> + * freshly computed value matches this seeded baseline and
> + * intel_cdclk_update_crtc_min_cdclk()/_min_voltage_level() conclude
> + * nothing changed, skipping the recalculation that matters. Call
> + * this after readout so the first real commit sees a difference.
> + */
> +void intel_cdclk_invalidate_min_tracking(struct intel_display *display)
> +{
> +	struct intel_cdclk_state *cdclk_state =
> +		to_intel_cdclk_state(display->cdclk.obj.state);
> +	enum pipe pipe;
> +
> +	for_each_pipe(display, pipe) {
> +		cdclk_state->min_cdclk[pipe] = 0;
> +		cdclk_state->min_voltage_level[pipe] = 0;
> +	}
> +}
> +
>  void intel_cdclk_crtc_disable_noatomic(struct intel_crtc *crtc)
>  {
>  	struct intel_display *display = to_intel_display(crtc);
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.h b/drivers/gpu/drm/i915/display/intel_cdclk.h
> index a60cbf745e..1517d3605a 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.h
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.h
> @@ -46,6 +46,7 @@ int intel_cdclk_state_set_joined_mbus(struct intel_atomic_state *state, bool joi
>  struct intel_cdclk_state *
>  intel_atomic_get_cdclk_state(struct intel_atomic_state *state);
>  void intel_cdclk_update_hw_state(struct intel_display *display);
> +void intel_cdclk_invalidate_min_tracking(struct intel_display *display);
>  void intel_cdclk_crtc_disable_noatomic(struct intel_crtc *crtc);
>  int intel_cdclk_update_dbuf_bw_min_cdclk(struct intel_atomic_state *state,
>  					 int old_min_cdclk, int new_min_cdclk,
> diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> index 6aed881737..c7be6e63e7 100644
> --- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> +++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> @@ -880,6 +880,7 @@ static void intel_modeset_readout_hw_state(struct intel_display *display)
>  	intel_bw_update_hw_state(display);
>  	intel_dbuf_bw_update_hw_state(display);
>  	intel_cdclk_update_hw_state(display);
> +	intel_cdclk_invalidate_min_tracking(display);
>  
>  	intel_pmdemand_init_pmdemand_params(display, pmdemand_state);
>  }

-- 
Jani Nikula, Intel
