Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EFD3DDDD9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363820; cv=pass; b=PdyqIDXTzo5MrA+NOWqplGXXX8n2jH+0liYVJ2X14L/Gl/9vSUEsgBwnT4tdOz67A2wG4gg5Yue+uvch1kuSyxGAtSwXcu9Kr9jYWU0kdGYgDFpiD1ebURZh1Y/dhmkySl1nLJiAKpC1QkpSbWM5Nbg8aMGrj79W3QQ18iUr4e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363820; c=relaxed/simple;
	bh=IYWIL1PFKzXT2KfvIdWSt702A4hyZEBAhQKET+oVrfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uupnIAXw3Z6JTpvV9fhGKug7Zwfo8McHxmFSTNtkcaw1BwWrpepkeu75dD/R7urjlWoiwPh2VAO3oRdJTY0uS8sJ+GWEk04ugNz3MLFBiVxopSnvgcXMlIQSDgq4q7k4/vt/i+hodaX5JDHmry3SxftP7gVOBLi/YIZmH0g2v6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=CaVVrtb4; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="CaVVrtb4"
ARC-Seal: i=1; a=rsa-sha256; t=1788363780; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mhY+Byip9E6ub3/2RISN6a4JsxdL5kXw3uZ5IwjI+I89U849LZE4onJNwi5fTGOXhdeDf4dyi+UXN3qxWGRKJ09vCoP/tRrCdaD1YQuvJXzuymZ+/Kq7+V1XvPqAVZohhAa9WgN4snPRc37qr6Yglr7n5VoosLse5BWcC/z/ORI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788363780; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wPkVNY6HgR4EPSBYmFwbo6fY/dHsnL8uz2ZRlRYszDA=; 
	b=jOU9DL6W4rN13Ip0B2h84iIbs+z9GVrL/X5GY60L5v/RCpUj8JsuF2qOgXVj25gBvoMxYkoICIQ4eBhHokG5/fcsyD7GobdJu3xuaZWmjNcNqzAXqLK4mP/fnfOMpal1/x6Sz8Edu8syBC2l3vl0+7QQii0tWQ8F/ACjHC4w0gc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788363780;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=wPkVNY6HgR4EPSBYmFwbo6fY/dHsnL8uz2ZRlRYszDA=;
	b=CaVVrtb4VS8WYT0rxLcoar38w1ysf+FSD30rorVya3zOZhQxXo51CuN1mOI4MPJc
	i74o08aBsjAMc/FkIpO/ca9E72YuVHH/yFIPdT38SYjsTTKpemr9uxoxDVtloOlRKzD
	zWbBprs/Yq1YwqUEG1vukBAq3nvJTQe0CbKM2o5I=
Received: by mx.zohomail.com with SMTPS id 1788363778748606.1071272860789;
	Wed, 2 Sep 2026 08:42:58 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:42:53 +0100
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
Subject: Re: [PATCH v7 11/17] drm/panfrost: Add debugfs knob for manually
 triggering a GPU reset
Message-ID: <aphD4_tNK6w9yc9j@sobremesa>
References: <20260828-claude-fixes-v7-0-72a13b2c125d@collabora.com>
 <20260828-claude-fixes-v7-11-72a13b2c125d@collabora.com>
 <20260901152726.280f57e0@fedora-21.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260901152726.280f57e0@fedora-21.home>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.352.18

On 01.09.2026 15:27, Boris Brezillon wrote:
> On Fri, 28 Aug 2026 21:56:51 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> 
> > This will be of great help when testing potential races between the GPU
> > reset sequence and other parts of the code accessing HW registers.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_device.c | 35 ++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> > index d8acae9b8cfa..b6a48ae0d3a6 100644
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
> > @@ -600,9 +601,43 @@ EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) = {
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
> > +
> > +	if (pm_runtime_get_if_in_use(pfdev->base.dev)) {
> 
> Are you sure it's not pm_runtime_get_if_active() we want here? If use
> the _if_in_use() variant and autosuspend is enabled, we might skip a
> reset on a device that's active.

Do you mean if a driver has brought the RPM count down to 0 and scheduled a deferred suspend?
Couldn't manually triggering a reset then somehow race with whatever is being done in
panfrost_device_runtime_suspend() ?

> > +		panfrost_device_schedule_reset(pfdev);
> > +		flush_work(&pfdev->reset.work);
> > +		pm_runtime_put(pfdev->base.dev);
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
> >  	panfrost_gems_debugfs_init(minor);
> >  	panfrost_sched_debugfs_init(minor);
> > +	panfrost_reset_debugfs_init(minor);
> >  }
> >  #endif // CONFIG_DEBUG_FS
> > 

Adrian Larumbe
