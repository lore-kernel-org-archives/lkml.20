Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054EA58B6D0
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792095989; cv=none; b=DS5mIGVgxEGYI8iNRxt6Jh2AshUDfWgnmgFq2ELkDearPb1DQZFWd9eSDerb2Ge4x6cjtFBVBKbNNzESjCJZPG2JLOll++4d17AwEM0bGCIZ9OSmbWg5Hmd/kqXPLdiqDGZx8Cbih2PyjTnNjuzp2CA3m3gO+hIFhn7VXt5OJQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792095989; c=relaxed/simple;
	bh=r45KSusXqz881uTsMcj2/0HKdIv145AopWNA1DLEUOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3J8CUltfna2zoDutLfsf1mTNLxeJOP3cVhV2DZ4h4jfA1NqxUuyg8/AfrynROR7ds0juVMSTBfgXOpd/MN1JrxoUjWjsY4BEy8I/Jqaatelg9pGXVng5Cgw6iSZio72tXkI2yfZ5HMJl8C3YOE2vcpNJGp0nP9+a5f7nkBsx98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 07AE010DF8;
	Thu, 15 Oct 2026 22:26:16 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id D29636295735; Thu, 15 Oct 2026 22:26:15 +0200 (CEST)
Date: Thu, 15 Oct 2026 22:26:15 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Aditya Garg <aditya.garg@linux.dev>
Cc: vasilij.kernel@tototo.si, Aun-Ali Zaidi <admin@kodeit.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Kerem Karabay <kekrby@gmail.com>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Subject: Re: [PATCH v2] drm/appletbdrm: Add suspend and resume support
Message-ID: <atE25_ZrIQct41wt@wunner.de>
References: <586d0b39-40c8-4f3d-a786-c1085f87b858@linux.dev>
 <E1AEF567-3705-4AE7-B409-6E6D70C505AC@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1AEF567-3705-4AE7-B409-6E6D70C505AC@linux.dev>

On Wed, Oct 07, 2026 at 07:50:38PM +0530, Aditya Garg wrote:
> > On 4 Oct 2026, at 5:36???PM, Aditya Garg <aditya.garg@linux.dev> wrote:
> > The driver has no USB power management callbacks, so the USB core
> > unbinds it before system suspend and binds it again on resume. The DRM
> > device is unregistered and registered again on every suspend and resume
> > cycle, userspace driving the Touch Bar through it (such as tiny-dfr)
> > loses its device, and the Touch Bar stays dark after resume.
> > 
> > Implement suspend and resume with drm_mode_config_helper_suspend() and
> > drm_mode_config_helper_resume(), so the device stays registered and the
> > last committed state is restored on resume. If the device was reset
> > while suspended, repeat the probe-time handshake first.
[...]
> Could anyone please merge it if they are ok with it? Thanks.

I'd love to, but both v1 and v2 have sashiko findings that nobody bothered
to debunk or fix.  (The fix for v1 consisted of removing a callback, which
triggered other sashiko findings.)  I'm neither an expert on this driver
nor the tiny drm library, but I'd like to help improve Linux Mac support.
Please help me understand whether the sashiko findings are valid.

Thanks,

Lukas
