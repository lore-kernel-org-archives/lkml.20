Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF8B4C753F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159059; cv=none; b=E2dKNj8CgQhqiHwD9iB9C8BmTowgBrU4IZ/83U1NSthFqKUShWyO3j4zx+f2yL1cWcm2aUTZia6dHa4NFnlyU95RljRrQYjxAxsSTy7qNkDFFChKHViPU+BRy8gem2BF6XTp0howaUORGt9pB0omMnxnEfaU+EsdfuAjobPm4MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159059; c=relaxed/simple;
	bh=uHq4jYBha0lFpTggZJWH//6an9aVUgBaNVegMdOU+uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyctrDkOp9JE3SrYuO5CgSz9s4IdMpUgKh44cnWeoqZi9D0Eh+uTI5GnQN8wwBhxIdopyXlHyKqLYgVotCDej+ySZMVftkieDYqJfGmt0JELkYhUzO/eW3FSWM9Rny2vkjiwvT0sb9XV5YpvAdwQrxy92FcMokCrMg1ZjDHRTuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZ7y8OIM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZ7y8OIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792159058; x=1823695058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uHq4jYBha0lFpTggZJWH//6an9aVUgBaNVegMdOU+uU=;
  b=iZ7y8OIMmOg0zL3MJkWcTTfvDVq6eYEJYvQ/2vadJ9FeVv6egxkVJYTP
   Nb03MHQ9fQwwqwzwYNgAe1ZnviGxlAPX787fGyeFs4gapx44pLm4fxS8W
   BFgAvBSzNuqqJg8dsPbI2L2kEyjJnq63cPjjH1MmdHL87b3NaQtlB/0un
   oAFNPs/sAW8Wlx7QZSt1LJA8pT9bT96aFAosnqTBsQe0MJYlPbsNQ5hn+
   cyZZsEDasG+TBbdZUJ+gZpCUq/MjgYX+QXFIkh5qn+WqpEgS1nuWDqQoC
   cO2pHFp7EZe/yDZXpOlIFnaYHe7Wcqu65kBUrpRqmvTO5w0yI42KM1P1c
   A==;
X-CSE-ConnectionGUID: c4GAaVTCR46LznoJFz+aLA==
X-CSE-MsgGUID: zFKJjOnCSKCgJI5n/grX7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="942932"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="942932"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 06:57:37 -0700
X-CSE-ConnectionGUID: P7HFVIbRSqWTrmjuQIGvbg==
X-CSE-MsgGUID: H/QjLFKfTCqchCuV03OtqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2199831"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.56])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 06:57:34 -0700
Date: Fri, 16 Oct 2026 16:57:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hugo Sales <hugo@hsal.es>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jfalempe@redhat.com, javierm@redhat.com
Subject: Re: [PATCH 0/2] drm/client: Keep larger modes in connector->modes on
 fbdev hotplug
Message-ID: <atItSgRj26x60ACf@intel.com>
References: <20261015212545.1989962-1-hugo@hsal.es>
 <atIYd0dd6ynXulwQ@intel.com>
 <20261016131652.483525-1-hugo@hsal.es>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261016131652.483525-1-hugo@hsal.es>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Fri, Oct 16, 2026 at 02:16:52PM +0100, Hugo Sales wrote:
> On Fri, Oct 16, 2026 at 03:28:39PM +0300, Ville Syrjälä wrote:
> > On Thu, Oct 15, 2026 at 10:25:43PM +0100, Hugo Sales wrote:
> > > On an ASUS ROG Flow X13 with a 3840x2400 eDP panel, booted with
> > > video=eDP-1:1920x1200@60, an HDMI hotplug makes fbdev reprobe every
> > > connector with its 1920x1200 framebuffer as the limit. connector->modes
> > > loses the panel's 3840x2400 mode, and after suspend/resume amdgpu drives
> > > the panel with the 1920x1200 timing. The image ends up squeezed into the
> > > top-left corner. Details are in
> > > https://gitlab.freedesktop.org/drm/amd/-/issues/5983
> >
> > Sounds like an amdgpu bug.
> 
> Agreed, the resume bug is in amdgpu. It looks up the eDP native mode in
> connector->modes, which fbdev's hotplug probe can trim. This series
> fixes it there:
> https://lore.kernel.org/r/20261014223041.171317-1-hugo@hsal.es
> 
> I sent this one for the shared list itself because after a hotplug,
> connector->modes depends on fbdev's framebuffer size, while initial
> setup, drm_log and GETCONNECTOR probe with the device's limits.

Connectors aren't probed before something actually probes them.
Typically that would be fbdev.

> Until
> something reprobes, the sysfs modes file and any driver that reads the
> list see the trimmed version
> 
> amdgpu isn't the only driver that reads it. stm/lvds and
> shmob_drm_encoder_mode_fixup() take the first entry of connector->modes
> as the panel mode, so they may hit the same thing with a video= mode
> smaller than the panel. I haven't tested those, because I don't have
> the hardware. Fixing it in the core covers them without each driver
> keeping its own copy of the native mode

Those things will need to be fixed regardless because they are
broken wrt locking.

But I suppose not filtering the mode list based on the fbdev size
might be a bit less confusing for anyone who looks at the mode
list via sysfs. Can't immediately think what else besises the 
fbdev/client code would depend on this, so maybe it's fine.

If we do this then I think we should stop passing the size to
.fill_modes() entirely, because we always pass the same device
limits. The downside is all those annoying extra
drm_mode_validate_size() calls everywhere, but I guess we
could live with that.

-- 
Ville Syrjälä
Intel
