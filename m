Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEBC4A68B9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106895; cv=pass; b=ZvBq7lbaApQcoRDaCQGKRGQ8Cdzrm3DM7LocMy7afywO3UkVMNAgK/xfykvGgHDnO3EIQi93oCYI0KO2l7k3gdUfthFDf8jYMj+MFdutDplfeKyh4c6dSTLU7dw6mpHMQmIh96WjWjBn8LYmIJo0uNNvq8PPcE5jy437yQ7NmKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106895; c=relaxed/simple;
	bh=Cdv89Twl8blNr3fuDR7I+JIT7YNehcpphBmyHK+Kj+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxR17utqwEQeh/VZTLliiYOJx2ugdXCRNT9SMvfkKGkYWHFV1pYWo0b6tdn3WWkBOxz1H0xfFoeujCN68V+3GW7TbLM4dcOegUyO2lXHmR61DY2Jo+XNKcvme9+CAlxE56AEkgFqLqrdYG+sqis52n/5WjYvqJ5hggQaQz+hD4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=W4wB5KM4; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="W4wB5KM4"
ARC-Seal: i=1; a=rsa-sha256; t=1790106857; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bRlVRgLElU4LD+KV/AQMFcs6jqQrJTa2VzH20wPRSqdobAbXx7wmu4y1hXXEEglS2AoWLXRrbjcMJvMld9N6Z24k2tzUl6WRxPXhiEcWJ4oNggFDIPap84yFsuwcB7ePzX/TBBr9fmr01ELmRuB86EM6ZU3FWlFW4yJeJNCJbI8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790106857; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xA2gQHz1BoPItfLD4XYfLhH14+q7ZvnIkpUMcxp9UW0=; 
	b=nzdD8tkbuIX2HePbMRQXux3rOqUXkPXNRMpMLQKKcuuCdgpedXWk88mTew1VEbrM33VZdw0MVVTPE3TJx5ldoXoPyzDl1nL+FH9q+UBYr06GZT/+9vSjGDLn0pPa1Eex3xPWy870noIN5iF+at33IDACi0YExoCWfoqpC1PbfxU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790106857;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=xA2gQHz1BoPItfLD4XYfLhH14+q7ZvnIkpUMcxp9UW0=;
	b=W4wB5KM4FYFOXzkGCgrfuSAI5ULYmkb8D0ArKmZBayT0p+GEU3iDXyUAsaXZ+3PN
	RTPWav6UqWTO6vlPYvLpjpHkub4k1ODaKI+EQ9UuDWkpzgZNhwP2XEQNIZvRSiq9nCF
	SvKXmGdwJEpwPmI2BYTfMUExHJeoPSsg+uYbs0h4=
Received: by smtp.zohomail.com with SMTPS id 1790106856657676.256698215347;
	Tue, 22 Sep 2026 12:54:16 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:54:11 +0100
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
Subject: Re: [PATCH v9 10/16] drm/panfrost: Add debugfs knob for manually
 triggering a GPU reset
Message-ID: <arGKAk8ZWGOGDWEY@sobremesa>
References: <20260912-claude-fixes-v9-0-e588feaa61ef@collabora.com>
 <20260912-claude-fixes-v9-10-e588feaa61ef@collabora.com>
 <20260914113946.69936104@fedora-21.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914113946.69936104@fedora-21.home>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/290.95.26

On 14.09.2026 11:39, Boris Brezillon wrote:
> On Sat, 12 Sep 2026 00:28:11 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> 
> > This will be of great help when testing potential races between the GPU
> > reset sequence and other parts of the code accessing HW registers.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> One comment below.
> 
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_device.c | 37 ++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> > index d75566a45392..0aee1d87a7ab 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> > @@ -2,6 +2,7 @@
> >  /* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
> >  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> >  
> > +#include <linux/debugfs.h>
> >  #include <linux/clk.h>
> >  #include <linux/reset.h>
> >  #include <linux/platform_device.h>
> > @@ -583,9 +584,45 @@ EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) = {
> >  };
> >  
> >  #ifdef CONFIG_DEBUG_FS
> > +static int reset_get(void *data, u64 *val)
> > +{
> > +	struct panfrost_device *pfdev =
> > +		container_of(data, struct panfrost_device, base);
> > +
> > +	*val = atomic_read(&pfdev->reset.pending);
> > +	return 0;
> > +}
> > +
> > +static int reset_set(void *data, u64 val)
> > +{
> > +	struct panfrost_device *pfdev =
> > +		container_of(data, struct panfrost_device, base);
> > +	int ret = pm_runtime_get_if_active(pfdev->base.dev);
> > +
> > +	if (ret) {
> > +		panfrost_device_schedule_reset(pfdev);
> 
> It feels weird to schedule a reset if the device is suspended, because
> a suspend/resume cycle already acts as a reset. Any particular reason
> you'd want to do that? If not, I'd suggest going for:

That's been my goal all along, for the knob to trigger a reset only when
the device isn't suspended. pm_runtime_get_if_active() docs states that:

"""
Increment the runtime PM usage counter of @dev if its runtime PM status is
%RPM_ACTIVE, in which case it returns 1. If the device is in a different
state, 0 is returned. -EINVAL is returned if runtime PM is disabled for the
device, in which case also the usage_count will remain unmodified.
"""

So (ret != 0) means the device either doesn't support RPM or else it
was in the ACTIVE state. In both cases, that means the device is powered
so we can proceed with the reset. However, I only decrement the usage
counter when kernel RPM is enabled (ret > 1).

> 	if (ret <= 0)
> 		return ret;
> 
> 	panfrost_device_schedule_reset(pfdev);
> 	pm_runtime_put(pfdev->base.dev);
> 	return 0;
> 
> > +		flush_work(&pfdev->reset.work);
> > +		if (ret > 0)
> > +			pm_runtime_put(pfdev->base.dev);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +DEFINE_DEBUGFS_ATTRIBUTE(panfrost_reset_debugfs_fops,
> > +			 reset_get, reset_set,
> > +			 "0x%08llx\n");
> > +
> > +static void panfrost_reset_debugfs_init(struct drm_minor *minor)
> > +{
> > +	debugfs_create_file("reset", 0600, minor->debugfs_root,
> > +			    minor->dev, &panfrost_reset_debugfs_fops);
> > +}
> > +
> >  void panfrost_device_debugfs_init(struct drm_minor *minor)
> >  {
> >  	panfrost_gem_debugfs_init(minor);
> >  	panfrost_sched_debugfs_init(minor);
> > +	panfrost_reset_debugfs_init(minor);
> >  }
> >  #endif // CONFIG_DEBUG_FS
> > 

Adrian Larumbe
