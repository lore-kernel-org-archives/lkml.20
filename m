Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5933026B742
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575368; cv=none; b=fs9GdTHNI8+xNPCBIeXoN67b2ktLttf6jQnqsa0j6KLIh89M2f+45E+QWTWgr1CvdNnUtXEx043rWMWSjYoljYyCqF6uYEp2RH9UiFvWpkU2u7xW2X7I68rBfTqShYru/M5ZaxzUnn90DHbWidBDZGRoI5ZRrdLyzGafwh0W02w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575368; c=relaxed/simple;
	bh=8A7vwyWBA8EzHg3IVQ1FSMv2DIuYOA3CBBSzdUR58Jc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JTyAosZHuLH4VIB2g919Fqwkquhy7E6lNQ4rjYaydReRQ0kmtzPHsfKpZ1tI1JNIMEq4AI0bNMee3MypVXxHOpEgbZSYvPrpNw3VuWZMOEzEVb0LEX1voIjSfpHrv2K3lOHA0MeXYsWLXPhoIS+ycZB8PGlRQdIOiJ4lCUrp8Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DwnDxrhJ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DwnDxrhJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 513D94E4103F;
	Mon, 28 Sep 2026 06:02:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EE59601BD;
	Mon, 28 Sep 2026 06:02:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 353C3102F1E25;
	Mon, 28 Sep 2026 08:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790575360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xF0u3rKr9M74KSQg7RCN0+aCxKJVpc+VR+Lv57tnGPo=;
	b=DwnDxrhJiBekhijz8hvJwq2H5uJBe+71MSerGIeHFlNj1FyvCJM3zsKuJZtAS4uLHpS8zU
	NaH9eDdxyMGrKJH7HZXeO7DuvstXSJREBq8UGNp5VtQ3ncJNZ5npcvSMRrgBWzyo2LhSnc
	Pd6w6b8d/lykJZWInmOsxR6v8qtSqJGOKXc5hPkRDnj+56EK7ICiRX1MfHxf8TMsLMRe81
	7eBh5sOd0VMg4cjFp5yYFa1iYXMLN8oovltBRUi/6jjU1Vow2R9QJwSJpXNUQKLD/gUWP8
	ZkjNGHhoj2Pk/5ieIlarpZzksdICG53fDIC+obBNiq1TN/79cGTkyv2vyPPi0w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Christopher Vollo <chris@renewoutreach.org>, 
 Sean Paul <seanpaul@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, 
 Tony Lindgren <tony@atomide.com>, Michael Walle <mwalle@kernel.org>, 
 Vinay Simha BN <simhavcs@gmail.com>, Maoyi Xie <maoyixie.tju@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 sashiko-bot@kernel.org
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
Subject: Re: [PATCH v4 0/9] drm/bridge: Kconfig: cleanup DRM_PANEL usage
Message-Id: <179057534751.224803.9257678806193592731.b4-ty@b4>
Date: Mon, 28 Sep 2026 08:02:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Tue, 15 Sep 2026 18:46:13 +0200, Luca Ceresoli wrote:
> As a cleanup in preparation for making every drm_panel embed a drm_bridge,
> fix missing or unnecessary usage of DRM_PANEL and DRM_PANEL_BRIDGE in
> drivers/gpu/drm/bridge/Kconfig.
> 
> == Grand plan
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> [...]

Applied, thanks!

[1/9] drm/bridge: tc358764: don't select unused DRM_PANEL
      commit: 8ea0903c62e1fd2d53f68af671635a532bd7dbac
[2/9] drm/bridge: ti-dlpc3433: don't depend on DRM_PANEL, select DRM_PANEL_BRIDGE
      commit: 184046c9f35222fa3784f960ed3780b2793d62ea
[3/9] drm/bridge: nxp-ptn3460: select DRM_PANEL_BRIDGE, not DRM_PANEL
      commit: 7dda59aea6288025fd861cd8467af456f9dc26ae
[4/9] drm/bridge: parade-ps8622: select DRM_PANEL_BRIDGE, not DRM_PANEL
      commit: f378fbe78e6e87a3657f1e6286ea3964b99f30cf
[5/9] drm/bridge: tc358775: select DRM_PANEL_BRIDGE, not DRM_PANEL
      commit: c76257183d3d20ce4986d86814676ff2377c24a8
[6/9] drm/bridge: tc358767: select DRM_PANEL_BRIDGE
      commit: 65a55bb11116c080ed8e408ef95706a9c8bb393f
[7/9] drm/bridge: tc358768: select DRM_PANEL_BRIDGE
      commit: a269221bf5c304d64d6a6aceded710f8c737113c
[8/9] drm/bridge: ssd2825: select DRM_PANEL_BRIDGE
      commit: 9e0156ff263020fd4a10d5b6bc5ee550a7837c2c
[9/9] drm/bridge: tc358764: select DRM_PANEL_BRIDGE
      commit: 6095cb1190585793055953d5ee76ff3871681c6e

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


