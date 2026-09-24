Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB62A3B8950
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236331; cv=none; b=Te3aZQfs+8MHZeiqZ+OCY0s/QU45yPjN5i6jF/SxaragJQ5ouJqkVCTEqikMCsEZxCvx5WkOEJOmcpOMiPOCei2qjMNDj4pw6OpokwxLDWNI0uHrD7wZhpq7IcvkcYuGR45TVsqUH1emY6+vvBwWWtNfp8mHQLL7tERfIp4W0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236331; c=relaxed/simple;
	bh=Q2w6LF4/zIJhMqgnul1q5Ke3T8Fce4xJ7qGlNUdJ/6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7jvHTLPl/px/aF1WgK01P+GTlin2QdbWbuyooD1KJGP7NGcRbIFpNJlP0ePNvms0FSPIzwvMp6kC0pEIwLkl2XdY3NcOlJ+QzzOK7SRL035zzA6onAGtOf6XKklLbYTfQbzZ4mDWPijJWNFQaDq7wcR1PTAiwUEXhjXRD6jJZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ptqlc8kx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ptqlc8kx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E381F00899
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790236329;
	bh=flhXc27wZ7lq+96q79C1lo9pyNK1W5OvD7SOTlgsYQY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ptqlc8kxRS/O4MemHmjZ01Ds3sA61fs3CTI+JusAagmLQsN1Akqn2+RqNvZW8Uu1B
	 fkVtGl19o2GvoAfTGg+wN4khUgWOJ9FZX6ktZ8KPNQnifbt782gXCEup9k83OVKU2t
	 EPotrLbjrIE8X+v32os82VcQO6ZZF9OCqIB3J9O376A1cE7zOP/KVOHPHmH04n7+6z
	 tdkyUv/Up2f/Iz9O8fAfZSk8Nri0naYfsAwGJoOlvBHaXT1tsMl7JNC0kw9wS2Iska
	 V2pq+RIOw9lvDpy2GpXUcGS99+p1HdKg7KmPutL/KHb/YUGMP+2Bo5mPAMtHNBa5Oe
	 8VnDmcBpmgBvw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so1708391e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz27Po8Ri4FV1RVeY43cpUa8aU3gjnS9+YFAqKTu0nRnrb3/+xCqYXkaVB2/shnGPwBDMxpp7C0qg53cao=@vger.kernel.org
X-Gm-Message-State: AFuF++nR+EnznAIzVfffhLCTWjqBwrnj2azYQemvCHVsalnDGEvoeW0M
	IU+Lt1LTgP3ymduzuROHmMlgqSTwjKtMbtfk2y/vBST9JT+JzK3c50Y//jPZi7AFI1olyUxxmUe
	xgr8CJJdnTEDUhQMJEaQstNSaLccZzvg=
X-Received: by 2002:a05:6512:6c8:b0:5b8:b419:b7b with SMTP id
 2adb3069b0e04-5b8e0a18d1cmr355916e87.49.1790236328001; Thu, 24 Sep 2026
 00:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
 <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
 <arInho2bsfJiCgjV@houat> <DLNCQEG62F5N.O98WAO4U2FJO@bootlin.com>
In-Reply-To: <DLNCQEG62F5N.O98WAO4U2FJO@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 09:51:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLkk-a0MrQUiaDD8OoDDoYVwBwSjFTj5ZBy=Xo7MS4+01g@mail.gmail.com>
X-Gm-Features: AclHuK8rPixm6Txa-uGEDmLc8FjUZWkrHeBO_IgguNN-8bSfUZSDFWgY_JslL90
Message-ID: <CAD++jLkk-a0MrQUiaDD8OoDDoYVwBwSjFTj5ZBy=Xo7MS4+01g@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] drm/mcde: dsi: don't create a panel_bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Paul Kocialkowski <paulk@sys-base.io>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Albert Esteve <aesteve@redhat.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

sorry for my slowness!

On Thu, Sep 24, 2026 at 9:01=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
> On Tue Sep 22, 2026 at 9:09 AM CEST, Maxime Ripard wrote:

> >> -    } else if (bridge) {
> >> +    if (!bridge) {
> >> +            dev_err(dev, "no bridge\n");
> >> +            return -ENODEV;
> >> +    } else if (!drm_bridge_is_panel(bridge)) {
> >>              /* TODO: AV8100 HDMI encoder goes here for example */
> >>              dev_info(dev, "connected to non-panel bridge (unsupported=
)\n");
> >>              return -ENODEV;
> >
> > I wonder if we still need that branch. Every panel is a bridge now, and
> > it looks like we don't have any specific panel handling in this driver,
> > so I guess it supports bridges already?
> >
> > Linus, do you know why this condition was here in the first place?
>
> I had the same thought while writing the patch, but I chose to be
> conservative.
>
> Linus, unless you have more info I'm going to apply the patch as
> is. Removing this special case would be welcome as a later patch.

I'd say go ahead as-is.

I do have the idea to code up and submit the AV8100 encoder
and I have the hardware to test it, but every other user should
be using panels directly, and I would be the only non-panel
user so I can deal with it when it comes up.

Yours,
Linus Walleij
