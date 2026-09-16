Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05234D37AF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579524; cv=none; b=uq7MBmIaJc6nyCV/lT3KMw0fviI17rWfCavuXkFQB+wMc9gQoIaHMwqSG/q+e77X/fvUtV/mb1IdCYdZEDMIsuX0RVHiFS+b/leZPMnQeQPePNqOZ5UxP6R1KDXvTUqG+ZlikXEwS4rpztxqYzmqZ38PR5dGHQ/KSOp3u5tnB3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579524; c=relaxed/simple;
	bh=N0dwrfbAu5lRiynAfBFgVRuoA3ftUnrQ8/dmHP6ifA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9KHEDaEZ5fK3vbRa9HPOMzOMqxHCNkKflcbEHtkkC0rb6J2lyGQGcXXJJ0GYP2IrGN0JELfS7GgMtyc6K/OL22/x3+t+yPLh6Y+s58W6QVk7wZYUFHDiCo2GCzK2Fz7ZIWGMDuSpRyqDDPgPXwRBwUpDIzhZAig7pOftuSm5p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPC4oS4P; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPC4oS4P"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so8840005e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789579521; x=1790184321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0doTaXzV/w8IQT4ZiZuatHsziHZ5r643yvXjLE62Mno=;
        b=gPC4oS4PR+mBhwijtsdNXgSPkIk6jBh1BajVko5xTe+W9JQvRNhDRO1aIJu1bXqnw1
         3Gpf9PFxp2Kz16Uc/sNB+8LLe4wChvUtSHK47qJuV9eq6l86K+j2G1eSm3vPRfcyJRgj
         9K/Ng4/sidvGWBKeQD3kz0wnn9JaUSPgBQXj30tUAg87jBKlAfWFoCSNFlhTfmH0vvGv
         n+EoG6lafFqOdDKRvKA7Fp0Ya/v49phR8/fN/VObDI9ewYBd1884VT+XrkLR80dN9+jk
         K0JVyIDXNQDCflcOml4Cc+3kQ0mOVFXZV4bOE4rWcq2x5L/OqVMz9vwWsnqmcJvQVfKx
         7Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789579521; x=1790184321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0doTaXzV/w8IQT4ZiZuatHsziHZ5r643yvXjLE62Mno=;
        b=vyAec7XhanRi6lAXiDSRMZHGuo16BtfKQUNo5NdO+SeWeDB6/kk8lzdsj0HcUdibAz
         XeDtdp+Ye0KYNfLWPrcQBQzCvms+uKRJKoiF598j4u+tn2cGr7woXFKVwEFWLMTb4cXV
         RPlBX5po40orBZ7c/WUR/kGANs4JY1Zo6wss5IIqZYRNs6wEY49b3rD9lmpSkyAs3Ole
         gqGvFwWa9LYvMEUlfiKTcYwxe7f79F/CJj+EU5TFlzHxmaXkoyhhahozgC98+nqB7fhf
         wkEHzMffKrKa2qi9J+pH+M+H3C6ZFprX6CyW9k4srg5D5jGY16FANMaVQiwIatbKsmbt
         Xczw==
X-Forwarded-Encrypted: i=1; AKwUvBzzDUnoZD7LVDTT+DA9xZFP+FcPBosUn04hHzxNbHVp1XERb+chJhAVORsSt/h5oW2DedSvgt6LtLsG1v8=@vger.kernel.org
X-Gm-Message-State: AFuF++kyoZeANbk/3TmVIV3H93aSAIL2bPVqcnMC+Xefl5oxBiLvkJv0
	BCOj9QHh78TqGNKJqK2uYvxr0w2ezADly3eNcX12YZXCsyvberK67ECx
X-Gm-Gg: AYBFou3u5z7g1niEbizQkxqqn7i+fvVA0VkWvprOLellmP7AmNZFZwJE5eZZ5z9Q3r6
	S57eTEy37A4+g0vk9D6R+nGPBTIhzCzoDWBUrjVWL2wu62b+gxiAY6TeVHIn3BgJToynzzIzYrJ
	peXP3IcQnOWl8QS/7vgjKcerlfdXK/nBHnVSj1PXZnMk+q5MuvJzUgUyqVat3nGb4AhXhsywrKz
	pNzuUUjey5VLgtK0zhKoNFr0A3oL2Q9/NoNCXT8fVTHoQzmWE/PZMgJh1/NAgO9DX7v5+jpd3HW
	ST0qfh2GL5VMlrgFsM5kymKYFLvkH8Nw7kOX93DlEV9bMWnYZP+u8Hp0jkRIHzYsUWMPLgMz855
	lveKN9DECJ0NYtwlXDEdi9qYBpVuFB29CENJ25ddzos3U99XY0wE8L/VshkDmk+On2YNpXQJ3AA
	xSL7YZhWCd4P/KmymbAVMpRMRVaEULXizKFo0PtQZ9l0gRw++E+JKlt51kL9qlwW6q2rvS9mnuL
	WZDDRzPAnP954Sc5zwW3bIR+Kvm4c7P
