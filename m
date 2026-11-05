Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898576;
	b=V0Po2zh69i5Pt/6fyQt88VHBBgbAf1NoUQtrdEuxbdsxVOKMoRIg76kkKjUHfseyP6q4
	 jgTgK/Vlb6rbWhIVM054/t/YH/GQQuAStE4FWAFm+Fd5+PaAGvsMXbMKpN6Mfe3y0yA2I
	 Rj/ZQzjIFsKn1EUTnM1k5/CAFIaoHTRdq2ELwktD+AfaKV/y0L93/pgbGAk02cRFia0LW
	 dKMcgDyQkcRCX49fwTLOto5kmCvkmEeyAcOWKftE5UK9F5vKGi49D4en4BTv4wzAb7u1k
	 w64mgsWNXwmzNVXHAGXsKx13BsiY3hqnD5j0Wfbo1cvrYw1ZdCWpxFSWnz5RlhYMMfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898576;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=ftXrLJ3VGDxoUJyKbJMYpPqFnmx7TbsuL9Req11yyW8=;
	b=OGW3VS/FUQXqdEDYjQgNA9ryLPu9+blwfYblXnMq69J9sO5MAWvawHQ8x5Z9+CVLIKAw
	 QVq6MVpf+WhISp9P4BMRgfX9gxv4ShBOhSlKJZbpcEQS5ylwTqXLBYAhhgkwaR690P0aY
	 EDni/4nPXWjZvqOtuEs0eojz/xLosbZbkg1fgSu4F090L6J75WzBY61+mJcJ9FOwj6jnd
	 LlDwNsxPVLWD6YXOcwFodJKaKMR2bUE+KIWpNbnt4KDlDui5Gy8X+MFZD5YLtjJMhoQg6
	 Hr9K0ff6r6rbIE4EgSUsY31SCNMLOnf6qC1MPXPngkbchl6HrcVwlFfEALxM/xZv/Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PHbKldF5;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A2F606A326;
	Thu,  5 Nov 2026 17:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A2F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PHbKldF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793898576; x=1825434576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=z/d+aYcT75wGZnwBdM9DEcoUTmOnTK13mjsp6wxBpiU=;
  b=PHbKldF5Z6MYX2+yFw17UQAV2HgIng59OSLcMYm6RF2m4KfuDk54qwVq
   ZmiUK8Bb7Mbeuh4CXQRnT51Maoq+cWvqn1AB/zEDER1Wjhl4AqPkd3IXn
   7S83cCA3rfwpeKhDiwyGt4x4rCkWnfpsM7AcszKyulZfIKlNFuSCMKkMT
   wZvN1M2sRqVL+7P2tna4l27CfkvcaNFmvcDTtUJpx89REeOkit5E8Sn2V
   Pbv/GpLeWNQq/Jd5Qw5HZCxnwi42sAo9E/JBPVuEm2R9loo+duvV5aQRv
   wJdypFXEvW1bOaCjJAUoc+NNlWljqH3PyC0haHVHMKsdL2+GP8ooJxMze
   w==;
X-CSE-ConnectionGUID: 1HxxxujoS1WcGkHYffh9aw==
X-CSE-MsgGUID: O7dTPc2VRG6+GOkBk3T1Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2571937"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2571937"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:09:35 -0800
X-CSE-ConnectionGUID: NPSPczPMT5+IW8n9a9DqNA==
X-CSE-MsgGUID: Q31IRDsjRS2dKxEWx/ovsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7072778"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.198])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:09:29 -0800
Date: Thu, 5 Nov 2026 19:09:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	amd-gfx@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?utf-8?B?VG9tw6HFoQ==?= Hnyk <tomashnyk@gmail.com>,
	Wim Taymans <wtaymans@redhat.com>, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/i915/audio: Populate ELD Port_ID
Message-ID: <auy4RTCRfprhD-5Z@intel.com>
References: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
 <20261105160240.2850042-3-kai.vehmanen@linux.intel.com>
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
In-Reply-To: <20261105160240.2850042-3-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Thu, Nov 05, 2026 at 06:02:40PM +0200, Kai Vehmanen wrote:
> i915 never fills in the ELD Port_ID field, so it is always zero, and
> the ELDs of identical monitors connected to different outputs are
> byte-identical. Userspace then cannot tell which HDMI/DP PCM belongs to
> which DRM connector without toggling the connector audio property.
> 
> Use drm_eld_set_port_id() when computing the audio config, so the value
> reaches the audio driver through every path: the audio component
> get_eld() callback, the hardware ELD buffer, SDVO and LPE audio.
> 
> The value is fixed for the lifetime of the connector, so it does not
> cause extra audio re-enables when the ELD is compared across commits,
> and state readout stays consistent because it is copied from the
> programmed ELD.
> 
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16693
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_audio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index 32f8c5e55319..3277e67748ee 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -881,6 +881,8 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
>  	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
>  	mutex_unlock(&connector->eld_mutex);
>  
> +	drm_eld_set_port_id(crtc_state->eld, connector);
> +
>  	return true;
>  }
>  
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
