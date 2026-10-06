Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06A326E71E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247885; cv=pass; b=YnaNFWrqGNkHSxJXqOXgekpDMeX7lESbtIndHSFlokDK9jdSu4SIW0c9k2+vsdxagu0wYrrvdVVVwzsRDF5iEPFq5MGGT1RSKaJc+n9Kl+BU/94M2/HksF4KDD8SWKxitni9ZwMnrqikaXB3EwV2vQ7r1q18QwyoeVl5GkQklWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247885; c=relaxed/simple;
	bh=n1KJjRw87lG1pDc10+5L7QJjt3rvVLAj/Fx8iESoCDA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=UMstzn1qDyLocUiHRvfw/z8P4NuL2AZHotGgmCCt/xv9lNodyJjiIG6KBKDGeT7T6M8CBBdFAt6XFP1GP96YZOugd+Tw/KEZ4759GmjudFsCmJ+DwPz5H5khngstfNPp1XdMHdPmvMLbwaLw5JN5Of8v8Sd3WzPwdg1q4c3+SFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=R7MKzo8w; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="R7MKzo8w"
ARC-Seal: i=1; a=rsa-sha256; t=1791247843; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DUfs9VhUulxGNrli5hvMdWtiUVQGoeS0jMvqNoz2Xhe+SryXlPnO40uT8LqpZ5kIUiO5AkxOJLddGe/dnVBO2b+7twtJIcrSfBUqc33SoFaRcBJflry6ZLKhNVh9zbb83aPtoA5psvhIhh01f99cVBWnV20p06ZgdMyKOo1LrxE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791247843; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v6NslssOJv8k7P+fxyeLKDx9iI1Cxv9dxkN6Y+YwHDE=; 
	b=Fx4ndkX+rJVEXBv/eU2X9cZPMyfjzNOpkYuaIzXiL+ok38jQ9+r4Tk4VdW9hmqOBNkGpxHKXEE8tAZmxB/aV1xXE7sN7LsqrO2oMu0e2nKfZMmHcTwHAtugfJkR1Bl5IopgfNfaoX444oIBhZzsKHn0fowhl8GVSjmvWTg6DX2I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791247843;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Date:Date:Message-Id:Message-Id:Reply-To;
	bh=v6NslssOJv8k7P+fxyeLKDx9iI1Cxv9dxkN6Y+YwHDE=;
	b=R7MKzo8wGdk5hL9HYsM/YzYJKLKefrrGo08Dv+fwKMp0T/+HIQxH0xBBtyWu5X3D
	cUj6UcqUkDKXwBEG/pLZUcxIY+JUAJ1X0DyAiVcj0uO2ZC+RWcs1L+p7Dbm6LOooZhM
	/TGTc0hZ7GlSabS+lIjz2TVkYxhk0RjLFY3A4qRI=
Received: by smtp.zohomail.com with SMTPS id 1791247842722359.9365337907491;
	Mon, 5 Oct 2026 17:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v12 03/15] drm/panfrost: Move debugfs initialisation to
 relevant subsystems
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <0d1ce769-3371-44c5-a6d9-e9a27d9e7cee@arm.com>
References: <20260929-claude-fixes-v12-0-62beb08de207@collabora.com>
 <20260929-claude-fixes-v12-3-62beb08de207@collabora.com>
 <0d1ce769-3371-44c5-a6d9-e9a27d9e7cee@arm.com>
Date: Tue, 06 Oct 2026 01:50:36 +0100
Message-Id: <179124783676.1018806.9234646464163859519.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2318;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=n1KJjRw87lG1pDc10+5L7QJjt3rvVLAj/Fx8iESoCDA=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqxEXcYajdbpd7dU0NPiyy/pUNJgtLHckn7+aia
 3MVQjXmg7mJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCasRF3AAKCRAOJn5M7lND
 PdCQC/9MYYWMBekLUwR5bh+h/dntrDLNAK5x2BVyJr+JX81ab1ER6lqflNYBK10bhcNE9l9W82o
 95zPxeibQiveYHcqHgtmiJYW6ghMa2mkhotcQWCKY33IVJ6V/tAqLxs3yJuuehSAG9wAXYhdiv6
 9LNdPJupaZwhDQvLmDFJJsG1ARLlE4xB1Ejn9k8kZeK9CzVeIHjrSyKkmZLVNU/F/FupvObl5ri
 JRWVBzDLhxc5bfK0tQOHG2mcQi5GmdUqm3O4AVzgHtPklNIyHq4NVakoAGca04kM642JLSRWiHU
 iQA3SvmwawaUkebhxgZnjIJ3yDS/HCXIu/ISVncf68O0Db/YDKn28nmcafJP6mZ7FkxXjylXS+Z
 dUloGaCB5N1ezehuGlEILuMKygbN1JgyuFY4B9cc7pjj4O7Ln+Oge+AfKxA9rhrdjmSD8Y5G61M
 Gxbm/8Wf+eNgn8pgOPs5kpJl0qGvcygB9Kii5MJiXexHyrnK3Pf9u9BY5u3b6NJfdLp4w=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

On 2026-10-02 15:10:07+01:00, Steven Price wrote:
> On 29/09/2026 04:44, Adrián Larumbe wrote:
> 
> > Because debugfs knobs are a device interface, and also the different knobs
> > deal with specific subsystems, it's best to move their initialisations away
> > from panfrost_drv.c and into the subsystem they provide information about.
> > 
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_device.c |   8 ++
> >  drivers/gpu/drm/panfrost/panfrost_device.h |   4 +
> >  drivers/gpu/drm/panfrost/panfrost_drv.c    | 129 +----------------------------
> >  drivers/gpu/drm/panfrost/panfrost_gem.c    |  29 ++++++-
> >  drivers/gpu/drm/panfrost/panfrost_gem.h    |   3 +-
> >  drivers/gpu/drm/panfrost/panfrost_job.c    |  99 ++++++++++++++++++++++
> >  drivers/gpu/drm/panfrost/panfrost_job.h    |   4 +
> >  7 files changed, 144 insertions(+), 132 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> > index c1a2e93a2b9b..5bf528f41278 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> > @@ -561,3 +561,11 @@ EXPORT_GPL_DEV_PM_OPS(panfrost_pm_ops) = {
> >  	RUNTIME_PM_OPS(panfrost_device_runtime_suspend, panfrost_device_runtime_resume, NULL)
> >  	SYSTEM_SLEEP_PM_OPS(panfrost_device_suspend, panfrost_device_resume)
> >  };
> > +
> > +#ifdef CONFIG_DEBUG_FS
> > +void panfrost_device_debugfs_init(struct drm_minor *minor)
> > +{
> > +	panfrost_gem_debugfs_init(minor);
> > +	panfrost_sched_debugfs_init(minor);
> > +}
> > +#endif // CONFIG_DEBUG_FS
> 
> NIT: I'd usually try to avoid #ifdefs like this by making the header
> files define a no-op dummy inline function when !CONFIG_DEBUG_FS. It
> saves polluting the code with a potentially large number of #ifdefs.
> 
> But I have to admit this isn't too bad and a definite improvement, so
> it's up to you - either way:
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Thanks,
> Steve

I see most libraries doing this and agree it would help at removing some clutter.
However, I think I'd rather take care of this in a future patch series.
