Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE853A0B24
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940341; cv=none; b=D/IXJHaX1zyeQv4q1rY5+XsfBdoV5arw/RNu+GIIflqtm/MNjzJ88GFw4chrPsMVEWst3h8XebIwgXtQYs98cgcstX8ReloH8WmI1qQXf2+A+m1tiTyFxObbACF0hUjFZqN9Kg31RYXT6B0L5JvenPOTZNH1Mygd7ICGbJO/uyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940341; c=relaxed/simple;
	bh=SEHWHx/78gi4uc2v9DjORz7UcTGbXa0aZ5owPsB7y04=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=fdEoPQ5LJoPWraBJ5R/4+Sjl+ZK6vnPeCASNK+r07jy0Uq2X3FNJf81wny2V9w/Z1WKRofCgxmc4WpwpvuQfPIF6GIQ6/zESlLDMsNx2epN6a7UoZj9Nlc1pRHSiCl0usb45QofvMI7ORS5ALZkSNjotWDY6lXKraMjb6Ri1tAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pT/a3oqC; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pT/a3oqC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ADCCB1A1A73;
	Wed,  9 Sep 2026 07:52:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7BD1060448;
	Wed,  9 Sep 2026 07:52:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 603A011C7AF4F;
	Wed,  9 Sep 2026 09:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788940336; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JAvW8vyFsOHN+djQaHC9viq07f5HEJTSFyQy/FJZP+8=;
	b=pT/a3oqCMaEh+7KfHHiVbinaY1Rk29A+MNmHdwy2pqPEIffvpg02DAa03svSjfNC58rRf7
	ZEfEbKh7HH0j/0AaC8UhaRq3QKAgqRTytK/V7LdyB9uIW8uUqFJisaaO1zWGwIujfaUlDf
	P1sp+QhXS57hjTR9eWOs19rP4cJWDOBq0wucHNMAP01AhXTN1mATAXoGfDzClOxzz/fZRy
	k/7sKMJL3BKVx4De2IjbhKTP4EftHY9LNBM+SjG93kCFzvEbnIReDYmgNCfbvUjp/xsVR8
	w7bvg8zstsxSxGMQd1EXNmtIKSIuwJIE90oFU0gsemmxMRKFJ7nXNIy7AV/sbA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 09:52:05 +0200
Message-Id: <DLAMF47GKNSA.1PJ5V8Z86U1C6@bootlin.com>
To: "Jani Nikula" <jani.nikula@linux.intel.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Linus Walleij" <linusw@kernel.org>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RFC v2 05/19] drm/panel: embed a drm_bridge into every
 drm_panel
Cc: "Albert Esteve" <aesteve@redhat.com>, "Anusha Srivatsa"
 <asrivats@redhat.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>,
 "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>
X-Mailer: aerc 0.22.0
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
 <20260903-drm-bridge-every-panel-v2-5-2ab8ee24538e@bootlin.com>
 <678ddef7e56703d9adffff5c490d4857af515343@intel.com>
In-Reply-To: <678ddef7e56703d9adffff5c490d4857af515343@intel.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Jani,

On Tue Sep 8, 2026 at 6:18 PM CEST, Jani Nikula wrote:
> On Thu, 03 Sep 2026, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>> Adding a drm_panel does currently not add a panel_bridge wrapping
>> it. Usually the panel_bridge creation happens later, when some other dri=
ver
>> (e.g. the previous bridge or the encoder) calls *_of_get_bridge() and th=
e
>> following element in the pipeline is a panel.
>>
>> This has some drawbacks:
>>
>>  * the bridge API is currently the best practice to access various
>>    components of the pipeline, especially with complex cards where bridg=
es
>>    can be combined in different ways on different hardware
>>  * the panel_bridge is not created in the context of the driver of the
>>    underlying physical device (the panel driver), but of some other driv=
er
>>  * that other driver is not aware of whether the returned drm_bridge
>>    pointer is a panel_bridge created on the fly, a pre-existing
>>    panel_bridge or a non-panel bridge
>>  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
>>    but that other driver doesn't know whether this is needed because it
>>    doesn't know whether it has created a panel_bridge or not
>>
>> Other drivers call [a variant of] drm_panel_bridge_add(), which also has
>> some of the above drawbacks.
>>
>> So far the current approach was working mostly because devm and drmm ens=
ure
>> the panel bridge would be dealloacted at some later point. However with =
the
>> upcoming implementation of bridge hotplug and dynamic bridge lifetime th=
is
>> will get more complicated.
>>
>> Switch to the new approach: embed a drm_bridge inside every drm_panel,
>> which behaves just like the current drm_panel_bridge.
>
> What does this mean for drivers like i915 that use drm_panel *only* for
> handling panel followers? We don't need the bridge for anything. It'll
> just be excess midlayer baggage.

i915 does not call drm_bridge_attach() nor drm_bridge_add(), right? So the
newly embedded bridge would not even be observable, it would not even be in
the global bridge_list. The only effect would be some extra allocated
memory.

> I'm also concerned about the embedded struct drm_connector being added,
> since that can't and will not be a drm_connector that we'll use.

The drm_connector is added only if drm_bridge_attach() is called (with the
DRM_BRIDGE_ATTACH_NO_CONNECTOR flag not set). As above, i915 does not call
drm_bridge_attach() at all, so no drm_connector is added.

> All of
> our drm_connector are embedded in intel_connector, and all of our
> codebase expects this, and we init them ourselves. Having additional
> drm_connector (not embedded in intel_connector) added by library code
> *will* oops in our driver.

It would be great if you could test this series (even without reviewing if
you can't). Based on my analysis above there should be no regression, and
having that confirmed runtime would be helpful.

And if you can review, this is the one patch that matters. The following
only affect bridge-based drivers. The previous ones are about moving code
around across modules and will be different in v4.

> I haven't had the time for an in-depth look, but it feels like this
> assumes a certain driver model, instead of providing building blocks for
> drivers to use.

For drivers not using drm_bridge, this patch should be just implementation
details changes and some more allocated memory.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
