Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EDD28315D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789805148; cv=none; b=jrZaFa4izxcD0CM0hg8yfGusRnOJn25TZPWvK4w2L7XLjc6dVAK9WQQdpHqqf/cLE2Jmf+JLWD4l26qdW+MidAiUdYJp9t/4xyQwBcb0U2ST3GwYS+gQSLI5f08A3JOL6b/ZZbkVi6B03I2g6VHTCEBCOltIle6hgeJXHgMRgMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789805148; c=relaxed/simple;
	bh=zH/IEjVpNxlwXJ5M63AvXIraVU6Wp0w/Vc8bBhBVPCE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mv4NwfYK1tI6atY6UyZHmX9DJpgxU1XKCECcMjrrGlidqsmN3u3Lr+nqzae2qNVmOryxzEvbh46Sr7oSpSdlW+Nf1b0YsEHolTFYQdhW6QDZZBqkjsSjma3EXkOBSuG8fflnFSIuBAMEcZ8XyCIaN/I2au/xTRPX0KnXTRK2S/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0o3jhQd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0o3jhQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789805146; x=1821341146;
  h=date:from:to:cc:subject:message-id;
  bh=zH/IEjVpNxlwXJ5M63AvXIraVU6Wp0w/Vc8bBhBVPCE=;
  b=I0o3jhQd/GeEFHj1SHzUMivpwt4OhOxQeinjpMnbmXfi/GQtnTHvV/j3
   /xmkEXufULvshy1tFXpLhjRjZzw1HMZbiRvQZ4bTWv2s8P2D9aaPmI9+H
   kpUcT1Ik28N67iin2sC86YUMkCzvNm1OwaskE7SYQrSplaMEzmW+1rqEz
   z6q5J6rtU3FOSVj4FZBhG7rWC8FNVHMnd29bNzLMwPM+q1VCqxHBryEyk
   w3K0i/xi+j21WlPtzSsClS8xQc+rfkiLdwQu9arSSZpdVCwJ1FtJCwMOq
   +/liT63vlQxichjfw9pXyD0TlLqTNjk0gZ2Xg6wVwNzQdXLNvp8kICxfv
   Q==;
X-CSE-ConnectionGUID: IieC938tQdiKZ/ZG9qe6Jg==
X-CSE-MsgGUID: KAo6RihdSQ6IcGdUFITeqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90354780"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90354780"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 01:05:45 -0700
X-CSE-ConnectionGUID: 7eAu6/dHRuue4519R7osWA==
X-CSE-MsgGUID: K2IJQjroRm6nUNZVibmjtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="272081166"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 Sep 2026 01:05:43 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7q4l-000000001OS-1slO;
	Sat, 19 Sep 2026 08:05:35 +0000
Date: Sat, 19 Sep 2026 10:04:47 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Chenyu Chen <chen-yu.chen@amd.com>
Subject: 
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c:3556:37-39:
 WARNING !A || A && B is equivalent to !A || B
