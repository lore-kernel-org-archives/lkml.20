Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9168E4A6893
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106694; cv=pass; b=YuSHL+sl2JUuwVduwwW0oPIKTpSZuhDRUpu7ZsJZ9TOBikoA6j56t0jGFmcCtmmBRwqlTdS78Xh1RqCpLdbNVKE02cDrQKY9ynt89GYYHQHzIn5yNKLFN9UkM8oRTXKearLyRICY/QDwEgCNkhlyXEobudH+Oyf/fWDHzABwYck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106694; c=relaxed/simple;
	bh=u13I/wZIktRa/O/P3H7L1x/3edUp/ANtYo7JPEP4TmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6qh0UgWSVcyrYQMWaex3M8wQRn5xCHK/X0+dzQ9rBoRgpREVoLJQGxl2TfK8mMctzfeBCYCs8Ku9YtO9U4UjwIqaBK/kVFxb/RevF5K5dN7DTGB5YjH/9GmataXpImMYSx6Glu+xKMyMDinA3zcMpV/hVrxwWAYKeebb1ieQ5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=g4cwaddM; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="g4cwaddM"
ARC-Seal: i=1; a=rsa-sha256; t=1790106651; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C6UMJ0g70qPdjXQYBY5vGSIsnl7uJv9ZAUkIkKTyqLLm6mel3h5ve5zQW/QfWpg7GNdSL7svjBfgVSZ9cxg//mkj5I6EAV4m80Su+Xx9gkuLOh1k1s1dIPGmo/vSB0XpiwwCA/0+6VizdzCN9AKA5nlh20pc14XFQxYn0YgJIfs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790106651; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7kRrFNaa0VL0AJwl+dtEwA1iZbYUSRM7gtSXJLbDmIQ=; 
	b=TgfUuJwpNpqvbspXB2VirQF1L4fMvc9TnSkmmpiXuEFvwICXpL61EGXTzjw0n9bUQ0Eb37x81sXfnJoH4PYKZ/eSJ1DUAkOz5sUTNFv+CE//EHm1e/HSwwasp0/rjjG8sMd9VPaCXTRptoENKYvg/euxfHz/9loCc9LKQ5FhDFM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790106651;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=7kRrFNaa0VL0AJwl+dtEwA1iZbYUSRM7gtSXJLbDmIQ=;
	b=g4cwaddMGLisPIAM7kq3MqaH5Ygsxr3jnuGNsRnMeErReTpde9xMO2fEafEGbJ5m
	dIJxgjtTaRvCkPYdhR1v4XRLyqD0xyNSWdRhV9gQi905c+HCL2EMu91tDDYlozTzM46
	NtvLs9DDsaewQYxmfzF7l7CR43ifDXqp6967jwOs=
Received: by smtp.zohomail.com with SMTPS id 1790106650436526.1793456892476;
	Tue, 22 Sep 2026 12:50:50 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:50:44 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Faith Ekstrand <faith.ekstrand@collabora.com>, 
	"Marty E. Plummer" <hanetzer@startmail.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
	Eric Anholt <eric@anholt.net>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Collabora Kernel Team <kernel@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 05/16] drm/panfrost: Consolidate device clock
 management and reset
Message-ID: <arGH9jPcHhDqZSIH@sobremesa>
References: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
 <20260912-claude-fixes-v9-5-e588feaa61ef@collabora.com>
 <20260914104500.6e32c6cd@fedora-21.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914104500.6e32c6cd@fedora-21.home>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.95.26

On 14.09.2026 10:45, Boris Brezillon wrote:
> On Sat, 12 Sep 2026 00:28:06 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> 
> > Gather all clock enables and disables into a single function to avoid
> > repetitions between driver init/fini and device resume/suspend, since
> > these clocks are always handled in bulk.
> > 
> > Also do clk (un)prepares and dis/enables at the same time, since the
> > clk_prepare_* family of functions can simply increase the refcnt of
> > an already prepared clock.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Two nits below.
> 
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_device.c | 118 +++++++++++++----------------
> >  1 file changed, 52 insertions(+), 66 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> > index b3a53504bd01..2fcbd223204c 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> > @@ -34,10 +34,46 @@ static void panfrost_reset_fini(struct panfrost_device *pfdev)
> >  	reset_control_assert(pfdev->rstc);
> >  }
> >  
> > -static int panfrost_clk_init(struct panfrost_device *pfdev)
> > +static int panfrost_clk_enable(struct panfrost_device *pfdev, bool enable_ace_clock)
> 
> I don't want to have a flag added for each new clock we decide to keep
> enabled on RPM suspend, so how about s/enable_ace_clock/on_resume/?
> Also, since it's enabling more than one clk, I'd go
> s/panfrost_clk_enable/panfrost_clks_enable/.

I agree with you. I was thinking if new clocks also had different needs in the future,
maybe we could pass an array of option clocks but at this point it's pure make-believe.

> >  {
> >  	int err;
> > +
> > +	err = clk_prepare_enable(pfdev->clock);
> > +	if (err)
> > +		return err;
> > +
> > +	err = clk_prepare_enable(pfdev->bus_clock);
> > +	if (err)
> > +		goto disable_clock;
> > +
> > +	if (enable_ace_clock) {
> > +		err = clk_prepare_enable(pfdev->bus_ace_clock);
> > +		if (err)
> > +			goto disable_bus_clock;
> > +	}
> > +
> > +	return 0;
> > +
> > +disable_bus_clock:
> > +	clk_disable_unprepare(pfdev->bus_clock);
> > +disable_clock:
> > +	clk_disable_unprepare(pfdev->clock);
> > +
> > +	return err;
> > +}
> > +
> > +static void panfrost_clk_disable(struct panfrost_device *pfdev, bool disable_ace_clock)
> 
> Similarly, I'd go s/disable_ace_clock/on_suspend/ and
> s/panfrost_clk_disable/panfrost_clks_disable/.

Noted.

Adrian Larumbe
