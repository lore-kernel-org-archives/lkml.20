Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9463CF68E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153728; cv=none; b=GKQdTPfQonOFBzVXUNS12OwhIn7PshMBBaoJiU3NE48QyItOLdhE6X3O3jr73foQ7/xL43ObRWew+w5T9jv5ZBkIQrnTa0scXMOwH7fBh8stY7FWSdYZLfThxgSKyG9XwIRHt+B/du6YWVE9Zts6Rq/ScU7g2BXEB5AU6yOdGs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153728; c=relaxed/simple;
	bh=T1W17b8xPZaroEZijoek+Vna3qIAkTvc3xtdOUlylJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8CL7LO7/LoLAUtlFQyShNn6Rq8llJa4Uf3/ki6HfSnCAZ7Q0jgznFfXVp0we4WUqKNpiE637mB39EcjaoX9IZRIR3H5YCmF0pxKBxS3w5489Nrov0Te96Yg9TCeGMl1QW/ScdC4lVfc50hfrwlCC1U5y8A1CToFzU+qCbEcazA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyXKnWWm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyXKnWWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792153727; x=1823689727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=T1W17b8xPZaroEZijoek+Vna3qIAkTvc3xtdOUlylJQ=;
  b=PyXKnWWmH1kMg0ko9ir9EdpndBC+/WBAxYxQQT6vZBgSG5rAvrsHSgBN
   RYfHhWHTghgffx7cmiImNI9FHlBsI9OP7sfT0AbiDBw+hflwkSuad7SrK
   xXf+QFhdfIvzQaZ7uQygD16duW4gZz7FBQFhH8UIe0xwcTJVp/p1/Hd8E
   4gGlo+e//OEU8N2wyimEH+bIf0Wb1v/giwq4KVeyN0gEZQBgL1GCwisGD
   XQTKIUTlm6hQnJ9ofbB0nJOcTpEud3NiUkSSIEKBlH+xrUSAHNkuHSv63
   Nw/W3ngsq+kFGR2tw72+Joe2ayBP+rWPg3p2xx7Tr1v/W9Q6rP1de/Na0
   A==;
X-CSE-ConnectionGUID: opmonh6CROyA17to0UbQdw==
X-CSE-MsgGUID: X0sPoxj3SqOeE+CCowmYuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="838453"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="838453"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 05:28:46 -0700
X-CSE-ConnectionGUID: eJjhAYWnS6SEKpUHkUjqUQ==
X-CSE-MsgGUID: vL52YNVYRVGcOP445kR2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2256804"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.56])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 05:28:43 -0700
Date: Fri, 16 Oct 2026 15:28:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hugo Sales <hugo@hsal.es>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jfalempe@redhat.com, javierm@redhat.com
Subject: Re: [PATCH 0/2] drm/client: Keep larger modes in connector->modes on
 fbdev hotplug
Message-ID: <atIYd0dd6ynXulwQ@intel.com>
References: <20261015212545.1989962-1-hugo@hsal.es>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015212545.1989962-1-hugo@hsal.es>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Thu, Oct 15, 2026 at 10:25:43PM +0100, Hugo Sales wrote:
> On an ASUS ROG Flow X13 with a 3840x2400 eDP panel, booted with
> video=eDP-1:1920x1200@60, an HDMI hotplug makes fbdev reprobe every
> connector with its 1920x1200 framebuffer as the limit. connector->modes
> loses the panel's 3840x2400 mode, and after suspend/resume amdgpu drives
> the panel with the 1920x1200 timing. The image ends up squeezed into the
> top-left corner. Details are in
> https://gitlab.freedesktop.org/drm/amd/-/issues/5983

Sounds like an amdgpu bug.

> 
> Patch 1 makes drm_client_modeset_probe() probe with the device's limits
> and moves the framebuffer size check into the fbdev mode pickers.
> Patch 2 adds KUnit tests for it
> 
> fbdev's hotplug probe has passed the framebuffer size since 2010
> (4abe35204af8). The pickers didn't check mode sizes then, so leaving
> larger modes out of the list was what kept fbdev from picking one. They
> check the size themselves now, so the probe can use the device's limits
> like initial setup, drm_log and GETCONNECTOR already do
> 
> The HiBMC thread "[RFC] drm/client: Relax clone mode selection in
> drm_client_target_cloned" runs into the same pruning: its 640x480
> framebuffer removes 1024x768 from both connectors' lists. With this
> series userspace sees that mode again, but fbdev still can't use it, so
> this doesn't replace that RFC:
> https://lore.kernel.org/r/a48e0b33-7eab-478e-a396-b6e76b7a066f@huawei.com
> 
> I sent an amdgpu fix for the same symptom separately. It makes amdgpu
> fall back to the encoder's native mode on eDP and LVDS:
> https://lore.kernel.org/r/20261014223041.171317-1-hugo@hsal.es
> This series fixes the shared mode list for every driver instead. Either
> one alone fixes the reported bug, from my testing
> 
> On amd-staging-drm-next with only this series applied, with an HDMI
> hotplug and suspend/resume (pm_test=platform) in a loop, 255 of 255
> resumes kept the native timing. Without it, 28 of 29 came back with the
> wrong timing, and the same loop on unpatched v7.2.8 got it wrong in 103
> of 103. The drm KUnit tests pass, also under KASAN, which reports
> nothing in the code this series touches
> 
> Hugo Sales (2):
>   drm/client: Probe connectors with the device's mode size limits
>   drm/tests: Add KUnit tests for the client mode size limits
> 
>  drivers/gpu/drm/drm_client_modeset.c          |  57 +++--
>  .../gpu/drm/tests/drm_client_modeset_test.c   | 222 +++++++++++++++++-
>  2 files changed, 260 insertions(+), 19 deletions(-)
> 
> -- 
> 2.55.0

-- 
Ville Syrjälä
Intel
