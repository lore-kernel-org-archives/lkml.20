Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EF64AD4DE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369939; cv=none; b=iwt2Q3tTMQxv1np13zD2UajRObuVhbgO0Lvvdqzf/yXZF3+IHhRE4z3mp5ewnT/DTAAG37gWMDur8DOU1DKVY3/KDblYFlz7e07I87TQNNLJsiK9lROBQxoCoKnftWSqqEOwhWKBIABe7M92TeYVnbs+Tae/IcChPgiCW/widWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369939; c=relaxed/simple;
	bh=kmYS7n2kd1BHeq5YtPz9Ux4I25m7jUUkamh1FyK6Ayw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A8rd95f0js89Bc1Zv5I0vFLN29vRbwgsUAg5CjIQV+if6JLj80geLV0igQ4hjbfjp8xisnWZE6l+4ZEV/0PeqbcyUoAxAT5BLyleasuafbkR0syqaCLeKBkb+zlaOmPE5HwbCzH2aLHE/wTuJ8S1yO7VRS4h04m/ZeadY2F4F+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZKwxDh1t; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZKwxDh1t"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 29B4F1A1964;
	Wed,  2 Sep 2026 17:25:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E83216053C;
	Wed,  2 Sep 2026 17:25:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5986D11C795A7;
	Wed,  2 Sep 2026 19:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788369928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oBhMzKNJR7pSzKCFhkUKKnjSwPMdvq8s2DMZy0BfhKw=;
	b=ZKwxDh1tlAGGc3i6jU3XLjy8YKPw+N0F8FsPjVPri1xYMBIC23hY6+ePrHWF5YPWYUBw4V
	aoVFM4dMJT+27x3XToceR3ddqguAkPI/iLXsVsw04Lvdytg/n1aM9l3g2VvjKYTlgn3gAB
	cOOcekXCkRgQHE7fh6uXLMjbyLKxcTGfOGz0muDU/BWyJnhgAiyYwJ0CCI0p1RkpDN0bF2
	FOJPb/fEogIglEmUX1ui3d2MglUQAR+NrqKHGgbVbZkha83jfF7rfga3ZVLr0Szh0cjMWj
	Y1g8zDDkZY7Qy51nvFcRggd/vq2SJAXJPIp4ygAJrxeO8ZVXw4AC49QzCRu7Cw==
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
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, Andy Yan <andyshrk@163.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Christopher Vollo <chris@renewoutreach.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 John Ripple <john.ripple@keysight.com>, Michael Walle <mwalle@kernel.org>, 
 Sudarshan Shetty <tessolveupstream@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Herve Codina <herve.codina@bootlin.com>, Esben Haabendal <esben@geanix.com>, 
 Sean Paul <seanpaul@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Pin-yen Lin <treapking@chromium.org>, Tony Lindgren <tony@atomide.com>, 
 Vinay Simha BN <simhavcs@gmail.com>, Maoyi Xie <maoyixie.tju@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 sashiko-bot@kernel.org, Enric Balletbo i Serra <eballetbo@kernel.org>
In-Reply-To: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
References: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
Subject: Re: (subset) [PATCH v3 00/13] drm/bridge: Kconfig: cleanup
 DRM_PANEL usage
Message-Id: <178836991411.1099612.11697667496444228623.b4-ty@b4>
Date: Wed, 02 Sep 2026 19:25:14 +0200
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


On Mon, 31 Aug 2026 18:13:26 +0200, Luca Ceresoli wrote:
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

[01/13] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: don't select unused DRM_PANEL
        commit: b1db84ecf75caca198a464c73f1c4afc88ca10a7
[04/13] drm/bridge: ti-sn65dsi86: don't select unused DRM_PANEL, select DRM_PANEL_BRIDGE
        commit: a5c061a3c34c3e2928754f42bce59622b9989871
[05/13] drm/bridge: ti-sn65dsi83: select DRM_PANEL_BRIDGE
        commit: 8175ab0c5f13fa862eb7dee25f5a329332b8f437
[08/13] drm/bridge: parade-ps8640: select DRM_PANEL_BRIDGE, not DRM_PANEL
        commit: 59113db28546ac8245155960b087502d226fc78a

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


