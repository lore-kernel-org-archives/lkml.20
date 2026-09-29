Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470BB522F05;
	Tue, 29 Sep 2026 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685253; cv=none; b=o1cReWx4Tstrt9ai/+WdRtqJb453fYIlbFO8rDus8aiiqTCQVKRCn7bzi7A9WhKI5TjrBlvBRT44A0SqV2V1v1XA4O06KK6RLhO9e56R8NjIdrnpEpFouzmQCl6mppLHZN3TRMDygQsiilfH66Xa2bs6sqhntfideuaBPz0Otmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685253; c=relaxed/simple;
	bh=RHKK5Ycj/8UQNEsWLqQJ5mV0vqPYZnXEZvEe/oRO0VI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=mUFEVrfEfsWEI0tdhmzHzWLIY3CqVyyP+Dmtev9gaq5Krf5Ulzgz+TPSehxJPNsAp6SI3RhZO93jFGqU108y1y+JEpkgl/aSl+VEcDc0FaLpAVq/e0wLxlOkt3nPXQT81yrSsLL5pZMkRc1ib9Kxx++2/bp1byvj4dO/mkUqaoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mR38mcbC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mR38mcbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9491F000FF;
	Tue, 29 Sep 2026 12:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685252;
	bh=RHKK5Ycj/8UQNEsWLqQJ5mV0vqPYZnXEZvEe/oRO0VI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=mR38mcbCKtZyUuZHnZp25p6VHWWx1vLscQRt3C59JIVCsQqQRMA/erOUCxKKv0y+p
	 KKcNfo7arO3kD2m3Mg/fHlxcUW2a9uIq8i/CVqH6ewOVWM4gKX9dd8rpJeW4tZZpLW
	 IueOqGnAZqAkTY5199UtQknScNLTuPr0CpGeULlesKreWrpm5JlFX3q1Pvhc2ubkBD
	 jYHwyvFyW4NnKErk2qF+M7sr+gmXBLYD+ZSdZNRiAZgdapTSP7c6EIwNOIoqcN0oaP
	 rLsqvHcZ9PNYQZHvaglwQ4oWDqDqY5trAI6JVWVnEEHVVu1IQRgB24Vl0GXnC1eThW
	 1EvwCJFFM0C7w==
Message-ID: <98051aee185d6d7105f0be2c8d712ffe@kernel.org>
Date: Tue, 29 Sep 2026 12:34:09 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 4/7] drm/bridge: dw-mipi-dsi2: stop using deprecated
 devm_drm_of_get_bridge()
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-4-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-4-ccb7e602daad@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Arnd Bergmann" <arnd@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Doug
 Anderson" <dianders@chromium.org>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Icenowy
 Zheng" <zhengxingda@iscas.ac.cn>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Tue, 29 Sep 2026 12:36:36 +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
