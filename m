Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015294A92F3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363750; cv=pass; b=olsdMhakdxwlt2xKLuqYvH/nqAHFcQvKQ/avczWkk48zzjcwRsEzHS5Tmm7mbzPoxAxP4QNSQ+fEi3AtQM//QhlWJiZpLRSzeJ2Tv89Qh/O3oKHounP/xiUa+MyaTTk8CFnri0xd4zvBXkp0BvebD4IEVpvqwtaiXmkyuJxCKY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363750; c=relaxed/simple;
	bh=dKUkyYSlGemiYZjxJlpUqWXDIRLiW1uIMdxPwxiexlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cd/C3P3SsPvTEtvbegmyKZashhPxFPuFYpd75Vf3p973AQKKSm22phJKl2ZG/MPsuL/Od3E4LUay+1JArts/kYbYAqYKBAad98D5dGEBE9GpYMza0ckMHEeMKnyVXITWLoJUeM7p3ESRiuecz83/7Gh8FSXix6NVRZj7BBPGYdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=GgzBWjSj; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="GgzBWjSj"
ARC-Seal: i=1; a=rsa-sha256; t=1788363708; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KKYTpyvzXnKrdt6KvMTEbGbOo4gux76GHpJ6d6KpryVWj3IIBihg7Vet0aTQWvMZdEWeCuRNJzOckZlBQbQ0nRP7mDdraijXn08Cs1pW83IjHdW3064oFAXLsBGUv2jJjJsSYyaijwwaLTMQNwt7ja1XhRVlb3mWOLwMBtmVceg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788363708; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bL1rhEjtVjVACmuqzxzHnLDDgrtS/yEaQZfQmL0QZMU=; 
	b=RllbzE30L8NwMzcBdCXAmkwRskRdMABY+DhU67E6PLrERFhU05rEx3NcR5nvBC9OSTM4ozu+zKLQxgb73FvdebX3UQAoPAP859EF9xGb/abeU7/6WvB8qI23+e4pSdnWgHCdZr65uFfdydPRJ2qVHz44NPhOzKT3+n5a7aZw/y0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788363708;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=bL1rhEjtVjVACmuqzxzHnLDDgrtS/yEaQZfQmL0QZMU=;
	b=GgzBWjSjl2aBmgpYJvfU7VkcQM3dbPtSOP2106t2MU9Leg530c4VpjMd9xlIhaau
	bry3j6gIsVFCkkSVlH5+H+1LZ+tucHtuMJ3L+aVkIr+VXaDIztjTxqAibUl4ihg8smF
	M8DEaRyuYQI7MERTcJQtaka+b+dQh6frkZ5+/9ug=
Received: by mx.zohomail.com with SMTPS id 1788363705301608.302088977019;
	Wed, 2 Sep 2026 08:41:45 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:41:40 +0100
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
Subject: Re: [PATCH v7 08/17] drm/panfrost: Split subsystem init/reset from
 interrupt enablement
Message-ID: <aphDm1vDtk2Pei3i@sobremesa>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
 <20260828-claude-fixes-v7-8-72a13b2c125d@collabora.com>
 <20260901150804.75ce2f47@fedora-21.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901150804.75ce2f47@fedora-21.home>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.352.18

On 01.09.2026 15:08, Boris Brezillon wrote:
> On Fri, 28 Aug 2026 21:56:48 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> 
> > Because MMU interrupts are only enabled when the device is reset, it
> > happened that after DRM device registration, the very first job targeting
> > the tiler heap BO would always time out. The reason is the reset sequence
> > is only part of PM runtime resume, which is not called explicitly at driver
> > probe time, and an actual reset work item manually triggered after a HW
> > error.
> > 
> > I have attempted a somewhat drastic solution, which is completely
> > decoupling GPU/MMU/JM subsystem initialisation and reset from interrupt
> > enablement, so that we can handle IRQ toggling a bit more flexibly.
> > 
> > To this end:
> > - Ensure every subsystem with its own IRQ has an 'enable interrupts'
> > method, and that it doesn't enable them anywhere else.
> > - Force IRQ masking at MMU reset time. Up until, now, panfrost_mmu_reset()
> > was clearing the MMU IRQ suspension bit, but at no point that is set during
> > the reset sequence.
> > 
> > Then manually enable all interrupts when the device is fully initialised at
> > probe time, right before DRM device registration, or after the reset
> > sequence is complete. Also disable all interrupts at device remove time,
> > so that their IRQs can be sync'ed right before tearing the device down.
> > 
> > Fixes: 635430797d3f ("drm/panfrost: Rework runtime PM initialization")
> > Fixes: 876b15d2c88d ("drm/panfrost: Fix module unload")
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_device.c | 40 ++++++++++++++++++++++--------
> >  drivers/gpu/drm/panfrost/panfrost_device.h |  3 ++-
> >  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 19 ++++++++------
> >  drivers/gpu/drm/panfrost/panfrost_gpu.h    |  2 ++
> >  drivers/gpu/drm/panfrost/panfrost_job.c    |  7 +++---
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c    |  9 +++++--
> >  drivers/gpu/drm/panfrost/panfrost_mmu.h    |  2 ++
> >  7 files changed, 56 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> > index 9e02fb5f73c8..99f7da2180f9 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> > @@ -226,6 +226,27 @@ static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
> >  	return err;
> >  }
> >  
> > +void panfrost_device_enable_int(struct panfrost_device *pfdev)
> > +{
> > +	panfrost_gpu_enable_interrupts(pfdev);
> > +	panfrost_mmu_enable_interrupts(pfdev);
> > +	panfrost_jm_enable_interrupts(pfdev);
> > +}
> > +
> > +static void panfrost_device_enable_hw(struct panfrost_device *pfdev)
> > +{
> > +	panfrost_device_enable_int(pfdev);
> > +	panfrost_devfreq_resume(pfdev);
> > +}
> > +
> > +static void panfrost_device_disable_hw(struct panfrost_device *pfdev)
> > +{
> > +	panfrost_devfreq_suspend(pfdev);
> > +	panfrost_jm_suspend_irq(pfdev);
> > +	panfrost_mmu_suspend_irq(pfdev);
> > +	panfrost_gpu_suspend_irq(pfdev);
> 
> Hm, I think I'd prefer if those suspend/resume_irq() were hidden in
> some subcomponent panfrost_<subcomp>_suspend,resume() helpers. And
> then we just have to resume/suspend component in the right order
> instead of treating IRQs as a standalone object (enabling/disabling
> only makes sense if the subcomponent handling those interrupts is
> resumed/suspended).

I thought it would only make sense to enable interupts for a given subsystem
when all the other subsystems are also resumed or initialised. This was prompted
by Sashiko warning of the possibility of spurious interrupts causing a handler
to be run when one of the subsystems it touches on hasn't yet been initialised.

Adrian Larumbe