X-Received: by 2002:a05:600c:1d0d:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49eb72f3835mr41594715e9.9.1789579520496;
        Wed, 16 Sep 2026 10:25:20 -0700 (PDT)
Received: from osama ([156.223.29.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fe7esm8546312f8f.6.2026.09.16.10.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:25:19 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:25:16 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] drm/panel: simple: Use managed helpers in
 panel-simple
Message-ID: <aqrQ_BDn67QXG94p@osama>
References: <20260915145935.60397-1-osama.abdelkader@gmail.com>
 <20260915145935.60397-5-osama.abdelkader@gmail.com>
 <DLGKRRWANR4E.1AG4LI99DCJ2F@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLGKRRWANR4E.1AG4LI99DCJ2F@bootlin.com>

Hello Luca,

Thanks for the reply.

On Wed, Sep 16, 2026 at 09:50:35AM +0200, Luca Ceresoli wrote:
> Hello Osama,
> 
> On Tue Sep 15, 2026 at 4:59 PM CEST, Osama Abdelkader wrote:
> > Use the managed panel add helper in panel-simple and drop the manual
> > panel remove call from the remove path.
> >
> > Keep the MIPI DSI attach and detach manual, since panel-simple's
> > remove callback also unprepares/disables the panel and releases the
> > DDC adapter; deferring the detach to devm would run it after that
> > cleanup instead of before, changing the teardown order.
> >
> > Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> 
> Thanks for continuing the cleanup.
> 
> However there is still some confusion in how you are sending patch series:
> 
>  * You sent the patches to various recipients including mailing lists
>    (which is OK), but did not send the cover letter to mailing lists. I got
>    the cover and it only has me in To: and nobody in Cc:.
> 

I see, I used:
git send-email --to-cmd='scripts/get_maintainer.pl --no-rolestats' --to=luca.ceresoli@bootlin.com v6-000*
get_maintainer.pl doesn't return maintainer for the cover letter.
Thanks for the notice, will fix that.

>  * You sent two iterations the same day without an explanation; this is
>    normally a confusing behaviour, which makes sense only rarely and for a
>    very good reason which is clearly explained in reply to the previous
>    revision (e.g. "sorry, this series is broken, ignore it, sending a fixed
>    one very soon")
>

Sorry for the confusion, once I sent v5 sashiko-bot caught couple of issues
including compile errors, that's why I was in rush to fix that.

>  * The panel-simple patch disappeared in v6, why? (see next question)
>

There was a concern from sashiko-bot on v5 that the devm_ changes in panel-simple
may lead to use-after-free window, that's why I excluded patch 4 in v6.
I have to write that in changelog, yes.

>  * The Changelog for v6 (not visible on mailing lists) is overly verbose,
>    so I didn't even try reading it. Please use oneliners or so. And in case
>    you did, don't uncritically copy-paste AI slop. Think about your readers
>    and te minimum info they need.

I see, I took sashiko report copy/paste. It's too verbose, will clean it up
and summarize it in next version.

> 
> I think I already suggested using b4 to send your patches, which would
> handle the mechanical aspects for you. It prevent issues like the first
> bullet above.

I will try it, I just didn't use it before and didn't want to make something
wrong so tried to stick to git send-email.

> 
> Can you please send a v7 with the above fixed, as well as the changelog
> made concise (including the v5 and v6 entries)? I'll be glad to review
> that.
>

Sure, thanks.
 
> Kind regards,
> Luca
>

Kind regards,
Osama
 
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 15 ++++-----------
> >  1 file changed, 4 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index c95964ba25a9..02d21dde5766 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -737,7 +737,9 @@ static struct panel_simple *panel_simple_probe(struct device *dev)
> >  		goto disable_pm_runtime;
> >  	}
> >
> > -	drm_panel_add(&panel->base);
> > +	err = devm_drm_panel_add(dev, &panel->base);
> > +	if (err)
> > +		goto disable_pm_runtime;
> >
> >  	return panel;
> >
> > @@ -785,7 +787,6 @@ static void panel_simple_remove(struct device *dev)
> >  {
> >  	struct panel_simple *panel = dev_get_drvdata(dev);
> >
> > -	drm_panel_remove(&panel->base);
> >  	panel_simple_shutdown(dev);
> >
> >  	pm_runtime_dont_use_autosuspend(dev);
> > @@ -6540,7 +6541,6 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
> >  {
> >  	const struct panel_desc_dsi *desc;
> >  	struct panel_simple *panel;
> > -	int err;
> >
> >  	panel = panel_simple_probe(&dsi->dev);
> >  	if (IS_ERR(panel))
> > @@ -6551,14 +6551,7 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
> >  	dsi->format = desc->format;
> >  	dsi->lanes = desc->lanes;
> >
> > -	err = mipi_dsi_attach(dsi);
> > -	if (err) {
> > -		struct panel_simple *panel = mipi_dsi_get_drvdata(dsi);
> > -
> > -		drm_panel_remove(&panel->base);
> > -	}
> > -
> > -	return err;
> > +	return mipi_dsi_attach(dsi);
> >  }
> >
> >  static void panel_simple_dsi_remove(struct mipi_dsi_device *dsi)
> 
> 
> 
> 
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
