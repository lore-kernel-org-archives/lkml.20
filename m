Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0B3331A66
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137946; cv=none; b=cH3A/tEact67W52dgkKimsRAd1PfC3HEpzNVlpA217l9Aw1EYzO2BoIhnxRzSd/jRrIu9QFKrA9S5/SAqhh37Kay6C4NZc8QvFKhi1HRAQyR4Ig+AayJOyNtDJArfeNyfYcGc086+FaIJ94r5A/ER0/Cui59rbSDcoj9tOglNiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137946; c=relaxed/simple;
	bh=PppMbN7JrlN2WIYjBSNxEEfQHQ518ojauiEB1n1zhLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twQR/dHmEYpJEb4sf025P+N9YzXGdbVhcEB+riqazFsxMJYXWrXmfabF/xYlnTGyQBkIfsSfR62uPhN5SojiAWv423StHMAbAuOP68R46rI1LMYy6eEF2NjlBd/6SQO2JYnSjkGJSJD7agXJ6ZdqMXuo6uMpIrE8Z8IotrLO8b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 6AF53378;
	Fri, 16 Oct 2026 10:05:40 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 46A94602EBBF; Fri, 16 Oct 2026 10:05:40 +0200 (CEST)
Date: Fri, 16 Oct 2026 10:05:40 +0200
From: Lukas Wunner <lukas@wunner.de>
To: vasilij.kernel@tototo.si
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Aditya Garg <aditya.garg@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Kerem Karabay <kekrby@gmail.com>,
	Atharva Tiwari <evepolonium@gmail.com>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Subject: Re: [PATCH v3] drm/appletbdrm: Add suspend and resume support
Message-ID: <atHa1KHess5QUpXW@wunner.de>
References: <20261015-appletbdrm-pm-v3-1-47377176619a@tototo.si>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-appletbdrm-pm-v3-1-47377176619a@tototo.si>

On Thu, Oct 15, 2026 at 11:47:36PM +0200, Vasilij Markin via B4 Relay wrote:
> The driver has no USB power management callbacks, so the USB core
> unbinds it before system suspend and binds it again on resume. The DRM
> device is unregistered and registered again on every suspend and resume
> cycle, userspace driving the Touch Bar through it (such as tiny-dfr)
> loses its device, and the Touch Bar stays dark after resume.
> 
> Implement suspend and resume with drm_mode_config_helper_suspend() and
> drm_mode_config_helper_resume(), so the device stays registered and the
> last committed state is restored on resume. If the device was reset
> while suspended, repeat the probe-time handshake first.
> 
> Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Macs")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Vasilij Markin <vasilij.kernel@tototo.si>

Applied to drm-misc-next, thanks.  Note that we're at the tail end
of the cyce and the drm subsystem has an rc6 cut-off.  So this is
v7.5 material.

The Fixes tag could be argued against because this isn't really a fix,
it's more like a missing feature.  But I can see how this is useful for
people on older LTS kernels, so I let it slide.

Thanks,

Lukas