Message-ID: <202609190901.yKTzhsGz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Alex,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40288c9206c17eb66a603262e06a58d300d0f279
commit: 0e967e086e7519966816b76a6309b4516d365aa5 drm/amd/display: Extract connector and encoder code to amdgpu_dm_connector
date:   3 months ago
config: x86_64-randconfig-103-20260911 (https://download.01.org/0day-ci/archive/20260919/202609190901.yKTzhsGz-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0e967e086e75 ("drm/amd/display: Extract connector and encoder code to amdgpu_dm_connector")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190901.yKTzhsGz-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c:3556:37-39: WARNING !A || A && B is equivalent to !A || B
--
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c:1382:5-19: ERROR: invalid reference to the index variable of the iterator on line 1367

vim +3556 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c

  3425	
  3426	/**
  3427	 * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
  3428	 *
  3429	 * @connector: Connector to query.
  3430	 * @drm_edid: DRM EDID from monitor
  3431	 * @do_mccs: Controls whether MCCS (Monitor Control Command Set) over
  3432	 *	      DDC (Display Data Channel) transactions are performed. When true,
  3433	 *	      the driver queries the monitor to get or update additional FreeSync
  3434	 *	      capability information. When false, these transactions are skipped.
  3435	 *
  3436	 * Amdgpu supports Freesync in DP and HDMI displays, and it is required to keep
  3437	 * track of some of the display information in the internal data struct used by
  3438	 * amdgpu_dm. This function checks which type of connector we need to set the
  3439	 * FreeSync parameters.
  3440	 */
  3441	void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
  3442					    const struct drm_edid *drm_edid, bool do_mccs)
  3443	{
  3444		int i = 0;
  3445		struct amdgpu_dm_connector *amdgpu_dm_connector =
  3446				to_amdgpu_dm_connector(connector);
  3447		struct dm_connector_state *dm_con_state = NULL;
  3448		struct dc_sink *sink;
  3449		struct amdgpu_device *adev = drm_to_adev(connector->dev);
  3450		struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
  3451		const struct edid *edid;
  3452		bool freesync_capable = false;
  3453		enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
  3454	
  3455		if (!connector->state) {
  3456			drm_err(adev_to_drm(adev), "%s - Connector has no state", __func__);
  3457			goto update;
  3458		}
  3459	
  3460		sink = amdgpu_dm_connector->dc_sink ?
  3461			amdgpu_dm_connector->dc_sink :
  3462			amdgpu_dm_connector->dc_em_sink;
  3463	
  3464		drm_edid_connector_update(connector, drm_edid);
  3465	
  3466		if (!drm_edid || !sink) {
  3467			dm_con_state = to_dm_connector_state(connector->state);
  3468	
  3469			amdgpu_dm_connector->min_vfreq = 0;
  3470			amdgpu_dm_connector->max_vfreq = 0;
  3471			freesync_capable = false;
  3472	
  3473			goto update;
  3474		}
  3475	
  3476		dm_con_state = to_dm_connector_state(connector->state);
  3477	
  3478		if (!adev->dm.freesync_module || !dc_supports_vrr(sink->ctx->dce_version))
  3479			goto update;
  3480	
  3481		/* FIXME: Get rid of drm_edid_raw() */
  3482		edid = drm_edid_raw(drm_edid);
  3483	
  3484		/* Some eDP panels only have the refresh rate range info in DisplayID */
  3485		if ((connector->display_info.monitor_range.min_vfreq == 0 ||
  3486		     connector->display_info.monitor_range.max_vfreq == 0))
  3487			parse_edid_displayid_vrr(connector, edid);
  3488	
  3489		if (edid && (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
  3490			     sink->sink_signal == SIGNAL_TYPE_EDP)) {
  3491			if (amdgpu_dm_connector->dc_link &&
  3492			    amdgpu_dm_connector->dc_link->dpcd_caps.allow_invalid_MSA_timing_param) {
  3493				amdgpu_dm_connector->min_vfreq = connector->display_info.monitor_range.min_vfreq;
  3494				amdgpu_dm_connector->max_vfreq = connector->display_info.monitor_range.max_vfreq;
  3495				if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
  3496					freesync_capable = true;
  3497			}
  3498	
  3499			get_amd_vsdb(amdgpu_dm_connector, &vsdb_info);
  3500	
  3501			if (vsdb_info.replay_mode) {
  3502				amdgpu_dm_connector->vsdb_info.replay_mode = vsdb_info.replay_mode;
  3503				amdgpu_dm_connector->vsdb_info.amd_vsdb_version = vsdb_info.amd_vsdb_version;
  3504				amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
  3505			}
  3506	
  3507		} else if (drm_edid && sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
  3508			i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
  3509			if (i >= 0) {
  3510				amdgpu_dm_connector->vsdb_info = vsdb_info;
  3511				sink->edid_caps.freesync_vcp_code = vsdb_info.freesync_mccs_vcp_code;
  3512	
  3513				if (vsdb_info.freesync_supported) {
  3514					amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
  3515					amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
  3516					if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
  3517						freesync_capable = true;
  3518	
  3519					connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
  3520					connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
  3521				}
  3522			}
  3523		}
  3524	
  3525		if (amdgpu_dm_connector->dc_link)
  3526			as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
  3527	
  3528		if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) {
  3529			i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
  3530			if (i >= 0) {
  3531				amdgpu_dm_connector->vsdb_info = vsdb_info;
  3532				sink->edid_caps.freesync_vcp_code = vsdb_info.freesync_mccs_vcp_code;
  3533	
  3534				if (vsdb_info.freesync_supported && vsdb_info.amd_vsdb_version > 0) {
  3535					amdgpu_dm_connector->pack_sdp_v1_3 = true;
  3536					amdgpu_dm_connector->as_type = as_type;
  3537	
  3538					amdgpu_dm_connector->min_vfreq = vsdb_info.min_refresh_rate_hz;
  3539					amdgpu_dm_connector->max_vfreq = vsdb_info.max_refresh_rate_hz;
  3540					if (amdgpu_dm_connector->max_vfreq - amdgpu_dm_connector->min_vfreq > 10)
  3541						freesync_capable = true;
  3542	
  3543					connector->display_info.monitor_range.min_vfreq = vsdb_info.min_refresh_rate_hz;
  3544					connector->display_info.monitor_range.max_vfreq = vsdb_info.max_refresh_rate_hz;
  3545				}
  3546			}
  3547		}
  3548	
  3549		/* Handle MCCS */
  3550		if (do_mccs)
  3551			dm_helpers_read_mccs_caps(adev->dm.dc->ctx, amdgpu_dm_connector->dc_link, sink);
  3552	
  3553		if ((sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A ||
  3554			as_type == FREESYNC_TYPE_PCON_IN_WHITELIST) &&
  3555			(!sink->edid_caps.freesync_vcp_code ||
> 3556			(sink->edid_caps.freesync_vcp_code && !sink->mccs_caps.freesync_supported)))

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
