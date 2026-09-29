Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96CE52B1D3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688146; cv=none; b=WoKvdAhNXpnGmhRb34klXYKQm++z+oTYDGAwwPWGAZJMQyjBYwMlEIWJdi3wio4m2nvJGRVHvIrbMtA3Z/mZ/S8tY4735JAy2PKohTkUfBJgXjUNVjgqTLHW3PoKFu515u/5RuelFWaFTbFGN1rEUps1CNbK0zCd/jnubvogNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688146; c=relaxed/simple;
	bh=FHgcVzckw7J9hKLtbO0xprD/AIvMCE5AqxCP6hOVswI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=a8bNQtzW1SJ9IhXQ24ICuKhXeCO+u6U5mD/vdO3mqJoQXFgMgUcAw6Vp6tLgr9BcEnoEnSPhYhJ96r87AZZo9WKnumRUp8SLrZZ7auW+m72tLi2JBe+lmyt+RrZKC8jgJJh6NfrrHCUZOjuJCTP1bz0xVADfZGz8YJEEuIqsTWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rREzCYs5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rREzCYs5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 24D251A1065;
	Tue, 29 Sep 2026 13:22:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3F04601BD;
	Tue, 29 Sep 2026 13:22:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4324103297BB;
	Tue, 29 Sep 2026 15:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790688136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FHgcVzckw7J9hKLtbO0xprD/AIvMCE5AqxCP6hOVswI=;
	b=rREzCYs57TauLcCmyy1DL91h0dU96/3qi9aWRsbrKpBJlyYKn6+1p4Z1Iq1IzIeXXLaXTa
	kkq1+U5xL+3X0/gtmGoyBH4m0XubttAXozmLBSL+g25FBjPSnoKpZB3TrzUOClghvgRGVi
	w8kR6pqXnhXOG9/9zVP63yGDrFQq7PddFN3sovGRXnWKbiOHRb+l1kWChR17B0l039IF8A
	JClQQixWJXQHu0hfr4dEsBEiQeHohjDiBjWnjNeh6BVE4ggU9ypyfSYmUgQUa6GIKdEb2m
	p6Sf7W5UZ41wK7GFTTlY6rTaRLw3QYtRRD7DU9JLVi2OFD+Xb0p2Nbt4SMIefg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 15:22:08 +0200
Message-Id: <DLRTYPGLOGLJ.1RWIVEF7K6OCB@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 0/7] drm: remove deprecated *_of_get_bridge() from
 non-OF drivers (fixes build regression)
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Doug Anderson"
 <dianders@chromium.org>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>
X-Mailer: aerc 0.22.0
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com> <c1b065c8bd926708500b7c42864279e055ed95d0.camel@iscas.ac.cn>
In-Reply-To: <c1b065c8bd926708500b7c42864279e055ed95d0.camel@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3

Hello Icenowy,

On Tue Sep 29, 2026 at 12:46 PM CEST, Icenowy Zheng wrote:
> =E5=9C=A8 2026-09-29=E4=BA=8C=E7=9A=84 12:36 +0200=EF=BC=8CLuca Ceresoli=
=E5=86=99=E9=81=93=EF=BC=9A
>> After commit Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code
>> to
>> drm_panel.c") some drivers fail building:
>>
>> =C2=A0 error: implicit declaration of function 'devm_drm_of_get_bridge'
>>
>> This is because devm_drm_of_get_bridge() (and drmm_of_get_bridge())
>> have
>> been moved to drm-panel.h.
>>
>> The affected drivers are those which:
>>
>> =C2=A0* can be built without CONFIG_OF, and
>> =C2=A0* don't include drm_panel.h
>>
>> The affected drivers are 3, fix them (patches 1-3) by replacing the
>> deprecated *_of_get_bridge() calls with
>> of_drm_get_bridge_by_endpoint().
>
> The comment of drm_of_find_panel_or_bridge() still suggests
> devm_of_get_bridge(), and the documentation at the head of drm_bridge.c
> also mentions it.

Ah, thanks for noticing. I'm taking a note to fix this later.

> BTW should drm_of_get_bridge_by_endpoint() has some drmm/devm variant?

Maybe, but not sure, as we introduce hotplug devm/drmm becomes pretty
useless and even annoying. However I haven't checked all the cases, so we
might reconsider this idea as we start converting more drivers though.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
