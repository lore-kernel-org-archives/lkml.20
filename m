Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321D951E452;
	Tue, 29 Sep 2026 12:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685243; cv=none; b=Whn9uuW6/TymyaIOwTRBYpG6yRyRUYeE7Pxcw6NQlCM1ov999x68G+uaHB9MwW+SzFdq/dA4KE7PhULE/6qykcFo3Z3gNi2fQ7Bgmi7bACxGZLDb96Jv3d0eWzybzXiZM8MIqGGEilEGRIhtKxo2dTUCgATZkAnwoX4TNzY+bpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685243; c=relaxed/simple;
	bh=YAMMelAZHfbe1qeiK8FghiyzqtsFG4ElypA+ShW5Sj8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=LVbG2KnMoGAJdAEnMnY/aRwO3WnfLa1PMP4BVSushFWf9HRfPygnwqJqvQkm1sY5PNNmgthL0KUHwVk1UiB9MPLkWL89oNjqHJ8IXH+koHiKAcA/71r163Yu03ULNKJ/ZFdEzECqAKmLusT/PScidXzPrgSjbE1YEM+E4fsgzq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/VyHBIR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/VyHBIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B731F000FF;
	Tue, 29 Sep 2026 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685242;
	bh=YAMMelAZHfbe1qeiK8FghiyzqtsFG4ElypA+ShW5Sj8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Z/VyHBIRhz7Mv7hefrMMY4o+uIBMEbRLquJgLc+kfIUwiLtTkD6GutbszRe2gGYEx
	 VuFfSoEYDwVtyQ8CDx3Qule+Wh9HJNvAgG3QUUTfOOQB1gHVWVjPu5+ddsen45CoyN
	 Zm/LaTUv5e5nvpU6Xvc7P191wgnSfz2zSJmPN/2E1raV/xii8U8uKmJ+Fuhm6QvzJU
	 tacwlNnRIDuqy9WZ5+YGPTEBM0MRuQPoIcbrbKkgn625EK655xQhdI4CHZzdK5JZli
	 QcMSv2r6Y7IOpDhmBhupWQT/TKm6QuxhHlKxA8YMrB6Z5GMGdsyOw9FwplWhPXt8R2
	 HpGG/3HVdA4Rg==
Message-ID: <33164c650a0cbf3d9d97c42c399b07f0@kernel.org>
Date: Tue, 29 Sep 2026 12:33:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 3/7] drm/bridge: dw-mipi-dsi: stop using deprecated
 devm_drm_of_get_bridge()
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-3-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-3-ccb7e602daad@bootlin.com>
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

On Tue, 29 Sep 2026 12:36:35 +0200, Luca Ceresoli wrote:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>=20
> Fixes build failure when CONFIG_OF is disabled.
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
